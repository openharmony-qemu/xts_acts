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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function arrayBufferToStringTest(): void {
  describe('ArrayBufferToStringTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0100
     * @tc.desc Verify toString() on ArrayBuffer(8) returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.toString()).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0200
     * @tc.desc Verify toString() on zero-length buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.toString()).assertEqual("[object ArrayBuffer]");
    });
  });
}
