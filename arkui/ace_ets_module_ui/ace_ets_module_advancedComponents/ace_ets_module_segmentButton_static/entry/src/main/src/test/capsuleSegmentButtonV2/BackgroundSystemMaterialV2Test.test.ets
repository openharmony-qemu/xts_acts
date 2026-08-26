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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import uiMaterial from '@ohos.arkui.uiMaterial';

export default function BackgroundSystemMaterialV2Test() {
  describe('BackgroundSystemMaterialV2Test', () => {

    beforeEach(async (): Promise<void> => {
      console.info("BackgroundSystemMaterialV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/capsuleSegmentButtonV2/BackgroundSystemMaterialV2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BackgroundSystemMaterialV2 state pages:" + JSON.stringify(pages));
        if (!("PopupDirection" == pages.name)) {
          console.info("get BackgroundSystemMaterialV2 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push BackgroundSystemMaterialV2 page error:" + err);
        expect().assertFail();
      }
      console.info("BackgroundSystemMaterialV2 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BackgroundSystemMaterialV2Test afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info('BackgroundSystemMaterialV2 after each called');
    });

    /**
     * @tc.name   BackgroundSystemMaterialV2Test_static_0100
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialV2Test_static_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialV2Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.log("BackgroundSystemMaterialV2Test_static_0100", "START");
        try {
          expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
          expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
          await CommonFunc.sleep(1000);
          console.log("BackgroundSystemMaterialV2Test_static_0100", "END");
        } catch (error) {
          console.error('[BackgroundSystemMaterialV2Test_static_0100] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   BackgroundSystemMaterialV2Test_static_0200
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialV2Test_static_0200
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialV2Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.log("BackgroundSystemMaterialV2Test_static_0200", "START");
        try {
          expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
          expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
          expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
          await CommonFunc.sleep(1000);
          console.log("BackgroundSystemMaterialV2Test_static_0200", "END");
        } catch (error) {
          console.error('[BackgroundSystemMaterialV2Test_static_0200] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   BackgroundSystemMaterialV2Test_static_0300
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialV2Test_static_0300
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialV2Test_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.log("BackgroundSystemMaterialV2Test_static_0300", "START");
        try {
          let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[2];
          console.log("BackgroundSystemMaterialV2Test_static_0300", JSON.stringify(tabSegmentButton))
          expect(tabSegmentButton.getElement('$attrs')).not().assertNull();
          await CommonFunc.sleep(1000);
          console.log("BackgroundSystemMaterialV2Test_static_0300", "END");
        } catch (error) {
          console.error('[BackgroundSystemMaterialV2Test_static_0300] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   BackgroundSystemMaterialV2Test_static_0400
     * @tc.number SUB_ARKUI_API_BackgroundSystemMaterialV2Test_static_0400
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackgroundSystemMaterialV2Test_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.log("BackgroundSystemMaterialV2Test_static_0400", "START");
        try {
          let capsuleSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[6];
          console.log("BackgroundSystemMaterialV2Test_static_0400", JSON.stringify(capsuleSegmentButton))
          expect(capsuleSegmentButton.getElement('$attrs')).not().assertNull();
          await CommonFunc.sleep(1000);
          console.log("BackgroundSystemMaterialV2Test_static_0400", "END");
        } catch (error) {
          console.error('[BackgroundSystemMaterialV2Test_static_0400] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
      });

  })
}