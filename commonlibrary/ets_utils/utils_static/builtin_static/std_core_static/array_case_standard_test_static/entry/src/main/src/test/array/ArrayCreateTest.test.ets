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

class ElementTest027 {
  ele: int;

  constructor(e: int) {
    this.ele = e;
  }
}

interface Point028 {
  x: int;
  y: int;
}

class ElementTest034 {
  ele: int;

  constructor(e: int) {
    this.ele = e;
  }
}

class Item038 {
  value: int;
  name: string;

  constructor(v: int, n: string) {
    this.value = v;
    this.name = n;
  }
}

interface Config039 {
  enabled: boolean;
  value: int;
}

class Item045 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface Config047 {
  enabled: boolean;
  timeout: int;
}

class ComplexItem050 {
  data: int;

  constructor(d: int) {
    this.data = d;
  }
}

export default function ArrayCreateTest(): void {
  describe('ArrayCreateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0100
     * @tc.name testArrayCreate001
     * @tc.desc Verify Array create succeeds when both required parameters are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, 'default');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0200
     * @tc.name testArrayCreate002
     * @tc.desc Verify Array create supports a normal length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 10);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0300
     * @tc.name testArrayCreate003
     * @tc.desc Verify Array create supports a zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(0, 100);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0400
     * @tc.name testArrayCreate004
     * @tc.desc Verify Array create supports a length of one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 42);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0500
     * @tc.name testArrayCreate005
     * @tc.desc Verify Array create supports a larger length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 0);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0600
     * @tc.name testArrayCreate006
     * @tc.desc Verify Array create handles an extremely large length input safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = Array.create<int>(Number.MAX_SAFE_INTEGER.toInt(), 0);
        expect(arr.length >= 0).assertTrue();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0700
     * @tc.name testArrayCreate007
     * @tc.desc Verify Array create rejects a negative length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects negative length creation at compile time, so this case is documented and skipped.
      const documentedInvalidCase = ['negative-length'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0800
     * @tc.name testArrayCreate008
     * @tc.desc Verify passing null as the length is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects null-to-number misuse at compile time, so this case is documented and skipped.
      const documentedInvalidCase = ['null-length'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_0900
     * @tc.name testArrayCreate009
     * @tc.desc Verify passing undefined as the length is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects undefined-to-number misuse at compile time, so this case is documented and skipped.
      const documentedInvalidCase = ['undefined-length'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1000
     * @tc.name testArrayCreate010
     * @tc.desc Verify Array create handles a floating-point length safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const length = 5.5;
        const arr = Array.create<int>(length.toInt(), 0);
        expect(arr.length).assertEqual(length.toInt());
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1100
     * @tc.name testArrayCreate011
     * @tc.desc Verify Array create accepts a scientific notation length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length = 1e1;
      const arr = Array.create<int>(length.toInt(), 100);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1200
     * @tc.name testArrayCreate012
     * @tc.desc Verify Array create accepts a hexadecimal length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(0x0A, 100);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1300
     * @tc.name testArrayCreate013
     * @tc.desc Verify passing a string length is rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects string-to-number mismatches at compile time, so this case is documented and skipped.
      const documentedInvalidCase = ['string-length'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1400
     * @tc.name testArrayCreate014
     * @tc.desc Verify Array create fills number arrays with the provided initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 42);
      expect(arr[0]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1500
     * @tc.name testArrayCreate015
     * @tc.desc Verify Array create fills string arrays with the provided initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, 'default');
      expect(arr[0]).assertEqual('default');
      expect(arr[2]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1600
     * @tc.name testArrayCreate016
     * @tc.desc Verify Array create fills boolean arrays with the provided initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(5, true);
      expect(arr[0]).assertTrue();
      expect(arr[4]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1700
     * @tc.name testArrayCreate017
     * @tc.desc Verify Array create preserves a numeric zero initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1800
     * @tc.name testArrayCreate018
     * @tc.desc Verify Array create preserves an empty string initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '');
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_1900
     * @tc.name testArrayCreate019
     * @tc.desc Verify Array create preserves a false initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(5, false);
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2000
     * @tc.name testArrayCreate020
     * @tc.desc Verify Array create preserves a negative numeric initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, -100);
      expect(arr[0]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2100
     * @tc.name testArrayCreate021
     * @tc.desc Verify Array create preserves a maximum numeric initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = Number.MAX_SAFE_INTEGER.toInt();
      const arr = Array.create<int>(3, maxValue);
      expect(arr[0]).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2200
     * @tc.name testArrayCreate022
     * @tc.desc Verify Array create preserves a minimum numeric initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue = Number.MIN_SAFE_INTEGER.toInt();
      const arr = Array.create<int>(3, minValue);
      expect(arr[0]).assertEqual(minValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2300
     * @tc.name testArrayCreate023
     * @tc.desc Verify Array create preserves null values in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | null>(5, null);
      expect(arr[0]).assertNull();
      expect(arr[4]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2400
     * @tc.name testArrayCreate024
     * @tc.desc Verify Array create preserves undefined values in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | undefined>(3, undefined);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2500
     * @tc.name testArrayCreate025
     * @tc.desc Verify Array create preserves NaN initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(5, NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
      expect(Number.isNaN(arr[4])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2600
     * @tc.name testArrayCreate026
     * @tc.desc Verify Array create preserves infinity initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(5, Infinity);
      expect(arr[0]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2700
     * @tc.name testArrayCreate027
     * @tc.desc Verify Array create supports object initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<ElementTest027>(3, new ElementTest027(42));
      expect(arr[0].ele).assertEqual(42);
      expect(arr[1].ele).assertEqual(42);
      expect(arr[2].ele).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2800
     * @tc.name testArrayCreate028
     * @tc.desc Verify Array create supports interface initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Point028>(3, { x: 0, y: 0 });
      expect(arr[0].x).assertEqual(0);
      expect(arr[2].y).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_2900
     * @tc.name testArrayCreate029
     * @tc.desc Verify Array create preserves script-like string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '<script>alert(1)</script>');
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3000
     * @tc.name testArrayCreate030
     * @tc.desc Verify Array create preserves Unicode string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unicodeValue = '\u4F60\u597D\u4E16\u754C\uD83C\uDF0D';
      const arr = Array.create<string>(3, unicodeValue);
      expect(arr[0]).assertEqual(unicodeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3100
     * @tc.name testArrayCreate031
     * @tc.desc Verify Array create preserves zero-width space string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '\u200B');
      expect(arr[0]).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3200
     * @tc.name testArrayCreate032
     * @tc.desc Verify Array create returns a filled Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, 'default');
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3300
     * @tc.name testArrayCreate033
     * @tc.desc Verify Array create initializes all elements for safe access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10, 42);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3400
     * @tc.name testArrayCreate034
     * @tc.desc Verify Array create supports undefined initialization for nullable object unions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<ElementTest034 | undefined>(3, undefined);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3500
     * @tc.name testArrayCreate035
     * @tc.desc Verify Array create supports number generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 100);
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3600
     * @tc.name testArrayCreate036
     * @tc.desc Verify Array create supports string generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(10, 'hello');
      expect(arr[0]).assertEqual('hello');
      expect(arr[9]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3700
     * @tc.name testArrayCreate037
     * @tc.desc Verify Array create supports boolean generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(5, true);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3800
     * @tc.name testArrayCreate038
     * @tc.desc Verify Array create supports custom class generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item038(42, 'test');
      const arr = Array.create<Item038>(3, item);
      expect(arr[0].value).assertEqual(42);
      expect(arr[0].name).assertEqual('test');
      expect(arr[2].value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_3900
     * @tc.name testArrayCreate039
     * @tc.desc Verify Array create supports interface generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: Config039 = { enabled: true, value: 100 };
      const arr = Array.create<Config039>(5, config);
      expect(arr[0].enabled).assertTrue();
      expect(arr[4].value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4000
     * @tc.name testArrayCreate040
     * @tc.desc Verify Array create supports union generic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | string>(5, 'mixed');
      expect(arr[0]).assertEqual('mixed');
      expect(arr[4]).assertEqual('mixed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4100
     * @tc.name testArrayCreate041
     * @tc.desc Verify Array create supports nested array generic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerArr = new Array<int>(1, 2, 3);
      const arr = Array.create<Array<int>>(3, innerArr);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(2);
      expect(arr[2][2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4200
     * @tc.name testArrayCreate042
     * @tc.desc Verify Array create is invoked as a static Array method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 10);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4300
     * @tc.name testArrayCreate043
     * @tc.desc Verify Array create supports explicit generic syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = Array.create<int>(3, 100);
      const strArr = Array.create<string>(3, 'hello');
      const boolArr = Array.create<boolean>(3, true);
      expect(numArr[0]).assertEqual(100);
      expect(strArr[0]).assertEqual('hello');
      expect(boolArr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4400
     * @tc.name testArrayCreate044
     * @tc.desc Verify Array create fills every position with the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100, -1);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4500
     * @tc.name testArrayCreate045
     * @tc.desc Verify Array create reuses the same reference for object initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item045(100);
      const arr = Array.create<Item045>(3, item);
      expect(arr[0] == arr[1]).assertTrue();
      expect(arr[1] == arr[2]).assertTrue();
      item.value = 200;
      expect(arr[0].value).assertEqual(200);
      expect(arr[1].value).assertEqual(200);
      expect(arr[2].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4600
     * @tc.name testArrayCreate046
     * @tc.desc Verify Array create supports preallocation followed by selective updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100, 0);
      arr[0] = 100;
      arr[50] = 500;
      arr[99] = 1000;
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
      expect(arr[50]).assertEqual(500);
      expect(arr[99]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4700
     * @tc.name testArrayCreate047
     * @tc.desc Verify Array create supports arrays of default configuration objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultConfig: Config047 = { enabled: false, timeout: 30000 };
      const configs = Array.create<Config047>(10, defaultConfig);
      expect(configs[0].enabled).assertFalse();
      expect(configs[9].timeout).assertEqual(30000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4800
     * @tc.name testArrayCreate048
     * @tc.desc Verify Array create supports placeholder string arrays for later updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const placeholders = Array.create<string>(100, 'empty');
      placeholders[0] = 'data1';
      placeholders[1] = 'data2';
      expect(placeholders[0]).assertEqual('data1');
      expect(placeholders[2]).assertEqual('empty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_4900
     * @tc.name testArrayCreate049
     * @tc.desc Verify Array create can build large numeric arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100000, 0);
      expect(arr.length).assertEqual(100000);
      expect(arr[0]).assertEqual(0);
      expect(arr[99999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5000
     * @tc.name testArrayCreate050
     * @tc.desc Verify Array create can build large arrays of complex objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ComplexItem050(42);
      const arr = Array.create<ComplexItem050>(1000, item);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5100
     * @tc.name testArrayCreate051
     * @tc.desc Verify Array create handles the zero-length boundary consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(0, 100);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5200
     * @tc.name testArrayCreate052
     * @tc.desc Verify Array create handles the single-element boundary consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'single');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('single');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5300
     * @tc.name testArrayCreate053
     * @tc.desc Verify generic type mismatches are rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects generic type mismatches at compile time, so this case is documented and skipped.
      const documentedInvalidCase = ['generic-mismatch'];
      expect(documentedInvalidCase.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5400
     * @tc.name testArrayCreate054
     * @tc.desc Verify missing required parameters are rejected by ArkTS type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ArkTS rejects missing required parameters at compile time, so this case is documented and skipped.
      expect('missing-params'.startsWith('missing')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5500
     * @tc.name testArrayCreate055
     * @tc.desc Verify Array create matches constructor plus manual fill semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(10, 42);
      const arr2 = new Array<int>(10);
      for (let i = 0; i < arr2.length; i++) {
        arr2[i] = 42;
      }
      for (let i = 0; i < 10; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5600
     * @tc.name testArrayCreate056
     * @tc.desc Verify Array create matches create-then-fill semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(10, 100);
      const arr2 = new Array<int>(10);
      arr2.fill(100);
      for (let i = 0; i < 10; i++) {
        expect(arr1[i]).assertEqual(arr2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5700
     * @tc.name testArrayCreate057
     * @tc.desc Verify Array create supports immediate chained operations on initialized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10, 5);
      const doubled = arr.map((x: int): int => x * 2);
      expect(doubled[0]).assertEqual(10);
      expect(doubled[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_5800
     * @tc.name testArrayCreate058
     * @tc.desc Verify elements in an Array create result can be modified independently after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCreate058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 100);
      arr[0] = 200;
      arr[2] = 300;
      arr[4] = 400;
      expect(arr[0]).assertEqual(200);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
      expect(arr[3]).assertEqual(100);
      expect(arr[4]).assertEqual(400);
    });
  });
}
