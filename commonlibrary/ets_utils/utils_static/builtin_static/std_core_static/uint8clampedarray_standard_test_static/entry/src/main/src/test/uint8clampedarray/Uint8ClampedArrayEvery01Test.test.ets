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

export default function uint8ClampedArrayEvery01Test(): void {
  describe('uint8ClampedArrayEvery01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0100
     * @tc.name testUint8ClampedArrayEveryOne001
     * @tc.desc Verify predicate always-true arity 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0200
     * @tc.name testUint8ClampedArrayEveryOne002
     * @tc.desc Verify every result is true for array [2, 4, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 6]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0300
     * @tc.name testUint8ClampedArrayEveryOne003
     * @tc.desc Verify every result is true for array [0, 1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === i);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0400
     * @tc.name testUint8ClampedArrayEveryOne004
     * @tc.desc Verify predicate 3 element/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a.length === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0500
     * @tc.name testUint8ClampedArrayEveryOne005
     * @tc.desc Verify predicate always-true every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 50, 100, 200]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0600
     * @tc.name testUint8ClampedArrayEveryOne006
     * @tc.desc Verify every result is false for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0700
     * @tc.name testUint8ClampedArrayEveryOne007
     * @tc.desc Verify every result is true for array [1, 2, 3, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0800
     * @tc.name testUint8ClampedArrayEveryOne008
     * @tc.desc Verify every result is false for array [1, 0, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_0900
     * @tc.name testUint8ClampedArrayEveryOne009
     * @tc.desc Verify predicate element>=0 clamp true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1000
     * @tc.name testUint8ClampedArrayEveryOne010
     * @tc.desc Verify predicate element<=255 clamp true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 254, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e <= 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1100
     * @tc.name testUint8ClampedArrayEveryOne011
     * @tc.desc Verify predicate element === 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1200
     * @tc.name testUint8ClampedArrayEveryOne012
     * @tc.desc Verify predicate element === 255 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1300
     * @tc.name testUint8ClampedArrayEveryOne013
     * @tc.desc Verify every result is true for array [128, 200, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 200, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1400
     * @tc.name testUint8ClampedArrayEveryOne014
     * @tc.desc Verify predicate element>=128 127 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 127, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 128);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1500
     * @tc.name testUint8ClampedArrayEveryOne015
     * @tc.desc Verify every predicate e%2===0 all even true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 2, 4, 254]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1600
     * @tc.name testUint8ClampedArrayEveryOne016
     * @tc.desc Verify every result is false for array [0, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e % 2 === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1700
     * @tc.name testUint8ClampedArrayEveryOne017
     * @tc.desc Verify every predicate e%2===1 all odd true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 5, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e % 2 === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1800
     * @tc.name testUint8ClampedArrayEveryOne018
     * @tc.desc Verify every predicate matches boundary values 0, 128, 255 and visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      let callCount: int = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        callCount++;
        return e === 0 || e === 128 || e === 255;
      });
      expect(r).assertTrue();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_1900
     * @tc.name testUint8ClampedArrayEveryOne019
     * @tc.desc Verify predicate element>=0 && element<=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 100, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 0 && e <= 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2000
     * @tc.name testUint8ClampedArrayEveryOne020
     * @tc.desc Verify every visits all elements in index order with value-based predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let callCount: int = 0;
      let idxSeq: string = '';
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        callCount++;
        idxSeq += i.toString();
        return e === 10 || e === 20 || e === 30;
      });
      expect(r).assertTrue();
      expect(callCount).assertEqual(3);
      expect(idxSeq).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2100
     * @tc.name testUint8ClampedArrayEveryOne021
     * @tc.desc Verify every result is true for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => i >= 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2200
     * @tc.name testUint8ClampedArrayEveryOne022
     * @tc.desc Verify every predicate uses index arg, i===0||e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => i === 0 ? true : e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2300
     * @tc.name testUint8ClampedArrayEveryOne023
     * @tc.desc Verify every predicate uses array arg, a.length===8 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a.length === 8);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2400
     * @tc.name testUint8ClampedArrayEveryOne024
     * @tc.desc Verify every predicate uses array arg, e===a[0] true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === a[0]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2500
     * @tc.name testUint8ClampedArrayEveryOne025
     * @tc.desc Verify every predicate uses array arg, a[0]===a[last] true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 10, 10]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a[0] === a[a.length - 1]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2600
     * @tc.name testUint8ClampedArrayEveryOne026
     * @tc.desc Verify every result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2700
     * @tc.name testUint8ClampedArrayEveryOne027
     * @tc.desc Verify every returns true when the predicate accepts each positive element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        if (e > 0) {
          return true;
        } else {
          return false;
        }
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2800
     * @tc.name testUint8ClampedArrayEveryOne028
     * @tc.desc Verify every result is true for array [60, 70, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold: number = 50;
      const arr = new Uint8ClampedArray([60, 70, 80]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > threshold);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_2900
     * @tc.name testUint8ClampedArrayEveryOne029
     * @tc.desc Verify predicate let count visits 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        count = count + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3000
     * @tc.name testUint8ClampedArrayEveryOne030
     * @tc.desc Verify every visits all elements while the predicate accumulates a sum of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        sum = sum + e;
        return true;
      });
      expect(r).assertTrue();
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3100
     * @tc.name testUint8ClampedArrayEveryOne031
     * @tc.desc Verify every predicate e!==0 returns false, fails at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3200
     * @tc.name testUint8ClampedArrayEveryOne032
     * @tc.desc Verify every predicate e!==0 stops at index 0, invoked once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([0, 1, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(visits).assertEqual(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3300
     * @tc.name testUint8ClampedArrayEveryOne033
     * @tc.desc Verify every predicate e!==0 stops at index 1, invoked twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 0, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(visits).assertEqual(2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3400
     * @tc.name testUint8ClampedArrayEveryOne034
     * @tc.desc Verify every predicate e!==0 stops at index 2, invoked 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 0, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(visits).assertEqual(3);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3500
     * @tc.name testUint8ClampedArrayEveryOne035
     * @tc.desc Verify every predicate e!==0 false at last index, visits all 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(r).assertFalse();
      expect(visits).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3600
     * @tc.name testUint8ClampedArrayEveryOne036
     * @tc.desc Verify every predicate always true visits all 5, returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(visits).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3700
     * @tc.name testUint8ClampedArrayEveryOne037
     * @tc.desc Verify every always-false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3800
     * @tc.name testUint8ClampedArrayEveryOne038
     * @tc.desc Verify every stops at index 1 when predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lastIdx: int[] = [-1];
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        lastIdx[0] = i;
        return e < 2;
      });
      expect(lastIdx[0]).assertEqual(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_3900
     * @tc.name testUint8ClampedArrayEveryOne039
     * @tc.desc Verify every predicate e<30 stops at index 2, invoked 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: int[] = [];
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        indices.push(i);
        return e < 30;
      });
      expect(indices.length).assertEqual(3);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4000
     * @tc.name testUint8ClampedArrayEveryOne040
     * @tc.desc Verify every predicate e<3 returns false, fails at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e < 3);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4100
     * @tc.name testUint8ClampedArrayEveryOne041
     * @tc.desc Verify every single element [0] e!==0 returns false, invoked once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(r).assertFalse();
      expect(visits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4200
     * @tc.name testUint8ClampedArrayEveryOne042
     * @tc.desc Verify every single element [1] e!==0 returns true, invoked once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(r).assertTrue();
      expect(visits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4300
     * @tc.name testUint8ClampedArrayEveryOne043
     * @tc.desc Verify every empty array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4400
     * @tc.name testUint8ClampedArrayEveryOne044
     * @tc.desc Verify every empty array from [] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4500
     * @tc.name testUint8ClampedArrayEveryOne045
     * @tc.desc Verify every result is true for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4600
     * @tc.name testUint8ClampedArrayEveryOne046
     * @tc.desc Verify every empty ArrayBuffer 0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4700
     * @tc.name testUint8ClampedArrayEveryOne047
     * @tc.desc Verify every empty byteOffset=byteLength returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4, 0);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4800
     * @tc.name testUint8ClampedArrayEveryOne048
     * @tc.desc Verify every empty from() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = Uint8ClampedArray.from(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_4900
     * @tc.name testUint8ClampedArrayEveryOne049
     * @tc.desc Verify every on empty array returns true, predicate not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      const arr = new Uint8ClampedArray(0);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        thrown = true;
        return false;
      });
      expect(r).assertTrue();
      expect(thrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5000
     * @tc.name testUint8ClampedArrayEveryOne050
     * @tc.desc Verify every returns true for an empty array without invoking the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let calls: int = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls++;
        return true;
      });
      expect(r).assertTrue();
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5100
     * @tc.name testUint8ClampedArrayEveryOne051
     * @tc.desc Verify every result is true for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 100);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5200
     * @tc.name testUint8ClampedArrayEveryOne052
     * @tc.desc Verify every result is false for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5300
     * @tc.name testUint8ClampedArrayEveryOne053
     * @tc.desc Verify every result is true for array [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5400
     * @tc.name testUint8ClampedArrayEveryOne054
     * @tc.desc Verify every result is false for array [10, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5500
     * @tc.name testUint8ClampedArrayEveryOne055
     * @tc.desc Verify every result is true for array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5600
     * @tc.name testUint8ClampedArrayEveryOne056
     * @tc.desc Verify every returns true after fill for length-255 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      arr.fill(1);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5700
     * @tc.name testUint8ClampedArrayEveryOne057
     * @tc.desc Verify every returns true after fill for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      arr.fill(255);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5800
     * @tc.name testUint8ClampedArrayEveryOne058
     * @tc.desc Verify every returns true after fill for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr.fill(42);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_5900
     * @tc.name testUint8ClampedArrayEveryOne059
     * @tc.desc Verify every returns false after fill and single element mutation for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr.fill(42);
      arr[1023] = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 42);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6000
     * @tc.name testUint8ClampedArrayEveryOne060
     * @tc.desc Verify every returns true after fill for length-65535 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      arr.fill(7);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 7);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6100
     * @tc.name testUint8ClampedArrayEveryOne061
     * @tc.desc Verify 256 clamp=255 predicate ===255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 256, 256]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6200
     * @tc.name testUint8ClampedArrayEveryOne062
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1, -1, -1];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6300
     * @tc.name testUint8ClampedArrayEveryOne063
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, Number.NaN, Number.NaN];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6400
     * @tc.name testUint8ClampedArrayEveryOne064
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6500
     * @tc.name testUint8ClampedArrayEveryOne065
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6600
     * @tc.name testUint8ClampedArrayEveryOne066
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.5, 0.5, 0.5];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6700
     * @tc.name testUint8ClampedArrayEveryOne067
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.9, 0.9, 0.9];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6800
     * @tc.name testUint8ClampedArrayEveryOne068
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [127.5, 127.5];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_6900
     * @tc.name testUint8ClampedArrayEveryOne069
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [128.5, 128.5];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7000
     * @tc.name testUint8ClampedArrayEveryOne070
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1e9, 1e9];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7100
     * @tc.name testUint8ClampedArrayEveryOne071
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1e9, -1e9];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7200
     * @tc.name testUint8ClampedArrayEveryOne072
     * @tc.desc Verify every result is true for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.MAX_VALUE];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7300
     * @tc.name testUint8ClampedArrayEveryOne073
     * @tc.desc Verify every result is true for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7400
     * @tc.name testUint8ClampedArrayEveryOne074
     * @tc.desc Verify every result is true for array [255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7500
     * @tc.name testUint8ClampedArrayEveryOne075
     * @tc.desc Verify every result is true for array [0, 255, 0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0 || e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7600
     * @tc.name testUint8ClampedArrayEveryOne076
     * @tc.desc Verify every result is true for array [0xFF, 0xFF]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0xFF]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7700
     * @tc.name testUint8ClampedArrayEveryOne077
     * @tc.desc Verify every result is true for array [0o17, 0o17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17, 0o17]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 15);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7800
     * @tc.name testUint8ClampedArrayEveryOne078
     * @tc.desc Verify every result is true for array [0b1111, 0b1111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1111, 0b1111]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 15);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_7900
     * @tc.name testUint8ClampedArrayEveryOne079
     * @tc.desc Verify every result is true for array [1e2, 1e2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 1e2]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 100);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8000
     * @tc.name testUint8ClampedArrayEveryOne080
     * @tc.desc Verify every returns true when all elements > 0 for from(src) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8100
     * @tc.name testUint8ClampedArrayEveryOne081
     * @tc.desc Verify every returns true when all elements >= 10 for of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8200
     * @tc.name testUint8ClampedArrayEveryOne082
     * @tc.desc Verify every result is true for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8300
     * @tc.name testUint8ClampedArrayEveryOne083
     * @tc.desc Verify every result is true for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8400
     * @tc.name testUint8ClampedArrayEveryOne084
     * @tc.desc Verify new(buf,offset,length) every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8500
     * @tc.name testUint8ClampedArrayEveryOne085
     * @tc.desc Verify every returns true when all elements > 0 for subarray(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const r = sub.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8600
     * @tc.name testUint8ClampedArrayEveryOne086
     * @tc.desc Verify every returns true when all elements > 0 for slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = parent.slice(0, 3);
      const r = s.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8700
     * @tc.name testUint8ClampedArrayEveryOne087
     * @tc.desc Verify every invokes the predicate with indices 0 through 3 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: int[] = [];
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        indices.push(i);
        return true;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8800
     * @tc.name testUint8ClampedArrayEveryOne088
     * @tc.desc Verify every supplies index 4 for the final element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        lastIdx = i;
        return true;
      });
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_8900
     * @tc.name testUint8ClampedArrayEveryOne089
     * @tc.desc Verify every supplies index 0 for the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIdx: int = -1;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return true;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_9000
     * @tc.name testUint8ClampedArrayEveryOne090
     * @tc.desc Verify every callback index sequence is 0,1,2 and values are positive for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let idxSeq: string = '';
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        idxSeq += i.toString();
        return e > 0;
      });
      expect(r).assertTrue();
      expect(idxSeq).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_9100
     * @tc.name testUint8ClampedArrayEveryOne091
     * @tc.desc Verify every result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a === arr);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_9200
     * @tc.name testUint8ClampedArrayEveryOne092
     * @tc.desc Verify every result is true for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a.length === 5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_9300
     * @tc.name testUint8ClampedArrayEveryOne093
     * @tc.desc Verify every result is true for array [7, 7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => a[i] === e);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_ONE_9400
     * @tc.name testUint8ClampedArrayEveryOne094
     * @tc.desc Verify every callback receives the receiver and matching indexed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean =>
        a === arr && a[i] === e);
      expect(r).assertTrue();
    });
  });
}
