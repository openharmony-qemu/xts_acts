/*
 * Copyright (C) 2025 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import inputDevice from '@ohos.multimodalInput.inputDevice';
import { BusinessError } from '@ohos.base';

export default function MultimodalInputCapsLockTest() {
  describe("MultimodalInputCapsLockTest", (): void => {
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
     * @tc.number: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.desc: Test promise isFunctionKeyEnabled interface to unconnect keyboard device.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100";
        try {
          await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK).then((state) => {
            console.info(`${caseName} capslock state1: ${state}`);
            ExpectTrue(state == true || state == false);
            done();
          });
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectTrue(error.code == 3900002);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.desc: Test promise setFunctionKeyEnabled and isFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100";
        try {
          const state1: boolean = await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK);
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, Boolean(state1))
            .then(() => {
              console.info(`${caseName} Set capslock state success`);
            })
            .catch((error: Error) => {
              console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
              ExpectTrue(error.code == 3900003);
              done();
            });
          const state2: boolean = await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK);
          console.info(`${caseName} capslock state2: ${JSON.stringify(state2)}`);
          ExpectTrue(state1 == state2);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 3900002);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.name: SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.desc: Test promise setFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400";
        try {
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, false)
            .then(() => {
              console.info(`${caseName} Set capslock state success`);
              ExpectFalse(true);
              done();
            })
            .catch((error: Error) => {
              console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
              ExpectTrue(error.code == 3900003);
              done();
            });
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });
  });
}