/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const KEYCODE_DPAD_UP: number = 2012;
const KEYCODE_DPAD_DOWN: number = 2013;

// 从V_SCROLL_KB_OFFSET文本中解析当前纵向滚动偏移量，如'offset=123'解析为123
function getVScrollOffset(): number {
  let strJson: string = getInspectorByKey('V_SCROLL_KB_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[scrollKeyboardVertical] current offset content: " + content);
  return Number.parseInt(content.substring('offset='.length));
}

export default function scrollKeyboardVertical() {
  describe('scrollKeyboardVertical', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollKeyboardVertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollAnimation/ScrollKeyboardVertical",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollKeyboardVertical state pages:" + JSON.stringify(pages));
        if (!("ScrollKeyboardVertical" == pages.name)) {
          console.info("get scrollKeyboardVertical pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollKeyboardVertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollKeyboardVertical page error:" + err);
      }
      console.info("scrollKeyboardVertical beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollKeyboardVertical after each called");
    });

    /**
     * @tc.name   scrollKeyboardVertical_0100
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0100
     * @tc.desc   Test vertical Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardVertical_0100', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardVertical_0100] START');
      let driver = await Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardVertical_0100] V_SCROLL_KB inspector: ' + getInspectorByKey('V_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('V_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardVertical_0100] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVScrollOffset();
      console.info('[scrollKeyboardVertical_0100] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();

      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetUp: number = getVScrollOffset();
      console.info('[scrollKeyboardVertical_0100] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[scrollKeyboardVertical_0100] END');
    })

    /**
     * @tc.name   scrollKeyboardVertical_0200
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0200
     * @tc.desc   Test vertical Scroll does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardVertical_0200', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardVertical_0200] START');
      let driver = await Driver.create();
      let falseBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardVertical_0200] V_SCROLL_KB inspector: ' + getInspectorByKey('V_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('V_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardVertical_0200] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVScrollOffset();
      console.info('[scrollKeyboardVertical_0200] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown).assertEqual(0);
      console.info('[scrollKeyboardVertical_0200] END');
    })

    /**
     * @tc.name   scrollKeyboardVertical_0300
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0300
     * @tc.desc   Test vertical Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardVertical_0300', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardVertical_0300] START');
      let driver = await Driver.create();
      let undefBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardVertical_0300] V_SCROLL_KB inspector: ' + getInspectorByKey('V_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('V_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardVertical_0300] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVScrollOffset();
      console.info('[scrollKeyboardVertical_0300] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
      console.info('[scrollKeyboardVertical_0300] END');
    })

    /**
     * @tc.name   scrollKeyboardVertical_0400
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0400
     * @tc.desc   Test vertical Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardVertical_0400', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardVertical_0400] START');
      let driver = await Driver.create();
      let nullBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardVertical_0400] V_SCROLL_KB inspector: ' + getInspectorByKey('V_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('V_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardVertical_0400] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVScrollOffset();
      console.info('[scrollKeyboardVertical_0400] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
      console.info('[scrollKeyboardVertical_0400] END');
    })
  })
}
