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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function ShowDialogOptionsSystemMaterial() {
  describe('ShowDialogOptionsSystemMaterial', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemMaterial/ShowDialogOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ShowDialogOptionsSystemMaterial state success ' + JSON.stringify(pages));
        if (!('ShowDialogOptionsSystemMaterial' == pages.name)) {
          console.info('get ShowDialogOptionsSystemMaterial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push ShowDialogOptionsSystemMaterial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ShowDialogOptionsSystemMaterial page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0100
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0100
     * @tc.desc   To test ShowDialogOptions systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog Undefined'));
      // expect(titleText).not().assertUndefined();
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let dialog: ESObject = obj.$children[1]
      let date = JSON.stringify(obj.$children[1].$children[0])
      // JSON.parse(date).$attrs.systemMaterial.material.type
      console.info('obj'+JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type))
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('undefined');
      // obj"MaterialType.SEMI_TRANSPARENT"
      console.info('ShowDialogOptionsSystemMaterial_0100 Dialog Undefined is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0200
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0200
     * @tc.desc   To test ShowDialogOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog HDS THICK'));
      expect(titleText).not().assertUndefined();
      console.info('ShowDialogOptionsSystemMaterial_0200 Dialog HDS THICK is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0300
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0300
     * @tc.desc   To test ShowDialogOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog SEMI_TRANSPARENT'));
      expect(titleText).not().assertUndefined();
      console.info('ShowDialogOptionsSystemMaterial_0300 Dialog SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0400
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0400
     * @tc.desc   To test ShowDialogOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog Immersive THICK'));
      expect(titleText).not().assertUndefined();
      console.info('ShowDialogOptionsSystemMaterial_0400 Dialog Immersive THICK is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0500
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0500
     * @tc.desc   To test ShowDialogOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog Immersive ULTRA_THIN'));
      expect(titleText).not().assertUndefined();
      console.info('ShowDialogOptionsSystemMaterial_0500 Dialog Immersive ULTRA_THIN is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   ShowDialogOptionsSystemMaterial_0600
     * @tc.number SUB_ACE_ShowDialogOptionsSystemMaterial_0600
     * @tc.desc   To test ShowDialogOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowDialogOptionsSystemMaterial_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('ShowDialogOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('none'));
      await button.click();
      await CommonFunc.sleep(1000);

      let titleText = await driver.findComponent(ON.text('ShowDialog NONE'));
      expect(titleText).not().assertUndefined();
      console.info('ShowDialogOptionsSystemMaterial_0600 Dialog NONE is visible');

      await CommonFunc.sleep(500);
      let okButton = await driver.findComponent(ON.text('OK'));
      await okButton.click();
      await CommonFunc.sleep(1000);
      console.info('ShowDialogOptionsSystemMaterial_0600 END');
      done();
    });
  })
}