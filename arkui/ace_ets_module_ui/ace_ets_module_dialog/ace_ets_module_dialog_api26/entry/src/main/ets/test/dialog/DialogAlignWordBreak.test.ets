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

export default function DialogAlignWordBreak() {
  describe('DialogAlignWordBreak', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAlignWordBreak beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogAlignWordBreak' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogAlignWordBreak') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogAlignWordBreak error: ' + err);
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
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100
     * @tc.desc alignment TOP wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_top_normal'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWTOP_NORMAL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_TOP_NORMAL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200
     * @tc.desc alignment TOP wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_top_break_all'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWTOP_BREAK_ALL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_TOP_BREAK_ALL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300
     * @tc.desc alignment TOP wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_top_break_word'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWTOP_BREAK_WORD'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_TOP_BREAK_WORD'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_TOP_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400
     * @tc.desc alignment CENTER wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_center_normal'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWCENTER_NORMAL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_CENTER_NORMAL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_CENTER_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500
     * @tc.desc alignment CENTER wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_center_break_all'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWCENTER_BREAK_ALL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_CENTER_BREAK_ALL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_CENTER_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600
     * @tc.desc alignment CENTER wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_center_break_word'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWCENTER_BREAK_WORD'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_CENTER_BREAK_WORD'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_CENTER_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700
     * @tc.desc alignment BOTTOM wordBreak NORMAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_bottom_normal'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWBOTTOM_NORMAL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_BOTTOM_NORMAL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_BOTTOM_NORMAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800
     * @tc.desc alignment BOTTOM wordBreak BREAK_ALL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_bottom_break_all'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWBOTTOM_BREAK_ALL'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_BOTTOM_BREAK_ALL'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_BOTTOM_BREAK_ALL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900
     * @tc.desc alignment BOTTOM wordBreak BREAK_WORD
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_aw_bottom_break_word'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('AWBOTTOM_BREAK_WORD'), 3000);
      expect(node !== null).assertTrue();
      let actBtn = await driver.waitForComponent(ON.text('OK_BOTTOM_BREAK_WORD'), 3000);
      expect(actBtn !== null).assertTrue();
      await actBtn.click();
      await CommonFunc.sleep(700);
      let label = await driver.findComponent(ON.id('align_wb_action'));
      let txt = await label.getText();
      expect(txt.indexOf('act_BOTTOM_BREAK_WORD') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0900 END');
      done();
    });

  });
}
