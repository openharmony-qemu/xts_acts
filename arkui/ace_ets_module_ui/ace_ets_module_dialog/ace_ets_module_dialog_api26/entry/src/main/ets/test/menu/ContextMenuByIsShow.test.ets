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

export default function ContextMenuByIsShow() {
  describe('ContextMenuByIsShow', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] ContextMenuByIsShow beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('ContextMenuByIsShow', 'MainAbility/pages/menu/ContextMenuByIsShow');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] ContextMenuByIsShow afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] ContextMenuByIsShow afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100
     * @tc.desc bindContextMenuByIsShow MenuElement toggle show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_isshow_elements'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('IsShowA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200
     * @tc.desc bindContextMenuByIsShow CustomBuilder toggle show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_isshow_custom'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('CustomIsShowX'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(200);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300
     * @tc.desc bindContextMenuByIsShow item click updates lastAction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_isshow_elements'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('IsShowB'));
      expect(node !== null).assertTrue();
      let item = await driver.findComponent(ON.text('IsShowB'));
      await item.click();
      await CommonFunc.sleep(500);
      let label = await driver.findComponent(ON.id('isshow_last_action'));
      let txt = await label.getText();
      expect(txt === 'last=IsShowB').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400
     * @tc.desc bindContextMenuByIsShow dismiss by back then hide resets state
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400 START');
      let driver = await Driver.create();
      await DialogApi26TestHelper.openPageIfNeeded('ContextMenuByIsShow',
        'MainAbility/pages/menu/ContextMenuByIsShow');
      await CommonFunc.sleep(400);
      let btn = await driver.waitForComponent(ON.id('btn_isshow_elements'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      let node = await driver.waitForComponent(ON.text('IsShowC'), 5000);
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      // pressBack may leave page if menu already closed; re-enter
      await DialogApi26TestHelper.openPageIfNeeded('ContextMenuByIsShow',
        'MainAbility/pages/menu/ContextMenuByIsShow');
      let hide = await driver.waitForComponent(ON.id('btn_isshow_hide'), 5000);
      expect(hide !== null).assertTrue();
      await hide.click();
      await CommonFunc.sleep(300);
      let label = await driver.waitForComponent(ON.id('isshow_last_action'), 5000);
      expect(label !== null).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400 END');
      done();
    });

  });
}
