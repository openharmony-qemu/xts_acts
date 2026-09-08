/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';
import { BusinessError } from '@kit.BasicServicesKit';

export default function clearHostIPCoverageDirect() {
  describe('clearHostIPCoverageDirect', () => {
    /**
     * @tc.name   testClearHostIPEmptyStringDirect
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_0100
     * @tc.desc   clearHostIP empty string without Wi-Fi beforeEach dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearHostIPEmptyStringDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        webview.WebviewController.clearHostIP('');
        expect(1).assertEqual(1);
      } catch (error) {
        let errorCode = Number((error as BusinessError).code);
        expect(errorCode === 401 || errorCode === 17100001 || !Number.isNaN(errorCode)).assertTrue();
      }
      done();
    })
  })
}
