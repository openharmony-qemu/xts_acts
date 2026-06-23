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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, Level, it, expect } from '@ohos/hypium';
import type { ConnectionInfo } from '@ohos.web.WebNativeMessagingExtensionAbility';

export default function connectionInfoFdParameterTest() {
  describe('ActsConnectionInfoFdParameterTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'ActsConnectionInfoFdParameterTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsConnectionInfoFdParameterTest beforeEach start');
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsConnectionInfoFdParameterTest afterEach start');
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0100
     * @tc.desc   Test ConnectionInfo fdRead parameter coverage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0100', Level.LEVEL1, () => {
      let info: ConnectionInfo = {
        connectionId: 100,
        bundleName: 'com.example.webnative',
        extensionOrigin: 'https://example.test',
        fdRead: 3,
        fdWrite: 4
      };
      expect(info.fdRead).assertEqual(3);
      expect(info.fdRead).not().assertUndefined();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0200
     * @tc.desc   Test ConnectionInfo fdRead boundary value coverage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdRead_0200', Level.LEVEL2, () => {
      let info: ConnectionInfo = {
        connectionId: 101,
        bundleName: 'com.example.webnative',
        extensionOrigin: 'https://example.test',
        fdRead: 0,
        fdWrite: 5
      };
      expect(info.fdRead).assertEqual(0);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0300
     * @tc.desc   Test ConnectionInfo fdWrite parameter coverage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0300', Level.LEVEL1, () => {
      let info: ConnectionInfo = {
        connectionId: 102,
        bundleName: 'com.example.webnative',
        extensionOrigin: 'https://example.test',
        fdRead: 6,
        fdWrite: 7
      };
      expect(info.fdWrite).assertEqual(7);
      expect(info.fdWrite).not().assertUndefined();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0400
     * @tc.desc   Test ConnectionInfo fdWrite boundary value coverage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectionInfo_FdWrite_0400', Level.LEVEL2, () => {
      let info: ConnectionInfo = {
        connectionId: 103,
        bundleName: 'com.example.webnative',
        extensionOrigin: 'https://example.test',
        fdRead: 8,
        fdWrite: 0
      };
      expect(info.fdWrite).assertEqual(0);
    })
  })
}
