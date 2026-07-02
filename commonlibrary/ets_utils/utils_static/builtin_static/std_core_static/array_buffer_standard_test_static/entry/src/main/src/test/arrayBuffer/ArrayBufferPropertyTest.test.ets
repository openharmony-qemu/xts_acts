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

export default function arrayBufferPropertyTest(): void {
  describe('ArrayBufferPropertyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0100
     * @tc.desc Verify new ArrayBuffer(4) has byteLength 4, detached false, resizable false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0200
     * @tc.desc Verify new ArrayBuffer(2,8) has byteLength 2, detached false, resizable true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      expect(buffer.byteLength).assertEqual(2);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0300
     * @tc.desc Verify new ArrayBuffer(0) has byteLength 0, detached false, resizable false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0400
     * @tc.desc Verify new ArrayBuffer(0,8) has byteLength 0, detached false, resizable true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 8);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0500
     * @tc.desc Verify new ArrayBuffer(-1) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const badLen: int = -1;
      try {
        new ArrayBuffer(badLen);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0600
     * @tc.desc Verify new ArrayBuffer(8,4) throws RangeError when length exceeds maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new ArrayBuffer(8, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0700
     * @tc.desc Verify number overload new ArrayBuffer(4.0) has byteLength 4 and resizable false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 4.0;
      const buffer = new ArrayBuffer(len);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0800
     * @tc.desc Verify number overload new ArrayBuffer(2.0,8.0) has byteLength 2 and resizable true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2.0;
      const maxLen: number = 8.0;
      const buffer = new ArrayBuffer(len, maxLen);
      expect(buffer.byteLength).assertEqual(2);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0900
     * @tc.desc Verify new ArrayBuffer(4.9) truncates length to byteLength 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 4.9;
      expect(new ArrayBuffer(len).byteLength).assertEqual(4);
    });
  });
}
