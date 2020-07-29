#!/usr/bin/env python3

import sys
import time
import random


def main():
    sys.stdout.write("$ ")
    sys.stdout.flush()
    time.sleep(1)
    text = " ".join(sys.argv[1:]) + "\n"
    for character in text:
        time.sleep(0.5 * random.random())
        sys.stdout.write(character)
        sys.stdout.flush()


if __name__ == "__main__":
    main()
