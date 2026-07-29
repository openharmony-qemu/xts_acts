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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0060

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0001
     * @tc.name testTypedUArraysReducePart101_001
     * @tc.desc Verify reduce with Uint8Array and initialValue 0xFFFFFFFF result equals 4294967298
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967295.0);
      expect(result).assertEqual(4294967298);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0003
     * @tc.name testTypedUArraysReducePart101_002
     * @tc.desc Verify reduce with Uint8Array and Number.MAX_SAFE_INTEGER as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0004
     * @tc.name testTypedUArraysReducePart101_003
     * @tc.desc Verify reduce with Uint8Array and Number.MIN_SAFE_INTEGER as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0005
     * @tc.name testTypedUArraysReducePart101_004
     * @tc.desc Verify reduce with Uint8Array and Number.MAX_VALUE as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0006
     * @tc.name testTypedUArraysReducePart101_005
     * @tc.desc Verify reduce with Uint8Array and Number.MIN_VALUE as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(3 + Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0062

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0007
     * @tc.name testTypedUArraysReducePart101_006
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x100 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 256.0);
      expect(result).assertEqual(259);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0008
     * @tc.name testTypedUArraysReducePart101_007
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x7FFF 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 32767.0);
      expect(result).assertEqual(32770);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0009
     * @tc.name testTypedUArraysReducePart101_008
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 32768.0);
      expect(result).assertEqual(32771);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0010
     * @tc.name testTypedUArraysReducePart101_009
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x7FFFFFFF 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 2147483647.0);
      expect(result).assertEqual(2147483650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0011
     * @tc.name testTypedUArraysReducePart101_010
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x80000000 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 2147483648.0);
      expect(result).assertEqual(2147483651);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0012
     * @tc.name testTypedUArraysReducePart101_011
     * @tc.desc Verify reduce with Uint8Array and initialValue 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 1e10);
      expect(result).assertEqual(10000000003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0013
     * @tc.name testTypedUArraysReducePart101_012
     * @tc.desc Verify reduce with Uint8Array and initialValue 1.5e1 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 1.5e1);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0015
     * @tc.name testTypedUArraysReducePart101_013
     * @tc.desc Verify reduce with Uint8Array and initialValue 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 0.5);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0016
     * @tc.name testTypedUArraysReducePart101_014
     * @tc.desc Verify reduce with Uint8Array and initialValue -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, -0.5);
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0017
     * @tc.name testTypedUArraysReducePart101_015
     * @tc.desc Verify reduce with Uint8Array and initialValue 2.220446049250313e-16 Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 2.220446049250313e-16);
      expect(result).assertEqual(1 + 2.220446049250313e-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0019
     * @tc.name testTypedUArraysReducePart101_016
     * @tc.desc Verify reduce with Uint8Array and initialValue 2.2250738585072014e-308 MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(1 + 2.2250738585072014e-308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0020
     * @tc.name testTypedUArraysReducePart101_017
     * @tc.desc Verify reduce with Uint8Array and initialValue 128 0x80 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 128.0);
      expect(result).assertEqual(131);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0022
     * @tc.name testTypedUArraysReducePart101_018
     * @tc.desc Verify reduce with Uint8Array and initialValue 127 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 127.0);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0064

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0065

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0023
     * @tc.name testTypedUArraysReducePart101_019
     * @tc.desc Verify reduce with Uint8Array and initialValue -2147483648 Int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, -2147483648.0);
      expect(result).assertEqual(-2147483645);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0024
     * @tc.name testTypedUArraysReducePart101_020
     * @tc.desc Verify reduce with Uint8Array and initialValue 9007199254740991 MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 9007199254740991.0);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0025
     * @tc.name testTypedUArraysReducePart101_021
     * @tc.desc Verify reduce with Uint8Array and initialValue -9007199254740991 MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, -9007199254740991.0);
      expect(result).assertEqual(-9007199254740990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0026
     * @tc.name testTypedUArraysReducePart101_022
     * @tc.desc Verify reduce with Uint8Array and initialValue 1.7976931348623157e+308 MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      let result = arr.reduce((sum, val) => sum + val, 1.7976931348623157e+308);
      expect(result).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0027
     * @tc.name testTypedUArraysReducePart101_023
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x10000 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 65536.0);
      expect(result).assertEqual(65539);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0028
     * @tc.name testTypedUArraysReducePart101_024
     * @tc.desc Verify reduce with Uint8Array and initialValue 0x100000000 4294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967296.0);
      expect(result).assertEqual(4294967299);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0029
     * @tc.name testTypedUArraysReducePart101_025
     * @tc.desc Verify reduce with empty Uint8Array and initialValue 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, 42.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0030
     * @tc.name testTypedUArraysReducePart101_026
     * @tc.desc Verify reduce with empty Uint8Array and initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0031
     * @tc.name testTypedUArraysReducePart101_027
     * @tc.desc Verify reduce with empty Uint8Array and NaN initialValue returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0032
     * @tc.name testTypedUArraysReducePart101_028
     * @tc.desc Verify reduce with empty Uint8Array and Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0033
     * @tc.name testTypedUArraysReducePart101_029
     * @tc.desc Verify reduce with empty Uint8Array and -Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.reduce((sum, val) => sum + val, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0034
     * @tc.name testTypedUArraysReducePart101_030
     * @tc.desc Verify reduce with Uint8Array and initialValue 50 result equals 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      let result = arr.reduce((sum, val) => sum + val, 50.0);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0035
     * @tc.name testTypedUArraysReducePart101_031
     * @tc.desc Verify reduce with single element Uint8Array and initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0036
     * @tc.name testTypedUArraysReducePart101_032
     * @tc.desc Verify reduce with Uint8Array of 1 to 10 elements sum equals 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0037
     * @tc.name testTypedUArraysReducePart101_033
     * @tc.desc Verify reduce with Uint8Array containing NaN element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0038
     * @tc.name testTypedUArraysReducePart101_034
     * @tc.desc Verify reduce with Uint8Array containing -1 -2 -3 clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0039
     * @tc.name testTypedUArraysReducePart101_035
     * @tc.desc Verify reduce with Uint8Array of float values 1.5 2.7 3.9 sum equals 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0040
     * @tc.name testTypedUArraysReducePart101_036
     * @tc.desc Verify reduce with Uint8Array of negative float values -1.5 -2.7 -3.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0041
     * @tc.name testTypedUArraysReducePart101_037
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0066

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0067

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0068

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0042
     * @tc.name testTypedUArraysReducePart101_038
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0069

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0070

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0044
     * @tc.name testTypedUArraysReducePart101_039
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0046
     * @tc.name testTypedUArraysReducePart101_040
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0047
     * @tc.name testTypedUArraysReducePart101_041
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_9900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0048
     * @tc.name testTypedUArraysReducePart101_042
     * @tc.desc Verify reduceRight with Uint8Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 128, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0050
     * @tc.name testTypedUArraysReducePart101_043
     * @tc.desc Verify reduceRight with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(65535, 32768, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(98303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0051
     * @tc.name testTypedUArraysReducePart101_044
     * @tc.desc Verify reduceRight with Uint32Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 2147483648, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6442450943);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0053
     * @tc.name testTypedUArraysReducePart101_045
     * @tc.desc Verify reduceRight with Uint8Array and initialValue 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum: number, val: number): number => sum + val, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0055
     * @tc.name testTypedUArraysReducePart101_046
     * @tc.desc Verify reduceRight with Uint8Array and Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0056
     * @tc.name testTypedUArraysReducePart101_047
     * @tc.desc Verify reduceRight with Uint8Array and -Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0058
     * @tc.name testTypedUArraysReducePart101_048
     * @tc.desc Verify reduceRight with Uint8Array and NaN initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0059
     * @tc.name testTypedUArraysReducePart101_049
     * @tc.desc Verify reduceRight with Uint8Array and Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduceRight((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0061
     * @tc.name testTypedUArraysReducePart101_050
     * @tc.desc Verify reduceRight with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(300, -10, 128.0);
      let result = arr.reduceRight((sum: number, val: number): number => sum + val, 0.0);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5100
     * @tc.name testTypedUArraysReducePart101_051
     * @tc.desc Verify reduceRight with Uint8Array and 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5200
     * @tc.name testTypedUArraysReducePart101_052
     * @tc.desc Verify reduceRight with Uint8Array containing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0, 0.0);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5300
     * @tc.name testTypedUArraysReducePart101_053
     * @tc.desc Verify reduceRight with Uint8Array NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5400
     * @tc.name testTypedUArraysReducePart101_054
     * @tc.desc Verify join with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535);
      let result = arr.join(":");
      expect(result).assertEqual("0:65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5500
     * @tc.name testTypedUArraysReducePart101_055
     * @tc.desc Verify join with Uint32Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295);
      let result = arr.join("|");
      expect(result).assertEqual("0|4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0063
     * @tc.name testTypedUArraysReducePart101_056
     * @tc.desc Verify toString with Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 65535, 32768);
      let result = arr.toString();
      expect(result).assertEqual("0,65535,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5700
     * @tc.name testTypedUArraysReducePart101_057
     * @tc.desc Verify toLocaleString with Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 300);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5800
     * @tc.name testTypedUArraysReducePart101_058
     * @tc.desc Verify join with empty separator string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.join("");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5900
     * @tc.name testTypedUArraysReducePart101_059
     * @tc.desc Verify toString with Uint8ClampedArray clamped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(300, -10, 128.0);
      let result = arr.toString();
      expect(result).assertEqual("255,0,128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_6000
     * @tc.name testTypedUArraysReducePart101_060
     * @tc.desc Verify reduceRight with Uint8Array and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_6100
     * @tc.name testTypedUArraysReducePart101_061
     * @tc.desc Verify reduceRight with Uint8Array float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_6200
     * @tc.name testTypedUArraysReducePart101_062
     * @tc.desc Verify reduceRight with Uint8Array negative float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(-1.5, -2.7, -3.9);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });

  });
}
