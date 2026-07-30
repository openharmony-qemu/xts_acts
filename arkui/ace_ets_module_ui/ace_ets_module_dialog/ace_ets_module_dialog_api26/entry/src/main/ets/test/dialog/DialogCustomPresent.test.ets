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

export default function DialogCustomPresent() {
  describe('DialogCustomPresent', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogCustomPresent beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogCustomPresent' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogCustomPresent') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogCustomPresent error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      try {
        let driver = await Driver.create();
        await driver.pressBack();
        await CommonFunc.sleep(300);
      } catch (e) {
        console.info('[ARKUI_DYN] pressBack skip');
      }
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_custom_style_true'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let err = await driver.findComponent(ON.id('custom_present_error'));
      let errTxt = await err.getText();
      expect(errTxt === 'error=none').assertTrue();
      let node = await driver.findComponent(ON.text('CustomStyleContent'));
      expect(node !== null).assertTrue();
      let dismiss = await driver.findComponent(ON.id('btn_custom_dismiss'));
      await dismiss.click();
      await CommonFunc.sleep(800);
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_custom_content'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let node = await driver.findComponent(ON.text('ComponentContentDialog'));
      expect(node !== null).assertTrue();
      let dismiss = await driver.findComponent(ON.id('btn_custom_dismiss'));
      await dismiss.click();
      await CommonFunc.sleep(800);
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
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_custom_content'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let upd = await driver.findComponent(ON.id('btn_custom_update'));
      await upd.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('custom_present_action'));
      let txt = await label.getText();
      expect(txt.indexOf('updated') >= 0).assertTrue();
      let dismiss = await driver.findComponent(ON.id('btn_custom_dismiss'));
      await dismiss.click();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogCustomPresent_0300 END');
      done();
    });

  });
}
