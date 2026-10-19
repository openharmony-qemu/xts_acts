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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function webComponentConstructorCoverageDirect() {
  describe('webComponentConstructorCoverageDirect', () => {
    /**
     * @tc.name   testJsResultClassCallDirect001
     * @tc.number SUB_WEB_JSRESULT_CLASS_CALL_0100
     * @tc.desc   test JsResult class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsResultClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: JsResult = new JsResult();
        expect(result != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testJsResultConstructorCallDirect001
     * @tc.number SUB_WEB_JSRESULT_CONSTRUCTOR_CALL_0100
     * @tc.desc   test JsResult constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsResultConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: JsResult = new JsResult();
        expect(typeof result.handleCancel).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testJsResultConstructorReturnDirect001
     * @tc.number SUB_WEB_JSRESULT_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test JsResult constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsResultConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let result: JsResult = new JsResult();
        expect(result instanceof JsResult).assertTrue();
        done();
      })

    /**
     * @tc.name   testHttpAuthHandlerConstructorParamDirect001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_PARAM_0100
     * @tc.desc   test HttpAuthHandler constructor no-arg param coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConstructorParamDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: HttpAuthHandler = new HttpAuthHandler();
        expect(typeof handler.confirm).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testHttpAuthHandlerConstructorParamSpecDirect001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_PARAM_SPEC_0100
     * @tc.desc   test HttpAuthHandler constructor param spec coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConstructorParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: HttpAuthHandler = new HttpAuthHandler();
        expect(typeof handler.cancel).assertEqual('function');
        expect(typeof handler.isHttpAuthInfoSaved).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testHttpAuthHandlerConstructorReturnDirect001
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test HttpAuthHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpAuthHandlerConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: HttpAuthHandler = new HttpAuthHandler();
        expect(handler instanceof HttpAuthHandler).assertTrue();
        done();
      })

    /**
     * @tc.name   testSslErrorHandlerConstructorParamDirect001
     * @tc.number SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_PARAM_0100
     * @tc.desc   test SslErrorHandler constructor no-arg param coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSslErrorHandlerConstructorParamDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: SslErrorHandler = new SslErrorHandler();
        expect(typeof handler.handleConfirm).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testSslErrorHandlerConstructorParamSpecDirect001
     * @tc.number SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_PARAM_SPEC_0100
     * @tc.desc   test SslErrorHandler constructor param spec coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSslErrorHandlerConstructorParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: SslErrorHandler = new SslErrorHandler();
        expect(typeof handler.handleCancel).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testSslErrorHandlerConstructorReturnDirect001
     * @tc.number SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test SslErrorHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSslErrorHandlerConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: SslErrorHandler = new SslErrorHandler();
        expect(handler instanceof SslErrorHandler).assertTrue();
        done();
      })

    /**
     * @tc.name   testClientAuthenticationHandlerConstructorParamDirect001
     * @tc.number SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_PARAM_0100
     * @tc.desc   test ClientAuthenticationHandler constructor param coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConstructorParamDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: ClientAuthenticationHandler = new ClientAuthenticationHandler();
        expect(typeof handler.confirm).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testClientAuthenticationHandlerConstructorParamSpecDirect001
     * @tc.number SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_PARAM_SPEC_0100
     * @tc.desc   test ClientAuthenticationHandler constructor param spec coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConstructorParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: ClientAuthenticationHandler = new ClientAuthenticationHandler();
        expect(typeof handler.cancel).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testClientAuthenticationHandlerConstructorReturnDirect001
     * @tc.number SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test ClientAuthenticationHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClientAuthenticationHandlerConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: ClientAuthenticationHandler = new ClientAuthenticationHandler();
        expect(handler instanceof ClientAuthenticationHandler).assertTrue();
        done();
      })

    /**
     * @tc.name   testDataResubmissionHandlerConstructorParamSpecDirect001
     * @tc.number SUB_WEB_DATARESUBMISSIONHANDLER_CONSTRUCTOR_PARAM_SPEC_0100
     * @tc.desc   test DataResubmissionHandler constructor param spec coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResubmissionHandlerConstructorParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: DataResubmissionHandler = new DataResubmissionHandler();
        expect(typeof handler.resend).assertEqual('function');
        expect(typeof handler.cancel).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testDataResubmissionHandlerConstructorReturnDirect001
     * @tc.number SUB_WEB_DATARESUBMISSIONHANDLER_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test DataResubmissionHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataResubmissionHandlerConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let handler: DataResubmissionHandler = new DataResubmissionHandler();
        expect(handler instanceof DataResubmissionHandler).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebContextMenuParamClassCallDirect001
     * @tc.number SUB_WEB_WEBCONTEXTMENUPARAM_CLASS_CALL_0100
     * @tc.desc   test WebContextMenuParam class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebContextMenuParamClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let param: WebContextMenuParam = new WebContextMenuParam();
        expect(param != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebContextMenuParamConstructorCallDirect001
     * @tc.number SUB_WEB_WEBCONTEXTMENUPARAM_CONSTRUCTOR_CALL_0100
     * @tc.desc   test WebContextMenuParam constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebContextMenuParamConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let param: WebContextMenuParam = new WebContextMenuParam();
        expect(typeof param.getLinkUrl).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testWebContextMenuParamConstructorReturnDirect001
     * @tc.number SUB_WEB_WEBCONTEXTMENUPARAM_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test WebContextMenuParam constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebContextMenuParamConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let param: WebContextMenuParam = new WebContextMenuParam();
        expect(param instanceof WebContextMenuParam).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebResourceRequestClassCallDirect001
     * @tc.number SUB_WEB_WEBRESOURCEREQUEST_CLASS_CALL_0100
     * @tc.desc   test WebResourceRequest class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceRequestClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let request: WebResourceRequest = new WebResourceRequest();
        expect(request != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebResourceRequestConstructorCallDirect001
     * @tc.number SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_CALL_0100
     * @tc.desc   test WebResourceRequest constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceRequestConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let request: WebResourceRequest = new WebResourceRequest();
        expect(typeof request.getRequestUrl).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testWebResourceRequestConstructorParamSpecDirect001
     * @tc.number SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_PARAM_SPEC_0100
     * @tc.desc   test WebResourceRequest constructor param spec coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceRequestConstructorParamSpecDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let request: WebResourceRequest = new WebResourceRequest();
        expect(typeof request.getRequestMethod).assertEqual('function');
        expect(typeof request.getRequestHeader).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testWebResourceRequestConstructorReturnDirect001
     * @tc.number SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test WebResourceRequest constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceRequestConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let request: WebResourceRequest = new WebResourceRequest();
        expect(request instanceof WebResourceRequest).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebResourceErrorClassCallDirect001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_CLASS_CALL_0100
     * @tc.desc   test WebResourceError class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceErrorClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let error: WebResourceError = new WebResourceError();
        expect(error != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testWebResourceErrorConstructorCallDirect001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_CONSTRUCTOR_CALL_0100
     * @tc.desc   test WebResourceError constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceErrorConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let error: WebResourceError = new WebResourceError();
        expect(typeof error.getErrorCode).assertEqual('function');
        done();
      })

    /**
     * @tc.name   testWebResourceErrorConstructorReturnDirect001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test WebResourceError constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebResourceErrorConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let error: WebResourceError = new WebResourceError();
        expect(error instanceof WebResourceError).assertTrue();
        done();
      })

  })
}
