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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysReduceTest04(): void {
  describe('TypedUArraysReduceTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0100
     * @tc.name testTypedUArraysReduceTestFileD001
     * @tc.desc Verify reduce with Uint8Array and initialValue 0xFFFFFFFF result equals 4294967298
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967295.0);
      expect(result).assertEqual(4294967298);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0200
     * @tc.name testTypedUArraysReduceTestFileD002
     * @tc.desc Verify reduce with Uint8Array and Number.MAX_SAFE_INTEGER as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0300
     * @tc.name testTypedUArraysReduceTestFileD003
     * @tc.desc Verify reduce with Uint8Array and Number.MIN_SAFE_INTEGER as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0400
     * @tc.name testTypedUArraysReduceTestFileD004
     * @tc.desc Verify reduce with Uint8Array and Number.MAX_VALUE as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0500
     * @tc.name testTypedUArraysReduceTestFileD005
     * @tc.desc Verify reduce with Uint8Array and Number.MIN_VALUE as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(3 + Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0600
     * @tc.name testTypedUArraysReduceTestFileD006
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x100 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 256.0);
      expect(result).assertEqual(259);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0700
     * @tc.name testTypedUArraysReduceTestFileD007
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x7FFF 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 32767.0);
      expect(result).assertEqual(32770);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0800
     * @tc.name testTypedUArraysReduceTestFileD008
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 32768.0);
      expect(result).assertEqual(32771);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_0900
     * @tc.name testTypedUArraysReduceTestFileD009
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x7FFFFFFF 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 2147483647.0);
      expect(result).assertEqual(2147483650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1000
     * @tc.name testTypedUArraysReduceTestFileD010
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x80000000 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 2147483648.0);
      expect(result).assertEqual(2147483651);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1100
     * @tc.name testTypedUArraysReduceTestFileD011
     * @tc.desc Verify reduce with Uint8Array and initialValue 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 1e10);
      expect(result).assertEqual(10000000003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1200
     * @tc.name testTypedUArraysReduceTestFileD012
     * @tc.desc Verify reduce with Uint8Array and initialValue 1.5e1 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 1.5e1);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1300
     * @tc.name testTypedUArraysReduceTestFileD013
     * @tc.desc Verify reduce with Uint8Array and initialValue 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 0.5);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1400
     * @tc.name testTypedUArraysReduceTestFileD014
     * @tc.desc Verify reduce with Uint8Array and initialValue -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, -0.5);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1500
     * @tc.name testTypedUArraysReduceTestFileD015
     * @tc.desc Verify reduce with Uint8Array and initialValue 2.220446049250313e-16 Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 2.220446049250313e-16);
      expect(result).assertEqual(1 + 2.220446049250313e-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1600
     * @tc.name testTypedUArraysReduceTestFileD016
     * @tc.desc Verify reduce with Uint8Array and initialValue 2.2250738585072014e-308 MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(1 + 2.2250738585072014e-308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1700
     * @tc.name testTypedUArraysReduceTestFileD017
     * @tc.desc Verify reduce with Uint8Array and initialValue 128 0x80 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 128.0);
      expect(result).assertEqual(131);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1800
     * @tc.name testTypedUArraysReduceTestFileD018
     * @tc.desc Verify reduce with Uint8Array and initialValue 127 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 127.0);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_1900
     * @tc.name testTypedUArraysReduceTestFileD019
     * @tc.desc Verify reduce with Uint8Array and initialValue -2147483648 Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, -2147483648.0);
      expect(result).assertEqual(-2147483645);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2000
     * @tc.name testTypedUArraysReduceTestFileD020
     * @tc.desc Verify reduce with Uint8Array and initialValue 9007199254740991 MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 9007199254740991.0);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2100
     * @tc.name testTypedUArraysReduceTestFileD021
     * @tc.desc Verify reduce with Uint8Array and initialValue -9007199254740991 MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, -9007199254740991.0);
      expect(result).assertEqual(-9007199254740990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2200
     * @tc.name testTypedUArraysReduceTestFileD022
     * @tc.desc Verify reduce with Uint8Array and initialValue 1.7976931348623157e+308 MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 1.7976931348623157e+308);
      expect(result).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2300
     * @tc.name testTypedUArraysReduceTestFileD023
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x10000 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 65536.0);
      expect(result).assertEqual(65539);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2400
     * @tc.name testTypedUArraysReduceTestFileD024
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x100000000 4294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967296.0);
      expect(result).assertEqual(4294967299);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2500
     * @tc.name testTypedUArraysReduceTestFileD025
     * @tc.desc Verify reduce with empty Uint8Array and initialValue 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, 42.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2600
     * @tc.name testTypedUArraysReduceTestFileD026
     * @tc.desc Verify reduce with empty Uint8Array and initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2700
     * @tc.name testTypedUArraysReduceTestFileD027
     * @tc.desc Verify reduce with empty Uint8Array and NaN initialValue returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2800
     * @tc.name testTypedUArraysReduceTestFileD028
     * @tc.desc Verify reduce with empty Uint8Array and Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_2900
     * @tc.name testTypedUArraysReduceTestFileD029
     * @tc.desc Verify reduce with empty Uint8Array and -Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3000
     * @tc.name testTypedUArraysReduceTestFileD030
     * @tc.desc Verify reduce with Uint8Array and initialValue 50 result equals 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      let result = arr.reduce((sum, val) => sum + val, 50.0);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3100
     * @tc.name testTypedUArraysReduceTestFileD031
     * @tc.desc Verify reduce with single element Uint8Array and initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3200
     * @tc.name testTypedUArraysReduceTestFileD032
     * @tc.desc Verify reduce with Uint8Array of 1 to 10 elements sum equals 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3300
     * @tc.name testTypedUArraysReduceTestFileD033
     * @tc.desc Verify reduce with Uint8Array containing NaN element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3400
     * @tc.name testTypedUArraysReduceTestFileD034
     * @tc.desc Verify reduce with Uint8Array containing -1 -2 -3 clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3500
     * @tc.name testTypedUArraysReduceTestFileD035
     * @tc.desc Verify reduceRight with Uint8Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 128, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3600
     * @tc.name testTypedUArraysReduceTestFileD036
     * @tc.desc Verify reduceRight with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 32768, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(98303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3700
     * @tc.name testTypedUArraysReduceTestFileD037
     * @tc.desc Verify reduceRight with Uint32Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 2147483648, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6442450943);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3800
     * @tc.name testTypedUArraysReduceTestFileD038
     * @tc.desc Verify reduceRight with Uint8Array and initialValue 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum: number, val: number): number => sum + val, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_3900
     * @tc.name testTypedUArraysReduceTestFileD039
     * @tc.desc Verify reduceRight with Uint8Array and Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4000
     * @tc.name testTypedUArraysReduceTestFileD040
     * @tc.desc Verify reduceRight with Uint8Array and -Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4100
     * @tc.name testTypedUArraysReduceTestFileD041
     * @tc.desc Verify reduceRight with Uint8Array and NaN initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4200
     * @tc.name testTypedUArraysReduceTestFileD042
     * @tc.desc Verify reduceRight with Uint8Array and Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduceRight((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4300
     * @tc.name testTypedUArraysReduceTestFileD043
     * @tc.desc Verify reduceRight with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(300, -10, 128.0);
      let result = arr.reduceRight((sum: number, val: number): number => sum + val, 0.0);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4400
     * @tc.name testTypedUArraysReduceTestFileD044
     * @tc.desc Verify reduceRight with Uint8Array and 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4500
     * @tc.name testTypedUArraysReduceTestFileD045
     * @tc.desc Verify reduceRight with Uint8Array containing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4600
     * @tc.name testTypedUArraysReduceTestFileD046
     * @tc.desc Verify reduceRight with Uint8Array NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4700
     * @tc.name testTypedUArraysReduceTestFileD047
     * @tc.desc Verify join with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535);
      let result = arr.join(":");
      expect(result).assertEqual("0:65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4800
     * @tc.name testTypedUArraysReduceTestFileD048
     * @tc.desc Verify join with Uint32Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295);
      let result = arr.join("|");
      expect(result).assertEqual("0|4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_4900
     * @tc.name testTypedUArraysReduceTestFileD049
     * @tc.desc Verify toString with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535, 32768);
      let result = arr.toString();
      expect(result).assertEqual("0,65535,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_5000
     * @tc.name testTypedUArraysReduceTestFileD050
     * @tc.desc Verify toLocaleString with Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 300);
      let result = arr.toLocaleString();
      expect(result).assertEqual(arr[0].toLocaleString() + ',' + arr[1].toLocaleString() + ',' + arr[2].toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_5100
     * @tc.name testTypedUArraysReduceTestFileD051
     * @tc.desc Verify join with empty separator string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.join("");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_5200
     * @tc.name testTypedUArraysReduceTestFileD052
     * @tc.desc Verify toString with Uint8ClampedArray clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(300, -10, 128.0);
      let result = arr.toString();
      expect(result).assertEqual("255,0,128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_5300
     * @tc.name testTypedUArraysReduceTestFileD053
     * @tc.desc Verify reduceRight with Uint8Array and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCETEST04_5400
     * @tc.name testTypedUArraysReduceTestFileD054
     * @tc.desc Verify reduceRight with Uint8Array negative float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileD054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(-1.5, -2.7, -3.9);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });
  });
}
