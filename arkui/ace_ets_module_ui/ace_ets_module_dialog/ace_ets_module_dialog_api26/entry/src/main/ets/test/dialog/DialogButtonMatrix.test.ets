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

export default function DialogButtonMatrix() {
  describe('DialogButtonMatrix', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogButtonMatrix beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogButtonMatrix' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogButtonMatrix') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogButtonMatrix error: ' + err);
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
      console.info('[ARKUI_DYN] DialogButtonMatrix afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100
     * @tc.desc DialogButton.value only
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_value'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('ValueTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('ValueOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('ValueOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0200
     * @tc.desc DialogButton.fontColor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_font'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('FontTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('FontOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('FontOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0300
     * @tc.desc DialogButton.backgroundColor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_bg'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('BgBtnTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('BgBtnOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('BgBtnOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0400
     * @tc.desc DialogButton.enabled true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_enabled'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('EnabledTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('EnabledOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('EnabledOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0500
     * @tc.desc DialogButton.defaultFocus
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_focus'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('FocusTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('FocusOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('FocusOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0600
     * @tc.desc DialogButton.primary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_primary'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('PrimaryTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('PrimaryOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('PrimaryOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0700
     * @tc.desc DialogButton.style DEFAULT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_style_def'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('StyleDefTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('StyleDefOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('StyleDefOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0800
     * @tc.desc DialogButton.style HIGHLIGHT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_style_hi'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('StyleHiTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('StyleHiOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('StyleHiOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_0900
     * @tc.desc DialogButton mixed fields click MixOK
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_mix'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('MixTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('MixOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('MixOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_0900 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogButtonMatrix_1000
     * @tc.name SUB_ArkUI_DialogApi26_DialogButtonMatrix_1000
     * @tc.desc DialogButton.action callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogButtonMatrix_1000', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_1000 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_matrix_action_cb'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('ActionTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('ActionOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('btn_matrix_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('ActionFired') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogButtonMatrix_1000 END');
      done();
    });

  });
}
