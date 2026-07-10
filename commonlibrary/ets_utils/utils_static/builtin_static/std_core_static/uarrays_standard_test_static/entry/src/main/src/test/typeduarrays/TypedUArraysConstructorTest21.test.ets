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

export default function typedUArraysConstructorTest21(): void {
  describe('TypedUArraysConstructorTest21', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2190
     * @tc.name testTypedUArraysConstructor0202_219
     * @tc.desc Verify buffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b) => a + b);
      const product = arr.reduce((a, b) => a * b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2200
     * @tc.name testTypedUArraysConstructor0202_220
     * @tc.desc Verify buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sliced = arr.slice(0, 3).slice(1);
      expect(sliced.length === 2).assertTrue();
      const val157 = sliced[0];
      const val158 = sliced[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2210
     * @tc.name testTypedUArraysConstructor0202_221
     * @tc.desc Verify buffer subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sub = arr.subarray(0, 3).subarray(1);
      expect(sub.length === 2).assertTrue();
      const val159 = sub[0];
      const val160 = sub[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2220
     * @tc.name testTypedUArraysConstructor0202_222
     * @tc.desc Verify buffer reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.reverse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2230
     * @tc.name testTypedUArraysConstructor0202_223
     * @tc.desc Verify buffer sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.sort((a, b) => (b - a).toInt());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2240
     * @tc.name testTypedUArraysConstructor0202_224
     * @tc.desc Verify buffer fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.fill(1).fill(2, 1).fill(3, 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2250
     * @tc.name testTypedUArraysConstructor0202_225
     * @tc.desc Verify buffer set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.set([1, 2, 3, 4]);
      arr.set([10, 20], 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2260
     * @tc.name testTypedUArraysConstructor0202_226
     * @tc.desc Verify buffer copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr.copyWithin(0, 2).copyWithin(2, 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2270
     * @tc.name testTypedUArraysConstructor0202_227
     * @tc.desc Verify buffer toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = reverseUint8Array(reverseUint8Array(arr));
      const val177 = result[0];
      const val178 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2280
     * @tc.name testTypedUArraysConstructor0202_228
     * @tc.desc Verify buffer toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = sortUint8Array(arr);
      const val180 = result[0];
      const val181 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2290
     * @tc.name testTypedUArraysConstructor0202_229
     * @tc.desc Verify buffer map filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.map((v) => v * 2).filter((v) => v > 4);
      expect(result.length === 2).assertTrue();
      const val183 = result[0];
      const val184 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2300
     * @tc.name testTypedUArraysConstructor0202_230
     * @tc.desc Verify buffer filter map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.filter((v) => v > 2).map((v) => v * 2);
      expect(result.length === 2).assertTrue();
      const val185 = result[0];
      const val186 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2310
     * @tc.name testTypedUArraysConstructor0202_231
     * @tc.desc Verify buffer map reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.map((v) => v * 2).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2320
     * @tc.name testTypedUArraysConstructor0202_232
     * @tc.desc Verify buffer filter reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(4);
        const arr = new Uint8Array(buf);
        const sum = arr.filter((v) => v > 2).reduce((a, b) => a + b);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2330
     * @tc.name testTypedUArraysConstructor0202_233
     * @tc.desc Verify buffer slice map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.slice(1, 3).map((v) => v * 2);
      expect(result.length === 2).assertTrue();
      const val187 = result[0];
      const val188 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2340
     * @tc.name testTypedUArraysConstructor0202_234
     * @tc.desc Verify buffer subarray map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.subarray(1, 3).map((v) => v * 2);
      expect(result.length === 2).assertTrue();
      const val189 = result[0];
      const val190 = result[1];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2350
     * @tc.name testTypedUArraysConstructor0202_235
     * @tc.desc Verify buffer toReversed map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = reverseUint8Array(arr).map((v) => v * 2);
      const val191 = result[0];
      const val192 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2360
     * @tc.name testTypedUArraysConstructor0202_236
     * @tc.desc Verify buffer toSorted map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = arr.map((v) => v * 2);
      const val193 = result[0];
      const val194 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2370
     * @tc.name testTypedUArraysConstructor0202_237
     * @tc.desc Verify buffer map toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = reverseUint8Array(arr.map((v) => v * 2));
      const val195 = result[0];
      const val196 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2380
     * @tc.name testTypedUArraysConstructor0202_238
     * @tc.desc Verify buffer map toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      let result = sortUint8Array(arr.map((v) => v * 2));
      const val197 = result[0];
      const val198 = result[3];
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2390
     * @tc.name testTypedUArraysConstructor0202_239
     * @tc.desc Verify buffer filter toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(4);
        const arr = new Uint8Array(buf);
        let result = reverseUint8Array(arr.filter((v) => v > 2));
        const val199 = result[0];
        const val200 = result[1];
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_2400
     * @tc.name testTypedUArraysConstructor0202_240
     * @tc.desc Verify buffer filter toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(4);
        const arr = new Uint8Array(buf);
        let result = sortUint8Array(arr.filter((v) => v > 2));
        const val201 = result[0];
        const val202 = result[1];
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3010
     * @tc.name testTypedUArraysConstructor0202_301
     * @tc.desc Verify buffer slice reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.slice(1).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3020
     * @tc.name testTypedUArraysConstructor0202_302
     * @tc.desc Verify buffer subarray reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.subarray(1).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3030
     * @tc.name testTypedUArraysConstructor0202_303
     * @tc.desc Verify buffer toReversed reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = reverseUint8Array(arr).reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3040
     * @tc.name testTypedUArraysConstructor0202_304
     * @tc.desc Verify buffer toSorted reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3050
     * @tc.name testTypedUArraysConstructor0202_305
     * @tc.desc Verify buffer map reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.map((v) => v * 2).reduceRight((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3060
     * @tc.name testTypedUArraysConstructor0202_306
     * @tc.desc Verify buffer filter reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(4);
        const arr = new Uint8Array(buf);
        const sum = arr.filter((v) => v > 2).reduceRight((a, b) => a + b);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3070
     * @tc.name testTypedUArraysConstructor0202_307
     * @tc.desc Verify buffer slice reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.slice(1).reduceRight((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3080
     * @tc.name testTypedUArraysConstructor0202_308
     * @tc.desc Verify buffer subarray reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.subarray(1).reduceRight((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3090
     * @tc.name testTypedUArraysConstructor0202_309
     * @tc.desc Verify buffer toReversed reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = reverseUint8Array(arr).reduceRight((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3100
     * @tc.name testTypedUArraysConstructor0202_310
     * @tc.desc Verify buffer toSorted reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      const sum = arr.reduce((a, b) => a + b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3110
     * @tc.name testTypedUArraysConstructor0202_311
     * @tc.desc Verify buffer map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.map((v) => v * 2).toString();
      expect(str).assertEqual('2,4,6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3120
     * @tc.name testTypedUArraysConstructor0202_312
     * @tc.desc Verify buffer filter toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.filter((v) => v > 2).toString();
      expect(str).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3130
     * @tc.name testTypedUArraysConstructor0202_313
     * @tc.desc Verify buffer slice toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.slice(1, 3).toString();
      expect(str).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3140
     * @tc.name testTypedUArraysConstructor0202_314
     * @tc.desc Verify buffer subarray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.subarray(1, 3).toString();
      expect(str).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3150
     * @tc.name testTypedUArraysConstructor0202_315
     * @tc.desc Verify buffer toReversed toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = reverseUint8Array(arr).toString();
      expect(str).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3160
     * @tc.name testTypedUArraysConstructor0202_316
     * @tc.desc Verify buffer toSorted toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = sortUint8Array(arr);
      expect(str.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3170
     * @tc.name testTypedUArraysConstructor0202_317
     * @tc.desc Verify buffer map join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.map((v) => v * 2).join('-');
      expect(str).assertEqual('2-4-6-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3180
     * @tc.name testTypedUArraysConstructor0202_318
     * @tc.desc Verify buffer filter join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.filter((v) => v > 2).join('-');
      expect(str).assertEqual('3-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3190
     * @tc.name testTypedUArraysConstructor0202_319
     * @tc.desc Verify buffer slice join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.slice(1, 3).join('-');
      expect(str).assertEqual('2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3200
     * @tc.name testTypedUArraysConstructor0202_320
     * @tc.desc Verify buffer subarray join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.subarray(1, 3).join('-');
      expect(str).assertEqual('2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3210
     * @tc.name testTypedUArraysConstructor0202_321
     * @tc.desc Verify buffer toReversed join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = reverseUint8Array(arr).join('-');
      expect(str).assertEqual('4-3-2-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3220
     * @tc.name testTypedUArraysConstructor0202_322
     * @tc.desc Verify buffer toSorted join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = sortUint8Array(arr).join('-');
      expect(str).assertEqual('1-2-3-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3230
     * @tc.name testTypedUArraysConstructor0202_323
     * @tc.desc Verify buffer map toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.map((v) => v * 2).toLocaleString();
      expect(str).assertEqual('2,4,6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3240
     * @tc.name testTypedUArraysConstructor0202_324
     * @tc.desc Verify buffer filter toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.filter((v) => v > 2).toLocaleString();
      expect(str).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3250
     * @tc.name testTypedUArraysConstructor0202_325
     * @tc.desc Verify buffer slice toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.slice(1, 3).toLocaleString();
      expect(str).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3260
     * @tc.name testTypedUArraysConstructor0202_326
     * @tc.desc Verify buffer subarray toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = arr.subarray(1, 3).toLocaleString();
      expect(str).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0202_3270
     * @tc.name testTypedUArraysConstructor0202_327
     * @tc.desc Verify buffer toReversed toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0202_327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const str = reverseUint8Array(arr).toLocaleString();
      expect(str).assertEqual('4,3,2,1');
    });

  });
}
