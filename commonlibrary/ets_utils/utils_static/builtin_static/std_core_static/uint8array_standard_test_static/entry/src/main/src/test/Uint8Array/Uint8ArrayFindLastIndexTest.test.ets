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

interface CounterState {
  count: int;
}

export default function Uint8ArrayFindLastIndexTest(): void {
  describe('Uint8ArrayFindLastIndexTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0100
     * @tc.name testUint8ArrayFindLastIndex001
     * @tc.desc Verify findLastIndex with normal predicate parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: int = arr.findLastIndex((value: number): boolean => value === 2);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0200
     * @tc.name testUint8ArrayFindLastIndex002
     * @tc.desc Verify callback always returns true, all elements match, return last element index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findLastIndex((value: number): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0300
     * @tc.name testUint8ArrayFindLastIndex003
     * @tc.desc Verify callback always returns false, no elements match, return -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findLastIndex((value: number): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0400
     * @tc.name testUint8ArrayFindLastIndex004
     * @tc.desc Verify callback matches value===0, array contains 0 value, return last 0 index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 0, 2);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0500
     * @tc.name testUint8ArrayFindLastIndex005
     * @tc.desc Verify callback matches value===255, array contains 255 value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 0, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0600
     * @tc.name testUint8ArrayFindLastIndex006
     * @tc.desc Verify callback matches value>100, array contains multiple values greater than 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(50, 150, 200, 30);
      const result: int = arr.findLastIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0700
     * @tc.name testUint8ArrayFindLastIndex007
     * @tc.desc Verify callback matches value<50, array contains multiple values less than 50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 60, 20, 80);
      const result: int = arr.findLastIndex((value: number): boolean => value < 50);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0800
     * @tc.name testUint8ArrayFindLastIndex008
     * @tc.desc Verify callback matches value>=128, array contains 128 and 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value >= 128);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_0900
     * @tc.name testUint8ArrayFindLastIndex009
     * @tc.desc Verify callback matches value<=127, array contains 0 and 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 127, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value <= 127);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1000
     * @tc.name testUint8ArrayFindLastIndex010
     * @tc.desc Verify callback matches value%2===0 for even numbers
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1100
     * @tc.name testUint8ArrayFindLastIndex011
     * @tc.desc Verify callback matches value%2!==0 for odd numbers
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4, 5, 6);
      const result: int = arr.findLastIndex((value: number): boolean => value % 2 !== 0);
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1200
     * @tc.name testUint8ArrayFindLastIndex012
     * @tc.desc Verify callback matches index===length-1 for tail element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === arr.length - 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1300
     * @tc.name testUint8ArrayFindLastIndex013
     * @tc.desc Verify callback matches index===0 for head element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1400
     * @tc.name testUint8ArrayFindLastIndex014
     * @tc.desc Verify callback matches index%2===0 for even indices, multiple hits
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1500
     * @tc.name testUint8ArrayFindLastIndex015
     * @tc.desc Verify callback matches index===2 for specific index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1600
     * @tc.name testUint8ArrayFindLastIndex016
     * @tc.desc Verify callback matches index>=3, return largest index meeting condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index >= 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1700
     * @tc.name testUint8ArrayFindLastIndex017
     * @tc.desc Verify callback matches index<2, return largest index meeting condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index < 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1800
     * @tc.name testUint8ArrayFindLastIndex018
     * @tc.desc Verify callback matches index>3, return largest index meeting condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index > 3);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_1900
     * @tc.name testUint8ArrayFindLastIndex019
     * @tc.desc Verify callback matches index===length-2 for second to last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => index === arr.length - 2);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2000
     * @tc.name testUint8ArrayFindLastIndex020
     * @tc.desc Verify callback uses array parameter to access array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return index === array.length - 1;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2100
     * @tc.name testUint8ArrayFindLastIndex021
     * @tc.desc Verify callback uses array parameter to access array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        const firstVal: number = array.at(0)!;
        return value > firstVal;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2200
     * @tc.name testUint8ArrayFindLastIndex022
     * @tc.desc Verify callback uses array parameter to compare with first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15, 20, 25);
      const result: int = arr.findLastIndex((value: number, index: int, array: Uint8Array): boolean => {
        return value === array.at(0);
      });
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2300
     * @tc.name testUint8ArrayFindLastIndex023
     * @tc.desc Verify callback uses both value and index parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 2 && index > 2;
      });
      expect(result).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2400
     * @tc.name testUint8ArrayFindLastIndex024
     * @tc.desc Verify findLastIndex with two elements, only second matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const result: int = arr.findLastIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2500
     * @tc.name testUint8ArrayFindLastIndex025
     * @tc.desc Verify findLastIndex with three elements, first and second match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 1, 2);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2600
     * @tc.name testUint8ArrayFindLastIndex026
     * @tc.desc Verify findLastIndex with four elements, all match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 3, 3, 3);
      const result: int = arr.findLastIndex((value: number): boolean => value === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2700
     * @tc.name testUint8ArrayFindLastIndex027
     * @tc.desc Verify findLastIndex with four elements, only last matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number): boolean => value === 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2800
     * @tc.name testUint8ArrayFindLastIndex028
     * @tc.desc Verify findLastIndex with four elements, only first matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_2900
     * @tc.name testUint8ArrayFindLastIndex029
     * @tc.desc Verify return value type when matching tail element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 6, 9);
      const result: int = arr.findLastIndex((value: number): boolean => value === 9);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3000
     * @tc.name testUint8ArrayFindLastIndex030
     * @tc.desc Verify return value type when matching head element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 6, 9);
      const result: int = arr.findLastIndex((value: number): boolean => value === 3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3100
     * @tc.name testUint8ArrayFindLastIndex031
     * @tc.desc Verify return value type when no match found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 6, 9);
      const result: int = arr.findLastIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3200
     * @tc.name testUint8ArrayFindLastIndex032
     * @tc.desc Verify return value type for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3300
     * @tc.name testUint8ArrayFindLastIndex033
     * @tc.desc Verify return value type for ArrayBuffer constructed array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8Array = new Uint8Array(buffer);
      arr[0] = 10;
      arr[3] = 40;
      const result: int = arr.findLastIndex((value: number): boolean => value === 40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3400
     * @tc.name testUint8ArrayFindLastIndex034
     * @tc.desc Verify return value is -1 when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: int = arr.findLastIndex((value: number): boolean => value === 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3500
     * @tc.name testUint8ArrayFindLastIndex035
     * @tc.desc Verify return value is last index when all elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 5, 5, 5);
      const result: int = arr.findLastIndex((value: number): boolean => value === 5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3600
     * @tc.name testUint8ArrayFindLastIndex036
     * @tc.desc Verify return value is correct index when only one element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number): boolean => value === 3);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3700
     * @tc.name testUint8ArrayFindLastIndex037
     * @tc.desc Verify callback throws Error, error is propagated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.findLastIndex((value: number): boolean => {
          throw new Error('Test error');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3800
     * @tc.name testUint8ArrayFindLastIndex038
     * @tc.desc Verify error occurs at first element, callback throws on first call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        arr.findLastIndex((value: number): boolean => {
          callCount++;
          if (callCount === 1) {
            throw new Error('Error at first element');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(callCount).assertEqual(1);
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_3900
     * @tc.name testUint8ArrayFindLastIndex039
     * @tc.desc Verify error occurs at last element, callback throws on last call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        arr.findLastIndex((value: number): boolean => {
          callCount++;
          if (callCount === 3) {
            throw new Error('Error at last element');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(callCount).assertEqual(3);
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4000
     * @tc.name testUint8ArrayFindLastIndex040
     * @tc.desc Verify error occurs at middle element, callback throws on middle call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      try {
        arr.findLastIndex((value: number): boolean => {
          callCount++;
          if (callCount === 3) {
            throw new Error('Error at middle element');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(callCount).assertEqual(3);
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4100
     * @tc.name testUint8ArrayFindLastIndex041
     * @tc.desc Verify error occurs after match found, callback throws after finding match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      try {
        arr.findLastIndex((value: number): boolean => {
          callCount++;
          if (callCount === 4) {
            throw new Error('Error after match');
          }
          return value === 2;
        });
        expect().assertFail();
      } catch (e) {
        expect(callCount).assertEqual(4);
        expect((e as Error).name).assertEqual('Error');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4200
     * @tc.name testUint8ArrayFindLastIndex042
     * @tc.desc Verify findLastIndex with large array (length=1000)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr[999] = 77;
      const result: int = arr.findLastIndex((value: number): boolean => value === 77);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4300
     * @tc.name testUint8ArrayFindLastIndex043
     * @tc.desc Verify findLastIndex with large array (length=1000), middle element match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr[500] = 88;
      const result: int = arr.findLastIndex((value: number): boolean => value === 88);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4400
     * @tc.name testUint8ArrayFindLastIndex044
     * @tc.desc Verify findLastIndex with large array (length=1000), first element match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr[0] = 55;
      const result: int = arr.findLastIndex((value: number): boolean => value === 55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4500
     * @tc.name testUint8ArrayFindLastIndex045
     * @tc.desc Verify findLastIndex with large array (length=1000), no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4600
     * @tc.name testUint8ArrayFindLastIndex046
     * @tc.desc Verify findLastIndex with large array (length=1000), multiple matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr[100] = 33;
      arr[500] = 33;
      arr[900] = 33;
      const result: int = arr.findLastIndex((value: number): boolean => value === 33);
      expect(result).assertEqual(900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4700
     * @tc.name testUint8ArrayFindLastIndex047
     * @tc.desc Verify findLastIndex with large array (length=1000), all elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr.fill(1);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(999);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4800
     * @tc.name testUint8ArrayFindLastIndex048
     * @tc.desc Verify findLastIndex with element value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_4900
     * @tc.name testUint8ArrayFindLastIndex049
     * @tc.desc Verify findLastIndex with element value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5000
     * @tc.name testUint8ArrayFindLastIndex050
     * @tc.desc Verify findLastIndex with element value 127 (midpoint-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 127, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value === 127);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5100
     * @tc.name testUint8ArrayFindLastIndex051
     * @tc.desc Verify findLastIndex with element value 1 (minimum positive)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findLastIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5200
     * @tc.name testUint8ArrayFindLastIndex052
     * @tc.desc Verify findLastIndex with element value 254 (maximum-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(253, 254, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value === 254);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5300
     * @tc.name testUint8ArrayFindLastIndex053
     * @tc.desc Verify findLastIndex with element value 10 (decimal)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15);
      const result: int = arr.findLastIndex((value: number): boolean => value === 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5400
     * @tc.name testUint8ArrayFindLastIndex054
     * @tc.desc Verify findLastIndex with element value 0x0A (hexadecimal 10)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 0x0A, 15);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0x0A);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5500
     * @tc.name testUint8ArrayFindLastIndex055
     * @tc.desc Verify findLastIndex does not modify array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const original: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findLastIndex((value: number): boolean => value === 3);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5600
     * @tc.name testUint8ArrayFindLastIndex056
     * @tc.desc Verify findLastIndex does not modify array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const originalLength: int = arr.length;
      arr.findLastIndex((value: number): boolean => value === 3);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5700
     * @tc.name testUint8ArrayFindLastIndex057
     * @tc.desc Verify findLastIndex does not modify array when no match found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const original: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findLastIndex((value: number): boolean => value === 10);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5800
     * @tc.name testUint8ArrayFindLastIndex058
     * @tc.desc Verify findLastIndex does not modify array when all elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 5, 5, 5, 5);
      const original: Uint8Array = Uint8Array.of(5, 5, 5, 5, 5);
      arr.findLastIndex((value: number): boolean => value === 5);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_5900
     * @tc.name testUint8ArrayFindLastIndex059
     * @tc.desc Verify findLastIndex does not modify array when callback throws error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const original: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      try {
        arr.findLastIndex((value: number): boolean => {
          throw new Error('Test error');
        });
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6000
     * @tc.name testUint8ArrayFindLastIndex060
     * @tc.desc Verify findLastIndex does not modify array when callback modifies local variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const original: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let counter: int = 0;
      arr.findLastIndex((value: number): boolean => {
        counter++;
        return value === 3;
      });
      expect(counter).assertEqual(3);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6100
     * @tc.name testUint8ArrayFindLastIndex061
     * @tc.desc Verify findLastIndex does not modify array when callback modifies external object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const original: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const state: CounterState = { count: 0 };
      arr.findLastIndex((value: number): boolean => {
        state.count++;
        return value === 3;
      });
      expect(state.count).assertEqual(3);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(original.at(i));
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6200
     * @tc.name testUint8ArrayFindLastIndex062
     * @tc.desc Verify findLastIndex with Uint8Array.of() constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findLastIndex((value: number): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6300
     * @tc.name testUint8ArrayFindLastIndex063
     * @tc.desc Verify findLastIndex with new Uint8Array(length) constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5);
      arr[0] = 10;
      arr[4] = 50;
      const result: int = arr.findLastIndex((value: number): boolean => value === 50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6400
     * @tc.name testUint8ArrayFindLastIndex064
     * @tc.desc Verify findLastIndex with Uint8Array.from() constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.from([1, 2, 3, 4, 5]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 3);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6500
     * @tc.name testUint8ArrayFindLastIndex065
     * @tc.desc Verify findLastIndex with Uint8Array.from() using string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.from([72.0, 101.0, 108.0, 108.0, 111.0]);
      const result: int = arr.findLastIndex((value: number): boolean => value === 108);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6600
     * @tc.name testUint8ArrayFindLastIndex066
     * @tc.desc Verify findLastIndex with hexadecimal literal 0x0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0, 0x1, 0x2);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6700
     * @tc.name testUint8ArrayFindLastIndex067
     * @tc.desc Verify findLastIndex with hexadecimal literal 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x00, 0x80, 0xFF);
      const result: int = arr.findLastIndex((value: number): boolean => value === 0xFF);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6800
     * @tc.name testUint8ArrayFindLastIndex068
     * @tc.desc Verify callback condition value===128 (midpoint value match)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      const result: int = arr.findLastIndex((value: number): boolean => value === 128);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_6900
     * @tc.name testUint8ArrayFindLastIndex069
     * @tc.desc Verify callback condition value!==0 (non-zero value match)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 5, 0, 10);
      const result: int = arr.findLastIndex((value: number): boolean => value !== 0);
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_7000
     * @tc.name testUint8ArrayFindLastIndex070
     * @tc.desc Verify callback condition value>arr[index+1] (compare with next element)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 4, 2, 5, 3);
      const result: int = arr.findLastIndex((value: number, index: int): boolean => {
        if (index < arr.length - 1) {
          const nextVal: number = arr.at(index + 1)!;
          return value > nextVal;
        }
        return false;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_INDEX_7100
     * @tc.name testUint8ArrayFindLastIndex071
     * @tc.desc Verify adjacent matches, consecutive i and i+1 both satisfy condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLastIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number): boolean => value > 2 && value < 5);
      expect(result).assertEqual(3);
    });

  });
}