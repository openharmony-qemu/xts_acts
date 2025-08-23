/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import inputDevice from '@ohos.multimodalInput.inputDevice';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { BusinessError } from "@ohos.base"
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function InputDeviceTest() {
  describe("InputDeviceTest", (): void => {
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
     * @tc.number: SUB_MMI_Input_Api_InputDevice_0100
     * @tc.name: SUB_MMI_Input_Api_InputDevice_0100
     * @tc.desc: Test KeyboardType.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InputDevice_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(inputDevice.KeyboardType.NONE == 0);
          ExpectTrue(inputDevice.KeyboardType.UNKNOWN == 1);
          ExpectTrue(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2);
          ExpectTrue(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3);
          ExpectTrue(inputDevice.KeyboardType.HANDWRITING_PEN == 4);
          ExpectTrue(inputDevice.KeyboardType.REMOTE_CONTROL == 5);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InputDevice_0200
     * @tc.name: SUB_MMI_Input_Api_InputDevice_0200
     * @tc.desc: Test FunctionKey.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InputDevice_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputDevice_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(inputDevice.FunctionKey.CAPS_LOCK == 1);
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}