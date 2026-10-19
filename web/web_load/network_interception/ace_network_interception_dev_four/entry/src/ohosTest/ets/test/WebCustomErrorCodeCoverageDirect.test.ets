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
import webview from '@ohos.web.webview';
import { BusinessError } from '@ohos.base';

const CUSTOM_ERROR_CODE = 32159;

export default function WebCustomErrorCodeCoverageDirect() {
  describe('WebCustomErrorCodeCoverageDirect', () => {
    /**
     * @tc.name   testSetCustomErrorCodeCallDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETCUSTOMERRORCODE_CALL_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCustomErrorCodeCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
        response.setCustomErrorCode(CUSTOM_ERROR_CODE);
        expect(response.getCustomErrorCode()).assertEqual(CUSTOM_ERROR_CODE);
        done();
      })

    /**
     * @tc.name   testSetCustomErrorCodeNullUndefinedDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETCUSTOMERRORCODE_PARAM_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode null/undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCustomErrorCodeNullUndefinedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
        try {
          response.setCustomErrorCode(null);
          expect().assertFail();
        } catch (error) {
          expect(String((error as BusinessError).code)).assertEqual('401');
        }
        try {
          response.setCustomErrorCode(undefined);
          expect().assertFail();
        } catch (error) {
          expect(String((error as BusinessError).code)).assertEqual('401');
        }
        done();
      })

    /**
     * @tc.name   testSetCustomErrorCodeParamSpecDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETCUSTOMERRORCODE_PARAM_SPEC_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode number param spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCustomErrorCodeParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let values: Array<number> = [0, CUSTOM_ERROR_CODE, -1];
        for (let i = 0; i < values.length; i++) {
          let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
          response.setCustomErrorCode(values[i]);
          expect(response.getCustomErrorCode()).assertEqual(values[i]);
        }
        done();
      })

    /**
     * @tc.name   testSetCustomErrorCodeReturnDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETCUSTOMERRORCODE_RETURN_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode void return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCustomErrorCodeReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
        try {
          response.setCustomErrorCode(CUSTOM_ERROR_CODE);
          expect(response.getCustomErrorCode()).assertEqual(CUSTOM_ERROR_CODE);
        } catch (error) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testGetCustomErrorCodeCallDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_GETCUSTOMERRORCODE_CALL_0100
     * @tc.desc   test WebSchemeHandlerResponse getCustomErrorCode call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCustomErrorCodeCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
        response.setCustomErrorCode(CUSTOM_ERROR_CODE);
        let code: number = response.getCustomErrorCode();
        expect(code).assertEqual(CUSTOM_ERROR_CODE);
        done();
      })

    /**
     * @tc.name   testGetCustomErrorCodeReturnDirect001
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_GETCUSTOMERRORCODE_RETURN_0100
     * @tc.desc   test WebSchemeHandlerResponse getCustomErrorCode number return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCustomErrorCodeReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
        response.setCustomErrorCode(0);
        let code: number = response.getCustomErrorCode();
        expect(typeof code).assertEqual('number');
        expect(code).assertEqual(0);
        done();
      })
  })
}
