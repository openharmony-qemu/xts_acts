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

export default function DialogEnumsAssertExtra() {
  describe('DialogEnumsAssertExtra', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogEnumsAssertExtra beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogEnumsAssertExtra' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogEnumsAssertExtra') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogEnumsAssertExtra error: ' + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(400);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
    });
    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100
     * @tc.desc assert enum TOP_END
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_5'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('TOP_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0200
     * @tc.desc assert enum CENTER_START
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_6'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('CENTER_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0300
     * @tc.desc assert enum CENTER_END
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_7'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('CENTER_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0400
     * @tc.desc assert enum BOTTOM_START
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_8'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('BOTTOM_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500
     * @tc.desc assert enum BOTTOM_END
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_9'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('BOTTOM_END') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0600
     * @tc.desc assert enum AUTO
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_orient_0'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('AUTO') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0700
     * @tc.desc assert enum HORIZONTAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_orient_1'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('HORIZONTAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0800
     * @tc.desc assert enum VERTICAL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_orient_2'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('VERTICAL') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0900
     * @tc.desc assert enum DialogTextStyleOptions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_text_style'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_extra_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DialogTextStyleOptions') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0900 END');
      done();
    });

  });
}
