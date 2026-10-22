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

export default function int8ArrayOverviewPart07Test(): void {
  describe('Int8ArrayOverviewPart07Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0100
     * @tc.name int8ArrayOverviewPart07Test001
     * @tc.desc Verify slice returns a copy backed by a different buffer so writing the copy never reaches the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([1, 2, 3, 4]);
      const copy: Int8Array = source.slice(1, 3);
      expect(copy.length).assertEqual(2);
      expect(copy.$_get(0)).assertEqual(2);
      const distinctBuffer: boolean = copy.buffer !== source.buffer;
      expect(distinctBuffer).assertTrue();
      copy.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(99);
      expect(source.$_get(1)).assertEqual(2);
      expect(source.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0200
     * @tc.name int8ArrayOverviewPart07Test002
     * @tc.desc Verify subarray returns a view over the same buffer, so writes in either direction are visible to the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([1, 2, 3, 4]);
      const view: Int8Array = source.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(view.byteOffset).assertEqual(1);
      const sameBuffer: boolean = view.buffer === source.buffer;
      expect(sameBuffer).assertTrue();
      source.$_set(1, 99);
      expect(view.$_get(0)).assertEqual(99);
      view.$_set(1, -5);
      expect(source.$_get(2)).assertEqual(-5);
      expect(source.$_get(0)).assertEqual(1);
      expect(source.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0300
     * @tc.name int8ArrayOverviewPart07Test003
     * @tc.desc Verify slice and subarray over the same range agree on their values but differ on buffer sharing and on whether writes escape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([10, 20, 30, 40]);
      const copy: Int8Array = source.slice(1, 3);
      const view: Int8Array = source.subarray(1, 3);
      expect(copy.length).assertEqual(view.length);
      expect(copy.$_get(0)).assertEqual(view.$_get(0));
      expect(copy.$_get(1)).assertEqual(view.$_get(1));
      const copyDistinct: boolean = copy.buffer !== source.buffer;
      const viewShared: boolean = view.buffer === source.buffer;
      expect(copyDistinct).assertTrue();
      expect(viewShared).assertTrue();
      copy.$_set(0, -1);
      view.$_set(0, -2);
      expect(source.$_get(1)).assertEqual(-2);
      expect(copy.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0400
     * @tc.name int8ArrayOverviewPart07Test004
     * @tc.desc Verify the in-place writers fill, copyWithin, reverse and sort all return the very same array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([3, 1, 2]);
      const fillSame: boolean = arr.fill(0) === arr;
      expect(fillSame).assertTrue();
      const copyWithinSame: boolean = arr.copyWithin(0, 0) === arr;
      expect(copyWithinSame).assertTrue();
      const reverseSame: boolean = arr.reverse() === arr;
      expect(reverseSame).assertTrue();
      const sortSame: boolean = arr.sort() === arr;
      expect(sortSame).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0500
     * @tc.name int8ArrayOverviewPart07Test005
     * @tc.desc Verify with, toReversed, toSorted, map, filter, slice and from each return a new buffer and leave the source untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Int8Array = new Int8Array([3, 1, 2]);
      const replaced: Int8Array = source.with(0, 9);
      const reversed: Int8Array = source.toReversed();
      const sorted: Int8Array = source.toSorted();
      const mapped: Int8Array = source.map((value: number): number => value * 2);
      const filtered: Int8Array = source.filter((value: number): boolean => value > 1);
      const copied: Int8Array = source.slice();
      const fromSource: Int8Array = Int8Array.from(source);
      const replacedDistinct: boolean = replaced.buffer !== source.buffer;
      const reversedDistinct: boolean = reversed.buffer !== source.buffer;
      const sortedDistinct: boolean = sorted.buffer !== source.buffer;
      const mappedDistinct: boolean = mapped.buffer !== source.buffer;
      const filteredDistinct: boolean = filtered.buffer !== source.buffer;
      const copiedDistinct: boolean = copied.buffer !== source.buffer;
      const fromDistinct: boolean = fromSource.buffer !== source.buffer;
      expect(replacedDistinct).assertTrue();
      expect(reversedDistinct).assertTrue();
      expect(sortedDistinct).assertTrue();
      expect(mappedDistinct).assertTrue();
      expect(filteredDistinct).assertTrue();
      expect(copiedDistinct).assertTrue();
      expect(fromDistinct).assertTrue();
      expect(source.$_get(0)).assertEqual(3);
      expect(source.$_get(1)).assertEqual(1);
      expect(source.$_get(2)).assertEqual(2);
      expect(sorted.$_get(0)).assertEqual(1);
      expect(reversed.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART07_TEST_0600
     * @tc.name int8ArrayOverviewPart07Test006
     * @tc.desc Verify empty, single-element and all-equal arrays behave consistently across reads, lookups and writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart07Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      expect(empty.length).assertEqual(0);
      expect(empty.join()).assertEqual('');
      expect(empty.indexOf(0)).assertEqual(-1);
      expect(empty.includes(0)).assertFalse();
      expect(empty.at(0)).assertUndefined();
      const single: Int8Array = new Int8Array([42]);
      expect(single.length).assertEqual(1);
      expect(single.$_get(0)).assertEqual(42);
      expect(single.at(-1)).assertEqual(42);
      expect(single.reverse().$_get(0)).assertEqual(42);
      expect(single.sort().$_get(0)).assertEqual(42);
      const repeated: Int8Array = new Int8Array([7, 7, 7, 7]);
      expect(repeated.indexOf(7)).assertEqual(0);
      expect(repeated.lastIndexOf(7)).assertEqual(3);
      expect(repeated.length).assertEqual(4);
    });
  });
}
