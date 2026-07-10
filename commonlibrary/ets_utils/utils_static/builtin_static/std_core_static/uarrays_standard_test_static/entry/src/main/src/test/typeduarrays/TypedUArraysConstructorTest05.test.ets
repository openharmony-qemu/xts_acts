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

export default function typedUArraysConstructorTest05(): void {
  describe('TypedUArraysConstructorTest05', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    it('testTypedUArraysConstructor0202_241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.slice(1, 3).filter((v) => v > 2);
      expect(result.length === 1).assertTrue();
      const val203 = result[0];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2420
     * @tc.name testTypedUArraysConstructor0202_242
     * @tc.desc Verify buffer subarray filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.subarray(1, 3).filter((v) => v > 2);
      expect(result.length === 1).assertTrue();
      const val204 = result[0];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2430
     * @tc.name testTypedUArraysConstructor0202_243
     * @tc.desc Verify buffer toReversed filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = reverseUint8Array(arr).filter((v) => v > 2);
      expect(result.length === 2).assertTrue();
      const val205 = result[0];
      const val206 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2440
     * @tc.name testTypedUArraysConstructor0202_244
     * @tc.desc Verify buffer toSorted filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.filter((v) => v > 2);
      expect(result.length === 2).assertTrue();
      const val207 = result[0];
      const val208 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2450
     * @tc.name testTypedUArraysConstructor0202_245
     * @tc.desc Verify buffer map find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.map((v) => v * 2).find((v) => v > 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2460
     * @tc.name testTypedUArraysConstructor0202_246
     * @tc.desc Verify buffer filter find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.filter((v) => v > 2).find((v) => v > 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2470
     * @tc.name testTypedUArraysConstructor0202_247
     * @tc.desc Verify buffer slice find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.slice(1, 3).find((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2480
     * @tc.name testTypedUArraysConstructor0202_248
     * @tc.desc Verify buffer subarray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.subarray(1, 3).find((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2490
     * @tc.name testTypedUArraysConstructor0202_249
     * @tc.desc Verify buffer toReversed find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = reverseUint8Array(arr).find((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2500
     * @tc.name testTypedUArraysConstructor0202_250
     * @tc.desc Verify buffer toSorted find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.filter((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2510
     * @tc.name testTypedUArraysConstructor0202_251
     * @tc.desc Verify buffer map findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = findLastUint8(arr.map((v) => v * 2), (v: number, _index: number, _array: Uint8Array): boolean => v > 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2520
     * @tc.name testTypedUArraysConstructor0202_252
     * @tc.desc Verify buffer filter findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = findLastUint8(arr.filter((v) => v > 2), (v: number, _index: number, _array: Uint8Array): boolean => v < 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2530
     * @tc.name testTypedUArraysConstructor0202_253
     * @tc.desc Verify buffer slice findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = findLastUint8(arr.slice(1, 3), (v: number, _index: number, _array: Uint8Array): boolean => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2540
     * @tc.name testTypedUArraysConstructor0202_254
     * @tc.desc Verify buffer subarray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = findLastUint8(arr.subarray(1, 3), (v: number, _index: number, _array: Uint8Array): boolean => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2550
     * @tc.name testTypedUArraysConstructor0202_255
     * @tc.desc Verify buffer toReversed findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = findLastUint8(reverseUint8Array(arr), (v: number, _index: number, _array: Uint8Array): boolean => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2560
     * @tc.name testTypedUArraysConstructor0202_256
     * @tc.desc Verify buffer toSorted findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const found = arr.filter((v) => v > 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2570
     * @tc.name testTypedUArraysConstructor0202_257
     * @tc.desc Verify buffer map every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).every((v) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2580
     * @tc.name testTypedUArraysConstructor0202_258
     * @tc.desc Verify buffer filter every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).every((v) => v < 5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2590
     * @tc.name testTypedUArraysConstructor0202_259
     * @tc.desc Verify buffer slice every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).every((v) => v > 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2600
     * @tc.name testTypedUArraysConstructor0202_260
     * @tc.desc Verify buffer subarray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).every((v) => v > 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2610
     * @tc.name testTypedUArraysConstructor0202_261
     * @tc.desc Verify buffer toReversed every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).every((v) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2620
     * @tc.name testTypedUArraysConstructor0202_262
     * @tc.desc Verify buffer toSorted every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 0).every((v) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2630
     * @tc.name testTypedUArraysConstructor0202_263
     * @tc.desc Verify buffer map some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).some((v) => v > 5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2640
     * @tc.name testTypedUArraysConstructor0202_264
     * @tc.desc Verify buffer filter some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).some((v) => v < 4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2650
     * @tc.name testTypedUArraysConstructor0202_265
     * @tc.desc Verify buffer slice some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).some((v) => v > 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2660
     * @tc.name testTypedUArraysConstructor0202_266
     * @tc.desc Verify buffer subarray some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).some((v) => v > 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2670
     * @tc.name testTypedUArraysConstructor0202_267
     * @tc.desc Verify buffer toReversed some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).some((v) => v > 3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2680
     * @tc.name testTypedUArraysConstructor0202_268
     * @tc.desc Verify buffer toSorted some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 3).some((v) => v > 3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2690
     * @tc.name testTypedUArraysConstructor0202_269
     * @tc.desc Verify buffer map includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).includes(6)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2700
     * @tc.name testTypedUArraysConstructor0202_270
     * @tc.desc Verify buffer filter includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).includes(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2710
     * @tc.name testTypedUArraysConstructor0202_271
     * @tc.desc Verify buffer slice includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2720
     * @tc.name testTypedUArraysConstructor0202_272
     * @tc.desc Verify buffer subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2730
     * @tc.name testTypedUArraysConstructor0202_273
     * @tc.desc Verify buffer toReversed includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2740
     * @tc.name testTypedUArraysConstructor0202_274
     * @tc.desc Verify buffer toSorted includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(sortUint8Array(arr).includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2750
     * @tc.name testTypedUArraysConstructor0202_275
     * @tc.desc Verify buffer map indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).indexOf(6)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2760
     * @tc.name testTypedUArraysConstructor0202_276
     * @tc.desc Verify buffer filter indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).indexOf(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2770
     * @tc.name testTypedUArraysConstructor0202_277
     * @tc.desc Verify buffer slice indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).indexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2780
     * @tc.name testTypedUArraysConstructor0202_278
     * @tc.desc Verify buffer subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).indexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2790
     * @tc.name testTypedUArraysConstructor0202_279
     * @tc.desc Verify buffer toReversed indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).indexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2800
     * @tc.name testTypedUArraysConstructor0202_280
     * @tc.desc Verify buffer toSorted indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(sortUint8Array(arr)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2810
     * @tc.name testTypedUArraysConstructor0202_281
     * @tc.desc Verify buffer map lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).lastIndexOf(6)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2820
     * @tc.name testTypedUArraysConstructor0202_282
     * @tc.desc Verify buffer filter lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).lastIndexOf(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2830
     * @tc.name testTypedUArraysConstructor0202_283
     * @tc.desc Verify buffer slice lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).lastIndexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2840
     * @tc.name testTypedUArraysConstructor0202_284
     * @tc.desc Verify buffer subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).lastIndexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2850
     * @tc.name testTypedUArraysConstructor0202_285
     * @tc.desc Verify buffer toReversed lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).lastIndexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2860
     * @tc.name testTypedUArraysConstructor0202_286
     * @tc.desc Verify buffer toSorted lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(sortUint8Array(arr)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2870
     * @tc.name testTypedUArraysConstructor0202_287
     * @tc.desc Verify buffer map findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.map((v) => v * 2).findIndex((v) => v > 4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2880
     * @tc.name testTypedUArraysConstructor0202_288
     * @tc.desc Verify buffer filter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).findIndex((v) => v > 3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2890
     * @tc.name testTypedUArraysConstructor0202_289
     * @tc.desc Verify buffer slice findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.slice(1, 3).findIndex((v) => v > 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2900
     * @tc.name testTypedUArraysConstructor0202_290
     * @tc.desc Verify buffer subarray findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.subarray(1, 3).findIndex((v) => v > 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2910
     * @tc.name testTypedUArraysConstructor0202_291
     * @tc.desc Verify buffer toReversed findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(reverseUint8Array(arr).findIndex((v) => v > 2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2920
     * @tc.name testTypedUArraysConstructor0202_292
     * @tc.desc Verify buffer toSorted findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2930
     * @tc.name testTypedUArraysConstructor0202_293
     * @tc.desc Verify buffer map findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(findLastIndexUint8(arr.map((v) => v * 2), (v: number, _index: number, _array: Uint8Array): boolean => v > 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2940
     * @tc.name testTypedUArraysConstructor0202_294
     * @tc.desc Verify buffer filter findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(findLastIndexUint8(arr.filter((v) => v > 2), (v: number, _index: number, _array: Uint8Array): boolean => v < 4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2950
     * @tc.name testTypedUArraysConstructor0202_295
     * @tc.desc Verify buffer slice findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(findLastIndexUint8(arr.slice(1, 3), (v: number, _index: number, _array: Uint8Array): boolean => v > 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2960
     * @tc.name testTypedUArraysConstructor0202_296
     * @tc.desc Verify buffer subarray findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(findLastIndexUint8(arr.subarray(1, 3), (v: number, _index: number, _array: Uint8Array): boolean => v > 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2970
     * @tc.name testTypedUArraysConstructor0202_297
     * @tc.desc Verify buffer toReversed findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(findLastIndexUint8(reverseUint8Array(arr), (v: number, _index: number, _array: Uint8Array): boolean => v > 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2980
     * @tc.name testTypedUArraysConstructor0202_298
     * @tc.desc Verify buffer toSorted findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      expect(arr.filter((v) => v > 2).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2990
     * @tc.name testTypedUArraysConstructor0202_299
     * @tc.desc Verify buffer map reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const sum = arr.map((v) => v * 2).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3000
     * @tc.name testTypedUArraysConstructor0202_300
     * @tc.desc Verify buffer filter reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const sum = arr.filter((v) => v > 2).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3010
     * @tc.name testTypedUArraysConstructor0202_301
     * @tc.desc Verify buffer slice reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
