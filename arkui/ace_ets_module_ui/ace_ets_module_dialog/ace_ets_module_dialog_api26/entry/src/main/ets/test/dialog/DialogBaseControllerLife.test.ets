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

export default function DialogBaseControllerLife() {
  describe('DialogBaseControllerLife', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseControllerLife beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogBaseControllerLife'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogBaseControllerLife') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogBaseControllerLife error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
        await CommonFunc.sleep(300);
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_ctrl_construct'));
      await btn.click();
      await CommonFunc.sleep(500);
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_ctrl_present'));
      await btn.click();
      await CommonFunc.sleep(1200);
      let title = await driver.findComponent(ON.text('CtrlTitle'));
      expect(title !== null).assertTrue();
      let ok = await driver.findComponent(ON.text('CtrlOK'));
      await ok.click();
      await CommonFunc.sleep(800);
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_ctrl_auto_close'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let label = await driver.findComponent(ON.id('ctrl_action'));
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_ctrl_will_dismiss'));
      await btn.click();
      await CommonFunc.sleep(1200);
      let title = await driver.findComponent(ON.text('WillDismissTitle'));
      expect(title !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('ctrl_action'));
      let txt = await label.getText();
      expect(txt.indexOf('willDismiss') >= 0 || txt.indexOf('WillDismissOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0400 END');
      done();
    });

  });
}
