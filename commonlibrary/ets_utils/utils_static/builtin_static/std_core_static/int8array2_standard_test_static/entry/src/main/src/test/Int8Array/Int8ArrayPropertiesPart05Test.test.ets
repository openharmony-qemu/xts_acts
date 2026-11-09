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

export default function int8ArrayPropertiesPart05Test(): void {
  describe('Int8ArrayPropertiesPart05Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART05_TEST_0100
     * @tc.name int8ArrayPropertiesPart05Test001
     * @tc.desc Verify the invariant length times BYTES_PER_ELEMENT equals byteLength holds for every array size and for views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sizes: Array<int> = [0, 1, 3, 8];
      for (const size of sizes) {
        const arr: Int8Array = new Int8Array(size);
        const product: int = arr.length * arr.BYTES_PER_ELEMENT;
        expect(product).assertEqual(size);
        expect(arr.byteLength).assertEqual(size);
      }
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2, 3);
      const viewProduct: int = view.length * view.BYTES_PER_ELEMENT;
      expect(viewProduct).assertEqual(3);
      expect(view.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART05_TEST_0200
     * @tc.name int8ArrayPropertiesPart05Test002
     * @tc.desc Verify byteOffset plus byteLength never overruns the buffer, and covers it exactly for a whole-buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const views: Array<Int8Array> = [
        new Int8Array(buf),
        new Int8Array(buf, 3),
        new Int8Array(buf, 2, 4),
        new Int8Array(buf, 8, 0),
      ];
      for (const view of views) {
        const end: int = view.byteOffset + view.byteLength;
        const withinBuffer: boolean = end <= view.buffer.byteLength;
        expect(withinBuffer).assertTrue();
      }
      const whole: Int8Array = new Int8Array(buf);
      const wholeEnd: int = whole.byteOffset + whole.byteLength;
      expect(wholeEnd).assertEqual(8);
      expect(wholeEnd).assertEqual(buf.byteLength);
      const tail: Int8Array = new Int8Array(buf, 3);
      expect(tail.byteOffset + tail.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART05_TEST_0300
     * @tc.name int8ArrayPropertiesPart05Test003
     * @tc.desc Verify a negative size, an offset past the buffer, a negative length and a range overrunning the buffer all raise RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeSizeThrew: boolean = false;
      try {
        const badSize: Int8Array = new Int8Array(-1);
      } catch (e) {
        negativeSizeThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(negativeSizeThrew).assertTrue();
      let pastEndThrew: boolean = false;
      try {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const badOffset: Int8Array = new Int8Array(buf, 5);
      } catch (e) {
        pastEndThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(pastEndThrew).assertTrue();
      let negativeLengthThrew: boolean = false;
      try {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const badLength: Int8Array = new Int8Array(buf, 0, -1);
      } catch (e) {
        negativeLengthThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(negativeLengthThrew).assertTrue();
      let overrunThrew: boolean = false;
      try {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const overrun: Int8Array = new Int8Array(buf, 2, 3);
      } catch (e) {
        overrunThrew = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(overrunThrew).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART05_TEST_0400
     * @tc.name int8ArrayPropertiesPart05Test004
     * @tc.desc Verify an empty array reports zero length, zero byteLength, zero byteOffset and a buffer of its own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      expect(empty.length).assertEqual(0);
      expect(empty.byteLength).assertEqual(0);
      expect(empty.byteOffset).assertEqual(0);
      expect(empty.BYTES_PER_ELEMENT).assertEqual(1);
      const bufferPresent: boolean = empty.buffer !== undefined;
      expect(bufferPresent).assertTrue();
      expect(empty.buffer.byteLength).assertEqual(0);
      const emptyFromArray: Int8Array = new Int8Array([]);
      expect(emptyFromArray.length).assertEqual(0);
      expect(emptyFromArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART05_TEST_0500
     * @tc.name int8ArrayPropertiesPart05Test005
     * @tc.desc Verify a single-element array reports one length, one byteLength and a zero offset with the value readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single: Int8Array = new Int8Array([42]);
      expect(single.length).assertEqual(1);
      expect(single.byteLength).assertEqual(1);
      expect(single.byteOffset).assertEqual(0);
      expect(single.buffer.byteLength).assertEqual(1);
      expect(single.$_get(0)).assertEqual(42);
      const boundary: Int8Array = new Int8Array([-128]);
      expect(boundary.length).assertEqual(1);
      expect(boundary.byteLength).assertEqual(1);
      expect(boundary.$_get(0)).assertEqual(-128);
      const max: Int8Array = new Int8Array([127]);
      expect(max.length).assertEqual(1);
      expect(max.$_get(0)).assertEqual(127);
    });
  });
}
