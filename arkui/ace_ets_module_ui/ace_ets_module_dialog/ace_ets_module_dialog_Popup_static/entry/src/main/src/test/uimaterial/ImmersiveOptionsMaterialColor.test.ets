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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, Component, MatchPattern } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';
import { UtilsTest } from '../Util.test';

export default function ImmersiveOptionsMaterialColorTest(): void {
  describe('ImmersiveOptionsMaterialColorTest', () => {
    beforeAll(async () => {

      console.info("ImmersiveOptionsMaterialColorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });
    beforeEach(async () => {

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsMaterialColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ImmersiveOptionsMaterialColorTest state pages: " + JSON.stringify(pages));
        console.info("ImmersiveOptionsMaterialColorTest state pages.name: " + pages.name);
        if (pages.name !== "ImmersiveOptionsMaterialColor") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("ImmersiveOptionsMaterialColorTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0100
     * @tc.desc   To test ImmersiveOptions.materialColor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0100', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0100 START');
    
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('undefined'));
      console.info('ImmersiveOptionsMaterialColorTest_0100 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0100 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0200
     * @tc.desc   To test ImmersiveOptions.materialColor with Color.Transparent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0200', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0200 START');
      
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('transparent'));
      console.info('ImmersiveOptionsMaterialColorTest_0200 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0200 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0300
     * @tc.desc   To test ImmersiveOptions.materialColor with string '#80FF0000' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0300', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0300 START');
     
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('string_red'));
      console.info('ImmersiveOptionsMaterialColorTest_0300 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0300 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0400
     * @tc.desc   To test ImmersiveOptions.materialColor with string 'rgba(0,255,0,0.5)' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0400', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0400 START');
      
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('string_rgba'));
      console.info('ImmersiveOptionsMaterialColorTest_0400 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0400 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0500
     * @tc.desc   To test ImmersiveOptions.materialColor with number 0x800000FF parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0500', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0500 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('number_color'));
      console.info('ImmersiveOptionsMaterialColorTest_0500 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0500 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0600
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0600
     * @tc.desc   To test ImmersiveOptions.materialColor with Color.Blue parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0600', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0600 START');
      
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('color_enum'));
      console.info('ImmersiveOptionsMaterialColorTest_0600 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0600 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0700
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0700
     * @tc.desc   To test ImmersiveOptions.materialColor with string '#80FFFFFF' parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0700', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0700 START');

      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('color_white'));
      console.info('ImmersiveOptionsMaterialColorTest_0700 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0700 END');
    });

    /**
     * @tc.name   ImmersiveOptionsMaterialColorTest_0800
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsMaterialColorTest_0800
     * @tc.desc   To test ImmersiveMaterial without materialColor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsMaterialColorTest_0800', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsMaterialColorTest_0800 START');
      
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('default_info'));
      console.info('ImmersiveOptionsMaterialColorTest_0800 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsMaterialColorTest_0800 END');
    });
  })
}