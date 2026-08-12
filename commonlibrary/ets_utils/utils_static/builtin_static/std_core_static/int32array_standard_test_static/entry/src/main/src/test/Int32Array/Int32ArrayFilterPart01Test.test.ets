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
export default function int32ArrayFilterPart01Test(): void {
  describe('Int32ArrayFilterPart01Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0100
         * @tc.name int32ArrayFilterPart01Test001
         * @tc.desc Verify arity=1 filter with valid callback executes without error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0200
         * @tc.name int32ArrayFilterPart01Test002
         * @tc.desc Verify callback returning constant false yields empty array length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => false);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0300
         * @tc.name int32ArrayFilterPart01Test003
         * @tc.desc Verify callback returning constant true keeps every element in result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => true);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(20);
          expect(res.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0400
         * @tc.name int32ArrayFilterPart01Test004
         * @tc.desc Verify first callback parameter val receives the correct number value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          let observed: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          observed = val;
          return true;
        });
          expect(observed).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0500
         * @tc.name int32ArrayFilterPart01Test005
         * @tc.desc Verify val is typed as number and can participate in floating point arithmetic
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7);
          let fractional: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          fractional = val + 0.5;
          return true;
        });
          expect(fractional).assertEqual(7.5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0600
         * @tc.name int32ArrayFilterPart01Test006
         * @tc.desc Verify second callback parameter index starts at 0 for first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let firstIndex: int = -1;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          if (firstIndex === -1) {
          firstIndex = index;
          }
          return true;
        });
          expect(firstIndex).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0700
         * @tc.name int32ArrayFilterPart01Test007
         * @tc.desc Verify second callback parameter index equals length-1 for last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let lastIndex: int = -1;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          lastIndex = index;
          return true;
        });
          expect(lastIndex).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0800
         * @tc.name int32ArrayFilterPart01Test008
         * @tc.desc Verify callback index parameter increments strictly 0,1,2,3 in order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let seq: int[] = [];
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seq.push(index);
          return true;
        });
          expect(seq.length).assertEqual(4);
          expect(seq[0]).assertEqual(0);
          expect(seq[1]).assertEqual(1);
          expect(seq[2]).assertEqual(2);
          expect(seq[3]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_0900
         * @tc.name int32ArrayFilterPart01Test009
         * @tc.desc Verify third callback parameter array refers to the same Int32Array instance
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let sameRef: boolean = false;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          sameRef = (array === arr);
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1000
         * @tc.name int32ArrayFilterPart01Test010
         * @tc.desc Verify third callback parameter array.length matches original length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let observedLen: int = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          observedLen = array.length;
          return true;
        });
          expect(observedLen).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1100
         * @tc.name int32ArrayFilterPart01Test011
         * @tc.desc Verify third callback parameter array is an instance of Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1);
          let sameRef: boolean = false;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          sameRef = (array === arr);
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1200
         * @tc.name int32ArrayFilterPart01Test012
         * @tc.desc Verify on single-element array index is 0 and val is correct including negative value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-7);
          let gotVal: number = 0;
          let gotIdx: int = -1;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          gotVal = val;
          gotIdx = index;
          return true;
        });
          expect(gotVal).assertEqual(-7);
          expect(gotIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1300
         * @tc.name int32ArrayFilterPart01Test013
         * @tc.desc Verify predicate val > 0 selects all positive elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1, -2, 3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1400
         * @tc.name int32ArrayFilterPart01Test014
         * @tc.desc Verify predicate val < 0 selects all negative elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1, -2, 3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val < 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(-1);
          expect(res.$_get(1)).assertEqual(-2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1500
         * @tc.name int32ArrayFilterPart01Test015
         * @tc.desc Verify predicate val == 0 selects zero-valued elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1, 0, -3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(0);
          expect(res.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1600
         * @tc.name int32ArrayFilterPart01Test016
         * @tc.desc Verify predicate val == INT_MAX (2147483647) selects max-valued elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MAX: int = 2147483647;
          let arr: Int32Array = Int32Array.of(-1, INT_MAX, 0, INT_MAX);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == INT_MAX);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(INT_MAX);
          expect(res.$_get(1)).assertEqual(INT_MAX);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1700
         * @tc.name int32ArrayFilterPart01Test017
         * @tc.desc Verify predicate val == INT_MIN (-2147483648) selects min-valued elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MIN: int = -2147483648;
          let arr: Int32Array = Int32Array.of(INT_MIN, 0, INT_MIN, 1);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == INT_MIN);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(INT_MIN);
          expect(res.$_get(1)).assertEqual(INT_MIN);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1800
         * @tc.name int32ArrayFilterPart01Test018
         * @tc.desc Verify predicate val == 1 selects elements equal to 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, -1, 0, 10, 1);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == 1);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_1900
         * @tc.name int32ArrayFilterPart01Test019
         * @tc.desc Verify predicate val == -1 selects elements equal to -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 1, 0, -10, -1);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == -1);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(-1);
          expect(res.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2000
         * @tc.name int32ArrayFilterPart01Test020
         * @tc.desc Verify predicate val % 2 == 0 selects even-valued elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val % 2 == 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(2);
          expect(res.$_get(1)).assertEqual(4);
          expect(res.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2100
         * @tc.name int32ArrayFilterPart01Test021
         * @tc.desc Verify predicate val % 2 != 0 selects odd-valued elements including negative odds
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, -3, 4, 5, -6);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val % 2 != 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(-3);
          expect(res.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2200
         * @tc.name int32ArrayFilterPart01Test022
         * @tc.desc Verify predicate val >= 0 selects non-negative elements including zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, 0, 3, -1, 7);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val >= 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(0);
          expect(res.$_get(1)).assertEqual(3);
          expect(res.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2300
         * @tc.name int32ArrayFilterPart01Test023
         * @tc.desc Verify predicate val <= 0 selects non-positive elements including zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, 0, 3, -1, 7);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val <= 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-5);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2400
         * @tc.name int32ArrayFilterPart01Test024
         * @tc.desc Verify predicate val > 1 selects elements greater than threshold matching spec example
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(3, 1, 2);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > 1);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(3);
          expect(res.$_get(1)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2500
         * @tc.name int32ArrayFilterPart01Test025
         * @tc.desc Verify predicate val == val self-equality includes all elements (no Number.NaN in Int32Array)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 0, -1, 2147483647);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == val);
          expect(res.length).assertEqual(4);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(-1);
          expect(res.$_get(3)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2600
         * @tc.name int32ArrayFilterPart01Test026
         * @tc.desc Verify predicate val !== val Number.NaN check yields empty result on Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 1, -1, 2147483647);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val !== val);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2700
         * @tc.name int32ArrayFilterPart01Test027
         * @tc.desc Verify double negation !!val converts non-zero to true and zero to false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 1, -2, 0, 3);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => !!val);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(-2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2800
         * @tc.name int32ArrayFilterPart01Test028
         * @tc.desc Verify predicate val > val always false yields empty result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > val);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_2900
         * @tc.name int32ArrayFilterPart01Test029
         * @tc.desc Verify predicate val >= val always true yields all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val >= val);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-1);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3000
         * @tc.name int32ArrayFilterPart01Test030
         * @tc.desc Verify predicate index == 0 selects only the first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index == 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3100
         * @tc.name int32ArrayFilterPart01Test031
         * @tc.desc Verify predicate index == array.length - 1 selects only the last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index == array.length - 1);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3200
         * @tc.name int32ArrayFilterPart01Test032
         * @tc.desc Verify predicate index % 2 == 0 selects even-positioned elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index % 2 == 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(30);
          expect(res.$_get(2)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3300
         * @tc.name int32ArrayFilterPart01Test033
         * @tc.desc Verify predicate index % 2 == 1 selects odd-positioned elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index % 2 == 1);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(20);
          expect(res.$_get(1)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3400
         * @tc.name int32ArrayFilterPart01Test034
         * @tc.desc Verify predicate index < 2 selects the first two elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index < 2);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3500
         * @tc.name int32ArrayFilterPart01Test035
         * @tc.desc Verify predicate index > 0 excludes the first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index > 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(20);
          expect(res.$_get(1)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3600
         * @tc.name int32ArrayFilterPart01Test036
         * @tc.desc Verify predicate index == 2 selects the specified middle element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => index == 2);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3700
         * @tc.name int32ArrayFilterPart01Test037
         * @tc.desc Verify predicate val > index returns empty on array where val strictly equals index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > index);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3800
         * @tc.name int32ArrayFilterPart01Test038
         * @tc.desc Verify predicate val > index keeps all elements when values grow faster than index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > index);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(20);
          expect(res.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_3900
         * @tc.name int32ArrayFilterPart01Test039
         * @tc.desc Verify negative fraction -0.9 is truncated to 0 by ToInt32 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -0.9);
          let seen: number = 999;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4000
         * @tc.name int32ArrayFilterPart01Test040
         * @tc.desc Verify 2147483647.9 truncated toward zero yields 2147483647 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MAX: int = 2147483647;
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483647.9);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(INT_MAX);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4100
         * @tc.name int32ArrayFilterPart01Test041
         * @tc.desc Verify 2147483648 written via $_set wraps to INT_MIN -2147483648 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MIN: int = -2147483648;
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483648);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(INT_MIN);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4200
         * @tc.name int32ArrayFilterPart01Test042
         * @tc.desc Verify 2147483649 written via $_set wraps to -2147483647 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483649);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(-2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4300
         * @tc.name int32ArrayFilterPart01Test043
         * @tc.desc Verify -2147483649 written via $_set wraps to INT_MAX 2147483647 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MAX: int = 2147483647;
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -2147483649);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(INT_MAX);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4400
         * @tc.name int32ArrayFilterPart01Test044
         * @tc.desc Verify 4294967296.0 written via $_set is converted to 0 by ToUint32/ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 4294967296.0);
          let seen: number = -1;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4500
         * @tc.name int32ArrayFilterPart01Test045
         * @tc.desc Verify 4294967297.0 written via $_set wraps to 1 observable in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 4294967297.0);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4600
         * @tc.name int32ArrayFilterPart01Test046
         * @tc.desc Verify predicate val < 0 captures 2147483648 overflow wrap to negative value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MIN: int = -2147483648;
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, 2147483648);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val < 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(INT_MIN);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4700
         * @tc.name int32ArrayFilterPart01Test047
         * @tc.desc Verify predicate val > 0 captures -2147483649 overflow wrap to positive value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          const INT_MAX: int = 2147483647;
          let arr: Int32Array = new Int32Array(1);
          arr.$_set(0, -2147483649);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(INT_MAX);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4800
         * @tc.name int32ArrayFilterPart01Test048
         * @tc.desc Verify hex literal 0xFF (=255) is correctly observed as 255 in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0xFF);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_4900
         * @tc.name int32ArrayFilterPart01Test049
         * @tc.desc Verify octal literal 0o77 (=63) is correctly observed as 63 in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0o77);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5000
         * @tc.name int32ArrayFilterPart01Test050
         * @tc.desc Verify binary literal 0b1010 (=10) is correctly observed as 10 in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0b1010);
          let seen: number = 0;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          seen = val;
          return true;
        });
          expect(seen).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5100
         * @tc.name int32ArrayFilterPart01Test051
         * @tc.desc Verify callback uses array.at for cross-checking val parameter consistency
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 6, 7);
          let allMatch: boolean = true;
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          let viaAt: number | undefined = array.at(index);
          if (viaAt === undefined || viaAt !== val) {
          allMatch = false;
          }
          return true;
        });
          expect(allMatch).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5200
         * @tc.name int32ArrayFilterPart01Test052
         * @tc.desc Verify callback reads next element via array.at to detect strictly increasing pairs
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          if (index < array.length - 1) {
          let next: number | undefined = array.at(index + 1);
          return next !== undefined && next > val;
          }
          return false;
        });
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5300
         * @tc.name int32ArrayFilterPart01Test053
         * @tc.desc Verify callback reads first element via array.at as comparison threshold
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5, 9);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          let first: number | undefined = array.at(0);
          return first !== undefined && val > first;
        });
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(4);
          expect(res.$_get(1)).assertEqual(5);
          expect(res.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5400
         * @tc.name int32ArrayFilterPart01Test054
         * @tc.desc Verify callback captures outer const threshold variable to do filtering
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let threshold: int = 5;
          let arr: Int32Array = Int32Array.of(2, 6, 3, 8, 5, 9);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > threshold);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(6);
          expect(res.$_get(1)).assertEqual(8);
          expect(res.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5500
         * @tc.name int32ArrayFilterPart01Test055
         * @tc.desc Verify callback increments outer counter to verify actual invocation count
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let callCount: int = 0;
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          callCount = callCount + 1;
          return val > 25;
        });
          expect(callCount).assertEqual(4);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5600
         * @tc.name int32ArrayFilterPart01Test056
         * @tc.desc Verify callback is invoked exactly once per element regardless of predicate outcome
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let callCount: int = 0;
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          callCount = callCount + 1;
          return val % 2 == 0;
        });
          expect(callCount).assertEqual(6);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(2);
          expect(res.$_get(1)).assertEqual(4);
          expect(res.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5700
         * @tc.name int32ArrayFilterPart01Test057
         * @tc.desc Verify all-false predicate still invokes callback once per element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let callCount: int = 0;
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          callCount = callCount + 1;
          return false;
        });
          expect(callCount).assertEqual(3);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5800
         * @tc.name int32ArrayFilterPart01Test058
         * @tc.desc Verify callback uses mutable outer state to implement take-first-N semantics
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
          let limit: int = 2;
          let taken: int = 0;
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          if (taken < limit) {
          taken = taken + 1;
          return true;
          }
          return false;
        });
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_5900
         * @tc.name int32ArrayFilterPart01Test059
         * @tc.desc Verify callback accumulates outer sum using number to confirm complete traversal
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let sum: number = 0;
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
          sum = sum + val;
          return true;
        });
          expect(sum).assertEqual(10);
          expect(res.length).assertEqual(4);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
          expect(res.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6000
         * @tc.name int32ArrayFilterPart01Test060
         * @tc.desc Verify callback records index sequence confirming strict ascending order without gaps
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
          let indices: int[] = [];
          arr.filter((val: number, index: int, array: Int32Array): boolean => {
          indices.push(index);
          return true;
        });
          expect(indices.length).assertEqual(5);
          expect(indices[0]).assertEqual(0);
          expect(indices[4]).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6100
         * @tc.name int32ArrayFilterPart01Test061
         * @tc.desc Verify compound predicate val>0 && index%2==0 selects positive even-indexed elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 2, -3, 4, 5);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > 0 && index % 2 == 0);
          expect(res.length).assertEqual(1);
          expect(res.$_get(0)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6200
         * @tc.name int32ArrayFilterPart01Test062
         * @tc.desc Verify compound predicate val<0 || val==0 selects non-positive elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 2, -3, 4);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val < 0 || val == 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-1);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6300
         * @tc.name int32ArrayFilterPart01Test063
         * @tc.desc Verify negated compound predicate !(val > 0) selects non-positive elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, 0, 3, -1);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => !(val > 0));
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-5);
          expect(res.$_get(1)).assertEqual(0);
          expect(res.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6400
         * @tc.name int32ArrayFilterPart01Test064
         * @tc.desc Verify multi-range compound predicate val in (-10,10) and index>0 selects matching elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, -5, 20, 3, -15, 7);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val > -10 && val < 10 && index > 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-5);
          expect(res.$_get(1)).assertEqual(3);
          expect(res.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6500
         * @tc.name int32ArrayFilterPart01Test065
         * @tc.desc Verify predicate (val>0)===(index>0) selects elements with matching sign relation
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 2, -3, 4);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => (val > 0) === (index > 0));
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(-1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6600
         * @tc.name int32ArrayFilterPart01Test066
         * @tc.desc Verify predicate ignoring val and using only index selects tail elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(100, 200, 300, 400);
          let res: Int32Array = arr.filter((_val: number, index: int, _array: Int32Array): boolean => index >= 2);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(300);
          expect(res.$_get(1)).assertEqual(400);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6700
         * @tc.name int32ArrayFilterPart01Test067
         * @tc.desc Verify predicate ignoring index and array selects by val only
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, 10, -3, 7);
          let res: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(10);
          expect(res.$_get(1)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6800
         * @tc.name int32ArrayFilterPart01Test068
         * @tc.desc Verify all-equal elements with matching predicate return equal-length result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == 7);
          expect(res.length).assertEqual(4);
          expect(res.$_get(0)).assertEqual(7);
          expect(res.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_6900
         * @tc.name int32ArrayFilterPart01Test069
         * @tc.desc Verify all-equal elements with non-matching predicate return empty result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 7, 7);
          let res: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => val == 0);
          expect(res.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_7000
         * @tc.name int32ArrayFilterPart01Test070
         * @tc.desc Verify same callback function reference passed to chained filter calls works correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let isPositive: (val: number, index: int, array: Int32Array) => boolean = (val: number, _index: int, _array: Int32Array): boolean => val > 0;
          let arr: Int32Array = Int32Array.of(-1, 2, -3, 4, -5, 6);
          let firstPass: Int32Array = arr.filter(isPositive);
          let secondPass: Int32Array = firstPass.filter(isPositive);
          expect(secondPass.length).assertEqual(3);
          expect(secondPass.$_get(0)).assertEqual(2);
          expect(secondPass.$_get(1)).assertEqual(4);
          expect(secondPass.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_7100
         * @tc.name int32ArrayFilterPart01Test071
         * @tc.desc Verify filter on Int32Array view over ArrayBuffer receives correct val in callback
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let view: Int32Array = new Int32Array(buf);
          view.$_set(0, 11);
          view.$_set(1, 22);
          view.$_set(2, 33);
          let res: Int32Array = view.filter((val: number, _index: int, _array: Int32Array): boolean => val > 20);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(22);
          expect(res.$_get(1)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_7200
         * @tc.name int32ArrayFilterPart01Test072
         * @tc.desc Verify filter on from(number[]) with fractional sources filters truncated integer values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: number[] = [1.5, 2.0, 3.9, -4.1, 0.0];
          let arr: Int32Array = Int32Array.from(src);
          let res: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
          expect(res.length).assertEqual(3);
          expect(res.$_get(0)).assertEqual(1);
          expect(res.$_get(1)).assertEqual(2);
          expect(res.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART01_TEST_7300
         * @tc.name int32ArrayFilterPart01Test073
         * @tc.desc Verify predicate val > index mixes int/number comparison types correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFilterPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 5, 1, 5, 2);
          let res: Int32Array = arr.filter((val: number, index: int, _array: Int32Array): boolean => val > index);
          expect(res.length).assertEqual(2);
          expect(res.$_get(0)).assertEqual(5);
          expect(res.$_get(1)).assertEqual(5);
        });
  });
}
