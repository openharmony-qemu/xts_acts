#!/usr/bin/env python3
import os
import subprocess
import sys


def find_source_root():
    cur = os.path.dirname(os.path.abspath(__file__))
    for _ in range(10):
        if os.path.isfile(os.path.join(cur, "build.sh")) and \
                os.path.isdir(os.path.join(cur, "developtools")):
            return cur
        cur = os.path.dirname(cur)
    return None


def build_ace_loader(source_root):
    ace_loader_dir = os.path.join(
        source_root, "developtools", "ace_js2bundle", "ace-loader"
    )
    lib_lite_dir = os.path.join(ace_loader_dir, "lib", "lite")
    if os.path.isdir(lib_lite_dir):
        print("[pre_build] ace-loader lib already exists, skipping npm build.")
        return
    result = subprocess.run(
        ["npm", "run", "build"],
        cwd=ace_loader_dir,
        capture_output=True, text=True
    )
    if result.returncode == 0:
        print("[pre_build] ace-loader npm build completed.")
    else:
        print("[pre_build] ace-loader npm build failed:" + result.stderr)


def main():
    stamp_file = sys.argv[1] if len(sys.argv) > 1 else None
    source_root = find_source_root()
    if not source_root:
        print("[pre_build] ERROR: could not find source root")
        sys.exit(1)
    build_ace_loader(source_root)
    if stamp_file:
        with open(stamp_file, "w") as f:
            f.write("done")


if __name__ == "__main__":
    main()
