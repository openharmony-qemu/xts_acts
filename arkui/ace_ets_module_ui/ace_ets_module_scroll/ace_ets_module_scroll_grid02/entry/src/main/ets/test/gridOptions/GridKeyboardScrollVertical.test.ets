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
 
// 从VKB_GRID_OFFSET文本中解析当前纵向滚动偏移量，如'offset=123'解析为123
function getVGridOffset(): number {
  let strJson: string = getInspectorByKey('VKB_GRID_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[gridKeyboardScrollVertical] current offset content: " + content);
  return Number.parseInt(content.split('=')[1]);
}
 
export default function gridKeyboardScrollVertical() {
  describe('gridKeyboardScrollVertical', () => {
    beforeEach(async (done: Function) => {
      console.info("gridKeyboardScrollVertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/gridKeyboardScrollVertical",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridKeyboardScrollVertical state pages:" + JSON.stringify(pages));
        if (!("gridKeyboardScrollVertical" == pages.name)) {
          console.info("get gridKeyboardScrollVertical pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridKeyboardScrollVertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridKeyboardScrollVertical page error:" + err);
      }
      console.info("gridKeyboardScrollVertical beforeEach end");
      done();
    });
 
    /**
     * @tc.name   gridKeyboardScrollVertical_0100
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0100
     * @tc.desc   Test vertical Grid scrolls with keyboard arrow keys when enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollVertical_0100', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollVertical_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let trueBtn: Component = await driver.findComponent(ON.id('VKB_GRID_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('VKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollVertical_0100] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('VKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('VKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollVertical_0100] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0100] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
      await CommonFunc.sleep(500);
 
      let offsetUp: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0100] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[gridKeyboardScrollVertical_0100] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollVertical_0200
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0200
     * @tc.desc   Test vertical Grid does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollVertical_0200', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollVertical_0200] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let falseBtn: Component = await driver.findComponent(ON.id('VKB_GRID_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('VKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollVertical_0200] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(false);
 
      let resetBtn: Component = await driver.findComponent(ON.id('VKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('VKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollVertical_0200] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0200] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown).assertEqual(0);
 
      await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
      await CommonFunc.sleep(500);
 
      let offsetUp: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0200] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp).assertEqual(0);
      console.info('[gridKeyboardScrollVertical_0200] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollVertical_0300
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0300
     * @tc.desc   Test vertical Grid scrolls with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollVertical_0300', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollVertical_0300] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let undefBtn: Component = await driver.findComponent(ON.id('VKB_GRID_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('VKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollVertical_0300] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('VKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('VKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollVertical_0300] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0300] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
      await CommonFunc.sleep(500);
 
      let offsetUp: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0300] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[gridKeyboardScrollVertical_0300] END');
    })
 
    /**
     * @tc.name   gridKeyboardScrollVertical_0400
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLWITHKEYBOARD_PARAM_0400
     * @tc.desc   Test vertical Grid scrolls with keyboard arrow keys when enableScrollWithKeyboard is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridKeyboardScrollVertical_0400', Level.LEVEL1, async () => {
      console.info('[gridKeyboardScrollVertical_0400] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let nullBtn: Component = await driver.findComponent(ON.id('VKB_GRID_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('VKB_GRID');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridKeyboardScrollVertical_0400] enableScrollWithKeyboard: " +
        JSON.stringify(obj.$attrs.enableScrollWithKeyboard));
      expect(obj.$attrs.enableScrollWithKeyboard).assertEqual(true);
 
      let resetBtn: Component = await driver.findComponent(ON.id('VKB_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVGridOffset()).assertEqual(0);
 
      let gridComp: Component = await driver.findComponent(ON.id('VKB_GRID'));
      let displayId: number = await gridComp.getDisplayId();
      console.info('[gridKeyboardScrollVertical_0400] displayId: ' + displayId);
      await gridComp.click();
      await CommonFunc.sleep(500);
 
      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0400] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
 
      await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
      await CommonFunc.sleep(500);
 
      let offsetUp: number = getVGridOffset();
      console.info('[gridKeyboardScrollVertical_0400] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[gridKeyboardScrollVertical_0400] END');
    })
  })
}