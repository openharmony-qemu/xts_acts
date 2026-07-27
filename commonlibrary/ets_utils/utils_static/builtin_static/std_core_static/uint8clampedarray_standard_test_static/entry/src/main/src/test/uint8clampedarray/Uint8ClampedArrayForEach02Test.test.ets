'use static'
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

export default function uint8ClampedArrayForEach02Test(): void {
  describe('uint8ClampedArrayForEach02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0100
     * @tc.name testUint8ClampedArrayForEachTwo001
     * @tc.desc Verify forEach callback receives the receiver and matching indexed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let callbackCount: int = 0;
      let receivedReceiver: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        callbackCount++;
        receivedReceiver = receivedReceiver && a === arr && a[i] === v;
      });
      expect(callbackCount).assertEqual(2);
      expect(receivedReceiver).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0200
     * @tc.name testUint8ClampedArrayForEachTwo002
     * @tc.desc Verify callback value NaN clamps to 0 (not NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, Number.NaN, Number.NaN]);
      let cnt: int = 0;
      let anyNaN: boolean = false;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (isNaN(v)) { anyNaN = true; } });
      expect(cnt).assertEqual(3);
      expect(anyNaN).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0300
     * @tc.name testUint8ClampedArrayForEachTwo003
     * @tc.desc Verify callback value Infinity clamps to finite (255/0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      let cnt: int = 0;
      let anyInf: boolean = false;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (!isFinite(v)) { anyInf = true; } });
      expect(cnt).assertEqual(2);
      expect(anyInf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0400
     * @tc.name testUint8ClampedArrayForEachTwo004
     * @tc.desc Verify all clamped values are within 0-255 range for array [0, 100, 200, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 100, 200, 255]);
      let cnt: int = 0;
      let inRange: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (v < 0 || v > 255) { inRange = false; } });
      expect(cnt).assertEqual(4);
      expect(inRange).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0500
     * @tc.name testUint8ClampedArrayForEachTwo005
     * @tc.desc Verify all callback indices are non-negative for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let cnt: int = 0;
      let allNonNeg: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (i < 0) { allNonNeg = false; } });
      expect(cnt).assertEqual(3);
      expect(allNonNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0600
     * @tc.name testUint8ClampedArrayForEachTwo006
     * @tc.desc Verify all callback indices are less than array length for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let cnt: int = 0;
      let allLtLen: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (i >= arr.length) { allLtLen = false; } });
      expect(cnt).assertEqual(4);
      expect(allLtLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0700
     * @tc.name testUint8ClampedArrayForEachTwo007
     * @tc.desc Verify forEach capturedValue equals arr[0] for array [7, 14, 21]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 14, 21]);
      let capturedValue: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { capturedValue = v; } });
      expect(capturedValue).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0800
     * @tc.name testUint8ClampedArrayForEachTwo008
     * @tc.desc Verify forEach last key equals arr[2] for array [7, 14, 21]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 14, 21]);
      let vLast: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === a.length - 1) { vLast = v; } });
      expect(vLast).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_0900
     * @tc.name testUint8ClampedArrayForEachTwo009
     * @tc.desc Verify each callback value equals arr[i] for array [7, 14, 21, 28]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 14, 21, 28]);
      let cnt: int = 0;
      let matchAll: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (v !== arr[i]) { matchAll = false; } });
      expect(cnt).assertEqual(4);
      expect(matchAll).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1000
     * @tc.name testUint8ClampedArrayForEachTwo010
     * @tc.desc Verify each callback value matches $_get(i) for array [100, 150, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 150, 200]);
      let cnt: int = 0;
      let allMatch: boolean = true;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; if (v !== arr.$_get(i)) { allMatch = false; } });
      expect(cnt).assertEqual(3);
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1100
     * @tc.name testUint8ClampedArrayForEachTwo011
     * @tc.desc Verify forEach cnt equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1200
     * @tc.name testUint8ClampedArrayForEachTwo012
     * @tc.desc Verify forEach cnt equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1300
     * @tc.name testUint8ClampedArrayForEachTwo013
     * @tc.desc Verify forEach visits all 4 elements of array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1400
     * @tc.name testUint8ClampedArrayForEachTwo014
     * @tc.desc Verify at crossVal equals 30 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let crossVal: number = -1;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (i === 0) { crossVal = a.at(2) ?? 0; } });
      expect(crossVal).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1500
     * @tc.name testUint8ClampedArrayForEachTwo015
     * @tc.desc Verify forEach yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; });
      const view = new Uint8ClampedArray(arr.buffer);
      expect(cnt).assertEqual(4);
      expect(view.length).assertEqual(4);
    });

    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1600
     * @tc.name testUint8ClampedArrayForEachTwo016
     * @tc.desc Verify forEach zeroCnt equals 3 for array [0, 1, 0, 2, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 2, 0]);
      let zeroCnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v === 0) { zeroCnt = zeroCnt + 1; } });
      expect(zeroCnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1700
     * @tc.name testUint8ClampedArrayForEachTwo017
     * @tc.desc Verify forEach maxCnt equals 3 for array [255, 1, 255, 2, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 1, 255, 2, 255]);
      let maxCnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v === 255) { maxCnt = maxCnt + 1; } });
      expect(maxCnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1800
     * @tc.name testUint8ClampedArrayForEachTwo018
     * @tc.desc Verify forEach accumulates odd and even sums as 4 and 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let oddSum: number = 0;
      let evenSum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if ((v ) % 2 === 0) { evenSum = evenSum + v; } else { oddSum = oddSum + v; }
      });
      expect(oddSum).assertEqual(4);
      expect(evenSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_1900
     * @tc.name testUint8ClampedArrayForEachTwo019
     * @tc.desc Verify forEach accumulated sum equals 255 for array [0xFF, 0x00]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x00]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2000
     * @tc.name testUint8ClampedArrayForEachTwo020
     * @tc.desc Verify forEach accumulated sum equals 192 for array [0o100, 0o200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o100, 0o200]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(192);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2100
     * @tc.name testUint8ClampedArrayForEachTwo021
     * @tc.desc Verify forEach accumulated sum equals 300 for array [1e2, 2e2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 2e2]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2200
     * @tc.name testUint8ClampedArrayForEachTwo022
     * @tc.desc Verify forEach sum arithmetic expr values 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10 + 5, 20 * 2]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2300
     * @tc.name testUint8ClampedArrayForEachTwo023
     * @tc.desc Verify forEach yields byteLength before for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const before = buf.byteLength;
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt++; });
      expect(cnt).assertEqual(4);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2400
     * @tc.name testUint8ClampedArrayForEachTwo024
     * @tc.desc Verify forEach element at reader[0] equals 100 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { arr[i] = 100; });
      const reader = new Uint8ClampedArray(buf);
      expect(reader[0]).assertEqual(100);
      expect(reader[1]).assertEqual(100);
      expect(reader[2]).assertEqual(100);
      expect(reader[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2500
     * @tc.name testUint8ClampedArrayForEachTwo025
     * @tc.desc Verify forEach element at secondView[0] equals 50 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView.forEach((v: number, i: int, a: Uint8ClampedArray) => { firstView[i] = 50; });
      expect(secondView[0]).assertEqual(50);
      expect(secondView[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2600
     * @tc.name testUint8ClampedArrayForEachTwo026
     * @tc.desc Verify new Uint8ClampedArray(0) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let calls: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { calls++; });
      expect(arr.length).assertEqual(0);
      expect(calls).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2700
     * @tc.name testUint8ClampedArrayForEachTwo027
     * @tc.desc Verify forEach cnt equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2800
     * @tc.name testUint8ClampedArrayForEachTwo028
     * @tc.desc Verify Uint8ClampedArray.from cnt equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = Uint8ClampedArray.from(src);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { cnt = cnt + 1; });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_2900
     * @tc.name testUint8ClampedArrayForEachTwo029
     * @tc.desc Verify forEach continues after the callback returns at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let cnt: int = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 1) { return; }
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_3000
     * @tc.name testUint8ClampedArrayForEachTwo030
     * @tc.desc Verify forEach minV equals 1 for array [3, 1, 4, 1, 5, 9, 2, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 4, 1, 5, 9, 2, 6]);
      let minV: number = 255;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { if (v < minV) { minV = v; } });
      expect(minV).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_3100
     * @tc.name testUint8ClampedArrayForEachTwo031
     * @tc.desc Verify forEach avg equals 25 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { sum = sum + v; });
      const avg = sum / arr.length;
      expect(avg).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_3200
     * @tc.name testUint8ClampedArrayForEachTwo032
     * @tc.desc Verify callback (index, value) Map<int,number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const m: Map<int, number> = new Map<int, number>();
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { m.set(i, v); });
      expect(m.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_3300
     * @tc.name testUint8ClampedArrayForEachTwo033
     * @tc.desc Verify forEach s.size equals 3 for array [1, 2, 2, 3, 3, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 2, 3, 3, 3]);
      const s: Set<number> = new Set<number>();
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { s.add(v); });
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FOR_EACH_TWO_3400
     * @tc.name testUint8ClampedArrayForEachTwo034
     * @tc.desc Verify forEach s equals '0:1;1:2;2:3;' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayForEachTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let s: string = '';
      arr.forEach((v: number, i: int, a: Uint8ClampedArray) => { s = s + i.toString() + ':' + v.toString() + ';'; });
      expect(s).assertEqual('0:1;1:2;2:3;');
    });
  });
}
