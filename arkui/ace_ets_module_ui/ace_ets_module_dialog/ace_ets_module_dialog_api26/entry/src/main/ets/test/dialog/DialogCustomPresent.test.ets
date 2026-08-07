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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogCustomPresent() {
  describe('DialogCustomPresent', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogCustomPresent beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogCustomPresent', 'MainAbility/pages/dialog/DialogCustomPresent');
      done();
    });

    afterEach(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      try {
        let dismiss = await driver.findComponent(ON.id('btn_custom_dismiss'));
        if (dismiss !== null) {
          await dismiss.click();
          await CommonFunc.sleep(300);
        }
      } catch (e) {
      }
      console.info('[ARKUI_DYN] afterEach');
    });
    afterAll(async () => {
      let driver = await Driver.create();
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      try {
        let dismiss = await driver.findComponent(ON.id('btn_custom_dismiss'));
        if (dismiss !== null) {
          await dismiss.click();
          await CommonFunc.sleep(400);
        }
      } catch (e) {
      }
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogCustomPresent afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0100
     * @tc.desc customStyle true with ComponentContent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_custom_style_true'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let err = await driver.findComponent(ON.id('custom_present_error'));
      let errTxt = await err.getText();
      expect(errTxt === 'error=none').assertTrue();
      let node = await driver.findComponent(ON.text('CustomStyleContent'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(400);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0200
     * @tc.desc ComponentContent custom dialog present dismiss
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.findComponent(ON.id('btn_custom_content'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let node = await driver.findComponent(ON.text('ComponentContentDialog'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(400);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      let label = await driver.findComponent(ON.id('custom_present_action'));
      let txt = await label.getText();
      expect(txt.indexOf('dismissed') >= 0 || txt.indexOf('contentOpened') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0300
     * @tc.desc update DialogBaseOptions on content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_custom_present_update'), 5000);
      expect(btn !== null).assertTrue();
      await DialogApi26TestHelper.dismissOverlayIfAny(driver);
      await btn.click();
      // present+update is async; wait for action text
      let updated = false;
      for (let i = 0; i < 10; i++) {
        await CommonFunc.sleep(300);
        let label = await driver.findComponent(ON.id('custom_present_action'));
        if (label !== null) {
          let txt = await label.getText();
          if (txt.indexOf('updated') >= 0) {
            updated = true;
            break;
          }
        }
      }
      expect(updated).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(300);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0400
     * @tc.desc custom width height present
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_custom_size'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1500);
      let node = await driver.waitForComponent(ON.text('CustomSizeContent'), 3000);
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(400);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      let label = await driver.findComponent(ON.id('custom_present_action'));
      let txt = await label.getText();
      expect(txt.indexOf('dismissed') >= 0 || txt.indexOf('sizeOpened') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0500
     * @tc.desc custom borderWidth borderColor borderRadius
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_custom_border'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1500);
      let node = await driver.waitForComponent(ON.text('CustomBorderContent'), 3000);
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(400);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      let label = await driver.findComponent(ON.id('custom_present_action'));
      let txt = await label.getText();
      expect(txt.indexOf('dismissed') >= 0 || txt.indexOf('borderOpened') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogCustomPresent_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogCustomPresent_0600
     * @tc.desc custom autoCancel focusable flags
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogCustomPresent_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_custom_flags'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1500);
      let node = await driver.waitForComponent(ON.text('CustomFlagsContent'), 3000);
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(400);
      await DialogApi26TestHelper.drainCustomDialogs(driver);
      let label = await driver.findComponent(ON.id('custom_present_action'));
      let txt = await label.getText();
      expect(txt.indexOf('dismissed') >= 0 || txt.indexOf('flagsOpened') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0600 END');
      done();
    });

  });
}
