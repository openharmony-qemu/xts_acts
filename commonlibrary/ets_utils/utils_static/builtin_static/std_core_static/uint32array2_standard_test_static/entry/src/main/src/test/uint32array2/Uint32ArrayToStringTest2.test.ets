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

export default function uint32ArrayToStringTwoTest(): void {
  describe('Uint32ArrayToStringTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0100
     * @tc.name testUint32ArrayToStringTwo001
     * @tc.desc Verify toString() of [10,20,30] returns '10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const s = arr.toString();
      expect(s).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0200
     * @tc.name testUint32ArrayToStringTwo002
     * @tc.desc Verify toString() of empty array returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const s = arr.toString();
      expect(s).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0300
     * @tc.name testUint32ArrayToStringTwo003
     * @tc.desc Verify toString() of [5,6] returns '5,6'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6);
      const s = arr.toString();
      expect(s).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0400
     * @tc.name testUint32ArrayToStringTwo004
     * @tc.desc Verify toString() of [0,uint32.MAX] returns '0,4294967295'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295);
      const s = arr.toString();
      expect(s).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0500
     * @tc.name testUint32ArrayToStringTwo005
     * @tc.desc Verify toString() of 100-element zero-filled array has 100 comma-separated zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      const s = arr.toString();
      let parts: string[] = [];
      for (let i = 0; i < 100; i++) { parts.push('0'); }
      const expected: string = parts.join(',');
      expect(s).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0600
     * @tc.name testUint32ArrayToStringTwo006
     * @tc.desc Verify toString() of [0,0,0,0] returns '0,0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0, 0);
      const s = arr.toString();
      expect(s).assertEqual('0,0,0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0700
     * @tc.name testUint32ArrayToStringTwo007
     * @tc.desc Verify toString() of [0,5,0] returns '0,5,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 5, 0);
      const s = arr.toString();
      expect(s).assertEqual('0,5,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0800
     * @tc.name testUint32ArrayToStringTwo008
     * @tc.desc Verify toString() of Uint32Array containing 0xFFFFFFFF returns '4294967295'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0xFFFFFFFF);
      const s = arr.toString();
      expect(s).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_0900
     * @tc.name testUint32ArrayToStringTwo009
     * @tc.desc Verify 17. 0x80000000 (2147483648) toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x80000000);
      const s = arr.toString();
      expect(s).assertEqual('2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1000
     * @tc.name testUint32ArrayToStringTwo010
     * @tc.desc Verify 18. 2147483647 (int32.MAX) toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      const s = arr.toString();
      expect(s).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1100
     * @tc.name testUint32ArrayToStringTwo011
     * @tc.desc Verify 19. 0 uint32.MAX toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 0, 4294967295);
      const s = arr.toString();
      expect(s).assertEqual('0,4294967295,0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1200
     * @tc.name testUint32ArrayToStringTwo012
     * @tc.desc Verify toString() of mixed [0,2147483647,4294967295,1] returns '0,2147483647,4294967295,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 2147483647, 4294967295, 1);
      const s = arr.toString();
      expect(s).assertEqual('0,2147483647,4294967295,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1300
     * @tc.name testUint32ArrayToStringTwo013
     * @tc.desc Verify 22. 0x100000000 ( 0) toString() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x100000000, 1);
      const s = arr.toString();
      expect(s).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1400
     * @tc.name testUint32ArrayToStringTwo014
     * @tc.desc Verify 23. -1 ( 4294967295) toString() MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.$_set(0, -1);
      arr.$_set(1, 0);
      const s = arr.toString();
      expect(s).assertEqual('4294967295,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1500
     * @tc.name testUint32ArrayToStringTwo015
     * @tc.desc Verify 24. NaN ( 0) toString() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, Number.NaN);
      const s = arr.toString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1600
     * @tc.name testUint32ArrayToStringTwo016
     * @tc.desc Verify 25. Infinity ( 0) toString() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      const s = arr.toString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1700
     * @tc.name testUint32ArrayToStringTwo017
     * @tc.desc Verify 26. 3.14 ( 3) toString() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 3.14);
      const s = arr.toString();
      expect(s).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1800
     * @tc.name testUint32ArrayToStringTwo018
     * @tc.desc Verify 30. uint32.MAX toString() join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0, 1);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_1900
     * @tc.name testUint32ArrayToStringTwo019
     * @tc.desc Verify 37. 0 toString() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const s = arr.toString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2000
     * @tc.name testUint32ArrayToStringTwo020
     * @tc.desc Verify 43. toString() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const before = arr.byteLength;
      const s = arr.toString();
      expect(s).assertEqual('1,2,3,4');
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2100
     * @tc.name testUint32ArrayToStringTwo021
     * @tc.desc Verify 44. toString() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4, 3);
      const before = arr.byteOffset;
      const s = arr.toString();
      expect(s).assertEqual('0,0,0');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2200
     * @tc.name testUint32ArrayToStringTwo022
     * @tc.desc Verify 45. toString() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const bufBefore = arr.buffer;
      const s = arr.toString();
      expect(s).assertEqual('1,2,3');
      const sameBuffer: boolean = arr.buffer === bufBefore;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2300
     * @tc.name testUint32ArrayToStringTwo023
     * @tc.desc Verify 46. toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 2147483647);
      const s = arr.toString();
      expect(s).assertEqual('0,4294967295,2147483647');
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(4294967295);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2400
     * @tc.name testUint32ArrayToStringTwo024
     * @tc.desc Verify toString() returns comma-separated string '10,20' for [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const s = arr.toString();
      expect(s).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2500
     * @tc.name testUint32ArrayToStringTwo025
     * @tc.desc Verify 50. toString() string split
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const parts = arr.toString().split(',');
      expect(parts.length).assertEqual(3);
      expect(parts.$_get(0)).assertEqual('1');
      expect(parts.$_get(1)).assertEqual('2');
      expect(parts.$_get(2)).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2600
     * @tc.name testUint32ArrayToStringTwo026
     * @tc.desc Verify 53. toString() string replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const replaced = arr.toString().replace(',', ';');
      expect(replaced).assertEqual('1;2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2700
     * @tc.name testUint32ArrayToStringTwo027
     * @tc.desc Verify 55. toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const s1 = arr.toString();
      const s2 = arr.toString();
      expect(s1).assertEqual('10,20,30');
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2800
     * @tc.name testUint32ArrayToStringTwo028
     * @tc.desc Verify 56. subarray toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40, 50);
      const view = base.subarray(1, 4);
      const s = view.toString();
      expect(s).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_2900
     * @tc.name testUint32ArrayToStringTwo029
     * @tc.desc Verify 57. subarray toString() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4, 5);
      const view = base.subarray(1, 4);
      const s = view.toString();
      expect(s).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3000
     * @tc.name testUint32ArrayToStringTwo030
     * @tc.desc Verify 58. subarray toString() base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4, 5);
      const view = base.subarray(0, 3);
      const s = view.toString();
      expect(s).assertEqual('1,2,3');
      expect(base.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3100
     * @tc.name testUint32ArrayToStringTwo031
     * @tc.desc Verify 59. buffer toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const view = base.subarray(0, 3);
      base.$_set(1, 99);
      const s = view.toString();
      expect(s).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3200
     * @tc.name testUint32ArrayToStringTwo032
     * @tc.desc Verify 60. slice toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const copy = base.slice(1, 3);
      const s = copy.toString();
      expect(s).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3300
     * @tc.name testUint32ArrayToStringTwo033
     * @tc.desc Verify 61. slice toString() base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const copy = base.slice(1, 3);
      const s = copy.toString();
      expect(s).assertEqual('20,30');
      expect(base.$_get(0)).assertEqual(10);
      expect(base.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3400
     * @tc.name testUint32ArrayToStringTwo034
     * @tc.desc Verify 62. byteOffset ArrayBuffer toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4, 3);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      arr.$_set(2, 300);
      const s = arr.toString();
      expect(s).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3500
     * @tc.name testUint32ArrayToStringTwo035
     * @tc.desc Verify 63. byteOffset ArrayBuffer toString() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 8, 2);
      const before = arr.byteOffset;
      const s = arr.toString();
      expect(s).assertEqual('0,0');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3600
     * @tc.name testUint32ArrayToStringTwo036
     * @tc.desc Verify 64. fill toString() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.fill(7);
      const s = arr.toString();
      expect(s).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3700
     * @tc.name testUint32ArrayToStringTwo037
     * @tc.desc Verify 65. reverse toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr.reverse();
      const s = arr.toString();
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3800
     * @tc.name testUint32ArrayToStringTwo038
     * @tc.desc Verify 66. sort toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(30, 10, 20);
      arr.sort();
      const s = arr.toString();
      expect(s).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_3900
     * @tc.name testUint32ArrayToStringTwo039
     * @tc.desc Verify 67. map toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const mapped = base.map((x: number): number => x * 2);
      const s = mapped.toString();
      expect(s).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4000
     * @tc.name testUint32ArrayToStringTwo040
     * @tc.desc Verify 68. filter toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4, 5);
      const filtered = base.filter((x: number): boolean => x % 2 === 0);
      const s = filtered.toString();
      expect(s).assertEqual('2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4100
     * @tc.name testUint32ArrayToStringTwo041
     * @tc.desc Verify 69. toReversed toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const rev = base.toReversed();
      const s = rev.toString();
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4200
     * @tc.name testUint32ArrayToStringTwo042
     * @tc.desc Verify 70. toSorted toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(30, 10, 20);
      const sorted = base.toSorted();
      const s = sorted.toString();
      expect(s).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4300
     * @tc.name testUint32ArrayToStringTwo043
     * @tc.desc Verify 71. with toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const w = base.with(1, 99);
      const s = w.toString();
      expect(s).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4400
     * @tc.name testUint32ArrayToStringTwo044
     * @tc.desc Verify writing byte-typed value via $_set followed by toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      const v: byte = 10;
      arr.$_set(0, v);
      arr.$_set(1, 20);
      const s = arr.toString();
      expect(s).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4500
     * @tc.name testUint32ArrayToStringTwo045
     * @tc.desc Verify 77. toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const s = arr.toString();
      const templ = `${arr}`;
      expect(s).assertEqual(templ);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_TWO_4600
     * @tc.name testUint32ArrayToStringTwo046
     * @tc.desc Verify view.toString() reflects values after base.set(other, offset) on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(5);
      const view = base.subarray(1, 4);
      const other = Uint32Array.of(7, 8, 9);
      base.set(other, 1);
      expect(view.toString()).assertEqual('7,8,9');
      expect(base.toString()).assertEqual('0,7,8,9,0');
    });

  });
}
