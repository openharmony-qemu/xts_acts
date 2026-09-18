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

const ERROR_CODE_INVALID_PARAM = 401;

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
        done();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERROR_CODE_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.name   testClearHostIPNullDirect
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_401_NULL_3000
     * @tc.desc   clearHostIP null hostName returns error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearHostIPNullDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        webview.WebviewController.clearHostIP(null);
        expect().assertFail();
        done();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERROR_CODE_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.name   testClearHostIPUndefinedDirect
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_401_UNDEFINED_3100
     * @tc.desc   clearHostIP undefined hostName returns error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClearHostIPUndefinedDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        webview.WebviewController.clearHostIP(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERROR_CODE_INVALID_PARAM);
        done();
      }
    })
  })
}
