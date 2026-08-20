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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayOverviewTest03(): void {
  describe('Int16ArrayOverviewTest03', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0100
     * @tc.name testInt16ArrayOverviewTestThree001
     * @tc.desc Int16Array.of sequential fill 32768 then reverse yields $_get -32768 at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.fill(32768);
      arr.reverse();
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = -32768;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = -32768;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0200
     * @tc.name testInt16ArrayOverviewTestThree002
     * @tc.desc Verify Int16Array.of, $_get, reverse chained nested operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 30, 20);
      arr.reverse();
      arr.sort();
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0300
     * @tc.name testInt16ArrayOverviewTestThree003
     * @tc.desc Int16Array.of copyWithin then fill 32768 over range yields $_get 0 as -32768 and index 1 as 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2, 4).fill(32768, 0, 1);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 4;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0400
     * @tc.name testInt16ArrayOverviewTestThree004
     * @tc.desc Verify Int16Array.of, fill, subarray buffer sharing semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Int16Array.of(10, 20, 30);
      const child = parent.subarray(0, 2);
      const returned = child.fill(32768);
      expect(returned).assertEqual(child);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0500
     * @tc.name testInt16ArrayOverviewTestThree005
     * @tc.desc Verify new Int16Array, Int16Array.of, $_set callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const external = new Int16Array(3);
      arr.forEach((v: number, i: int, _a: Int16Array): void => {
        external.$_set(i, v + 32768);
      });
      let actualValue0: number = external.$_get(0);
      let expectedValue0: int = -32758;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0600
     * @tc.name testInt16ArrayOverviewTestThree006
     * @tc.desc Verify Int16Array.of, $_get, map callback external state mutation 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      let callCount: int = 0;
      const result = arr.map((v: number, _i: int, _a: Int16Array): number => {
        callCount = callCount + 1;
        return 32768;
      });
      expect(callCount).assertEqual(3);
      let actualValue0: number = result.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0700
     * @tc.name testInt16ArrayOverviewTestThree007
     * @tc.desc Verify Int16Array.of, filter callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let visited: int = 0;
      const result = arr.filter((_v: number, _i: int, _a: Int16Array): boolean => {
        visited = visited + 1;
        return true;
      });
      expect(visited).assertEqual(3);
      let actualValue0: int = result.length;
      let expectedValue0: int = 3;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0800
     * @tc.name testInt16ArrayOverviewTestThree008
     * @tc.desc Verify Int16Array.of, sort callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      arr.sort((a: number, b: number): int => {
        return (a - b).toInt();
      });
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 10;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 30;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_0900
     * @tc.name testInt16ArrayOverviewTestThree009
     * @tc.desc Verify Int16Array.of, find callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let checked: int = 0;
      const found = arr.find((v: number, _i: int, _a: Int16Array): boolean => {
        checked = checked + 1;
        return v > 15;
      });
      expect(found).assertEqual(20);
      expect(checked).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1000
     * @tc.name testInt16ArrayOverviewTestThree010
     * @tc.desc Verify Int16Array.of, every callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let inspected: int = 0;
      const result = arr.every((_v: number, _i: int, _a: Int16Array): boolean => {
        inspected = inspected + 1;
        return false;
      });
      expect(result).assertFalse();
      expect(inspected).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1100
     * @tc.name testInt16ArrayOverviewTestThree011
     * @tc.desc Verify Int16Array.of, some callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let tested: int = 0;
      const result = arr.some((_v: number, _i: int, _a: Int16Array): boolean => {
        tested = tested + 1;
        return true;
      });
      expect(result).assertTrue();
      expect(tested).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1200
     * @tc.name testInt16ArrayOverviewTestThree012
     * @tc.desc Verify Int16Array.of callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const external: Array<number> = [];
      const total = arr.reduce<number>((prev: number, cv: number, _ci: int, _a: Int16Array): number => {
        external.push(cv);
        return prev + cv;
      }, 0.0);
      expect(total).assertEqual(60.0);
      let actualValue0: int = external.length;
      let expectedValue0: int = 3;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1300
     * @tc.name testInt16ArrayOverviewTestThree013
     * @tc.desc new Int16Array set with FixedArray 32768.0 1.0 -32769.0 truncates $_get to -32768 1 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      const source: FixedArray<number> = [32768.0, 1.0, -32769.0];
      arr.set(source);
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = -32768;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 32767;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1400
     * @tc.name testInt16ArrayOverviewTestThree014
     * @tc.desc Verify Int16Array.of, $_set, forEach callback external state mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const snapshot: Array<number> = [];
      arr.forEach((v: number, i: int, _a: Int16Array): void => {
        snapshot.push(v);
        arr.$_set(i, 99);
      });
      let actualValue0: number = snapshot[0];
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = snapshot[1];
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = snapshot[2];
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1500
     * @tc.name testInt16ArrayOverviewTestThree015
     * @tc.desc Int16Array.of $_set at negative index -1 with 32768 throws RangeError leaves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(-1, 32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1600
     * @tc.name testInt16ArrayOverviewTestThree016
     * @tc.desc Int16Array.of $_set at index equal to length 2 with 32768 throws RangeError leaves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(arr.length, 32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 10;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 20;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1700
     * @tc.name testInt16ArrayOverviewTestThree017
     * @tc.desc Verify Int16Array.of $_set at length+1 with 32768 throws RangeError length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(arr.length + 1, 32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue0: int = arr.length;
      let expectedValue0: int = 2;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1800
     * @tc.name testInt16ArrayOverviewTestThree018
     * @tc.desc Verify with(out-of-range index, 32768) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.with(arr.length, 32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_1900
     * @tc.name testInt16ArrayOverviewTestThree019
     * @tc.desc Verify set(out-of-range insertPos) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      try {
        arr.set(3, 32768);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2000
     * @tc.name testInt16ArrayOverviewTestThree020
     * @tc.desc Verify set(source, offset) throws RangeError when exceeding target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      const src = Int16Array.of(10, 20);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2100
     * @tc.name testInt16ArrayOverviewTestThree021
     * @tc.desc Verify at(length) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      const result = arr.at(arr.length);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2200
     * @tc.name testInt16ArrayOverviewTestThree022
     * @tc.desc Verify new Int16Array, some empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      const result = empty.some((_v: number, _i: int, _a: Int16Array): boolean => true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2300
     * @tc.name testInt16ArrayOverviewTestThree023
     * @tc.desc Verify new Int16Array, reduce empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      try {
        empty.reduce((_prev: number, _cv: number, _ci: int, _a: Int16Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2400
     * @tc.name testInt16ArrayOverviewTestThree024
     * @tc.desc Verify new Int16Array, reduceRight empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      try {
        empty.reduceRight((_prev: number, _cv: number, _ci: int, _a: Int16Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2500
     * @tc.name testInt16ArrayOverviewTestThree025
     * @tc.desc Verify new Int16Array, map empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      const result = empty.map((_v: number, _i: int, _a: Int16Array): number => 32768);
      let actualValue0: int = result.length;
      let expectedValue0: int = 0;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2600
     * @tc.name testInt16ArrayOverviewTestThree026
     * @tc.desc Verify empty Int16Array find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      const result = empty.find((_v: number, _i: int, _a: Int16Array): boolean => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2700
     * @tc.name testInt16ArrayOverviewTestThree027
     * @tc.desc Verify empty Int16Array findLast throws Error when no element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      try {
        empty.findLast((_v: number, _i: int, _a: Int16Array): boolean => true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2800
     * @tc.name testInt16ArrayOverviewTestThree028
     * @tc.desc Verify new Int16Array, findLastIndex empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      const result = empty.findLastIndex((_v: number, _i: int, _a: Int16Array): boolean => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_2900
     * @tc.name testInt16ArrayOverviewTestThree029
     * @tc.desc Verify new Int16Array, indexOf empty array behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Int16Array();
      let actualValue0: int = empty.indexOf(0);
      let expectedValue0: int = -1;
      expect(actualValue0).assertEqual(expectedValue0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3000
     * @tc.name testInt16ArrayOverviewTestThree030
     * @tc.desc Verify find callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.find((_v: number, _i: int, _a: Int16Array): boolean => {
          throw new TypeError('find error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3100
     * @tc.name testInt16ArrayOverviewTestThree031
     * @tc.desc Verify map callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.map((_v: number, _i: int, _a: Int16Array): number => {
          throw new TypeError('map error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3200
     * @tc.name testInt16ArrayOverviewTestThree032
     * @tc.desc Verify forEach callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.forEach((_v: number, _i: int, _a: Int16Array): void => {
          throw new TypeError('forEach error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3300
     * @tc.name testInt16ArrayOverviewTestThree033
     * @tc.desc Verify filter callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.filter((_v: number, _i: int, _a: Int16Array): boolean => {
          throw new TypeError('filter error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3400
     * @tc.name testInt16ArrayOverviewTestThree034
     * @tc.desc Verify reduce callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.reduce<number>((_prev: number, _cv: number, _ci: int, _a: Int16Array): number => {
          throw new TypeError('reduce error');
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3500
     * @tc.name testInt16ArrayOverviewTestThree035
     * @tc.desc Verify sort callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      try {
        arr.sort((_a: number, _b: number): int => {
          throw new TypeError('sort error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3600
     * @tc.name testInt16ArrayOverviewTestThree036
     * @tc.desc Verify some callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.some((_v: number, _i: int, _a: Int16Array): boolean => {
          throw new TypeError('some error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3700
     * @tc.name testInt16ArrayOverviewTestThree037
     * @tc.desc Verify every callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.every((_v: number, _i: int, _a: Int16Array): boolean => {
          throw new TypeError('every error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3800
     * @tc.name testInt16ArrayOverviewTestThree038
     * @tc.desc Verify 1-byte ArrayBuffer new Int16Array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      try {
        new Int16Array(buf);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_3900
     * @tc.name testInt16ArrayOverviewTestThree039
     * @tc.desc Verify original array modification after toReversed does not affect reversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const reversed = arr.toReversed();
      arr.$_set(0, 32768);
      let actualValue: number = reversed.$_get(2);
      let expectedValue: int = 10;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4000
     * @tc.name testInt16ArrayOverviewTestThree040
     * @tc.desc Verify toSorted copy modification does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      const sorted = arr.toSorted();
      sorted.$_set(0, 32768);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 10;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4100
     * @tc.name testInt16ArrayOverviewTestThree041
     * @tc.desc Verify toSorted leaves original element order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(30, 10, 20);
      const sorted = arr.toSorted();
      let actualValue0: number = arr.$_get(0);
      let expectedValue0: int = 30;
      expect(actualValue0).assertEqual(expectedValue0);
      let actualValue1: number = arr.$_get(1);
      let expectedValue1: int = 10;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(2);
      let expectedValue2: int = 20;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4200
     * @tc.name testInt16ArrayOverviewTestThree042
     * @tc.desc Verify new Int16Array with huge length bound throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hugeLength: number = 1.7976931348623157e308;
      try {
        new Int16Array(hugeLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4300
     * @tc.name testInt16ArrayOverviewTestThree043
     * @tc.desc Verify $_set(0, 0x8000) then $_get wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      arr.$_set(0, 0x8000);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4400
     * @tc.name testInt16ArrayOverviewTestThree044
     * @tc.desc Verify fill(0x8000) sets all elements to -32768 via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.fill(0x8000);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -32768;
      expect(resultValue).assertEqual(expectedValue);
      let index2Value: number = arr.$_get(2);
      let expectedIndex2Value: int = -32768;
      expect(index2Value).assertEqual(expectedIndex2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4500
     * @tc.name testInt16ArrayOverviewTestThree045
     * @tc.desc Verify Int16Array.from FixedArray NaN/Infinity maps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: number[] = [Number.NaN, Number.POSITIVE_INFINITY];
      const arr = Int16Array.from(source);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
      let index1Value: number = arr.$_get(1);
      let expectedIndex1Value: int = 0;
      expect(index1Value).assertEqual(expectedIndex1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4600
     * @tc.name testInt16ArrayOverviewTestThree046
     * @tc.desc Verify new Int16Array(ArrayBuffer(0), 0, hugeLen) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let len: int = 2147483647;
        let _arr: Int16Array = new Int16Array(buf, 0 as int, len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4700
     * @tc.name testInt16ArrayOverviewTestThree047
     * @tc.desc Verify $_set(length, value) throws RangeError for out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 20;
      expect(resultValue).assertEqual(expectedValue);
      let arrLengthValue: int = arr.length;
      let expectedArrLengthValue: int = 2;
      expect(arrLengthValue).assertEqual(expectedArrLengthValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4800
     * @tc.name testInt16ArrayOverviewTestThree048
     * @tc.desc Verify $_set(length+1, value) far OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(3, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
      let index1Value: number = arr.$_get(1);
      let expectedIndex1Value: int = 20;
      expect(index1Value).assertEqual(expectedIndex1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_4900
     * @tc.name testInt16ArrayOverviewTestThree049
     * @tc.desc Verify $_set(2147483647, value) huge OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5000
     * @tc.name testInt16ArrayOverviewTestThree050
     * @tc.desc Verify with(2147483647, value) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = Int16Array.of(10, 20);
        arr.with(2147483647, 30);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5100
     * @tc.name testInt16ArrayOverviewTestThree051
     * @tc.desc Verify set(FixedArray source exceeding length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Int16Array(2);
        const source: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        arr.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5200
     * @tc.name testInt16ArrayOverviewTestThree052
     * @tc.desc Verify set(Int16Array source exceeding length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Int16Array(2);
        arr.set(Int16Array.of(1, 2, 3), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5300
     * @tc.name testInt16ArrayOverviewTestThree053
     * @tc.desc Verify at(-length-1) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      expect(arr.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5400
     * @tc.name testInt16ArrayOverviewTestThree054
     * @tc.desc Verify copyWithin(negative target) clamps to 0 and copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      arr.copyWithin(-5, 2);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 30;
      expect(resultValue).assertEqual(expectedValue);
      let index1Value: number = arr.$_get(1);
      let expectedIndex1Value: int = 40;
      expect(index1Value).assertEqual(expectedIndex1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5500
     * @tc.name testInt16ArrayOverviewTestThree055
     * @tc.desc Verify empty Int16Array reduce without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Int16Array();
        arr.reduce((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5600
     * @tc.name testInt16ArrayOverviewTestThree056
     * @tc.desc Verify empty Int16Array reduceRight without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Int16Array();
        arr.reduceRight((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5700
     * @tc.name testInt16ArrayOverviewTestThree057
     * @tc.desc Verify includes(NaN) returns false on Int16Array of zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 10);
      let resultValue: boolean = arr.includes(Number.NaN);
      expect(resultValue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5800
     * @tc.name testInt16ArrayOverviewTestThree058
     * @tc.desc Verify indexOf(NaN) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 10, 32767);
      let resultValue: number = arr.indexOf(Number.NaN);
      let expectedValue: int = -1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_5900
     * @tc.name testInt16ArrayOverviewTestThree059
     * @tc.desc Verify lastIndexOf(NaN) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(32767, 10, 0);
      let resultValue: number = arr.lastIndexOf(Number.NaN);
      let expectedValue: int = -1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6000
     * @tc.name testInt16ArrayOverviewTestThree060
     * @tc.desc Verify includes(-0) returns true for element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 10);
      let resultValue: boolean = arr.includes(-0);
      expect(resultValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6100
     * @tc.name testInt16ArrayOverviewTestThree061
     * @tc.desc Verify findIndex callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = Int16Array.of(10, 20);
        arr.findIndex((_v: number, _i: int, _a: Int16Array): boolean => {
          throw new TypeError('findIndex-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6200
     * @tc.name testInt16ArrayOverviewTestThree062
     * @tc.desc Verify reduceRight callback thrown TypeError is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = Int16Array.of(10, 20);
        arr.reduceRight((_prev: number, _cur: number, _idx: int, _a: Int16Array): number => {
          throw new TypeError('reduceRight-error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6300
     * @tc.name testInt16ArrayOverviewTestThree063
     * @tc.desc Verify new Int16Array(4) byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(4 as int);
      let resultValue: int = arr.byteOffset;
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6400
     * @tc.name testInt16ArrayOverviewTestThree064
     * @tc.desc Verify new Int16Array(buf, offset, length) space shortage throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(2);
        const triggerArr: Int16Array = new Int16Array(buf, 0 as int, 2 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6500
     * @tc.name testInt16ArrayOverviewTestThree065
     * @tc.desc Verify new Int16Array(empty Set) constructs length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<Number> = new Set<Number>();
      const arr: Int16Array = new Int16Array(source);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6600
     * @tc.name testInt16ArrayOverviewTestThree066
     * @tc.desc Verify $_set(0, 100) stores value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(2);
      arr.$_set(0, 100);
      let actualElement: number = arr.$_get(0);
      let expectedElement: int = 100;
      expect(actualElement).assertEqual(expectedElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6700
     * @tc.name testInt16ArrayOverviewTestThree067
     * @tc.desc Verify findLast matched value typeof is number in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 0x7fff, 50);
      const result = arr.findLast((v: number, _i: int, _a: Int16Array) => v > 100);
      let actualType: string = typeof result;
      let expectedType: string = 'short';
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6800
     * @tc.name testInt16ArrayOverviewTestThree068
     * @tc.desc Verify findLast unmatched result throws Error when no element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      try {
        arr.findLast((v: number, _i: int, _a: Int16Array) => v > 40000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_6900
     * @tc.name testInt16ArrayOverviewTestThree069
     * @tc.desc Verify findLast finds positive after 0x8000 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0x8000, 100);
      const result = arr.findLast((v: number, _i: int, _a: Int16Array) => v > 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7000
     * @tc.name testInt16ArrayOverviewTestThree070
     * @tc.desc Verify findLast callback index reaches 0 then throws Error when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      let lastIndex: int = -1;
      try {
        arr.findLast((_v: number, i: int, _a: Int16Array) => {
          lastIndex = i;
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7100
     * @tc.name testInt16ArrayOverviewTestThree071
     * @tc.desc Verify findLastIndex returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const result = arr.findLastIndex((v: number, _i: int, _a: Int16Array) => v > 40000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7200
     * @tc.name testInt16ArrayOverviewTestThree072
     * @tc.desc Verify findLastIndex on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      const result = arr.findLastIndex((v: number, _i: int, _a: Int16Array) => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7300
     * @tc.name testInt16ArrayOverviewTestThree073
     * @tc.desc Verify findLastIndex array arg is same Int16Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      let capturedArray: Int16Array | undefined = undefined;
      arr.findLastIndex((_v: number, _i: int, a: Int16Array) => {
        capturedArray = a;
        return false;
      });
      expect(capturedArray).assertEqual(arr as object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7400
     * @tc.name testInt16ArrayOverviewTestThree074
     * @tc.desc Verify lastIndexOf finds -32768 from 0x8000 truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0, -32768);
      let actualIndex: int = arr.lastIndexOf(-32768);
      let expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7500
     * @tc.name testInt16ArrayOverviewTestThree075
     * @tc.desc Verify lastIndexOf with fromIndex limits search range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 10, 30);
      let actualIndex: int = arr.lastIndexOf(10, 1 as int);
      let expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7600
     * @tc.name testInt16ArrayOverviewTestThree076
     * @tc.desc Verify lastIndexOf on single-element array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x7fff);
      let actualIndex: int = arr.lastIndexOf(32767);
      let expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7700
     * @tc.name testInt16ArrayOverviewTestThree077
     * @tc.desc Verify entries on single-element yields [0, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x7fff);
      let capturedIndex: int = -1;
      let capturedValue: number = 0;
      for (const e of arr.entries()) {
        capturedIndex = e[0];
        capturedValue = e[1];
      }
      expect(capturedIndex).assertEqual(0);
      expect(capturedValue).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7800
     * @tc.name testInt16ArrayOverviewTestThree078
     * @tc.desc Verify entries multi-element yields ordered [index,value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0x7fff, 50);
      let indices: Array<int> = [];
      let values: Array<number> = [];
      for (const e of arr.entries()) {
        indices.push(e[0]);
        values.push(e[1]);
      }
      let actualFirstIndex: int = indices[0];
      let expectedFirstIndex: int = 0;
      expect(actualFirstIndex).assertEqual(expectedFirstIndex);
      let actualSecondIndex: int = indices[1];
      let expectedSecondIndex: int = 1;
      expect(actualSecondIndex).assertEqual(expectedSecondIndex);
      let actualThirdIndex: int = indices[2];
      let expectedThirdIndex: int = 2;
      expect(actualThirdIndex).assertEqual(expectedThirdIndex);
      let actualSecondValue: number = values[1];
      let expectedSecondValue: int = 32767;
      expect(actualSecondValue).assertEqual(expectedSecondValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_7900
     * @tc.name testInt16ArrayOverviewTestThree079
     * @tc.desc Verify entries iterator can be traversed independently twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20);
      let firstRunCount: int = 0;
      for (const _e of arr.entries()) {
        firstRunCount++;
      }
      let secondRunCount: int = 0;
      for (const _e of arr.entries()) {
        secondRunCount++;
      }
      expect(firstRunCount).assertEqual(2);
      expect(secondRunCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_8000
     * @tc.name testInt16ArrayOverviewTestThree080
     * @tc.desc Verify keys on single-element yields index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x7fff);
      let captured: int = -1;
      for (const k of arr.keys()) {
        captured = k;
      }
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_8100
     * @tc.name testInt16ArrayOverviewTestThree081
     * @tc.desc Verify keys multi-element yields ascending indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0x7fff, 50);
      let keys: Array<int> = [];
      for (const k of arr.keys()) {
        keys.push(k);
      }
      let actualFirstKey: int = keys[0];
      let expectedFirstKey: int = 0;
      expect(actualFirstKey).assertEqual(expectedFirstKey);
      let actualSecondKey: int = keys[1];
      let expectedSecondKey: int = 1;
      expect(actualSecondKey).assertEqual(expectedSecondKey);
      let actualThirdKey: int = keys[2];
      let expectedThirdKey: int = 2;
      expect(actualThirdKey).assertEqual(expectedThirdKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_8200
     * @tc.name testInt16ArrayOverviewTestThree082
     * @tc.desc Verify values on single-element yields the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x7fff);
      let captured: number = 0;
      for (const v of arr.values()) {
        captured = v;
      }
      expect(captured).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_8300
     * @tc.name testInt16ArrayOverviewTestThree083
     * @tc.desc Verify values multi-element yields ordered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0x7fff, 50);
      let vals: Array<number> = [];
      for (const v of arr.values()) {
        vals.push(v);
      }
      let actualSecondValue: number = vals[1];
      let expectedSecondValue: int = 32767;
      expect(actualSecondValue).assertEqual(expectedSecondValue);
      let actualThirdValue: number = vals[2];
      let expectedThirdValue: int = 50;
      expect(actualThirdValue).assertEqual(expectedThirdValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_THREE_8400
     * @tc.name testInt16ArrayOverviewTestThree084
     * @tc.desc Verify default $_iterator on single-element yields value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x7fff);
      let captured: number = 0;
      for (const v of arr) {
        captured = v;
      }
      expect(captured).assertEqual(32767);
    });
  });
}
