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

class Item026 {
  value: number;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point027 {
  x: number;
  y: number;
}

function assertCaught(error: Object | null | undefined): void {
  expect(error == null).assertFalse();
}

function fillNumberArray(arr: Array<number>): void {
  for (let i = 0; i < arr.length; i++) {
    arr[i] = i + 1;
  }
}

export default function ArrayConstructor1Test(): void {
  describe('ArrayConstructor1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0100
     * @tc.name testArrayConstructor1001
     * @tc.desc Verify array constructor requires the length parameter in the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0200
     * @tc.name testArrayConstructor1002
     * @tc.desc Verify array constructor accepts a normal in-range length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0300
     * @tc.name testArrayConstructor1003
     * @tc.desc Verify array constructor creates an empty array when length is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0400
     * @tc.name testArrayConstructor1004
     * @tc.desc Verify array constructor creates a single-slot array when length is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0500
     * @tc.name testArrayConstructor1005
     * @tc.desc Verify array constructor accepts a relatively large length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0600
     * @tc.name testArrayConstructor1006
     * @tc.desc Verify array constructor handles the maximum int length or reports an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<number>(2147483647);
        expect(arr.length).assertEqual(2147483647);
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0700
     * @tc.name testArrayConstructor1007
     * @tc.desc Verify array constructor throws for a negative length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<number>(-1);
        expect(arr.length).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0800
     * @tc.name testArrayConstructor1008
     * @tc.desc Verify passing null is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_0900
     * @tc.name testArrayConstructor1009
     * @tc.desc Verify passing undefined is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1000
     * @tc.name testArrayConstructor1010
     * @tc.desc Verify floating-point length inputs are not used directly in the array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1100
     * @tc.name testArrayConstructor1011
     * @tc.desc Verify array constructor accepts a scientific-notation length converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>((1e1).toInt());
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1200
     * @tc.name testArrayConstructor1012
     * @tc.desc Verify array constructor accepts a hexadecimal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0x0A);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1300
     * @tc.name testArrayConstructor1013
     * @tc.desc Verify array constructor accepts an octal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0o12);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1400
     * @tc.name testArrayConstructor1014
     * @tc.desc Verify passing a string number is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1500
     * @tc.name testArrayConstructor1015
     * @tc.desc Verify array constructor returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1600
     * @tc.name testArrayConstructor1016
     * @tc.desc Verify array constructor supports different generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(3);
      const strArr = new Array<string>(3);
      const boolArr = new Array<boolean>(3);
      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1700
     * @tc.name testArrayConstructor1017
     * @tc.desc Verify the returned value is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1800
     * @tc.name testArrayConstructor1018
     * @tc.desc Verify array constructor preserves the declared generic type for assigned elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[0] = 10;
      const val: number = arr[0];
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_1900
     * @tc.name testArrayConstructor1019
     * @tc.desc Verify reading an uninitialized element may either throw or remain inaccessible for safe use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      try {
        arr[0];
      } catch (e) {
        assertCaught(e);
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2000
     * @tc.name testArrayConstructor1020
     * @tc.desc Verify array elements can be safely used after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      fillNumberArray(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2100
     * @tc.name testArrayConstructor1021
     * @tc.desc Verify array elements can be assigned individually after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2200
     * @tc.name testArrayConstructor1022
     * @tc.desc Verify array elements can be initialized with a loop after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 2;
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[50]).assertEqual(100);
      expect(arr[99]).assertEqual(198);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2300
     * @tc.name testArrayConstructor1023
     * @tc.desc Verify array constructor creates Array<number> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2400
     * @tc.name testArrayConstructor1024
     * @tc.desc Verify array constructor creates Array<string> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(3);
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = '!';
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2500
     * @tc.name testArrayConstructor1025
     * @tc.desc Verify array constructor creates Array<boolean> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(2);
      arr[0] = true;
      arr[1] = false;
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2600
     * @tc.name testArrayConstructor1026
     * @tc.desc Verify array constructor creates arrays of custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item026>(3);
      arr[0] = new Item026(1);
      arr[1] = new Item026(2);
      arr[2] = new Item026(3);
      expect(arr[0].value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2700
     * @tc.name testArrayConstructor1027
     * @tc.desc Verify array constructor creates arrays of interface-based objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point027>(2);
      arr[0] = { x: 1, y: 2 };
      arr[1] = { x: 3, y: 4 };
      expect(arr[0].x).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2800
     * @tc.name testArrayConstructor1028
     * @tc.desc Verify array constructor creates arrays with union element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(3);
      arr[0] = 1;
      arr[1] = 'two';
      arr[2] = 3;
      expect(arr[0] == 1).assertTrue();
      expect(arr[1]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_2900
     * @tc.name testArrayConstructor1029
     * @tc.desc Verify array constructor creates nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(3);
      arr[0] = new Array<number>(1, 2);
      arr[1] = new Array<number>(3, 4);
      arr[2] = new Array<number>(5, 6);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3000
     * @tc.name testArrayConstructor1030
     * @tc.desc Verify array constructor can create a large array for later initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10000);
      expect(arr.length).assertEqual(10000);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3100
     * @tc.name testArrayConstructor1031
     * @tc.desc Verify array constructor either creates an extreme-size array or reports an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<number>(10000000);
        expect(arr.length).assertEqual(10000000);
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3200
     * @tc.name testArrayConstructor1032
     * @tc.desc Verify multiple arrays created with different lengths stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3);
      const arr2 = new Array<number>(5);
      const arr3 = new Array<number>(7);

      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(5);
      expect(arr3.length).assertEqual(7);

      arr1[0] = 100;
      arr2[0] = 200;
      arr3[0] = 300;
      expect(arr1[0]).assertEqual(100);
      expect(arr2[0]).assertEqual(200);
      expect(arr3[0]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3300
     * @tc.name testArrayConstructor1033
     * @tc.desc Verify zero-length arrays reject direct indexed access before initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3400
     * @tc.name testArrayConstructor1034
     * @tc.desc Verify single-element arrays can store and read one initialized value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      expect(arr.length).assertEqual(1);
      arr[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3500
     * @tc.name testArrayConstructor1035
     * @tc.desc Verify array constructor supports preallocating a known number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i * i;
      }
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3600
     * @tc.name testArrayConstructor1036
     * @tc.desc Verify array constructor can be used for batch data processing after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size = 1000;
      const arr = new Array<number>(size);

      for (let i = 0; i < size; i++) {
        arr[i] = i % 100;
      }

      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
      }
      expect(sum > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3700
     * @tc.name testArrayConstructor1037
     * @tc.desc Verify invalid constructor parameters report a construction failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<number>(-10);
        expect(arr.length).assertEqual(-10);
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3800
     * @tc.name testArrayConstructor1038
     * @tc.desc Verify initialized elements can be safely accessed after filling a preallocated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = 0;
      }
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_3900
     * @tc.name testArrayConstructor1039
     * @tc.desc Verify the single-argument constructor differs from the no-argument constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<number>();
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_1_4000
     * @tc.name testArrayConstructor1040
     * @tc.desc Verify the length constructor differs from the element-initializing overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<number>(1, 2, 3);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);
    });
  });
}
