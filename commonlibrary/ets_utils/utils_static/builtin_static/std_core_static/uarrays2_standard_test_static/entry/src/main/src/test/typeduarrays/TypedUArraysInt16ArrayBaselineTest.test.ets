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

export default function int16ArrayBaselineTest(): void {
  describe('Int16ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0100
     * @tc.name testInt16ArrayBaseline001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(4);
      expect(arr.length).assertEqual(4);
      expect(Int16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0200
     * @tc.name testInt16ArrayBaseline002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([100, -200, 32767, -32768]);
      const val0 = arr[0];
      expect(val0).assertEqual(100);
      const val1 = arr[2];
      expect(val1).assertEqual(32767);
      const val2 = arr[3];
      expect(val2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0300
     * @tc.name testInt16ArrayBaseline003
     * @tc.desc Verify (32768 -32768, 65536 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int16Array([32768])[0]).assertEqual(-32768);
      expect(new Int16Array([65536])[0]).assertEqual(0);
      expect(new Int16Array([-32769])[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0400
     * @tc.name testInt16ArrayBaseline004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);

      const val3 = arr[0];
      expect(val3).assertEqual(0);
      const val4 = arr[1];
      expect(val4).assertEqual(0);
      const val5 = arr[2];
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0500
     * @tc.name testInt16ArrayBaseline005
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0600
     * @tc.name testInt16ArrayBaseline006
     * @tc.desc Verify entries/keys/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      const entry0 = entries[0];
      expect(entry0[0]).assertEqual(0);
      expect(entry0[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0700
     * @tc.name testInt16ArrayBaseline007
     * @tc.desc Verify every/some/filter/map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-100, 0, 100]);
      expect(arr.every((v) => v >= -100)).assertTrue();
      expect(arr.filter((v) => v > 0).length).assertEqual(1);
      const mapped = arr.map((v) => v * 2);
      expect((Array.from(mapped)).join(',')).assertEqual('-200,0,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0800
     * @tc.name testInt16ArrayBaseline008
     * @tc.desc Verify reduce/reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_0900
     * @tc.name testInt16ArrayBaseline009
     * @tc.desc Verify slice/subarray/set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const dst = new Int16Array(3);
      dst.set(src);
      const val7 = dst[0];
      expect(val7).assertEqual(1);
      const val8 = dst[2];
      expect(val8).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1000
     * @tc.name testInt16ArrayBaseline010
     * @tc.desc Verify sort/reverse/fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 1, 2]);
      expect((Array.from(arr.sort())).join(',')).assertEqual('1,2,3');
      arr.fill(-1);
      const val9 = arr[0];
      expect(val9).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1100
     * @tc.name testInt16ArrayBaseline011
     * @tc.desc Verify from/of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int16Array.from([1, 2, 3]).toString()).assertEqual('1,2,3');
      expect(Int16Array.of(32767, -32768, 0).toString()).assertEqual('32767,-32768,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1200
     * @tc.name testInt16ArrayBaseline012
     * @tc.desc Verify ArrayBuffer constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      expect(arr.length).assertEqual(4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1300
     * @tc.name testInt16ArrayBaseline013
     * @tc.desc Verify BYTES_PER_ELEMENT is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1400
     * @tc.name testInt16ArrayBaseline014
     * @tc.desc Verify includes/indexOf/find/findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([100, -200, 300]);
      expect(arr.indexOf(100)).assertEqual(0);
      expect(arr.indexOf(999)).assertEqual(-1);
      expect(arr.includes(-200)).assertTrue();
      expect(arr.find((v) => v > 0)).assertEqual(100);
      expect(arr.findIndex((v) => v < 0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1500
     * @tc.name testInt16ArrayBaseline015
     * @tc.desc Verify toString/valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([100, -200, 300]);
      expect(arr.toString()).assertEqual('100,-200,300');
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1600
     * @tc.name testInt16ArrayBaseline016
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      expect((Array.from(arr)).join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1700
     * @tc.name testInt16ArrayBaseline017
     * @tc.desc Verify toReversed/toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 1, 2]);
      const rev = arr.toReversed();
      expect((Array.from(rev)).join(',')).assertEqual('2,1,3');
      expect((Array.from(arr)).join(',')).assertEqual('3,1,2');
      const sorted = arr.toSorted();
      expect((Array.from(sorted)).join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1800
     * @tc.name testInt16ArrayBaseline018
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_1900
     * @tc.name testInt16ArrayBaseline019
     * @tc.desc Verify slice/subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      expect((Array.from(arr.slice(1, 3))).join(',')).assertEqual('2,3');
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_2000
     * @tc.name testInt16ArrayBaseline020
     * @tc.desc Verify keys/values/iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15]);
      const keys = Array.from(arr.keys());
      expect((keys).join(',')).assertEqual('0,1,2');
      const values = Array.from(arr.values());
      expect((values).join(',')).assertEqual('5,10,15');
      const iter = Array.from(arr);
      expect((iter).join(',')).assertEqual('5,10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_2100
     * @tc.name testInt16ArrayBaseline021
     * @tc.desc Verify set with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([100, 200]);
      const dst = new Int16Array([1, 2, 3, 4]);
      dst.set(src, 2);
      expect((Array.from(dst)).join(',')).assertEqual('1,2,100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_2200
     * @tc.name testInt16ArrayBaseline022
     * @tc.desc Verify byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Int16Array(buf, 4, 4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_2300
     * @tc.name testInt16ArrayBaseline023
     * @tc.desc Verify reduceRight/toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      expect(arr.reduceRight((a, b) => a - b)).assertEqual(0);
      expect(arr.toLocaleString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT16ARRAYBASELINETEST_2400
     * @tc.name testInt16ArrayBaseline024
     * @tc.desc Verify constructor from Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayBaseline024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([100, -200, 300]);
      const arr = new Int16Array(src);
      expect((Array.from(arr)).join(',')).assertEqual('100,-200,300');
    });

  });
}
