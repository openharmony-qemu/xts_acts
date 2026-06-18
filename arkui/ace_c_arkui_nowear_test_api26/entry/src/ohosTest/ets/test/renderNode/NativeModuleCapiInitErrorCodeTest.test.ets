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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function NativeModuleCapiInitErrorCodeTest() {
  describe('NativeModuleCapiInitErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModuleInitError_0200
     * @tc.number SUB_ACE_ARKUI_NativeModuleInitError_0200
     * @tc.desc   Test OH_ArkUI_NativeModule_GetChildMountPolicy returns ARKUI_ERROR_CODE_CAPI_INIT_ERROR
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModuleInitError_0200', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetChildMountPolicyInitError001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtilsInitError_0200
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtilsInitError_0200
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount returns ARKUI_ERROR_CODE_CAPI_INIT_ERROR
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtilsInitError_0200', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeChildrenCountInitError001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtilsInitError_0300
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtilsInitError_0300
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt returns ARKUI_ERROR_CODE_CAPI_INIT_ERROR
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtilsInitError_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAtInitError001()).assertEqual(0)
      done()
    })
  })
}