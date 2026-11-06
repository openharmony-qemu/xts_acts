'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { AxisValue, MouseEvent, Action, Button, Axis, ToolType } from '@ohos.multimodalInput.mouseEvent';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalMouseEventTest() {
  describe("MultimodalMouseEventTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Action_0100
     * @tc.desc   Test MouseEvent Action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_MouseEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Action.CANCEL == 0).assertTrue();
          expect(Action.MOVE == 1).assertTrue();
          expect(Action.BUTTON_DOWN == 2).assertTrue();
          expect(Action.BUTTON_UP == 3).assertTrue();
          expect(Action.AXIS_BEGIN == 4).assertTrue();
          expect(Action.AXIS_UPDATE == 5).assertTrue();
          expect(Action.AXIS_END == 6).assertTrue();
          expect(Action.ACTION_DOWN == 7).assertTrue();
          expect(Action.ACTION_UP == 8).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Button_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Button_0100
     * @tc.desc   Test MouseEvent Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_MouseEvent_Button_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Button_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Button.LEFT == 0).assertTrue();
          expect(Button.MIDDLE == 1).assertTrue();
          expect(Button.RIGHT == 2).assertTrue();
          expect(Button.SIDE == 3).assertTrue();
          expect(Button.EXTRA == 4).assertTrue();
          expect(Button.FORWARD == 5).assertTrue();
          expect(Button.BACK == 6).assertTrue();
          expect(Button.TASK == 7).assertTrue();

          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Axis_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Axis_0100
     * @tc.desc   Test MouseEvent Axis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_Axis_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Axis_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Axis.SCROLL_VERTICAL == 0).assertTrue();
          expect(Axis.SCROLL_HORIZONTAL == 1).assertTrue();
          expect(Axis.PINCH == 2).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_AxisValue_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_AxisValue_0100
     * @tc.desc   Test MouseEvent AxisValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_AxisValue_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_AxisValue_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testAxisValue: AxisValue = {
            axis: Axis.SCROLL_VERTICAL,
            value: 1
          };
          expect(testAxisValue.axis == Axis.SCROLL_VERTICAL).assertTrue();
          expect(testAxisValue.value == 1).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_ToolType_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_ToolType_0100
     * @tc.desc   Test MouseEvent ToolType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_ToolType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_ToolType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(ToolType.UNKNOWN == 0).assertTrue();
          expect(ToolType.MOUSE == 1).assertTrue();
          expect(ToolType.JOYSTICK == 2).assertTrue();
          expect(ToolType.TOUCHPAD == 3).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_ToolType_0200
     * @tc.number SUB_MMI_Input_Api_MouseEvent_ToolType_0200
     * @tc.desc   Test MouseEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_ToolType_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_ToolType_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testAxisValue: AxisValue = {
            axis: Axis.SCROLL_VERTICAL,
            value: 1
          };
          let testMouseEvent: MouseEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1,
            action: Action.CANCEL,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            rawDeltaX: 1,
            rawDeltaY: 1,
            button: Button.LEFT,
            pressedButtons: [Button.LEFT],
            axes: [testAxisValue],
            pressedKeys: [KeyCode.KEYCODE_FN],
            ctrlKey: true,
            altKey: true,
            shiftKey: true,
            logoKey: true,
            fnKey: true,
            capsLock: true,
            numLock: true,
            scrollLock: true,
            toolType: ToolType.MOUSE
          };
          expect(testMouseEvent.action == Action.CANCEL).assertTrue();
          expect(testMouseEvent.screenX == 1).assertTrue();
          expect(testMouseEvent.screenY == 1).assertTrue();
          expect(testMouseEvent.windowX == 1).assertTrue();
          expect(testMouseEvent.windowY == 1).assertTrue();
          expect(testMouseEvent.rawDeltaX == 1).assertTrue();
          expect(testMouseEvent.rawDeltaY == 1).assertTrue();
          expect(testMouseEvent.button == Button.LEFT).assertTrue();
          expect(testMouseEvent.pressedButtons[0] == Button.LEFT).assertTrue();
          expect(testMouseEvent.axes[0].axis == Axis.SCROLL_VERTICAL).assertTrue();
          expect(testMouseEvent.pressedKeys[0] == KeyCode.KEYCODE_FN).assertTrue();
          expect(testMouseEvent.ctrlKey == true).assertTrue();
          expect(testMouseEvent.altKey == true).assertTrue();
          expect(testMouseEvent.shiftKey == true).assertTrue();
          expect(testMouseEvent.logoKey == true).assertTrue();
          expect(testMouseEvent.fnKey == true).assertTrue();
          expect(testMouseEvent.capsLock == true).assertTrue();
          expect(testMouseEvent.numLock == true).assertTrue();
          expect(testMouseEvent.scrollLock == true).assertTrue();
          expect(testMouseEvent.toolType == ToolType.MOUSE).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}