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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item025 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

class Point035 {
  x: int;
  y: int;

  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

export default function ArrayGetTest(): void {
  describe('ArrayGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0100
     * @tc.name testArrayGet001
     * @tc.desc Verify idx parameter is required for array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const val = arr[0];
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0200
     * @tc.name testArrayGet002
     * @tc.desc Verify array get returns the first element when index is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100, 200, 300);
      const val = arr[0];
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0300
     * @tc.name testArrayGet003
     * @tc.desc Verify array get returns the last element when index is length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const val = arr[4];
      expect(val).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0400
     * @tc.name testArrayGet004
     * @tc.desc Verify array get throws RangeError for the maximum int out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      try {
        arr[2147483647];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0500
     * @tc.name testArrayGet005
     * @tc.desc Verify array get throws RangeError for the minimum int negative index scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const idx = Number.parseInt('-2147483648').toInt();
      try {
        arr[idx];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0600
     * @tc.name testArrayGet006
     * @tc.desc Verify array get throws RangeError when index exceeds array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0700
     * @tc.name testArrayGet007
     * @tc.desc Verify null index scenarios can be normalized before array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const nullableIndex: int | null = null;
      const normalizedIndex = Number(nullableIndex == null ? 0 : nullableIndex).toInt();
      const val = arr[normalizedIndex];
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0800
     * @tc.name testArrayGet008
     * @tc.desc Verify undefined index scenarios can be normalized before array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const optionalIndex: int | undefined = undefined;
      const normalizedIndex = Number(optionalIndex == undefined ? 0 : optionalIndex).toInt();
      const val = arr[normalizedIndex];
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0900
     * @tc.name testArrayGet009
     * @tc.desc Verify floating-point index values can be normalized before array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const floatIndex: number = 1.5;
      const idx = floatIndex.toInt();
      expect(idx).assertEqual(1);
      const val = arr[idx];
      expect(val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1000
     * @tc.name testArrayGet010
     * @tc.desc Verify array get accepts an index written in scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const scientificIndex: number = 1e0;
      const idx = scientificIndex.toInt();
      const val = arr[idx];
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1100
     * @tc.name testArrayGet011
     * @tc.desc Verify array get accepts a hexadecimal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const val = arr[0x2];
      expect(val).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1200
     * @tc.name testArrayGet012
     * @tc.desc Verify array get accepts an octal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const idx = 0o2;
      const val = arr[idx];
      expect(val).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1300
     * @tc.name testArrayGet013
     * @tc.desc Verify string digit index values can be normalized before array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const idx = Number.parseInt('1').toInt();
      const val = arr[idx];
      expect(val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1400
     * @tc.name testArrayGet014
     * @tc.desc Verify array get returns the element value at the specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const val = arr[1];
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1500
     * @tc.name testArrayGet015
     * @tc.desc Verify array get returns a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 42);
      const val = arr[0];
      expect(val == null).assertFalse();
      expect(val == 42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1600
     * @tc.name testArrayGet016
     * @tc.desc Verify array get returns a string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'hello');
      const val = arr[0];
      const valueType = Class.of(val).getName().split('.');
      expect(valueType[valueType.length - 1]).assertEqual('String');
      expect(val).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1700
     * @tc.name testArrayGet017
     * @tc.desc Verify array get returns null when the element value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, null, 3);
      const val = arr[1];
      expect(val).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1800
     * @tc.name testArrayGet018
     * @tc.desc Verify array get returns undefined for an undefined optional element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      const val = arr[1];
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1900
     * @tc.name testArrayGet019
     * @tc.desc Verify array get returns zero when the element value is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2);
      const val = arr[0];
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2000
     * @tc.name testArrayGet020
     * @tc.desc Verify array get returns an empty string element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a', 'b');
      const val = arr[0];
      expect(val).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2100
     * @tc.name testArrayGet021
     * @tc.desc Verify array get returns false when the element value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true);
      const val = arr[0];
      expect(val).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2200
     * @tc.name testArrayGet022
     * @tc.desc Verify array get returns a value typed as generic T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const val: int = arr[0];
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2300
     * @tc.name testArrayGet023
     * @tc.desc Verify array get returns an instance of the generic class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Item025>(1, new Item025(1));
      const val = arr[0];
      expect(val instanceof Item025).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2400
     * @tc.name testArrayGet024
     * @tc.desc Verify array get throws RangeError when accessing an empty array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2500
     * @tc.name testArrayGet025
     * @tc.desc Verify array get returns the preserved value from a single numeric constructor argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      const val = arr[0];
      expect(val).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2600
     * @tc.name testArrayGet026
     * @tc.desc Verify array get throws RangeError when accessing a nonexistent index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2700
     * @tc.name testArrayGet027
     * @tc.desc Verify array get throws RangeError when using a parsed negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const idx = Number.parseInt('-1').toInt();
      try {
        arr[idx];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2800
     * @tc.name testArrayGet028
     * @tc.desc Verify array get throws RangeError for a very large integer index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      try {
        arr[999999999];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2900
     * @tc.name testArrayGet029
     * @tc.desc Verify non-numeric index text can be detected before array get access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalidIndex: number = Number.parseInt('abc');
      expect(Number.isNaN(invalidIndex)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3000
     * @tc.name testArrayGet030
     * @tc.desc Verify array get works with Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const val = arr[1];
      expect(val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3100
     * @tc.name testArrayGet031
     * @tc.desc Verify array get works with Array<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const val = arr[1];
      expect(val).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3200
     * @tc.name testArrayGet032
     * @tc.desc Verify array get works with Array<boolean>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const val = arr[0];
      expect(val).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3300
     * @tc.name testArrayGet033
     * @tc.desc Verify array get works with an array of custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point035>(new Point035(1, 2), new Point035(3, 4));
      const val = arr[0];
      expect(val.x).assertEqual(1);
      expect(val.y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3400
     * @tc.name testArrayGet034
     * @tc.desc Verify array get works with an array using a union generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      const val1 = arr[0];
      const val2 = arr[1];
      expect(val1).assertEqual(1);
      expect(val2).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3500
     * @tc.name testArrayGet035
     * @tc.desc Verify native array get returns readable elements for each valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i] == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3600
     * @tc.name testArrayGet036
     * @tc.desc Verify array get supports repeated access to the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 42);
      ;
      for (let i = 0; i < 100; i++) {
        expect(arr[0]).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3700
     * @tc.name testArrayGet037
     * @tc.desc Verify array get can traverse and read all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3800
     * @tc.name testArrayGet038
     * @tc.desc Verify array get returns the remaining elements correctly after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.pop();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3900
     * @tc.name testArrayGet039
     * @tc.desc Verify array get throws RangeError for former tail indexes after reducing the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.length = 3;
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      try {
        arr[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4000
     * @tc.name testArrayGet040
     * @tc.desc Verify array get returns the same repeated value from different positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 1, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4100
     * @tc.name testArrayGet041
     * @tc.desc Verify array get supports consecutive reads across different indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40);
      const a = arr[0];
      const b = arr[1];
      const c = arr[2];
      const d = arr[3];
      expect(a).assertEqual(10);
      expect(b).assertEqual(20);
      expect(c).assertEqual(30);
      expect(d).assertEqual(40);
    });
  });
}
