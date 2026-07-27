#!/usr/bin/env python3
"""Patch hap_static ABC for device ABI mismatches under useNormalizedOHMUrl=true.

Two device/SDK gaps this addresses (new SDK vs older device bootabc):

1) AbilityDelegator OHMUrl (length-changing):
   LAbilityDelegator/...  -> Lapplication/AbilityDelegator/...
   LabilityDelegatorArgs/... -> Lapplication/abilityDelegatorArgs/...
   Strategy: APPEND new length-tagged strings at EOF and retarget only the
   exact string-index uint32 refs (2 per string). Does not shift the pool.

2) Error class move (same-length in-place):
   Lescompat/Error[Options] -> Lstd/core/Error[Options]
   Lescompat/%%partial-Error -> Lstd/core/%%partial-Error
   Lescompat/ETSGLOBAL -> Lstd/core/ETSGLOBAL

Then: Adler32 at offset 8 = adler32(data[12:fileSize], 1), rebuild STORED zip,
re-sign with project openharmony_sx.p7b.

Usage:
  python3 patch_abilitydelegator_ohmurl.py \\
    --in /path/to/ActsMessageHandlerStaticTest.hap \\
    --out /path/to/ActsMessageHandlerStaticTest.patched.hap
"""

from __future__ import annotations

import argparse
import io
import re
import struct
import subprocess
import sys
import zipfile
import zlib
from pathlib import Path

DEFAULT_SIGNER_DIR = Path("/home/Openharmony/zhugan/developtools/hapsigner/dist")

ABILITY_REPLACEMENTS = (
    (
        b"LAbilityDelegator/AbilityDelegator;",
        b"Lapplication/AbilityDelegator/AbilityDelegator;",
    ),
    (
        b"{ULAbilityDelegator/AbilityDelegator;Lstd/core/Null;}",
        b"{ULapplication/AbilityDelegator/AbilityDelegator;Lstd/core/Null;}",
    ),
    (
        b"LabilityDelegatorArgs/AbilityDelegatorArgs;",
        b"Lapplication/abilityDelegatorArgs/AbilityDelegatorArgs;",
    ),
)

# Same-length only — safe in-place.
ESCOMPAT_REPLACEMENTS = (
    (b"Lescompat/%%partial-Error;", b"Lstd/core/%%partial-Error;"),
    (b"Lescompat/ErrorOptions;", b"Lstd/core/ErrorOptions;"),
    (b"Lescompat/Error;", b"Lstd/core/Error;"),
    (b"Lescompat/ETSGLOBAL;", b"Lstd/core/ETSGLOBAL;"),
)


def read_uleb128(data: bytes | bytearray, pos: int) -> tuple[int, int]:
    result = 0
    shift = 0
    while pos < len(data):
        byte = data[pos]
        result |= (byte & 0x7F) << shift
        pos += 1
        if (byte & 0x80) == 0:
            break
        shift += 7
    return result, pos


def write_uleb128(value: int) -> bytes:
    out = bytearray()
    while True:
        byte = value & 0x7F
        value >>= 7
        if value != 0:
            byte |= 0x80
        out.append(byte)
        if value == 0:
            break
    return bytes(out)


def encode_string_length(str_len: int) -> bytes:
    return write_uleb128((str_len << 1) | 1)


def find_entry(data: bytes | bytearray, body: bytes) -> tuple[int, int]:
    idx = 0
    while True:
        i = data.find(body, idx)
        if i < 0:
            raise RuntimeError(f"string body not found: {body!r}")
        for back in range(1, 6):
            pp = i - back
            if pp < 0:
                continue
            val, after = read_uleb128(data, pp)
            if (
                (val & 1) == 1
                and (val >> 1) == len(body)
                and after == i
                and i + len(body) < len(data)
                and data[i + len(body)] == 0
            ):
                return pp, after
        idx = i + 1


def patch_ability_append(abc: bytearray) -> bytearray:
    """Append expanded AbilityDelegator strings; retarget exact index refs."""
    plan: list[dict] = []
    for old_body, new_body in ABILITY_REPLACEMENTS:
        # Skip if already expanded (no short body).
        if old_body not in abc and new_body in abc:
            print(f"  skip (already expanded): {old_body!r}")
            continue
        if b"application/" in old_body:
            continue
        # Prefer exact short body; if only expanded exists, skip.
        try:
            pp, _ = find_entry(abc, old_body)
        except RuntimeError:
            print(f"  skip (not found): {old_body!r}")
            continue
        refs = [
            i
            for i in range(12, len(abc) - 3, 4)
            if struct.unpack_from("<I", abc, i)[0] == pp
        ]
        if not refs:
            raise RuntimeError(f"no index refs for {old_body!r} @ {pp}")
        plan.append(
            {"old_body": old_body, "new_body": new_body, "old_prefix": pp, "refs": refs}
        )
        print(f"  AbilityDelegator {old_body!r} refs={refs}")

    if not plan:
        print("  no AbilityDelegator short forms to expand")
        return abc

    for item in plan:
        new_prefix = len(abc)
        entry = encode_string_length(len(item["new_body"])) + item["new_body"] + b"\x00"
        abc.extend(entry)
        for r in item["refs"]:
            struct.pack_into("<I", abc, r, new_prefix)
        print(f"    appended@{new_prefix} (+{len(entry)})")

        # Neutralize orphan short body so raw string counts show short=0.
        orphan_pp = item["old_prefix"]
        enc, after = read_uleb128(abc, orphan_pp)
        sl = enc >> 1
        orphan = bytearray(abc[after : after + sl])
        for token in (
            b"AbilityDelegator/AbilityDelegator",
            b"abilityDelegatorArgs/AbilityDelegatorArgs",
        ):
            pos = orphan.find(token)
            if pos >= 0:
                orphan[pos : pos + len(token)] = b"_" * len(token)
        abc[after : after + sl] = orphan

    return abc


