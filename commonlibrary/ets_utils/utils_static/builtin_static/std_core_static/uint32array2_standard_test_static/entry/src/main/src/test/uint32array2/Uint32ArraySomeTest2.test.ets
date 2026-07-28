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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySomeTwoTest(): void {
  describe('Uint32ArraySomeTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0100
     * @tc.name testUint32ArraySomeTwo001
     * @tc.desc Verify some() returns true when an element matches the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.some((element: number) => element === 4);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0200
     * @tc.name testUint32ArraySomeTwo002
     * @tc.desc Verify some() returns false when no element matches the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.some((element: number) => element === 99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0300
     * @tc.name testUint32ArraySomeTwo003
     * @tc.desc Verify some() returns false for an empty Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const r = values.some((element: number) => element === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0400
     * @tc.name testUint32ArraySomeTwo004
     * @tc.desc Verify some() returns true for a single-element array matching the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      const r = values.some((element: number) => element === 7);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0500
     * @tc.name testUint32ArraySomeTwo005
     * @tc.desc Verify some() returns false for a single-element array not matching the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      const r = values.some((element: number) => element === 8);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0600
     * @tc.name testUint32ArraySomeTwo006
     * @tc.desc Verify some() returns true when any element satisfies a greater-than predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.some((element: number) => element > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0700
     * @tc.name testUint32ArraySomeTwo007
     * @tc.desc Verify some() returns true for uint32 max value matching the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      const r = values.some((element: number) => element === 4294967295);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0800
     * @tc.name testUint32ArraySomeTwo008
     * @tc.desc Verify some() returns true when the callback matches by index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.some((element: number, index: int) => index === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_0900
     * @tc.name testUint32ArraySomeTwo009
     * @tc.desc Verify some() returns true when the callback matches by array parameter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      const r = values.some((element: number, index: int, array: Uint32Array) => array.length === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1000
     * @tc.name testUint32ArraySomeTwo010
     * @tc.desc Verify some() returns true when a later element matches the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(100, 200, 300, 400);
      const r = values.some((element: number) => element === 300);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1100
     * @tc.name testUint32ArraySomeTwo011
     * @tc.desc Verify some() returns true when an element satisfies a less-than-15 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r = values.some((element: number) => element < 15);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1200
     * @tc.name testUint32ArraySomeTwo012
     * @tc.desc Verify some() returns true when an even-element predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 3, 4);
      const r = values.some((element: number) => element % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1300
     * @tc.name testUint32ArraySomeTwo013
     * @tc.desc Verify some() returns true when an odd-bit predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2, 4, 5);
      const r = values.some((element: number) => (element & 1) === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1400
     * @tc.name testUint32ArraySomeTwo014
     * @tc.desc Verify some() returns true when element 0o17 equals decimal 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0o17);
      const r = values.some((element: number) => element === 0o17);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1500
     * @tc.name testUint32ArraySomeTwo015
     * @tc.desc Verify some() returns true when element equals int32 MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483647);
      const r = values.some((element: number) => element === 2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1600
     * @tc.name testUint32ArraySomeTwo016
     * @tc.desc Verify some() returns true for int32 boundary value 2147483648 (2^31)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483648);
      const r = values.some((element: number) => element === 2147483648);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1700
     * @tc.name testUint32ArraySomeTwo017
     * @tc.desc Verify some() returns true for an array of repeated equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(3, 3, 3);
      const r = values.some((element: number) => element === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1800
     * @tc.name testUint32ArraySomeTwo018
     * @tc.desc Verify some() returns false when all elements are 0 and predicate checks greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 0, 0);
      const r = values.some((element: number) => element > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_1900
     * @tc.name testUint32ArraySomeTwo019
     * @tc.desc Verify some() returns false when comparing uint32 MAX to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      const r = values.some((element: number) => element === -1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2000
     * @tc.name testUint32ArraySomeTwo020
     * @tc.desc Verify some() returns false when target exceeds any element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const r = values.some((element: number) => element === 9007199254740991);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2100
     * @tc.name testUint32ArraySomeTwo021
     * @tc.desc Verify some() returns true and array length remains 3 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.some((element: number) => element === 5)).assertTrue();
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2200
     * @tc.name testUint32ArraySomeTwo022
     * @tc.desc Verify some() does not mutate the array when predicate matches an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4, 5, 6);
      expect(values.some((element: number) => element === 5)).assertTrue();
      expect(values.$_get(0)).assertEqual(4);
      expect(values.$_get(1)).assertEqual(5);
      expect(values.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2300
     * @tc.name testUint32ArraySomeTwo023
     * @tc.desc Verify some() does not mutate the first element when it matches 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 1, 2);
      expect(values.some((element: number) => element === 0)).assertTrue();
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2400
     * @tc.name testUint32ArraySomeTwo024
     * @tc.desc Verify some() does not mutate the uint32 MAX element after matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      expect(values.some((element: number) => element === 4294967295)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2500
     * @tc.name testUint32ArraySomeTwo025
     * @tc.desc Verify some() does not mutate the last element when predicate matches the first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r = values.some((element: number) => element === 10);
      expect(r).assertTrue();
      expect(values.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2600
     * @tc.name testUint32ArraySomeTwo026
     * @tc.desc Verify some() on a subarray view does not mutate the parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent.$_set(0, 100);
      parent.$_set(1, 200);
      parent.$_set(2, 300);
      parent.$_set(3, 400);
      const view: Uint32Array = parent.subarray(1, 3);
      expect(view.some((element: number) => element === 200)).assertTrue();
      expect(parent.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2700
     * @tc.name testUint32ArraySomeTwo027
     * @tc.desc Verify some() on subarray view returns true when element 300 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent.$_set(0, 100);
      parent.$_set(1, 200);
      parent.$_set(2, 300);
      parent.$_set(3, 400);
      const view: Uint32Array = parent.subarray(1, 3);
      const r = view.some((element: number) => element === 300);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SOME_TWO_2800
     * @tc.name testUint32ArraySomeTwo028
     * @tc.desc Verify some() on subarray view returns false when target 100 not in view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySomeTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const parent: Uint32Array = new Uint32Array(buf, 0, 4);
      parent.$_set(0, 100);
      parent.$_set(1, 200);
      parent.$_set(2, 300);
      parent.$_set(3, 400);
      const view: Uint32Array = parent.subarray(1, 3);
      const r = view.some((element: number) => element === 100);
      expect(r).assertFalse();
    });

  });
}
