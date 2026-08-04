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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArraySlice01Test(): void {
  describe('BigInt64ArraySlice01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0100
     * @tc.name testBigInt64ArraySlice001
     * @tc.desc Verify slice with no arguments returns a full copy array equal the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
      expect(res[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0200
     * @tc.name testBigInt64ArraySlice002
     * @tc.desc Verify slice with positive begin and negative end extracts correct range excluding the tail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(1, -1);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0300
     * @tc.name testBigInt64ArraySlice003
     * @tc.desc Verify slice with one argument returns a copy from begin to the end with correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(2);
      expect(res[0]).assertEqual(30n);
      expect(res[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0400
     * @tc.name testBigInt64ArraySlice004
     * @tc.desc Verify slice with two arguments returns a copy of [begin, end) with correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(1, 4);
      expect(res[0]).assertEqual(20n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0500
     * @tc.name testBigInt64ArraySlice005
     * @tc.desc Verify slice(0, 0) on a non-empty array returns an empty array with byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(0, 0);
      expect(res.byteLength).assertEqual(0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0600
     * @tc.name testBigInt64ArraySlice006
     * @tc.desc Verify slice with single begin index -1(the last element) on a simple array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-1);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0700
     * @tc.name testBigInt64ArraySlice007
     * @tc.desc Verify slice(-5) on a 5-element array (begin equals -length, boundary value) returns full copy from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-5);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(4n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0800
     * @tc.name testBigInt64ArraySlice008
     * @tc.desc Verify slice(-4) on a 5-element array (begin equals -(length-1), boundary+1 value) returns elements from index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-4);
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(3n);
      expect(res[2]).assertEqual(4n);
      expect(res[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_0900
     * @tc.name testBigInt64ArraySlice009
     * @tc.desc Verify slice with single begin argument hexadecimal 0x1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(0x1);
      expect(res[0]).assertEqual(2n);
      expect(res[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1000
     * @tc.name testBigInt64ArraySlice010
     * @tc.desc Verify slice(0, 7) on a 7-element array (end equals length, boundary value) returns full copy with all 7 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(0, 7);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
      expect(res[4]).assertEqual(50n);
      expect(res[5]).assertEqual(60n);
      expect(res[6]).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1100
     * @tc.name testBigInt64ArraySlice011
     * @tc.desc Verify slice(0, 6) on a 7-element array (end equals length-1, boundary-1 value) excludes the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(0, 6);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
      expect(res[4]).assertEqual(50n);
      expect(res[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1200
     * @tc.name testBigInt64ArraySlice012
     * @tc.desc Verify slice with begin 0 and end -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(0, -1);
      expect(res[0]).assertEqual(10n);
      expect(res[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1300
     * @tc.name testBigInt64ArraySlice013
     * @tc.desc Verify slice with begin 0 and end -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(0, -4);
      expect(res[0]).assertEqual(10n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1400
     * @tc.name testBigInt64ArraySlice014
     * @tc.desc Verify slice with begin 0 and end -7.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(0, -7);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1500
     * @tc.name testBigInt64ArraySlice015
     * @tc.desc Verify slice with positive begin (3, middle value) greater than end (0) returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(3, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1600
     * @tc.name testBigInt64ArraySlice016
     * @tc.desc Verify slice with begin 3 and end 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(3, 5);
      expect(res[0]).assertEqual(40n);
      expect(res[1]).assertEqual(50n);
      try {
        let v = res[2];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1700
     * @tc.name testBigInt64ArraySlice017
     * @tc.desc Verify slice with begin 3 and end -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(3, -1);
      expect(res[0]).assertEqual(40n);
      expect(res[2]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1800
     * @tc.name testBigInt64ArraySlice018
     * @tc.desc Verify slice with negative begin (-2, resolved to index 5, middle value) greater than end (0) returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(-2, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_1900
     * @tc.name testBigInt64ArraySlice019
     * @tc.desc Verify slice with begin -7 and end 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(-7, 3);
      expect(res[0]).assertEqual(10n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2000
     * @tc.name testBigInt64ArraySlice020
     * @tc.desc Verify slice with negative begin (-8, beyond length clamped to 0, boundary overflow) equals end (0) returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(-8, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2100
     * @tc.name testBigInt64ArraySlice021
     * @tc.desc Verify slice on a single-element array with one argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let res = arr.slice(1);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2200
     * @tc.name testBigInt64ArraySlice022
     * @tc.desc Verify slice on a single-element array with equal negative bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let res = arr.slice(-1, -1);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2300
     * @tc.name testBigInt64ArraySlice023
     * @tc.desc Verify slice on an empty array with zero bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.slice(0, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2400
     * @tc.name testBigInt64ArraySlice024
     * @tc.desc Verify slice with both arguments negative and begin less than end returns correct subrange.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-2, -1);
      expect(res[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2500
     * @tc.name testBigInt64ArraySlice025
     * @tc.desc Verify slice with both arguments negative covering middle range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-4, -2);
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2600
     * @tc.name testBigInt64ArraySlice026
     * @tc.desc Verify slice with negative begin greater than negative end returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-1, -3);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2700
     * @tc.name testBigInt64ArraySlice027
     * @tc.desc Verify slice with out-of-bounds negative begin clamped to zero and valid negative end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-6, -1);
      expect(res[0]).assertEqual(1n);
      expect(res[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2800
     * @tc.name testBigInt64ArraySlice028
     * @tc.desc Verify slice with valid negative begin and extreme out-of-bounds negative end results empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(-2, -100);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_2900
     * @tc.name testBigInt64ArraySlice029
     * @tc.desc Verify slice with begin equals end using positive index 1 returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(1, 1);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3000
     * @tc.name testBigInt64ArraySlice030
     * @tc.desc Verify slice with begin=3 returns tail elements from that index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(3);
      expect(res[0]).assertEqual(4n);
      expect(res[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3100
     * @tc.name testBigInt64ArraySlice031
     * @tc.desc Verify slice(2, 3) returns a single-element array containing only the element at index 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(2, 3);
      expect(res[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3200
     * @tc.name testBigInt64ArraySlice032
     * @tc.desc Verify slice with begin=2 and end=4 returns elements in that range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(2, 4);
      expect(res[0]).assertEqual(30n);
      expect(res[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3300
     * @tc.name testBigInt64ArraySlice033
     * @tc.desc Verify slice with negative begin resolving to zero and positive end extracts correct prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(-5, 3);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3400
     * @tc.name testBigInt64ArraySlice034
     * @tc.desc Verify slice accepts variable expressions for begin and end parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let b = 2;
      let e = 4;
      let res = arr.slice(b, e);
      expect(res[0]).assertEqual(30n);
      expect(res[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3500
     * @tc.name testBigInt64ArraySlice035
     * @tc.desc Verify slice accepts a variable expression as a negative begin parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let b = -2;
      let res = arr.slice(b);
      expect(res[0]).assertEqual(40n);
      expect(res[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3600
     * @tc.name testBigInt64ArraySlice036
     * @tc.desc Verify slice extracts the element with BigInt64 maximum value at a specific position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 2n]);
      let res = arr.slice(1, 2);
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3700
     * @tc.name testBigInt64ArraySlice037
     * @tc.desc Verify slice extracts the element with BigInt64 minimum value at a specific position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -9223372036854775808n, 2n]);
      let res = arr.slice(1, 2);
      expect(res[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3800
     * @tc.name testBigInt64ArraySlice038
     * @tc.desc Verify slice from positive index to end preserves MIN and subsequent element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 1n]);
      let res = arr.slice(1);
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_3900
     * @tc.name testBigInt64ArraySlice039
     * @tc.desc Verify slice with negative begin extracts the last element with BigInt64 maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 9223372036854775807n]);
      let res = arr.slice(-1);
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4000
     * @tc.name testBigInt64ArraySlice040
     * @tc.desc Verify slice extracts BigInt64 minimum at the first position with explicit begin and end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n]);
      let res = arr.slice(0, 1);
      expect(res[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4100
     * @tc.name testBigInt64ArraySlice041
     * @tc.desc Verify slice covering the full range preserves both boundary values together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n, -9223372036854775808n]);
      let res = arr.slice(0, 3);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4200
     * @tc.name testBigInt64ArraySlice042
     * @tc.desc Verify slice of a single-element array containing BigInt64 maximum preserves the value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.slice();
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4300
     * @tc.name testBigInt64ArraySlice043
     * @tc.desc Verify slice of a single-element array containing BigInt64 minimum preserves the value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let res = arr.slice();
      expect(res[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4400
     * @tc.name testBigInt64ArraySlice044
     * @tc.desc Verify slice from a BigInt64Array created by BigInt64Array.of() with single begin argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n, 40n, 50n);
      let res = arr.slice(1);
      expect(res[0]).assertEqual(20n);
      expect(res[3]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4500
     * @tc.name testBigInt64ArraySlice045
     * @tc.desc Verify slice from a BigInt64Array created by BigInt64Array.of() with begin and end arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n, 40n, 50n);
      let res = arr.slice(1, 4);
      expect(res[0]).assertEqual(20n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4600
     * @tc.name testBigInt64ArraySlice046
     * @tc.desc Verify slice with begin zero on a single-element BigInt64Array created by of().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      let res = arr.slice(0);
      expect(res[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4700
     * @tc.name testBigInt64ArraySlice047
     * @tc.desc Verify slice with negative begin on a BigInt64Array created by of() returns tail elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(7n, 8n, 9n);
      let res = arr.slice(-2);
      expect(res[0]).assertEqual(8n);
      expect(res[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4800
     * @tc.name testBigInt64ArraySlice048
     * @tc.desc Verify slice with both negative arguments on a BigInt64Array created by of().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n, 6n, 7n, 8n);
      let res = arr.slice(-3, -1);
      expect(res[0]).assertEqual(6n);
      expect(res[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_4900
     * @tc.name testBigInt64ArraySlice049
     * @tc.desc Verify slice on an ArrayBuffer-backed view with byte offset preserves element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 111n;
      arr[1] = 222n;
      let res = arr.slice();
      expect(res[0]).assertEqual(111n);
      expect(res[1]).assertEqual(222n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5000
     * @tc.name testBigInt64ArraySlice050
     * @tc.desc Verify slice with single begin on an ArrayBuffer-backed view with byte offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let res = arr.slice(1);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5100
     * @tc.name testBigInt64ArraySlice051
     * @tc.desc Verify slice with begin and end on an ArrayBuffer-backed view with byte offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 16, 3);
      arr[0] = 100n;
      arr[1] = 200n;
      arr[2] = 300n;
      let res = arr.slice(1, 2);
      expect(res[0]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5200
     * @tc.name testBigInt64ArraySlice052
     * @tc.desc Verify slice isolation on ArrayBuffer-backed view leaves the source unchanged after modification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 50n;
      arr[1] = 60n;
      arr[2] = 70n;
      let res = arr.slice();
      res[0] = 99n;
      expect(arr[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5300
     * @tc.name testBigInt64ArraySlice053
     * @tc.desc Verify slice with negative begin on an ArrayBuffer-backed view obtains the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      let res = arr.slice(-1);
      expect(res[0]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5400
     * @tc.name testBigInt64ArraySlice054
     * @tc.desc Verify slice with zero bounds on an ArrayBuffer-backed view returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 1n;
      arr[1] = 2n;
      let res = arr.slice(0, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5500
     * @tc.name testBigInt64ArraySlice055
     * @tc.desc Verify for-of iteration over a slice result yields the correct element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(1, 4);
      let vals = new BigInt64Array(3);
      let i = 0;
      for (let v of res) {
        vals[i] = v;
        i++;
      }
      expect(vals[0]).assertEqual(20n);
      expect(vals[1]).assertEqual(30n);
      expect(vals[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5600
     * @tc.name testBigInt64ArraySlice056
     * @tc.desc Verify two independent slice calls from the same source at different ranges return correct data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res1 = arr.slice(0, 2);
      let res2 = arr.slice(2, 5);
      expect(res1[0]).assertEqual(10n);
      expect(res1[1]).assertEqual(20n);
      expect(res2[0]).assertEqual(30n);
      expect(res2[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5700
     * @tc.name testBigInt64ArraySlice057
     * @tc.desc Verify three independent slice calls from the same source all return correct data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res1 = arr.slice(0, 1);
      let res2 = arr.slice(1, 4);
      let res3 = arr.slice(4);
      expect(res1[0]).assertEqual(1n);
      expect(res2[0]).assertEqual(2n);
      expect(res3[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5800
     * @tc.name testBigInt64ArraySlice058
     * @tc.desc Verify two slice calls with overlapping ranges from the same source are independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res1 = arr.slice(1, 4);
      let res2 = arr.slice(2, 5);
      expect(res1[0]).assertEqual(20n);
      expect(res2[0]).assertEqual(30n);
      expect(res1[2]).assertEqual(40n);
      expect(res2[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_5900
     * @tc.name testBigInt64ArraySlice059
     * @tc.desc Verify modifying one independent slice does not affect another slice from the same source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res1 = arr.slice();
      let res2 = arr.slice();
      res1[0] = 99n;
      expect(res2[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6000
     * @tc.name testBigInt64ArraySlice060
     * @tc.desc Verify slice on a 10-element array from index 3 to 8 returns the correct subrange.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n, 90n, 100n]);
      let res = arr.slice(3, 8);
      expect(res[0]).assertEqual(40n);
      expect(res[4]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6100
     * @tc.name testBigInt64ArraySlice061
     * @tc.desc Verify slice on a 15-element array with negative begin returns the correct tail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n,2n,3n,4n,5n,6n,7n,8n,9n,10n,11n,12n,13n,14n,15n]);
      let res = arr.slice(-5);
      expect(res[0]).assertEqual(11n);
      expect(res[4]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6200
     * @tc.name testBigInt64ArraySlice062
     * @tc.desc Verify slice on a 12-element array from 0 to length returns full copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n,2n,3n,4n,5n,6n,7n,8n,9n,10n,11n,12n]);
      let res = arr.slice(0, 12);
      expect(res[0]).assertEqual(1n);
      expect(res[11]).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6300
     * @tc.name testBigInt64ArraySlice063
     * @tc.desc Verify slice on an 8-element array from index 4 to end returns the right half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n]);
      let res = arr.slice(4);
      expect(res[0]).assertEqual(50n);
      expect(res[3]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6400
     * @tc.name testBigInt64ArraySlice064
     * @tc.desc Verify slice on a 20-element array from middle to end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new BigInt64Array(20);
      for (let i = 0; i < 20; i++) {
        source[i] = BigInt(i * 10);
      }
      let res = source.slice(10);
      expect(res[0]).assertEqual(100n);
      expect(res[9]).assertEqual(190n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6500
     * @tc.name testBigInt64ArraySlice065
     * @tc.desc Verify slice with negative begin and positive end where begin maps before end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(-4, 3);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6600
     * @tc.name testBigInt64ArraySlice066
     * @tc.desc Verify slice with negative begin and positive end yielding a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(-2, 4);
      expect(res[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6700
     * @tc.name testBigInt64ArraySlice067
     * @tc.desc Verify slice with negative begin mapping to the last element and end at length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(-1, 5);
      expect(res[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6800
     * @tc.name testBigInt64ArraySlice068
     * @tc.desc Verify slice with positive begin and negative end where begin is before the resolved end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let res = arr.slice(1, -2);
      expect(res[0]).assertEqual(20n);
      expect(res[3]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_6900
     * @tc.name testBigInt64ArraySlice069
     * @tc.desc Verify slice with positive begin and negative end adjacent to each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(3, -1);
      expect(res[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7000
     * @tc.name testBigInt64ArraySlice070
     * @tc.desc Verify slice where begin positive and negative end resolves lesser than begin returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(3, -3);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7100
     * @tc.name testBigInt64ArraySlice071
     * @tc.desc Verify slice from an array with repeated identical values preserves values in the slice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n, 7n]);
      let res = arr.slice(1, 4);
      expect(res[0]).assertEqual(7n);
      expect(res[1]).assertEqual(7n);
      expect(res[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7200
     * @tc.name testBigInt64ArraySlice072
     * @tc.desc Verify slice after mutating the source array captures the snapshot at call time.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr[1] = 99n;
      let res = arr.slice();
      expect(res[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7300
     * @tc.name testBigInt64ArraySlice073
     * @tc.desc Verify slice on a two-element array with both BigInt64 boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let res = arr.slice(0, 2);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7400
     * @tc.name testBigInt64ArraySlice074
     * @tc.desc Verify slice with both begin and end arguments exceeding the array length returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice(8, 10);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7500
     * @tc.name testBigInt64ArraySlice075
     * @tc.desc Verify slice(0, 4) returns a full copy of the four-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.slice(0, 4);
      expect(res[0]).assertEqual(10n);
      expect(res[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7600
     * @tc.name testBigInt64ArraySlice076
     * @tc.desc Verify a slice result can be used with values() iterator to enumerate elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.slice(1, 3);
      let iter = res.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7700
     * @tc.name testBigInt64ArraySlice077
     * @tc.desc Verify slice on an array with all negative values extracts the correct subrange.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n, -30n, -40n, -50n]);
      let res = arr.slice(1, 4);
      expect(res[0]).assertEqual(-20n);
      expect(res[1]).assertEqual(-30n);
      expect(res[2]).assertEqual(-40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7800
     * @tc.name testBigInt64ArraySlice078
     * @tc.desc Verify slice on a zero-filled array created by constructor with length argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let res = arr.slice(1, 3);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_7900
     * @tc.name testBigInt64ArraySlice079
     * @tc.desc Verify slice with begin as an integer addition expression.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(1 + 2);
      expect(res[0]).assertEqual(40n);
      expect(res[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_8000
     * @tc.name testBigInt64ArraySlice080
     * @tc.desc Verify slice on an array with alternating positive and negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n, -1n, 1n, -1n]);
      let res = arr.slice(1, 4);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(-1n);
      expect(res[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_8100
     * @tc.name testBigInt64ArraySlice081
     * @tc.desc Verify slice result length equals end minus begin for a valid range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let begin = 2;
      let end = 5;
      let res = arr.slice(begin, end);
      expect(res[0]).assertEqual(30n);
      expect(res[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_8200
     * @tc.name testBigInt64ArraySlice082
     * @tc.desc Verify slice on an array with mixed zero and non-zero values at specific positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 100n, 0n, 200n]);
      let res = arr.slice(1, 3);
      expect(res[0]).assertEqual(100n);
      expect(res[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_ONE_8300
     * @tc.name testBigInt64ArraySlice083
     * @tc.desc Verify slice with begin=-2 end=-4 (abs(end)>abs(begin)) returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.slice(-2, -4);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
