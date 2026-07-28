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

export default function Float32ArraySubarray4Test(): void {
  describe('Float32ArraySubarray4Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0100
     * @tc.name testFloat32ArraySubarrayFour001
     * @tc.desc Verify NaN written through subarray view is visible in parent as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, Number.NaN);
      expect(parent.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0200
     * @tc.name testFloat32ArraySubarrayFour002
     * @tc.desc Verify -0 written through subarray view keeps sign in parent (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, -0.0);
      const inv = 1.0 / parent.$_get(1);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0300
     * @tc.name testFloat32ArraySubarrayFour003
     * @tc.desc Verify Infinity written through subarray view is visible in parent as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, Number.POSITIVE_INFINITY);
      expect(parent.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0400
     * @tc.name testFloat32ArraySubarrayFour004
     * @tc.desc Verify -Infinity written through subarray view keeps sign in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(2);
      view.$_set(0, -Number.POSITIVE_INFINITY);
      expect(parent.$_get(2)).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0500
     * @tc.name testFloat32ArraySubarrayFour005
     * @tc.desc Verify MAX_VALUE written through subarray view is preserved in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, 3.4028234663852886e+38);
      expect(parent.$_get(1)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0600
     * @tc.name testFloat32ArraySubarrayFour006
     * @tc.desc Verify -0 written in parent is visible through subarray view (reverse direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view = parent.subarray(1, 4);
      parent.$_set(2, -0.0);
      const inv = 1.0 / view.$_get(1);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0700
     * @tc.name testFloat32ArraySubarrayFour007
     * @tc.desc Verify NaN written in parent is visible through subarray view (reverse direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view = parent.subarray(1, 4);
      parent.$_set(1, Number.NaN);
      expect(view.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0800
     * @tc.name testFloat32ArraySubarrayFour008
     * @tc.desc Verify float32 rounding applied when writing 16777217 through subarray view (parent reads 16777216)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, 16777217);
      expect(parent.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_0900
     * @tc.name testFloat32ArraySubarrayFour009
     * @tc.desc Verify overflow value 1.0e40 written through subarray view becomes Infinity in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1);
      view.$_set(0, 1.0e40);
      expect(parent.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_1000
     * @tc.name testFloat32ArraySubarrayFour010
     * @tc.desc Verify set(Float32Array.of(NaN,Infinity)) on subarray writes through to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(1, 3);
      view.set(Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY));
      expect(parent.$_get(1)).assertNaN();
      expect(parent.$_get(2)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_1100
     * @tc.name testFloat32ArraySubarrayFour011
     * @tc.desc Verify set(Float32Array.of(-0.0), 0) on subarray preserves -0 sign through parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0]);
      const view = parent.subarray(1, 2);
      view.set(Float32Array.of(-0.0), 0);
      const inv = 1.0 / parent.$_get(1);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_FOUR_1200
     * @tc.name testFloat32ArraySubarrayFour012
     * @tc.desc Verify set(Float32Array, offset) on subarray writes through to parent at correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view = parent.subarray(1, 4);
      view.set(Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY), 1);
      expect(parent.$_get(1)).assertEqual(2.0);
      expect(parent.$_get(2)).assertNaN();
      expect(parent.$_get(3)).assertEqual(Number.POSITIVE_INFINITY);
    });

  });
}
