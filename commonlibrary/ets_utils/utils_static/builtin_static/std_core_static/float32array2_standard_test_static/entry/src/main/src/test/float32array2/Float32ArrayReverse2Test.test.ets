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

export default function Float32ArrayReverse2Test(): void {
  describe('Float32ArrayReverse2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0100
     * @tc.name testFloat32ArrayReverseTwo001
     * @tc.desc Verify reverse reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const ret = arr.reverse();
      const element001 = ret.$_get(0);
      expect(element001).assertEqual(3.0);
      const element001Part2 = ret.$_get(2);
      expect(element001Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0200
     * @tc.name testFloat32ArrayReverseTwo002
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Float32Array(0);
      const ret = empty.reverse();
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0300
     * @tc.name testFloat32ArrayReverseTwo003
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Float32Array.of(7.5);
      const ret = single.reverse();
      expect(ret.length).assertEqual(1);
      const element003 = ret.$_get(0);
      expect(element003).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0400
     * @tc.name testFloat32ArrayReverseTwo004
     * @tc.desc Verify reverse() on [1.0,2.0] returns [2.0,1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const ret = arr.reverse();
      expect(ret.$_get(0)).assertEqual(2.0);
      expect(ret.$_get(1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0500
     * @tc.name testFloat32ArrayReverseTwo005
     * @tc.desc Verify reverse() on [3.0,4.0] returns length 2 with index 0 equal 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 4.0);
      const ret = arr.reverse();
      expect(ret.length).assertEqual(2);
      expect(ret.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0600
     * @tc.name testFloat32ArrayReverseTwo006
     * @tc.desc Verify reverse() on [5.0,-3.0] returns -3.0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, -3.0]);
      const ret = arr.reverse();
      expect(ret.$_get(0)).assertEqual(-3.0);
      expect(ret.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REVERSE_TWO_0700
     * @tc.name testFloat32ArrayReverseTwo007
     * @tc.desc Verify reverse() returns the same array reference (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReverseTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

  });
}