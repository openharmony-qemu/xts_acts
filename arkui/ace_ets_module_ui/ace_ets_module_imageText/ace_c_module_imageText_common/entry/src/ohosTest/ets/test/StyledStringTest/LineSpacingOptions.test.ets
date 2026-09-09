/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function LineSpacingOptionsTest() {
  describe('LineSpacingOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LineSpacingOptionsTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Create_0100
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Create_0100
     * @tc.desc   Test OH_ArkUI_NativeModule_LineSpacingOptions_Create returns non-null pointer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Create_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Create_0100 START');
      expect(nativeFunc.LineSpacingOptionsTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Create_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Destroy_0400
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Destroy_0400
     * @tc.desc   Test OH_ArkUI_NativeModule_LineSpacingOptions_Destroy with nullptr
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Destroy_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Destroy_0400 START');
      expect(nativeFunc.LineSpacingOptionsTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_Destroy_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0500
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0500
     * @tc.desc   Test SetOnlyBetweenLines with true returns ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0500 START');
      expect(nativeFunc.LineSpacingOptionsTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0600
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0600
     * @tc.desc   Test SetOnlyBetweenLines with false returns ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0600 START');
      expect(nativeFunc.LineSpacingOptionsTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0700
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0700
     * @tc.desc   Test SetOnlyBetweenLines with nullptr returns ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0700 START');
      expect(nativeFunc.LineSpacingOptionsTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetOnlyBetweenLines_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0800
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0800
     * @tc.desc   Test GetOnlyBetweenLines default value is false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0800 START');
      expect(nativeFunc.LineSpacingOptionsTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0900
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0900
     * @tc.desc   Test GetOnlyBetweenLines returns true after SetOnlyBetweenLines(true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0900 START');
      expect(nativeFunc.LineSpacingOptionsTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_0900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1000
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1000
     * @tc.desc   Test GetOnlyBetweenLines returns false after SetOnlyBetweenLines(false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1000 START');
      expect(nativeFunc.LineSpacingOptionsTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1100
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1100
     * @tc.desc   Test GetOnlyBetweenLines with nullptr options returns ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1100 START');
      expect(nativeFunc.LineSpacingOptionsTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1200
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1200
     * @tc.desc   Test GetOnlyBetweenLines with nullptr out-param returns ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1200 START');
      expect(nativeFunc.LineSpacingOptionsTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_GetOnlyBetweenLines_1200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetAndGet_1300
     * @tc.number SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetAndGet_1300
     * @tc.desc   Test SetOnlyBetweenLines and GetOnlyBetweenLines round-trip consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetAndGet_1300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetAndGet_1300 START');
      expect(nativeFunc.LineSpacingOptionsTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_NativeModule_LineSpacingOptions_SetAndGet_1300 END');
    });
  });
}
