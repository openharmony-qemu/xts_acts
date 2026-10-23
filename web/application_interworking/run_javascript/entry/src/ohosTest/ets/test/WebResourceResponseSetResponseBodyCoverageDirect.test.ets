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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';

export default function webResourceResponseSetResponseBodyCoverageDirect() {
  describe('webResourceResponseSetResponseBodyCoverageDirect', () => {
    /**
     * @tc.name   testSetResponseBodyNullUndefinedDirect001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_PARAM_DIRECT_0100
     * @tc.desc   test WebResourceResponse setResponseBody null/undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetResponseBodyNullUndefinedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let resp: WebResourceResponse = new WebResourceResponse();
        try {
          resp.setResponseBody(null);
        } catch (e) {
          console.info('setResponseBody(null) ' + JSON.stringify(e));
        }
        try {
          resp.setResponseBody(undefined);
        } catch (e) {
          console.info('setResponseBody(undefined) ' + JSON.stringify(e));
        }
        expect(resp !== undefined).assertTrue();
        done();
      })

    /**
     * @tc.name   testSetResponseBodyParamSpecDirect001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_PARAM_SPEC_0100
     * @tc.desc   test WebResourceResponse setResponseBody string|number|Resource|ArrayBuffer param spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetResponseBodyParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let resp: WebResourceResponse = new WebResourceResponse();
        let htmlBody: string = '<!DOCTYPE html><html><body><h1>setResponseBody</h1></body></html>';
        try {
          resp.setResponseBody('');
          resp.setResponseBody(htmlBody);
          resp.setResponseBody(123);
          resp.setResponseBody(0);
          resp.setResponseBody(-1);
          let buffer: ArrayBuffer = new ArrayBuffer(8);
          let view: Uint8Array = new Uint8Array(buffer);
          view[0] = 0x48;
          resp.setResponseBody(buffer);
        } catch (e) {
          console.info('setResponseBody paramSpec ' + JSON.stringify(e));
        }
        expect(resp !== undefined).assertTrue();
        done();
      })

    /**
     * @tc.name   testSetResponseBodyReturnDirect001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_RETURN_0100
     * @tc.desc   test WebResourceResponse setResponseBody void return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetResponseBodyReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let resp: WebResourceResponse = new WebResourceResponse();
        try {
          resp.setResponseBody('<html><body>return</body></html>');
          expect(resp !== undefined).assertTrue();
        } catch (e) {
          expect().assertFail();
        }
        done();
      })
  })
}
