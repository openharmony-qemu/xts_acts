/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

const ARKWEB_INVALID_PARAM = 17100101;

export default function errorInfoTest() {
  describe('errorInfoTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWeb_CreateErrorInfo
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_CREATE_ERROR_INFO_4900
     * @tc.desc Test OH_ArkWeb_CreateErrorInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_CreateErrorInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_CreateErrorInfo()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_DestroyErrorInfo
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_DESTROY_ERROR_INFO_4910
     * @tc.desc Test OH_ArkWeb_DestroyErrorInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_DestroyErrorInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_DestroyErrorInfo()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_SetCompleteIfNoResponse
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_SET_COMPLETE_4920
     * @tc.desc Test OH_ArkWebErrorInfo_SetCompleteIfNoResponse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_SetCompleteIfNoResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_SetCompleteIfNoResponse()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_GetCompleteIfNoResponse
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_GET_COMPLETE_4930
     * @tc.desc Test OH_ArkWebErrorInfo_GetCompleteIfNoResponse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_GetCompleteIfNoResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_GetCompleteIfNoResponse()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_SetCustomErrorCode
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_SET_CUSTOM_4940
     * @tc.desc Test OH_ArkWebErrorInfo_SetCustomErrorCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_SetCustomErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_SetCustomErrorCode()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_GetCustomErrorCode
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_GET_CUSTOM_4950
     * @tc.desc Test OH_ArkWebErrorInfo_GetCustomErrorCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_GetCustomErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_GetCustomErrorCode()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_SetErrorCode
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_SET_ERROR_CODE_4960
     * @tc.desc Test OH_ArkWebErrorInfo_SetErrorCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_SetErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_SetErrorCode()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebErrorInfo_GetErrorCode
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_ERROR_INFO_GET_ERROR_CODE_4970
     * @tc.desc Test OH_ArkWebErrorInfo_GetErrorCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebErrorInfo_GetErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebErrorInfo_GetErrorCode()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResponse_SetErrorInfo
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESPONSE_SET_ERROR_INFO_4980
     * @tc.desc Test OH_ArkWebResponse_SetErrorInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResponse_SetErrorInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResponse_SetErrorInfo()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResponse_GetErrorInfo
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESPONSE_GET_ERROR_INFO_4990
     * @tc.desc Test OH_ArkWebResponse_GetErrorInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResponse_GetErrorInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResponse_GetErrorInfo()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceHandler_DidFailWithErrorInfo
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HANDLER_DID_FAIL_ERROR_INFO_5000
     * @tc.desc Test OH_ArkWebResourceHandler_DidFailWithErrorInfo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceHandler_DidFailWithErrorInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceHandler_DidFailWithErrorInfo()).assertEqual(ARKWEB_INVALID_PARAM);
        done();
      });
  });
}
