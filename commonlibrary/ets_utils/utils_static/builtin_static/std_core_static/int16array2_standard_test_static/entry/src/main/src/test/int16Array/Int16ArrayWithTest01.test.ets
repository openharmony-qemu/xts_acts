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

export default function int16ArrayWithTestOneTest(): void {
  describe('Int16ArrayWithTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0100
     * @tc.name testInt16ArrayWithTestOne001
     * @tc.desc Verify with(2, 99) arity=2 returns Int16Array with BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: int = result.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0200
     * @tc.name testInt16ArrayWithTestOne002
     * @tc.desc Verify with(0, 99) replaces first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0300
     * @tc.name testInt16ArrayWithTestOne003
     * @tc.desc Verify with(4, 99) replaces last element via positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(4, 99);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0400
     * @tc.name testInt16ArrayWithTestOne004
     * @tc.desc Verify with(2, 99) replaces middle element via positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0500
     * @tc.name testInt16ArrayWithTestOne005
     * @tc.desc Verify non-target last element unchanged after with(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 99);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0600
     * @tc.name testInt16ArrayWithTestOne006
     * @tc.desc Verify non-target first element unchanged after with(4, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(4, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0700
     * @tc.name testInt16ArrayWithTestOne007
     * @tc.desc Verify non-target first element unchanged after middle with(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0800
     * @tc.name testInt16ArrayWithTestOne008
     * @tc.desc Verify non-target middle element unchanged after with(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 99);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_0900
     * @tc.name testInt16ArrayWithTestOne009
     * @tc.desc Verify with(-1, 99) replaces last element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-1, 99);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1000
     * @tc.name testInt16ArrayWithTestOne010
     * @tc.desc Verify with(-5, 99) replaces first element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-5, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1100
     * @tc.name testInt16ArrayWithTestOne011
     * @tc.desc Verify with(-3, 99) replaces middle element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-3, 99);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1200
     * @tc.name testInt16ArrayWithTestOne012
     * @tc.desc Verify non-target first element unchanged after with(-1, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-1, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1300
     * @tc.name testInt16ArrayWithTestOne013
     * @tc.desc Verify non-target last element unchanged after with(-5, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-5, 99);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1400
     * @tc.name testInt16ArrayWithTestOne014
     * @tc.desc Verify with(5, 99) throws RangeError when index equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1500
     * @tc.name testInt16ArrayWithTestOne015
     * @tc.desc Verify with(6, 99) throws RangeError when index is length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      try {
        arr.with(6, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1600
     * @tc.name testInt16ArrayWithTestOne016
     * @tc.desc Verify with(huge, 99) throws RangeError for huge positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let huge: int = 2147483647;
      try {
        arr.with(huge, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1700
     * @tc.name testInt16ArrayWithTestOne017
     * @tc.desc Verify with(-6, 99) throws RangeError for -length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      try {
        arr.with(-6, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1800
     * @tc.name testInt16ArrayWithTestOne018
     * @tc.desc Verify with(hugeNeg, 99) throws RangeError for huge negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let hugeNeg: int = -2147483648;
      try {
        arr.with(hugeNeg, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_1900
     * @tc.name testInt16ArrayWithTestOne019
     * @tc.desc Verify original first element immutable after with(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 99);
      let actualResult: number = result.$_get(0);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2000
     * @tc.name testInt16ArrayWithTestOne020
     * @tc.desc Verify original last element immutable after with(4, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(4, 99);
      let actualResult: number = result.$_get(4);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2100
     * @tc.name testInt16ArrayWithTestOne021
     * @tc.desc Verify original target element immutable after with(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actualResult: number = result.$_get(2);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2200
     * @tc.name testInt16ArrayWithTestOne022
     * @tc.desc Verify original last element immutable after with(-1, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-1, 99);
      let actualResult: number = result.$_get(4);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2300
     * @tc.name testInt16ArrayWithTestOne023
     * @tc.desc Verify original first element immutable after with(-5, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-5, 99);
      let actualResult: number = result.$_get(0);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2400
     * @tc.name testInt16ArrayWithTestOne024
     * @tc.desc Verify original middle element immutable after with(-3, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(-3, 99);
      let actualResult: number = result.$_get(2);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2500
     * @tc.name testInt16ArrayWithTestOne025
     * @tc.desc Verify with(0, 99) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int16Array = new Int16Array(0);
      try {
        empty.with(0, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2600
     * @tc.name testInt16ArrayWithTestOne026
     * @tc.desc Verify with(-1, 99) on empty array with -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int16Array = new Int16Array(0);
      try {
        empty.with(-1, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2700
     * @tc.name testInt16ArrayWithTestOne027
     * @tc.desc Verify with(1, 99) on empty array with 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int16Array = new Int16Array(0);
      try {
        empty.with(1, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2800
     * @tc.name testInt16ArrayWithTestOne028
     * @tc.desc Verify with(-2, 99) on single-element array throws RangeError for -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: Int16Array = Int16Array.of(10);
      try {
        single.with(-2, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_2900
     * @tc.name testInt16ArrayWithTestOne029
     * @tc.desc Verify with(2, 0) stores zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 0);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3000
     * @tc.name testInt16ArrayWithTestOne030
     * @tc.desc Verify with(2, 1) stores positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 1);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3100
     * @tc.name testInt16ArrayWithTestOne031
     * @tc.desc Verify with(2, -1) stores negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, -1);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3200
     * @tc.name testInt16ArrayWithTestOne032
     * @tc.desc Verify with(2, 32767) stores Int16 max 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 32767);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3300
     * @tc.name testInt16ArrayWithTestOne033
     * @tc.desc Verify with(2, -32768) stores Int16 min -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, -32768);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3400
     * @tc.name testInt16ArrayWithTestOne034
     * @tc.desc Verify with(2, 42) stores ordinary positive value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 42);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3500
     * @tc.name testInt16ArrayWithTestOne035
     * @tc.desc Verify with(2, -42) stores ordinary negative value -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, -42);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3600
     * @tc.name testInt16ArrayWithTestOne036
     * @tc.desc Verify with(2, v) stores short-typed variable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let v: short = 99;
      let result: Int16Array = arr.with(2, v);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3700
     * @tc.name testInt16ArrayWithTestOne037
     * @tc.desc Verify first element unchanged after middle with(2, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 0);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3800
     * @tc.name testInt16ArrayWithTestOne038
     * @tc.desc Verify last element unchanged after middle with(2, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 0);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_3900
     * @tc.name testInt16ArrayWithTestOne039
     * @tc.desc Verify original target element immutable after with(2, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 0);
      let actualResult: number = result.$_get(2);
      let expectedResult: int = 0;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4000
     * @tc.name testInt16ArrayWithTestOne040
     * @tc.desc Verify with(2, 99) preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4100
     * @tc.name testInt16ArrayWithTestOne041
     * @tc.desc Verify with(2, 99) result byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: int = result.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4200
     * @tc.name testInt16ArrayWithTestOne042
     * @tc.desc Verify with(2, 99) result uses independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: boolean = result.buffer === arr.buffer;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4300
     * @tc.name testInt16ArrayWithTestOne043
     * @tc.desc Verify original length immutable after with(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actualResult: number = result.$_get(2);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: int = arr.length;
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4400
     * @tc.name testInt16ArrayWithTestOne044
     * @tc.desc Verify original first element immutable after with(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actualResult: number = result.$_get(2);
      let expectedResult: int = 99;
      expect(actualResult).assertEqual(expectedResult);

      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4500
     * @tc.name testInt16ArrayWithTestOne045
     * @tc.desc Verify original last element immutable after with(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4600
     * @tc.name testInt16ArrayWithTestOne046
     * @tc.desc Verify with(2, 99) result supports $_set write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      result.$_set(0, 77);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4700
     * @tc.name testInt16ArrayWithTestOne047
     * @tc.desc Verify $_set on with(2, 99) result does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      result.$_set(1, 88);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4800
     * @tc.name testInt16ArrayWithTestOne048
     * @tc.desc Verify chained with returns Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 11).with(1, 22);
      let actual1: int = result.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_4900
     * @tc.name testInt16ArrayWithTestOne049
     * @tc.desc Verify chained with applies first replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 11).with(1, 22);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5000
     * @tc.name testInt16ArrayWithTestOne050
     * @tc.desc Verify chained with applies second replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 11).with(1, 22);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5100
     * @tc.name testInt16ArrayWithTestOne051
     * @tc.desc Verify chained with keeps unreplaced elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 11).with(1, 22);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5200
     * @tc.name testInt16ArrayWithTestOne052
     * @tc.desc Verify triple chained with applies all replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 11).with(2, 33).with(4, 55);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = result.$_get(4);
      expect(actual3).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5300
     * @tc.name testInt16ArrayWithTestOne053
     * @tc.desc Verify chained with same index keeps last write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 11).with(2, 22);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5400
     * @tc.name testInt16ArrayWithTestOne054
     * @tc.desc Verify intermediate with result unchanged by later with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let mid: Int16Array = arr.with(2, 11);
      let result: Int16Array = mid.with(2, 22);
      let actual1: number = mid.$_get(2);
      expect(actual1).assertEqual(11);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5500
     * @tc.name testInt16ArrayWithTestOne055
     * @tc.desc Verify same-value with(1, 20) returns new array not same ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(1, 20);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(20);
      let actual2: boolean = result === arr;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5600
     * @tc.name testInt16ArrayWithTestOne056
     * @tc.desc Verify same-value with(1, 20) keeps full content equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.with(1, 20);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5700
     * @tc.name testInt16ArrayWithTestOne057
     * @tc.desc Verify with(-length,v) equals with(0,v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.with(0, 99);
      let r2: Int16Array = arr.with(-5, 99);
      let actual1: number = r1.$_get(0);
      let expected1: number = r2.$_get(0);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5800
     * @tc.name testInt16ArrayWithTestOne058
     * @tc.desc Verify with(-1,v) equals with(length-1,v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let r1: Int16Array = arr.with(4, 77);
      let r2: Int16Array = arr.with(-1, 77);
      let actual1: number = r1.$_get(4);
      let expected1: number = r2.$_get(4);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_5900
     * @tc.name testInt16ArrayWithTestOne059
     * @tc.desc Verify for-loop can access all elements of with(2, 99) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(2, 99);
      let actual0: number = result.$_get(0);
      expect(actual0).assertEqual(10);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(20);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(99);
      let actual3: number = result.$_get(3);
      expect(actual3).assertEqual(40);
      let actual4: number = result.$_get(4);
      expect(actual4).assertEqual(50);
      let actualLength: int = result.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6000
     * @tc.name testInt16ArrayWithTestOne060
     * @tc.desc Verify with(2, -1) on all-zero array sets target non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeros: Int16Array = new Int16Array(5);
      let result: Int16Array = zeros.with(2, -1);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(-1);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6100
     * @tc.name testInt16ArrayWithTestOne061
     * @tc.desc Verify with(2, -1) on all-zero array keeps other zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeros: Int16Array = new Int16Array(5);
      let result: Int16Array = zeros.with(2, -1);
      let actual1: number = result.$_get(4);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6200
     * @tc.name testInt16ArrayWithTestOne062
     * @tc.desc Verify with(2, 3) on all-same array changes target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let same: Int16Array = Int16Array.of(7, 7, 7, 7, 7);
      let result: Int16Array = same.with(2, 3);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6300
     * @tc.name testInt16ArrayWithTestOne063
     * @tc.desc Verify with(2, 3) on all-same array keeps others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let same: Int16Array = Int16Array.of(7, 7, 7, 7, 7);
      let result: Int16Array = same.with(2, 3);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6400
     * @tc.name testInt16ArrayWithTestOne064
     * @tc.desc Verify with(2, 99) on max/min array keeps extremes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ext: Int16Array = Int16Array.of(32767, -32768, 0, 1, -1);
      let result: Int16Array = ext.with(2, 99);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = result.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6500
     * @tc.name testInt16ArrayWithTestOne065
     * @tc.desc Verify with(1, 999) result byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(14);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      full.$_set(4, 500);
      full.$_set(5, 600);
      full.$_set(6, 700);
      let sub: Int16Array = new Int16Array(buf, 2, 4);
      let result: Int16Array = sub.with(1, 999);
      let actual1: int = result.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6600
     * @tc.name testInt16ArrayWithTestOne066
     * @tc.desc Verify with(1, 999) from non-zero byteOffset view replaces target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(14);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      full.$_set(4, 500);
      full.$_set(5, 600);
      full.$_set(6, 700);
      let sub: Int16Array = new Int16Array(buf, 2, 4);
      let result: Int16Array = sub.with(1, 999);
      let actual1: number = result.$_get(1);
      expect(actual1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6700
     * @tc.name testInt16ArrayWithTestOne067
     * @tc.desc Verify with(1, 999) from non-zero byteOffset view keeps non-targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(14);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      full.$_set(4, 500);
      full.$_set(5, 600);
      full.$_set(6, 700);
      let sub: Int16Array = new Int16Array(buf, 2, 4);
      let result: Int16Array = sub.with(1, 999);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(200);
      let actual2: number = result.$_get(3);
      expect(actual2).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6800
     * @tc.name testInt16ArrayWithTestOne068
     * @tc.desc Verify original view immutable after with(1, 999) on non-zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(14);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      full.$_set(4, 500);
      full.$_set(5, 600);
      full.$_set(6, 700);
      let sub: Int16Array = new Int16Array(buf, 2, 4);
      sub.with(1, 999);

      let actual1: number = sub.$_get(1);
      expect(actual1).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_6900
     * @tc.name testInt16ArrayWithTestOne069
     * @tc.desc Verify with(0, 30) can create duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: Int16Array = arr.with(0, 30);
      let actual1: number = result.$_get(0);
      expect(actual1).assertEqual(30);
      let actual2: number = result.$_get(2);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7000
     * @tc.name testInt16ArrayWithTestOne070
     * @tc.desc Verify with(2, 99) result works as Int16Array.from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let mid: Int16Array = arr.with(2, 99);
      let result: Int16Array = Int16Array.from(mid);
      let actual1: number = result.$_get(2);
      expect(actual1).assertEqual(99);
      let actual2: int = result.length;
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7100
     * @tc.name testInt16ArrayWithTestOne071
     * @tc.desc Verify with(0, 99) on length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let result: Int16Array = arr.with(0, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(2);
      let actual2: number = result.$_get(0);
      expect(actual2).assertEqual(99);
      let actual3: number = result.$_get(1);
      expect(actual3).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7200
     * @tc.name testInt16ArrayWithTestOne072
     * @tc.desc Verify with(5, 99) on length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: Int16Array = arr.with(5, 99);
      let actual1: int = result.length;
      expect(actual1).assertEqual(10);
      let actual2: number = result.$_get(5);
      expect(actual2).assertEqual(99);
      let actual3: number = result.$_get(0);
      expect(actual3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7300
     * @tc.name testInt16ArrayWithTestOne073
     * @tc.desc Verify with(3, 99) throws RangeError not TypeError for positive OOB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(3, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7400
     * @tc.name testInt16ArrayWithTestOne074
     * @tc.desc Verify with(-4, 99) throws RangeError for negative OOB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7500
     * @tc.name testInt16ArrayWithTestOne075
     * @tc.desc Verify with(0, 1) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int16Array = new Int16Array(0);
      try {
        empty.with(0, 1);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_WITH_ONE_7600
     * @tc.name testInt16ArrayWithTestOne076
     * @tc.desc Verify with(-1, 1) on empty array with -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayWithTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int16Array = new Int16Array(0);
      try {
        empty.with(-1, 1);
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });
  });
}
