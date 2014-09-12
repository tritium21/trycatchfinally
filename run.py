#!/usr/bin/env python2
from collections import namedtuple
from subprocess import check_output, check_call, CalledProcessError, STDOUT
from os import unlink
from ConfigParser import SafeConfigParser
from sys import argv, exit

Job = namedtuple('Job', 'name versions source build run cleanup')


def _sec(instr):
    return '\033[33m' + instr + '\033[0m'


def _sub(instr):
    return '\033[31m' + instr + '\033[0m'


def print_ver(job):
    try:
        versions = [
            check_output(v, shell=True, stderr=STDOUT) for v in job.versions
        ]
    except:
        raise
    else:
        print _sub('Version')
        print '\n'.join(versions)


def print_source(job):
    sources = []
    for sf in job.source:
        try:
            with open(sf) as f:
                sources.append((sf, f.read()))
        except OSError:
            pass
    if sources:
        print _sub('Source Code')
        for name, text in sources:
            print _sub(name)
            print text


def build(job):
    for step in job.build:
        check_call(step, shell=True)


def run(job):
    try:
        out = [check_output(step, shell=True) for step in job.run]
    except:
        raise
    else:
        print _sub('Standard Out')
        print '\n'.join(out)


def cleanup(job):
    for f in job.cleanup:
        try:
            unlink(f)
        except OSError:
            pass


def execute(jobs, show_source=True):
    for job in jobs:
        print _sec('Language: ' + job.name)
        try:
            print_ver(job)
            if show_source:
                print_source(job)
            build(job)
            run(job)
        except CalledProcessError as e:
            return e
        finally:
            cleanup(job)


def get_jobs(conf='run.conf'):
    config = SafeConfigParser()
    config.read(conf)
    langs = config.sections()
    jobs = [
        Job._make([l] + [v.split('\n') for k, v in config.items(l)])
        for l in langs
    ]
    return jobs


def main(argv):
    jobs = get_jobs()
    return execute(jobs)


if __name__ == '__main__':
    exit(main(argv))
