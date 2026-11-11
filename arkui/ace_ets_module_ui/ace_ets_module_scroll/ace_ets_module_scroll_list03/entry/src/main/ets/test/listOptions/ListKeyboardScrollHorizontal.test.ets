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

const KEYCODE_DPAD_LEFT: number = 2014;
const KEYCODE_DPAD_RIGHT: number = 2015;

// 从HKB_LIST_OFFSET文本中解析当前横向滚动偏移量，如'offset=123'解析为123
function getHListOffset(): number {
  let strJson: string = getInspectorByKey('HKB_LIST_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[listKeyboardScrollHorizontal] current offset content: " + content);
  return Number.parseInt(content.split('=')[1]);
}

export default function listKeyboardScrollHorizontal() {
  describe('listKeyboardScrollHorizontal', () => {
    beforeEach(async (done: Function) => {
      console.info("listKeyboardScrollHorizontal beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listOptions/listKeyboardScrollHorizontal",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listKeyboardScrollHorizontal state pages:" + JSON.stringify(pages));
        if (!("listKeyboardScrollHorizontal" == pages.name)) {
          console.info("get listKeyboardScrollHorizontal pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listKeyboardScrollHorizontal page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listKeyboardScrollHorizontal page error:" + err);
      }
      console.info("listKeyboardScrollHorizontal beforeEach end");
      done();
    });

    /**
     * @tc.name   listKeyboardScrollHorizontal_0500
     * @tc.number SUB_ARKUI_LIST_ENABLESCROLLWITHKEYBOARD_PARAM_0500
     * @tc.desc   Test horizontal List scrolls with keyboard arrow keys when enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listKeyboardScrollHorizontal_0500', Level.LEVEL1, async () => {
      console.info('[listKeyboardScrollHorizontal_0500] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let trueBtn: Component = await driver.findComponent(ON.id('HKB_LIST_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_LIST');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listKeyboardScrollHorizontal_0500] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_LIST_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHListOffset()).assertEqual(0);
 
      let listComp: Component = await driver.findComponent(ON.id('HKB_LIST'));
      let displayId: number = await listComp.getDisplayId();
      console.info('[listKeyboardScrollHorizontal_0500] displayId: ' + displayId);
      await listComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0500] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0500] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft < offsetRight).assertTrue();
      console.info('[listKeyboardScrollHorizontal_0500] END');
    })
 
    /**
     * @tc.name   listKeyboardScrollHorizontal_0600
     * @tc.number SUB_ARKUI_LIST_ENABLESCROLLWITHKEYBOARD_PARAM_0600
     * @tc.desc   Test horizontal List does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listKeyboardScrollHorizontal_0600', Level.LEVEL1, async () => {
      console.info('[listKeyboardScrollHorizontal_0600] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let falseBtn: Component = await driver.findComponent(ON.id('HKB_LIST_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_LIST');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listKeyboardScrollHorizontal_0600] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(false);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_LIST_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHListOffset()).assertEqual(0);
 
      let listComp: Component = await driver.findComponent(ON.id('HKB_LIST'));
      let displayId: number = await listComp.getDisplayId();
      console.info('[listKeyboardScrollHorizontal_0600] displayId: ' + displayId);
      await listComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0600] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight).assertEqual(0);
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0600] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft).assertEqual(0);
      console.info('[listKeyboardScrollHorizontal_0600] END');
    })
 
    /**
     * @tc.name   listKeyboardScrollHorizontal_0700
     * @tc.number SUB_ARKUI_LIST_ENABLESCROLLWITHKEYBOARD_PARAM_0700
     * @tc.desc   Test horizontal List does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to undefined (default value false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listKeyboardScrollHorizontal_0700', Level.LEVEL1, async () => {
      console.info('[listKeyboardScrollHorizontal_0700] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let undefBtn: Component = await driver.findComponent(ON.id('HKB_LIST_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_LIST');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listKeyboardScrollHorizontal_0700] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(false);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_LIST_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHListOffset()).assertEqual(0);
 
      let listComp: Component = await driver.findComponent(ON.id('HKB_LIST'));
      let displayId: number = await listComp.getDisplayId();
      console.info('[listKeyboardScrollHorizontal_0700] displayId: ' + displayId);
      await listComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0700] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight).assertEqual(0);
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0700] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft).assertEqual(0);
      console.info('[listKeyboardScrollHorizontal_0700] END');
    })
 
    /**
     * @tc.name   listKeyboardScrollHorizontal_0800
     * @tc.number SUB_ARKUI_LIST_ENABLESCROLLWITHKEYBOARD_PARAM_0800
     * @tc.desc   Test horizontal List does not scroll with keyboard arrow keys when enableScrollWithKeyboard is set to null (default value false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('listKeyboardScrollHorizontal_0800', Level.LEVEL1, async () => {
      console.info('[listKeyboardScrollHorizontal_0800] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let nullBtn: Component = await driver.findComponent(ON.id('HKB_LIST_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_LIST');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listKeyboardScrollHorizontal_0800] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(false);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_LIST_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHListOffset()).assertEqual(0);
 
      let listComp: Component = await driver.findComponent(ON.id('HKB_LIST'));
      let displayId: number = await listComp.getDisplayId();
      console.info('[listKeyboardScrollHorizontal_0800] displayId: ' + displayId);
      await listComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0800] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight).assertEqual(0);
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHListOffset();
      console.info('[listKeyboardScrollHorizontal_0800] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft).assertEqual(0);
      console.info('[listKeyboardScrollHorizontal_0800] END');
    })
  })
}