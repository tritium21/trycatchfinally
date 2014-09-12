#!/usr/bin/env python2
from collections import namedtuple
from subprocess import check_output, check_call, CalledProcessError, STDOUT
from os import unlink
from ConfigParser import SafeConfigParser
from sys import argv, exit
from argparse import ArgumentParser

Job = namedtuple('Job', 'name version source build run cleanup')


def _sec(instr):
    return '\033[33m' + instr + '\033[0m'


def _sub(instr):
    return '\033[31m' + instr + '\033[0m'


def version(job):
    try:
        versions = [
            check_output(v, shell=True, stderr=STDOUT) for v in job.version
        ]
    except:
        raise
    else:
        print _sub('Version')
        print '\n'.join(versions)


def source(job):
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
    if job.build != ['']:
        print _sub('Building')
        for step in job.build:
            print _sub('Build: ') + step
            check_call(step, shell=True)


def run(job):
    try:
        out = []
        print _sub('Running')
        for step in job.run:
            print _sub('Run: ') + step
            out.append(check_output(step, shell=True))
    except:
        raise
    else:
        print _sub('Standard Out')
        print '\n'.join(out)


def cleanup(job):
    if job.cleanup != ['']:
        print _sub('Cleanup')
        for f in job.cleanup:
            try:
                unlink(f)
            except OSError:
                pass
            else:
                print _sub('rm: ') + f
    print "\n"


def execute(jobs, show_source=True):
    for job in jobs:
        print _sec('Language: ' + job.name)
        try:
            version(job)
            if show_source:
                source(job)
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
        Job(**d) for d in
        [dict([('name', l)] + [(k, v.split('\n')) for k, v in config.items(l)])
         for l in langs]
    ]
    return jobs


def main(argv):
    parser = ArgumentParser()
    parser.add_argument(
        '-s', '--nosource',
        help="Hide the source from output",
        action='store_false',
    )
    parser.add_argument(
        '-c', '--config',
        help="Set job config file.  (default: run.conf)",
        default='run.conf'
    )
    args = parser.parse_args(argv)
    jobs = get_jobs(args.config)
    return execute(jobs, show_source=args.nosource)


if __name__ == '__main__':
    exit(main(argv[1:]))
