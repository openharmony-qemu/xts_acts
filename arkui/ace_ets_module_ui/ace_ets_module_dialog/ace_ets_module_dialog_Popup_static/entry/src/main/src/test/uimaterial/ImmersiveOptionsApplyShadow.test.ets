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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';

export default function ImmersiveOptionsApplyShadowTest(): void {
  describe('ImmersiveOptionsApplyShadowTest', () => {
    beforeEach(async () => {

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsApplyShadow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ImmersiveOptionsApplyShadowTest state pages: " + JSON.stringify(pages));
        console.info("ImmersiveOptionsApplyShadowTest state pages.name: " + pages.name);
        if (pages.name !== "ImmersiveOptionsApplyShadow") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("ImmersiveOptionsApplyShadowTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0100
     * @tc.desc   To test ImmersiveOptions.applyShadow with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsApplyShadowTest_0100', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsApplyShadowTest_0100 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('undefined'));
      console.info('ImmersiveOptionsApplyShadowTest_0100 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsApplyShadowTest_0100 END');
    });

    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0200
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0200
     * @tc.desc   To test ImmersiveOptions.applyShadow with true parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsApplyShadowTest_0200', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsApplyShadowTest_0200 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('true'));
      console.info('ImmersiveOptionsApplyShadowTest_0200 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');
      console.info('ImmersiveOptionsApplyShadowTest_0200 END');
    });

    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0300
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0300
     * @tc.desc   To test ImmersiveOptions.applyShadow with false parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsApplyShadowTest_0300', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsApplyShadowTest_0300 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('false'));
      console.info('ImmersiveOptionsApplyShadowTest_0300 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsApplyShadowTest_0300 END');
    });

    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0400
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0400
     * @tc.desc   To test ImmersiveMaterial without applyShadow parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsApplyShadowTest_0400', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsApplyShadowTest_0400 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('default'));
      console.info('ImmersiveOptionsApplyShadowTest_0400 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsApplyShadowTest_0400 END');
    });

    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0500
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0500
     * @tc.desc   To test ImmersiveMaterial with empty options and no options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ImmersiveOptionsApplyShadowTest_0500', Level.LEVEL2, async () => {

      console.info('ImmersiveOptionsApplyShadowTest_0500 START');
      let strJson = JSON.parseJsonElement(inspector.getInspectorByKey('empty'));
      console.info('ImmersiveOptionsApplyShadowTest_0500 strJson: ' + strJson);
      expect(strJson.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type'))
        .assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsApplyShadowTest_0500 END');
    });
  })
}