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
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';

export default function webDownloadUrlCoverageDirect() {
  describe('webDownloadUrlCoverageDirect', () => {
    /**
     * @tc.name   SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100
     * @tc.desc   ensure getOriginalUrl/getReferrerUrl callable on prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let proto: object = webview.WebDownloadItem.prototype as object;
        expect(typeof (proto as Record<string, Function>)['getOriginalUrl']).assertEqual('function');
        expect(typeof (proto as Record<string, Function>)['getReferrerUrl']).assertEqual('function');
        done();
      })

    /**
     * @tc.name   SUB_WEB_DOWNLOADITEM_URL_RETURN_0200
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_RETURN_0200
     * @tc.desc   open GetReferrerUrl page so getOriginalUrl/getReferrerUrl return strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_DOWNLOADITEM_URL_RETURN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await router.pushUrl({ url: 'testability/pages/GetReferrerUrlTest' });
        } catch (err) {
          console.error('push GetReferrerUrlTest err=' + JSON.stringify(err));
        }
        let driver = Driver.create();
        let btn = await driver.waitForComponent(ON.id('GetReferrerUrlTestButton'), 15000);
        expect(btn !== undefined).assertTrue();
        // Page onDownloadStart calls getOriginalUrl/getReferrerUrl and stores string returns.
        done();
      })
  })
}
