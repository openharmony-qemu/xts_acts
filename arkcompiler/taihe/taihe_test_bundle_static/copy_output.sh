#!/bin/bash
#
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

SRC_DIR="$1"
ETS_DST="$2"
STAMP_FILE="$3"
CPP_DST="$4"
INCLUDE_DST="$5"

echo "=========================================="
echo "Copying generated files"
echo "=========================================="
echo "  Source directory: $SRC_DIR"
echo "  ETS destination: $ETS_DST"
echo "  CPP destination: $CPP_DST"
echo "  Include destination: $INCLUDE_DST"
echo "  Stamp file: $STAMP_FILE"
echo "=========================================="

if [[ -z "$SRC_DIR" ]]; then
    echo "Error: SRC_DIR is empty"
    exit 1
fi

if [[ -z "$ETS_DST" ]]; then
    echo "Error: ETS_DST is empty"
    exit 1
fi

if [[ -z "$CPP_DST" ]]; then
    echo "Error: CPP_DST is empty"
    exit 1
fi

if [[ -z "$INCLUDE_DST" ]]; then
    echo "Error: INCLUDE_DST is empty"
    exit 1
fi

if [[ -z "$STAMP_FILE" ]]; then
    echo "Error: STAMP_FILE is empty"
    exit 1
fi

if [[ ! -d "$SRC_DIR" ]]; then
    echo "Error: Source directory does not exist: $SRC_DIR"
    exit 1
fi

echo "Copying .ets files (flattened)..."
mkdir -p "$ETS_DST"

find "$SRC_DIR" -name "*.ets" -type f -exec cp -f {} "$ETS_DST/" \;

ets_count=$(find "$SRC_DIR" -name "*.ets" -type f | wc -l)
echo "  ETS files copied: $ets_count"

SRC_CPP_DIR="$SRC_DIR/src"
echo "Copying implementation files from $SRC_CPP_DIR..."

if [[ -d "$SRC_CPP_DIR" ]]; then
    mkdir -p "$CPP_DST"
    find "$SRC_CPP_DIR" -type f -exec cp -f {} "$CPP_DST/" \;
    cpp_count=$(find "$SRC_CPP_DIR" -type f | wc -l)
    echo "  Implementation files copied: $cpp_count"
else
    echo "  Warning: $SRC_CPP_DIR does not exist, skipping"
    cpp_count=0
fi

SRC_INCLUDE_DIR="$SRC_DIR/include"
echo "Copying header files from $SRC_INCLUDE_DIR..."

if [[ -d "$SRC_INCLUDE_DIR" ]]; then
    mkdir -p "$INCLUDE_DST"
    find "$SRC_INCLUDE_DIR" -type f -exec cp -f {} "$INCLUDE_DST/" \;
    header_count=$(find "$SRC_INCLUDE_DIR" -type f | wc -l)
    echo "  Header files copied: $header_count"
else
    echo "  Warning: $SRC_INCLUDE_DIR does not exist, skipping"
    header_count=0
fi

mkdir -p "$(dirname "$STAMP_FILE")"
touch "$STAMP_FILE"
echo "Stamp file created: $STAMP_FILE"

echo "=========================================="
echo "All copy operations completed"
echo "=========================================="
echo "Summary:"
echo "  ETS files:      $ets_count"
echo "  Implementation: $cpp_count"
echo "  Headers:        $header_count"
echo "=========================================="