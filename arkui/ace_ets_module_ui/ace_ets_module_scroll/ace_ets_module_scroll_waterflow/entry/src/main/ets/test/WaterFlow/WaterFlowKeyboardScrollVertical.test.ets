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

// 从V_WF_OFFSET文本中解析当前纵向滚动偏移量，如'offset=123'解析为123
function getVWaterFlowOffset(): number {
  let strJson: string = getInspectorByKey('V_WF_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[waterFlowKeyboardScrollVertical] current offset content: " + content);
  return Number.parseInt(content.substring('offset='.length));
}

export default function waterFlowKeyboardScrollVertical() {
  describe('waterFlowKeyboardScrollVertical', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowKeyboardScrollVertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowKeyboardScrollVertical",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowKeyboardScrollVertical state pages:" + JSON.stringify(pages));
        if (!("waterFlowKeyboardScrollVertical" == pages.name)) {
          console.info("get waterFlowKeyboardScrollVertical pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowKeyboardScrollVertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowKeyboardScrollVertical page error:" + err);
      }
      console.info("waterFlowKeyboardScrollVertical beforeEach end");
      done();
    });

    /**
     * @tc.name   waterFlowKeyboardScrollVertical_0100
     * @tc.number SUB_ARKUI_WATERFLOW_ENABLESCROLLWITHKEYBOARD_PARAM_0100
     * @tc.desc   Test vertical WaterFlow scrolls with keyboard arrow keys when
     *            enableScrollWithKeyboard is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowKeyboardScrollVertical_0100', Level.LEVEL1, async () => {
      console.info('[waterFlowKeyboardScrollVertical_0100] START');
      let driver = await Driver.create();
      let trueBtn: Component = await driver.findComponent(ON.id('V_WF_TRUE'));
      await trueBtn.click();
      await CommonFunc.sleep(500);
      console.info('[waterFlowKeyboardScrollVertical_0100] V_WF_FLOW inspector: ' + getInspectorByKey('V_WF_FLOW'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_WF_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVWaterFlowOffset()).assertEqual(0);

      let flowComp: Component = await driver.findComponent(ON.id('V_WF_FLOW'));
      let displayId: number = await flowComp.getDisplayId();
      console.info('[waterFlowKeyboardScrollVertical_0100] displayId: ' + displayId);
      await flowComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVWaterFlowOffset();
      console.info('[waterFlowKeyboardScrollVertical_0100] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();

      for (let i = 0; i < 2; i++) {
        await driver.triggerKey(KEYCODE_DPAD_UP, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetUp: number = getVWaterFlowOffset();
      console.info('[waterFlowKeyboardScrollVertical_0100] offset after DPAD_UP: ' + offsetUp);
      expect(offsetUp < offsetDown).assertTrue();
      console.info('[waterFlowKeyboardScrollVertical_0100] END');
    })

    /**
     * @tc.name   waterFlowKeyboardScrollVertical_0200
     * @tc.number SUB_ARKUI_WATERFLOW_ENABLESCROLLWITHKEYBOARD_PARAM_0200
     * @tc.desc   Test vertical WaterFlow does not scroll with keyboard arrow keys
     *            when enableScrollWithKeyboard is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowKeyboardScrollVertical_0200', Level.LEVEL1, async () => {
      console.info('[waterFlowKeyboardScrollVertical_0200] START');
      let driver = await Driver.create();
      let falseBtn: Component = await driver.findComponent(ON.id('V_WF_FALSE'));
      await falseBtn.click();
      await CommonFunc.sleep(500);
      console.info('[waterFlowKeyboardScrollVertical_0200] V_WF_FLOW inspector: ' + getInspectorByKey('V_WF_FLOW'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_WF_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVWaterFlowOffset()).assertEqual(0);

      let flowComp: Component = await driver.findComponent(ON.id('V_WF_FLOW'));
      let displayId: number = await flowComp.getDisplayId();
      console.info('[waterFlowKeyboardScrollVertical_0200] displayId: ' + displayId);
      await flowComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVWaterFlowOffset();
      console.info('[waterFlowKeyboardScrollVertical_0200] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown).assertEqual(0);
      console.info('[waterFlowKeyboardScrollVertical_0200] END');
    })

    /**
     * @tc.name   waterFlowKeyboardScrollVertical_0300
     * @tc.number SUB_ARKUI_WATERFLOW_ENABLESCROLLWITHKEYBOARD_PARAM_0300
     * @tc.desc   Test vertical WaterFlow scrolls with keyboard arrow keys when
     *            enableScrollWithKeyboard is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowKeyboardScrollVertical_0300', Level.LEVEL1, async () => {
      console.info('[waterFlowKeyboardScrollVertical_0300] START');
      let driver = await Driver.create();
      let undefBtn: Component = await driver.findComponent(ON.id('V_WF_UNDEF'));
      await undefBtn.click();
      await CommonFunc.sleep(500);
      console.info('[waterFlowKeyboardScrollVertical_0300] V_WF_FLOW inspector: ' + getInspectorByKey('V_WF_FLOW'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_WF_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVWaterFlowOffset()).assertEqual(0);

      let flowComp: Component = await driver.findComponent(ON.id('V_WF_FLOW'));
      let displayId: number = await flowComp.getDisplayId();
      console.info('[waterFlowKeyboardScrollVertical_0300] displayId: ' + displayId);
      await flowComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVWaterFlowOffset();
      console.info('[waterFlowKeyboardScrollVertical_0300] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
      console.info('[waterFlowKeyboardScrollVertical_0300] END');
    })

    /**
     * @tc.name   waterFlowKeyboardScrollVertical_0400
     * @tc.number SUB_ARKUI_WATERFLOW_ENABLESCROLLWITHKEYBOARD_PARAM_0400
     * @tc.desc   Test vertical WaterFlow scrolls with keyboard arrow keys when
     *            enableScrollWithKeyboard is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowKeyboardScrollVertical_0400', Level.LEVEL1, async () => {
      console.info('[waterFlowKeyboardScrollVertical_0400] START');
      let driver = await Driver.create();
      let nullBtn: Component = await driver.findComponent(ON.id('V_WF_NULL'));
      await nullBtn.click();
      await CommonFunc.sleep(500);
      console.info('[waterFlowKeyboardScrollVertical_0400] V_WF_FLOW inspector: ' + getInspectorByKey('V_WF_FLOW'));
      let resetBtn: Component = await driver.findComponent(ON.id('V_WF_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getVWaterFlowOffset()).assertEqual(0);

      let flowComp: Component = await driver.findComponent(ON.id('V_WF_FLOW'));
      let displayId: number = await flowComp.getDisplayId();
      console.info('[waterFlowKeyboardScrollVertical_0400] displayId: ' + displayId);
      await flowComp.click();
      await CommonFunc.sleep(500);

      for (let i = 0; i < 3; i++) {
        await driver.triggerKey(KEYCODE_DPAD_DOWN, displayId);
        await CommonFunc.sleep(500);
      }
      let offsetDown: number = getVWaterFlowOffset();
      console.info('[waterFlowKeyboardScrollVertical_0400] offset after DPAD_DOWN: ' + offsetDown);
      expect(offsetDown > 0).assertTrue();
      console.info('[waterFlowKeyboardScrollVertical_0400] END');
    })
  })
}
