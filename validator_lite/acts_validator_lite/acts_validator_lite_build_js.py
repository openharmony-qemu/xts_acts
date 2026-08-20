#!/usr/bin/env python3
"""Build talm JS bundle via ace-loader webpack.

Usage: talm_build_js.py <source_root> <output_dir>
"""
import os
import shutil
import subprocess
import sys
import tempfile

_SKIP_FILENAMES = {"image_convert_result.txt"}


def _find_source_root():
    if os.environ.get("OHOS_BUILD_HOME"):
        return os.environ["OHOS_BUILD_HOME"]
    cur = os.path.dirname(os.path.abspath(__file__))
    for _ in range(10):
        if os.path.isfile(os.path.join(cur, "build.sh")) and \
                os.path.isdir(os.path.join(cur, "developtools", "ace_js2bundle", "ace-loader")):
            return cur
        cur = os.path.dirname(cur)
    raise RuntimeError("could not locate source root (no build.sh found upward)")


def _find_node_bin(prebuilts_dir, entries):
    for entry in entries:
        node_bin = os.path.join(prebuilts_dir, entry, "bin", "node")
        if os.path.isfile(node_bin):
            return os.path.join(prebuilts_dir, entry, "bin")
    return None


def find_ace_loader():
    root = _find_source_root()
    return os.path.join(root, "developtools", "ace_js2bundle", "ace-loader")


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


def _run_webpack(ace_loader, src_root, tmp_build, nodejs_bin):
    env = os.environ.copy()
    env["img2bin"] = "false"
    env["hapMode"] = "true"
    if nodejs_bin:
        env["PATH"] = nodejs_bin + os.pathsep + env.get("PATH", "")
    subprocess.run(
        [
            "./node_modules/.bin/webpack",
            "--config", "./webpack.lite.config.js",
            "--env", f"aceModuleRoot={src_root}",
            "--env", f"aceModuleBuild={tmp_build}",
            "--env", "sourceMap=none",
        ],
        cwd=ace_loader,
        check=True,
        env=env,
    )


def _copy_build_output(tmp_build, out_dir):
    os.makedirs(out_dir, exist_ok=True)
    for root, _, files in os.walk(tmp_build):
        rel = os.path.relpath(root, tmp_build)
        for name in files:
            if name.endswith(".map") or name in _SKIP_FILENAMES:
                continue
            src = os.path.join(root, name)
            dst_dir = os.path.join(out_dir, rel) if rel != "." else out_dir
            os.makedirs(dst_dir, exist_ok=True)
            shutil.copy2(src, os.path.join(dst_dir, name))


def main():
    if len(sys.argv) != 3:
        print("Usage: talm_build_js.py <source_root> <output_dir>", file=sys.stderr)
        return 1

    src_root = os.path.abspath(sys.argv[1])
    out_dir = os.path.abspath(sys.argv[2])
    ace_loader = find_ace_loader()

    if not os.path.isdir(src_root):
        print(f"source root not found: {src_root}", file=sys.stderr)
        return 1

    tmp_build = tempfile.mkdtemp(prefix="talm_webpack_")
    try:
        nodejs_bin = find_nodejs()
        _run_webpack(ace_loader, src_root, tmp_build, nodejs_bin)
        _copy_build_output(tmp_build, out_dir)
    finally:
        shutil.rmtree(tmp_build, ignore_errors=True)

    return 0


if __name__ == "__main__":
    sys.exit(main())
