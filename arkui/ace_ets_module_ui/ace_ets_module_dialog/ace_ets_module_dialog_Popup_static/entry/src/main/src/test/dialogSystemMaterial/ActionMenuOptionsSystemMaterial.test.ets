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


import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function ActionMenuOptionsSystemMaterialTest(): void {
  describe('ActionMenuOptionsSystemMaterialTest', () => {

    beforeEach(async () => {

      console.info("ActionMenuOptionsSystemMaterialTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogSystemMaterial/ActionMenuOptionsSystemMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActionMenuOptionsSystemMaterialTest state pages:" + JSON.stringify(pages));
        if (!("PopupIndex" == pages.name)) {
          console.info("get ActionMenuOptionsSystemMaterialTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ActionMenuOptionsSystemMaterialTest page error:" + err);
      }
      console.info("ActionMenuOptionsSystemMaterialTest beforeEach end");
    });

    afterEach(async () => {
       try {
         await Utils.sleep(SLEEP_TIME);
       } catch (err) {
         console.info('sleep err: ' + JSON.stringify(err));
       }
      console.info("ActionMenuOptionsSystemMaterialTest after each called");
    });

    /**
     * @tc.name   ActionMenuOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_AcActionMenuOptionsSystemMaterial_0100
     * @tc.desc   To test ActionMenuOptions systemMaterial property with hdsMaterial.Material undefined
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActionMenuOptionsSystemMaterial_0100', Level.LEVEL2, async () => {

		console.info('ActionMenuOptionsSystemMaterial_0100 START');
		let driver: Driver = Driver.create();
		 try {
		   await CommonFunc.sleep(1000);
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		let button = await driver.findComponent(ON.id('undefined'));
		 try {
		   await ((await driver.findComponent(ON.id('PLACEHOLDER'))) as Component).click();
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		 try {
		   await CommonFunc.sleep(1000);
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		let titleText = await driver.findComponent(ON.text('ActionMenu Undefined'));
	    let aaa = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
		.getElement("systemMaterial")
		.getElement('material')
        .getString("type")
      expect(aaa).assertEqual('MaterialType.NONE');
      console.info('CustomPopupOptionsSystemMaterial_0100 Popup Undefined is visible');

       try {
         await CommonFunc.sleep(500);
       } catch (err) {
         console.info('await err: ' + JSON.stringify(err));
       }
		console.info('ActionMenuOptionsSystemMaterial_0100 Menu title is visible');

		 try {
		   await CommonFunc.sleep(500);
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		let closeButton = await driver.findComponent(ON.text('Button1'));
		 try {
		   await ((await driver.findComponent(ON.id('PLACEHOLDER'))) as Component).click();
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		 try {
		   await CommonFunc.sleep(1000);
		 } catch (err) {
		   console.info('await err: ' + JSON.stringify(err));
		 }
		console.info('ActionMenuOptionsSystemMaterial_0100 END');
    });
  });
}