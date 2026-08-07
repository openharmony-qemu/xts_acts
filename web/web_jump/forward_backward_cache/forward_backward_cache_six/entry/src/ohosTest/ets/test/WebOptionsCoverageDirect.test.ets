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

export default function webOptionsCoverageDirect() {
  describe('webOptionsCoverageDirect', () => {
    /**
     * @tc.name   testBackForwardCacheOptionsCtor
     * @tc.number SUB_WEB_BFCACHE_OPTIONS_CTOR_0100
     * @tc.desc   construct BackForwardCacheOptions / SupportedFeatures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBackForwardCacheOptionsCtor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let opt: webview.BackForwardCacheOptions = new webview.BackForwardCacheOptions();
      expect(opt !== undefined).assertTrue();
      let feat: webview.BackForwardCacheSupportedFeatures = new webview.BackForwardCacheSupportedFeatures();
      expect(feat !== undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   testPrefetchOptionsCtor
     * @tc.number SUB_WEB_PREFETCH_OPTIONS_CTOR_0100
     * @tc.desc   construct PrefetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPrefetchOptionsCtor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let opt: webview.PrefetchOptions = new webview.PrefetchOptions();
      expect(opt !== undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   testWebSchemeHandlerResponseCtor
     * @tc.number SUB_WEB_SCHEME_HANDLER_RESP_CTOR_0100
     * @tc.desc   construct WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebSchemeHandlerResponseCtor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resp: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
      expect(resp !== undefined).assertTrue();
      done();
    })
  })
}
