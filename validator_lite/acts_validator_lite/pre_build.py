#!/usr/bin/env python3
import os
import subprocess
import sys


def find_source_root():
    cur = os.path.dirname(os.path.abspath(__file__))
    for _ in range(10):
        if os.path.isfile(os.path.join(cur, "build.sh")) and \
                os.path.isdir(os.path.join(cur, "developtools", "ace_js2bundle", "ace-loader")):
            return cur
        cur = os.path.dirname(cur)
    return None


def _find_node_bin(prebuilts_dir, entries):
    for entry in entries:
        node_bin = os.path.join(prebuilts_dir, entry, "bin", "node")
        if os.path.isfile(node_bin):
            return os.path.join(prebuilts_dir, entry, "bin")
    return None


def find_nodejs():
    cur = os.path.dirname(os.path.abspath(__file__))
    for _ in range(10):
        prebuilts = os.path.join(cur, "prebuilts", "build-tools", "common", "nodejs")
        if os.path.isdir(prebuilts):
            current_bin = os.path.join(prebuilts, "current", "bin", "node")
            if os.path.isfile(current_bin):
                return os.path.join(prebuilts, "current", "bin")
            entries = sorted(os.listdir(prebuilts), reverse=True)
            result = _find_node_bin(prebuilts, entries)
            if result:
                return result
        cur = os.path.dirname(cur)
    return None


def _npm_env():
    env = os.environ.copy()
    nodejs_bin = find_nodejs()
    if nodejs_bin:
        env["PATH"] = nodejs_bin + os.pathsep + env.get("PATH", "")
    return env


def build_ace_loader(source_root):
    ace_loader_dir = os.path.join(
        source_root, "developtools", "ace_js2bundle", "ace-loader"
    )
    lib_lite_dir = os.path.join(ace_loader_dir, "lib", "lite")
    if os.path.isdir(lib_lite_dir):
        print("[pre_build] ace-loader lib already exists, skipping npm build.")
        return

    env = _npm_env()

    if not os.path.isdir(os.path.join(ace_loader_dir, "node_modules")):
        print("[pre_build] installing ace-loader dependencies (npm install) ...")
        install = subprocess.run(
            ["npm", "install", "--no-fund", "--no-audit"],
            cwd=ace_loader_dir,
            env=env,
        )
        if install.returncode != 0:
            print("[pre_build] ERROR: npm install failed for ace-loader")
            sys.exit(1)

    print("[pre_build] building ace-loader (npm run build) ...")
    result = subprocess.run(
        ["npm", "run", "build"],
        cwd=ace_loader_dir,
        env=env,
    )
    if result.returncode != 0:
        print("[pre_build] ERROR: ace-loader npm run build failed")
        sys.exit(1)
    if not os.path.isdir(lib_lite_dir):
        print("[pre_build] ERROR: ace-loader lib/lite not produced after build")
        sys.exit(1)
    print("[pre_build] ace-loader npm build completed.")


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
