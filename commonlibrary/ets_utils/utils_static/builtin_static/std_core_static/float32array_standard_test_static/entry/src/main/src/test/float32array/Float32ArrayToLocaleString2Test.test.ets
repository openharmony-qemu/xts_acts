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

export default function Float32ArrayToLocaleString2Test(): void {
  describe('Float32ArrayToLocaleString2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0100
     * @tc.name testFloat32ArrayToLocaleStringTWO001
     * @tc.desc Verify 0-argument call returns the comma-separated formatted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("16,10,-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0200
     * @tc.name testFloat32ArrayToLocaleStringTWO002
     * @tc.desc Verify 1-argument en-US locales call applies grouping to element formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1000.0, 2.0);
      const result = arr.toLocaleString("en-US");
      expect(result).assertEqual("1,000,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0300
     * @tc.name testFloat32ArrayToLocaleStringTWO003
     * @tc.desc Verify 2-argument locales and options call applies grouping to each element of a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1000.0, 1234.0);
      let opts: Record<string, Boolean> = { 'useGrouping': true };
      const result = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1,000,1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0400
     * @tc.name testFloat32ArrayToLocaleStringTWO004
     * @tc.desc Verify empty array toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0500
     * @tc.name testFloat32ArrayToLocaleStringTWO005
     * @tc.desc Verify single-element 0 array returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0600
     * @tc.name testFloat32ArrayToLocaleStringTWO006
     * @tc.desc Verify single-element 1 array returns "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0700
     * @tc.name testFloat32ArrayToLocaleStringTWO007
     * @tc.desc Verify single-element 7 array returns "7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0800
     * @tc.name testFloat32ArrayToLocaleStringTWO008
     * @tc.desc Verify single-element -1 array returns "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_0900
     * @tc.name testFloat32ArrayToLocaleStringTWO009
     * @tc.desc Verify empty array returns string of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.toLocaleString();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1000
     * @tc.name testFloat32ArrayToLocaleStringTWO010
     * @tc.desc Verify returned string length matches the formatted value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.toLocaleString();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1100
     * @tc.name testFloat32ArrayToLocaleStringTWO011
     * @tc.desc Verify empty array arr.length stays 0 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      arr.toLocaleString();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1200
     * @tc.name testFloat32ArrayToLocaleStringTWO012
     * @tc.desc Verify arr.BYTES_PER_ELEMENT stays 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      arr.toLocaleString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1300
     * @tc.name testFloat32ArrayToLocaleStringTWO013
     * @tc.desc Verify single-element 1 array first element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1400
     * @tc.name testFloat32ArrayToLocaleStringTWO014
     * @tc.desc Verify NaN element still NaN after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1500
     * @tc.name testFloat32ArrayToLocaleStringTWO015
     * @tc.desc Verify Infinity element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1600
     * @tc.name testFloat32ArrayToLocaleStringTWO016
     * @tc.desc Verify -Infinity element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Infinity);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1700
     * @tc.name testFloat32ArrayToLocaleStringTWO017
     * @tc.desc Verify 0.1 element stored value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1800
     * @tc.name testFloat32ArrayToLocaleStringTWO018
     * @tc.desc Verify 16777216 element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_1900
     * @tc.name testFloat32ArrayToLocaleStringTWO019
     * @tc.desc Verify 16777217 truncated value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2000
     * @tc.name testFloat32ArrayToLocaleStringTWO020
     * @tc.desc Verify 1.0e40 element overflowing to Infinity unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2100
     * @tc.name testFloat32ArrayToLocaleStringTWO021
     * @tc.desc Verify Float32 minimum positive normal value element unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2200
     * @tc.name testFloat32ArrayToLocaleStringTWO022
     * @tc.desc Verify -0 element sign bit preserved after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const before: number = 1 / arr.$_get(0);
      arr.toLocaleString();
      expect(1 / arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2300
     * @tc.name testFloat32ArrayToLocaleStringTWO023
     * @tc.desc Verify three-element array second element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before: number = arr.$_get(1);
      arr.toLocaleString();
      expect(arr.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2400
     * @tc.name testFloat32ArrayToLocaleStringTWO024
     * @tc.desc Verify three-element array last element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before: number = arr.$_get(2);
      arr.toLocaleString();
      expect(arr.$_get(2)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2500
     * @tc.name testFloat32ArrayToLocaleStringTWO025
     * @tc.desc Verify five-element array at(-1) value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      const before: number = arr.at(-1)!;
      arr.toLocaleString();
      expect(arr.at(-1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2600
     * @tc.name testFloat32ArrayToLocaleStringTWO026
     * @tc.desc Verify five-element array length unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const before: number = arr.length;
      arr.toLocaleString();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2700
     * @tc.name testFloat32ArrayToLocaleStringTWO027
     * @tc.desc Verify five-element array byteLength unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const before: number = arr.byteLength;
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2800
     * @tc.name testFloat32ArrayToLocaleStringTWO028
     * @tc.desc Verify underlying buffer byteLength unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const buf = arr.buffer;
      const before: number = buf.byteLength;
      arr.toLocaleString();
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_2900
     * @tc.name testFloat32ArrayToLocaleStringTWO029
     * @tc.desc Verify two consecutive calls return equal values proving no state change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r1 = arr.toLocaleString();
      const r2 = arr.toLocaleString();
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3000
     * @tc.name testFloat32ArrayToLocaleStringTWO030
     * @tc.desc Verify arr.$_get(0) value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3100
     * @tc.name testFloat32ArrayToLocaleStringTWO031
     * @tc.desc Verify 0.1 and 0.2 array first element stored value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3200
     * @tc.name testFloat32ArrayToLocaleStringTWO032
     * @tc.desc Verify decimal 1.5 element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3300
     * @tc.name testFloat32ArrayToLocaleStringTWO033
     * @tc.desc Verify array reference unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const ref = arr;
      arr.toLocaleString();
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3400
     * @tc.name testFloat32ArrayToLocaleStringTWO034
     * @tc.desc Verify arr.BYTES_PER_ELEMENT still 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 4.0);
      arr.toLocaleString();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3500
     * @tc.name testFloat32ArrayToLocaleStringTWO035
     * @tc.desc Verify arr.length still 3 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      arr.toLocaleString();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3600
     * @tc.name testFloat32ArrayToLocaleStringTWO036
     * @tc.desc Verify arr.byteLength still 12 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3700
     * @tc.name testFloat32ArrayToLocaleStringTWO037
     * @tc.desc Verify array still writable after call proving not replaced by string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      arr.toLocaleString();
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3800
     * @tc.name testFloat32ArrayToLocaleStringTWO038
     * @tc.desc Verify array still readable via $_get after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_3900
     * @tc.name testFloat32ArrayToLocaleStringTWO039
     * @tc.desc Verify array still readable via at after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      arr.toLocaleString();
      expect(arr.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4000
     * @tc.name testFloat32ArrayToLocaleStringTWO040
     * @tc.desc Verify array still iterable after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.toLocaleString();
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4100
     * @tc.name testFloat32ArrayToLocaleStringTWO041
     * @tc.desc Verify NaN receiver element is formatted as a string result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN);
      const result = arr.toLocaleString("en-US");
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4200
     * @tc.name testFloat32ArrayToLocaleStringTWO042
     * @tc.desc Verify toLocaleString returns formatted content and keeps the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("1");
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4300
     * @tc.name testFloat32ArrayToLocaleStringTWO043
     * @tc.desc Verify offset view receiver formats only the visible element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 1);
      arr.$_set(0, 42.0);
      const result = arr.toLocaleString("en-US");
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4400
     * @tc.name testFloat32ArrayToLocaleStringTWO044
     * @tc.desc Verify repeated 2-argument options calls return the equal grouped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(123456.0);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 2 };
      const first = arr.toLocaleString("en-US", opts);
      const second = arr.toLocaleString("en-US", opts);
      expect(second).assertEqual(first);
      expect(second).assertEqual("123,456");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4500
     * @tc.name testFloat32ArrayToLocaleStringTWO045
     * @tc.desc Verify view byteOffset stays 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4600
     * @tc.name testFloat32ArrayToLocaleStringTWO046
     * @tc.desc Verify view byteLength stays 12 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4700
     * @tc.name testFloat32ArrayToLocaleStringTWO047
     * @tc.desc Verify view buffer reference stays original ArrayBuffer after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4800
     * @tc.name testFloat32ArrayToLocaleStringTWO048
     * @tc.desc Verify view length stays 3 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_4900
     * @tc.name testFloat32ArrayToLocaleStringTWO049
     * @tc.desc Verify ArrayBuffer.isView still true after view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5000
     * @tc.name testFloat32ArrayToLocaleStringTWO050
     * @tc.desc Verify view first element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 1.5);
      const before: number = arr.$_get(0);
      arr.toLocaleString();
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5100
     * @tc.name testFloat32ArrayToLocaleStringTWO051
     * @tc.desc Verify parent array element unchanged after subarray view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = base.subarray(1, 3);
      view.toLocaleString();
      expect(base.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5200
     * @tc.name testFloat32ArrayToLocaleStringTWO052
     * @tc.desc Verify subarray view byteOffset stays 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = base.subarray(1, 3);
      view.toLocaleString();
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5300
     * @tc.name testFloat32ArrayToLocaleStringTWO053
     * @tc.desc Verify subarray view byteLength stays 8 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = base.subarray(1, 3);
      view.toLocaleString();
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5400
     * @tc.name testFloat32ArrayToLocaleStringTWO054
     * @tc.desc Verify shared buffer two views: calling one leaves the other view byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 5);
      v1.toLocaleString();
      expect(v2.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5500
     * @tc.name testFloat32ArrayToLocaleStringTWO055
     * @tc.desc Verify underlying ArrayBuffer byteLength unchanged after view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 4);
      arr.toLocaleString();
      expect(buf.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5600
     * @tc.name testFloat32ArrayToLocaleStringTWO056
     * @tc.desc Verify DataView byteLength unchanged after view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 4);
      const dv = new DataView(buf);
      arr.toLocaleString();
      expect(dv.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5700
     * @tc.name testFloat32ArrayToLocaleStringTWO057
     * @tc.desc Verify view still writable after call proving view not detached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.toLocaleString();
      arr.$_set(0, 88);
      expect(arr.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5800
     * @tc.name testFloat32ArrayToLocaleStringTWO058
     * @tc.desc Verify writing to view after call still reflects to parent array proving sharing preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = base.subarray(1, 3);
      view.toLocaleString();
      view.$_set(0, 99);
      expect(base.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_5900
     * @tc.name testFloat32ArrayToLocaleStringTWO059
     * @tc.desc Verify view last element value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(2, 7.5);
      const before: number = arr.$_get(2);
      arr.toLocaleString();
      expect(arr.$_get(2)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6000
     * @tc.name testFloat32ArrayToLocaleStringTWO060
     * @tc.desc Verify view still iterable after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.toLocaleString();
      const it = arr.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6100
     * @tc.name testFloat32ArrayToLocaleStringTWO061
     * @tc.desc Verify shared buffer two views: calling one leaves the other view element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 5);
      const before: number = v1.$_get(1);
      v2.toLocaleString();
      expect(v1.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6200
     * @tc.name testFloat32ArrayToLocaleStringTWO062
     * @tc.desc Verify nested subarray view byteOffset stays 8 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      const v1 = base.subarray(1, 5);
      const v2 = v1.subarray(1, 3);
      v2.toLocaleString();
      expect(v2.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6300
     * @tc.name testFloat32ArrayToLocaleStringTWO063
     * @tc.desc Verify view at(-1) value unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(2, 9);
      const before: number = arr.at(-1)!;
      arr.toLocaleString();
      expect(arr.at(-1)).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6400
     * @tc.name testFloat32ArrayToLocaleStringTWO064
     * @tc.desc Verify all-NaN array formats each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(NaN);
      const result = arr.toLocaleString();
      expect(result).assertEqual("NaN,NaN,NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6500
     * @tc.name testFloat32ArrayToLocaleStringTWO065
     * @tc.desc Verify mixed special-value receiver formats special numeric values with locale symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN, Infinity, -Infinity, 0.0, -0.0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("NaN,\u221e,-\u221e,0,-0");
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertEqual(Infinity);
      expect(1 / arr.$_get(4)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6600
     * @tc.name testFloat32ArrayToLocaleStringTWO066
     * @tc.desc Verify offset view containing Float32 minimum positive normal value uses default localized formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 1);
      arr.$_set(0, 1.1754943508222875e-38);
      const before: number = arr.$_get(0);
      const result = arr.toLocaleString();
      expect(result).assertEqual("0");
      expect(arr.$_get(0)).assertEqual(before);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6700
     * @tc.name testFloat32ArrayToLocaleStringTWO067
     * @tc.desc Verify new Float32Array(1) default zero element formats as "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const result = arr.toLocaleString();
      expect(result).assertEqual("0");
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGTWO_6800
     * @tc.name testFloat32ArrayToLocaleStringTWO068
     * @tc.desc Verify returned locale string remains a snapshot after the source changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.toLocaleString('en-US');
      arr.$_set(0, 9.0);
      expect(result).assertEqual('1,2');
      expect(arr.toLocaleString('en-US')).assertEqual('9,2');
    });

  });
}
