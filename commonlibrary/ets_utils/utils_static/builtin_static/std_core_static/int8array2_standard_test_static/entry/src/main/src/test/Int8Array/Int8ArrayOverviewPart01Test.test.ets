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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArrayOverviewPart01Test(): void {
  describe('Int8ArrayOverviewPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0100
     * @tc.name int8ArrayOverviewPart01Test001
     * @tc.desc Verify no-argument, zero-length and single-length constructors produce zero-filled arrays of the requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const noArg: Int8Array = new Int8Array();
      expect(noArg.length).assertEqual(0);
      const zero: Int8Array = new Int8Array(0);
      expect(zero.length).assertEqual(0);
      const single: Int8Array = new Int8Array(1);
      expect(single.length).assertEqual(1);
      expect(single.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0200
     * @tc.name int8ArrayOverviewPart01Test002
     * @tc.desc Verify a numeric argument sizes a zero-filled array while a one-element array literal yields one element, so (3) and ([3]) differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sized: Int8Array = new Int8Array(3);
      expect(sized.length).assertEqual(3);
      expect(sized.$_get(0)).assertEqual(0);
      expect(sized.$_get(1)).assertEqual(0);
      expect(sized.$_get(2)).assertEqual(0);
      const fromLiteral: Int8Array = new Int8Array([3]);
      expect(fromLiteral.length).assertEqual(1);
      expect(fromLiteral.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0300
     * @tc.name int8ArrayOverviewPart01Test003
     * @tc.desc Verify array sources copy every element and an empty source yields an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySrc: Array<int> = [];
      const empty: Int8Array = new Int8Array(emptySrc);
      expect(empty.length).assertEqual(0);
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0400
     * @tc.name int8ArrayOverviewPart01Test004
     * @tc.desc Verify constructing from another Int8Array copies the values into an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.length).assertEqual(3);
      copy.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(99);
      expect(src.$_get(0)).assertEqual(1);
      const distinctBuffer: boolean = copy.buffer !== src.buffer;
      expect(distinctBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0500
     * @tc.name int8ArrayOverviewPart01Test005
     * @tc.desc Verify constructing over a bare ArrayBuffer covers the whole buffer and keeps the buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(4);
      const sameBuffer: boolean = view.buffer === buf;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0600
     * @tc.name int8ArrayOverviewPart01Test006
     * @tc.desc Verify offset-only and offset-plus-length constructors limit the view to the requested byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const tail: Int8Array = new Int8Array(buf, 2);
      expect(tail.length).assertEqual(6);
      expect(tail.byteOffset).assertEqual(2);
      const middle: Int8Array = new Int8Array(buf, 2, 3);
      expect(middle.length).assertEqual(3);
      expect(middle.byteOffset).assertEqual(2);
      expect(middle.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART01_TEST_0700
     * @tc.name int8ArrayOverviewPart01Test007
     * @tc.desc Verify an offset equal to the buffer length and an empty buffer both yield a zero-length view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const atEnd: Int8Array = new Int8Array(buf, 4);
      expect(atEnd.length).assertEqual(0);
      expect(atEnd.byteOffset).assertEqual(4);
      const emptyBuf: ArrayBuffer = new ArrayBuffer(0);
      const emptyView: Int8Array = new Int8Array(emptyBuf);
      expect(emptyView.length).assertEqual(0);
      expect(emptyView.byteLength).assertEqual(0);
    });

  });
}
