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

export default function DialogBaseOptionsVisual() {
  describe('DialogBaseOptionsVisual', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogBaseOptionsVisual beforeEach');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/DialogBaseOptionsVisual'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'DialogBaseOptionsVisual') {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('[ARKUI_DYN] push DialogBaseOptionsVisual error: ' + err);
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
      console.info('[ARKUI_DYN] DialogBaseOptionsVisual afterEach');
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100
     * @tc.desc backgroundColor blur maskColor shadow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_bg'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('BgTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('BgOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('BgOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200
     * @tc.desc backgroundEffect options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_effect'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('EffectTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('EffectOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('EffectOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300
     * @tc.desc levelMode OVERLAY immersiveMode levelOrder
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_level_overlay'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('LevelOverlay'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('LevelOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('LevelOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400
     * @tc.desc levelMode EMBEDDED
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_level_embedded'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('LevelEmbedded'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('EmbedOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('EmbedOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500
     * @tc.desc isModal false autoCancel focusable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_not_modal'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('NotModal'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('ModalOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('ModalOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600
     * @tc.desc enableHoverMode hoverModeArea
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.findComponent(ON.id('btn_visual_hover'));
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('HoverTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('HoverOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      expect(label !== null).assertTrue();
      let txt = await label.getText();
      expect(txt.indexOf('HoverOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0600 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700
     * @tc.desc dialogTransition maskTransition keyboardAvoid
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_visual_transition'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('TransTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('TransOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      let txt = await label.getText();
      expect(txt.indexOf('TransOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0700 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800
     * @tc.desc levelUniqueId with EMBEDDED levelMode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_visual_level_uid'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('LevelUidTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('UidOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      let txt = await label.getText();
      expect(txt.indexOf('UidOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0800 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900
     * @tc.name SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900
     * @tc.desc systemMaterial Material.NONE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(800);
      let btn = await driver.waitForComponent(ON.id('btn_visual_material'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1200);
      let node = await driver.findComponent(ON.text('MaterialTitle'));
      expect(node !== null).assertTrue();
      let act = await driver.findComponent(ON.text('MaterialOK'));
      expect(act !== null).assertTrue();
      await act.click();
      await CommonFunc.sleep(800);
      let label = await driver.findComponent(ON.id('base_visual_action'));
      let txt = await label.getText();
      expect(txt.indexOf('MaterialOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0900 END');
      done();
    });

  });
}
