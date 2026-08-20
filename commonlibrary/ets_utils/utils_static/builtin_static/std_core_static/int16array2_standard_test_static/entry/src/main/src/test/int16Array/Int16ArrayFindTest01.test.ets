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

function matchTarget007(value: number, index: int, array: Int16Array): boolean {
  return value === 77;
}

interface DummyObj_038 {
  tag: number;
}

function isMultipleOf7(value: number): boolean {
  return value % 7 === 0;
}

export default function int16ArrayFindTestOneTest(): void {
  describe('Int16ArrayFindTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0100
     * @tc.name testInt16ArrayFindTestOne001
     * @tc.desc Verify find with single predicate returns first matching element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let result: number | undefined = arr.find((value: number): boolean => value > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0200
     * @tc.name testInt16ArrayFindTestOne002
     * @tc.desc Verify find with three-arg predicate matches value 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20, 25]);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 15,
      );
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0300
     * @tc.name testInt16ArrayFindTestOne003
     * @tc.desc Verify find with two-arg predicate matches index 3 value 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let result: number | undefined = arr.find((value: number, index: int): boolean => index === 3);
      expect(result).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0400
     * @tc.name testInt16ArrayFindTestOne004
     * @tc.desc Verify find with single-arg predicate matches first multiple of 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6, 8, 10]);
      let result: number | undefined = arr.find((value: number): boolean => value % 4 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0500
     * @tc.name testInt16ArrayFindTestOne005
     * @tc.desc Verify find with zero-arg predicate returns third element 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12, 15]);
      let callCount: number = 0;
      let result: number | undefined = arr.find((): boolean => {
        callCount++;
        return callCount === 3;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0600
     * @tc.name testInt16ArrayFindTestOne006
     * @tc.desc Verify find with named function predicate returns 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 77, 44, 55]);
      let result: number | undefined = arr.find(matchTarget007);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0700
     * @tc.name testInt16ArrayFindTestOne007
     * @tc.desc Verify find predicate receives value with typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42, 84, 126]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return typeof value === 'number';
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0800
     * @tc.name testInt16ArrayFindTestOne008
     * @tc.desc Verify find predicate value equals first element 55 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([55, 66, 77, 88]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return index === 0 && value === 55;
      });
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_0900
     * @tc.name testInt16ArrayFindTestOne009
     * @tc.desc Verify find predicate value equals last element 28 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21, 28]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return index === 3 && value === 28;
      });
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1000
     * @tc.name testInt16ArrayFindTestOne010
     * @tc.desc Verify find predicate index is 0 on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99, 88, 77, 66]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return index === 0;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1100
     * @tc.name testInt16ArrayFindTestOne011
     * @tc.desc Verify find predicate array parameter is Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([111, 222, 333]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return array instanceof Int16Array;
      });
      expect(result).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1200
     * @tc.name testInt16ArrayFindTestOne012
     * @tc.desc Verify find predicate array parameter is same object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([44, 55, 66]);
      let captured: Int16Array | null = null;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        captured = array;
        return true;
      });
      let actual1: boolean = captured === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1300
     * @tc.name testInt16ArrayFindTestOne013
     * @tc.desc Verify find predicate array.length matches original length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([8, 16, 24, 32]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return array.length === 4;
      });
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1400
     * @tc.name testInt16ArrayFindTestOne014
     * @tc.desc Verify find single-arg predicate without index still finds 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 18, 27, 36]);
      let result: number | undefined = arr.find((value: number): boolean => value === 18);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1500
     * @tc.name testInt16ArrayFindTestOne015
     * @tc.desc Verify find predicate uses array.$_get for cross-check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 8, 16]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return index > 0 && array.$_get(index - 1) === 4;
      });
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1600
     * @tc.name testInt16ArrayFindTestOne016
     * @tc.desc Verify find always-true predicate returns first element 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([35, 70, 105, 140]);
      let result: number | undefined = arr.find((value: number): boolean => true);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1700
     * @tc.name testInt16ArrayFindTestOne017
     * @tc.desc Verify find always-false predicate returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([17, 34, 51, 68]);
      let result: number | undefined = arr.find((value: number): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1800
     * @tc.name testInt16ArrayFindTestOne018
     * @tc.desc Verify find predicate returning true finds first element 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([45, 90, 135, 180]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_1900
     * @tc.name testInt16ArrayFindTestOne019
     * @tc.desc Verify find predicate returning object-derived boolean finds 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([29, 58, 87, 116]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        let obj: DummyObj_038 = { tag: 1 };
        return obj.tag === 1;
      });
      expect(result).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2000
     * @tc.name testInt16ArrayFindTestOne020
     * @tc.desc Verify find returns undefined when predicate always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([37, 74, 111, 148]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2100
     * @tc.name testInt16ArrayFindTestOne021
     * @tc.desc Verify find short-circuits after matching value 15 at callCount 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25, 35, 45]);
      let callCount: number = 0;
      let result: number | undefined = arr.find((value: number): boolean => {
        callCount++;
        return value === 15;
      });
      expect(result).assertEqual(15);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2200
     * @tc.name testInt16ArrayFindTestOne022
     * @tc.desc Verify find with less-than predicate returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([20, 15, 10, 5, 0]);
      let result: number | undefined = arr.find((value: number): boolean => value < 12);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2300
     * @tc.name testInt16ArrayFindTestOne023
     * @tc.desc Verify find with less-or-equal predicate returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([30, 25, 20, 15, 10]);
      let result: number | undefined = arr.find((value: number): boolean => value <= 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2400
     * @tc.name testInt16ArrayFindTestOne024
     * @tc.desc Verify find with not-equal predicate returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42, 42, 42, 99, 42]);
      let result: number | undefined = arr.find((value: number): boolean => value !== 42);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2500
     * @tc.name testInt16ArrayFindTestOne025
     * @tc.desc Verify find with odd modulo predicate returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6, 7, 10]);
      let result: number | undefined = arr.find((value: number): boolean => value % 2 !== 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2600
     * @tc.name testInt16ArrayFindTestOne026
     * @tc.desc Verify find with bitwise-and predicate returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number | undefined = arr.find((value: number): boolean => (value & 4) !== 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2700
     * @tc.name testInt16ArrayFindTestOne027
     * @tc.desc Verify find with range and-predicate returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([6, 12, 18, 24, 30]);
      let result: number | undefined = arr.find((value: number): boolean => value > 10 && value < 25);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2800
     * @tc.name testInt16ArrayFindTestOne028
     * @tc.desc Verify find with or-predicate returns first match 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21, 28, 35]);
      let result: number | undefined = arr.find((value: number): boolean => value === 14 || value === 28);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_2900
     * @tc.name testInt16ArrayFindTestOne029
     * @tc.desc Verify find with negative value predicate returns -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -3, 0, 3, 5]);
      let result: number | undefined = arr.find((value: number): boolean => value < 0);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3000
     * @tc.name testInt16ArrayFindTestOne030
     * @tc.desc Verify find with zero equality predicate returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-2, -1, 0, 1, 2]);
      let result: number | undefined = arr.find((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3100
     * @tc.name testInt16ArrayFindTestOne031
     * @tc.desc Verify find matches Int16 min value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, -32768, 32767, 100]);
      let result: number | undefined = arr.find((value: number): boolean => value === -32768);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3200
     * @tc.name testInt16ArrayFindTestOne032
     * @tc.desc Verify find matches Int16 max value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 100, 32767, -32768]);
      let result: number | undefined = arr.find((value: number): boolean => value === 32767);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3300
     * @tc.name testInt16ArrayFindTestOne033
     * @tc.desc Verify find matches negative one -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, -1, 1, -2, 2]);
      let result: number | undefined = arr.find((value: number): boolean => value === -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3400
     * @tc.name testInt16ArrayFindTestOne034
     * @tc.desc Verify find uses captured threshold variable and returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let threshold: number = 25;
      let result: number | undefined = arr.find((value: number): boolean => value > threshold);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3500
     * @tc.name testInt16ArrayFindTestOne035
     * @tc.desc Verify find visits all elements when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12]);
      let counter: number = 0;
      arr.find((value: number): boolean => {
        counter++;
        return false;
      });
      expect(counter).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3600
     * @tc.name testInt16ArrayFindTestOne036
     * @tc.desc Verify find returns third element when step counter reaches 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400]);
      let step: number = 0;
      let result: number | undefined = arr.find((value: number): boolean => {
        step++;
        return step === 3;
      });
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3700
     * @tc.name testInt16ArrayFindTestOne037
     * @tc.desc Verify find sees $_set mutation on later element at visit time and returns 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 999);
        }
        return value === 999;
      });
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3800
     * @tc.name testInt16ArrayFindTestOne038
     * @tc.desc Verify find continues after external array reassignment and returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20]);
      let externalArr: Int16Array = arr;
      let result: number | undefined = arr.find((value: number): boolean => {
        externalArr = new Int16Array([0]);
        return value === 20;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_3900
     * @tc.name testInt16ArrayFindTestOne039
     * @tc.desc Verify find with Math.sqrt predicate returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, 9, 16, 25]);
      let result: number | undefined = arr.find((value: number): boolean => {
        let sqrt: number = Math.sqrt(value);
        return sqrt === 4;
      });
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4000
     * @tc.name testInt16ArrayFindTestOne040
     * @tc.desc Verify find with nested helper isMultipleOf7 returns 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 14, 20, 21]);
      let result: number | undefined = arr.find((value: number): boolean => isMultipleOf7(value));
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4100
     * @tc.name testInt16ArrayFindTestOne041
     * @tc.desc Verify find propagates Error thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      try {
        arr.find((value: number): boolean => {
          throw new Error('predicate error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4200
     * @tc.name testInt16ArrayFindTestOne042
     * @tc.desc Verify find propagates Error thrown on second predicate call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let callIdx: number = 0;
      try {
        arr.find((value: number): boolean => {
          callIdx++;
          if (callIdx === 2) {
            throw new Error('second call error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4300
     * @tc.name testInt16ArrayFindTestOne043
     * @tc.desc Verify find propagates Error thrown at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      try {
        arr.find((value: number, index: int): boolean => {
          if (index === 2) {
            throw new Error('middle error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4400
     * @tc.name testInt16ArrayFindTestOne044
     * @tc.desc Verify find propagates Error thrown at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      try {
        arr.find((value: number, index: int, array: Int16Array): boolean => {
          if (index === array.length - 1) {
            throw new Error('last element error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4500
     * @tc.name testInt16ArrayFindTestOne045
     * @tc.desc Verify find propagates TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70]);
      try {
        arr.find((value: number): boolean => {
          throw new TypeError('type mismatch in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4600
     * @tc.name testInt16ArrayFindTestOne046
     * @tc.desc Verify find propagates RangeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([80, 90, 100]);
      try {
        arr.find((value: number): boolean => {
          throw new RangeError('range error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4700
     * @tc.name testInt16ArrayFindTestOne047
     * @tc.desc Verify find on empty Int16Array returns undefined without calling predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(new ArrayBuffer(0), 0, 0);
      let called: boolean = false;
      let result: number | undefined = arr.find((value: number): boolean => {
        called = true;
        return true;
      });
      expect(result).assertUndefined();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4800
     * @tc.name testInt16ArrayFindTestOne048
     * @tc.desc Verify find on single-element array returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let result: number | undefined = arr.find((value: number): boolean => value === 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_4900
     * @tc.name testInt16ArrayFindTestOne049
     * @tc.desc Verify find on single-element array with no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([88]);
      let result: number | undefined = arr.find((value: number): boolean => value !== 88);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_5000
     * @tc.name testInt16ArrayFindTestOne050
     * @tc.desc Verify find short-circuits and visitLog length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([256, 512, 1024, 2048]);
      let visitLog: Array<number> = [];
      let result: number | undefined = arr.find((value: number): boolean => {
        visitLog.push(value);
        return true;
      });
      expect(result).assertEqual(256);
      let actual1: int = visitLog.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_5100
     * @tc.name testInt16ArrayFindTestOne051
     * @tc.desc Verify find always-false visits all five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      let count: number = 0;
      let result: number | undefined = arr.find((value: number): boolean => {
        count++;
        return false;
      });
      expect(result).assertUndefined();
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_5200
     * @tc.name testInt16ArrayFindTestOne052
     * @tc.desc Verify find stops at third element when value equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 3, 5, 7, 9, 11]);
      let iterCount: number = 0;
      let result: number | undefined = arr.find((value: number): boolean => {
        iterCount++;
        return value === 5;
      });
      expect(result).assertEqual(5);
      expect(iterCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_ONE_5300
     * @tc.name testInt16ArrayFindTestOne053
     * @tc.desc Verify find with index>=3 and even value returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6, 8, 10]);
      let result: number | undefined = arr.find((value: number, index: int): boolean => index >= 3 && value % 2 === 0);
      expect(result).assertEqual(8);
    });
  });
}
