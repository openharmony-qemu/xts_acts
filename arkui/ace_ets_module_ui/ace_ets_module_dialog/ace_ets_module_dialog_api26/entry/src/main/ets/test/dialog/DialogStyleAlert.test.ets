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

export default function DialogStyleAlert() {
  describe('DialogStyleAlert', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogStyleAlert beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogStyleAlert'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogStyleAlert') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogStyleAlert error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
      console.info('[ARKUI_DYN] DialogStyleAlert afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0100
     * @tc.desc present style dialog title subtitle message buttons
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_basic'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlertTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlertOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlertOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0200
     * @tc.desc DialogButtonOrientation VERTICAL with three buttons
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_vertical'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('VerticalTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('VertB'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('VertB') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0300
     * @tc.desc DialogButtonOrientation AUTO single button
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_auto'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AutoTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AutoOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AutoOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0400
     * @tc.desc DialogButton enabled false still shows EnableOK
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_disabled'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('DisableTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('EnableOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('EnableOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0500
     * @tc.desc DialogMessage wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_wordbreak'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('WordBreakTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('WBClose'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('WBClose') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0600
     * @tc.desc DialogResult.dialogId assigned after present
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_style_alert_basic'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlertMessage'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlertCancel'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let idLabel = await driver.findComponent(ON.id('style_alert_dialog_id'));
      let idTxt = await idLabel.getText();
      expect(idTxt !== 'dialogId=-1').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0700
     * @tc.desc DialogMessage wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_style_alert_wb_all'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('WBAllTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('WBAllOK'), 3000);
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      let txt = await label.getText();
      expect(txt.indexOf('WBAllOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0800
     * @tc.desc DialogStyleOptions.subtitle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_style_alert_subtitle'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let sub = await driver.waitForComponent(ON.text('SubTitleValue'), 3000);
      expect(sub !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('SubTitleOK'), 3000);
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      let txt = await label.getText();
      expect(txt.indexOf('SubTitleOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleAlert_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleAlert_0900
     * @tc.desc DialogResult.dialogId via dedicated button
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleAlert_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_style_alert_dialogid'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let act = await driver.waitForComponent(ON.text('DialogIdOK'), 3000);
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('style_alert_action'));
      let txt = await label.getText();
      expect(txt.indexOf('dialogId=') >= 0 || txt.indexOf('DialogIdOK') >= 0).assertTrue();
      let idLabel = await driver.findComponent(ON.id('style_alert_dialog_id'));
      let idTxt = await idLabel.getText();
      expect(idTxt !== 'dialogId=-1').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleAlert_0900 END');
      done();
    });

  });
}
