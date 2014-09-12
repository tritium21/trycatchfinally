#!/usr/bin/env python2
from collections import namedtuple
from subprocess import check_output, check_call, CalledProcessError
from os import unlink
from ConfigParser import SafeConfigParser

Job = namedtuple('Job', 'name version source build run cleanup')


def _sec(instr):
    return '\033[33m' + instr + '\033[0m'


def _sub(instr):
    return '\033[31m' + instr + '\033[0m'


def run(jobs, show_source=True):
    for job in jobs:
        print _sec('Language: ' + job.name)
        try:
            print _sub('Version')
            for ver in job.version:
                print check_output(ver, shell=True)
            if show_source:
                print _sub('Source Code')
                for sf in job.source:
                    with open(sf) as f:
                        print _sub('File: ' + sf)
                        print f.read()
            for step in job.build:
                check_call(step, shell=True)
            print _sub('Standard Out')
            for step in job.run:
                print check_output(step, shell=True)
        except CalledProcessError as e:
            print e
        finally:
            for f in job.cleanup:
                try:
                    unlink(f)
                except OSError:
                    pass


if __name__ == '__main__':
    config = SafeConfigParser()
    config.read('run.conf')
    langs = config.sections()
    jobs = [[l] + [v.split('\n') for k, v in config.items(l)] for l in langs]
    jobs = map(Job._make, jobs)
    run(jobs)
