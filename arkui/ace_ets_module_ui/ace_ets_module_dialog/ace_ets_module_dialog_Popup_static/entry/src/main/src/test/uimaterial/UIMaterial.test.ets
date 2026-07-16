'use static';
/**
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

import router from '@ohos.router';
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';
import { UtilsTest } from '../Util.test';

export default function UIMaterialTest(): void {
  describe('UIMaterialTest', () => {
    beforeAll(async () => {

      console.info("UIMaterialTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });
    beforeEach(async () => {

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/UIMaterialTestPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("UIMaterialTest state pages: " + JSON.stringify(pages));
        console.info("UIMaterialTest state pages.name: " + pages.name);
        if (pages.name !== "UIMaterialTestPage") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("UIMaterialTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   MaterialTypeTest_0100
     * @tc.number SUB_ARKUI_API_MaterialTypeTest_0100
     * @tc.desc   To test uiMaterial.MaterialType.IMMERSIVE enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialTypeTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialTypeTest_0100 START');
      expect(uiMaterial.MaterialType.IMMERSIVE).assertEqual(2);
      console.info('MaterialTypeTest_0100 MaterialType.IMMERSIVE = ' + uiMaterial.MaterialType.IMMERSIVE);
      console.info('MaterialTypeTest_0100 END');
    });

    /**
     * @tc.name   MaterialStateTest_0100
     * @tc.number SUB_ARKUI_API_MaterialStateTest_0100
     * @tc.desc   To test uiMaterial.MaterialState.DEFAULT enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialStateTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialStateTest_0100 START');
      expect(uiMaterial.MaterialState.DEFAULT).assertEqual(0);
      console.info('MaterialStateTest_0100 MaterialState.DEFAULT = ' + uiMaterial.MaterialState.DEFAULT);
      console.info('MaterialStateTest_0100 END');
    });

    /**
     * @tc.name   MaterialStateTest_0200
     * @tc.number SUB_ARKUI_API_MaterialStateTest_0200
     * @tc.desc   To test uiMaterial.MaterialState.ENABLE enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialStateTest_0200', Level.LEVEL2, async () => {

      console.info('MaterialStateTest_0200 START');
      expect(uiMaterial.MaterialState.ENABLE).assertEqual(1);
      console.info('MaterialStateTest_0200 MaterialState.ENABLE = ' + uiMaterial.MaterialState.ENABLE);
      console.info('MaterialStateTest_0200 END');
    });

    /**
     * @tc.name   MaterialStateTest_0300
     * @tc.number SUB_ARKUI_API_MaterialStateTest_0300
     * @tc.desc   To test uiMaterial.MaterialState.DISABLE enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialStateTest_0300', Level.LEVEL2, async () => {

      console.info('MaterialStateTest_0300 START');
      expect(uiMaterial.MaterialState.DISABLE).assertEqual(2);
      console.info('MaterialStateTest_0300 MaterialState.DISABLE = ' + uiMaterial.MaterialState.DISABLE);
      console.info('MaterialStateTest_0300 END');
    });

    /**
     * @tc.name   getMaterialInfoTest_0100
     * @tc.number SUB_ARKUI_API_getMaterialInfoTest_0100
     * @tc.desc   To test uiMaterial.getMaterialInfo() returns MaterialInfo object with valid state and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMaterialInfoTest_0100', Level.LEVEL2, async () => {

      console.info('getMaterialInfoTest_0100 START');
      let materialInfo: uiMaterial.MaterialInfo = uiMaterial.getMaterialInfo();
      console.info('getMaterialInfoTest_0100 materialInfo.state = ' + materialInfo.state);
      console.info('getMaterialInfoTest_0100 materialInfo.type = ' + materialInfo.type);
      expect(materialInfo.state).assertLargerOrEqual(0);
      expect(materialInfo.state).assertLessOrEqual(2);
      expect(materialInfo.type).assertLargerOrEqual(0);
      console.info('getMaterialInfoTest_0100 END');
    });

    /**
     * @tc.name   MaterialInfoStateTest_0100
     * @tc.number SUB_ARKUI_API_MaterialInfoStateTest_0100
     * @tc.desc   To test MaterialInfo.state property displayed on page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialInfoStateTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialInfoStateTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let textState = await driver.findComponent(ON.id('text_material_info_state'));
      let stateText = await (textState?.getText() as Promise<string>);
      console.info('MaterialInfoStateTest_0100 stateText: ' + stateText);
      expect(stateText.indexOf('MaterialInfo.state')).assertLarger(-1);

      console.info('MaterialInfoStateTest_0100 END');
    });

    /**
     * @tc.name   MaterialInfoTypeTest_0100
     * @tc.number SUB_ARKUI_API_MaterialInfoTypeTest_0100
     * @tc.desc   To test MaterialInfo.type property displayed on page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialInfoTypeTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialInfoTypeTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let textType = await driver.findComponent(ON.id('text_material_info_type'));
      let typeText = await (textType?.getText() as Promise<string>);
      console.info('MaterialInfoTypeTest_0100 typeText: ' + typeText);
      expect(typeText.indexOf('MaterialInfo.type')).assertLarger(-1);

      console.info('MaterialInfoTypeTest_0100 END');
    });

    /**
     * @tc.name   MaterialEmptyTest_0100
     * @tc.number SUB_ARKUI_API_MaterialEmptyTest_0100
     * @tc.desc   To test uiMaterial.Material.empty returns valid Material object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialEmptyTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialEmptyTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let emptyMaterial = uiMaterial.Material.empty;
      console.info('MaterialEmptyTest_0100 Material.empty: ' + JSON.stringify(emptyMaterial));
      expect(emptyMaterial).not().assertUndefined();
      console.info('MaterialEmptyTest_0100 END');
    });

    /**
     * @tc.name   MaterialTypeDisplayTest_0100
     * @tc.number SUB_ARKUI_API_MaterialTypeDisplayTest_0100
     * @tc.desc   To test MaterialType.IMMERSIVE displayed correctly on page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialTypeDisplayTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialTypeDisplayTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let textImmersive = await driver.findComponent(ON.id('text_material_type_immersive'));
      let immersiveText = await (textImmersive?.getText() as Promise<string>);
      console.info('MaterialTypeDisplayTest_0100 immersiveText: ' + immersiveText);
      expect(immersiveText).assertEqual('MaterialType.IMMERSIVE = 2');

      console.info('MaterialTypeDisplayTest_0100 END');
    });

    /**
     * @tc.name   MaterialStateDisplayTest_0100
     * @tc.number SUB_ARKUI_API_MaterialStateDisplayTest_0100
     * @tc.desc   To test MaterialState.DEFAULT/ENABLE/DISABLE displayed correctly on page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MaterialStateDisplayTest_0100', Level.LEVEL2, async () => {

      console.info('MaterialStateDisplayTest_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let textDefault = await driver.findComponent(ON.id('text_material_state_default'));
      let defaultText = await (textDefault?.getText() as Promise<string>);
      console.info('MaterialStateDisplayTest_0100 defaultText: ' + defaultText);
      expect(defaultText).assertEqual('MaterialState.DEFAULT = 0');

      let textEnable = await driver.findComponent(ON.id('text_material_state_enable'));
      let enableText = await (textEnable?.getText() as Promise<string>);
      console.info('MaterialStateDisplayTest_0100 enableText: ' + enableText);
      expect(enableText).assertEqual('MaterialState.ENABLE = 1');

      let textDisable = await driver.findComponent(ON.id('text_material_state_disable'));
      let disableText = await (textDisable?.getText() as Promise<string>);
      console.info('MaterialStateDisplayTest_0100 disableText: ' + disableText);
      expect(disableText).assertEqual('MaterialState.DISABLE = 2');

      console.info('MaterialStateDisplayTest_0100 END');
    });
  })
}