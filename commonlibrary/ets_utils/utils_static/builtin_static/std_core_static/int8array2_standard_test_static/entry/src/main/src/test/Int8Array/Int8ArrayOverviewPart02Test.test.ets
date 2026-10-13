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

export default function int8ArrayOverviewPart02Test(): void {
  describe('Int8ArrayOverviewPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0100
     * @tc.name int8ArrayOverviewPart02Test001
     * @tc.desc Verify constructor source values above the signed range wrap around two hundred and fifty six: 128, 255, 256 and -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([128, 255, 256, -129]);
      expect(arr.$_get(0)).assertEqual(INT8_MIN);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0200
     * @tc.name int8ArrayOverviewPart02Test002
     * @tc.desc Verify hexadecimal and in-range constructor values are stored unchanged, including both signed boundaries and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([0x81, INT8_MIN, 0, INT8_MAX]);
      expect(arr.$_get(0)).assertEqual(-127);
      expect(arr.$_get(1)).assertEqual(INT8_MIN);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0300
     * @tc.name int8ArrayOverviewPart02Test003
     * @tc.desc Verify fresh elements read back as zero and $_set writes are readable through $_get at every index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      arr.$_set(0, 10);
      arr.$_set(1, -20);
      arr.$_set(2, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(-20);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0400
     * @tc.name int8ArrayOverviewPart02Test004
     * @tc.desc Verify $_set wraps out-of-range values around two hundred and fifty six: 200, 128, -129 and 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 200);
      expect(arr.$_get(0)).assertEqual(-56);
      arr.$_set(1, 128);
      expect(arr.$_get(1)).assertEqual(INT8_MIN);
      arr.$_set(2, -129);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
      arr.$_set(3, 300);
      expect(arr.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0500
     * @tc.name int8ArrayOverviewPart02Test005
     * @tc.desc Verify $_set truncates fractional values toward zero and stores NaN and negative zero as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 1.9);
      expect(arr.$_get(0)).assertEqual(1);
      arr.$_set(1, -1.9);
      expect(arr.$_get(1)).assertEqual(-1);
      arr.$_set(2, Number.NaN);
      expect(arr.$_get(2)).assertEqual(0);
      arr.$_set(3, -0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0600
     * @tc.name int8ArrayOverviewPart02Test006
     * @tc.desc Verify length, byteLength, byteOffset and buffer on an array built from an array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(3);
      const bufferIsObject: boolean = arr.buffer !== null && arr.buffer !== undefined;
      expect(bufferIsObject).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0700
     * @tc.name int8ArrayOverviewPart02Test007
     * @tc.desc Verify the four properties on a view that starts at offset two of an eight byte buffer and spans three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2, 3);
      expect(view.length).assertEqual(3);
      expect(view.byteLength).assertEqual(3);
      expect(view.byteOffset).assertEqual(2);
      expect(view.buffer.byteLength).assertEqual(8);
      const sameBuffer: boolean = view.buffer === buf;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART02_TEST_0800
     * @tc.name int8ArrayOverviewPart02Test008
     * @tc.desc Verify byteLength always equals length for int8 arrays and the view never exceeds its backing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sizes: Array<int> = [0, 1, 7];
      for (const size of sizes) {
        const arr: Int8Array = new Int8Array(size);
        expect(arr.byteLength).assertEqual(arr.length);
        const withinBuffer: boolean = arr.byteOffset + arr.byteLength <= arr.buffer.byteLength;
        expect(withinBuffer).assertTrue();
      }
    });
  });
}
