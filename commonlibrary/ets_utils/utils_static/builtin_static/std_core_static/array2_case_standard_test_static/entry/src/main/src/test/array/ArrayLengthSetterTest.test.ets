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

class Item025 {
  value: number = 0;

  constructor(v: number) {
    this.value = v;
  }
}

function createSequentialArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function trimAnyNumberArrayByLength(value: Any, target: int): string {
  const arr = value as Array<number>;
  arr.length = target;
  return arr.toString() + '|' + arr.length.toString();
}

export default function ArrayLengthSetterTest(): void {
  describe('ArrayLengthSetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0100
     * @tc.name testArrayLengthSetter001
     * @tc.desc Verify assigning a normal integer value shortens the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0200
     * @tc.name testArrayLengthSetter002
     * @tc.desc Verify assigning zero clears the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
      expect(arr.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0300
     * @tc.name testArrayLengthSetter003
     * @tc.desc Verify assigning a very large int value throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      try {
        arr.length = 2147483647;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0400
     * @tc.name testArrayLengthSetter004
     * @tc.desc Verify assigning a negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      try {
        arr.length = -1;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0500
     * @tc.name testArrayLengthSetter005
     * @tc.desc Verify assigning null cast to int causes a runtime cast failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      try {
        arr.length = null as int;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0600
     * @tc.name testArrayLengthSetter006
     * @tc.desc Verify assigning undefined cast to int causes a runtime cast failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      try {
        arr.length = undefined as int;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0700
     * @tc.name testArrayLengthSetter007
     * @tc.desc Verify a floating-point value cast to int is truncated before assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.length = (2.5).toInt();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0800
     * @tc.name testArrayLengthSetter008
     * @tc.desc Verify assigning a value greater than the current length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      try {
        arr.length = 10;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_0900
     * @tc.name testArrayLengthSetter009
     * @tc.desc Verify a scientific notation value can be cast and assigned as a new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = (1e0).toInt();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1000
     * @tc.name testArrayLengthSetter010
     * @tc.desc Verify a hexadecimal value can be assigned as a new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let newLen: int = 0x2;
      arr.length = newLen;
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1100
     * @tc.name testArrayLengthSetter011
     * @tc.desc Verify an octal literal value can be assigned as a new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let newLen: int = 0o2;
      arr.length = newLen;
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1200
     * @tc.name testArrayLengthSetter012
     * @tc.desc Verify a binary literal value can be assigned as a new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let newLen: int = 0b10;
      arr.length = newLen;
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1300
     * @tc.name testArrayLengthSetter013
     * @tc.desc Verify the assignment expression returns the assigned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: int = (arr.length = 1);
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1400
     * @tc.name testArrayLengthSetter014
     * @tc.desc Verify a negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      try {
        arr.length = -5;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1500
     * @tc.name testArrayLengthSetter015
     * @tc.desc Verify assigning the current actual length keeps the array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let currentLen = arr.length;
      arr.length = currentLen;
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1600
     * @tc.name testArrayLengthSetter016
     * @tc.desc Verify assigning non-numeric text cast to int causes a runtime cast failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let invalid: Object = 'abc' as Object;
      try {
        arr.length = invalid as int;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1700
     * @tc.name testArrayLengthSetter017
     * @tc.desc Verify assigning an object cast to int causes a runtime cast failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let invalid: Object = {} as Object;
      try {
        arr.length = invalid as int;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1800
     * @tc.name testArrayLengthSetter018
     * @tc.desc Verify shortening removes elements beyond the new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_1900
     * @tc.name testArrayLengthSetter019
     * @tc.desc Verify setting length to zero makes the array empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2000
     * @tc.name testArrayLengthSetter020
     * @tc.desc Verify shortening to one element preserves the first string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      arr.length = 1;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2100
     * @tc.name testArrayLengthSetter021
     * @tc.desc Verify repeated assignments can shorten the array step by step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 4;
      expect(arr.length).assertEqual(4);
      arr.length = 2;
      expect(arr.length).assertEqual(2);
      arr.length = 1;
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2200
     * @tc.name testArrayLengthSetter022
     * @tc.desc Verify each shortening step preserves the remaining prefix values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 3;
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      arr.length = 1;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2300
     * @tc.name testArrayLengthSetter023
     * @tc.desc Verify Array<number> can be shortened with the length setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.length = 2;
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2400
     * @tc.name testArrayLengthSetter024
     * @tc.desc Verify Array<string> can be shortened with the length setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      arr.length = 1;
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2500
     * @tc.name testArrayLengthSetter025
     * @tc.desc Verify arrays of object elements can be shortened with the length setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item025>(new Item025(1), new Item025(2), new Item025(3));
      arr.length = 2;
      expect(arr.length).assertEqual(2);
      expect(arr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2600
     * @tc.name testArrayLengthSetter026
     * @tc.desc Verify length can be assigned immediately after array creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(5, 4, 3, 2, 1);
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2700
     * @tc.name testArrayLengthSetter027
     * @tc.desc Verify the array can be shortened after push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      arr.pushOne(3);
      arr.pushOne(4);
      expect(arr.length).assertEqual(4);
      arr.length = 2;
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2800
     * @tc.name testArrayLengthSetter028
     * @tc.desc Verify push operations still work after the array is shortened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 2;
      arr.pushOne(10);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_2900
     * @tc.name testArrayLengthSetter029
     * @tc.desc Verify a single-element array can be shortened to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      arr.length = 0;
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3000
     * @tc.name testArrayLengthSetter030
     * @tc.desc Verify a large array can be shortened by one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createSequentialArray(100);
      arr.length = 99;
      expect(arr.length).assertEqual(99);
      expect(arr[98]).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3100
     * @tc.name testArrayLengthSetter031
     * @tc.desc Verify assigning length 1 keeps only the numeric head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 1;
      expect(arr.length).assertEqual(1);
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3200
     * @tc.name testArrayLengthSetter032
     * @tc.desc Verify assigning length 2 preserves an emoji element in the retained prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, '🌍', 3, 4, 5);
      arr.length = 2;
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('1,🌍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3300
     * @tc.name testArrayLengthSetter033
     * @tc.desc Verify assigning length 3 preserves a null entry inside the retained prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, 4, 5);
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3400
     * @tc.name testArrayLengthSetter034
     * @tc.desc Verify assigning length 4 keeps mixed string content in the remaining segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'undefined', 3, 'tail', 5);
      arr.length = 4;
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('1,undefined,3,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3500
     * @tc.name testArrayLengthSetter035
     * @tc.desc Verify assigning length 5 keeps an object-containing array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const marker = new Item025(2);
      const arr = new Array<Item025 | number>(1, marker, 3, 4, 5);
      arr.length = 5;
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(marker);
      expect((arr[1] as Item025).value).assertEqual(2);
      expect(arr.toString()).assertEqual('1,[object Object],3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3600
     * @tc.name testArrayLengthSetter036
     * @tc.desc Verify assigning length 10 throws RangeError and keeps existing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.length = 10;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3700
     * @tc.name testArrayLengthSetter037
     * @tc.desc Verify assigning length 20 to an empty array throws RangeError and keeps length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      try {
        arr.length = 20;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3800
     * @tc.name testArrayLengthSetter038
     * @tc.desc Verify shortening an object array preserves retained element references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item025(1);
      const second = new Item025(2);
      const third = new Item025(3);
      const arr = new Array<Item025>(first, second, third);
      arr.length = 2;
      first.value = 10;
      expect(arr.length).assertEqual(2);
      expect(arr[0] === first).assertTrue();
      expect(arr[1] === second).assertTrue();
      expect(arr[0].value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_3900
     * @tc.name testArrayLengthSetter039
     * @tc.desc Verify assigning length 2 trims numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      arr.length = 2;
      expect(arr.toString()).assertEqual('2,3');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4000
     * @tc.name testArrayLengthSetter040
     * @tc.desc Verify assigning a larger length throws RangeError and keeps the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.length = 6;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4100
     * @tc.name testArrayLengthSetter041
     * @tc.desc Verify assigning zero length clears the array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4200
     * @tc.name testArrayLengthSetter042
     * @tc.desc Verify assigning one length keeps only the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 8, 7);
      arr.length = 1;
      expect(arr.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4300
     * @tc.name testArrayLengthSetter043
     * @tc.desc Verify assigning the same length leaves content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const before = arr.toString();
      arr.length = 3;
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4400
     * @tc.name testArrayLengthSetter044
     * @tc.desc Verify clearing an array and then popping keeps the length at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      const removed = arr.pop();
      expect(removed === undefined).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4500
     * @tc.name testArrayLengthSetter045
     * @tc.desc Verify clearing an array and then shifting keeps the length at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      arr.length = 0;
      const removed = arr.shift();
      expect(removed === undefined).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4600
     * @tc.name testArrayLengthSetter046
     * @tc.desc Verify pushArray can rebuild an array after the length setter clears it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      arr.length = 0;
      const newLength = arr.pushArray(7, 8);
      expect(newLength).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4700
     * @tc.name testArrayLengthSetter047
     * @tc.desc Verify unshift grows the shortened prefix from the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 1;
      const newLength = arr.unshift(0);
      expect(newLength).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4800
     * @tc.name testArrayLengthSetter048
     * @tc.desc Verify pushArray appends multiple elements after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      const newLength = arr.pushArray(30, 40);
      expect(newLength).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_4900
     * @tc.name testArrayLengthSetter049
     * @tc.desc Verify reverse keeps the shortened length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5000
     * @tc.name testArrayLengthSetter050
     * @tc.desc Verify sort only reorders the preserved prefix after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2, 4);
      arr.length = 3;
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
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5100
     * @tc.name testArrayLengthSetter051
     * @tc.desc Verify fill mutates values in place without changing the shortened length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(8, 9, 10, 11);
      arr.length = 2;
      arr.fill(7);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5200
     * @tc.name testArrayLengthSetter052
     * @tc.desc Verify pop removes the last preserved element after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 3;
      const removed = arr.pop();
      expect(removed).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5300
     * @tc.name testArrayLengthSetter053
     * @tc.desc Verify shift removes the first preserved element after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 3;
      const removed = arr.shift();
      expect(removed).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5400
     * @tc.name testArrayLengthSetter054
     * @tc.desc Verify splice insertion grows the truncated array from its current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 3;
      arr.splice(1, 0, 20, 30);
      expect(arr.length).assertEqual(5);
      expect(arr.toString()).assertEqual('1,20,30,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5500
     * @tc.name testArrayLengthSetter055
     * @tc.desc Verify splice can remove all preserved elements after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.length = 3;
      const removed = arr.splice(0, 3);
      expect(removed.length).assertEqual(3);
      expect(arr.length).assertEqual(0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5600
     * @tc.name testArrayLengthSetter056
     * @tc.desc Verify assigning the same shortened length is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(13, 14, 15, 16);
      arr.length = 2;
      const before = arr.toString();
      arr.length = 2;
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5700
     * @tc.name testArrayLengthSetter057
     * @tc.desc Verify a rebuilt array can be truncated again through the length setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(14, 15, 16, 17);
      arr.length = 2;
      arr.pushOne(33);
      arr.length = 1;
      expect(arr.length).assertEqual(1);
      expect(arr.toString()).assertEqual('14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5800
     * @tc.name testArrayLengthSetter058
     * @tc.desc Verify clearing and rebuilding a single element can still be popped back to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(15, 16, 17);
      arr.length = 0;
      arr.pushOne(34);
      const removed = arr.pop();
      expect(removed).assertEqual(34);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_5900
     * @tc.name testArrayLengthSetter059
     * @tc.desc Verify string arrays can be shortened and then extended from the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.length = 1;
      const newLength = arr.unshift('z');
      expect(newLength).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('z,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6000
     * @tc.name testArrayLengthSetter060
     * @tc.desc Verify boolean arrays can be shortened and then extended with pushArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      arr.length = 2;
      const newLength = arr.pushArray(true, false);
      expect(newLength).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr.toString()).assertEqual('true,false,true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6100
     * @tc.name testArrayLengthSetter061
     * @tc.desc Verify object arrays can be shortened and then extended with new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item025>(new Item025(1), new Item025(2), new Item025(3));
      arr.length = 1;
      arr.pushOne(new Item025(9));
      expect(arr.length).assertEqual(2);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6200
     * @tc.name testArrayLengthSetter062
     * @tc.desc Verify a rebuilt suffix can be truncated again without affecting the preserved prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(19, 20, 21, 22);
      arr.length = 2;
      arr.pushArray(38, 39);
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('19,20,38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6300
     * @tc.name testArrayLengthSetter063
     * @tc.desc Verify length can be shortened with a computed int target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(20, 21, 22, 23, 24);
      const target: int = arr.length - 2;
      arr.length = target;
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('20,21,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6400
     * @tc.name testArrayLengthSetter064
     * @tc.desc Verify pop returns the latest appended value after shrinking and rebuilding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(21, 22, 23);
      arr.length = 1;
      arr.pushArray(40, 41, 42);
      const removed = arr.pop();
      expect(removed).assertEqual(42);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('21,40,41');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6500
     * @tc.name testArrayLengthSetter065
     * @tc.desc Verify length setter works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3, 4);
      expect(trimAnyNumberArrayByLength(anyValue, 2)).assertEqual('1,2|2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LENGTH_SETTER_6600
     * @tc.name testArrayLengthSetter066
     * @tc.desc Verify length setter supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLengthSetter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      anyArr.length = 2;
      expect(anyArr.length).assertEqual(2);
      expect(anyArr.toString()).assertEqual('1,two');
    });

  });
}
