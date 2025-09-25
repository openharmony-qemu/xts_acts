/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'

export default function ActsInputmethodTwoTest() {
  describe('ActsInputmethodTwoTest', () => {

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100
     * @tc.desc      test OH_TextConfig_IsPreviewTextSupported Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100 start====");
          let result: number = testNapi.testOhTextConfigIsPreviewTextSupportedNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200
     * @tc.desc      test OH_TextConfig_IsPreviewTextSupported Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200 start====");
          let result: number = testNapi.testOhTextConfigIsPreviewTextSupportedOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_IsPreviewTextSupported_7200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300
     * @tc.desc      test OH_TextConfig_GetCursorInfo Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300 start====");
          let result: number = testNapi.testOhTextConfigGetCursorInfoNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400
     * @tc.desc      test OH_TextConfig_GetCursorInfo Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400 start====");
          let result: number = testNapi.testOhTextConfigGetCursorInfoOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetCursorInfo_7400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500
     * @tc.desc      test OH_TextConfig_GetTextAvoidInfo Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500 start====");
          let result: number = testNapi.testOhTextConfigGetTextAvoidInfoNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600
     * @tc.desc      test OH_TextConfig_GetTextAvoidInfo Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600 start====");
          let result: number = testNapi.testOhTextConfigGetTextAvoidInfoOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetTextAvoidInfo_7600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700
     * @tc.desc      test OH_TextConfig_GetSelection Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700 start====");
          let result: number = testNapi.testOhTextConfigGetSelectionNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800
     * @tc.desc      test OH_TextConfig_GetSelection Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800 start====");
          let result: number = testNapi.testOhTextConfigGetSelectionOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetSelection_7800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900
     * @tc.desc      test OH_TextConfig_GetWindowId Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900 start====");
          let result: number = testNapi.testOhTextConfigGetWindowIdNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_7900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000
     * @tc.desc      test OH_TextConfig_GetWindowId Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000 start====");
          let result: number = testNapi.testOhTextConfigGetWindowIdOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetWindowId_8000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100
     * @tc.desc      test OH_TextConfig_GetPlaceholder Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100 start====");
          let result: number = testNapi.testOhTextConfigGetPlaceholderNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200
     * @tc.desc      test OH_TextConfig_GetPlaceholder Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200 start====");
          let result: number = testNapi.testOhTextConfigGetPlaceholderOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300
     * @tc.desc      test OH_TextConfig_GetPlaceholder PARAMCHECK Error
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300 start====");
          let result: number = testNapi.testOhTextConfigGetPlaceholderParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetPlaceholder_8300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400
     * @tc.desc      test OH_TextConfig_GetAbilityName Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400 start====");
          let result: number = testNapi.testOhTextConfigGetAbilityNameNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500
     * @tc.desc      test OH_TextConfig_GetAbilityName Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500 start====");
          let result: number = testNapi.testOhTextConfigGetAbilityNameOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600
     * @tc.desc      test OH_TextConfig_GetAbilityName PARAMCHECK Error
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600 start====");
          let result: number = testNapi.testOhTextConfigGetAbilityNameParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetAbilityName_8600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700
     * @tc.desc      test OH_TextEditorProxy_SetGetTextConfigFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetTextConfigFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800
     * @tc.desc      test OH_TextEditorProxy_SetGetTextConfigFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetTextConfigFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextConfigFunc_8800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900
     * @tc.desc      test OH_TextEditorProxy_SetInsertTextFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900 start====");
          let result: number = testNapi.testOhTextEditorProxySetInsertTextFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_8900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000
     * @tc.desc      test OH_TextEditorProxy_SetInsertTextFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000 start====");
          let result: number = testNapi.testOhTextEditorProxySetInsertTextFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetInsertTextFunc_9000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100
     * @tc.desc      test OH_TextEditorProxy_SetDeleteForwardFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100 start====");
          let result: number = testNapi.testOhTextEditorProxySetDeleteForwardFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200
     * @tc.desc      test OH_TextEditorProxy_SetDeleteForwardFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200 start====");
          let result: number = testNapi.testOhTextEditorProxySetDeleteForwardFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteForwardFunc_9200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300
     * @tc.desc      test OH_TextEditorProxy_SetDeleteBackwardFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300 start====");
          let result: number = testNapi.testOhTextEditorProxySetDeleteBackwardFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400
     * @tc.desc      test OH_TextEditorProxy_SetDeleteBackwardFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400 start====");
          let result: number = testNapi.testOhTextEditorProxySetDeleteBackwardFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetDeleteBackwardFunc_9400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500
     * @tc.desc      test OH_TextEditorProxy_SetSendKeyboardStatusFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500 start====");
          let result: number = testNapi.testOhTextEditorProxySetSendKeyboardStatusFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600
     * @tc.desc      test OH_TextEditorProxy_SetSendKeyboardStatusFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600 start====");
          let result: number = testNapi.testOhTextEditorProxySetSendKeyboardStatusFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendKeyboardStatusFunc_9600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700
     * @tc.desc      test OH_TextEditorProxy_SetSendEnterKeyFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700 start====");
          let result: number = testNapi.testOhTextEditorProxySetSendEnterKeyFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800
     * @tc.desc      test OH_TextEditorProxy_SetSendEnterKeyFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800 start====");
          let result: number = testNapi.testOhTextEditorProxySetSendEnterKeyFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSendEnterKeyFunc_9800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900
     * @tc.desc      test OH_TextEditorProxy_SetMoveCursorFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900 start====");
          let result: number = testNapi.testOhTextEditorProxySetMoveCursorFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_9900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000
     * @tc.desc      test OH_TextEditorProxy_SetMoveCursorFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000 start====");
          let result: number = testNapi.testOhTextEditorProxySetMoveCursorFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetMoveCursorFunc_10000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100
     * @tc.desc      test OH_TextEditorProxy_SetHandleSetSelectionFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100 start====");
          let result: number = testNapi.testOhTextEditorProxySetHandleSetSelectionFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200
     * @tc.desc      test OH_TextEditorProxy_SetHandleSetSelectionFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200 start====");
          let result: number = testNapi.testOhTextEditorProxySetHandleSetSelectionFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleSetSelectionFunc_10200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300
     * @tc.desc      test OH_TextEditorProxy_SetHandleExtendActionFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300 start====");
          let result: number = testNapi.testOhTextEditorProxySetHandleExtendActionFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400
     * @tc.desc      test OH_TextEditorProxy_SetHandleExtendActionFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400 start====");
          let result: number = testNapi.testOhTextEditorProxySetHandleExtendActionFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetHandleExtendActionFunc_10400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500
     * @tc.desc      test OH_TextEditorProxy_SetGetLeftTextOfCursorFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600
     * @tc.desc      test OH_TextEditorProxy_SetGetLeftTextOfCursorFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetLeftTextOfCursorFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetLeftTextOfCursorFunc_10600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700
     * @tc.desc      test OH_TextEditorProxy_SetGetRightTextOfCursorFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800
     * @tc.desc      test OH_TextEditorProxy_SetGetRightTextOfCursorFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetRightTextOfCursorFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetRightTextOfCursorFunc_10800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900
     * @tc.desc      test OH_TextEditorProxy_SetGetTextIndexAtCursorFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_10900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000
     * @tc.desc      test OH_TextEditorProxy_SetGetTextIndexAtCursorFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000 start====");
          let result: number = testNapi.testOhTextEditorProxySetGetTextIndexAtCursorFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetGetTextIndexAtCursorFunc_11000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100
     * @tc.desc      test OH_TextEditorProxy_SetReceivePrivateCommandFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100 start====");
          let result: number = testNapi.testOhTextEditorProxySetReceivePrivateCommandFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200
     * @tc.desc      test OH_TextEditorProxy_SetReceivePrivateCommandFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200 start====");
          let result: number = testNapi.testOhTextEditorProxySetReceivePrivateCommandFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetReceivePrivateCommandFunc_11200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300
     * @tc.desc      test OH_TextEditorProxy_SetSetPreviewTextFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300 start====");
          let result: number = testNapi.testOhTextEditorProxySetSetPreviewTextFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400
     * @tc.desc      test OH_TextEditorProxy_SetSetPreviewTextFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400 start====");
          let result: number = testNapi.testOhTextEditorProxySetSetPreviewTextFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetSetPreviewTextFunc_11400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500
     * @tc.desc      test OH_TextEditorProxy_SetFinishTextPreviewFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500 start====");
          let result: number = testNapi.testOhTextEditorProxySetFinishTextPreviewFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600
     * @tc.desc      test OH_TextEditorProxy_SetFinishTextPreviewFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600 start====");
          let result: number = testNapi.testOhTextEditorProxySetFinishTextPreviewFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_SetFinishTextPreviewFunc_11600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700
     * @tc.desc      test OH_TextEditorProxy_GetGetTextConfigFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700 start====");
          let result: number = testNapi.testOhTextEditorProxyGetGetTextConfigFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800
     * @tc.desc      test OH_TextEditorProxy_GetGetTextConfigFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800 start====");
          let result: number = testNapi.testOhTextEditorProxyGetGetTextConfigFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetGetTextConfigFunc_11800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900
     * @tc.desc      test OH_TextEditorProxy_GetInsertTextFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900 start====");
          let result: number = testNapi.testOhTextEditorProxyGetInsertTextFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_11900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000
     * @tc.desc      test OH_TextEditorProxy_GetInsertTextFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000 start====");
          let result: number = testNapi.testOhTextEditorProxyGetInsertTextFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetInsertTextFunc_12000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100
     * @tc.desc      test OH_TextEditorProxy_GetDeleteForwardFunc Null Pointer
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100 start====");
          let result: number = testNapi.testOhTextEditorProxyGetDeleteForwardFuncNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number    SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200
     * @tc.name      SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200
     * @tc.desc      test OH_TextEditorProxy_GetDeleteForwardFunc Ok
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200 start====");
          let result: number = testNapi.testOhTextEditorProxyGetDeleteForwardFuncOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextEditorProxy_GetDeleteForwardFunc_12200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}