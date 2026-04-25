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


export default function ActionMenuOptionsSystemMaterial() {
  describe('ActionMenuOptionsSystemMaterial', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogSystemMaterial/ActionMenuOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ActionMenuOptionsSystemMaterial state success ' + JSON.stringify(pages));
        if (!('ActionMenuOptionsSystemMaterial' == pages.name)) {
          console.info('get ActionMenuOptionsSystemMaterial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(1000);
          console.info('push ActionMenuOptionsSystemMaterial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ActionMenuOptionsSystemMaterial page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      try {
        let closeButton = await driver.findComponent(ON.text('Button1'));
        await closeButton.click();
      } catch (e) {
        console.info('Menu already closed');
      }
      await CommonFunc.sleep(500);
      console.info("ActionMenuOptionsSystemMaterial after each called");
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0100
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_0100
     * @tc.desc   To test ActionMenuOptions systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu Undefined'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0100 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0200
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_0200
     * @tc.desc   To test ActionMenuOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu HDS THICK'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0200 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0300
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_0300
     * @tc.desc   To test ActionMenuOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu SEMI_TRANSPARENT'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.SEMI_TRANSPARENT');

      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0300 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0400
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_004
     * @tc.desc   To test ActionMenuOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu Immersive THICK'));
      

      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0400 Menu title is visible');
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.SEMI_TRANSPARENT');
      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0500
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_0500
     * @tc.desc   To test ActionMenuOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0500', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu Immersive ULTRA_THIN'));
      expect(titleText).not().assertUndefined();
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0500 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ActionMenuOptionsSystemMaterial_0600
     * @tc.number SUB_ACE_ActionMenuOptionsSystemMaterial_0600
     * @tc.desc   To test ActionMenuOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ActionMenuOptionsSystemMaterial_0600', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('none'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ActionMenu NONE'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type)).assertEqual('MaterialType.NONE');
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0600 Menu title is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Button1'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ActionMenuOptionsSystemMaterial_0600 END');
      done();
    });
  })
}