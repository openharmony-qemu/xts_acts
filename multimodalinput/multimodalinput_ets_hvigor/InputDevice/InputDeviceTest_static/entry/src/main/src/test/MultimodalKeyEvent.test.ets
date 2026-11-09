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

import { KeyCode } from '@ohos.multimodalInput.keyCode';
import { Key, KeyEvent, Action } from '@ohos.multimodalInput.keyEvent';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalKeyEventTest() {
  describe("MultimodalKeyEventTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_KeyEvent_Action_0100
     * @tc.desc   Test KeyEvent Action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_KeyEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Action.CANCEL == 0).assertTrue();
          expect(Action.DOWN == 1).assertTrue();
          expect(Action.UP == 2).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyEvent_Key_0100
     * @tc.number SUB_MMI_Input_Api_KeyEvent_Key_0100
     * @tc.desc   Test KeyEvent Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyEvent_Key_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_KeyEvent_Key_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testKey: Key = {
            code: KeyCode.KEYCODE_FN,
            pressedTime: 10,
            deviceId: 1
          };
          expect(testKey.code == KeyCode.KEYCODE_FN).assertTrue();
          expect(testKey.pressedTime == 10).assertTrue();
          expect(testKey.deviceId == 1).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_KeyEvent_Key_0200
     * @tc.number SUB_MMI_Input_Api_KeyEvent_Key_0200
     * @tc.desc   Test KeyEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_KeyEvent_Key_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_KeyEvent_Key_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testKey: Key = {
            code: KeyCode.KEYCODE_FN,
            pressedTime: 10,
            deviceId: 1
          };
          let testKeyEvent: KeyEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1,
            action: Action.DOWN,
            key: testKey,
            unicodeChar: 1,
            keys: [testKey],
            ctrlKey: true,
            altKey: true,
            shiftKey: true,
            logoKey: true,
            fnKey: true,
            capsLock: true,
            numLock: true,
            scrollLock: true
          };
          expect(testKeyEvent.action == Action.DOWN).assertTrue();
          expect(testKeyEvent.key.code == testKey.code).assertTrue();
          expect(testKeyEvent.keys[0].code == testKey.code).assertTrue();
          expect(testKeyEvent.ctrlKey == true).assertTrue();
          expect(testKeyEvent.altKey == true).assertTrue();
          expect(testKeyEvent.shiftKey == true).assertTrue();
          expect(testKeyEvent.logoKey == true).assertTrue();
          expect(testKeyEvent.fnKey == true).assertTrue();
          expect(testKeyEvent.capsLock == true).assertTrue();
          expect(testKeyEvent.numLock == true).assertTrue();
          expect(testKeyEvent.scrollLock == true).assertTrue();
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