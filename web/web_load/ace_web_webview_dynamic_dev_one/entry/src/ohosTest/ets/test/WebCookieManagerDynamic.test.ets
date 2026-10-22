/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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

export default function WebCookieManagerDynamicTest() {
  describe('WebCookieManagerDynamic', () => {
    /**
     * @tc.name   SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0100
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0100
     * @tc.desc   test webcookiemanager fetchcookiesync (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let v = webview.WebCookieManager.fetchCookieSync('https://www.example.com/', false, false);
        expect(typeof v).assertEqual('string');
        done();
      });
  });
}
