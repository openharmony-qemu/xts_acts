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

import webCode from 'libweberrorcodetest.so'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

const TEST_SUCCESS = 0;

export default function ActsWebErrorInfoTest() {
  describe('ActsWebErrorInfoTest', () => {

    /**
     * @tc.name   testArkWebCreateErrorInfo0100
     * @tc.number SUB_OH_ArkWeb_CreateErrorInfo_0100
     * @tc.desc   test OH_ArkWeb_CreateErrorInfo normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCreateErrorInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = webCode.OH_ArkWeb_CreateErrorInfo0100();
      expect(result).assertEqual(TEST_SUCCESS);
      done();
    })

    /**
     * @tc.name   testArkWebDestroyErrorInfo0100
     * @tc.number SUB_OH_ArkWeb_DestroyErrorInfo_0100
     * @tc.desc   test OH_ArkWeb_DestroyErrorInfo normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDestroyErrorInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = webCode.OH_ArkWeb_DestroyErrorInfo0100();
      expect(result).assertEqual(TEST_SUCCESS);
      done();
    })

    /**
     * @tc.name   testArkWebErrorInfoSetCompleteIfNoResponse0100
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCompleteIfNoResponse_0100
     * @tc.desc   test OH_ArkWebErrorInfo_SetCompleteIfNoResponse invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCompleteIfNoResponse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCompleteIfNoResponse0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCompleteIfNoResponse0200
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCompleteIfNoResponse_0200
     * @tc.desc   test OH_ArkWebErrorInfo_SetCompleteIfNoResponse normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCompleteIfNoResponse0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCompleteIfNoResponse0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCompleteIfNoResponse0100
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCompleteIfNoResponse_0100
     * @tc.desc   test OH_ArkWebErrorInfo_GetCompleteIfNoResponse normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCompleteIfNoResponse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCompleteIfNoResponse0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCustomErrorCode0100
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCustomErrorCode_0100
     * @tc.desc   test OH_ArkWebErrorInfo_SetCustomErrorCode invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCustomErrorCode0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCustomErrorCode0200
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCustomErrorCode_0200
     * @tc.desc   test OH_ArkWebErrorInfo_SetCustomErrorCode normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCustomErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCustomErrorCode0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCustomErrorCode0100
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCustomErrorCode_0100
     * @tc.desc   test OH_ArkWebErrorInfo_GetCustomErrorCode normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCustomErrorCode0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetErrorCode0100
     * @tc.number SUB_OH_ArkWebErrorInfo_SetErrorCode_0100
     * @tc.desc   test OH_ArkWebErrorInfo_SetErrorCode invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetErrorCode0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetErrorCode0200
     * @tc.number SUB_OH_ArkWebErrorInfo_SetErrorCode_0200
     * @tc.desc   test OH_ArkWebErrorInfo_SetErrorCode normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetErrorCode0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetErrorCode0100
     * @tc.number SUB_OH_ArkWebErrorInfo_GetErrorCode_0100
     * @tc.desc   test OH_ArkWebErrorInfo_GetErrorCode normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetErrorCode0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseSetErrorInfo0100
     * @tc.number SUB_OH_ArkWebResponse_SetErrorInfo_0100
     * @tc.desc   test OH_ArkWebResponse_SetErrorInfo invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetErrorInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_SetErrorInfo0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseSetErrorInfo0200
     * @tc.number SUB_OH_ArkWebResponse_SetErrorInfo_0200
     * @tc.desc   test OH_ArkWebResponse_SetErrorInfo normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetErrorInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_SetErrorInfo0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseGetErrorInfo0100
     * @tc.number SUB_OH_ArkWebResponse_GetErrorInfo_0100
     * @tc.desc   test OH_ArkWebResponse_GetErrorInfo normal scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseGetErrorInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_GetErrorInfo0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResourceHandlerDidFailWithErrorInfo0100
     * @tc.number SUB_OH_ArkWebResourceHandler_DidFailWithErrorInfo_0100
     * @tc.desc   test OH_ArkWebResourceHandler_DidFailWithErrorInfo invalid resourceHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidFailWithErrorInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResourceHandler_DidFailWithErrorInfo0100();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResourceHandlerDidFailWithErrorInfo0200
     * @tc.number SUB_OH_ArkWebResourceHandler_DidFailWithErrorInfo_0200
     * @tc.desc   test OH_ArkWebResourceHandler_DidFailWithErrorInfo invalid errorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResourceHandlerDidFailWithErrorInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResourceHandler_DidFailWithErrorInfo0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebCreateErrorInfo0200
     * @tc.number SUB_OH_ArkWeb_CreateErrorInfo_0200
     * @tc.desc   test OH_ArkWeb_CreateErrorInfo with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCreateErrorInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWeb_CreateErrorInfo0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCustomErrorCode0200
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCustomErrorCode_0200
     * @tc.desc   test OH_ArkWebErrorInfo_GetCustomErrorCode with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCustomErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCustomErrorCode0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetErrorCode0200
     * @tc.number SUB_OH_ArkWebErrorInfo_GetErrorCode_0200
     * @tc.desc   test OH_ArkWebErrorInfo_GetErrorCode with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetErrorCode0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebDestroyErrorInfo0200
     * @tc.number SUB_OH_ArkWeb_DestroyErrorInfo_0200
     * @tc.desc   test OH_ArkWeb_DestroyErrorInfo with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDestroyErrorInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWeb_DestroyErrorInfo0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCompleteIfNoResponse0300
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCompleteIfNoResponse_0300
     * @tc.desc   test OH_ArkWebErrorInfo_SetCompleteIfNoResponse with false param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCompleteIfNoResponse0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCompleteIfNoResponse0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCompleteIfNoResponse0200
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCompleteIfNoResponse_0200
     * @tc.desc   test OH_ArkWebErrorInfo_GetCompleteIfNoResponse with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCompleteIfNoResponse0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCompleteIfNoResponse0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCompleteIfNoResponse0300
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCompleteIfNoResponse_0300
     * @tc.desc   test OH_ArkWebErrorInfo_GetCompleteIfNoResponse after set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCompleteIfNoResponse0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCompleteIfNoResponse0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCustomErrorCode0300
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCustomErrorCode_0300
     * @tc.desc   test OH_ArkWebErrorInfo_SetCustomErrorCode with boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCustomErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCustomErrorCode0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetCustomErrorCode0400
     * @tc.number SUB_OH_ArkWebErrorInfo_SetCustomErrorCode_0400
     * @tc.desc   test OH_ArkWebErrorInfo_SetCustomErrorCode with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetCustomErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetCustomErrorCode0400();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetCustomErrorCode0300
     * @tc.number SUB_OH_ArkWebErrorInfo_GetCustomErrorCode_0300
     * @tc.desc   test OH_ArkWebErrorInfo_GetCustomErrorCode default value without set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetCustomErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetCustomErrorCode0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoSetErrorCode0300
     * @tc.number SUB_OH_ArkWebErrorInfo_SetErrorCode_0300
     * @tc.desc   test OH_ArkWebErrorInfo_SetErrorCode with different ArkWeb_NetError value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoSetErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_SetErrorCode0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebErrorInfoGetErrorCode0300
     * @tc.number SUB_OH_ArkWebErrorInfo_GetErrorCode_0300
     * @tc.desc   test OH_ArkWebErrorInfo_GetErrorCode default value without set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrorInfoGetErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebErrorInfo_GetErrorCode0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseSetErrorInfo0300
     * @tc.number SUB_OH_ArkWebResponse_SetErrorInfo_0300
     * @tc.desc   test OH_ArkWebResponse_SetErrorInfo with valid response and nullptr errorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetErrorInfo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_SetErrorInfo0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseGetErrorInfo0200
     * @tc.number SUB_OH_ArkWebResponse_GetErrorInfo_0200
     * @tc.desc   test OH_ArkWebResponse_GetErrorInfo with nullptr param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseGetErrorInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_GetErrorInfo0200();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseGetErrorInfo0300
     * @tc.number SUB_OH_ArkWebResponse_GetErrorInfo_0300
     * @tc.desc   test OH_ArkWebResponse_GetErrorInfo without set (should return nullptr)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseGetErrorInfo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_GetErrorInfo0300();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })

    /**
     * @tc.name   testArkWebResponseSetErrorInfo0400
     * @tc.number SUB_OH_ArkWebResponse_SetErrorInfo_0400
     * @tc.desc   test OH_ArkWebResponse_SetErrorInfo with nullptr response and valid errorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseSetErrorInfo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let result: number = webCode.OH_ArkWebResponse_SetErrorInfo0400();
        expect(result).assertEqual(TEST_SUCCESS);
        done();
      })
  })
}