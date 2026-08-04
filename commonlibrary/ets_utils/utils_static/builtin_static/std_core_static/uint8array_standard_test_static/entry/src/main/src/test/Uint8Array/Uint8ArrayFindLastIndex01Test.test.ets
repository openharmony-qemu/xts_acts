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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

function findLastIndexWithFakePred(arr: Uint8Array, fakePred: ESObject): int {
  return arr.findLastIndex(fakePred as ESObject as (value: number, index: int, array: Uint8Array) => boolean);
}

export default function Uint8ArrayFindLastIndex01Test(): void {
  describe('Uint8ArrayFindLastIndex01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0100
     * @tc.name testUint8ArrayFindLastIndex001
     * @tc.desc Verify findLastIndex with undefined predicate throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      try {
        const r: int = arr.findLastIndex(undefined as (value: number, index: int, array: Uint8Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0200
     * @tc.name testUint8ArrayFindLastIndex002
     * @tc.desc Verify findLastIndex with 1 valid predicate parameter returns int result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: int = arr.findLastIndex((value: number): boolean => {
        return value > 8;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0300
     * @tc.name testUint8ArrayFindLastIndex003
     * @tc.desc Verify findLastIndex with null predicate throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      try {
        const r: int = arr.findLastIndex(null as (value: number, index: int, array: Uint8Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0400
     * @tc.name testUint8ArrayFindLastIndex004
     * @tc.desc Verify findLastIndex with undefined predicate throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      try {
        const r: int = arr.findLastIndex(undefined as ESObject as (value: number, index: int, array: Uint8Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0500
     * @tc.name testUint8ArrayFindLastIndex005
     * @tc.desc Verify findLastIndex with boolean literal predicate throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      try {
        const r: int = arr.findLastIndex(true as ESObject as (value: number, index: int, array: Uint8Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0600
     * @tc.name testUint8ArrayFindLastIndex006
     * @tc.desc Verify findLastIndex with arrow function predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 15);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0700
     * @tc.name testUint8ArrayFindLastIndex007
     * @tc.desc Verify findLastIndex with function expression predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const pred: (value: number, index: int, array: Uint8Array) => boolean = (value: number): boolean => {
        return value > 15;
      };
      const result: int = arr.findLastIndex(pred);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0800
     * @tc.name testUint8ArrayFindLastIndex008
     * @tc.desc Verify findLastIndex predicate only uses value parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_0900
     * @tc.name testUint8ArrayFindLastIndex009
     * @tc.desc Verify findLastIndex predicate uses all three parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return value > array[0];
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1000
     * @tc.name testUint8ArrayFindLastIndex010
     * @tc.desc Verify findLastIndex predicate uses value and index parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 10 && index > 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1100
     * @tc.name testUint8ArrayFindLastIndex011
     * @tc.desc Verify findLastIndex with element 0 (minimum value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 5, 10]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1200
     * @tc.name testUint8ArrayFindLastIndex012
     * @tc.desc Verify findLastIndex with element 255 (maximum value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1300
     * @tc.name testUint8ArrayFindLastIndex013
     * @tc.desc Verify findLastIndex with element 127 (middle value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 127);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1400
     * @tc.name testUint8ArrayFindLastIndex014
     * @tc.desc Verify findLastIndex with element 128 (0x80 boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 128, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 128);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1500
     * @tc.name testUint8ArrayFindLastIndex015
     * @tc.desc Verify findLastIndex with literal 256 (overflow truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1600
     * @tc.name testUint8ArrayFindLastIndex016
     * @tc.desc Verify findLastIndex with literal 257 (overflow truncates to 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([257, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1700
     * @tc.name testUint8ArrayFindLastIndex017
     * @tc.desc Verify findLastIndex with literal 511 (overflow truncates to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([511, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1800
     * @tc.name testUint8ArrayFindLastIndex018
     * @tc.desc Verify findLastIndex with literal 512 (overflow truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([512, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_1900
     * @tc.name testUint8ArrayFindLastIndex019
     * @tc.desc Verify findLastIndex with literal -1 (negative wraps to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-1, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2000
     * @tc.name testUint8ArrayFindLastIndex020
     * @tc.desc Verify findLastIndex with literal -2 (negative wraps to 254)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-2, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 254);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2100
     * @tc.name testUint8ArrayFindLastIndex021
     * @tc.desc Verify findLastIndex with literal -255 (negative wraps to 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-255, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2200
     * @tc.name testUint8ArrayFindLastIndex022
     * @tc.desc Verify findLastIndex with literal -256 (negative wraps to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-256, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2300
     * @tc.name testUint8ArrayFindLastIndex023
     * @tc.desc Verify findLastIndex with literal 0.5 (float truncates to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0.5, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2400
     * @tc.name testUint8ArrayFindLastIndex024
     * @tc.desc Verify findLastIndex with literal 255.9 (float truncates to 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255.9, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2500
     * @tc.name testUint8ArrayFindLastIndex025
     * @tc.desc Verify findLastIndex with literal 3.14 (float truncates to 3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3.14, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2600
     * @tc.name testUint8ArrayFindLastIndex026
     * @tc.desc Verify findLastIndex with greater than (>) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 30, 80]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2700
     * @tc.name testUint8ArrayFindLastIndex027
     * @tc.desc Verify findLastIndex with greater than or equal (>=) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 50, 80]);
      const result: int = arr.findLastIndex((value: number): boolean => value >= 50);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2800
     * @tc.name testUint8ArrayFindLastIndex028
     * @tc.desc Verify findLastIndex with less than (<) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 30, 80]);
      const result: int = arr.findLastIndex((value: number): boolean => value < 40);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_2900
     * @tc.name testUint8ArrayFindLastIndex029
     * @tc.desc Verify findLastIndex with less than or equal (<=) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 30, 50]);
      const result: int = arr.findLastIndex((value: number): boolean => value <= 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3000
     * @tc.name testUint8ArrayFindLastIndex030
     * @tc.desc Verify findLastIndex with strict equality (===) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3100
     * @tc.name testUint8ArrayFindLastIndex031
     * @tc.desc Verify findLastIndex with strict inequality (!==) comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([7, 7, 7, 8]);
      const result: int = arr.findLastIndex((value: number): boolean => value !== 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3200
     * @tc.name testUint8ArrayFindLastIndex032
     * @tc.desc Verify findLastIndex with modulo operation (value % N === 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6]);
      const result: int = arr.findLastIndex((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3300
     * @tc.name testUint8ArrayFindLastIndex033
     * @tc.desc Verify findLastIndex with compound condition (&&)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 100, 150, 200]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 50 && value < 180);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3400
     * @tc.name testUint8ArrayFindLastIndex034
     * @tc.desc Verify findLastIndex predicate matches index 0 (first element)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3500
     * @tc.name testUint8ArrayFindLastIndex035
     * @tc.desc Verify findLastIndex predicate matches index length-1 (last element)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3600
     * @tc.name testUint8ArrayFindLastIndex036
     * @tc.desc Verify findLastIndex predicate matches middle index (floor(length/2))
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3700
     * @tc.name testUint8ArrayFindLastIndex037
     * @tc.desc Verify findLastIndex predicate with index greater than threshold
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index > 2 && value > 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3800
     * @tc.name testUint8ArrayFindLastIndex038
     * @tc.desc Verify findLastIndex predicate with index less than threshold
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index < 3 && value > 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_3900
     * @tc.name testUint8ArrayFindLastIndex039
     * @tc.desc Verify findLastIndex predicate with index even/odd filtering
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index % 2 === 1 && value > 10);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4000
     * @tc.name testUint8ArrayFindLastIndex040
     * @tc.desc Verify findLastIndex predicate with index === 0 || index === length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => {
        return (index === 0 || index === 4) && value > 10;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4100
     * @tc.name testUint8ArrayFindLastIndex041
     * @tc.desc Verify findLastIndex predicate array parameter reference equals original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let matched: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        if (array === arr) {
          matched = true;
        }
        return false;
      });
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4200
     * @tc.name testUint8ArrayFindLastIndex042
     * @tc.desc Verify findLastIndex predicate reads array.length correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return index === array.length - 1 && value > 0;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4300
     * @tc.name testUint8ArrayFindLastIndex043
     * @tc.desc Verify findLastIndex predicate reads array[index] equals value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return value === array[index];
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4400
     * @tc.name testUint8ArrayFindLastIndex044
     * @tc.desc Verify findLastIndex predicate accesses BYTES_PER_ELEMENT constant
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return array.BYTES_PER_ELEMENT === 1 && value > 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4500
     * @tc.name testUint8ArrayFindLastIndex045
     * @tc.desc Verify findLastIndex predicate with hexadecimal literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 15, 20]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0x0F);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4600
     * @tc.name testUint8ArrayFindLastIndex046
     * @tc.desc Verify findLastIndex predicate with binary literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 3, 7]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0b0111);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4700
     * @tc.name testUint8ArrayFindLastIndex047
     * @tc.desc Verify findLastIndex predicate with octal literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0o17);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4800
     * @tc.name testUint8ArrayFindLastIndex048
     * @tc.desc Verify findLastIndex predicate with scientific notation literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 50, 100, 150]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 1e2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_4900
     * @tc.name testUint8ArrayFindLastIndex049
     * @tc.desc Verify findLastIndex predicate with arithmetic expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: int = arr.findLastIndex((value: number): boolean => {
        return value > 5 * 5;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5000
     * @tc.name testUint8ArrayFindLastIndex050
     * @tc.desc Verify findLastIndex predicate with 0xFF boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([200, 250, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0xFF);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5100
     * @tc.name testUint8ArrayFindLastIndex051
     * @tc.desc Verify findLastIndex on empty array returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5200
     * @tc.name testUint8ArrayFindLastIndex052
     * @tc.desc Verify findLastIndex on single element array when match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([42]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5300
     * @tc.name testUint8ArrayFindLastIndex053
     * @tc.desc Verify findLastIndex on single element array when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([42]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5400
     * @tc.name testUint8ArrayFindLastIndex054
     * @tc.desc Verify findLastIndex on two element array when last element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5500
     * @tc.name testUint8ArrayFindLastIndex055
     * @tc.desc Verify findLastIndex on two element array when only first element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5600
     * @tc.name testUint8ArrayFindLastIndex056
     * @tc.desc Verify findLastIndex when all elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 5, 5, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5700
     * @tc.name testUint8ArrayFindLastIndex057
     * @tc.desc Verify findLastIndex when no elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5800
     * @tc.name testUint8ArrayFindLastIndex058
     * @tc.desc Verify findLastIndex on 100 element array finds last matching element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      arr[99] = 99;
      const result: int = arr.findLastIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_5900
     * @tc.name testUint8ArrayFindLastIndex059
     * @tc.desc Verify findLastIndex on alternating pattern finds correct position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 1, 2, 2, 3, 3]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6000
     * @tc.name testUint8ArrayFindLastIndex060
     * @tc.desc Verify findLastIndex on all zero array returns -1 for non-zero predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 0, 0]);
      const result: int = arr.findLastIndex((value: number): boolean => value !== 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6100
     * @tc.name testUint8ArrayFindLastIndex061
     * @tc.desc Verify findLastIndex on all 255 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255, 255, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6200
     * @tc.name testUint8ArrayFindLastIndex062
     * @tc.desc Verify findLastIndex on mixed boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 126);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6300
     * @tc.name testUint8ArrayFindLastIndex063
     * @tc.desc Verify findLastIndex on [1,2,3,4,5] with value > 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6400
     * @tc.name testUint8ArrayFindLastIndex064
     * @tc.desc Verify findLastIndex on [1,2,3,4,5] with value > 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6500
     * @tc.name testUint8ArrayFindLastIndex065
     * @tc.desc Verify findLastIndex returns -1 when no element greater than 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value > 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6600
     * @tc.name testUint8ArrayFindLastIndex066
     * @tc.desc Verify findLastIndex on [10,20,10,20,10] finds last index of value 10 (index 4)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 10, 20, 10]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6700
     * @tc.name testUint8ArrayFindLastIndex067
     * @tc.desc Verify findLastIndex on [10,20,30,20,10] finds last index of value 20 (index 3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 20, 10]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX01_6800
     * @tc.name testUint8ArrayFindLastIndex068
     * @tc.desc Verify findLastIndex on [1,2,3,4,5] last even number is at index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(3);
    });
  });
}