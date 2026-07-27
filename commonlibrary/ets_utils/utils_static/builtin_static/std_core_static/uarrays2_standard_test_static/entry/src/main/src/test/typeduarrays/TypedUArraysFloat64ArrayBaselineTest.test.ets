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

export default function float64ArrayBaselineTest(): void {
  describe('Float64ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0100
     * @tc.name testFloat64ArrayBaseline001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(4);
      expect(arr.length).assertEqual(4);
      expect(Float64Array.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0200
     * @tc.name testFloat64ArrayBaseline002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.5, -2.5, Math.PI, Math.E]);
      const val0 = arr[0];
      expect(val0).assertEqual(1.5);
      const val1 = arr[2];
      expect(val1).assertEqual(Math.PI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0300
     * @tc.name testFloat64ArrayBaseline003
     * @tc.desc Verify NaN/Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      const val2 = arr[0];
      expect(val2).assertNaN();
      const val3 = arr[1];
      expect(val3).assertEqual(Number.POSITIVE_INFINITY);
      const val4 = arr[2];
      expect(val4).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0400
     * @tc.name testFloat64ArrayBaseline004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Number.MAX_VALUE, Number.MIN_VALUE]);
      const val5 = arr[0];
      expect(val5).assertEqual(Number.MAX_VALUE);
      const val6 = arr[1];
      expect(val6).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0500
     * @tc.name testFloat64ArrayBaseline005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);

      const val7 = arr[0];
      expect(val7).assertEqual(0);
      const val8 = arr[1];
      expect(val8).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0600
     * @tc.name testFloat64ArrayBaseline006
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.1, 2.2, 3.3]);
      expect(arr[0]).assertEqual(1.1);
      expect(arr[2]).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0700
     * @tc.name testFloat64ArrayBaseline007
     * @tc.desc Verify entries/keys/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0]);
      expect(Array.from(arr.keys())).assertDeepEquals([0, 1]);
      expect(Array.from(arr.values())).assertDeepEquals([1.0, 2.0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0800
     * @tc.name testFloat64ArrayBaseline008
     * @tc.desc Verify every/some/filter/map/reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      expect(arr.every((v) => v > 0)).assertTrue();
      expect(Array.from(arr.filter((v) => v > 2))).assertDeepEquals([3.0, 4.0]);
      expect(Array.from(arr.map((v) => v * v))).assertDeepEquals([1.0, 4.0, 9.0, 16.0]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_0900
     * @tc.name testFloat64ArrayBaseline009
     * @tc.desc Verify sort/reverse/fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      expect(Array.from(arr.sort())).assertDeepEquals([1.0, 2.0, 3.0]);
      arr.fill(0);
      const val9 = arr[0];
      expect(val9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_1000
     * @tc.name testFloat64ArrayBaseline010
     * @tc.desc Verify slice/subarray/copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      expect(Array.from(arr.slice(0, 2))).assertDeepEquals([1.0, 2.0]);
      expect(Array.from(arr.subarray(2, 4))).assertDeepEquals([3.0, 4.0]);
      arr.copyWithin(0, 2);
      const val10 = arr[0];
      expect(val10).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_1100
     * @tc.name testFloat64ArrayBaseline011
     * @tc.desc Verify from/of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float64Array.from([1.5, 2.5]).toString()).assertEqual('1.5,2.5');
      expect(Float64Array.of(Math.PI, Math.E).toString()).assertEqual(String(Math.PI) + ',' + String(Math.E));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_1200
     * @tc.name testFloat64ArrayBaseline012
     * @tc.desc Verify indexOf/includes/find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.indexOf(2.0)).assertEqual(1);
      expect(arr.includes(1.0)).assertTrue();
      expect(arr.find((v) => v > 2.0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_Baseline_1300
     * @tc.name testFloat64ArrayBaseline013
     * @tc.desc Verify toString/valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.5, 2.5]);
      expect(arr.toString()).assertEqual('1.5,2.5');
      expect(arr.valueOf()).assertEqual(arr);
    });

  });
}
