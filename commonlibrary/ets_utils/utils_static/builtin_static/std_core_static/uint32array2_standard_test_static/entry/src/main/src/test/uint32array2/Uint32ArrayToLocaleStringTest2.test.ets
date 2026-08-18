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

export default function uint32ArrayToLocaleStringTwoTest(): void {
  describe('Uint32ArrayToLocaleStringTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0100
     * @tc.name testUint32ArrayToLocaleStringTwo001
     * @tc.desc Verify toLocaleString() default locale returns "10,20,30"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.toLocaleString();
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0200
     * @tc.name testUint32ArrayToLocaleStringTwo002
     * @tc.desc Verify toLocaleString("en-US") on (1000,2000) returns "1,000,2,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000, 2000);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0300
     * @tc.name testUint32ArrayToLocaleStringTwo003
     * @tc.desc Verify toLocaleString(undefined) on (5) returns "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      const r = arr.toLocaleString();
      expect(r).assertEqual('5');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0400
     * @tc.name testUint32ArrayToLocaleStringTwo004
     * @tc.desc Verify toLocaleString("en-US") on (0) returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0500
     * @tc.name testUint32ArrayToLocaleStringTwo005
     * @tc.desc Verify toLocaleString("en-US") on length-100 zero array returns joined 0 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      const r = arr.toLocaleString("en-US");
      let expected: string = '0';
      for (let i: int = 1; i < 100; i++) {
        expected += ',0';
      }
      expect(r).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0600
     * @tc.name testUint32ArrayToLocaleStringTwo006
     * @tc.desc Verify toLocaleString("en-US") after $_set(0,-1) returns "4,294,967,295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -1);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('4,294,967,295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0700
     * @tc.name testUint32ArrayToLocaleStringTwo007
     * @tc.desc Verify toLocaleString("en-US") on (0,0,0,0) returns "0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0, 0);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0800
     * @tc.name testUint32ArrayToLocaleStringTwo008
     * @tc.desc Verify toLocaleString("zh-CN") on (7) returns "7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      const r = arr.toLocaleString("zh-CN");
      expect(r).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_0900
     * @tc.name testUint32ArrayToLocaleStringTwo009
     * @tc.desc Verify toLocaleString("en-US") on int32 MAX returns "2,147,483,647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1000
     * @tc.name testUint32ArrayToLocaleStringTwo010
     * @tc.desc Verify toLocaleString("en-US") after $_set(0,-2147483648) returns "2,147,483,648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -2147483648);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual('2,147,483,648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1100
     * @tc.name testUint32ArrayToLocaleStringTwo011
     * @tc.desc Verify toLocaleString("en-US") on (10) returns "10"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1200
     * @tc.name testUint32ArrayToLocaleStringTwo012
     * @tc.desc Verify toLocaleString("en-US") on (99) returns "99"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(99);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1300
     * @tc.name testUint32ArrayToLocaleStringTwo013
     * @tc.desc Verify toLocaleString("en-US") on (100) returns "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1400
     * @tc.name testUint32ArrayToLocaleStringTwo014
     * @tc.desc Verify toLocaleString("en-US") on (999) returns "999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(999);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("999");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1500
     * @tc.name testUint32ArrayToLocaleStringTwo015
     * @tc.desc Verify toLocaleString("en-US") on (0x80000000) returns "2,147,483,648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x80000000);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("2,147,483,648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1600
     * @tc.name testUint32ArrayToLocaleStringTwo016
     * @tc.desc Verify toLocaleString("en-US") on (65535) returns "65,535"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65535);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("65,535");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1700
     * @tc.name testUint32ArrayToLocaleStringTwo017
     * @tc.desc Verify toLocaleString("en-US") on (10,20) returns "10,20"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("10,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1800
     * @tc.name testUint32ArrayToLocaleStringTwo018
     * @tc.desc Verify toLocaleString("en-US") on (100,200) returns "100,200"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("100,200");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_1900
     * @tc.name testUint32ArrayToLocaleStringTwo019
     * @tc.desc Verify toLocaleString("en-US") on (1,2,3,4,5) returns "1,2,3,4,5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2000
     * @tc.name testUint32ArrayToLocaleStringTwo020
     * @tc.desc Verify toLocaleString("en-US") on (0,uint32 MAX) returns "0,4,294,967,295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("0,4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2100
     * @tc.name testUint32ArrayToLocaleStringTwo021
     * @tc.desc Verify toLocaleString("en-US") on (255,256) returns "255,256"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255, 256);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("255,256");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2200
     * @tc.name testUint32ArrayToLocaleStringTwo022
     * @tc.desc Verify toLocaleString("en-US") on (65535,65536) returns "65,535,65,536"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65535, 65536);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("65,535,65,536");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2300
     * @tc.name testUint32ArrayToLocaleStringTwo023
     * @tc.desc Verify toLocaleString("en-US") on (1000000,1) returns "1,000,000,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000000, 1);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("1,000,000,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2400
     * @tc.name testUint32ArrayToLocaleStringTwo024
     * @tc.desc Verify toLocaleString("en-US") on (uint32 MAX,0,1) returns "4,294,967,295,0,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0, 1);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("4,294,967,295,0,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2500
     * @tc.name testUint32ArrayToLocaleStringTwo025
     * @tc.desc Verify toLocaleString("en-US") on (100,uint32 MAX,0) returns "100,4,294,967,295,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 4294967295, 0);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("100,4,294,967,295,0");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2600
     * @tc.name testUint32ArrayToLocaleStringTwo026
     * @tc.desc Verify toLocaleString("en-US") on (uint32 MAX,0) returns "4,294,967,295,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0);
      const r = arr.toLocaleString("en-US");
      expect(r).assertEqual("4,294,967,295,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2700
     * @tc.name testUint32ArrayToLocaleStringTwo027
     * @tc.desc Verify toLocaleString preserves byteLength 16 for (1,2,3,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const s = arr.toLocaleString("en-US");
      expect(s).assertEqual('1,2,3,4');
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2800
     * @tc.name testUint32ArrayToLocaleStringTwo028
     * @tc.desc Verify toLocaleString preserves element MAX for of(4294967295)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      const s = arr.toLocaleString("en-US");
      expect(s).assertEqual('4,294,967,295');
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_2900
     * @tc.name testUint32ArrayToLocaleStringTwo029
     * @tc.desc Verify toLocaleString idempotency for (1000, 2000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000, 2000);
      const r1 = arr.toLocaleString("en-US");
      const r2 = arr.toLocaleString("en-US");
      expect(r1).assertEqual("1,000,2,000");
      expect(r2).assertEqual("1,000,2,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3000
     * @tc.name testUint32ArrayToLocaleStringTwo030
     * @tc.desc Verify empty array length remains 0 after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const s = arr.toLocaleString("en-US");
      expect(s).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3100
     * @tc.name testUint32ArrayToLocaleStringTwo031
     * @tc.desc Verify toLocaleString("en-US") on subarray(1,3) returns "20,30"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const view = arr.subarray(1, 3);
      const r = view.toLocaleString("en-US");
      expect(r).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3200
     * @tc.name testUint32ArrayToLocaleStringTwo032
     * @tc.desc Verify toLocaleString("en-US") on subarray(1,2) returns "20"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const view = arr.subarray(1, 2);
      expect(view.toLocaleString("en-US")).assertEqual("20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3300
     * @tc.name testUint32ArrayToLocaleStringTwo033
     * @tc.desc Verify toLocaleString("en-US") on subarray(0,2) returns "10,20"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const view = arr.subarray(0, 2);
      expect(view.toLocaleString("en-US")).assertEqual("10,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3400
     * @tc.name testUint32ArrayToLocaleStringTwo034
     * @tc.desc Verify toLocaleString() on subarray view reflects parent buffer mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const view = arr.subarray(0, 1);
      arr.$_set(0, 1000);
      expect(view.toLocaleString("en-US")).assertEqual("1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3500
     * @tc.name testUint32ArrayToLocaleStringTwo035
     * @tc.desc Verify toLocaleString() on parent reflects mutation via subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const view = arr.subarray(0, 1);
      view.$_set(0, 5);
      expect(arr.toLocaleString("en-US")).assertEqual("5,20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3600
     * @tc.name testUint32ArrayToLocaleStringTwo036
     * @tc.desc Verify toLocaleString() on sliced copy is independent of parent mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const copy = arr.slice(0, 1);
      arr.$_set(0, 1000);
      expect(copy.toLocaleString("en-US")).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3700
     * @tc.name testUint32ArrayToLocaleStringTwo037
     * @tc.desc Verify toLocaleString("en-US") on offset view returns "2,000,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 0, 4);
      arr.$_set(0, 1000);
      const view = new Uint32Array(buf, 4, 3);
      view.$_set(0, 2000);
      expect(view.toLocaleString("en-US")).assertEqual("2,000,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3800
     * @tc.name testUint32ArrayToLocaleStringTwo038
     * @tc.desc Verify toLocaleString("en-US") on second view sharing buffer returns "3,000,4,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a1 = new Uint32Array(buf, 0, 2);
      a1.$_set(0, 1000);
      a1.$_set(1, 2000);
      const a2 = new Uint32Array(buf, 8, 2);
      a2.$_set(0, 3000);
      a2.$_set(1, 4000);
      expect(a2.toLocaleString("en-US")).assertEqual("3,000,4,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_3900
     * @tc.name testUint32ArrayToLocaleStringTwo039
     * @tc.desc Verify toLocaleString("en-US") on overlapping views yields "5,000,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a1 = new Uint32Array(buf, 0, 2);
      a1.$_set(0, 1000);
      const a2 = new Uint32Array(buf, 8, 2);
      a2.$_set(0, 5000);
      a1.$_set(1, 9999);
      expect(a2.toLocaleString("en-US")).assertEqual("5,000,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4000
     * @tc.name testUint32ArrayToLocaleStringTwo040
     * @tc.desc Verify toLocaleString("en-US") on out-of-range subarray returns ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const view = arr.subarray(5, 10);
      expect(view.toLocaleString("en-US")).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4100
     * @tc.name testUint32ArrayToLocaleStringTwo041
     * @tc.desc Verify toLocaleString("en-US") on subarray(0,2) returns "10,20" and length remains 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const view = arr.subarray(0, 2);
      const s = view.toLocaleString("en-US");
      expect(s).assertEqual('10,20');
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4200
     * @tc.name testUint32ArrayToLocaleStringTwo042
     * @tc.desc Verify toLocaleString("zh-CN") on subarray(1,2) returns "20"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const view = arr.subarray(1, 2);
      const r = view.toLocaleString("zh-CN");
      expect(r).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4300
     * @tc.name testUint32ArrayToLocaleStringTwo043
     * @tc.desc Verify toLocaleString("en-US") on nested subarray returns "2,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000, 2000, 3000);
      const v1 = arr.subarray(1, 3);
      const v2 = v1.subarray(0, 1);
      expect(v2.toLocaleString("en-US")).assertEqual("2,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4400
     * @tc.name testUint32ArrayToLocaleStringTwo044
     * @tc.desc Verify toLocaleString("en-US") on subarray of uint32 MAX returns "4,294,967,295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0);
      const view = arr.subarray(0, 1);
      expect(view.toLocaleString("en-US")).assertEqual("4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4500
     * @tc.name testUint32ArrayToLocaleStringTwo045
     * @tc.desc Verify toLocaleString("en-US") on sibling subarray views returns "1,000" and "2,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000, 2000);
      const v1 = arr.subarray(0, 1);
      const v2 = arr.subarray(1, 2);
      expect(v1.toLocaleString("en-US")).assertEqual("1,000");
      expect(v2.toLocaleString("en-US")).assertEqual("2,000");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4600
     * @tc.name testUint32ArrayToLocaleStringTwo046
     * @tc.desc Verify locales passed as array ['en-US'] produces grouped output for of(1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000);
      const locales: string[] = ["en-US"];
      const r = arr.toLocaleString(locales);
      expect(r).assertEqual("1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_TWO_4700
     * @tc.name testUint32ArrayToLocaleStringTwo047
     * @tc.desc Verify invalid locale tag throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      try {
        arr.toLocaleString('0');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
