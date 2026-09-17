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
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_RETURN_DIRECT_0100
     * @tc.desc   verify getOriginalUrl/getReferrerUrl return string type signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDownloadItemUrlMethodsReturnStringDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let protoDesc: PropertyDescriptor | undefined =
          Object.getOwnPropertyDescriptor(webview.WebDownloadItem.prototype, 'getOriginalUrl');
        expect(protoDesc !== undefined).assertTrue();
        let protoDesc2: PropertyDescriptor | undefined =
          Object.getOwnPropertyDescriptor(webview.WebDownloadItem.prototype, 'getReferrerUrl');
        expect(protoDesc2 !== undefined).assertTrue();
        done();
      })
  })
}
