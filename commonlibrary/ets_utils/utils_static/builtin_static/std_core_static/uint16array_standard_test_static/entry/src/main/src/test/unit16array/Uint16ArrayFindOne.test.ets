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

export default function uint16ArrayFind01Test(): void {
  describe('Uint16ArrayFind01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0100
     * @tc.name testUint16ArrayFind01_001
     * @tc.desc Verify index starts at 0 in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let firstIndex: int = -1;
      arr.find((value: number, index: int): boolean => {
        if (index === 0) {
          firstIndex = index;
        }
        return value > 100;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0200
     * @tc.name testUint16ArrayFind01_002
     * @tc.desc Verify index is 1 for second element in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let secondIndex: int = -1;
      arr.find((value: number, index: int): boolean => {
        if (index === 1) {
          secondIndex = index;
        }
        return value > 100;
      });
      expect(secondIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0300
     * @tc.name testUint16ArrayFind01_003
     * @tc.desc Verify index is 0 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(42);
      let capturedIndex: int = -1;
      arr.find((value: number, index: int): boolean => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0400
     * @tc.name testUint16ArrayFind01_004
     * @tc.desc Verify array[0] equals first element in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let firstVal: number = 0;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        firstVal = array[0];
        return true;
      });
      expect(firstVal).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0500
     * @tc.name testUint16ArrayFind01_005
     * @tc.desc Verify array[array.length-1] equals last element in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let lastVal: number = 0;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        lastVal = array[array.length - 1];
        return true;
      });
      expect(lastVal).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0600
     * @tc.name testUint16ArrayFind01_006
     * @tc.desc Verify find returns last element when only last matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0700
     * @tc.name testUint16ArrayFind01_007
     * @tc.desc Verify find returns first match when multiple elements satisfy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result = arr.find((value: number): boolean => value > 15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0800
     * @tc.name testUint16ArrayFind01_008
     * @tc.desc Verify find stops scanning after first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      let maxIndexChecked: number = -1;
      const result = arr.find((value: number, index: int): boolean => {
        maxIndexChecked = index;
        return value === 20;
      });
      expect(maxIndexChecked).assertEqual(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_0900
     * @tc.name testUint16ArrayFind01_009
     * @tc.desc Verify found return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 5);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1000
     * @tc.name testUint16ArrayFind01_010
     * @tc.desc Verify not found when all elements are 0 and searching >0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.find((value: number): boolean => value > 0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1100
     * @tc.name testUint16ArrayFind01_011
     * @tc.desc Verify not found when all elements are 65535 and searching >65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const result = arr.find((value: number): boolean => value > 65535);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1200
     * @tc.name testUint16ArrayFind01_012
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((): boolean => true);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1300
     * @tc.name testUint16ArrayFind01_013
     * @tc.desc Verify predicate false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((): boolean => false);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1400
     * @tc.name testUint16ArrayFind01_014
     * @tc.desc Verify find does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const before: string = arr.toString();
      arr.find((value: number): boolean => value > 15);
      const after: string = arr.toString();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1500
     * @tc.name testUint16ArrayFind01_015
     * @tc.desc Verify not found with single element and predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(42);
      const result = arr.find((value: number): boolean => value > 100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1600
     * @tc.name testUint16ArrayFind01_016
     * @tc.desc Verify callback throws TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let caught: boolean = false;
      try {
        arr.find((value: number): boolean => {
          throw new TypeError('type error in find');
        });
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1700
     * @tc.name testUint16ArrayFind01_017
     * @tc.desc Verify callback throws RangeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let caught: boolean = false;
      try {
        arr.find((value: number): boolean => {
          throw new RangeError('range error in find');
        });
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1800
     * @tc.name testUint16ArrayFind01_018
     * @tc.desc Verify find with modulo predicate returns first even
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 3, 5, 6, 7);
      const result = arr.find((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_1900
     * @tc.name testUint16ArrayFind01_019
     * @tc.desc Verify named arrow function as predicate works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let isGreaterThan15: (value: number, index: int, array: Uint16Array) => boolean = (value: number, index: int, array: Uint16Array): boolean => {
        return value > 15;
      };
      const result = arr.find(isGreaterThan15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2000
     * @tc.name testUint16ArrayFind01_020
     * @tc.desc Verify find with bitwise predicate returns matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 4, 8, 16);
      const result = arr.find((value: number): boolean => (value & 8) === 8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2100
     * @tc.name testUint16ArrayFind01_021
     * @tc.desc Verify callback can access external variable (threshold)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let threshold: int = 15;
      const result = arr.find((value: number): boolean => value > threshold);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2200
     * @tc.name testUint16ArrayFind01_022
     * @tc.desc Verify find returns first occurrence among duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 20, 30);
      let matchIndex: int = -1;
      const result = arr.find((value: number, index: int): boolean => {
        if (value === 20) {
          matchIndex = index;
          return true;
        }
        return false;
      });
      expect(matchIndex).assertEqual(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2300
     * @tc.name testUint16ArrayFind01_023
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 100, 200);
      let captured: number = 999;
      arr.find((value: number): boolean => {
        captured = value;
        return value === 0;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2400
     * @tc.name testUint16ArrayFind01_024
     * @tc.desc Verify value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 100, 200);
      let captured: number = 0;
      arr.find((value: number): boolean => {
        captured = value;
        return value > 50000;
      });
      expect(captured).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2500
     * @tc.name testUint16ArrayFind01_025
     * @tc.desc Verify value number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let typeOk: boolean = true;
      arr.find((value: number): boolean => {
        if (typeof value !== 'number') {
          typeOk = false;
        }
        return value > 100;
      });
      expect(typeOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2600
     * @tc.name testUint16ArrayFind01_026
     * @tc.desc Verify value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2700
     * @tc.name testUint16ArrayFind01_027
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let values: number[] = [];
      arr.find((value: number): boolean => {
        values.push(value);
        return values.length >= 3;
      });
      expect(values.at(0)).assertEqual(10);
      expect(values.at(1)).assertEqual(20);
      expect(values.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2800
     * @tc.name testUint16ArrayFind01_028
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65534);
      let captured: number = 0;
      arr.find((value: number): boolean => {
        captured = value;
        return value > 65530;
      });
      expect(captured).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_2900
     * @tc.name testUint16ArrayFind01_029
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15, 20);
      const result = arr.find((value: number): boolean => value === 15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3000
     * @tc.name testUint16ArrayFind01_030
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300);
      const result = arr.find((value: number, index: int): boolean => index === 2);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3100
     * @tc.name testUint16ArrayFind01_031
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let callCount: number = 0;
      arr.find((value: number, index: int): boolean => {
        callCount = index + 1;
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3200
     * @tc.name testUint16ArrayFind01_032
     * @tc.desc Verify index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result = arr.find((value: number, index: int): boolean => value > 15 && index > 1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3300
     * @tc.name testUint16ArrayFind01_033
     * @tc.desc Verify index number int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let indexType: string = '';
      arr.find((value: number, index: int): boolean => {
        indexType = typeof index;
        return true;
      });
      expect(indexType).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3400
     * @tc.name testUint16ArrayFind01_034
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      let matchIndex: number = -1;
      const result = arr.find((value: number, index: int): boolean => {
        if (value === 40) {
          matchIndex = index;
          return true;
        }
        return false;
      });
      expect(matchIndex).assertEqual(3);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3500
     * @tc.name testUint16ArrayFind01_035
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      let prevIndex: number = -1;
      let monotonic: boolean = true;
      arr.find((value: number, index: int): boolean => {
        if (index !== prevIndex + 1) {
          monotonic = false;
        }
        prevIndex = index;
        return false;
      });
      expect(monotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3600
     * @tc.name testUint16ArrayFind01_036
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let sameRef: boolean = false;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        sameRef = array === arr;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3700
     * @tc.name testUint16ArrayFind01_037
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let arrLen: number = 0;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        arrLen = array.length;
        return true;
      });
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3800
     * @tc.name testUint16ArrayFind01_038
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let sameAcrossCalls: boolean = true;
      let firstArray: Uint16Array | null = null;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        if (firstArray === null) {
          firstArray = array;
        } else if (firstArray !== array) {
          sameAcrossCalls = false;
        }
        return false;
      });
      expect(sameAcrossCalls).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_3900
     * @tc.name testUint16ArrayFind01_039
     * @tc.desc Verify array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let consistent: boolean = true;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        if (array[index] !== value) {
          consistent = false;
        }
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4000
     * @tc.name testUint16ArrayFind01_040
     * @tc.desc Verify array.BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let bpe: number = 0;
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        bpe = array.BYTES_PER_ELEMENT;
        return true;
      });
      expect(bpe).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4100
     * @tc.name testUint16ArrayFind01_041
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 100);
      const result = arr.find((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4200
     * @tc.name testUint16ArrayFind01_042
     * @tc.desc Verify 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0, 100);
      const result = arr.find((value: number): boolean => value === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4300
     * @tc.name testUint16ArrayFind01_043
     * @tc.desc Verify 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(32768, 100, 200);
      const result = arr.find((value: number): boolean => value === 32768);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4400
     * @tc.name testUint16ArrayFind01_044
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.find((value: number): boolean => value === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4500
     * @tc.name testUint16ArrayFind01_045
     * @tc.desc Verify find returns the first element when all values are greater than 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4600
     * @tc.name testUint16ArrayFind01_046
     * @tc.desc Verify find returns 42 from a single-element matching array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(42);
      const result = arr.find((value: number): boolean => value === 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4700
     * @tc.name testUint16ArrayFind01_047
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4800
     * @tc.name testUint16ArrayFind01_048
     * @tc.desc Verify find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.find((value: number): boolean => true);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_4900
     * @tc.name testUint16ArrayFind01_049
     * @tc.desc Verify predicate false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value === value && value !== value);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5000
     * @tc.name testUint16ArrayFind01_050
     * @tc.desc Verify Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const markerError = new Error('find error');
      try {
        arr.find((value: number): boolean => {
          throw markerError;
        });
        expect().assertFail();
      } catch (e) {
        expect(e).assertEqual(markerError);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5100
     * @tc.name testUint16ArrayFind01_051
     * @tc.desc Verify single-element array with element 0 works with find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const result = arr.find((value: number): boolean => value >= 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5200
     * @tc.name testUint16ArrayFind01_052
     * @tc.desc Verify single-element array with element 65535 works with find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const result = arr.find((value: number): boolean => value === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5300
     * @tc.name testUint16ArrayFind01_053
     * @tc.desc Verify find returns second element of length-2 array when it matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200);
      const result = arr.find((value: number): boolean => value > 150);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5400
     * @tc.name testUint16ArrayFind01_054
     * @tc.desc Verify callback exception stops find at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      let callCount: int = 0;
      const markerError = new Error('stop at index 2');
      try {
        arr.find((value: number, index: int): boolean => {
          callCount++;
          if (index === 2) {
            throw markerError;
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e).assertEqual(markerError);
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5500
     * @tc.name testUint16ArrayFind01_055
     * @tc.desc Verify callback side effect captures the first value before throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let sideEffect: number = 0;
      let callCount: int = 0;
      const markerError = new Error('side effect');
      try {
        arr.find((value: number): boolean => {
          callCount++;
          sideEffect = value;
          throw markerError;
        });
        expect().assertFail();
      } catch (e) {
        expect(e).assertEqual(markerError);
        expect(sideEffect).assertEqual(10);
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5600
     * @tc.name testUint16ArrayFind01_056
     * @tc.desc Verify negative value (-1) wraps around to 65535 and can be found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = -1;
      const result = arr.find((value: number): boolean => value === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5700
     * @tc.name testUint16ArrayFind01_057
     * @tc.desc Verify overflow value (65536) wraps around to 0 and can be found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      const result = arr.find((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5800
     * @tc.name testUint16ArrayFind01_058
     * @tc.desc Verify find checks all four elements before matching value 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      let count: number = 0;
      const result = arr.find((value: number): boolean => {
        count++;
        return value > 35;
      });
      expect(count).assertEqual(4);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_5900
     * @tc.name testUint16ArrayFind01_059
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const before: string = arr.toString();
      arr.find((value: number): boolean => value > 15);
      const after: string = arr.toString();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6000
     * @tc.name testUint16ArrayFind01_060
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const beforeLen: number = arr.length;
      arr.find((value: number): boolean => value > 15);
      expect(arr.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6100
     * @tc.name testUint16ArrayFind01_061
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Uint16Array): boolean => {
        if (index === 0) {
          array[0] = 99;
        }
        return value > 100;
      });
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6200
     * @tc.name testUint16ArrayFind01_062
     * @tc.desc Verify find visits values 10, 20, and 30 before matching 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let foundValues: number[] = [];
      arr.find((value: number): boolean => {
        foundValues.push(value);
        return value > 25;
      });
      expect(foundValues.length).assertEqual(3);
      expect(foundValues.at(0)).assertEqual(10);
      expect(foundValues.at(1)).assertEqual(20);
      expect(foundValues.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6300
     * @tc.name testUint16ArrayFind01_063
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6400
     * @tc.name testUint16ArrayFind01_064
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      let called: boolean = false;
      const result = arr.find((value: number): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6500
     * @tc.name testUint16ArrayFind01_065
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      let maxIndexChecked: number = -1;
      const result = arr.find((value: number, index: int): boolean => {
        maxIndexChecked = index;
        return value === 20;
      });
      expect(maxIndexChecked).assertEqual(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6600
     * @tc.name testUint16ArrayFind01_066
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr[0] = 42;
      const result = arr.find((value: number): boolean => value !== 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6700
     * @tc.name testUint16ArrayFind01_067
     * @tc.desc Verify find returns the first matching duplicate value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 20, 30);
      const result = arr.find((value: number): boolean => value === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6800
     * @tc.name testUint16ArrayFind01_068
     * @tc.desc Verify find returns 7 from an array containing only duplicate 7 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7, 7);
      const result = arr.find((value: number): boolean => value === 7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_6900
     * @tc.name testUint16ArrayFind01_069
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 3.14;
      const result = arr.find((value: number): boolean => value === 3);
      expect(result).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_7000
     * @tc.name testUint16ArrayFind01_070
     * @tc.desc Verify find returns the middle element when it matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.find((value: number): boolean => value === 30);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_7100
     * @tc.name testUint16ArrayFind01_071
     * @tc.desc Verify find call count is exactly 1 when first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      let callCount: number = 0;
      const result = arr.find((value: number): boolean => {
        callCount++;
        return value === 10;
      });
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_7200
     * @tc.name testUint16ArrayFind01_072
     * @tc.desc Verify find call count equals array length when last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      let callCount: number = 0;
      const result = arr.find((value: number): boolean => {
        callCount++;
        return value === 40;
      });
      expect(callCount).assertEqual(4);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND01_7300
     * @tc.name testUint16ArrayFind01_073
     * @tc.desc Verify find works with array.indexOf in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFind01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20);
      const result = arr.find((value: number, index: int, array: Uint16Array): boolean => {
        return array.indexOf(value) !== index;
      });
      expect(result).assertEqual(20);
    });

  });
}
