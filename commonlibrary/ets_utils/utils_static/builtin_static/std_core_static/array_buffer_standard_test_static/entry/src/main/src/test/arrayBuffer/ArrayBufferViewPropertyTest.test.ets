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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferViewPropertyTest(): void {
  describe('ArrayBufferViewPropertyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferViewProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0100
     * @tc.desc Verify DataView.buffer references underlying ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(8);
      const view = new DataView(ab);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0200
     * @tc.desc Verify sub-range DataView byteLength equals span length 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(16);
      const view: ArrayBufferView = new DataView(ab, 4, 8);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferViewProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0300
     * @tc.desc Verify sub-range DataView byteOffset equals constructor offset 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(16);
      const view: ArrayBufferView = new DataView(ab, 4, 8);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferViewProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0400
     * @tc.desc Verify DataView on zero-length buffer has byteLength 0 and byteOffset 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(0);
      const view = new DataView(ab);
      expect(view.byteLength).assertEqual(0);
      expect(view.byteOffset).assertEqual(0);
      expect(view.buffer).assertEqual(ab);
    });

    /**
     * @tc.name testArrayBufferViewProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0500
     * @tc.desc Verify full-span DataView byteOffset+byteLength equals buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(12);
      const view: ArrayBufferView = new DataView(ab);
      expect(view.byteOffset + view.byteLength).assertEqual(ab.byteLength);
    });

    /**
     * @tc.name testArrayBufferViewProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_VIEW_PROPERTY_0600
     * @tc.desc Verify new DataView(ab,16) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferViewProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ab = new ArrayBuffer(8);
        new DataView(ab, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
