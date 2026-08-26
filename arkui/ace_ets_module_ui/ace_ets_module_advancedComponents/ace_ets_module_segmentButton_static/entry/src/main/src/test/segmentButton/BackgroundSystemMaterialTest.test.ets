'use static';

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

import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, afterEach } from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import uiMaterial from '@ohos.arkui.uiMaterial';

export default function BackgroundSystemMaterialTest() {
  describe('BackgroundSystemMaterialTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("BackgroundSystemMaterialTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/BackgroundSystemMaterial",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("BackgroundSystemMaterial" == pages.name)) {
          console.info("get BackgroundSystemMaterial pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BackgroundSystemMaterial page error:" + err);
      }
      console.info("BackgroundSystemMaterial beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundSystemMaterialTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("BackgroundSystemMaterialTest after each called");
    });

    /**
     * @tc.name   BackgroundSystemMaterialTest_static_0100
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialTest_static_0100
     * @tc.desc   ArkUIAPI - ImmersiveStyle THIN and ULTRA_THIN enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[BackgroundSystemMaterialTest_static_0100] START');
        try {
          expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
          expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
          await CommonFunc.sleep(1000);
          console.info('[BackgroundSystemMaterialTest_static_0100] END');
        } catch (error) {
          console.error('[BackgroundSystemMaterialTest_static_0100] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   BackgroundSystemMaterialTest_static_0200
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialTest_static_0200
     * @tc.desc   ArkUIAPI - ImmersiveStyle REGULAR, THICK and ULTRA_THICK enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[BackgroundSystemMaterialTest_static_0200] START');
        try {
          expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
          expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
          expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
          await CommonFunc.sleep(1000);
          console.info('[BackgroundSystemMaterialTest_static_0200] END');
        } catch (error) {
          console.error('[BackgroundSystemMaterialTest_static_0200] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   BackgroundSystemMaterialTest_static_0300
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialTest_static_0300
     * @tc.desc   ArkUIAPI - SegmentButtonOptions.tab with THIN material
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('[BackgroundSystemMaterialTest_static_0300] START');
        try {
          let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray('$children')[0]
            .getArray('$children')[0]
            .getArray('$children')[2];
          console.info("[BackgroundSystemMaterialTest_static_0300] component obj is: " + JSON.stringify(obj));
          expect(obj.getElement('$attrs')).not().assertNull();
          await CommonFunc.sleep(1000);
          console.info('[BackgroundSystemMaterialTest_static_0300] END');
        } catch (error) {
          console.error('[BackgroundSystemMaterialTest_static_0300] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

  })
}