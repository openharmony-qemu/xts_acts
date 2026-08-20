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

export default function int16ArrayFindTestFourTest(): void {
  describe('Int16ArrayFindTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0100
     * @tc.name testInt16ArrayFindTestFour001
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let acc: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        acc = acc + value;
        return false;
      });
      expect(acc).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0200
     * @tc.name testInt16ArrayFindTestFour002
     * @tc.desc Verify find predicate records values into external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let recorded: number[] = [];
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        recorded.push(value);
        return false;
      });
      let actual1: number = recorded[0];
      expect(actual1).assertEqual(100);
      let actual2: number = recorded[1];
      expect(actual2).assertEqual(200);
      let actual3: number = recorded[2];
      expect(actual3).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0300
     * @tc.name testInt16ArrayFindTestFour003
     * @tc.desc Verify find predicate records indices into external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      let indices: int[] = [];
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        indices.push(index);
        return false;
      });
      let actual1: number = indices[0];
      expect(actual1).assertEqual(0);
      let actual2: number = indices[1];
      expect(actual2).assertEqual(1);
      let actual3: number = indices[2];
      expect(actual3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0400
     * @tc.name testInt16ArrayFindTestFour004
     * @tc.desc Verify find predicate records index value map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33);
      let map: Map<int, number> = new Map<int, number>();
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        map.set(index, value);
        return false;
      });
      let actual1: number = map.get(0)!;
      expect(actual1).assertEqual(11);
      let actual2: number = map.get(1)!;
      expect(actual2).assertEqual(22);
      let actual3: number = map.get(2)!;
      expect(actual3).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0500
     * @tc.name testInt16ArrayFindTestFour005
     * @tc.desc Verify find predicate uses external boolean flag for early match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let shouldMatch: boolean = false;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          shouldMatch = true;
        }
        return shouldMatch;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0600
     * @tc.name testInt16ArrayFindTestFour006
     * @tc.desc Verify find predicate compares against external Int16Array baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(15, 25, 35);
      let baseline: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > baseline.$_get(index);
      });
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0700
     * @tc.name testInt16ArrayFindTestFour007
     * @tc.desc Verify find predicate appends value strings to external trace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let trace: string = '';
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        trace = trace + value.toString();
        return false;
      });
      expect(trace).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0800
     * @tc.name testInt16ArrayFindTestFour008
     * @tc.desc Verify find predicate mutates external array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 5, 5);
      let external: number[] = [0, 0, 0];
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        external[index] = value * 2;
        return false;
      });
      let actual1: number = external[0];
      expect(actual1).assertEqual(10);
      let actual2: number = external[1];
      expect(actual2).assertEqual(10);
      let actual3: number = external[2];
      expect(actual3).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_0900
     * @tc.name testInt16ArrayFindTestFour009
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
      let cnt: int = 0;
      let foundLarge: boolean = false;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        cnt = cnt + 1;
        foundLarge = value > 8;
        return foundLarge;
      });
      expect(result).assertEqual(9);
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1000
     * @tc.name testInt16ArrayFindTestFour010
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let visitOrder: int = 0;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        visitOrder = visitOrder + 1;
        return visitOrder % 2 === 0;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1100
     * @tc.name testInt16ArrayFindTestFour011
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 100, 50);
      let threshold: number = 99;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > threshold;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1200
     * @tc.name testInt16ArrayFindTestFour012
     * @tc.desc Verify find predicate matches value present in external Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let targets: Set<number> = new Set<number>();
      targets.add(3);
      targets.add(7);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return targets.has(value);
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1300
     * @tc.name testInt16ArrayFindTestFour013
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let visitCnt: int = 0;
      let lastVisitedValue: number = 0;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        visitCnt = visitCnt + 1;
        lastVisitedValue = value;
        return visitCnt === 2;
      });
      expect(result).assertEqual(20);
      expect(visitCnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1400
     * @tc.name testInt16ArrayFindTestFour014
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let state: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        state = value;
        return state > 1;
      });
      expect(state).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1500
     * @tc.name testInt16ArrayFindTestFour015
     * @tc.desc Verify predicate $_set 0 find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 0);
        }
        return value > 10;
      });
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1600
     * @tc.name testInt16ArrayFindTestFour016
     * @tc.desc Verify find predicate $_set current element then match later value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 99);
        }
        return value === 30;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1700
     * @tc.name testInt16ArrayFindTestFour017
     * @tc.desc Verify find predicate $_set next element without changing snapshot match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          array.$_set(0, 0);
        }
        return value === 30;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1800
     * @tc.name testInt16ArrayFindTestFour018
     * @tc.desc Verify find predicate fill zero reads live values, no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.fill(0);
        }
        return value > 25;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_1900
     * @tc.name testInt16ArrayFindTestFour019
     * @tc.desc Verify find predicate $_set then $_get confirms write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let writeConfirmed: boolean = false;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 99);
          writeConfirmed = array.$_get(1) === 99;
        }
        return false;
      });
      expect(writeConfirmed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2000
     * @tc.name testInt16ArrayFindTestFour020
     * @tc.desc Verify find predicate double $_set overwrites previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 50);
          array.$_set(2, 77);
        }
        return false;
      });
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2100
     * @tc.name testInt16ArrayFindTestFour021
     * @tc.desc Verify find predicate writes MIN -32768 while matching later value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        array.$_set(index, -32768);
        return value === 15;
      });
      expect(result).assertEqual(15);
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2200
     * @tc.name testInt16ArrayFindTestFour022
     * @tc.desc Verify find value parameter equals array $_get index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let allConsistent: boolean = true;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (value !== array.$_get(index)) {
          allConsistent = false;
        }
        return false;
      });
      expect(allConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2300
     * @tc.name testInt16ArrayFindTestFour023
     * @tc.desc Verify find predicate $_set modifies adjacent index plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          array.$_set(index + 1, 99);
        }
        return false;
      });
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2400
     * @tc.name testInt16ArrayFindTestFour024
     * @tc.desc Verify find predicate reverse still matches original snapshot value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.reverse();
        }
        return value === 20;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2500
     * @tc.name testInt16ArrayFindTestFour025
     * @tc.desc Verify find predicate copyWithin still matches original snapshot value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.copyWithin(0, 1, 2);
        }
        return value === 30;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2600
     * @tc.name testInt16ArrayFindTestFour026
     * @tc.desc Verify find predicate reads array length equals five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let capturedLen: int = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2700
     * @tc.name testInt16ArrayFindTestFour027
     * @tc.desc Verify fill then find non-filled value returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.fill(99);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value !== 99;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2800
     * @tc.name testInt16ArrayFindTestFour028
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.fill(-1);
      let allMinusOne: boolean = true;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (value !== -1) {
          allMinusOne = false;
        }
        return false;
      });
      expect(allMinusOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_2900
     * @tc.name testInt16ArrayFindTestFour029
     * @tc.desc Verify reverse then find first value greater than twenty five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.reverse();
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 25;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3000
     * @tc.name testInt16ArrayFindTestFour030
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 30);
      arr.sort();
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 25;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3100
     * @tc.name testInt16ArrayFindTestFour031
     * @tc.desc Verify subarray view find returns first matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 300, 200, 50);
      let sub: Int16Array = arr.subarray(1, 3);
      let result: number | undefined = sub.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3200
     * @tc.name testInt16ArrayFindTestFour032
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.copyWithin(0, 2, 4);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3300
     * @tc.name testInt16ArrayFindTestFour033
     * @tc.desc Verify find after set finds newly written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let source: Int16Array = Int16Array.of(99, 100);
      arr.set(source, 1);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3400
     * @tc.name testInt16ArrayFindTestFour034
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21, 14);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 10;
      });
      let actual1: int = arr.indexOf(found! as number);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3500
     * @tc.name testInt16ArrayFindTestFour035
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value % 3 === 0;
      });
      let actual1: boolean = arr.includes(found! as number);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3600
     * @tc.name testInt16ArrayFindTestFour036
     * @tc.desc Verify find result used with with method replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 20;
      });
      let replaced: Int16Array = arr.with(1, found! as number);
      let actual1: number = replaced.$_get(1);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3700
     * @tc.name testInt16ArrayFindTestFour037
     * @tc.desc Verify constructor fill reverse find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.fill(10).reverse();
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value !== 10;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3800
     * @tc.name testInt16ArrayFindTestFour038
     * @tc.desc Verify find from source Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 7, 11);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 5;
      });
      let source: number[] = [found! as number, 99];
      let newArr: Int16Array = Int16Array.from(source);
      let actual1: number = newArr.$_get(0);
      expect(actual1).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_3900
     * @tc.name testInt16ArrayFindTestFour039
     * @tc.desc Verify find then $_set modifies located position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.fill(0);
      arr.$_set(2, 99);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4000
     * @tc.name testInt16ArrayFindTestFour040
     * @tc.desc Verify find then $_set and $_get on found position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 20;
      });
      arr.$_set(1, 0);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4100
     * @tc.name testInt16ArrayFindTestFour041
     * @tc.desc Verify find find predicate Int16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int16Array = Int16Array.of(1, 2, 3);
      let inner: Int16Array = Int16Array.of(10, 20, 30);
      let matchFound: boolean = false;
      outer.find((value: number, index: int, array: Int16Array): boolean => {
        let innerResult: number | undefined = inner.find((iv: number, ii: int, ia: Int16Array): boolean => {
          return iv === value * 10;
        });
        if (innerResult !== undefined) {
          matchFound = true;
          return true;
        }
        return false;
      });
      expect(matchFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4200
     * @tc.name testInt16ArrayFindTestFour042
     * @tc.desc Verify find predicate calls findIndex on current array state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25);
      let capturedIdx: int = -1;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          capturedIdx = array.findIndex((v: number, i: int, a: Int16Array): boolean => {
            return v > 10;
          });
        }
        return false;
      });
      expect(capturedIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4300
     * @tc.name testInt16ArrayFindTestFour043
     * @tc.desc Verify find result drives second find comparison threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(10, 20, 30);
      let arr2: Int16Array = Int16Array.of(15, 25, 35);
      let found: number | undefined = arr1.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 15;
      });
      let result: number | undefined = arr2.find((value: number, index: int, array: Int16Array): boolean => {
        return value > (found! as number);
      });
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4400
     * @tc.name testInt16ArrayFindTestFour044
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sharedCnt: int = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        sharedCnt = sharedCnt + 1;
        return value > 10;
      });
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        sharedCnt = sharedCnt + 1;
        return value > 10;
      });
      expect(sharedCnt).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4500
     * @tc.name testInt16ArrayFindTestFour045
     * @tc.desc Verify find predicate uses includes on sibling value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return array.includes(value + 10);
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4600
     * @tc.name testInt16ArrayFindTestFour046
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
      let foundIdx: int = -1;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          foundIdx = array.indexOf(20);
        }
        return false;
      });
      expect(foundIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4700
     * @tc.name testInt16ArrayFindTestFour047
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let hasLarge: boolean = false;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          hasLarge = array.some((v: number, i: int, a: Int16Array): boolean => {
            return v > 35;
          });
        }
        return false;
      });
      expect(hasLarge).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4800
     * @tc.name testInt16ArrayFindTestFour048
     * @tc.desc Verify find external accumulator sum side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
      let allEven: boolean = false;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          allEven = array.every((v: number, i: int, a: Int16Array): boolean => {
            return v % 2 === 0;
          });
        }
        return false;
      });
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_4900
     * @tc.name testInt16ArrayFindTestFour049
     * @tc.desc Verify find result used as index into another Int16Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 50, 100);
      let target: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 100;
      });
      let idx: int = 2;
      let retrieved: number = target.$_get(idx);
      expect(retrieved).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5000
     * @tc.name testInt16ArrayFindTestFour050
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let secondResult: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          let inner: number | undefined = array.find((v: number, i: int, a: Int16Array): boolean => {
            return v > 3;
          });
          if (inner !== undefined) {
            secondResult = inner;
          }
        }
        return false;
      });
      expect(secondResult).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5100
     * @tc.name testInt16ArrayFindTestFour051
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 8;
      });
      let doubled: number = (found! as number) * 2;
      expect(doubled).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5200
     * @tc.name testInt16ArrayFindTestFour052
     * @tc.desc Verify find result is defined after successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let found: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return value > 5;
      });
      let fallback: number = found !== undefined ? (found! as number) : -1;
      expect(fallback).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5300
     * @tc.name testInt16ArrayFindTestFour053
     * @tc.desc Verify find predicate $_set overflow 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 32768);
        }
        return false;
      });
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5400
     * @tc.name testInt16ArrayFindTestFour054
     * @tc.desc Verify find predicate $_set underflow -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, -32769);
        }
        return false;
      });
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5500
     * @tc.name testInt16ArrayFindTestFour055
     * @tc.desc Verify find predicate $_set 65536 wraps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 65536);
        }
        return false;
      });
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5600
     * @tc.name testInt16ArrayFindTestFour056
     * @tc.desc Verify find predicate $_set NaN converts to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(3, Number.NaN);
        }
        return false;
      });
      let actual1: number = arr.$_get(3);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5700
     * @tc.name testInt16ArrayFindTestFour057
     * @tc.desc Verify find predicate $_set positive Infinity converts to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(4, Number.POSITIVE_INFINITY);
        }
        return false;
      });
      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5800
     * @tc.name testInt16ArrayFindTestFour058
     * @tc.desc Verify find predicate $_set negative Infinity converts to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(5, -Number.POSITIVE_INFINITY);
        }
        return false;
      });
      let actual1: number = arr.$_get(5);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_5900
     * @tc.name testInt16ArrayFindTestFour059
     * @tc.desc Verify find predicate $_set float 3.7 truncates to three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 3.7);
        }
        return false;
      });
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6000
     * @tc.name testInt16ArrayFindTestFour060
     * @tc.desc Verify find predicate $_set float -3.7 truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, -3.7);
        }
        return false;
      });
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6100
     * @tc.name testInt16ArrayFindTestFour061
     * @tc.desc Verify find predicate $_set 0xFFFF wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 0xffff);
        }
        return false;
      });
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6200
     * @tc.name testInt16ArrayFindTestFour062
     * @tc.desc Verify find predicate $_set 98304 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 98304);
        }
        return false;
      });
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6300
     * @tc.name testInt16ArrayFindTestFour063
     * @tc.desc Verify find shared ArrayBuffer view $_set via sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 4);
      let view2: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view1.$_set(3, 40);
      view1.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          view2.$_set(1, 99);
        }
        return false;
      });
      let actual1: number = view2.$_get(1);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6400
     * @tc.name testInt16ArrayFindTestFour064
     * @tc.desc Verify find parent view $_set visible on child offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int16Array = new Int16Array(buf, 0, 4);
      let child: Int16Array = new Int16Array(buf, 2, 2);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      parent.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 99);
        }
        return false;
      });
      let actual1: number = child.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6500
     * @tc.name testInt16ArrayFindTestFour065
     * @tc.desc Verify find child view $_set visible on parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int16Array = new Int16Array(buf, 0, 4);
      let child: Int16Array = new Int16Array(buf, 2, 2);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      child.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 88);
        }
        return false;
      });
      let actual1: number = parent.$_get(1);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6600
     * @tc.name testInt16ArrayFindTestFour066
     * @tc.desc Verify find multi-view shared buffer third view $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view1: Int16Array = new Int16Array(buf, 0, 3);
      let view2: Int16Array = new Int16Array(buf, 2, 2);
      let view3: Int16Array = new Int16Array(buf, 4, 2);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view1.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          view3.$_set(0, 77);
        }
        return false;
      });
      let actual1: number = view1.$_get(2);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6700
     * @tc.name testInt16ArrayFindTestFour067
     * @tc.desc Verify find Int16Array shared buffer modified via Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i16: Int16Array = new Int16Array(buf, 0, 2);
      let i8: Int8Array = new Int8Array(buf, 0, 4);
      i16.$_set(0, 0);
      i16.$_set(1, 0);
      i16.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          i8.$_set(0, 0x41 as byte);
          i8.$_set(1, 0x00 as byte);
        }
        return false;
      });
      let actual1: number = i16.$_get(0);
      expect(actual1).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6800
     * @tc.name testInt16ArrayFindTestFour068
     * @tc.desc Verify find shared buffer sibling modification visible later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 4);
      let view2: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 5);
      view1.$_set(1, 10);
      view1.$_set(2, 15);
      view1.$_set(3, 20);
      view1.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          view2.$_set(1, 99);
        }
        return false;
      });
      let result: number | undefined = view2.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_6900
     * @tc.name testInt16ArrayFindTestFour069
     * @tc.desc Verify find shared views remain consistent across reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 4);
      let view2: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view1.$_set(3, 40);
      let viewsMatch: boolean = true;
      view1.find((value: number, index: int, array: Int16Array): boolean => {
        if (view2.$_get(index) !== value) {
          viewsMatch = false;
        }
        return false;
      });
      expect(viewsMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_7000
     * @tc.name testInt16ArrayFindTestFour070
     * @tc.desc Verify find sibling view $_set is visible via current $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view1: Int16Array = new Int16Array(buf, 0, 3);
      let view2: Int16Array = new Int16Array(buf, 2, 2);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view1.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          view2.$_set(0, 55);
        }
        return false;
      });
      let actual1: number = view1.$_get(1);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_7100
     * @tc.name testInt16ArrayFindTestFour071
     * @tc.desc Verify subarray ( buffer) find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub: Int16Array = parent.subarray(1, 3);
      sub.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          parent.$_set(0, 0);
        }
        return false;
      });
      let actual1: number = parent.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_FOUR_7200
     * @tc.name testInt16ArrayFindTestFour072
     * @tc.desc Verify buffer view2 view1 find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 4);
      let view2: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view1.$_set(3, 40);
      view2.$_set(2, 77);
      let result: number | undefined = view1.find((value: number, index: int, array: Int16Array): boolean => {
        return value === 77;
      });
      expect(result).assertEqual(77);
    });
  });
}
