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

export default function DialogBaseSizeBorder() {
  describe('DialogBaseSizeBorder', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseSizeBorder beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogBaseSizeBorder' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogBaseSizeBorder') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogBaseSizeBorder error: ' + err);
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
      console.info('[ARKUI_DYN] DialogBaseSizeBorder afterEach');
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
      let btn = await driver.waitForComponent(ON.id('btn_size_width_pct'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('WidthPctTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('WidthPctOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_width_num'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('WidthNumTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('WidthNumOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_height'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('HeightTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('HeightOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_bw'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('BWTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('BWOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_br'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('BRTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('BROK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_bs'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('BSTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('BSOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_offset'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('OffsetTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('OffsetOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_mask'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('MaskColorTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('MaskColorOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_ac'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('ACTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('ACOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_focusable'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('FocusableTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('FocusableOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_kbd'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('KbdTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('KbdOK'), 3000);
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
      let btn = await driver.waitForComponent(ON.id('btn_size_shadow'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('ShadowTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('ShadowOK'), 3000);
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
