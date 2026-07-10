/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


function reverseUint8Array(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source.length);
  for (let i = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function sortUint8Array(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source);
  for (let i = 0; i < result.length; i++) {
    for (let j = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function findLastUint8(source: Uint8Array, predicate: (value: number, index: number, array: Uint8Array) => boolean): number | undefined {
  for (let i = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return value;
    }
  }
  return undefined;
}

function findLastIndexUint8(source: Uint8Array, predicate: (value: number, index: number, array: Uint8Array) => boolean): number {
  for (let i = source.length - 1; i >= 0; i--) {
    const value: number = source[i.toInt()];
    if (predicate(value, i, source)) {
      return i;
    }
  }
  return -1;
}

function atUint8(source: Uint8Array, index: number): number | undefined {
  const normalizedIndex: number = index < 0 ? source.length + index : index;
  if (normalizedIndex < 0 || normalizedIndex >= source.length) {
    return undefined;
  }
  return source[normalizedIndex.toInt()];
}

export default function typedUArraysConstructorTest20(): void {
  describe('TypedUArraysConstructorTest20', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_0010
     * @tc.name testTypedUArraysConstructor0202_001
     * @tc.desc Verify buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1100
     * @tc.name testTypedUArraysConstructor0202_110
     * @tc.desc Verify buffer filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const filtered = arr.filter((v) => v > 2);
      expect(arr.length === 4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1110
     * @tc.name testTypedUArraysConstructor0202_111
     * @tc.desc Verify buffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1120
     * @tc.name testTypedUArraysConstructor0202_112
     * @tc.desc Verify buffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = arr.find((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1130
     * @tc.name testTypedUArraysConstructor0202_113
     * @tc.desc Verify buffer findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = findLastUint8(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1140
     * @tc.name testTypedUArraysConstructor0202_114
     * @tc.desc Verify buffer every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.every((v) => v > 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1150
     * @tc.name testTypedUArraysConstructor0202_115
     * @tc.desc Verify buffer some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.some((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1160
     * @tc.name testTypedUArraysConstructor0202_116
     * @tc.desc Verify buffer includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.includes(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1170
     * @tc.name testTypedUArraysConstructor0202_117
     * @tc.desc Verify buffer indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.indexOf(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1180
     * @tc.name testTypedUArraysConstructor0202_118
     * @tc.desc Verify buffer lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.lastIndexOf(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1190
     * @tc.name testTypedUArraysConstructor0202_119
     * @tc.desc Verify buffer findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.findIndex((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1200
     * @tc.name testTypedUArraysConstructor0202_120
     * @tc.desc Verify buffer findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = findLastIndexUint8(arr, (v: number, _index: number, _array: Uint8Array): boolean => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1810
     * @tc.name testTypedUArraysConstructor0202_181
     * @tc.desc Verify buffer sort compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.sort();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1820
     * @tc.name testTypedUArraysConstructor0202_182
     * @tc.desc Verify buffer toSorted compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sorted = sortUint8Array(arr);
      const val142 = sorted[0];
      const val143 = sorted[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1830
     * @tc.name testTypedUArraysConstructor0202_183
     * @tc.desc Verify buffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const mapped = arr.map(() => 42);
      const val145 = mapped[0];
      const val146 = mapped[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1840
     * @tc.name testTypedUArraysConstructor0202_184
     * @tc.desc Verify buffer filter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const filtered = arr.filter(() => true);
      expect(filtered.length === 4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1850
     * @tc.name testTypedUArraysConstructor0202_185
     * @tc.desc Verify buffer filter false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const filtered = arr.filter(() => false);
      expect(filtered.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1860
     * @tc.name testTypedUArraysConstructor0202_186
     * @tc.desc Verify buffer every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.every(() => true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1870
     * @tc.name testTypedUArraysConstructor0202_187
     * @tc.desc Verify buffer every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.every(() => false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1880
     * @tc.name testTypedUArraysConstructor0202_188
     * @tc.desc Verify buffer some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.some(() => true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1890
     * @tc.name testTypedUArraysConstructor0202_189
     * @tc.desc Verify buffer some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.some(() => false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1900
     * @tc.name testTypedUArraysConstructor0202_190
     * @tc.desc Verify buffer find true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = arr.find(() => true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1910
     * @tc.name testTypedUArraysConstructor0202_191
     * @tc.desc Verify buffer find false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = arr.find(() => false);
      expect(found).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1920
     * @tc.name testTypedUArraysConstructor0202_192
     * @tc.desc Verify buffer findLast true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = findLastUint8(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1930
     * @tc.name testTypedUArraysConstructor0202_193
     * @tc.desc Verify buffer findLast false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = findLastUint8(arr, (_value: number, _index: number, _array: Uint8Array): boolean => false);
      expect(found).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1940
     * @tc.name testTypedUArraysConstructor0202_194
     * @tc.desc Verify buffer findIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.findIndex(() => true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1950
     * @tc.name testTypedUArraysConstructor0202_195
     * @tc.desc Verify buffer findIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.findIndex(() => false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1960
     * @tc.name testTypedUArraysConstructor0202_196
     * @tc.desc Verify buffer findLastIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = findLastIndexUint8(arr, (_value: number, _index: number, _array: Uint8Array): boolean => true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1970
     * @tc.name testTypedUArraysConstructor0202_197
     * @tc.desc Verify buffer findLastIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = findLastIndexUint8(arr, (_value: number, _index: number, _array: Uint8Array): boolean => false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1980
     * @tc.name testTypedUArraysConstructor0202_198
     * @tc.desc Verify buffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const mapped = arr.map((v, i) => v + i);
      const val147 = mapped[0];
      const val148 = mapped[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_1990
     * @tc.name testTypedUArraysConstructor0202_199
     * @tc.desc Verify buffer filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      const filtered = arr.filter((v, i) => i % 2 === 0);
      expect(filtered.length === 2).assertTrue();
      const val149 = filtered[0];
      const val150 = filtered[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2000
     * @tc.name testTypedUArraysConstructor0202_200
     * @tc.desc Verify buffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b, i) => a + b * i);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2010
     * @tc.name testTypedUArraysConstructor0202_201
     * @tc.desc Verify buffer reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduceRight((a, b, i) => a + b * i);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2020
     * @tc.name testTypedUArraysConstructor0202_202
     * @tc.desc Verify buffer every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.every((v, i) => v <= i + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2030
     * @tc.name testTypedUArraysConstructor0202_203
     * @tc.desc Verify buffer some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.some((v, i) => v === i + 1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2040
     * @tc.name testTypedUArraysConstructor0202_204
     * @tc.desc Verify buffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = arr.find((v, i) => i === 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2050
     * @tc.name testTypedUArraysConstructor0202_205
     * @tc.desc Verify buffer findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = findLastUint8(arr, (v: number, i: number, _array: Uint8Array): boolean => i % 2 === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2060
     * @tc.name testTypedUArraysConstructor0202_206
     * @tc.desc Verify buffer findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.findIndex((v, i) => i === 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2070
     * @tc.name testTypedUArraysConstructor0202_207
     * @tc.desc Verify buffer findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = findLastIndexUint8(arr, (v: number, i: number, _array: Uint8Array): boolean => i % 2 === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2080
     * @tc.name testTypedUArraysConstructor0202_208
     * @tc.desc Verify buffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const mapped = arr.map((v) => v * arr.length);
      const val151 = mapped[0];
      const val152 = mapped[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2090
     * @tc.name testTypedUArraysConstructor0202_209
     * @tc.desc Verify buffer filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 4]);
      const filtered = arr.filter((v) => v < arr.length);
      expect(filtered.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2100
     * @tc.name testTypedUArraysConstructor0202_210
     * @tc.desc Verify buffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b) => a + b * arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2110
     * @tc.name testTypedUArraysConstructor0202_211
     * @tc.desc Verify buffer every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      expect(arr.every((v) => v <= arr.length)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2120
     * @tc.name testTypedUArraysConstructor0202_212
     * @tc.desc Verify buffer some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.some((v) => v === arr.length)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2130
     * @tc.name testTypedUArraysConstructor0202_213
     * @tc.desc Verify buffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = arr.find((v) => v === arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2140
     * @tc.name testTypedUArraysConstructor0202_214
     * @tc.desc Verify buffer findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const found = findLastUint8(arr, (v: number, _index: number, _array: Uint8Array): boolean => v <= arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2150
     * @tc.name testTypedUArraysConstructor0202_215
     * @tc.desc Verify buffer findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = arr.findIndex((v) => v === arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2160
     * @tc.name testTypedUArraysConstructor0202_216
     * @tc.desc Verify buffer findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const idx = findLastIndexUint8(arr, (v: number, _index: number, _array: Uint8Array): boolean => v <= arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2170
     * @tc.name testTypedUArraysConstructor0202_217
     * @tc.desc Verify buffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const mapped = arr.map((v) => v).map((v) => v * 2);
      const val153 = mapped[0];
      const val154 = mapped[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2180
     * @tc.name testTypedUArraysConstructor0202_218
     * @tc.desc Verify buffer filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 0]);
      const filtered = arr.filter((v) => v > 0).filter((v) => v < 4);
      expect(filtered.length === 3).assertTrue();
      const val155 = filtered[0];
      const val156 = filtered[2];
    });

  });
}
