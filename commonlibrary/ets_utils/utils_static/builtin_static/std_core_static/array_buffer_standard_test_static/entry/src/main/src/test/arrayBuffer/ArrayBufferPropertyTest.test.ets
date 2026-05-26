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

export default function arrayBufferPropertyTest(): void {
  describe('ArrayBufferPropertyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

  // 本套件仅做构造后只读属性（byteLength / detached / resizable）的集成冒烟；
  // 各属性及 constructor 异常另有独立用例文件覆盖。

    /**
     * @tc.name testArrayBufferProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0100
     * @tc.desc Normal: fixed ArrayBuffer has byteLength 4, detached false, resizable false
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
     * @tc.desc Normal: resizable ArrayBuffer(2,8) has byteLength 2, detached false, resizable true
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
     * @tc.desc Boundary: zero-length fixed buffer has byteLength 0, detached false, resizable false
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
     * @tc.desc Boundary: zero-length resizable buffer has byteLength 0, detached false, resizable true
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
     * @tc.desc Error: constructor with negative length throws RangeError
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
  });
}
