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

import { Touch, TouchEvent, Action, ToolType, SourceType } from '@ohos.multimodalInput.touchEvent';
import { InputEvent } from '@ohos.multimodalInput.inputEvent'
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalTouchEventTest() {
  describe("MultimodalTouchEventTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.desc   Test TouchEvent Action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Action.CANCEL == 0).assertTrue();
          expect(Action.DOWN == 1).assertTrue();
          expect(Action.MOVE == 2).assertTrue();
          expect(Action.UP == 3).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_ToolType_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_ToolType_0100
     * @tc.desc   Test TouchEvent ToolType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_ToolType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_ToolType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(ToolType.FINGER == 0).assertTrue();
          expect(ToolType.PEN == 1).assertTrue();
          expect(ToolType.RUBBER == 2).assertTrue();
          expect(ToolType.BRUSH == 3).assertTrue();
          expect(ToolType.PENCIL == 4).assertTrue();
          expect(ToolType.AIRBRUSH == 5).assertTrue();
          expect(ToolType.MOUSE == 6).assertTrue();
          expect(ToolType.LENS == 7).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_SourceType_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_SourceType_0100
     * @tc.desc   Test TouchEvent SourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_SourceType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_SourceType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(SourceType.TOUCH_SCREEN == 0).assertTrue();
          expect(SourceType.PEN == 1).assertTrue();
          expect(SourceType.TOUCH_PAD == 2).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Touch_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Touch_0100
     * @tc.desc   Test TouchEvent Touch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Touch_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Touch_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testTouch: Touch = {
            id: 1,
            pressedTime: 1,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            pressure: 1.0,
            width: 1,
            height: 1,
            tiltX: 1,
            tiltY: 1,
            toolX: 1,
            toolY: 1,
            toolWidth: 1,
            toolHeight: 1,
            rawX: 1,
            rawY: 1,
            toolType: ToolType.FINGER,
            fixedDisplayX: 1,
            fixedDisplayY: 1,
          };
          expect(testTouch.id == 1).assertTrue();
          expect(testTouch.pressedTime == 1).assertTrue();
          expect(testTouch.screenX == 1).assertTrue();
          expect(testTouch.screenY == 1).assertTrue();
          expect(testTouch.windowX == 1).assertTrue();
          expect(testTouch.windowY == 1).assertTrue();
          expect(testTouch.pressure == 1.0).assertTrue();
          expect(testTouch.width == 1).assertTrue();
          expect(testTouch.height == 1).assertTrue();
          expect(testTouch.tiltX == 1).assertTrue();
          expect(testTouch.tiltY == 1).assertTrue();
          expect(testTouch.toolX == 1).assertTrue();
          expect(testTouch.toolY == 1).assertTrue();
          expect(testTouch.toolWidth == 1).assertTrue();
          expect(testTouch.toolHeight == 1).assertTrue();
          expect(testTouch.rawX == 1).assertTrue();
          expect(testTouch.rawY == 1).assertTrue();
          expect(testTouch.toolType == ToolType.FINGER).assertTrue();
          expect(testTouch.fixedDisplayX == 1).assertTrue();
          expect(testTouch.fixedDisplayY == 1).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Touch_0200
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Touch_0200
     * @tc.desc   Test TouchEvent TouchEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Touch_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Touch_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testTouch: Touch = {
            id: 1,
            pressedTime: 1,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            pressure: 1.0,
            width: 1,
            height: 1,
            tiltX: 1,
            tiltY: 1,
            toolX: 1,
            toolY: 1,
            toolWidth: 1,
            toolHeight: 1,
            rawX: 1,
            rawY: 1,
            toolType: ToolType.FINGER,
            fixedDisplayX: 1,
            fixedDisplayY: 1,
          };
          let testTouchEvent: TouchEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1,
            action: Action.CANCEL,
            touch: testTouch,
            touches: [testTouch],
            sourceType: SourceType.TOUCH_SCREEN,
          };
          expect(testTouchEvent.action == Action.CANCEL).assertTrue();
          expect(testTouchEvent.touch.id == 1).assertTrue();
          expect(testTouchEvent.touches[0].id == 1).assertTrue();
          expect(testTouchEvent.sourceType == SourceType.TOUCH_SCREEN).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEvent_0100
     * @tc.number SUB_MMI_Input_Api_InputEvent_0100
     * @tc.desc   Test InputEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEvent_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputEvent_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testInputEvent: InputEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1
          };
          expect(testInputEvent.id == 1).assertTrue();
          expect(testInputEvent.actionTime == 1).assertTrue();
          expect(testInputEvent.deviceId == 1).assertTrue();
          expect(testInputEvent.screenId == 1).assertTrue();
          expect(testInputEvent.windowId == 1).assertTrue();
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