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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { abilityDelegatorRegistry, Driver, ON, Component, MatchPattern } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';
import { UtilsTest } from '../Util.test';

export default function ImmersiveStyleTest(): void {
  describe('ImmersiveStyleTest', () => {
    beforeAll(async () => {

      console.info("ImmersiveStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });
    beforeEach(async () => {

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveStyleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ImmersiveStyleTest state pages: " + JSON.stringify(pages));
        console.info("ImmersiveStyleTest state pages.name: " + pages.name);
        if (pages.name !== "ImmersiveStyleTest") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("ImmersiveStyleTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   ImmersiveStyleTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0100
     * @tc.desc   To test uiMaterial.ImmersiveStyle.ULTRA_THIN enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0100', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0100 START');
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('ultra_thin'));
      console.info('ImmersiveStyleTest_0100 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveStyleTest_0100 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0200
     * @tc.desc   To test uiMaterial.ImmersiveStyle.THIN enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0200', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0200 START');
      
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('thin'));
      console.info('ImmersiveStyleTest_0200 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveStyleTest_0200 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0300
     * @tc.desc   To test uiMaterial.ImmersiveStyle.REGULAR enum value equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0300', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0300 START');
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);

      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('regular'));
      console.info('ImmersiveStyleTest_0300 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveStyleTest_0300 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0400
     * @tc.desc   To test uiMaterial.ImmersiveStyle.THICK enum value equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0400', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0400 START');

      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);

      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('thick'));
      console.info('ImmersiveStyleTest_0400 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveStyleTest_0400 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0500
     * @tc.desc   To test uiMaterial.ImmersiveStyle.ULTRA_THICK enum value equals 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0500', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0500 START');
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);

      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('ultra_thick'));
      console.info('ImmersiveStyleTest_0500 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveStyleTest_0500 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0600
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0600
     * @tc.desc   To test ImmersiveMaterial constructor with different styles returns instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0600', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0600 START');

      let material1 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN });
      expect(material1 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with ULTRA_THIN created');

      let material2 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THIN });
      expect(material2 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with THIN created');

      let material3 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.REGULAR });
      expect(material3 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with REGULAR created');

      let material4 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK });
      expect(material4 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with THICK created');

      let material5 = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THICK });
      expect(material5 instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0600 ImmersiveMaterial with ULTRA_THICK created');

      console.info('ImmersiveStyleTest_0600 END');
    });

    /**
     * @tc.name   ImmersiveStyleTest_0700
     * @tc.number SUB_ARKUI_API_ImmersiveStyleTest_0700
     * @tc.desc   To test ImmersiveMaterial constructor without style parameter returns instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveStyleTest_0700', Level.LEVEL2, async () => {

      console.info('ImmersiveStyleTest_0700 START');

      let material = new uiMaterial.ImmersiveMaterial();
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0700 ImmersiveMaterial without style created');

      let materialWithOptions = new uiMaterial.ImmersiveMaterial({});
      expect(materialWithOptions instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ImmersiveStyleTest_0700 ImmersiveMaterial with empty options created');

      console.info('ImmersiveStyleTest_0700 END');
    });
  })
}