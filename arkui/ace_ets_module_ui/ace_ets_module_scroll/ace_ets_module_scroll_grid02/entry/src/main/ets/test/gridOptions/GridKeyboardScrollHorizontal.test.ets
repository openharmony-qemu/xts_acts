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

// 从HKB_GRID_OFFSET文本中解析当前横向滚动偏移量，如'offset=123'解析为123
function getHGridOffset(): number {
  let strJson: string = getInspectorByKey('HKB_GRID_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[gridKeyboardScrollHorizontal] current offset content: " + content);
  return Number.parseInt(content.split('=')[1]);
}
 
export default function gridKeyboardScrollHorizontal() {
  describe('gridKeyboardScrollHorizontal', () => {
    beforeEach(async (done: Function) => {
      console.info("gridKeyboardScrollHorizontal beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/gridKeyboardScrollHorizontal",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridKeyboardScrollHorizontal state pages:" + JSON.stringify(pages));
        if (!("gridKeyboardScrollHorizontal" == pages.name)) {
          console.info("get gridKeyboardScrollHorizontal pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridKeyboardScrollHorizontal page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridKeyboardScrollHorizontal page error:" + err);
      }
      console.info("gridKeyboardScrollHorizontal beforeEach end");
      done();
    });
 
    /**
     * @tc.name   gridKeyboardScrollHorizontal_0500
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0500
     * @tc.desc   Test horizontal Grid scrolls with keyboard arrow keys when enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollHorizontal_0500', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollHorizontal_0500] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let trueBtn: Component = await driver.findComponent(ON.id('HKB_GRID_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollHorizontal_0500] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('HKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollHorizontal_0500] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0500] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0500] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft < offsetRight).assertTrue();
      console.info('[gridKeyboardScrollHorizontal_0500] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollHorizontal_0600
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0600
     * @tc.desc   Test horizontal Grid does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollHorizontal_0600', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollHorizontal_0600] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let falseBtn: Component = await driver.findComponent(ON.id('HKB_GRID_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollHorizontal_0600] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(false);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('HKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollHorizontal_0600] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0600] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight).assertEqual(0);
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0600] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft).assertEqual(0);
      console.info('[gridKeyboardScrollHorizontal_0600] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollHorizontal_0700
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0700
     * @tc.desc   Test horizontal Grid scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollHorizontal_0700', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollHorizontal_0700] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let undefBtn: Component = await driver.findComponent(ON.id('HKB_GRID_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollHorizontal_0700] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('HKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollHorizontal_0700] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0700] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0700] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft < offsetRight).assertTrue();
      console.info('[gridKeyboardScrollHorizontal_0700] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollHorizontal_0800
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0800
     * @tc.desc   Test horizontal Grid scrolls with keyboard arrow keys when enableScrollWithKeyboard is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollHorizontal_0800', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollHorizontal_0800] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let nullBtn: Component = await driver.findComponent(ON.id('HKB_GRID_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('HKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollHorizontal_0800] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('HKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('HKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollHorizontal_0800] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_RIGHT, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetRight: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0800] offset after DPAD_RIGHT: ' + offsetRight);
      expect(offsetRight > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_LEFT, displayId);
      await CommonFunc.sleep(500);
 
      let offsetLeft: number = getHGridOffset();
      console.info('[gridKeyboardScrollHorizontal_0800] offset after DPAD_LEFT: ' + offsetLeft);
      expect(offsetLeft < offsetRight).assertTrue();
      console.info('[gridKeyboardScrollHorizontal_0800] END');
    })
  })
}