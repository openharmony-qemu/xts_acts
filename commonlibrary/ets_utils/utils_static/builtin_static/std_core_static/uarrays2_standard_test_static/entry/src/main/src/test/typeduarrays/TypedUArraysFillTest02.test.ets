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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysFillTest02(): void {
  describe('TypedUArraysFillTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0100
     * @tc.name testTypedUArraysFillTestFileB001
     * @tc.desc Verify end=-5 value=1 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 0, -5);
      const val0 = arr[0] ;
      expect(val0).assertEqual(1);
      const val1 = arr[4] ;
      expect(val1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0200
     * @tc.name testTypedUArraysFillTestFileB002
     * @tc.desc Verify end=-6 value=1 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 0, -6);
      const val2 = arr[0] ;
      expect(val2).assertEqual(1);
      const val3 = arr[4] ;
      expect(val3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0300
     * @tc.name testTypedUArraysFillTestFileB003
     * @tc.desc Verify end=Number.MAX_SAFE_INTEGER value=1 start=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(1, 0, 2147483647);
      const val4 = arr[0] ;
      expect(val4).assertEqual(1);
      const val5 = arr[1] ;
      expect(val5).assertEqual(1);
      const val6 = arr[2] ;
      expect(val6).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0400
     * @tc.name testTypedUArraysFillTestFileB004
     * @tc.desc Verify end=3 value=1 start=1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, 1, 3);
      const val7 = arr[0] ;
      expect(val7).assertEqual(0);
      const val8 = arr[1] ;
      expect(val8).assertEqual(1);
      const val9 = arr[2] ;
      expect(val9).assertEqual(1);
      const val10 = arr[3] ;
      expect(val10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0500
     * @tc.name testTypedUArraysFillTestFileB005
     * @tc.desc Verify end=-1 value=1 start=-2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, -2, -1);
      const val11 = arr[0] ;
      expect(val11).assertEqual(0);
      const val12 = arr[2] ;
      expect(val12).assertEqual(0);
      const val13 = arr[3] ;
      expect(val13).assertEqual(1);
      const val14 = arr[4] ;
      expect(val14).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0600
     * @tc.name testTypedUArraysFillTestFileB006
     * @tc.desc Verify end=3 value=1n start=1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n, 0n]);
      arr.fill(1n, 1, 3);
      const val15 = arr[0];
      expect(val15).assertEqual(0n);
      const val16 = arr[1];
      expect(val16).assertEqual(1n);
      const val17 = arr[2];
      expect(val17).assertEqual(1n);
      const val18 = arr[3];
      expect(val18).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILLTEST02_0700
     * @tc.name testTypedUArraysFillTestFileB007
     * @tc.desc Verify end=-1 value=1n start=-2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n, 0n]);
      arr.fill(1n, -2, -1);
      const val19 = arr[0];
      expect(val19).assertEqual(0n);
      const val20 = arr[2];
      expect(val20).assertEqual(0n);
      const val21 = arr[3];
      expect(val21).assertEqual(1n);
      const val22 = arr[4];
      expect(val22).assertEqual(0n);
    });
  });
}
