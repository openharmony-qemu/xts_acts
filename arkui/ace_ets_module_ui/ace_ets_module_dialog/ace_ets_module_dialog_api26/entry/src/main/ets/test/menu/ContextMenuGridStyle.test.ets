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


import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ContextMenuGridStyle() {
  describe('ContextMenuGridStyle', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] ContextMenuGridStyle beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menu/ContextMenuGridStyle'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'ContextMenuGridStyle') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ContextMenuGridStyle error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] ContextMenuGridStyle afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100
     * @tc.desc gridStyle position TOP count/horizontalSize
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_top'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('T_Copy'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0200
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0200
     * @tc.desc gridStyle position BOTTOM MenuGridPosition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_bottom'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('B_Paste'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0300
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0300
     * @tc.desc MenuGridStyleOptions count=2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_count2'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('C2_Cut'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0400
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0400
     * @tc.desc MenuGridStyleOptions count=4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_count4'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('C4_Share'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0500
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0500
     * @tc.desc MenuGridStyleOptions horizontalSize=2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_hsize'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('H_Select'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0600
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0600
     * @tc.desc gridStyle combined with placement
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_grid_combined'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('M_Favorite'));
      expect(node !== null).assertTrue();
      let item = await driver.findComponent(ON.text('M_Favorite'));
      await item.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('grid_last_action'));
      let txt = await label.getText();
      expect(txt === 'last=M_Favorite').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0600 END');
      done();
    });

  });
}
