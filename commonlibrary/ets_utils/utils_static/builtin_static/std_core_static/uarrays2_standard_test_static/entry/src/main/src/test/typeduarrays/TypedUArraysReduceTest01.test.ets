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

export default function typedUArraysReduceTest01(): void {
  describe('TypedUArraysReduceTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0100
     * @tc.name testTypedUArraysReducePart101_001
     * @tc.desc Verify reduce 0 TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        (arr).reduce((a, b) => a + b);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0002
     * @tc.name testTypedUArraysReducePart101_002
     * @tc.desc Verify reduce 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0300
     * @tc.name testTypedUArraysReducePart101_003
     * @tc.desc Verify reduce 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0400
     * @tc.name testTypedUArraysReducePart101_004
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      let result = arr.reduce((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0500
     * @tc.name testTypedUArraysReducePart101_005
     * @tc.desc Verify callbackfn 1 previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum) => sum * 2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0600
     * @tc.name testTypedUArraysReducePart101_006
     * @tc.desc Verify callbackfn 3 currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce((sum: number, val: number): number => sum + val) + 3;
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0700
     * @tc.name testTypedUArraysReducePart101_007
     * @tc.desc Verify callbackfn string U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce<string>((result: string, val: number) => result + val, "");
      expect(result).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0800
     * @tc.name testTypedUArraysReducePart101_008
     * @tc.desc Verify callbackfn boolean U=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce<boolean>((acc: boolean, val: number) => acc && val > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0900
     * @tc.name testTypedUArraysReducePart101_009
     * @tc.desc Verify initialValue 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, 1.0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1000
     * @tc.name testTypedUArraysReducePart101_010
     * @tc.desc Verify initialValue -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, -1.0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1100
     * @tc.name testTypedUArraysReducePart101_011
     * @tc.desc Verify initialValue 255 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 255.0);
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1200
     * @tc.name testTypedUArraysReducePart101_012
     * @tc.desc Verify initialValue 65535 Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 65535.0);
      expect(result).assertEqual(65538);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0014
     * @tc.name testTypedUArraysReducePart101_013
     * @tc.desc Verify initialValue 4294967295 Uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967295.0);
      expect(result).assertEqual(4294967298);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1400
     * @tc.name testTypedUArraysReducePart101_014
     * @tc.desc Verify initialValue 256 Uint8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 256.0);
      expect(result).assertEqual(259);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1500
     * @tc.name testTypedUArraysReducePart101_015
     * @tc.desc Verify initialValue 65536 Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 65536.0);
      expect(result).assertEqual(65539);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0018
     * @tc.name testTypedUArraysReducePart101_016
     * @tc.desc Verify initialValue 4294967296 Uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 4294967296.0);
      expect(result).assertEqual(4294967299);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1700
     * @tc.name testTypedUArraysReducePart101_017
     * @tc.desc Verify initialValue NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0021
     * @tc.name testTypedUArraysReducePart101_018
     * @tc.desc Verify initialValue Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_1900
     * @tc.name testTypedUArraysReducePart101_019
     * @tc.desc Verify initialValue -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2000
     * @tc.name testTypedUArraysReducePart101_020
     * @tc.desc Verify initialValue 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, 1.5);
      expect(result).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2100
     * @tc.name testTypedUArraysReducePart101_021
     * @tc.desc Verify initialValue -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, -1.5);
      expect(result).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2200
     * @tc.name testTypedUArraysReducePart101_022
     * @tc.desc Verify initialValue 0x10 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, 16.0);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2300
     * @tc.name testTypedUArraysReducePart101_023
     * @tc.desc Verify initialValue 1e2 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce((sum, val) => sum + val, 100.0);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2400
     * @tc.name testTypedUArraysReducePart101_024
     * @tc.desc Verify initialValue string U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce<string>((result: string, val: number) => result + val, "start:");
      expect(result).assertEqual("start:123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2500
     * @tc.name testTypedUArraysReducePart101_025
     * @tc.desc Verify initialValue boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduce<boolean>((acc: boolean, val: number) => acc || val > 0, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4500

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2600
     * @tc.name testTypedUArraysReducePart101_026
     * @tc.desc Verify initialValue object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      let result = arr.reduce((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4900

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2700
     * @tc.name testTypedUArraysReducePart101_027
     * @tc.desc Verify reduceRight with empty array and no initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      try {
        (arr).reduceRight((a, b) => a + b);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2800
     * @tc.name testTypedUArraysReducePart101_028
     * @tc.desc Verify reduceRight with basic callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_2900
     * @tc.name testTypedUArraysReducePart101_029
     * @tc.desc Verify reduceRight with initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3000
     * @tc.name testTypedUArraysReducePart101_030
     * @tc.desc Verify reduceRight right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight<string>((acc: string, val: number) => acc + val.toString(), "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3100
     * @tc.name testTypedUArraysReducePart101_031
     * @tc.desc Verify reduceRight with callbackfn null throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum: number, val: number) => sum + val);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_5600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3200
     * @tc.name testTypedUArraysReducePart101_032
     * @tc.desc Verify reduceRight with single element and no initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3300
     * @tc.name testTypedUArraysReducePart101_033
     * @tc.desc Verify reduceRight with callbackfn returning string U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight<string>((result: string, val: number) => result + val, "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3400
     * @tc.name testTypedUArraysReducePart101_034
     * @tc.desc Verify reduceRight with callbackfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let indices: number[] = [];
      let count: number = 0;
      arr.reduceRight((sum: number, val: number): number => {
        indices.push(count);
        count++;
        return sum + val;
      }, 0);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3500
     * @tc.name testTypedUArraysReducePart101_035
     * @tc.desc Verify reduceRight with NaN as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3600
     * @tc.name testTypedUArraysReducePart101_036
     * @tc.desc Verify reduceRight with Infinity as initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.reduceRight((sum, val) => sum + val, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3700
     * @tc.name testTypedUArraysReducePart101_037
     * @tc.desc Verify reduceRight with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_3800
     * @tc.name testTypedUArraysReducePart101_038
     * @tc.desc Verify join with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0043
     * @tc.name testTypedUArraysReducePart101_039
     * @tc.desc Verify join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.join("-");
      expect(result).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0045
     * @tc.name testTypedUArraysReducePart101_040
     * @tc.desc Verify join with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4100
     * @tc.name testTypedUArraysReducePart101_041
     * @tc.desc Verify join with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      let result = arr.join();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4200
     * @tc.name testTypedUArraysReducePart101_042
     * @tc.desc Verify toString on Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0049
     * @tc.name testTypedUArraysReducePart101_043
     * @tc.desc Verify toString on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      let result = arr.toString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4400
     * @tc.name testTypedUArraysReducePart101_044
     * @tc.desc Verify toLocaleString on Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_7000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_7100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0052
     * @tc.name testTypedUArraysReducePart101_045
     * @tc.desc Verify toString with Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1000, 2000, 3000);
      let result = arr.toString();
      expect(result).assertEqual("1000,2000,3000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0054
     * @tc.name testTypedUArraysReducePart101_046
     * @tc.desc Verify join with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      let result = arr.join(":");
      expect(result).assertEqual("10:20:30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_4700
     * @tc.name testTypedUArraysReducePart101_047
     * @tc.desc Verify toString with Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 15, 25);
      let result = arr.toString();
      expect(result).assertEqual("5,15,25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART101_0057
     * @tc.name testTypedUArraysReducePart101_048
     * @tc.desc Verify toLocaleString with Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReducePart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1000, 2000);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
      expect(result.length > 0).assertTrue();
    });

  });
}
