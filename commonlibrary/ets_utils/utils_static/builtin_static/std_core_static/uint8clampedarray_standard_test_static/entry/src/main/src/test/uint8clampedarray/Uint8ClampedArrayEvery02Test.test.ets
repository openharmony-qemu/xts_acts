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

export default function uint8ClampedArrayEvery02Test(): void {
  describe('uint8ClampedArrayEvery02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0100
     * @tc.name testUint8ClampedArrayEveryTwo001
     * @tc.desc Verify every result is true for array [0, 128, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 0 && e <= 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0200
     * @tc.name testUint8ClampedArrayEveryTwo002
     * @tc.desc Verify every integer elements Math.floor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => Math.floor(e) === e);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0300
     * @tc.name testUint8ClampedArrayEveryTwo003
     * @tc.desc Verify every invokes an always-true predicate once per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let calls: int = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls++;
        return true;
      });
      expect(r).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0400
     * @tc.name testUint8ClampedArrayEveryTwo004
     * @tc.desc Verify every stops after the first call when the predicate is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let calls: int = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls++;
        return false;
      });
      expect(r).assertFalse();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0500
     * @tc.name testUint8ClampedArrayEveryTwo005
     * @tc.desc Verify every true predicate strictEqual true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0600
     * @tc.name testUint8ClampedArrayEveryTwo006
     * @tc.desc Verify every false predicate strictEqual false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e !== 2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0700
     * @tc.name testUint8ClampedArrayEveryTwo007
     * @tc.desc Verify every true predicate assertTrue and false predicate assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      const r2 = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0800
     * @tc.name testUint8ClampedArrayEveryTwo008
     * @tc.desc Verify every true predicate returns true and array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_0900
     * @tc.name testUint8ClampedArrayEveryTwo009
     * @tc.desc Verify every element at arr[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1000
     * @tc.name testUint8ClampedArrayEveryTwo010
     * @tc.desc Verify every element at arr[1] equals 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1100
     * @tc.name testUint8ClampedArrayEveryTwo011
     * @tc.desc Verify every element at arr[2] equals 30 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1200
     * @tc.name testUint8ClampedArrayEveryTwo012
     * @tc.desc Verify every yields byteLength before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.byteLength;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1300
     * @tc.name testUint8ClampedArrayEveryTwo013
     * @tc.desc Verify every buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const buf = arr.buffer;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(r).assertTrue();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1400
     * @tc.name testUint8ClampedArrayEveryTwo014
     * @tc.desc Verify every false predicate preserves array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertFalse();
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1500
     * @tc.name testUint8ClampedArrayEveryTwo015
     * @tc.desc Verify every predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new Error('predicate fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1600
     * @tc.name testUint8ClampedArrayEveryTwo016
     * @tc.desc Verify every propagates TypeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new TypeError('bad type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1700
     * @tc.name testUint8ClampedArrayEveryTwo017
     * @tc.desc Verify every propagates RangeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new RangeError('out of range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1800
     * @tc.name testUint8ClampedArrayEveryTwo018
     * @tc.desc Verify every predicate stops on thrown Error after 1 visit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          visits = visits + 1;
          throw new Error('stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_1900
     * @tc.name testUint8ClampedArrayEveryTwo019
     * @tc.desc Verify every stops at index 1 with 2 visits when predicate throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          visits = visits + 1;
          if (i === 1) {
            throw new Error('stop at 1');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visits).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2000
     * @tc.name testUint8ClampedArrayEveryTwo020
     * @tc.desc Verify every predicate throws Error at index 3 after 4 visits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          visits = visits + 1;
          if (i === 3) {
            throw new Error('stop at 3');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visits).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2100
     * @tc.name testUint8ClampedArrayEveryTwo021
     * @tc.desc Verify every predicate throws Error preserves array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new Error('e');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2200
     * @tc.name testUint8ClampedArrayEveryTwo022
     * @tc.desc Verify every predicate throws Error on element 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 100, 3]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          if (e === 100) {
            throw new Error('hit 100');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2300
     * @tc.name testUint8ClampedArrayEveryTwo023
     * @tc.desc Verify every predicate returns false on element 0 without reaching 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0, 100]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        if (e === 100) {
          throw new Error('must not reach');
        }
        return e !== 0;
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2400
     * @tc.name testUint8ClampedArrayEveryTwo024
     * @tc.desc Verify every throws Error when predicate hits element 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 100, 0]);
      try {
        arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
          if (e === 100) {
            throw new Error('hit');
          }
          return e !== 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2500
     * @tc.name testUint8ClampedArrayEveryTwo025
     * @tc.desc Verify every repeated calls return equal results for e>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      const r2 = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2600
     * @tc.name testUint8ClampedArrayEveryTwo026
     * @tc.desc Verify every predicate nested every on second array e2>=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2, 3]);
      const arr2 = new Uint8ClampedArray([10, 20, 30]);
      const r = arr1.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        return arr2.every((e2: number, i2: int, a2: Uint8ClampedArray): boolean => e2 >= 10);
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2700
     * @tc.name testUint8ClampedArrayEveryTwo027
     * @tc.desc Verify nested every on same array via predicate's a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 1, 1]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        return a.every((e2: number, i2: int, a2: Uint8ClampedArray): boolean => e2 === 1);
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2800
     * @tc.name testUint8ClampedArrayEveryTwo028
     * @tc.desc Verify every result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let passed: boolean = false;
      if (arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0)) {
        passed = true;
      }
      expect(passed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_2900
     * @tc.name testUint8ClampedArrayEveryTwo029
     * @tc.desc Verify every true combined with length===3 short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > 0) && arr.length === 3;
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3000
     * @tc.name testUint8ClampedArrayEveryTwo030
     * @tc.desc Verify every returns false when the subarray predicate reaches zero at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visits: int = 0;
      const parent = new Uint8ClampedArray([1, 2, 0, 4, 5]);
      const sub = parent.subarray(0, 5);
      const r = sub.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        visits = visits + 1;
        return e !== 0;
      });
      expect(r).assertFalse();
      expect(visits).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3100
     * @tc.name testUint8ClampedArrayEveryTwo031
     * @tc.desc Verify every on empty subarray returns true (vacuous truth)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const sub = parent.subarray(1, 1);
      const r = sub.every((e: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3200
     * @tc.name testUint8ClampedArrayEveryTwo032
     * @tc.desc Verify every returns true when all elements >= 10 for from(src) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e >= 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3300
     * @tc.name testUint8ClampedArrayEveryTwo033
     * @tc.desc Verify every returns true when all elements === 5 for of(5, 5, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 5, 5);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3400
     * @tc.name testUint8ClampedArrayEveryTwo034
     * @tc.desc Verify every returns true when all elements equal fill value for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      arr.fill(42);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3500
     * @tc.name testUint8ClampedArrayEveryTwo035
     * @tc.desc Verify every predicate e===10 false after setting index 2 to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr.fill(10);
      arr[2] = 99;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3600
     * @tc.name testUint8ClampedArrayEveryTwo036
     * @tc.desc Verify every returns true and invokes the predicate once per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: int = 0;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls = calls + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(calls).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3700
     * @tc.name testUint8ClampedArrayEveryTwo037
     * @tc.desc Verify every predicate element greater than index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e > i);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3800
     * @tc.name testUint8ClampedArrayEveryTwo038
     * @tc.desc Verify every result is true for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => i === 0 || e >= a[i - 1]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_3900
     * @tc.name testUint8ClampedArrayEveryTwo039
     * @tc.desc Verify every visits all 1024 elements when predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: int = 0;
      const arr = new Uint8ClampedArray(1024);
      arr.fill(1);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls = calls + 1;
        return true;
      });
      expect(calls).assertEqual(1024);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4000
     * @tc.name testUint8ClampedArrayEveryTwo040
     * @tc.desc Verify every stops at 501 calls when predicate false on 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: int = 0;
      const arr = new Uint8ClampedArray(1024);
      arr.fill(1);
      arr[500] = 0;
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        calls = calls + 1;
        return e !== 0;
      });
      expect(calls).assertEqual(501);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4100
     * @tc.name testUint8ClampedArrayEveryTwo041
     * @tc.desc Verify every predicate true pushes all 4 indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seen: int[] = [];
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        seen.push(i);
        return true;
      });
      expect(seen.length).assertEqual(4);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4200
     * @tc.name testUint8ClampedArrayEveryTwo042
     * @tc.desc Verify every result is true for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => Math.max(e, 0) === e);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4300
     * @tc.name testUint8ClampedArrayEveryTwo043
     * @tc.desc Verify every result is true for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => Math.min(e, 255) === e);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4400
     * @tc.name testUint8ClampedArrayEveryTwo044
     * @tc.desc Verify every result is true for array [7, 7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === a[0]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4500
     * @tc.name testUint8ClampedArrayEveryTwo045
     * @tc.desc Verify every predicate e===0 for clamped -0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0, -0, 0];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4600
     * @tc.name testUint8ClampedArrayEveryTwo046
     * @tc.desc Verify predicate !== NaN (clamp NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, Number.NaN, 1];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => !isNaN(e));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4700
     * @tc.name testUint8ClampedArrayEveryTwo047
     * @tc.desc Verify every result is true for array [1, 2, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 255]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => isFinite(e));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4800
     * @tc.name testUint8ClampedArrayEveryTwo048
     * @tc.desc Verify every predicate Number.isInteger for clamped 1.5 2.5 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.5, 2.5, 3.5];
      const arr = new Uint8ClampedArray(src);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => Number.isInteger(e));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_4900
     * @tc.name testUint8ClampedArrayEveryTwo049
     * @tc.desc Verify every predicate e===0 or e===255 alternating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 255, 0, 255, 0]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => e === 0 || e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_5000
     * @tc.name testUint8ClampedArrayEveryTwo050
     * @tc.desc Verify every with parity-based predicate (odd index or multiple of 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 99, 20, 99, 30]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => i % 2 === 1 || e % 10 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_EVERY_TWO_5100
     * @tc.name testUint8ClampedArrayEveryTwo051
     * @tc.desc Verify every accepts boundary values 100 and interior values 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayEveryTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 50, 50, 50, 100]);
      const r = arr.every((e: number, i: int, a: Uint8ClampedArray): boolean => {
        if (i === 0 || i === a.length - 1) {
          return e === 100;
        }
        return e === 50;
      });
      expect(r).assertTrue();
    });
  });
}
