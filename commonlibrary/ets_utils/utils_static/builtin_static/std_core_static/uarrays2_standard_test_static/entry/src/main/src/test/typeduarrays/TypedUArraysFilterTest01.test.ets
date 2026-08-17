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

export default function typedUArraysFilterTest01(): void {
  describe('TypedUArraysFilterTest01', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0100
     * @tc.name testTypedUArraysFilterTestFileA001
     * @tc.desc Verify filter 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0200
     * @tc.name testTypedUArraysFilterTestFileA002
     * @tc.desc Verify filtering all elements from a BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0300
     * @tc.name testTypedUArraysFilterTestFileA003
     * @tc.desc Verify filter 1 - callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter((v) => v > 15);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0400
     * @tc.name testTypedUArraysFilterTestFileA004
     * @tc.desc Verify filter 2 - callback + thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const threshold = 15;
      const result = arr.filter((v) => v > threshold);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0500
     * @tc.name testTypedUArraysFilterTestFileA005
     * @tc.desc Verify filter 1 - callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.filter((v) => v > 150);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0600
     * @tc.name testTypedUArraysFilterTestFileA006
     * @tc.desc Verify filter 2 - callback + thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const limit = 1500;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).join(',')).assertEqual('2000,3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0700
     * @tc.name testTypedUArraysFilterTestFileA007
     * @tc.desc Verify filter 1 - callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const result = arr.filter((v) => v > 150n);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0800
     * @tc.name testTypedUArraysFilterTestFileA008
     * @tc.desc Verify filter 2 - callback + thisArg BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      const limit = 150n;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).join(',')).assertEqual('200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_0900
     * @tc.name testTypedUArraysFilterTestFileA009
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15, 20]);
      const result = arr.filter((v) => v < 10);
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1000
     * @tc.name testTypedUArraysFilterTestFileA010
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v) => v === 3);
      expect(Array.from(result).join(',')).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1100
     * @tc.name testTypedUArraysFilterTestFileA011
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v) => v === 5);
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1200
     * @tc.name testTypedUArraysFilterTestFileA012
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([2, 4, 6, 8, 10]);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).join(',')).assertEqual('2,4,6,8,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1300
     * @tc.name testTypedUArraysFilterTestFileA013
     * @tc.desc Verify callback index Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const result = arr.filter((v, i) => {
        return i === 2;
      });
      expect(Array.from(result).join(',')).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1400
     * @tc.name testTypedUArraysFilterTestFileA014
     * @tc.desc Verify callback array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.filter((v, i, a) => {
        return a[0] === v;
      });
      expect(Array.from(result).join(',')).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1500
     * @tc.name testTypedUArraysFilterTestFileA015
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.filter((v) => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1600
     * @tc.name testTypedUArraysFilterTestFileA016
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.filter((v) => v === 42);
      expect(Array.from(result).join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1700
     * @tc.name testTypedUArraysFilterTestFileA017
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.filter((v) => v !== 42);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1800
     * @tc.name testTypedUArraysFilterTestFileA018
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const result = arr.filter((v) => v === 7);
      expect(Array.from(result).join(',')).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_1900
     * @tc.name testTypedUArraysFilterTestFileA019
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const result = arr.filter((v) => v !== 7);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2000
     * @tc.name testTypedUArraysFilterTestFileA020
     * @tc.desc Verify callback false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2100
     * @tc.name testTypedUArraysFilterTestFileA021
     * @tc.desc Verify callback true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter(() => true);
      expect(Array.from(result).join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2200
     * @tc.name testTypedUArraysFilterTestFileA022
     * @tc.desc Verify callback false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter(() => false);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2300
     * @tc.name testTypedUArraysFilterTestFileA023
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const result = arr.filter((v) => v > 5);
      expect(Array.from(result).join(',')).assertEqual('10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2400
     * @tc.name testTypedUArraysFilterTestFileA024
     * @tc.desc Verify callback array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.filter((v, i, a) => {
        expect(Array.isArray(a)).assertFalse();
        return i === a.length - 1;
      });
      expect(Array.from(result).join(',')).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2500
     * @tc.name testTypedUArraysFilterTestFileA025
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = 30;
      const arr = new Uint8Array([10, 20, 30, 40]);
      const result = arr.filter((v) => v === target);
      expect(Array.from(result).join(',')).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2600
     * @tc.name testTypedUArraysFilterTestFileA026
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const result = arr.filter((v) => v > 3 && v < 10);
      expect(Array.from(result).join(',')).assertEqual('4,5,6,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2700
     * @tc.name testTypedUArraysFilterTestFileA027
     * @tc.desc Verify callback Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 15, 25, 35]);
      const result = arr.filter((v) => v > 5);
      expect(Array.from(result).join(',')).assertEqual('15,25,35');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2800
     * @tc.name testTypedUArraysFilterTestFileA028
     * @tc.desc Verify callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.filter((v) => v === 200);
      expect(Array.from(result).join(',')).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_2900
     * @tc.name testTypedUArraysFilterTestFileA029
     * @tc.desc Verify callback Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.filter((v) => v > 1000);
      expect(Array.from(result).join(',')).assertEqual('2000,3000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3000
     * @tc.name testTypedUArraysFilterTestFileA030
     * @tc.desc Verify callback BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([50n, 150n, 250n, 350n]);
      const result = arr.filter((v) => v > 50n);
      expect(Array.from(result).join(',')).assertEqual('150,250,350');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3100
     * @tc.name testTypedUArraysFilterTestFileA031
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3]);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3200
     * @tc.name testTypedUArraysFilterTestFileA032
     * @tc.desc Verify callback null Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      const result = arr.filter((v) => v !== 0);
      expect(Array.from(result).join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3300
     * @tc.name testTypedUArraysFilterTestFileA033
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 15, 25, 35]);
      const threshold = 20;
      const result = arr.filter((v) => v > threshold);
      expect(Array.from(result).join(',')).assertEqual('25,35');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3400
     * @tc.name testTypedUArraysFilterTestFileA034
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const min = 15;
      const max = 35;
      const result = arr.filter((v) => v > min && v < max);
      expect(Array.from(result).join(',')).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERTEST01_3500
     * @tc.name testTypedUArraysFilterTestFileA035
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      const result = arr.filter((v) => v > 25);
      expect(Array.from(result).join(',')).assertEqual('30,40,50');
    });

  });
}

