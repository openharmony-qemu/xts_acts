'use static';
/*
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
import { inputEventClient, KeyCode, Axis, Button, } from '@kit.InputKit';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { BusinessError } from "@ohos.base"
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function InputEventClientTest() {
  describe("InputEventClientTest", (): void => {
    hilog.info(domain, tag, "InputEventClientTest staticTest");
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_static_InputEventClient_0100
     * @tc.number SUB_MMI_Input_Api_static_InputEventClient_0100
     * @tc.desc   Test KeyboardType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_static_InputEventClient_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_static_InputEventClient_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputEventClient.createKeyboardController()
          .then((keyboardController: inputEventClient.KeyboardController) =>{
            hilog.info(domain, tag, "keyboardController.pressKey");
            keyboardController.pressKey(KeyCode.KEYCODE_A);
            return keyboardController;
          })
          .then((keyboardController: inputEventClient.KeyboardController) =>{
            keyboardController.releaseKey(KeyCode.KEYCODE_A);
          }).then(() => {
            hilog.info(domain, tag, `Succeeded in releasing key`);
          }).catch((error) => {
            hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error1 ${error.code}`);
            if (error.code === 801) {
 	            expect(error.code).assertEqual(801);
 	          } else {
 	            expect(error.code).assertEqual(201);
 	          }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error2 ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
      
    /**
     * @tc.name   SUB_MMI_Input_Api_static_InputEventClient_0200
     * @tc.number SUB_MMI_Input_Api_static_InputEventClient_0200
     * @tc.desc   Test MouseController moveTo event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_static_InputEventClient_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_static_InputEventClient_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputEventClient.createMouseController().then((mouseController: inputEventClient.MouseController) =>{
            return mouseController.moveTo(0, 100, 200);
          }).then(() => {
            hilog.info(domain, tag, `Succeeded in moving mouse`);
          }).catch((error) => {
            hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error1 ${error.code}`);
            if (error.code === 801) {
 	            expect(error.code).assertEqual(801);
 	          } else {
 	            expect(error.code).assertEqual(201);
 	          }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error2 ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_static_InputEventClient_0300
     * @tc.number SUB_MMI_Input_Api_static_InputEventClient_0300
     * @tc.desc   Test MouseController Axis event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_static_InputEventClient_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_static_InputEventClient_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputEventClient.createMouseController().then((mouseController: inputEventClient.MouseController) =>{
            mouseController.beginAxis(Axis.SCROLL_VERTICAL, 10);
            return mouseController;
          }).then((mouseController: inputEventClient.MouseController) =>{
            mouseController.updateAxis(Axis.SCROLL_VERTICAL, 20);
            return mouseController;
          }).then((mouseController: inputEventClient.MouseController) =>{
            mouseController.endAxis(Axis.SCROLL_VERTICAL);
          }).then(() => {
            hilog.info(domain, tag, `Succeeded in ending axis event`);
          }).catch((error) => {
            hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error1 ${error.code}`);
            if (error.code === 801) {
 	            expect(error.code).assertEqual(801);
 	          } else {
 	            expect(error.code).assertEqual(201);
 	          }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error2 ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_static_InputEventClient_0400
     * @tc.number SUB_MMI_Input_Api_static_InputEventClient_0400
     * @tc.desc   Test MouseController Button event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_static_InputEventClient_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_static_InputEventClient_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputEventClient.createMouseController().then((mouseController: inputEventClient.MouseController) =>{
            mouseController.pressButton(Button.LEFT);
            return mouseController;
          }).then((mouseController: inputEventClient.MouseController) =>{
            mouseController.releaseButton(Button.LEFT);
          }).then(() => {
            hilog.info(domain, tag, `Succeeded in releasing keSucceeded in releasing mouse button`);
          }).catch((error) => {
            hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error1 ${error.code}`);
            if (error.code === 801) {
 	            expect(error.code).assertEqual(801);
 	          } else {
 	            expect(error.code).assertEqual(201);
 	          }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error2 ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
 	  * @tc.name   SUB_MMI_Input_Api_static_InputEventClient_0500
 	  * @tc.number SUB_MMI_Input_Api_static_InputEventClient_0500
 	  * @tc.desc   Test createTouchController Button event.
 	  * @tc.type   FUNCTION
 	  * @tc.size   MEDIUMTEST
 	  * @tc.level  LEVEL0
 	  */
    it("SUB_MMI_Input_Api_static_InputEventClient_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_static_InputEventClient_0500";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputEventClient.createTouchController().then((touchController: inputEventClient.TouchController) =>{
            touchController.touchDown({
 	            id:0,
 	            displayId:0,
 	            displayX:100,
 	            displayY:100
 	          })
            return touchController;
          }).then((touchController: inputEventClient.TouchController) =>{
            touchController.touchMove({
 	            id:0,
 	            displayId:0,
 	            displayX:200,
 	            displayY:200
            })
            return touchController;
 	          }).then((touchController: inputEventClient.TouchController) =>{
            touchController.touchUp({
 	            id:0,
 	            displayId:0,
 	            displayX:200,
 	            displayY:200
            })
            return touchController;
          }).catch((error) => {
            hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error1 ${error.code}`);
            if (error.code === 801) {
 	            expect(error.code).assertEqual(801);
 	          } else {
 	            expect(error.code).assertEqual(201);
 	          }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${error} SUB_MMI_Input_Api_static_InputEventClient error2 ${error.code}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}