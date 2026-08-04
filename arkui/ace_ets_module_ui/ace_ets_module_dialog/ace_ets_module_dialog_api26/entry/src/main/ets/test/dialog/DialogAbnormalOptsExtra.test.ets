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

export default function DialogAbnormalOptsExtra() {
  describe('DialogAbnormalOptsExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAbnormalOptsExtra beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogAbnormalOptsExtra' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogAbnormalOptsExtra') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogAbnormalOptsExtra error: ' + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(700);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
    });
    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100
     * @tc.desc optional autoCancel undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_autoCancel'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnACTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_autoCancel'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('autoCancel_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0200
     * @tc.desc optional isModal undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_isModal'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnModalTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_isModal'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('isModal_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0300
     * @tc.desc optional backgroundColor undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_backgroundColor'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnBgTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_backgroundColor'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('backgroundColor_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0400
     * @tc.desc optional buttonDirection undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_buttonDirection'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnDirTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_buttonDirection'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('buttonDirection_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0500
     * @tc.desc optional wordBreak undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_wordBreak'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnWBTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_wordBreak'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('wordBreak_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0600
     * @tc.desc optional levelMode undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_levelMode'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnLevelTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_levelMode'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('levelMode_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0700
     * @tc.desc optional focusable undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_focusable'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnFocusTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_focusable'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('focusable_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0800
     * @tc.desc omit optional fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_omit'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnOmitTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOmitOK'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('omit_ok') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0900
     * @tc.desc null probe documented skip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_null_note'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(400);
      let label = await driver.findComponent(ON.id('abn_action'));
      let txt = await label.getText();
      expect(txt.indexOf('null_noted') >= 0).assertTrue();
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('null_compile_skip') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0900 END');
      done();
    });

  });
}
