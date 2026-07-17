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

export default function uint16ArrayCopyWithin102Test(): void {
  describe('Uint16ArrayCopyWithin102Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0100
     * @tc.name testUint16ArrayCopyWithin102_001
     * @tc.desc Verify copyWithin(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(4);
      expect(arr.at(2)).assertEqual(5);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0200
     * @tc.name testUint16ArrayCopyWithin102_002
     * @tc.desc Verify copyWithin(target) copies whole array to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(2);
      expect(arr.at(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0300
     * @tc.name testUint16ArrayCopyWithin102_003
     * @tc.desc Verify copyWithin(target, start, end) with all params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(1)).assertEqual(4);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0400
     * @tc.name testUint16ArrayCopyWithin102_004
     * @tc.desc Verify copyWithin with negative target and start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(-2, -4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(2);
      expect(arr.at(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0500
     * @tc.name testUint16ArrayCopyWithin102_005
     * @tc.desc Verify copyWithin is no-op when start >= length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 6);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0600
     * @tc.name testUint16ArrayCopyWithin102_006
     * @tc.desc Verify copyWithin is no-op when end < start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 4, 2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0700
     * @tc.name testUint16ArrayCopyWithin102_007
     * @tc.desc Verify copyWithin when target > source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(4, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(2);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(0);
      expect(arr.at(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0800
     * @tc.name testUint16ArrayCopyWithin102_008
     * @tc.desc Verify copyWithin when target < source with overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr.at(0)).assertEqual(2);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(4);
      expect(arr.at(3)).assertEqual(5);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_0900
     * @tc.name testUint16ArrayCopyWithin102_009
     * @tc.desc Verify copyWithin with negative target and start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(-4, -6, -2);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(10);
      expect(arr.at(3)).assertEqual(20);
      expect(arr.at(4)).assertEqual(30);
      expect(arr.at(5)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_COPY_WITHIN102_1000
     * @tc.name testUint16ArrayCopyWithin102_010
     * @tc.desc Verify copyWithin returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayCopyWithin102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4]);
      let result: Uint16Array = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

  });
}
