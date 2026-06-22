/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export default function customDialogSetSystemMaterialTest() {

  describe('CustomDialogSetSystemMaterialTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCustomDialogSetSystemMaterial001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIAL_0100
     * @tc.desc   testing SetSystemMaterial for customDialog with ARKUI_IMMERSIVE_STYLE_ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterial001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterial002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIAL_0200
     * @tc.desc   testing SetSystemMaterial for customDialog with ARKUI_IMMERSIVE_STYLE_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterial002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterial002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterial003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIAL_0300
     * @tc.desc   testing SetSystemMaterial for customDialog with null handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomDialogSetSystemMaterial003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterial003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterial004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIAL_0400
     * @tc.desc   testing SetSystemMaterial for customDialog with null material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomDialogSetSystemMaterial004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterial004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIALINOPTIONS_0100
     * @tc.desc   testing SetSystemMaterialInOptions with ARKUI_IMMERSIVE_STYLE_ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterialInOptions001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIALINOPTIONS_0200
     * @tc.desc   testing SetSystemMaterialInOptions with ARKUI_IMMERSIVE_STYLE_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogSetSystemMaterialInOptions002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterialInOptions002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions003
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIALINOPTIONS_0300
     * @tc.desc   testing SetSystemMaterialInOptions with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomDialogSetSystemMaterialInOptions003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterialInOptions003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions004
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIALINOPTIONS_0400
     * @tc.desc   testing SetSystemMaterialInOptions with null material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomDialogSetSystemMaterialInOptions004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterialInOptions004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCustomDialogSetSystemMaterialInOptions005
     * @tc.number SUB_ARKUI_CAPI_CUSTOMDIALOG_SETSYSTEMMATERIALINOPTIONS_0500
     * @tc.desc   testing SetSystemMaterialInOptions with null material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCustomDialogSetSystemMaterialInOptions005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testCustomDialogSetSystemMaterialInOptions005()).assertEqual(0)
      done()
    })

  })
}