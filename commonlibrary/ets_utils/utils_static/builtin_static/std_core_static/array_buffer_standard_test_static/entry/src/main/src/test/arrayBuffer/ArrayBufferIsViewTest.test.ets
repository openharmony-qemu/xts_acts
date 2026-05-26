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

export default function arrayBufferIsViewTest(): void {
  describe('ArrayBufferIsViewTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferIsView0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0100
     * @tc.desc Normal: ArrayBuffer.isView returns true for DataView
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0200
     * @tc.desc Normal: ArrayBuffer.isView returns true for Uint8Array TypedArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0300
     * @tc.desc Boundary: ArrayBuffer.isView returns true for view on zero-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      const view = new DataView(buffer);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0400
     * @tc.desc Normal: ArrayBuffer.isView returns false for ArrayBuffer itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(ArrayBuffer.isView(buffer)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0500
     * @tc.desc Normal: ArrayBuffer.isView returns false for plain Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      expect(ArrayBuffer.isView(obj)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0600
     * @tc.desc Error: ArrayBuffer.isView(null) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.isView(Utils.nullAsObject());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
