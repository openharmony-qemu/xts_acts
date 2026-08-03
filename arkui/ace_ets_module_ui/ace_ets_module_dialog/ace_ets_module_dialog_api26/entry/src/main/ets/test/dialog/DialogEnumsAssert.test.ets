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

export default function DialogEnumsAssert() {
  describe('DialogEnumsAssert', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogEnumsAssert beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogEnumsAssert' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogEnumsAssert') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogEnumsAssert error: ' + err);
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
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.desc assert enum DialogState
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DialogState') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200
     * @tc.desc assert enum DialogBaseAlignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DialogBaseAlignment') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300
     * @tc.desc assert enum DialogButtonOrientation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_btn_orient'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DialogButtonOrientation') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400
     * @tc.desc assert enum AllEnums
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_all'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('AllEnums') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500
     * @tc.desc assert enum UNINITIALIZED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_0'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('UNINITIALIZED') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0600
     * @tc.desc assert enum INITIALIZED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_1'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('INITIALIZED') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0700
     * @tc.desc assert enum APPEARING
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_2'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('APPEARING') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0800
     * @tc.desc assert enum APPEARED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_3'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('APPEARED') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0900
     * @tc.desc assert enum DISAPPEARING
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_4'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DISAPPEARING') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0900 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1000
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1000
     * @tc.desc assert enum DISAPPEARED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1000', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1000 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_state_5'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DISAPPEARED') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1000 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100
     * @tc.desc assert enum TOP
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_0'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('TOP') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1200
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1200
     * @tc.desc assert enum CENTER
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_1'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('CENTER') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1300
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1300
     * @tc.desc assert enum BOTTOM
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_2'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('BOTTOM') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1400
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1400
     * @tc.desc assert enum DEFAULT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_3'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('DEFAULT') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_1500
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_1500
     * @tc.desc assert enum TOP_START
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_1500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.waitForComponent(ON.id('btn_enum_align_4'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt.indexOf('PASS:') >= 0).assertTrue();
      expect(txt.indexOf('TOP_START') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_1500 END');
      done();
    });

  });
}