def patch_escompat_inplace(abc: bytearray) -> int:
    n = 0
    for old, new in ESCOMPAT_REPLACEMENTS:
        if len(old) != len(new):
            raise RuntimeError(f"length mismatch {old!r} vs {new!r}")
        count = abc.count(old)
        if count:
            abc[:] = abc.replace(old, new)
            n += count
            print(f"  escompat {old!r} -> {new!r} x{count}")
    return n


def finalize_checksum(abc: bytearray) -> None:
    struct.pack_into("<I", abc, 16, len(abc))
    file_size = struct.unpack_from("<I", abc, 16)[0]
    checksum = zlib.adler32(abc[12:file_size], 1) & 0xFFFFFFFF
    struct.pack_into("<I", abc, 8, checksum)


def patch_abc(abc: bytearray) -> bytearray:
    if abc[:4] != b"PAND":
        raise RuntimeError("abc magic mismatch")
    print("[1] AbilityDelegator append-retarget")
    abc = patch_ability_append(abc)
    print("[2] escompat -> std/core same-length")
    patch_escompat_inplace(abc)
    finalize_checksum(abc)

    app = abc.count(b"Lapplication/AbilityDelegator/")
    short = abc.count(b"LAbilityDelegator/")
    esc = abc.count(b"Lescompat/")
    std_err = abc.count(b"Lstd/core/Error;")
    print(
        f"  evidence: app={app} short={short} Lescompat={esc} "
        f"Lstd/core/Error={std_err} size={len(abc)}"
    )
    if app < 1 or short != 0:
        raise RuntimeError(f"AbilityDelegator evidence failed: app={app} short={short}")
    if esc != 0:
        raise RuntimeError(f"escompat remnants remain: {esc}")
    return abc


def rebuild_hap(src_hap: Path, patched_abc: bytes) -> bytes:
    buf = io.BytesIO()
    with zipfile.ZipFile(src_hap, "r") as zin, zipfile.ZipFile(
        buf, "w", compression=zipfile.ZIP_STORED
    ) as zout:
        for info in zin.infolist():
            data = zin.read(info.filename)
            if info.filename == "ets/modules_static.abc":
                data = patched_abc
            new_info = zipfile.ZipInfo(filename=info.filename, date_time=info.date_time)
            new_info.compress_type = zipfile.ZIP_STORED
            new_info.external_attr = info.external_attr
            zout.writestr(new_info, data)
    return buf.getvalue()


def resign(in_hap: Path, out_hap: Path, profile: Path, signer_dir: Path) -> None:
    cmd = [
        "java",
        "-jar",
        str(signer_dir / "hap-sign-tool.jar"),
        "sign-app",
        "-mode",
        "localsign",
        "-signAlg",
        "SHA256withECDSA",
        "-keyAlias",
        "OpenHarmony Application Release",
        "-inFile",
        str(in_hap),
        "-outFile",
        str(out_hap),
        "-profileFile",
        str(profile),
        "-keystoreFile",
        str(signer_dir / "OpenHarmony.p12"),
        "-keystorePwd",
        "123456",
        "-keyPwd",
        "123456",
        "-appCertFile",
        str(signer_dir / "OpenHarmonyApplication.pem"),
        "-profileSigned",
        "1",
        "-inForm",
        "zip",
    ]
    subprocess.check_call(cmd)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--in", dest="inp", required=True, type=Path)
    parser.add_argument("--out", dest="out", required=True, type=Path)
    parser.add_argument(
        "--profile",
        type=Path,
        default=Path(__file__).resolve().parents[1] / "signature" / "openharmony_sx.p7b",
    )
    parser.add_argument("--signer-dir", type=Path, default=DEFAULT_SIGNER_DIR)
    parser.add_argument("--skip-sign", action="store_true")
    args = parser.parse_args()

    with zipfile.ZipFile(args.inp) as z:
        abc = bytearray(z.read("ets/modules_static.abc"))

    print(f"[PATCH] {args.inp}")
    patched = patch_abc(abc)
    unsigned_bytes = rebuild_hap(args.inp, patched)
    tmp = args.out.with_suffix(args.out.suffix + ".unsigned")
    tmp.write_bytes(unsigned_bytes)
    if args.skip_sign:
        args.out.write_bytes(unsigned_bytes)
        tmp.unlink(missing_ok=True)
    else:
        resign(tmp, args.out, args.profile, args.signer_dir)
        tmp.unlink(missing_ok=True)

    with zipfile.ZipFile(args.out) as z:
        out_abc = z.read("ets/modules_static.abc")
    print(
        f"[OK] {args.out} app={out_abc.count(b'Lapplication/AbilityDelegator/')} "
        f"short={out_abc.count(b'LAbilityDelegator/')} "
        f"Lescompat={out_abc.count(b'Lescompat/')} "
        f"stdError={out_abc.count(b'Lstd/core/Error;')}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
