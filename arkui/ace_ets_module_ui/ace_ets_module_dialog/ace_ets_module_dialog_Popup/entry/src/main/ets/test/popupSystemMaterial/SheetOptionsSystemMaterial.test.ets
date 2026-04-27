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

export default function SheetOptionsSystemMaterial() {
  describe('SheetOptionsSystemMaterial', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/systemMaterial/SheetOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SheetOptionsSystemMaterial state success ' + JSON.stringify(pages));
        if (!('SheetOptionsSystemMaterial' == pages.name)) {
          console.info('get SheetOptionsSystemMaterial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push SheetOptionsSystemMaterial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SheetOptionsSystemMaterial page error ' + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      try {
        let closeButton = await driver.findComponent(ON.text('Close Sheet'));
        await closeButton.click();
      } catch (e) {
        console.info('Sheet already closed');
      }
      await CommonFunc.sleep(500);
      console.info("SheetOptionsSystemMaterial after each called");
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0100
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0100
     * @tc.desc   To test SheetOptions systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('undefined');
      console.info('SheetOptionsSystemMaterial_0100 Sheet Undefined is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0200
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0200
     * @tc.desc   To test SheetOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0200', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('undefined');
      console.info('SheetOptionsSystemMaterial_0200 Sheet HDS THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0300
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0300
     * @tc.desc   To test SheetOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0300', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      console.info('SheetOptionsSystemMaterial_0300 Sheet SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0400
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0400
     * @tc.desc   To test SheetOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0400', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.style));
      expect(JSON.parse(date).$attrs.systemMaterial.material.style).assertEqual('ImmersiveStyle.THICK');
      console.info('SheetOptionsSystemMaterial_0400 Sheet Immersive THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0500
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0500
     * @tc.desc   To test SheetOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0500', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.style));
      expect(JSON.parse(date).$attrs.systemMaterial.material.style).assertEqual('ImmersiveStyle.ULTRA_THIN');
      console.info('SheetOptionsSystemMaterial_0500 Sheet Immersive ULTRA_THIN is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   SheetOptionsSystemMaterial_0600
     * @tc.number SUB_ACE_SheetOptionsSystemMaterial_0600
     * @tc.desc   To test SheetOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SheetOptionsSystemMaterial_0600', Level.LEVEL0, async (done: Function) => {
      console.info('SheetOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('none'));
      await button.click();
      await CommonFunc.sleep(1000);

      let sheetContent = await driver.findComponent(ON.text('Sheet Content'));
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let sheet: ESObject = obj.$children[1];
      let date = JSON.stringify(obj.$children[1].$children[0]);
      console.info('obj' + JSON.stringify(JSON.parse(date).$attrs.systemMaterial.material.type));
      expect(JSON.parse(date).$attrs.systemMaterial.material.type).assertEqual('MaterialType.NONE');
      console.info('SheetOptionsSystemMaterial_0600 Sheet NONE is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close Sheet'));
      await closeButton.click();
      await CommonFunc.sleep(1000);
      console.info('SheetOptionsSystemMaterial_0600 END');
      done();
    });
  })
}