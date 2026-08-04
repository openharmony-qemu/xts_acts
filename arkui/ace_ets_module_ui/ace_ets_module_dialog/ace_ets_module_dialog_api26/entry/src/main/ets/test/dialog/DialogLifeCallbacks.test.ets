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

export default function DialogLifeCallbacks() {
  describe('DialogLifeCallbacks', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogLifeCallbacks beforeEach');
      let options: router.RouterOptions = { url: 'MainAbility/pages/dialog/DialogLifeCallbacks' };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogLifeCallbacks') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogLifeCallbacks error: ' + err);
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
    });
    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100
     * @tc.desc onWillAppear fires
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_will_appear'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('WillAppearTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('WillAppearOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_log'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('willAppear') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0200
     * @tc.desc onDidAppear fires
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_did_appear'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('DidAppearTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('DidAppearOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_log'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('didAppear') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0300
     * @tc.desc onWillDisappear after close
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_will_disappear'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('WillDisappearTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('WillDisappearOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_log'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('willDisappear') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0400
     * @tc.desc onDidDisappear after close
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_did_disappear'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('DidDisappearTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('DidDisappearOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('didDisappear') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0500
     * @tc.desc full life chain then close
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_full'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('FullLifeTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('FullLifeOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_log'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('W') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0600
     * @tc.desc onWillDismiss dismissal.reason
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_will_dismiss'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('DismissLifeTitle'), 3000);
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('dismissCb') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0700
     * @tc.desc subtitle field
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_subtitle'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('SubOnlyTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('SubOnlyOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('SubOnlyOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0800
     * @tc.desc title subtitle message wordBreak
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_life_tsm'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.waitForComponent(ON.text('TSMTitle'), 3000);
      expect(node !== null).assertTrue();
      let act = await driver.waitForComponent(ON.text('TSMOK'), 3000);
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(1000);
      let label = await driver.findComponent(ON.id('life_cb_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('TSMOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0800 END');
      done();
    });

  });
}
