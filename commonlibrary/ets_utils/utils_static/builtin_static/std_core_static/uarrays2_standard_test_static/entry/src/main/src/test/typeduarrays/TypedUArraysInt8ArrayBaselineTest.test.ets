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

export default function int8ArrayBaselineTest(): void {
  describe('Int8ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0100
     * @tc.name testInt8ArrayBaseline001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      expect(arr.length).assertEqual(4);
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0200
     * @tc.name testInt8ArrayBaseline002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, -2, 127, -128]);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
      const val1 = arr[1];
      expect(val1).assertEqual(-2);
      const val2 = arr[2];
      expect(val2).assertEqual(127);
      const val3 = arr[3];
      expect(val3).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0300
     * @tc.name testInt8ArrayBaseline003
     * @tc.desc Verify (129 -127, 256 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int8Array([129])[0]).assertEqual(-127);
      expect(new Int8Array([256])[0]).assertEqual(0);
      expect(new Int8Array([-129])[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0400
     * @tc.name testInt8ArrayBaseline004
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int8Array(buf);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0500
     * @tc.name testInt8ArrayBaseline005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, -20, 30]);
      const val4 = arr[0];
      expect(val4).assertEqual(10);
      const val5 = arr[1];
      expect(val5).assertEqual(-20);
      const val6 = arr[2];
      expect(val6).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0600
     * @tc.name testInt8ArrayBaseline006
     * @tc.desc Verify out-of-range access throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      try {
        const val7 = arr[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        const val8 = arr[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0700
     * @tc.name testInt8ArrayBaseline007
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);

      const val9 = arr[0];
      expect(val9).assertEqual(0);
      const val10 = arr[1];
      expect(val10).assertEqual(0);
      const val11 = arr[2];
      expect(val11).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0800
     * @tc.name testInt8ArrayBaseline008
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_0900
     * @tc.name testInt8ArrayBaseline009
     * @tc.desc Verify entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, -2, 3]);
      const entries = Array.from(arr.entries());
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual(1);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1000
     * @tc.name testInt8ArrayBaseline010
     * @tc.desc Verify every/some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      expect(arr.every((v) => v > 0)).assertTrue();
      expect(arr.some((v) => v < 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1100
     * @tc.name testInt8ArrayBaseline011
     * @tc.desc Verify filter/map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([-1, 0, 1]);
      expect(arr.filter((v) => v > 0).length).assertEqual(1);
      const mapped = arr.map((v) => v >= 0 ? v * 2 : v * 2);
      expect((Array.from(mapped)).join(',')).assertEqual('-2,0,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1200
     * @tc.name testInt8ArrayBaseline012
     * @tc.desc Verify reduce/join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(6);
      expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1300
     * @tc.name testInt8ArrayBaseline013
     * @tc.desc Verify slice/subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3, 4]);
      expect((Array.from(arr.slice(1, 3))).join(',')).assertEqual('2,3');
      const sub = arr.subarray(1, 3);
      const val12 = sub[0];
      expect(val12).assertEqual(2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1400
     * @tc.name testInt8ArrayBaseline014
     * @tc.desc Verify sort/reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      expect((Array.from(arr.sort())).join(',')).assertEqual('1,2,3');
      expect((Array.from(arr.reverse())).join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1500
     * @tc.name testInt8ArrayBaseline015
     * @tc.desc Verify fill/copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int8Array(4);
      arr1.fill(-1);
      const val13 = arr1[0];
      expect(val13).assertEqual(-1);
      const val14 = arr1[3];
      expect(val14).assertEqual(-1);
      const arr2 = new Int8Array([1, 2, 3, 4]);
      arr2.copyWithin(0, 2);
      const val15 = arr2[0];
      expect(val15).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1600
     * @tc.name testInt8ArrayBaseline016
     * @tc.desc Verify toString/valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, -2, 3]);
      expect(arr.toString()).assertEqual('1,-2,3');
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1700
     * @tc.name testInt8ArrayBaseline017
     * @tc.desc Verify from/of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int8Array.from([1, 2, 3]).toString()).assertEqual('1,2,3');
      expect(Int8Array.of(10, -20, 30).toString()).assertEqual('10,-20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1800
     * @tc.name testInt8ArrayBaseline018
     * @tc.desc Verify indexOf/includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, -20, 30]);
      expect(arr.indexOf(10)).assertEqual(0);
      expect(arr.indexOf(99)).assertEqual(-1);
      expect(arr.includes(-20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_1900
     * @tc.name testInt8ArrayBaseline019
     * @tc.desc Verify find/findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, -2, 3]);
      expect(arr.find((v) => v < 0)).assertEqual(-2);
      expect(arr.findIndex((v) => v === 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2000
     * @tc.name testInt8ArrayBaseline020
     * @tc.desc Verify keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([10, -20, 30]);
      const keys = Array.from(arr.keys());
      expect((keys).join(',')).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2100
     * @tc.name testInt8ArrayBaseline021
     * @tc.desc Verify values and Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([5, -10, 15]);
      const values = Array.from(arr.values());
      expect((values).join(',')).assertEqual('5,-10,15');
      const iter = Array.from(arr);
      expect((iter).join(',')).assertEqual('5,-10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2200
     * @tc.name testInt8ArrayBaseline022
     * @tc.desc Verify BYTES_PER_ELEMENT is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2300
     * @tc.name testInt8ArrayBaseline023
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const rev = arr.toReversed();
      expect((Array.from(rev)).join(',')).assertEqual('3,2,1');
      expect((Array.from(arr)).join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2400
     * @tc.name testInt8ArrayBaseline024
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect((Array.from(sorted)).join(',')).assertEqual('1,2,3');
      expect((Array.from(arr)).join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2500
     * @tc.name testInt8ArrayBaseline025
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      expect(arr.reduceRight((a, b) => a - b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2600
     * @tc.name testInt8ArrayBaseline026
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, -2, 3]);
      expect(arr.toLocaleString()).assertEqual('1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2700
     * @tc.name testInt8ArrayBaseline027
     * @tc.desc Verify constructor from Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int8Array([10, -20, 30]);
      const arr = new Int8Array(src);
      expect((Array.from(arr)).join(',')).assertEqual('10,-20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2800
     * @tc.name testInt8ArrayBaseline028
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int8Array([1, 2, 3]);
      const dst = new Int8Array(3);
      dst.set(src);
      const val16 = dst[0];
      expect(val16).assertEqual(1);
      const val17 = dst[2];
      expect(val17).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_2900
     * @tc.name testInt8ArrayBaseline029
     * @tc.desc Verify set with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int8Array([10, 20]);
      const dst = new Int8Array([1, 2, 3, 4]);
      dst.set(src, 2);
      expect((Array.from(dst)).join(',')).assertEqual('1,2,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_Baseline_3000
     * @tc.name testInt8ArrayBaseline030
     * @tc.desc Verify byteOffset and buffer properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt8ArrayBaseline030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Int8Array(buf, 4, 8);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(8);
    });

  });
}
