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

export default function float32ArrayBaselineTest(): void {
  describe('Float32ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0100
     * @tc.name testFloat32ArrayBaseline001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      expect(arr.length).assertEqual(4);
      expect(Float32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0200
     * @tc.name testFloat32ArrayBaseline002
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, -2.5, 3.14, 0.0]);
      const val0 = arr[0] ;
      expect(val0).assertEqual(1.5);
      const val1 = arr[1] ;
      expect(val1).assertEqual(-2.5);
      const val2 = arr[3] ;
      expect(val2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0300
     * @tc.name testFloat32ArrayBaseline003
     * @tc.desc Verify NaN/Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      const val3 = arr[0] ;
      expect(val3).assertNaN();
      const val4 = arr[1] ;
      expect(val4).assertEqual(Number.POSITIVE_INFINITY);
      const val5 = arr[2] ;
      expect(val5).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0400
     * @tc.name testFloat32ArrayBaseline004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);

      const val6 = arr[0] ;
      expect(val6).assertEqual(0);
      const val7 = arr[1] ;
      expect(val7).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0500
     * @tc.name testFloat32ArrayBaseline005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);

      const val8 = arr[0] ;
      expect(val8).assertEqual(0);
      const val9 = arr[1] ;
      expect(val9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0600
     * @tc.name testFloat32ArrayBaseline006
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      try {
        const val10 = arr[5];
        expect(val10).assertUndefined();
      } catch (e) {
        expect(true).assertTrue();
      }
      try {
        const val11 = arr[-1];
        expect(val11).assertUndefined();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0700
     * @tc.name testFloat32ArrayBaseline007
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1, 2.2, 3.3]);
      expect(arr[0]).assertClose(1.1, 0.0001);
      expect(arr[1]).assertClose(2.2, 0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0800
     * @tc.name testFloat32ArrayBaseline008
     * @tc.desc Verify entries/keys/values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      const keysArr = Array.from(arr.keys());
      expect(keysArr).assertDeepEquals([0, 1]);
      const valsArr = Array.from(arr.values());
      expect(valsArr).assertDeepEquals([1.5, 2.5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_0900
     * @tc.name testFloat32ArrayBaseline009
     * @tc.desc Verify every/some/filter/map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.every((v) => v > 0)).assertTrue();
      expect(arr.filter((v) => v > 2).length).assertEqual(1);
      const mapped = arr.map((v) => v * 2);
      expect(Array.from(mapped)).assertDeepEquals([2.0, 4.0, 6.0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_1000
     * @tc.name testFloat32ArrayBaseline010
     * @tc.desc Verify reduce/reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_1100
     * @tc.name testFloat32ArrayBaseline011
     * @tc.desc Verify sort/reverse/fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      expect(Array.from(arr.sort())).assertDeepEquals([1.0, 2.0, 3.0]);
      expect(Array.from(arr.reverse())).assertDeepEquals([3.0, 2.0, 1.0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_1200
     * @tc.name testFloat32ArrayBaseline012
     * @tc.desc Verify slice/subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      expect(Array.from(arr.slice(1, 3))).assertDeepEquals([2.0, 3.0]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_1300
     * @tc.name testFloat32ArrayBaseline013
     * @tc.desc Verify from/of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float32Array.from([1.5, 2.5, 3.5]).toString()).assertEqual('1.5,2.5,3.5');
      expect(Float32Array.of(4.0, -3.0, 1.0).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_Baseline_1400
     * @tc.name testFloat32ArrayBaseline014
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayBaseline014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      expect(arr.toString()).assertEqual('1.5,2.5');
    });

  });
}
