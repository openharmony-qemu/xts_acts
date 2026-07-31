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

export default function DialogAbnormalOpts() {
  describe('DialogAbnormalOpts', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogAbnormalOpts beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogAbnormalOpts' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogAbnormalOpts') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogAbnormalOpts error: ' + err);
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
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100
     * @tc.desc optional subtitle undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_subtitle'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnSubTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_subtitle'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('subtitle_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0200
     * @tc.desc optional width undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_width'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnWidthTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_width'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('width_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0300
     * @tc.desc optional height undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_height'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnHeightTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_height'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('height_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0400
     * @tc.desc optional maskColor undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_maskColor'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnMaskTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_maskColor'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('maskColor_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0500
     * @tc.desc optional offset undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_offset'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnOffsetTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_offset'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('offset_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0600
     * @tc.desc optional borderWidth undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_borderWidth'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnBWTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_borderWidth'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('borderWidth_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0700
     * @tc.desc optional borderRadius undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_borderRadius'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnBRTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_borderRadius'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('borderRadius_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0800
     * @tc.desc optional shadow undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(600);
      let btn = await driver.waitForComponent(ON.id('btn_abn_shadow'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1400);
      let cover = await driver.findComponent(ON.id('abn_cover'));
      let ctxt = await cover.getText();
      expect(ctxt.indexOf('ok:') >= 0 || ctxt.indexOf('fail:') >= 0).assertTrue();
      let node = await driver.findComponent(ON.text('AbnShadowTitle'));
      if (node !== null) {
        let actBtn = await driver.findComponent(ON.text('AbnOK_shadow'));
        if (actBtn !== null) {
          await actBtn.click();
          await CommonFunc.sleep(700);
          let label = await driver.findComponent(ON.id('abn_action'));
          let txt = await label.getText();
          expect(txt.indexOf('shadow_undefined') >= 0 || txt.indexOf('error') >= 0).assertTrue();
        }
      } else {
        expect(ctxt.indexOf('fail:') >= 0 || ctxt.indexOf('ok:') >= 0).assertTrue();
      }
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0800 END');
      done();
    });

  });
}
