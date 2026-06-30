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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
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
     * @tc.name testArrayConstructor1001
     * @tc.desc Verify a single numeric constructor argument creates a one-element array that preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
      expect(JSON.stringify(arr)).assertEqual('[5]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testArrayConstructor1002
     * @tc.desc Verify zero creates a one-element array whose value is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testArrayConstructor1003
     * @tc.desc Verify the numeric argument one creates a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testArrayConstructor1004
     * @tc.desc Verify the maximum int argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 2147483647);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testArrayConstructor1005
     * @tc.desc Verify a scientific-notation numeric argument converted to int is preserved as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, (1e1).toInt());
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testArrayConstructor1006
     * @tc.desc Verify an octal numeric argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0o12);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testArrayConstructor1007
     * @tc.desc Verify a single numeric constructor call still returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testArrayConstructor1008
     * @tc.desc Verify array constructor supports different generic element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>(1, 2, 3);
      const strArr = new Array<string>('apple', 'banana', 'cherry');
      const boolArr = new Array<boolean>(true, false, true);
      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testArrayConstructor1009
     * @tc.desc Verify the returned value is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testArrayConstructor1010
     * @tc.desc Verify array constructor preserves the declared generic type for assigned elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      arr[0] = 10;
      const val: int = arr[0];
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testArrayConstructor1011
     * @tc.desc Verify the first element can be reassigned after single-item construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 3);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3);
      arr[0] = 10;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1200
     * @tc.name testArrayConstructor1012
     * @tc.desc Verify loop-based reassignment only processes the single constructed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 2;
      }
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1300
     * @tc.name testArrayConstructor1013
     * @tc.desc Verify a single numeric argument still creates an Array<int> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1400
     * @tc.name testArrayConstructor1014
     * @tc.desc Verify array constructor creates Array<number> instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1500
     * @tc.name testArrayConstructor1015
     * @tc.desc Verify array constructor creates arrays of custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item026>(new Item026(1), new Item026(2), new Item026(3));
      expect(arr.length).assertEqual(3);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1600
     * @tc.name testArrayConstructor1016
     * @tc.desc Verify array constructor creates arrays of interface-based objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point027>({ x: 1, y: 2 }, { x: 3, y: 4 });
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
      expect(arr[1].x).assertEqual(3);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1700
     * @tc.name testArrayConstructor1017
     * @tc.desc Verify array constructor creates arrays with union element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0] == 1).assertTrue();
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1800
     * @tc.name testArrayConstructor1018
     * @tc.desc Verify array constructor creates nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4), new Array<int>(5, 6));
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
      expect(arr[2][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1900
     * @tc.name testArrayConstructor1019
     * @tc.desc Verify a large numeric argument is preserved before later reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10000);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10000);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2000
     * @tc.name testArrayConstructor1020
     * @tc.desc Verify an extreme numeric argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10000000);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2100
     * @tc.name testArrayConstructor1021
     * @tc.desc Verify multiple single-item arrays created from numeric arguments stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 3);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual(3);
      const arr2 = Array.create<int>(1, 5);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(5);
      const arr3 = Array.create<int>(1, 7);
      expect(arr3.length).assertEqual(1);
      expect(arr3[0]).assertEqual(7);

      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(1);
      expect(arr3.length).assertEqual(1);

      arr1[0] = 100;
      arr2[0] = 200;
      arr3[0] = 300;
      expect(arr1[0]).assertEqual(100);
      expect(arr2[0]).assertEqual(200);
      expect(arr3[0]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2200
     * @tc.name testArrayConstructor1022
     * @tc.desc Verify single-element arrays can store and read one initialized value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      expect(arr.length).assertEqual(1);
      arr[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2300
     * @tc.name testArrayConstructor1023
     * @tc.desc Verify a numeric constructor result can be reassigned during later processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * i;
      }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2400
     * @tc.name testArrayConstructor1024
     * @tc.desc Verify batch-style processing works on the single constructed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size = 1000;
      const arr = Array.create<int>(1, size);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(size);

      for (let i = 0; i < arr.length; i++) {
        arr[i] = i % 100;
      }

      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
      }
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2500
     * @tc.name testArrayConstructor1025
     * @tc.desc Verify another negative numeric argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2600
     * @tc.name testArrayConstructor1026
     * @tc.desc Verify the single constructed element can be reassigned and read after loop-based initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = 0;
      }
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2700
     * @tc.name testArrayConstructor1027
     * @tc.desc Verify the single-numeric constructor differs from the multi-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 5);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual(5);

      const arr2 = new Array<int>(1, 2, 3);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2800
     * @tc.name testArrayConstructor1028
     * @tc.desc Verify NaN is preserved as the only element in a single-number constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, NaN);
      expect(arr.length).assertEqual(1);
      expect(arr[0] != arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2900
     * @tc.name testArrayConstructor1029
     * @tc.desc Verify Infinity is preserved as the only element in a single-number constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, Infinity);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3000
     * @tc.name testArrayConstructor1030
     * @tc.desc Verify negative Infinity is preserved as the only element in a single-number constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, -Infinity);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3100
     * @tc.name testArrayConstructor1031
     * @tc.desc Verify negative zero remains distinguishable from positive zero in the single-number constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, -0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(1 / arr[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3200
     * @tc.name testArrayConstructor1032
     * @tc.desc Verify Number.MAX_SAFE_INTEGER is preserved as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Number.MAX_SAFE_INTEGER;
      const arr = Array.create<number>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3300
     * @tc.name testArrayConstructor1033
     * @tc.desc Verify Number.MIN_SAFE_INTEGER is preserved as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Number.MIN_SAFE_INTEGER;
      const arr = Array.create<number>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3400
     * @tc.name testArrayConstructor1034
     * @tc.desc Verify Number.MIN_VALUE is preserved as the only element in the single-number constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Number.MIN_VALUE;
      const arr = Array.create<number>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3500
     * @tc.name testArrayConstructor1035
     * @tc.desc Verify Number.EPSILON is preserved as the only element in the single-number constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Number.EPSILON;
      const arr = Array.create<number>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });
  });
}
