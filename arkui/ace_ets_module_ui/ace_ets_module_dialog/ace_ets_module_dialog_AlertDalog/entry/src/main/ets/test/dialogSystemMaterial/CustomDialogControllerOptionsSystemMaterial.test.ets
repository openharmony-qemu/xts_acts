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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomDialogControllerOptionsSystemMaterial() {
  describe('CustomDialogControllerOptionsSystemMaterial', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemMaterial/CustomDialogControllerOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CustomDialogControllerOptionsSystemMaterial state success ' + JSON.stringify(pages));
        if (!('CustomDialogControllerOptionsSystemMaterial' == pages.name)) {
          console.info('get CustomDialogControllerOptionsSystemMaterial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push CustomDialogControllerOptionsSystemMaterial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomDialogControllerOptionsSystemMaterial page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      try {
        let closeButton = await driver.findComponent(ON.text('Close'));
        await closeButton.click();
      } catch (e) {
        console.info('Dialog already closed');
      }
      await CommonFunc.sleep(500);
      console.info("CustomDialogControllerOptionsSystemMaterial after each called");
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001 Dialog Undefined is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_001 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002 Dialog HDS THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_002 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003 Dialog SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_003 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.style));
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004 Dialog Immersive THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_004 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.style));
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005 Dialog Immersive ULTRA_THIN is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_005 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006
     * @tc.number SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006
     * @tc.desc   To test CustomDialogControllerOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('none'));
      await button.click();
      await CommonFunc.sleep(1000);

      let dialogText = await driver.findComponent(ON.text('CustomDialog Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006 Dialog NONE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_CustomDialogControllerOptionsSystemMaterial_006 END');
      done();
    });
  })
}