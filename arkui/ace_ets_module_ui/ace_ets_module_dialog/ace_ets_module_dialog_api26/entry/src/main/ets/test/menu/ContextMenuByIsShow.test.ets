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

export default function ContextMenuByIsShow() {
  describe('ContextMenuByIsShow', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] ContextMenuByIsShow beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menu/ContextMenuByIsShow'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'ContextMenuByIsShow') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push ContextMenuByIsShow error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(800);
      console.info('[ARKUI_DYN] ContextMenuByIsShow afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100
     * @tc.desc bindContextMenuByIsShow MenuElement toggle show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_isshow_elements'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('IsShowA'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200
     * @tc.desc bindContextMenuByIsShow CustomBuilder toggle show
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_isshow_custom'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('CustomIsShowX'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(500);
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300
     * @tc.desc bindContextMenuByIsShow item click updates lastAction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_isshow_elements'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('IsShowB'));
      expect(node !== null).assertTrue();
      let item = await driver.findComponent(ON.text('IsShowB'));
      await item.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('isshow_last_action'));
      let txt = await label.getText();
      expect(txt === 'last=IsShowB').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400
     * @tc.name SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400
     * @tc.desc bindContextMenuByIsShow dismiss by back then hide resets state
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_isshow_elements'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1000);
      let node = await driver.findComponent(ON.text('IsShowC'));
      expect(node !== null).assertTrue();
      await driver.pressBack();
      await CommonFunc.sleep(800);
      let hide = await driver.findComponent(ON.id('btn_isshow_hide'));
      expect(hide !== null).assertTrue();
      await hide.click();
      await CommonFunc.sleep(500);
      let label = await driver.findComponent(ON.id('isshow_last_action'));
      expect(label !== null).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0400 END');
      done();
    });

  });
}
