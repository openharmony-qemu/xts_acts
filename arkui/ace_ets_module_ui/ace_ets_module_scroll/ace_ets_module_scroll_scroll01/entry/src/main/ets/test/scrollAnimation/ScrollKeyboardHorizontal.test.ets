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

const KEYCODE_DPAD_LEFT: number = 2014;
const KEYCODE_DPAD_RIGHT: number = 2015;

// 从H_SCROLL_KB_OFFSET文本中解析当前横向滚动偏移量，如'offset=123'解析为123
function getHScrollOffset(): number {
  let strJson: string = getInspectorByKey('H_SCROLL_KB_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[scrollKeyboardHorizontal] current offset content: " + content);
  return Number.parseInt(content.substring('offset='.length));
}

export default function scrollKeyboardHorizontal() {
  describe('scrollKeyboardHorizontal', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollKeyboardHorizontal beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollAnimation/ScrollKeyboardHorizontal",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollKeyboardHorizontal state pages:" + JSON.stringify(pages));
        if (!("ScrollKeyboardHorizontal" == pages.name)) {
          console.info("get scrollKeyboardHorizontal pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollKeyboardHorizontal page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollKeyboardHorizontal page error:" + err);
      }
      console.info("scrollKeyboardHorizontal beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollKeyboardHorizontal after each called");
    });

    /**
     * @tc.name   scrollKeyboardHorizontal_0500
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0500
     * @tc.desc   Test horizontal Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardHorizontal_0500', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardHorizontal_0500] START');
      let driver = await Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardHorizontal_0500] H_SCROLL_KB inspector: ' + getInspectorByKey('H_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('H_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardHorizontal_0500] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHScrollOffset();
      console.info('[scrollKeyboardHorizontal_0500] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();

      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetLeft: number = getHScrollOffset();
      console.info('[scrollKeyboardHorizontal_0500] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft < offsetRight).assertTrue();
      console.info('[scrollKeyboardHorizontal_0500] END');
    })

    /**
     * @tc.name   scrollKeyboardHorizontal_0600
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0600
     * @tc.desc   Test horizontal Scroll does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardHorizontal_0600', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardHorizontal_0600] START');
      let driver = await Driver.create();
      let falseBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardHorizontal_0600] H_SCROLL_KB inspector: ' + getInspectorByKey('H_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('H_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardHorizontal_0600] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHScrollOffset();
      console.info('[scrollKeyboardHorizontal_0600] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight).assertEqual(0);
      console.info('[scrollKeyboardHorizontal_0600] END');
    })

    /**
     * @tc.name   scrollKeyboardHorizontal_0700
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0700
     * @tc.desc   Test horizontal Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardHorizontal_0700', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardHorizontal_0700] START');
      let driver = await Driver.create();
      let undefBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardHorizontal_0700] H_SCROLL_KB inspector: ' + getInspectorByKey('H_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('H_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardHorizontal_0700] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHScrollOffset();
      console.info('[scrollKeyboardHorizontal_0700] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
      console.info('[scrollKeyboardHorizontal_0700] END');
    })

    /**
     * @tc.name   scrollKeyboardHorizontal_0800
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_PARAM_0800
     * @tc.desc   Test horizontal Scroll scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardHorizontal_0800', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardHorizontal_0800] START');
      let driver = await Driver.create();
      let nullBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      console.info('[scrollKeyboardHorizontal_0800] H_SCROLL_KB inspector: ' + getInspectorByKey('H_SCROLL_KB'));
      let resetBtn: Component = await driver.findComponent(ON.id('H_SCROLL_KB_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHScrollOffset()).assertEqual(0);

      let scrollComp: Component = await driver.findComponent(ON.id('H_SCROLL_KB'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardHorizontal_0800] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHScrollOffset();
      console.info('[scrollKeyboardHorizontal_0800] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
      console.info('[scrollKeyboardHorizontal_0800] END');
    })
  })
}
