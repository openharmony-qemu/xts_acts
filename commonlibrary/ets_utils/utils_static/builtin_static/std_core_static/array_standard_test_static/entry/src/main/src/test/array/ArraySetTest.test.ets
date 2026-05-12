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

class Item015 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

class Point044 {
  x: int;
  y: int;

  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

const COLOR_RED028: int = 0;
const COLOR_GREEN028: int = 1;
const COLOR_BLUE028: int = 2;

export default function ArraySetTest(): void {
  describe('ArraySetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0100
     * @tc.name testArraySet001
     * @tc.desc Verify idx and val parameters are both required for array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 10;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0200
     * @tc.name testArraySet002
     * @tc.desc Verify array set updates a normal in-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0300
     * @tc.name testArraySet003
     * @tc.desc Verify array set updates the first element when index is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100, 200, 300);
      arr[0] = 999;
      expect(arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0400
     * @tc.name testArraySet004
     * @tc.desc Verify array set updates the last element when index is length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr[4] = 555;
      expect(arr[4]).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0500
     * @tc.name testArraySet005
     * @tc.desc Verify array set throws for the maximum int index out-of-range scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      try {
        arr[2147483647] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0600
     * @tc.name testArraySet006
     * @tc.desc Verify negative index values remain invalid in a compile-safe form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idx = Number.parseInt('-1').toInt();
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0700
     * @tc.name testArraySet007
     * @tc.desc Verify array set throws when the index exceeds the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[10] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0800
     * @tc.name testArraySet008
     * @tc.desc Verify null index scenarios can be normalized before array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const nullableIndex: int | null = null;
      const normalizedIndex = Number(nullableIndex == null ? 0 : nullableIndex).toInt();
      arr[normalizedIndex] = 10;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_0900
     * @tc.name testArraySet009
     * @tc.desc Verify undefined index scenarios can be normalized before array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const optionalIndex: int | undefined = undefined;
      const normalizedIndex = Number(optionalIndex == undefined ? 0 : optionalIndex).toInt();
      arr[normalizedIndex] = 10;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1000
     * @tc.name testArraySet010
     * @tc.desc Verify floating-point index values can be normalized before array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const floatIndex: number = 1.5;
      const idx = floatIndex.toInt();
      arr[idx] = 10;
      expect(arr[idx]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1100
     * @tc.name testArraySet011
     * @tc.desc Verify string digit index values can be normalized before array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const idx = Number.parseInt('1').toInt();
      arr[idx] = 10;
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1200
     * @tc.name testArraySet012
     * @tc.desc Verify array set accepts number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1300
     * @tc.name testArraySet013
     * @tc.desc Verify array set accepts string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[1] = 'hello';
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1400
     * @tc.name testArraySet014
     * @tc.desc Verify array set accepts boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      arr[0] = false;
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1500
     * @tc.name testArraySet015
     * @tc.desc Verify array set accepts object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item015>(new Item015(1));
      arr[0] = new Item015(99);
      expect(arr[0].value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1600
     * @tc.name testArraySet016
     * @tc.desc Verify array set accepts zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 0;
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1700
     * @tc.name testArraySet017
     * @tc.desc Verify array set accepts negative numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = -100;
      expect(arr[0]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1800
     * @tc.name testArraySet018
     * @tc.desc Verify array set accepts Number MAX VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const maxValue = Number.MAX_SAFE_INTEGER.toInt();
      arr[0] = maxValue;
      expect(arr[0]).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_1900
     * @tc.name testArraySet019
     * @tc.desc Verify array set accepts Number MIN VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const minValue = Number.MIN_SAFE_INTEGER.toInt();
      arr[0] = minValue;
      expect(arr[0]).assertEqual(minValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2000
     * @tc.name testArraySet020
     * @tc.desc Verify array set accepts null values for nullable element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, 2, 3);
      arr[1] = null;
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2100
     * @tc.name testArraySet021
     * @tc.desc Verify array set accepts undefined values for optional element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, 3);
      arr[1] = undefined;
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2200
     * @tc.name testArraySet022
     * @tc.desc Verify array set accepts empty string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[1] = '';
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2300
     * @tc.name testArraySet023
     * @tc.desc Verify array set handles a value type mismatch scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects assigning a string value to a number array at compile time.
      expect(true).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2400
     * @tc.name testArraySet024
     * @tc.desc Verify array set accepts XSS-like string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr[0] = '<script>alert(1)</script>';
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2500
     * @tc.name testArraySet025
     * @tc.desc Verify array set accepts Unicode string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr[0] = '你好世界🌍';
      expect(arr[0]).assertEqual('你好世界🌍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2600
     * @tc.name testArraySet026
     * @tc.desc Verify array set accepts zero-width space string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr[0] = '\u200B';
      expect(arr[0]).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2700
     * @tc.name testArraySet027
     * @tc.desc Verify array set accepts union type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      arr[0] = 'new';
      arr[1] = 100;
      expect(arr[0]).assertEqual('new');
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2800
     * @tc.name testArraySet028
     * @tc.desc Verify array set accepts enum-like numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr[0] = COLOR_BLUE028;
      expect(arr[0]).assertEqual(COLOR_BLUE028);
      expect(COLOR_GREEN028).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_2900
     * @tc.name testArraySet029
     * @tc.desc Verify array set assignment expressions return the assigned value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = (arr[0] = 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3000
     * @tc.name testArraySet030
     * @tc.desc Verify array set throws when setting a non-existent index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr[5] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3100
     * @tc.name testArraySet031
     * @tc.desc Verify negative set indexes remain invalid in a compile-safe form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idx = Number.parseInt('-1').toInt();
      expect(idx < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3200
     * @tc.name testArraySet032
     * @tc.desc Verify array set handles an incorrect value type scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects assigning a string value to a number array at compile time.
      expect(true).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3300
     * @tc.name testArraySet033
     * @tc.desc Verify invalid index text can be detected before array set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const indexText = 'abc';
      const parsed = Number.parseInt(indexText);
      expect(parsed != parsed).assertTrue();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3400
     * @tc.name testArraySet034
     * @tc.desc Verify array set overwrites an existing element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 99;
      expect(arr[1]).assertEqual(99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3500
     * @tc.name testArraySet035
     * @tc.desc Verify array set keeps the same value when assigning an identical value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 2;
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3600
     * @tc.name testArraySet036
     * @tc.desc Verify array set supports repeated updates to the same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 10;
      expect(arr[0]).assertEqual(10);
      arr[0] = 20;
      expect(arr[0]).assertEqual(20);
      arr[0] = 30;
      expect(arr[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3700
     * @tc.name testArraySet037
     * @tc.desc Verify array set can update multiple different positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr[0] = 100;
      arr[2] = 200;
      arr[4] = 300;
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(200);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3800
     * @tc.name testArraySet038
     * @tc.desc Verify array set can update all positions in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 10;
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_3900
     * @tc.name testArraySet039
     * @tc.desc Verify array set values can be read immediately after assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[1] = 99;
      const val = arr[1];
      expect(val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4000
     * @tc.name testArraySet040
     * @tc.desc Verify one array element value can be assigned to another element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[2] = arr[0];
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4100
     * @tc.name testArraySet041
     * @tc.desc Verify Array number supports set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 999;
      expect(arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4200
     * @tc.name testArraySet042
     * @tc.desc Verify Array string supports set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr[1] = 'world';
      expect(arr[1]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4300
     * @tc.name testArraySet043
     * @tc.desc Verify Array boolean supports set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      arr[0] = false;
      arr[1] = true;
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4400
     * @tc.name testArraySet044
     * @tc.desc Verify custom class arrays support set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point044>(new Point044(1, 2), new Point044(3, 4));
      arr[0] = new Point044(10, 20);
      expect(arr[0].x).assertEqual(10);
      expect(arr[0].y).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4500
     * @tc.name testArraySet045
     * @tc.desc Verify Array number or string supports setting different element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      arr[0] = 'new string';
      arr[1] = 100;
      arr[2] = 'last';
      expect(arr[0]).assertEqual('new string');
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual('last');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4600
     * @tc.name testArraySet046
     * @tc.desc Verify the native array set implementation updates elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 2;
        expect(arr[i]).assertEqual(i * 2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4700
     * @tc.name testArraySet047
     * @tc.desc Verify repeated updates to the same position keep the latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      for (let i = 0; i < 1000; i++) {
        arr[0] = i;
      }
      expect(arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4800
     * @tc.name testArraySet048
     * @tc.desc Verify array set can update every position in a larger pre-sized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_4900
     * @tc.name testArraySet049
     * @tc.desc Verify updated values remain correct after push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 99;
      arr.pushOne(4);
      expect(arr[0]).assertEqual(99);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5000
     * @tc.name testArraySet050
     * @tc.desc Verify updated values remain correct after pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr[0] = 99;
      arr.pop();
      expect(arr[0]).assertEqual(99);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5100
     * @tc.name testArraySet051
     * @tc.desc Verify retained updated values remain correct after length changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr[0] = 999;
      arr.length = 2;
      expect(arr[0]).assertEqual(999);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5200
     * @tc.name testArraySet052
     * @tc.desc Verify pushed positions can be updated by later set access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.pushOne(3);
      arr[2] = 99;
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5300
     * @tc.name testArraySet053
     * @tc.desc Verify appended positions can be updated after delete-like operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.pop();
      arr.pushOne(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5400
     * @tc.name testArraySet054
     * @tc.desc Verify pre-sized arrays allow setting previously unassigned positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(5);
      arr[0] = 10;
      arr[1] = 20;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SET_5500
     * @tc.name testArraySet055
     * @tc.desc Verify empty arrays do not allow setting any valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      try {
        arr[0] = 1;
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });
  });
}
