#!/usr/bin/env python

from setuptools import setup

if __name__ == '__main__':
    setup(
        name='poweroffd',
        version='1.0',
        description='Daemon to poweroff the Pi in response to a button push',
        author='Ricard Illa',
        author_email='r.illa.pujagut@gmail.com',
        url='https://github.com/gthar/poweroffd',
        py_modules=['poweroffd'],
        entry_points={
            'console_scripts': ["poweroffd=poweroffd:main"]},
        install_requires=['docopt', 'gpiozero'])
