'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function BaseDialogOptionsSystemMaterialTest(): void {
  describe('BaseDialogOptionsSystemMaterialTest', () => {
    beforeAll(async () => {

      console.info("BaseDialogOptionsSystemMaterialTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async () => {

      console.info("BaseDialogOptionsSystemMaterialTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogSystemMaterial/BaseDialogOptionsSystemMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BaseDialogOptionsSystemMaterialTest state pages:" + JSON.stringify(pages));
        if (!("PopupIndex" == pages.name)) {
          console.info("get BaseDialogOptionsSystemMaterialTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push BaseDialogOptionsSystemMaterialTest page error:" + err);
      }
      console.info("BaseDialogOptionsSystemMaterialTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("BaseDialogOptionsSystemMaterialTest after each called");
    });

    /**
     * @tc.name   BaseDialogOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_BaseDialogOptionsSystemMaterial_0100
     * @tc.desc   To test BaseDialogOptions systemMaterial property with undefined parameter
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BaseDialogOptionsSystemMaterial_0100', Level.LEVEL2, async () => {

      console.info('BaseDialogOptionsSystemMaterial_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await ((await driver.findComponent(ON.id('PLACEHOLDER'))) as Component).click();
      await CommonFunc.sleep(1000);
      let titleText = await driver.findComponent(ON.text('CustomDialog Content'));
      let aaa = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement('material')
        .getString("type")
      expect(aaa).assertEqual('MaterialType.NONE');
      console.info('CustomPopupOptionsSystemMaterial_0100 Popup Undefined is visible');

      await CommonFunc.sleep(500);
      console.info('BaseDialogOptionsSystemMaterial_0100 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await ((await driver.findComponent(ON.id('PLACEHOLDER'))) as Component).click();
      await CommonFunc.sleep(1000);
      console.info('BaseDialogOptionsSystemMaterial_0100 END');
    });
  });
}
