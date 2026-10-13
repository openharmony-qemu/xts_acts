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

export default function int8ArrayPropertiesPart03Test(): void {
  describe('Int8ArrayPropertiesPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART03_TEST_0100
     * @tc.name int8ArrayPropertiesPart03Test001
     * @tc.desc Verify byteLength equals length for a one-byte element type, across empty, single and populated arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      expect(empty.byteLength).assertEqual(0);
      const single: Int8Array = new Int8Array([7]);
      expect(single.byteLength).assertEqual(1);
      const three: Int8Array = new Int8Array(3);
      expect(three.byteLength).assertEqual(3);
      expect(three.byteLength).assertEqual(three.length);
      const five: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(five.byteLength).assertEqual(5);
      expect(five.byteLength).assertEqual(five.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART03_TEST_0200
     * @tc.name int8ArrayPropertiesPart03Test002
     * @tc.desc Verify a freshly allocated array always starts at byteOffset zero whatever its length or construction path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const noArg: Int8Array = new Int8Array();
      expect(noArg.byteOffset).assertEqual(0);
      const empty: Int8Array = new Int8Array(0);
      expect(empty.byteOffset).assertEqual(0);
      const sized: Int8Array = new Int8Array(3);
      expect(sized.byteOffset).assertEqual(0);
      const fromArray: Int8Array = new Int8Array([1, 2, 3]);
      expect(fromArray.byteOffset).assertEqual(0);
      const fromOf: Int8Array = Int8Array.of(1, 2, 3);
      expect(fromOf.byteOffset).assertEqual(0);
      const fromFrom: Int8Array = Int8Array.from([1, 2, 3]);
      expect(fromFrom.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART03_TEST_0300
     * @tc.name int8ArrayPropertiesPart03Test003
     * @tc.desc Verify a view reports the offset it was created with and a byteLength covering only the view, not the whole buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 3, 2);
      expect(view.byteOffset).assertEqual(3);
      expect(view.byteLength).assertEqual(2);
      expect(view.length).assertEqual(2);
      expect(view.buffer.byteLength).assertEqual(8);
      const tailOnly: Int8Array = new Int8Array(buf, 5);
      expect(tailOnly.byteOffset).assertEqual(5);
      expect(tailOnly.byteLength).assertEqual(3);
      const subarrayView: Int8Array = new Int8Array([1, 2, 3, 4]).subarray(1, 3);
      expect(subarrayView.byteOffset).assertEqual(1);
      expect(subarrayView.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART03_TEST_0400
     * @tc.name int8ArrayPropertiesPart03Test004
     * @tc.desc Verify a zero-length view at the end of a buffer reports byteOffset equal to the buffer length alongside a zero byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 4, 0);
      expect(view.byteOffset).assertEqual(4);
      expect(view.byteLength).assertEqual(0);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(buf.byteLength);
      const emptyBuffer: ArrayBuffer = new ArrayBuffer(0);
      const emptyView: Int8Array = new Int8Array(emptyBuffer, 0);
      expect(emptyView.byteOffset).assertEqual(0);
      expect(emptyView.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_PROPERTIES_PART03_TEST_0500
     * @tc.name int8ArrayPropertiesPart03Test005
     * @tc.desc Verify a whole-buffer view covers the entire buffer, with byteOffset zero and byteLength equal to the buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayPropertiesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const whole: Int8Array = new Int8Array(buf);
      expect(whole.byteOffset).assertEqual(0);
      expect(whole.byteLength).assertEqual(6);
      expect(whole.byteLength).assertEqual(buf.byteLength);
      expect(whole.length).assertEqual(6);
      const explicit: Int8Array = new Int8Array(buf, 0, 6);
      expect(explicit.byteOffset).assertEqual(0);
      expect(explicit.byteLength).assertEqual(buf.byteLength);
      const single: Int8Array = new Int8Array(new ArrayBuffer(1));
      expect(single.byteLength).assertEqual(1);
      expect(single.byteLength).assertEqual(single.buffer.byteLength);
    });
  });
}
