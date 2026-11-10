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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const KEYCODE_DPAD_UP: number = 2012;
const KEYCODE_DPAD_DOWN: number = 2013;

// 从SCROLL_KB_MOD_OFFSET文本中解析当前纵向滚动偏移量，如'offset=123'解析为123
function getVScrollOffset(): number {
  let strJson: string = getInspectorByKey('SCROLL_KB_MOD_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[scrollKeyboardModifier] current offset content: " + content);
  return Number.parseInt(content.split('=')[1]);
}

export default function scrollKeyboardModifier() {
  describe('scrollKeyboardModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollKeyboardModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollAnimation/ScrollKeyboardModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollKeyboardModifier state pages:" + JSON.stringify(pages));
        if (!("ScrollKeyboardModifier" == pages.name)) {
          console.info("get scrollKeyboardModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollKeyboardModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollKeyboardModifier page error:" + err);
      }
      console.info("scrollKeyboardModifier beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollKeyboardModifier_0100
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHKEYBOARD_MODIFIER_0100
     * @tc.desc   Test vertical Scroll scrolls with keyboard arrow keys when
     *            enableScrollWithKeyboard(true) is set through AttributeModifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollKeyboardModifier_0100', Level.LEVEL1, async () => {
      console.info('[scrollKeyboardModifier_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('SCROLL_KB_MOD');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[scrollKeyboardModifier_0100] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('SCROLL_KB_MOD_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVScrollOffset()).assertEqual(0);
 
      let scrollComp: Component = await driver.findComponent(ON.id('SCROLL_KB_MOD'));
      let displayId: number = await scrollComp.getDisplayId();
      console.info('[scrollKeyboardModifier_0100] displayId: ' + displayId);
      await scrollComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVScrollOffset();
      console.info('[scrollKeyboardModifier_0100] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
      await CommonFunc.sleep(500);
 
      let offsetUp: number = getVScrollOffset();
      console.info('[scrollKeyboardModifier_0100] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[scrollKeyboardModifier_0100] END');
    })
  })
}