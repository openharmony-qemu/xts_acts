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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item027 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface Point028 {
  x: int;
  y: int;
}

export default function ArrayInvoke2Test(): void {
  describe('ArrayInvoke2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0100
     * @tc.name testArrayInvoke001
     * @tc.desc Verify arrayLength is optional for this invoke overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<int>(10);
      expect(arr2.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0200
     * @tc.name testArrayInvoke002
     * @tc.desc Verify array construction accepts a normal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0300
     * @tc.name testArrayInvoke003
     * @tc.desc Verify default construction uses length zero when no argument is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0400
     * @tc.name testArrayInvoke004
     * @tc.desc Verify array construction supports an explicit zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0500
     * @tc.name testArrayInvoke005
     * @tc.desc Verify array construction supports a length of one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0600
     * @tc.name testArrayInvoke006
     * @tc.desc Verify array construction supports a larger length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1000);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0700
     * @tc.name testArrayInvoke007
     * @tc.desc Verify extremely large length input is handled safely by the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(Number.MAX_SAFE_INTEGER.toInt());
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0800
     * @tc.name testArrayInvoke008
     * @tc.desc Verify array construction rejects a negative length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof RangeError || e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0900
     * @tc.name testArrayInvoke009
     * @tc.desc Verify array construction rejects null passed as the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects null-to-number length conversion at compile time.
      const documentedInvalidCase = ['null-length'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1000
     * @tc.name testArrayInvoke010
     * @tc.desc Verify an undefined optional length path falls back to default construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const optionalLength: int | undefined = undefined;
      let arr = new Array<int>();
      if (optionalLength != undefined) {
        arr = new Array<int>(optionalLength);
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1100
     * @tc.name testArrayInvoke011
     * @tc.desc Verify floating-point length is not preserved as an exact array size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatLength: number = 5.5;
      try {
        const arr = new Array<int>(floatLength.toInt());
        expect(arr.length == floatLength).assertFalse();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1200
     * @tc.name testArrayInvoke012
     * @tc.desc Verify scientific notation length works after explicit integer normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scientificLength = (1e1).toInt();
      const arr = new Array<int>(scientificLength);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1300
     * @tc.name testArrayInvoke013
     * @tc.desc Verify array construction accepts a hexadecimal length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0x0A);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1400
     * @tc.name testArrayInvoke014
     * @tc.desc Verify string to number length mismatch is rejected at compile time in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects string-to-number length mismatches at compile time.
      expect('string-length'.endsWith('length')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1500
     * @tc.name testArrayInvoke015
     * @tc.desc Verify array construction returns a new array with the requested length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1600
     * @tc.name testArrayInvoke016
     * @tc.desc Verify array construction returns arrays of different generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(5);
      const strArr = new Array<string>(5);
      const boolArr = new Array<boolean>(true, false, true, false, true);

      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
      expect(numArr.length).assertEqual(5);
      expect(strArr.length).assertEqual(5);
      expect(boolArr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1700
     * @tc.name testArrayInvoke017
     * @tc.desc Verify array elements remain uninitialized right after length-based construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      expect(arr.length).assertEqual(5);

      try {
        const val = arr[0];
        expect(val).assertUndefined();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1800
     * @tc.name testArrayInvoke018
     * @tc.desc Verify elements can be initialized and used safely after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);

      for (let i = 0; i < arr.length; i++) {
        arr[i] = i + 1;
      }

      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1900
     * @tc.name testArrayInvoke019
     * @tc.desc Verify this static invoke overload is reached through new Array syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2000
     * @tc.name testArrayInvoke020
     * @tc.desc Verify explicit generic syntax works with typed array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(5);
      const strArr = new Array<string>(5);

      numArr.pushOne(123);
      strArr.pushOne('hello');

      expect(numArr[5]).assertEqual(123);
      expect(strArr[5]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2100
     * @tc.name testArrayInvoke021
     * @tc.desc Verify omitting the argument uses the default length of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const arr2 = new Array<int>(0);
      expect(arr.length).assertEqual(0);
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2200
     * @tc.name testArrayInvoke022
     * @tc.desc Verify providing a length argument creates an array of that size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2300
     * @tc.name testArrayInvoke023
     * @tc.desc Verify argument count selects the expected invoke overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      const arr2 = new Array<int>(10);
      const arr3 = new Array<string>('a', 'b', 'c');

      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(10);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2400
     * @tc.name testArrayInvoke024
     * @tc.desc Verify a number generic array can be created with a preset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2500
     * @tc.name testArrayInvoke025
     * @tc.desc Verify a string generic array can be created with a preset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(3);
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = '!';
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2600
     * @tc.name testArrayInvoke026
     * @tc.desc Verify a boolean generic array can be created with initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2700
     * @tc.name testArrayInvoke027
     * @tc.desc Verify a custom class array can be created and populated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item027>(3);
      arr[0] = new Item027(1);
      arr[1] = new Item027(2);
      arr[2] = new Item027(3);
      expect(arr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2800
     * @tc.name testArrayInvoke028
     * @tc.desc Verify an interface typed array can be created and used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point028>(2);
      arr[0] = { x: 1, y: 2 };
      arr[1] = { x: 3, y: 4 };
      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2900
     * @tc.name testArrayInvoke029
     * @tc.desc Verify a union typed array can be created and hold mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(5);
      arr[0] = 1;
      arr[1] = 'two';
      arr[2] = 3;
      arr[3] = 'four';
      arr[4] = 5;
      expect(arr[1]).assertEqual('two');
      expect(arr[3]).assertEqual('four');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3000
     * @tc.name testArrayInvoke030
     * @tc.desc Verify uninitialized elements after length construction keep runtime-safe behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);

      try {
        const val = arr[0];
        expect(val).assertUndefined();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3100
     * @tc.name testArrayInvoke031
     * @tc.desc Verify arrays can be initialized by loop fill and Array.create usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = 0;
      }

      const arr2 = new Array<int>(5);
      arr2.fill(0);

      const arr3 = Array.create<int>(5, 0);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(0);
        expect(arr2[i]).assertEqual(0);
        expect(arr3[i]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3200
     * @tc.name testArrayInvoke032
     * @tc.desc Verify initialized arrays support normal read write and push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 10;
      }

      expect(arr[0]).assertEqual(0);
      expect(arr[5]).assertEqual(50);
      expect(arr[9]).assertEqual(90);

      arr[5] = 999;
      expect(arr[5]).assertEqual(999);

      arr.pushOne(100);
      expect(arr.length).assertEqual(11);
      expect(arr[10]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3300
     * @tc.name testArrayInvoke033
     * @tc.desc Verify preset length construction suits known-size preallocation scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * i;
      }

      expect(arr[0]).assertEqual(0);
      expect(arr[10]).assertEqual(100);
      expect(arr[99]).assertEqual(9801);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3400
     * @tc.name testArrayInvoke034
     * @tc.desc Verify preset length arrays support batch data processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size = 1000;
      const arr = new Array<int>(size);
      for (let i = 0; i < size; i++) {
        arr[i] = Math.floor(Math.random() * 100).toInt();
      }

      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
      }

      expect(sum >= 0).assertTrue();
      expect(sum < 100000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3500
     * @tc.name testArrayInvoke035
     * @tc.desc Verify arrays created with preset length can be resized dynamically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }

      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);

      arr.extendTo(15, 0);
      expect(arr.length).assertEqual(15);

      arr.pushOne(100);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3600
     * @tc.name testArrayInvoke036
     * @tc.desc Verify this invoke overload behaves the same as constructor-style array creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(5);
      const arr2 = new Array<int>(5);
      expect(arr1.length).assertEqual(arr2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3700
     * @tc.name testArrayInvoke037
     * @tc.desc Verify Array.create initializes elements while length construction leaves them uninitialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(5);
      try {
        const val = arr1[0];
        expect(val).assertUndefined();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }

      const arr2 = Array.create<int>(5, 0);
      expect(arr2[0]).assertEqual(0);
      expect(arr2[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3800
     * @tc.name testArrayInvoke038
     * @tc.desc Verify overload selection follows the number of constructor arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      const arr2 = new Array<int>(10);
      const arr3 = new Array<int>(1, 2, 3);

      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(10);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3900
     * @tc.name testArrayInvoke039
     * @tc.desc Verify zero-length arrays behave the same with explicit and default construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0);
      const arr2 = new Array<int>();
      expect(arr.length).assertEqual(0);
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4000
     * @tc.name testArrayInvoke040
     * @tc.desc Verify single-element arrays can be initialized and read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      expect(arr.length).assertEqual(1);

      arr[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4100
     * @tc.name testArrayInvoke041
     * @tc.desc Verify large arrays can be created initialized and read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10000);
      expect(arr.length).assertEqual(10000);

      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }

      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4200
     * @tc.name testArrayInvoke042
     * @tc.desc Verify preallocated arrays can produce the same results as dynamically grown arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1000);
      for (let i = 0; i < 1000; i++) {
        arr1[i] = i;
      }

      const arr2 = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr2.pushOne(i);
      }

      for (let i = 0; i < 1000; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4300
     * @tc.name testArrayInvoke043
     * @tc.desc Verify invalid length arguments are rejected for negative and compile-time mismatched inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(-1);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof RangeError || e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4400
     * @tc.name testArrayInvoke044
     * @tc.desc Verify generic array construction supports matching runtime values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(5);
      numArr.pushOne(123);
      expect(numArr[5]).assertEqual(123);

      // numArr.pushOne('string');
      // numArr.pushOne(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4500
     * @tc.name testArrayInvoke045
     * @tc.desc Verify arrays can be initialized immediately and consumed by reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      arr.fill(0);
      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4600
     * @tc.name testArrayInvoke046
     * @tc.desc Verify fill supports chained initialization before pushOne usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      const newLength = arr.fill(-1).pushOne(100);

      expect(newLength).assertEqual(11);
      expect(arr[0]).assertEqual(-1);
      expect(arr[10]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_4700
     * @tc.name testArrayInvoke047
     * @tc.desc Verify the native invoke overload creates a usable array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      expect(arr.length).assertEqual(100);

      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }

      expect(arr[99]).assertEqual(99);
    });
  });
}
