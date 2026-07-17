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

export default function uint16ArrayCopyWithin201Test(): void {
  describe('Uint16ArrayCopyWithin201Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0100
     * @tc.name testUint16ArrayCopyWithin201_001
     * @tc.desc Verify copyWithin(-3, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(-3, -1);
      expect(arr.at(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0200
     * @tc.name testUint16ArrayCopyWithin201_002
     * @tc.desc Verify copyWithin returns the array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3]);
      let result: Uint16Array = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0300
     * @tc.name testUint16ArrayCopyWithin201_003
     * @tc.desc Verify copyWithin on empty array is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0400
     * @tc.name testUint16ArrayCopyWithin201_004
     * @tc.desc Verify copyWithin on single-element array is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      arr.copyWithin(0, 0);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0500
     * @tc.name testUint16ArrayCopyWithin201_005
     * @tc.desc Verify copyWithin with target >= length is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.copyWithin(5, 0);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0600
     * @tc.name testUint16ArrayCopyWithin201_006
     * @tc.desc Verify copyWithin with end beyond length is clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 1, 10);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0700
     * @tc.name testUint16ArrayCopyWithin201_007
     * @tc.desc Verify copyWithin with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, -2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
      expect(arr.at(4)).assertEqual(3);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0800
     * @tc.name testUint16ArrayCopyWithin201_008
     * @tc.desc Verify copyWithin with all negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(-4, -6, -2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(2);
      expect(arr.at(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_0900
     * @tc.name testUint16ArrayCopyWithin201_009
     * @tc.desc Verify copyWithin on array with all same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7, 7, 7, 7]);
      arr.copyWithin(1, 0);
      expect(arr.at(0)).assertEqual(7);
      expect(arr.at(1)).assertEqual(7);
      expect(arr.at(2)).assertEqual(7);
      expect(arr.at(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN201_1000
     * @tc.name testUint16ArrayCopyWithin201_010
     * @tc.desc Verify copyWithin combined with subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      let sub: Uint16Array = arr.subarray(1, 5);
      sub.copyWithin(1, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
      expect(arr.at(4)).assertEqual(3);
      expect(arr.at(5)).assertEqual(5);
    });

  });
}
