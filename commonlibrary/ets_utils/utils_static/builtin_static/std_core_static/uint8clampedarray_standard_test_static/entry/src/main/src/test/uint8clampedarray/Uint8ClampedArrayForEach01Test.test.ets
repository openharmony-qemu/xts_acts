'use static';
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

export default function uint8ClampedArrayForEach01Test(): void {
  describe('uint8ClampedArrayForEach01Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0100
     * @tc.name testUint8ClampedArrayForEachOne001
     * @tc.desc Verify forEach iteration count equals 3 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0200
     * @tc.name testUint8ClampedArrayForEachOne002
     * @tc.desc Verify forEach iteration count equals 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0300
     * @tc.name testUint8ClampedArrayForEachOne003
     * @tc.desc Verify forEach iteration count equals 65535 for length-65535 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0400
     * @tc.name testUint8ClampedArrayForEachOne004
     * @tc.desc Verify forEach first equals 100 for array [100, 200, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      let first: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { first = v; } });
      expect(first).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0500
     * @tc.name testUint8ClampedArrayForEachOne005
     * @tc.desc Verify forEach mid equals 200 for array [100, 200, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      let mid: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 1) { mid = v; } });
      expect(mid).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0600
     * @tc.name testUint8ClampedArrayForEachOne006
     * @tc.desc Verify forEach last key equals 50 for array [100, 200, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      let last: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 2) { last = v; } });
      expect(last).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0700
     * @tc.name testUint8ClampedArrayForEachOne007
     * @tc.desc Verify forEach accumulated sum equals 0 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0800
     * @tc.name testUint8ClampedArrayForEachOne008
     * @tc.desc Verify forEach accumulated sum equals 765 for array [255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(765);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_0900
     * @tc.name testUint8ClampedArrayForEachOne009
     * @tc.desc Verify callback value clamp 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1000
     * @tc.name testUint8ClampedArrayForEachOne010
     * @tc.desc Verify forEach capturedValue equals 0 for array [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1100
     * @tc.name testUint8ClampedArrayForEachOne011
     * @tc.desc Verify forEach capturedValue equals 0 for array [Number.NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1200
     * @tc.name testUint8ClampedArrayForEachOne012
     * @tc.desc Verify callback value Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1300
     * @tc.name testUint8ClampedArrayForEachOne013
     * @tc.desc Verify callback value -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1400
     * @tc.name testUint8ClampedArrayForEachOne014
     * @tc.desc Verify forEach capturedValue equals 128 for array [127.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1500
     * @tc.name testUint8ClampedArrayForEachOne015
     * @tc.desc Verify forEach capturedValue equals 128 for array [128.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1600
     * @tc.name testUint8ClampedArrayForEachOne016
     * @tc.desc Verify forEach capturedValue equals 0 for array [0.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1700
     * @tc.name testUint8ClampedArrayForEachOne017
     * @tc.desc Verify forEach capturedValue equals 0 for array [0.4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1800
     * @tc.name testUint8ClampedArrayForEachOne018
     * @tc.desc Verify forEach capturedValue equals 1 for array [0.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_1900
     * @tc.name testUint8ClampedArrayForEachOne019
     * @tc.desc Verify callback value 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2000
     * @tc.name testUint8ClampedArrayForEachOne020
     * @tc.desc Verify forEach capturedValue equals 0 for array [-1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2100
     * @tc.name testUint8ClampedArrayForEachOne021
     * @tc.desc Verify forEach capturedValue equals 127 for array [127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2200
     * @tc.name testUint8ClampedArrayForEachOne022
     * @tc.desc Verify forEach capturedValue equals 128 for array [128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2300
     * @tc.name testUint8ClampedArrayForEachOne023
     * @tc.desc Verify forEach capturedValue equals 128 for array [0x80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x80]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2400
     * @tc.name testUint8ClampedArrayForEachOne024
     * @tc.desc Verify forEach capturedValue equals 255 for array [0o377]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2500
     * @tc.name testUint8ClampedArrayForEachOne025
     * @tc.desc Verify forEach capturedValue equals 255 for array [0b11111111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { capturedValue = v; });
      expect(capturedValue).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2600
     * @tc.name testUint8ClampedArrayForEachOne026
     * @tc.desc Verify forEach firstIdx equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let firstIdx: int = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (firstIdx === -1) { firstIdx = i; } });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2700
     * @tc.name testUint8ClampedArrayForEachOne027
     * @tc.desc Verify forEach last key equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let lastIdx: int = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { lastIdx = i; });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2800
     * @tc.name testUint8ClampedArrayForEachOne028
     * @tc.desc Verify forEach element at indices[0] equals 0 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const indices: number[] = [];
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { indices.push(i); });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
      expect(indices[4]).assertEqual(4);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_2900
     * @tc.name testUint8ClampedArrayForEachOne029
     * @tc.desc Verify callback array length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let alen: int = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { alen = a.length; } });
      expect(alen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3000
     * @tc.name testUint8ClampedArrayForEachOne030
     * @tc.desc Verify callback third argument a equals array reference for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let allSame: boolean = true;
      let calls: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (a !== arr) { allSame = false; } calls++; });
      expect(allSame).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3100
     * @tc.name testUint8ClampedArrayForEachOne031
     * @tc.desc Verify forEach accumulated sum equals 6 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(6);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3200
     * @tc.name testUint8ClampedArrayForEachOne032
     * @tc.desc Verify forEach accumulated sum equals 3 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let idxSum: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { idxSum = idxSum + i; });
      expect(idxSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3300
     * @tc.name testUint8ClampedArrayForEachOne033
     * @tc.desc Verify Uint8ClampedArray(5) default elements are all 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      let sum: number = 0;
      let calls: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; calls++; });
      expect(sum).assertEqual(0);
      expect(calls).assertEqual(5);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3400
     * @tc.name testUint8ClampedArrayForEachOne034
     * @tc.desc Verify forEach iteration count equals 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3500
     * @tc.name testUint8ClampedArrayForEachOne035
     * @tc.desc Verify forEach iteration count equals 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3600
     * @tc.name testUint8ClampedArrayForEachOne036
     * @tc.desc Verify forEach iteration count equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3700
     * @tc.name testUint8ClampedArrayForEachOne037
     * @tc.desc Verify subarray iteration count equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      let count: int = 0;
      let sum: number = 0;
      sub.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; sum = sum + v; });
      expect(count).assertEqual(3);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3800
     * @tc.name testUint8ClampedArrayForEachOne038
     * @tc.desc Verify slice iteration count equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = parent.slice(0, 3);
      let count: int = 0;
      s.forEach((v: number, i: int, a: Uint8ClampedArray) => { count = count + 1; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_3900
     * @tc.name testUint8ClampedArrayForEachOne039
     * @tc.desc Verify forEach value all elements 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      let allZero: boolean = true;
      let calls: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v !== 0) { allZero = false; } calls++; });
      expect(allZero).assertTrue();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4000
     * @tc.name testUint8ClampedArrayForEachOne040
     * @tc.desc Verify forEach value all elements 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255]);
      let all255: boolean = true;
      let calls: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v !== 255) { all255 = false; } calls++; });
      expect(all255).assertTrue();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4100
     * @tc.name testUint8ClampedArrayForEachOne041
     * @tc.desc Verify forEach value equals index 0..4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3, 4]);
      let match: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v !== (i)) { match = false; } });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4200
     * @tc.name testUint8ClampedArrayForEachOne042
     * @tc.desc Verify forEach value sum 0 255 0 255 equals 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4300
     * @tc.name testUint8ClampedArrayForEachOne043
     * @tc.desc Verify forEach accumulated sum equals 255 for array [127, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(255);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4400
     * @tc.name testUint8ClampedArrayForEachOne044
     * @tc.desc Verify forEach returns undefined after visiting all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const ret = arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4500
     * @tc.name testUint8ClampedArrayForEachOne045
     * @tc.desc Verify forEach yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4600
     * @tc.name testUint8ClampedArrayForEachOne046
     * @tc.desc Verify forEach yields byteLength 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(arr.byteLength).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4700
     * @tc.name testUint8ClampedArrayForEachOne047
     * @tc.desc Verify forEach buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4800
     * @tc.name testUint8ClampedArrayForEachOne048
     * @tc.desc Verify forEach yields byteOffset 2 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_4900
     * @tc.name testUint8ClampedArrayForEachOne049
     * @tc.desc Verify forEach ret equals undefined for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const ret = arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(ret).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5000
     * @tc.name testUint8ClampedArrayForEachOne050
     * @tc.desc Verify forEach propagates Error thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('cb err'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5100
     * @tc.name testUint8ClampedArrayForEachOne051
     * @tc.desc Verify forEach stops after the callback throws at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let count: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
          count = count + 1;
          if (i === 1) { throw new Error('stop'); }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5200
     * @tc.name testUint8ClampedArrayForEachOne052
     * @tc.desc Verify forEach propagates RangeError thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('RangeError'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5300
     * @tc.name testUint8ClampedArrayForEachOne053
     * @tc.desc Verify forEach propagates TypeError thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('type'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5400
     * @tc.name testUint8ClampedArrayForEachOne054
     * @tc.desc Verify forEach invokes the callback once before first-element failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
          count = count + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5500
     * @tc.name testUint8ClampedArrayForEachOne055
     * @tc.desc Verify forEach invokes the callback three times before last-element failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
          count = count + 1;
          if (i === 2) { throw new Error('last'); }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5600
     * @tc.name testUint8ClampedArrayForEachOne056
     * @tc.desc Verify forEach behavior for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let entered: boolean = false;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        entered = true;
        throw new Error('x');
      });
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5700
     * @tc.name testUint8ClampedArrayForEachOne057
     * @tc.desc Verify forEach outer equals 110 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let outer: number = 100;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { outer = outer + v; });
      expect(outer).assertEqual(110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5800
     * @tc.name testUint8ClampedArrayForEachOne058
     * @tc.desc Verify forEach maxVal equals 15 for array [5, 10, 15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let maxVal: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v > maxVal) { maxVal = v; } });
      expect(maxVal).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_5900
     * @tc.name testUint8ClampedArrayForEachOne059
     * @tc.desc Verify forEach element at arr[1] equals 99 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { arr[1] = 99; } });
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6000
     * @tc.name testUint8ClampedArrayForEachOne060
     * @tc.desc Verify forEach reads value 88 after a prior callback mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let seenAt1: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) { arr[1] = 88; }
        if (i === 1) { seenAt1 = v; }
      });
      expect(seenAt1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6100
     * @tc.name testUint8ClampedArrayForEachOne061
     * @tc.desc Verify forEach receives the original first value before mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let firstVal: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) { firstVal = v; arr[0] = 200; }
      });
      expect(firstVal).assertEqual(10);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6200
     * @tc.name testUint8ClampedArrayForEachOne062
     * @tc.desc Verify callback array this callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let seen: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) { a[2] = 77; }
        if (i === 2) { seen = v; }
      });
      expect(seen).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6300
     * @tc.name testUint8ClampedArrayForEachOne063
     * @tc.desc Verify forEach element at arr[1] equals 255 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { arr[1] = 256; } });
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6400
     * @tc.name testUint8ClampedArrayForEachOne064
     * @tc.desc Verify forEach element at arr[1] equals 0 for array [5, 10, 15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { arr[1] = -1; } });
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6500
     * @tc.name testUint8ClampedArrayForEachOne065
     * @tc.desc Verify forEach element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {});
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6600
     * @tc.name testUint8ClampedArrayForEachOne066
     * @tc.desc Verify forEach reads values filled into later indices during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let lastVal: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) { arr.fill(7, 1); }
        if (i === 3) { lastVal = v; }
      });
      expect(lastVal).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6700
     * @tc.name testUint8ClampedArrayForEachOne067
     * @tc.desc Verify nested forEach calls produce four callback pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2]);
      const arr2 = new Uint8ClampedArray([10, 20]);
      let pairs: int = 0;
      arr1.forEach((outerValue: number, outerIndex: int, outerArr: Uint8ClampedArray) => {
        arr2.forEach((innerValue: number, innerIndex: int, innerArr: Uint8ClampedArray) => { pairs = pairs + 1; });
      });
      expect(pairs).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6800
     * @tc.name testUint8ClampedArrayForEachOne068
     * @tc.desc Verify nested forEach calls accumulate paired values to 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2]);
      const arr2 = new Uint8ClampedArray([10, 20]);
      let total: number = 0;
      arr1.forEach((v1: number, i1: int, a1: Uint8ClampedArray) => {
        arr2.forEach((v2: number, i2: int, a2: Uint8ClampedArray) => { total = total + v1 + v2; });
      });
      expect(total).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_6900
     * @tc.name testUint8ClampedArrayForEachOne069
     * @tc.desc Verify nested forEach calls on the receiver produce four callback pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let pairs: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        a.forEach((v2: number, i2: int, a2: Uint8ClampedArray) => { pairs = pairs + 1; });
      });
      expect(pairs).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7000
     * @tc.name testUint8ClampedArrayForEachOne070
     * @tc.desc Verify forEach element at seen[0] equals 5 for array [5, 10, 15, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const seen: number[] = [];
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { seen.push(v); });
      expect(seen[0]).assertEqual(5);
      expect(seen[1]).assertEqual(10);
      expect(seen[2]).assertEqual(15);
      expect(seen[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7100
     * @tc.name testUint8ClampedArrayForEachOne071
     * @tc.desc Verify the callback receiver exposes value 3 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let crossRead: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) { crossRead = a[2]; }
      });
      expect(crossRead).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7200
     * @tc.name testUint8ClampedArrayForEachOne072
     * @tc.desc Verify subarray element at parent[1] equals 99 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub.forEach((v: number, i: int, a: Uint8ClampedArray) => { sub[i] = 99; });
      expect(parent[1]).assertEqual(99);
      expect(parent[2]).assertEqual(99);
      expect(parent[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7300
     * @tc.name testUint8ClampedArrayForEachOne073
     * @tc.desc Verify subarray element at parent[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub.forEach((v: number, i: int, a: Uint8ClampedArray) => { sub[i] = 99; });
      expect(parent[0]).assertEqual(1);
      expect(parent[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7400
     * @tc.name testUint8ClampedArrayForEachOne074
     * @tc.desc Verify slice element at parent[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice();
      s.forEach((v: number, i: int, a: Uint8ClampedArray) => { s[i] = 77; });
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7500
     * @tc.name testUint8ClampedArrayForEachOne075
     * @tc.desc Verify subarray element at sub[0] equals 88 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      parent.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 1) { parent[1] = 88; } });
      expect(sub[0]).assertEqual(88);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7600
     * @tc.name testUint8ClampedArrayForEachOne076
     * @tc.desc Verify forEach idx equals 0 for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let idx: int = -1;
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { idx = i; cnt = cnt + 1; });
      expect(idx).assertEqual(0);
      expect(cnt).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7700
     * @tc.name testUint8ClampedArrayForEachOne077
     * @tc.desc Verify fill accumulated sum equals 2000 for length-2000 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2000);
      arr.fill(1);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7800
     * @tc.name testUint8ClampedArrayForEachOne078
     * @tc.desc Verify two consecutive forEach calls each iterate all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count1: int = 0;
      let count2: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count1 = count1 + 1; });
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { count2 = count2 + 1; });
      expect(count1).assertEqual(3);
      expect(count2).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_7900
     * @tc.name testUint8ClampedArrayForEachOne079
     * @tc.desc Verify forEach cnt equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let cnt: int = 0;
      let total: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { total = total + v; });
      expect(cnt).assertEqual(3);
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_8000
     * @tc.name testUint8ClampedArrayForEachOne080
     * @tc.desc Verify forEach cnt equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      arr.fill(9);
      expect(cnt).assertEqual(3);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_8100
     * @tc.name testUint8ClampedArrayForEachOne081
     * @tc.desc Verify callback value v equals 42 for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let isNum: boolean = false;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { isNum = v === 42; });
      expect(isNum).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_ONE_8200
     * @tc.name testUint8ClampedArrayForEachOne082
     * @tc.desc Verify callback array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let isObj: boolean = false;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { isObj = a.length === 2; });
      expect(isObj).assertTrue();
    });
  });
}
