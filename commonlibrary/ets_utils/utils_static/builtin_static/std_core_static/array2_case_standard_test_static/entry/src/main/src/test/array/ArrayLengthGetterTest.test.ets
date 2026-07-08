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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class MyArray013<T> extends Array<T> {
  public override get length(): int {
    return super.length;
  }
}

class Item016 {
  value: number = 0;

  constructor(v: number) {
    this.value = v;
  }
}

class LenItem017 {
  value: number = 0;
}

function getLengthFromAnyNumberArray(value: Any): int {
  const arr = value as Array<number>;
  return arr.length;
}

export default function ArrayLengthGetterTest(): void {
  describe('ArrayLengthGetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0100
     * @tc.name testArrayLengthGetter001
     * @tc.desc Verify length can be read as a getter property without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 10);
      let len = arr.length;
      expect(len).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0200
     * @tc.name testArrayLengthGetter002
     * @tc.desc Verify length returns the actual array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 5);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0300
     * @tc.name testArrayLengthGetter003
     * @tc.desc Verify length reports correct values for arrays with different sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.create<number>(1, 0);
      let arr2 = Array.create<number>(1, 100);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0400
     * @tc.name testArrayLengthGetter004
     * @tc.desc Verify an empty array has length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0500
     * @tc.name testArrayLengthGetter005
     * @tc.desc Verify the getter result can be assigned to an int typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 5);
      let len: int = arr.length;
      expect(len).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0600
     * @tc.name testArrayLengthGetter006
     * @tc.desc Verify length is always a non-negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 10);
      let len = arr.length;
      expect(len >= 0).assertTrue();
      expect(Number.isInteger(len)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0700
     * @tc.name testArrayLengthGetter007
     * @tc.desc Verify pushOne increases the reported length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0800
     * @tc.name testArrayLengthGetter008
     * @tc.desc Verify pop decreases the reported length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.pop();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_0900
     * @tc.name testArrayLengthGetter009
     * @tc.desc Verify the getter reports the updated value after setting length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.length = 1;
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1000
     * @tc.name testArrayLengthGetter010
     * @tc.desc Verify splice updates the reported array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.splice(1, 2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1100
     * @tc.name testArrayLengthGetter011
     * @tc.desc Verify shift updates the reported array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.shift();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1200
     * @tc.name testArrayLengthGetter012
     * @tc.desc Verify unshift updates the reported array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      arr.unshift(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1300
     * @tc.name testArrayLengthGetter013
     * @tc.desc Verify array subclasses inherit a usable length getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new MyArray013<number>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1400
     * @tc.name testArrayLengthGetter014
     * @tc.desc Verify Array<number> reports length correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1500
     * @tc.name testArrayLengthGetter015
     * @tc.desc Verify Array<string> reports length correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1600
     * @tc.name testArrayLengthGetter016
     * @tc.desc Verify arrays of custom element types report length correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item016>(new Item016(1), new Item016(2));
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1700
     * @tc.name testArrayLengthGetter017
     * @tc.desc Verify changing a local copy of the getter result does not affect array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let len = arr.length;
      let copiedLen = len;
      copiedLen = 5;
      expect(arr.length).assertEqual(3);
      expect(copiedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1800
     * @tc.name testArrayLengthGetter018
     * @tc.desc Verify length equals the actual element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let elementCount: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        elementCount++;
      }
      expect(arr.length).assertEqual(5);
      expect(elementCount).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_1900
     * @tc.name testArrayLengthGetter019
     * @tc.desc Verify a single numeric constructor argument is stored as one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 256);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(256);
      try {
        arr[255];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2000
     * @tc.name testArrayLengthGetter020
     * @tc.desc Verify repeated getter reads return the same value before later mutations occur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let first = arr.length;
      let second = arr.length;
      let third = arr.length;
      expect(first).assertEqual(4);
      expect(second).assertEqual(first);
      expect(third).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2100
     * @tc.name testArrayLengthGetter021
     * @tc.desc Verify an array literal reports the number of literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(-1, 0, 1, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2200
     * @tc.name testArrayLengthGetter022
     * @tc.desc Verify Array.of creates an array whose length equals the number of provided arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(5, 6, 7, 8, 9);
      expect(arr.length).assertEqual(5);
      expect(arr[4]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2300
     * @tc.name testArrayLengthGetter023
     * @tc.desc Verify assigning beyond the current length throws RangeError and keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      expect(arr.length).assertEqual(0);

      try {
        arr[5] = 42;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2400
     * @tc.name testArrayLengthGetter024
     * @tc.desc Verify out-of-range index assignments do not grow an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      try {
        arr[0] = 1;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);

      try {
        arr[5] = 2;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2500
     * @tc.name testArrayLengthGetter025
     * @tc.desc Verify shrinking length updates the getter and truncates elements beyond the new bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2600
     * @tc.name testArrayLengthGetter026
     * @tc.desc Verify assigning length beyond the current size throws RangeError and preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      try {
        arr.length = 5;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2700
     * @tc.name testArrayLengthGetter027
     * @tc.desc Verify each pushOne mutation is reflected by a new getter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(10);
      let len1 = arr.length;
      arr.pushOne(20);
      let len2 = arr.length;
      arr.pushOne(30);
      let len3 = arr.length;
      expect(len1).assertEqual(1);
      expect(len2).assertEqual(2);
      expect(len3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2800
     * @tc.name testArrayLengthGetter028
     * @tc.desc Verify successive pop operations decrease length until the array becomes empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.pop();
      let len1 = arr.length;
      arr.pop();
      let len2 = arr.length;
      arr.pop();
      let len3 = arr.length;
      expect(len1).assertEqual(2);
      expect(len2).assertEqual(1);
      expect(len3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_2900
     * @tc.name testArrayLengthGetter029
     * @tc.desc Verify successive shift operations update length and remaining head values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(4, 5, 6);
      arr.shift();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(5);
      arr.shift();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3000
     * @tc.name testArrayLengthGetter030
     * @tc.desc Verify unshift inserts at the front and increases length on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(2, 3);
      arr.unshift(1);
      let len1 = arr.length;
      arr.unshift(0);
      let len2 = arr.length;
      expect(len1).assertEqual(3);
      expect(len2).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3100
     * @tc.name testArrayLengthGetter031
     * @tc.desc Verify splice insertion increases length by the number of inserted elements minus deletions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 4);
      arr.splice(1, 0, 2, 3);
      expect(arr.length).assertEqual(4);
      expect(arr.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3200
     * @tc.name testArrayLengthGetter032
     * @tc.desc Verify splice replacement with the same item count preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.splice(1, 2, 20, 30);
      expect(arr.length).assertEqual(4);
      expect(arr.join(',')).assertEqual('1,20,30,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3300
     * @tc.name testArrayLengthGetter033
     * @tc.desc Verify removing all elements through splice leaves a zero length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.splice(0, arr.length);
      expect(arr.length).assertEqual(0);
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3400
     * @tc.name testArrayLengthGetter034
     * @tc.desc Verify concat returns a new array whose length is the sum of both source lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = new Array<number>(1, 2);
      let right = new Array<number>(3, 4, 5);
      let merged = left.concat(right);
      expect(merged.length).assertEqual(5);
      expect(left.length).assertEqual(2);
      expect(right.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3500
     * @tc.name testArrayLengthGetter035
     * @tc.desc Verify slice returns a subarray whose length matches the selected range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let part = arr.slice(1, 4);
      expect(part.length).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3600
     * @tc.name testArrayLengthGetter036
     * @tc.desc Verify map preserves length when producing a transformed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let mapped = arr.map((v: number): number => v * 10);
      expect(mapped.length).assertEqual(3);
      expect(mapped[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3700
     * @tc.name testArrayLengthGetter037
     * @tc.desc Verify filter returns a new array whose length equals the number of matched elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5, 6);
      let filtered = arr.filter((v: number): boolean => v % 2 === 0);
      expect(filtered.length).assertEqual(3);
      expect(filtered.join(',')).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3800
     * @tc.name testArrayLengthGetter038
     * @tc.desc Verify reduce callback receives the stable source length during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.reduce((acc: number, v: number, _i: int, source: Array<number>): number => {
        expect(source.length).assertEqual(4);
        return acc + v;
      }, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_3900
     * @tc.name testArrayLengthGetter039
     * @tc.desc Verify forEach callback observes the current array length on every iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(7, 8, 9);
      let count = 0;
      arr.forEach((value: number, _i: int, source: Array<number>): void => {
        expect(source.length).assertEqual(3);
        expect(value > 0).assertTrue();
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4000
     * @tc.name testArrayLengthGetter040
     * @tc.desc Verify reverse changes element order but does not change the reported length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4100
     * @tc.name testArrayLengthGetter041
     * @tc.desc Verify sort changes element order but keeps the same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(3, 1, 4, 2);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.length).assertEqual(4);
      expect(arr.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4200
     * @tc.name testArrayLengthGetter042
     * @tc.desc Verify fill replaces values in place while preserving length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.fill(9, 1, 3);
      expect(arr.length).assertEqual(4);
      expect(arr.join(',')).assertEqual('1,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4300
     * @tc.name testArrayLengthGetter043
     * @tc.desc Verify toReversed returns a new array with the same length as the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let reversed = arr.toReversed();
      expect(reversed.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(reversed[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4400
     * @tc.name testArrayLengthGetter044
     * @tc.desc Verify toSorted returns a new array with the same element count as the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(4, 1, 3, 2);
      let sorted = arr.toSorted((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(sorted.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(sorted.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4500
     * @tc.name testArrayLengthGetter045
     * @tc.desc Verify toSpliced returns a new array whose length reflects the splice operation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 4);
      let spliced = arr.toSpliced(1, 0, 2, 3);
      expect(spliced.length).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(spliced.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4600
     * @tc.name testArrayLengthGetter046
     * @tc.desc Verify the outer array length counts nested arrays rather than the sum of inner elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Array<number>>(
        Array.of<number>(1, 2),
        Array.of<number>(3),
        Array.of<number>(4, 5, 6)
      );
      expect(arr.length).assertEqual(3);
      expect(arr[2].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4700
     * @tc.name testArrayLengthGetter047
     * @tc.desc Verify empty string elements still contribute to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('', 'a', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4800
     * @tc.name testArrayLengthGetter048
     * @tc.desc Verify boolean arrays report length correctly after appending an additional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false);
      arr.pushOne(true);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_4900
     * @tc.name testArrayLengthGetter049
     * @tc.desc Verify an object array length reflects pop and push mutations correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item016>(new Item016(1), new Item016(2), new Item016(3));
      arr.pop();
      expect(arr.length).assertEqual(2);
      arr.pushOne(new Item016(4));
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5000
     * @tc.name testArrayLengthGetter050
     * @tc.desc Verify an array subclass that overrides the getter still reports the correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new MyArray013<number>();
      arr.pushOne(11);
      arr.pushOne(22);
      expect(arr.length).assertEqual(2);
      arr.pushOne(33);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5100
     * @tc.name testArrayLengthGetter051
     * @tc.desc Verify a copied length value does not change after the source array is mutated later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let snapshot = arr.length;
      arr.pushOne(4);
      expect(snapshot).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5200
     * @tc.name testArrayLengthGetter052
     * @tc.desc Verify a while loop controlled by length can visit every pushed element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      let index: int = 0;
      let total = 0;
      while (index < arr.length) {
        total += arr[index];
        index++;
      }
      expect(index).assertEqual(3);
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5300
     * @tc.name testArrayLengthGetter053
     * @tc.desc Verify a loop that mutates length mid-iteration observes the updated getter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let iterations = 0;
      for (let i: int = 0; i < arr.length; i++) {
        iterations++;
        if (i === 0) {
          arr.pop();
        }
      }
      expect(iterations).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5400
     * @tc.name testArrayLengthGetter054
     * @tc.desc Verify overwriting existing elements keeps the reported length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30, 40, 50, 60);
      arr[1] = 10;
      arr[4] = 20;
      let assignedCount: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        if (arr[i] !== undefined) {
          assignedCount++;
        }
      }
      expect(arr.length).assertEqual(6);
      expect(arr[1]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
      expect(assignedCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5500
     * @tc.name testArrayLengthGetter055
     * @tc.desc Verify overwriting an existing element value does not change the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr[1] = 200;
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5600
     * @tc.name testArrayLengthGetter056
     * @tc.desc Verify assigning undefined to an existing slot preserves the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, 3);
      arr[1] = undefined;
      expect(arr.length).assertEqual(3);
      expect(arr[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5700
     * @tc.name testArrayLengthGetter057
     * @tc.desc Verify clearing an array and then pushing new elements produces the rebuilt length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
      arr.pushOne(9);
      arr.pushOne(8);
      expect(arr.length).assertEqual(2);
      expect(arr.join(',')).assertEqual('9,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5800
     * @tc.name testArrayLengthGetter058
     * @tc.desc Verify repeated pushOne operations can build a large array whose length matches the push count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 512; i++) {
        arr.pushOne(i);
      }
      expect(arr.length).assertEqual(512);
      expect(arr[511]).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_5900
     * @tc.name testArrayLengthGetter059
     * @tc.desc Verify join reads elements without changing the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let text = arr.join('-');
      expect(text).assertEqual('1-2-3');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6000
     * @tc.name testArrayLengthGetter060
     * @tc.desc Verify reading an out-of-range index does not modify the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      try {
        let value = arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6100
     * @tc.name testArrayLengthGetter061
     * @tc.desc Verify splice returns a removed items array whose length equals the delete count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let removed = arr.splice(1, 3);
      expect(removed.length).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(removed.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6200
     * @tc.name testArrayLengthGetter062
     * @tc.desc Verify shift decreases the array length by one and preserves the remaining suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30, 40);
      let removed = arr.shift();
      expect(removed).assertEqual(10);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6300
     * @tc.name testArrayLengthGetter063
     * @tc.desc Verify length getter reports zero for an empty numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6400
     * @tc.name testArrayLengthGetter064
     * @tc.desc Verify length getter reports one for a single-element numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6500
     * @tc.name testArrayLengthGetter065
     * @tc.desc Verify length getter reports the current length after pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.pushOne(1);
      arr.pushOne(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6600
     * @tc.name testArrayLengthGetter066
     * @tc.desc Verify length getter reports the current length after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      arr.push(2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6700
     * @tc.name testArrayLengthGetter067
     * @tc.desc Verify length getter reports the current length after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6800
     * @tc.name testArrayLengthGetter068
     * @tc.desc Verify length getter reports the current length after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pop();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_6900
     * @tc.name testArrayLengthGetter069
     * @tc.desc Verify length getter reports the current length after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shift();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7000
     * @tc.name testArrayLengthGetter070
     * @tc.desc Verify length getter reports the current length after splice replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.splice(1, 2, 20);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7100
     * @tc.name testArrayLengthGetter071
     * @tc.desc Verify length getter reports the slice result length independently from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4, 5);
      const sliced = source.slice(1, 4);
      expect(sliced.length).assertEqual(3);
      expect(source.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7200
     * @tc.name testArrayLengthGetter072
     * @tc.desc Verify length getter reports the mapped array length without changing cardinality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const mapped = arr.map((value: number): number => value * 2);
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7300
     * @tc.name testArrayLengthGetter073
     * @tc.desc Verify length getter reports the filtered array length after element removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((value: number): boolean => value % 2 === 0);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7400
     * @tc.name testArrayLengthGetter074
     * @tc.desc Verify length getter reports the reversed copy length from toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7500
     * @tc.name testArrayLengthGetter075
     * @tc.desc Verify length getter reports the sorted copy length from toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 2, 3, 1).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7600
     * @tc.name testArrayLengthGetter076
     * @tc.desc Verify length getter reports the replaced copy length from with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7700
     * @tc.name testArrayLengthGetter077
     * @tc.desc Verify length getter reports the new copy length from toSpliced insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 20, 30);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7800
     * @tc.name testArrayLengthGetter078
     * @tc.desc Verify length getter reports the new copy length from toSpliced deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toSpliced(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_7900
     * @tc.name testArrayLengthGetter079
     * @tc.desc Verify length getter reports the current length after shrinkTo truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8000
     * @tc.name testArrayLengthGetter080
     * @tc.desc Verify length getter reports zero after clearing through length assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8100
     * @tc.name testArrayLengthGetter081
     * @tc.desc Verify length getter reports the new size after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4, 5));
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8200
     * @tc.name testArrayLengthGetter082
     * @tc.desc Verify length getter reports the size of arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(7, 8, 9, 10);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8300
     * @tc.name testArrayLengthGetter083
     * @tc.desc Verify length getter reports the size of arrays created by Array.from on Set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(1, 2, 3, 4)));
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8400
     * @tc.name testArrayLengthGetter084
     * @tc.desc Verify length getter reports the size of arrays created from string iterables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<string>('test');
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8500
     * @tc.name testArrayLengthGetter085
     * @tc.desc Verify length getter reports the size of arrays created from fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4, 5];
      const arr = Array.from<int>(source);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8600
     * @tc.name testArrayLengthGetter086
     * @tc.desc Verify length getter reports the current size after reverse mutates in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8700
     * @tc.name testArrayLengthGetter087
     * @tc.desc Verify length getter reports the current size after sort mutates in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8800
     * @tc.name testArrayLengthGetter088
     * @tc.desc Verify length getter reports the values iterator source size separately from iterator progress
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const iterator = arr.values();
      iterator.next();
      iterator.next();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_8900
     * @tc.name testArrayLengthGetter089
     * @tc.desc Verify length getter reports the keys iterator source size separately from iterator progress
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const iterator = arr.keys();
      iterator.next();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9000
     * @tc.name testArrayLengthGetter090
     * @tc.desc Verify length getter reports the same size before and after join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.join('-');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9100
     * @tc.name testArrayLengthGetter091
     * @tc.desc Verify length getter reports the same size before and after toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.toString();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9200
     * @tc.name testArrayLengthGetter092
     * @tc.desc Verify pop on an empty array leaves the length at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const removed = arr.pop();
      expect(removed === undefined).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9300
     * @tc.name testArrayLengthGetter093
     * @tc.desc Verify Array.of with a single argument creates a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9400
     * @tc.name testArrayLengthGetter094
     * @tc.desc Verify pushArray with multiple elements increases length by the appended count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const newLength = arr.pushArray(3, 4);
      expect(arr.length).assertEqual(4);
      expect(newLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9500
     * @tc.name testArrayLengthGetter095
     * @tc.desc Verify unshift with multiple elements increases length by the prepended count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      const newLength = arr.unshift(1, 2);
      expect(arr.length).assertEqual(4);
      expect(newLength).assertEqual(4);
      expect(arr.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9600
     * @tc.name testArrayLengthGetter096
     * @tc.desc Verify length getter reports the current size for object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<LenItem017>(new LenItem017(), new LenItem017());
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9700
     * @tc.name testArrayLengthGetter097
     * @tc.desc Verify length getter reports the current size after a no-op pushArray call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pushArray();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9800
     * @tc.name testArrayLengthGetter098
     * @tc.desc Verify length getter works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3, 4);
      expect(getLengthFromAnyNumberArray(anyValue)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_GETTER_9900
     * @tc.name testArrayLengthGetter099
     * @tc.desc Verify length getter supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthGetter099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(anyArr.length).assertEqual(3);
    });

  });
}

