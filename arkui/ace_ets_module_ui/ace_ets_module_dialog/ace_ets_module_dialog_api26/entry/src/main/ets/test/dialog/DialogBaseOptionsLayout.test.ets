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

export default function DialogBaseOptionsLayout() {
  describe('DialogBaseOptionsLayout', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseOptionsLayout beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogBaseOptionsLayout'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogBaseOptionsLayout') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogBaseOptionsLayout error: ' + err);
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
      console.info('[ARKUI_DYN] DialogBaseOptionsLayout afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100
     * @tc.desc DialogBaseAlignment.TOP present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_TOP'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignTOP'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_TOP') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200
     * @tc.desc DialogBaseAlignment.CENTER present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_CENTER'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignCENTER'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_CENTER') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300
     * @tc.desc DialogBaseAlignment.BOTTOM present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_BOTTOM'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignBOTTOM'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_BOTTOM') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400
     * @tc.desc DialogBaseAlignment.DEFAULT present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_DEFAULT'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignDEFAULT'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_DEFAULT') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500
     * @tc.desc DialogBaseAlignment.TOP_START present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_TOP_START'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignTOP_START'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_TOP_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600
     * @tc.desc DialogBaseAlignment.TOP_END present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_TOP_END'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignTOP_END'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_TOP_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700
     * @tc.desc DialogBaseAlignment.CENTER_START present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_CENTER_START'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignCENTER_START'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_CENTER_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800
     * @tc.desc DialogBaseAlignment.CENTER_END present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_CENTER_END'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignCENTER_END'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_CENTER_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900
     * @tc.desc DialogBaseAlignment.BOTTOM_START present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_BOTTOM_START'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignBOTTOM_START'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_BOTTOM_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0900 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000
     * @tc.desc DialogBaseAlignment.BOTTOM_END present and confirm
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_align_BOTTOM_END'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('AlignBOTTOM_END'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('AlignOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('AlignOK_BOTTOM_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1000 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100
     * @tc.desc maskRect width height offset border options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_layout_mask'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('MaskRectTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('MaskOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_layout_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('MaskOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_1100 END');
      done();
    });

  });
}
