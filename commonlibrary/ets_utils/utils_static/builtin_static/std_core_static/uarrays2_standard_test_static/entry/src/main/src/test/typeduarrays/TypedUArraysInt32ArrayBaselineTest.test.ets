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

export default function int32ArrayBaselineTest(): void {
  describe('Int32ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0100
     * @tc.name testInt32ArrayBaseline001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array(4);
      expect(arr.length).assertEqual(4);
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0200
     * @tc.name testInt32ArrayBaseline002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([100000, -200000, 2147483647, -2147483648]);
      const val0 = arr[0];
      expect(val0).assertEqual(100000);
      const val1 = arr[2];
      expect(val1).assertEqual(2147483647);
      const val2 = arr[3];
      expect(val2).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0300
     * @tc.name testInt32ArrayBaseline003
     * @tc.desc Verify (2147483648 -2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int32Array([2147483648])[0]).assertEqual(-2147483648);
      expect(new Int32Array([4294967296])[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0400
     * @tc.name testInt32ArrayBaseline004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array(3);

      const val3 = arr[0];
      expect(val3).assertEqual(0);
      const val4 = arr[1];
      expect(val4).assertEqual(0);
      const val5 = arr[2];
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0500
     * @tc.name testInt32ArrayBaseline005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([100, 200, 300]);
      expect(arr.indexOf(200)).assertEqual(1);
      expect(arr.includes(100)).assertTrue();
      expect(arr.find((v) => v > 150)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0600
     * @tc.name testInt32ArrayBaseline006
     * @tc.desc Verify map/reduce/filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([1, 2, 3, 4]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(10);
      const mapped = arr.map((v) => v >= 0 ? v * 10 : v * 10);
      expect((Array.from(mapped)).join(',')).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0700
     * @tc.name testInt32ArrayBaseline007
     * @tc.desc Verify from/of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.from([1, 2, 3]).toString()).assertEqual('1,2,3');
      expect(Int32Array.of(2147483647, -2147483648).toString()).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0800
     * @tc.name testInt32ArrayBaseline008
     * @tc.desc Verify ArrayBuffer constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Int32Array(buf);
      expect(arr.length).assertEqual(4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_0900
     * @tc.name testInt32ArrayBaseline009
     * @tc.desc Verify BYTES_PER_ELEMENT is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1000
     * @tc.name testInt32ArrayBaseline010
     * @tc.desc Verify entries/keys/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([10, 20, 30]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual(10);
      const keys = Array.from(arr.keys());
      expect((keys).join(',')).assertEqual('0,1,2');
      const values = Array.from(arr.values());
      expect((values).join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1100
     * @tc.name testInt32ArrayBaseline011
     * @tc.desc Verify every/some/filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([-1000, 0, 1000]);
      expect(arr.every((v) => v >= -1000)).assertTrue();
      expect(arr.some((v) => v < 0)).assertTrue();
      expect(arr.filter((v) => v > 0).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1200
     * @tc.name testInt32ArrayBaseline012
     * @tc.desc Verify slice/subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([1, 2, 3, 4]);
      expect((Array.from(arr.slice(1, 3))).join(',')).assertEqual('2,3');
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1300
     * @tc.name testInt32ArrayBaseline013
     * @tc.desc Verify sort/reverse/fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([3, 1, 2]);
      expect((Array.from(arr.sort())).join(',')).assertEqual('1,2,3');
      expect((Array.from(arr.reverse())).join(',')).assertEqual('3,2,1');
      arr.fill(-1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1400
     * @tc.name testInt32ArrayBaseline014
     * @tc.desc Verify copyWithin/set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int32Array([1, 2, 3, 4]);
      arr1.copyWithin(0, 2);
      expect((Array.from(arr1)).join(',')).assertEqual('3,4,3,4');
      const src = new Int32Array([100, 200]);
      const dst = new Int32Array([1, 2, 3, 4]);
      dst.set(src, 2);
      expect((Array.from(dst)).join(',')).assertEqual('1,2,100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1500
     * @tc.name testInt32ArrayBaseline015
     * @tc.desc Verify toString/valueOf/join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([100, -200, 300]);
      expect(arr.toString()).assertEqual('100,-200,300');
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.join('-')).assertEqual('100--200-300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1600
     * @tc.name testInt32ArrayBaseline016
     * @tc.desc Verify toReversed/toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([3, 1, 2]);
      const rev = arr.toReversed();
      expect((Array.from(rev)).join(',')).assertEqual('2,1,3');
      expect((Array.from(arr)).join(',')).assertEqual('3,1,2');
      const sorted = arr.toSorted();
      expect((Array.from(sorted)).join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1700
     * @tc.name testInt32ArrayBaseline017
     * @tc.desc Verify reduceRight/toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([1, 2, 3]);
      expect(arr.reduceRight((a, b) => a - b)).assertEqual(0);
      expect(arr.toLocaleString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1800
     * @tc.name testInt32ArrayBaseline018
     * @tc.desc Verify Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int32Array([5, 10, 15]);
      const iter = Array.from(arr);
      expect((iter).join(',')).assertEqual('5,10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_1900
     * @tc.name testInt32ArrayBaseline019
     * @tc.desc Verify byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Int32Array(buf, 4, 2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INT32ARRAYBASELINETEST_2000
     * @tc.name testInt32ArrayBaseline020
     * @tc.desc Verify constructor from Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt32ArrayBaseline020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array([100, -200, 300]);
      const arr = new Int32Array(src);
      expect((Array.from(arr)).join(',')).assertEqual('100,-200,300');
    });

  });
}
