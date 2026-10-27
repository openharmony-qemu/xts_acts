#!/usr/bin/env python3
# Copyright (c) 2026 Huawei Device Co., Ltd.
# SPDX-License-Identifier: Apache-2.0
"""
从 Hypium / OH 全量测试日志中筛出失败相关片段，写入同级 error.txt。

OpenHarmony 报告里常见：
  OHOS_REPORT_STATUS_CODE: 1  — 用例开始
  OHOS_REPORT_STATUS_CODE: 0  — 通过结束
  OHOS_REPORT_STATUS_CODE: -1 — 运行期错误等
  OHOS_REPORT_STATUS_CODE: -2 — 断言失败等

本脚本按「空行分隔的段落」切分日志，仅保留段落内出现
  OHOS_REPORT_STATUS_CODE: -1 或 : -2
的整块（含同段内的 stack / stream 等非 OHOS_ 前缀行），
过滤结果**覆盖写入**与本脚本同目录的 ``error.txt``（不修改输入日志）。
输入日志支持 UTF-8 / UTF-16（含 BOM）自动检测；输出统一为 UTF-8。
``--stdout`` 时仅打印到 stdout，不写 error.txt。

用法示例：

  python3 filter_ohos_test_log_failures.py
  python3 filter_ohos_test_log_failures.py --stdout
"""

from __future__ import annotations

import argparse
import os
import re
import sys
import tempfile
from pathlib import Path

_DEFAULT_INPUT = "entry/build/default/outputs/default/full_test_log.txt"
_DEFAULT_OUTPUT = "error.txt"

# 段落分隔：一个或多个「仅空白」的行
_PARAGRAPH_SPLIT = re.compile(r"\n(?:[ \t]*\n)+", re.MULTILINE)
# 段落内所有状态码行（整行匹配，避免误伤正文）
_STATUS_CODE_LINE = re.compile(
    r"^OHOS_REPORT_STATUS_CODE:\s*(-?\d+)\s*$", re.MULTILINE
)


def _repo_root() -> Path:
    start = Path(__file__).resolve().parent
    for candidate in (start, *start.parents):
        if (candidate / "oh-package.json5").is_file():
            return candidate
    return start


def _resolve_path(p: str, root: Path) -> Path:
    path = Path(p)
    if path.is_absolute():
        return path
    return (root / path).resolve()


def paragraph_status_codes(paragraph: str) -> list[int]:
    return [int(m.group(1)) for m in _STATUS_CODE_LINE.finditer(paragraph)]


def keep_paragraph(paragraph: str) -> bool:
    codes = paragraph_status_codes(paragraph)
    return any(c in (-1, -2) for c in codes)


def filter_log(text: str) -> str:
    body = text.replace("\r\n", "\n")
    parts: list[str] = []
    for raw in _PARAGRAPH_SPLIT.split(body):
        block = raw.strip("\n")
        if not block.strip():
            continue
        if keep_paragraph(block):
            parts.append(block.rstrip())
    # 段与段之间保留双换行，便于阅读
    return "\n\n".join(parts) + ("\n" if parts else "")


def _write_inplace(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp_name = tempfile.mkstemp(
        dir=path.parent, prefix=f".{path.name}.", suffix=".tmp"
    )
    tmp_path = Path(tmp_name)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(text)
        os.replace(tmp_path, path)
    except Exception:
        tmp_path.unlink(missing_ok=True)
        raise


def _default_output_path() -> Path:
    return Path(__file__).resolve().parent / _DEFAULT_OUTPUT


def _detect_log_encoding(raw: bytes) -> str:
    """根据 BOM 或字节特征识别 UTF-8 / UTF-16 日志。"""
    if raw.startswith(b"\xff\xfe"):
        return "utf-16-le"
    if raw.startswith(b"\xfe\xff"):
        return "utf-16-be"
    if raw.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"

    sample = raw[:4096]
    if len(sample) >= 4:
        even_nulls = sum(1 for i in range(0, len(sample) - 1, 2) if sample[i + 1] == 0)
        odd_nulls = sum(1 for i in range(1, len(sample) - 1, 2) if sample[i] == 0)
        if even_nulls > len(sample) // 4 and even_nulls > odd_nulls:
            return "utf-16-le"
        if odd_nulls > len(sample) // 4 and odd_nulls > even_nulls:
            return "utf-16-be"
    return "utf-8"


def _read_log_text(path: Path) -> tuple[str, str]:
    raw = path.read_bytes()
    encoding = _detect_log_encoding(raw)
    return raw.decode(encoding, errors="replace"), encoding


def main() -> int:
    root = _repo_root()
    ap = argparse.ArgumentParser(
        description=(
            "Keep OHOS log paragraphs with STATUS_CODE -1/-2; "
            "write filtered result to error.txt beside this script."
        )
    )
    ap.add_argument(
        "--input",
        "-i",
        default=_DEFAULT_INPUT,
        help="日志路径（相对仓库根或绝对路径）",
    )
    ap.add_argument(
        "--output",
        "-o",
        default=None,
        help=f"输出路径（默认与本脚本同级的 {_DEFAULT_OUTPUT}）",
    )
    ap.add_argument(
        "--stdout",
        action="store_true",
        help="仅输出到 stdout，不写 error.txt",
    )
    args = ap.parse_args()

    in_path = _resolve_path(args.input, root)
    if not in_path.is_file():
        print(f"error: input not found: {in_path}", file=sys.stderr)
        return 1

    in_text, in_encoding = _read_log_text(in_path)
    out_text = filter_log(in_text)

    if args.stdout:
        sys.stdout.write(out_text)
        return 0

    out_path = (
        _resolve_path(args.output, root) if args.output else _default_output_path()
    )
    _write_inplace(out_path, out_text)
    kept = out_text.count("OHOS_REPORT_STATUS_CODE:")
    print(
        f"Wrote {out_path} ({len(out_text.encode('utf-8'))} bytes, "
        f"{kept} STATUS_CODE lines) from {in_path} (read as {in_encoding})",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
