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
import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium-dynamic';
import webview from '@ohos.web.webview';
import { BusinessError } from '@kit.BasicServicesKit';

export default function webviewControllerSetUrlTrustListErrorDirect() {
  describe('webviewControllerSetUrlTrustListErrorDirect', () => {
    let controller: webview.WebviewController;

    beforeAll(() => {
      controller = new webview.WebviewController();
    });

    /**
     * @tc.name   testSetUrlTrustListError401Direct
     * @tc.number SUB_WEB_SETURLTRUSTLIST_ERROR_401_DIRECT_4800
     * @tc.desc   setUrlTrustList null/undefined returns error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetUrlTrustListError401Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          controller.setUrlTrustList(null);
          expect().assertFail();
        } catch (error) {
          expect(String((error as BusinessError).code)).assertEqual('401');
        }
        try {
          controller.setUrlTrustList(undefined);
          expect().assertFail();
        } catch (error) {
          expect(String((error as BusinessError).code)).assertEqual('401');
        }
        done();
      })

    /**
     * @tc.name   testSetUrlTrustListError17100001Direct
     * @tc.number SUB_WEB_SETURLTRUSTLIST_ERROR_17100001_DIRECT_4900
     * @tc.desc   setUrlTrustList invalid url format returns error code 17100001 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetUrlTrustListError17100001Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          controller.setUrlTrustList('invalid-url-format');
          expect().assertFail();
        } catch (error) {
          expect(['401', '17100001']).assertContain(String((error as BusinessError).code));
        }
        done();
      })
  })
}
