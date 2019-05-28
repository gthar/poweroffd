#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
Daemon to poweroff the Pi from a momentary push button

Usage:
    poweroffd
    poweroffd --pin <pin>
    poweroffd -h | --help

Options:
    -h --help  Show this screen.
    --pin <pin>  GPIO Pin [default: 17]
"""

import logging
import subprocess
import sys

import docopt
import gpiozero


def when_pressed():
    """
    Log that the button has been pressed
    """
    logging.info("power off button pressed")


def when_held():
    """
    Log that the button has been held, and power off
    """
    logging.info("powering off...")
    subprocess.run(["/usr/bin/sudo", "/sbin/poweroff"])


def main():
    """
    Parse the arguments and do the thing
    """
    logging.basicConfig(level=logging.INFO)

    logging.info("pin used: %d", args['--pin'])
    button = gpiozero.Button(int(args['--pin']))
    button.when_pressed = when_pressed
    button.when_held = when_held

    while True:
        logging.info("waiting for button press...")
        button.wait_for_press()


if __name__ == "__main__":
    sys.exit(main())
