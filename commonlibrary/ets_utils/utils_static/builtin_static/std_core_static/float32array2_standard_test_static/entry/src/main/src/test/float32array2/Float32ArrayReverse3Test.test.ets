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

export default function Float32ArrayReverse3Test(): void {
  describe('Float32ArrayReverse3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0100
     * @tc.name testFloat32ArrayReverseThree001
     * @tc.desc Verify reverse() return value is the same reference as the original array (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
      expect(ret.$_get(0)).assertEqual(5.0);
      expect(ret.$_get(4)).assertEqual(1.0);
      expect(ret.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0200
     * @tc.name testFloat32ArrayReverseThree002
     * @tc.desc Verify reverse() on empty array returns the same reference (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0300
     * @tc.name testFloat32ArrayReverseThree003
     * @tc.desc Verify reverse() on single element array returns the same reference (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.5);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
      expect(ret.$_get(0)).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0400
     * @tc.name testFloat32ArrayReverseThree004
     * @tc.desc Verify reverse() return is in-place: writing through ret mutates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const ret = arr.reverse();
      ret.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99.0);
      expect(ret.$_get(0)).assertEqual(99.0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0500
     * @tc.name testFloat32ArrayReverseThree005
     * @tc.desc Verify reverse().reverse() chained in-place keeps the same reference and restores order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const ret = arr.reverse().reverse();
      expect(ret).assertEqual(arr);
      expect(ret.$_get(0)).assertEqual(1.0);
      expect(ret.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_THREE_0600
     * @tc.name testFloat32ArrayReverseThree006
     * @tc.desc Verify reverse() preserves -0 sign bit through in-place reverse (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -0.0);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
      const inv = 1.0 / ret.$_get(0);
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

  });
}
