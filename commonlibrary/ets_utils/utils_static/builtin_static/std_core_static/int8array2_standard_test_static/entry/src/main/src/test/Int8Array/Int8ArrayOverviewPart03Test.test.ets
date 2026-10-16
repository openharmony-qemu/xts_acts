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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayOverviewPart03Test(): void {
  describe('Int8ArrayOverviewPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0100
     * @tc.name int8ArrayOverviewPart03Test001
     * @tc.desc Verify indexOf returns the first matching index and negative one when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10)).assertEqual(0);
      expect(arr.indexOf(30)).assertEqual(2);
      expect(arr.indexOf(99)).assertEqual(-1);
      const repeated: Int8Array = new Int8Array([7, 7, 7, 7]);
      expect(repeated.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0200
     * @tc.name int8ArrayOverviewPart03Test002
     * @tc.desc Verify indexOf honors fromIndex, skipping earlier occurrences and returning negative one once fromIndex passes the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 2]);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(2, 2)).assertEqual(3);
      expect(arr.indexOf(2, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0300
     * @tc.name int8ArrayOverviewPart03Test003
     * @tc.desc Verify includes reports presence, honors fromIndex including negative values, and returns false for absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 2]);
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(2, 2)).assertTrue();
      expect(arr.includes(2, -2)).assertTrue();
      expect(arr.includes(99)).assertFalse();
      expect(arr.includes(1, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0400
     * @tc.name int8ArrayOverviewPart03Test004
     * @tc.desc Verify both lookup methods report a miss on an empty array without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      expect(empty.indexOf(0)).assertEqual(-1);
      expect(empty.indexOf(127)).assertEqual(-1);
      expect(empty.includes(0)).assertFalse();
      expect(empty.includes(-128)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0500
     * @tc.name int8ArrayOverviewPart03Test005
     * @tc.desc Verify at resolves zero, positive and negative indexes to the same elements that bracket indexing yields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(-1)).assertEqual(30);
      expect(arr.at(-3)).assertEqual(10);
      const single: Int8Array = new Int8Array([42]);
      expect(single.at(0)).assertEqual(42);
      expect(single.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0600
     * @tc.name int8ArrayOverviewPart03Test006
     * @tc.desc Verify at returns undefined for indexes past the end, below the start, and far outside the array on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.at(3)).assertUndefined();
      expect(arr.at(-4)).assertUndefined();
      expect(arr.at(2147483647)).assertUndefined();
      expect(arr.at(-2147483648)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0700
     * @tc.name int8ArrayOverviewPart03Test007
     * @tc.desc Verify NaN can never be found because every Int8Array element is stored as an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
      expect(arr.includes(Number.NaN)).assertFalse();
      const stored: Int8Array = new Int8Array([Number.NaN]);
      expect(stored.$_get(0)).assertEqual(0);
      expect(stored.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART03_TEST_0800
     * @tc.name int8ArrayOverviewPart03Test008
     * @tc.desc Verify lookups leave length, byteOffset and every element of the source array untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      const offsetBefore: int = arr.byteOffset;
      arr.indexOf(20);
      arr.includes(30);
      arr.at(1);
      arr.at(9);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(offsetBefore);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });
  });
}
