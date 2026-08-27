'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { uiMaterial } from '@kit.ArkUI';

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== 'CustomDialogSystemMaterial') {
    routerInstance.replaceUrl({ url: 'MainAbility/pages/CustomDialog/CustomDialogSystemMaterial' });
    await CommonFunc.sleep(1000);
  }
}

export default function CustomDialogSystemMaterialTest(): void {
  describe('CustomDialogSystemMaterialTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('CustomDialogSystemMaterialTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('CustomDialogSystemMaterialTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogSystemMaterial_0100
     * @tc.number SUB_ACE_API26_CustomDialogSystemMaterial_0100
     * @tc.desc   CustomDialogController systemMaterial undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogSystemMaterial_0100', Level.LEVEL0, async () => {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('open_undefined'));
        await btn?.click();
        await CommonFunc.sleep(1000);
        let txt = await driver.findComponent(ON.text('undefined_material'));
        expect(!!txt).assertEqual(true);
        let closeBtn = await driver.findComponent(ON.id('close_dialog_btn'));
        await closeBtn?.click();
      });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogSystemMaterial_0200
     * @tc.number SUB_ACE_API26_CustomDialogSystemMaterial_0200
     * @tc.desc   CustomDialogController systemMaterial Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogSystemMaterial_0200', Level.LEVEL0, async () => {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('open_material'));
        await btn?.click();
        await CommonFunc.sleep(1000);
        let txt = await driver.findComponent(ON.text('Material_SEMI'));
        expect(!!txt).assertEqual(true);
        let closeBtn = await driver.findComponent(ON.id('close_dialog_btn'));
        await closeBtn?.click();
      });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogSystemMaterial_0300
     * @tc.number SUB_ACE_API26_CustomDialogSystemMaterial_0300
     * @tc.desc   CustomDialogController systemMaterial ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogSystemMaterial_0300', Level.LEVEL0, async () => {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('open_immersive'));
        await btn?.click();
        await CommonFunc.sleep(1000);
        let txt = await driver.findComponent(ON.text('Immersive_THICK'));
        expect(!!txt).assertEqual(true);
        let mat = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK });
        expect(!!mat).assertEqual(true);
        let closeBtn = await driver.findComponent(ON.id('close_dialog_btn'));
        await closeBtn!.click();
      });
  });
}
