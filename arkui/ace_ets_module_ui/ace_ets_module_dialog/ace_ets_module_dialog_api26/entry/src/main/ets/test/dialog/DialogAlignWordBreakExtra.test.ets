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


export default function DialogAlignWordBreakExtra() {
  describe('DialogAlignWordBreakExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAlignWordBreakExtra beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogAlignWordBreakExtra'
      };
      try {
        let pages = router.getState();
        if (pages.name !== 'DialogAlignWordBreakExtra') {
          router.clear();
          await CommonFunc.sleep(500);
          await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          let driverNav = await Driver.create();
          await DialogApi26TestHelper.drainCustomDialogs(driverNav);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogAlignWordBreakExtra error: ' + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      await DialogApi26TestHelper.dismissOverlayIfAny(driver);
      await CommonFunc.sleep(700);
    });
    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100
     * @tc.desc alignment DEFAULT wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_default_normal'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWDEFAULT_NORMAL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_DEFAULT_NORMAL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_DEFAULT_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200
     * @tc.desc alignment DEFAULT wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_default_break_all'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWDEFAULT_BREAK_ALL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_DEFAULT_BREAK_ALL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_DEFAULT_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300
     * @tc.desc alignment DEFAULT wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_default_break_word'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWDEFAULT_BREAK_WORD'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_DEFAULT_BREAK_WORD'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_DEFAULT_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400
     * @tc.desc alignment TOP_START wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_start_normal'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_START_NORMAL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_START_NORMAL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_START_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500
     * @tc.desc alignment TOP_START wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_start_break_all'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_START_BREAK_ALL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_START_BREAK_ALL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_START_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600
     * @tc.desc alignment TOP_START wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_start_break_word'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_START_BREAK_WORD'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_START_BREAK_WORD'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_START_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700
     * @tc.desc alignment TOP_END wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_end_normal'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_END_NORMAL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_END_NORMAL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_END_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800
     * @tc.desc alignment TOP_END wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_end_break_all'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_END_BREAK_ALL'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_END_BREAK_ALL'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_END_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900
     * @tc.desc alignment TOP_END wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.findComponent(ON.id('btn_aw_top_end_break_word'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AWTOP_END_BREAK_WORD'));
      expect(node !== null).assertTrue();
      let actBtn = await driver.findComponent(ON.text('OK_TOP_END_BREAK_WORD'));
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_END_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0900 END');
      done();
    });

  });
}
