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


import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function MenuItemSubMenuBuilder() {
  describe('MenuItemSubMenuBuilder', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] MenuItemSubMenuBuilder beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('MenuItemSubMenuBuilder', 'MainAbility/pages/menu/MenuItemSubMenuBuilder');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] MenuItemSubMenuBuilder afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] MenuItemSubMenuBuilder afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100
     * @tc.name SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100
     * @tc.desc subMenuBuilder menu opens and shows parent item
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_submenu_open'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('WithSubMenu'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0200
     * @tc.name SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0200
     * @tc.desc subMenuBuilder shows alternate submenu host item
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_submenu_open'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('WithAltSubMenu'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0300
     * @tc.name SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0300
     * @tc.desc subMenuBuilder long press parent to expand SubCopy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_submenu_open'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('WithSubMenu'));
      expect(node !== null).assertTrue();
      let parent = await driver.findComponent(ON.text('WithSubMenu'));
      await parent.longClick();
      await CommonFunc.sleep(200);
      let sub = await driver.findComponent(ON.text('SubCopy'));
      expect(sub !== null).assertTrue();
      await sub.click();
      await CommonFunc.sleep(200);
      let label = await driver.findComponent(ON.id('submenu_last_action'));
      let txt = await label.getText();
      expect(txt === 'last=SubCopy').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0400
     * @tc.name SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0400
     * @tc.desc plain MenuItem without subMenuBuilder still visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_submenu_open'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('PlainItem'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0400 END');
      done();
    });

  });
}
