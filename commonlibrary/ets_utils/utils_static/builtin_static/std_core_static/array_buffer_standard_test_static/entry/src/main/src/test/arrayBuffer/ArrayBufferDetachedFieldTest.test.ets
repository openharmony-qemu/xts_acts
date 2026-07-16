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

export default function arrayBufferDetachedFieldTest(): void {
  // Static XTS: detached===true buffer cannot be constructed; detached slice/resize TypeError paths are not covered here.
  describe('ArrayBufferDetachedFieldTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferDetachedField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0100
     * @tc.desc Verify new ArrayBuffer(8) has detached false (detached true not constructible in static XTS)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0200
     * @tc.desc Verify detached is false for zero-length and resizable zero-init buffers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed = new ArrayBuffer(0);
      const resizable = new ArrayBuffer(0, 8);
      expect(fixed.detached).assertFalse();
      expect(resizable.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0300
     * @tc.desc Verify assigning buffer.detached throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      try {
        (buffer as Record<string, Object>)['detached'] = Utils.booleanAsObject(true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferDetachedField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_DETACHED_0400
     * @tc.desc Verify slice/resize on attached buffer succeed; detached-buffer TypeError not testable (cannot construct detached buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      expect(buffer.detached).assertFalse();
      const copied = buffer.slice(0, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(10));
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });
  });
}
