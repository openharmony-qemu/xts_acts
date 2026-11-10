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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';


export default function DialogBaseSizeBorder() {
  describe('DialogBaseSizeBorder', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseSizeBorder beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogBaseSizeBorder'
      };
      try {
        let pages = router.getState();
        if (pages.name !== 'DialogBaseSizeBorder') {
          router.clear();
          await CommonFunc.sleep(500);
          await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          let driverNav = await Driver.create();
          await DialogApi26TestHelper.drainCustomDialogs(driverNav);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogBaseSizeBorder error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      await DialogApi26TestHelper.dismissOverlayIfAny(driver);
      await CommonFunc.sleep(800);
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100
     * @tc.desc width percent Dimension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_width_pct'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('WidthPctTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('WidthPctOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('WidthPctOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200
     * @tc.desc width number Dimension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_width_num'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('WidthNumTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('WidthNumOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('WidthNumOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300
     * @tc.desc height Dimension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_height'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('HeightTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('HeightOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('HeightOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400
     * @tc.desc borderWidth borderColor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_bw'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('BWTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('BWOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('BWOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500
     * @tc.desc borderRadius
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_br'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('BRTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('BROK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('BROK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600
     * @tc.desc borderStyle Dashed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_bs'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('BSTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('BSOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('BSOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700
     * @tc.desc offset dx dy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_offset'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('OffsetTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('OffsetOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('OffsetOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800
     * @tc.desc maskColor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_mask'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('MaskColorTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('MaskColorOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('MaskColorOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900
     * @tc.desc autoCancel false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_ac'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('ACTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('ACOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('ACOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0900 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000
     * @tc.desc focusable false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_focusable'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('FocusableTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('FocusableOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('FocusableOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1000 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100
     * @tc.desc keyboardAvoidMode Distance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_kbd'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('KbdTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('KbdOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('KbdOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200
     * @tc.desc shadow ShadowStyle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_size_shadow'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('ShadowTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('ShadowOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('size_border_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('ShadowOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_1200 END');
      done();
    });

  });
}
