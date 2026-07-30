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
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogEnumsAssert'
      };
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
      await CommonFunc.sleep(800);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
      console.info('[ARKUI_DYN] DialogEnumsAssert afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100
     * @tc.desc DialogState enum values coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_enum_state'));
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt === 'PASS:DialogState').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200
     * @tc.desc DialogBaseAlignment enum values coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_enum_align'));
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt === 'PASS:DialogBaseAlignment').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300
     * @tc.desc DialogButtonOrientation enum values coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_enum_btn_orient'));
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt === 'PASS:DialogButtonOrientation').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400
     * @tc.desc batch enum sanity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_enum_all'));
      await btn.click();
      await CommonFunc.sleep(300);
      let label = await driver.findComponent(ON.id('enums_result'));
      let txt = await label.getText();
      expect(txt === 'PASS:AllEnums').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogEnumsAssert_0400 END');
      done();
    });

  });
}
