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

export default function DialogBaseControllerLife() {
  describe('DialogBaseControllerLife', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseControllerLife beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogBaseControllerLife', 'MainAbility/pages/dialog/DialogBaseControllerLife');
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.dismissOverlayIfAny(driver);
      console.info('[ARKUI_DYN] afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogBaseControllerLife afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100
     * @tc.desc constructor getState before present
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(400);
      let btn = await driver.waitForComponent(ON.id('btn_ctrl_construct'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(400);
      let label = await driver.findComponent(ON.id('ctrl_state_before'));
      let txt = await label.getText();
      expect(txt.indexOf('UNINITIALIZED') >= 0 || txt.indexOf('INITIALIZED') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0200
     * @tc.desc present with controller then getState
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(400);
      let btn = await driver.waitForComponent(ON.id('btn_ctrl_present'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      let title = await driver.waitForComponent(ON.text('CtrlTitle'), 5000);
      expect(title !== null).assertTrue();
      let ok = await driver.waitForComponent(ON.text('CtrlOK'), 5000);
      expect(ok !== null).assertTrue();
      await ok.click();
      await CommonFunc.sleep(400);
      let label = await driver.findComponent(ON.id('ctrl_action'));
      let txt = await label.getText();
      expect(txt.indexOf('CtrlOK') >= 0).assertTrue();
      let idLabel = await driver.findComponent(ON.id('ctrl_dialog_id'));
      let idTxt = await idLabel.getText();
      expect(idTxt !== 'dialogId=-1').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0300
     * @tc.desc controller.close via onDidAppear auto close
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(400);
      let btn = await driver.waitForComponent(ON.id('btn_ctrl_auto_close'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1500);
      let label = await driver.waitForComponent(ON.id('ctrl_action'), 5000);
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('closed') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400
     * @tc.desc onWillDismiss sets reason and action
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(400);
      // ensure no leftover overlay from prior case
      await DialogApi26TestHelper.dismissOverlayIfAny(driver);
      let btn = await driver.waitForComponent(ON.id('btn_ctrl_will_dismiss'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let title = await driver.waitForComponent(ON.text('WillDismissTitle'), 5000);
      expect(title !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('ctrl_action'));
      let txt = await label.getText();
      expect(txt.indexOf('willDismiss') >= 0 || txt.indexOf('WillDismissOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400 END');
      done();
    });

  });
}
