#!/usr/bin/env python3
import argparse
import os
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--remove", required=True, help="File to remove")
    parser.add_argument("--stamp", required=True, help="Stamp file to create")
    args = parser.parse_args()

    if os.path.isfile(args.remove):
        os.remove(args.remove)

    os.makedirs(os.path.dirname(args.stamp), exist_ok=True)
    with open(args.stamp, "w") as f:
        f.write("done\n")

    return 0


if __name__ == "__main__":
    sys.exit(main())
