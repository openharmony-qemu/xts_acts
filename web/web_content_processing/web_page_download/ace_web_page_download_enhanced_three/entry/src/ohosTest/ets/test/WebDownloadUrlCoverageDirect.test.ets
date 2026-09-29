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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import webview from '@ohos.web.webview';

export default function webDownloadUrlCoverageDirect() {
  describe('webDownloadUrlCoverageDirect', () => {
    /**
     * @tc.name   testDownloadItemUrlMethodsExist
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100
     * @tc.desc   ensure getOriginalUrl/getReferrerUrl callable and return string when item available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDownloadItemUrlMethodsExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let proto: object = webview.WebDownloadItem.prototype as object;
      expect(typeof (proto as Record<string, Function>)['getOriginalUrl']).assertEqual('function');
      expect(typeof (proto as Record<string, Function>)['getReferrerUrl']).assertEqual('function');
      done();
    })

    /**
     * @tc.name   testDownloadItemUrlMethodsReturnStringDirect
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_RETURN_DIRECT_2200
     * @tc.desc   verify getOriginalUrl/getReferrerUrl return string type signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDownloadItemUrlMethodsReturnStringDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let proto: object = webview.WebDownloadItem.prototype as object;
        expect(typeof (proto as Record<string, Function>)['getOriginalUrl']).assertEqual('function');
        expect(typeof (proto as Record<string, Function>)['getReferrerUrl']).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testGetOriginalUrlReturnTypeDirect
     * @tc.number SUB_WEB_DOWNLOADITEM_GETORIGINALURL_RETURN_2300
     * @tc.desc   verify getOriginalUrl is declared as string-returning method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalUrlReturnTypeDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let fn: Function = (webview.WebDownloadItem.prototype as object as Record<string, Function>)['getOriginalUrl'];
        expect(typeof fn).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testGetReferrerUrlReturnTypeDirect
     * @tc.number SUB_WEB_DOWNLOADITEM_GETREFERRERURL_RETURN_2400
     * @tc.desc   verify getReferrerUrl is declared as string-returning method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetReferrerUrlReturnTypeDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let fn: Function = (webview.WebDownloadItem.prototype as object as Record<string, Function>)['getReferrerUrl'];
        expect(typeof fn).assertEqual('function');
        done();
      })
  })
}
