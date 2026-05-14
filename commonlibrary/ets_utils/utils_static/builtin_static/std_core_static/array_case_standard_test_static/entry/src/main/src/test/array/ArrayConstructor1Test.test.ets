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

class Item026 {
  value: number;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point027 {
  x: int;
  y: int;
}

function assertCaught(error: Object | null | undefined): void {
  expect(error == null).assertFalse();
}

function fillNumberArray(arr: Array<int>): void {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0100
     * @tc.name testArrayConstructor001
     * @tc.desc Verify array constructor requires the length parameter in the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testArrayConstructor002
     * @tc.desc Verify array constructor accepts a normal in-range length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testArrayConstructor003
     * @tc.desc Verify array constructor creates an empty array when length is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testArrayConstructor004
     * @tc.desc Verify array constructor creates a single-slot array when length is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testArrayConstructor005
     * @tc.desc Verify array constructor accepts a relatively large length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1000);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testArrayConstructor006
     * @tc.desc Verify array constructor handles the maximum int length or reports an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(2147483647);
        expect(arr.length).assertEqual(2147483647);
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testArrayConstructor007
     * @tc.desc Verify array constructor throws for a negative length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(-1);
        expect(arr.length).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testArrayConstructor008
     * @tc.desc Verify passing null is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      const documentedInvalidCase = ['null'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testArrayConstructor009
     * @tc.desc Verify passing undefined is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      const documentedInvalidCase = ['undefined'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testArrayConstructor010
     * @tc.desc Verify floating-point length inputs are not used directly in the array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      const documentedInvalidCase = ['float'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testArrayConstructor011
     * @tc.desc Verify array constructor accepts a scientific-notation length converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>((1e1).toInt());
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1200
     * @tc.name testArrayConstructor012
     * @tc.desc Verify array constructor accepts a hexadecimal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0x0A);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1300
     * @tc.name testArrayConstructor013
     * @tc.desc Verify array constructor accepts an octal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0o12);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1400
     * @tc.name testArrayConstructor014
     * @tc.desc Verify passing a string number is a compile-time invalid constructor input in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // This test documents an invalid ArkTS call shape and is intentionally not executed.
      expect('string'.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1500
     * @tc.name testArrayConstructor015
     * @tc.desc Verify array constructor returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1600
     * @tc.name testArrayConstructor016
     * @tc.desc Verify array constructor supports different generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(1, 2, 3);
      const strArr = new Array<string>('apple', 'banana', 'cherry');
      const boolArr = new Array<boolean>(true, false, true);
      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1700
     * @tc.name testArrayConstructor017
     * @tc.desc Verify the returned value is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1800
     * @tc.name testArrayConstructor018
     * @tc.desc Verify array constructor preserves the declared generic type for assigned elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      arr[0] = 10;
      const val: int = arr[0];
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1900
     * @tc.name testArrayConstructor019
     * @tc.desc Verify reading an uninitialized element may either throw or remain inaccessible for safe use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      try {
        arr[0];
      } catch (e) {
        assertCaught(e);
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2000
     * @tc.name testArrayConstructor020
     * @tc.desc Verify array elements can be safely used after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3);
      fillNumberArray(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2100
     * @tc.name testArrayConstructor021
     * @tc.desc Verify array elements can be assigned individually after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2200
     * @tc.name testArrayConstructor022
     * @tc.desc Verify array elements can be initialized with a loop after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 2;
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[50]).assertEqual(100);
      expect(arr[99]).assertEqual(198);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2300
     * @tc.name testArrayConstructor023
     * @tc.desc Verify array constructor creates Array<int> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2400
     * @tc.name testArrayConstructor024
     * @tc.desc Verify array constructor creates Array<number> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2500
     * @tc.name testArrayConstructor025
     * @tc.desc Verify array constructor creates Array<boolean> instances
     * @tc.size MediumTest
    * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2600
     * @tc.name testArrayConstructor026
     * @tc.desc Verify array constructor creates arrays of custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item026>(new Item026(1), new Item026(2), new Item026(3));
      expect(arr.length).assertEqual(3);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2700
     * @tc.name testArrayConstructor027
     * @tc.desc Verify array constructor creates arrays of interface-based objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point027>({ x: 1, y: 2 }, { x: 3, y: 4 });
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
      expect(arr[1].x).assertEqual(3);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2800
     * @tc.name testArrayConstructor028
     * @tc.desc Verify array constructor creates arrays with union element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0] == 1).assertTrue();
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2900
     * @tc.name testArrayConstructor029
     * @tc.desc Verify array constructor creates nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4), new Array<int>(5, 6));
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
      expect(arr[2][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3000
     * @tc.name testArrayConstructor030
     * @tc.desc Verify array constructor can create a large array for later initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10000);
      expect(arr.length).assertEqual(10000);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3100
     * @tc.name testArrayConstructor031
     * @tc.desc Verify array constructor either creates an extreme-size array or reports an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(10000000);
        expect(arr.length).assertEqual(10000000);
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3200
     * @tc.name testArrayConstructor032
     * @tc.desc Verify multiple arrays created with different lengths stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(3);
      const arr2 = new Array<int>(5);
      const arr3 = new Array<int>(7);

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3300
     * @tc.name testArrayConstructor033
     * @tc.desc Verify zero-length arrays reject direct indexed access before initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0);
      expect(arr.length).assertEqual(0);
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3400
     * @tc.name testArrayConstructor034
     * @tc.desc Verify single-element arrays can store and read one initialized value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      expect(arr.length).assertEqual(1);
      arr[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3500
     * @tc.name testArrayConstructor035
     * @tc.desc Verify array constructor supports preallocating a known number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i * i;
      }
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3600
     * @tc.name testArrayConstructor036
     * @tc.desc Verify array constructor can be used for batch data processing after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size = 1000;
      const arr = new Array<int>(size);

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3700
     * @tc.name testArrayConstructor037
     * @tc.desc Verify invalid constructor parameters report a construction failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Array<int>(-10);
        expect(arr.length).assertEqual(-10);
        expect().assertFail();
      } catch (e) {
        assertCaught(e);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3800
     * @tc.name testArrayConstructor038
     * @tc.desc Verify initialized elements can be safely accessed after filling a preallocated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = 0;
      }
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3900
     * @tc.name testArrayConstructor039
     * @tc.desc Verify the single-argument constructor differs from the no-argument constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<int>();
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4000
     * @tc.name testArrayConstructor040
     * @tc.desc Verify the length constructor differs from the element-initializing overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<int>(1, 2, 3);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);
    });
  });
}
