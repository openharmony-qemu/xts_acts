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
     * @tc.number: SUB_MMI_Input_Api_IptDev_KeyboardType_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_KeyboardType_0100
     * @tc.desc: Test inputDevice KeyboardType.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_KeyboardType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_KeyboardType_0100";
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
     * @tc.number: SUB_MMI_Input_Api_IptDev_FunctionKey_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_FunctionKey_0100
     * @tc.desc: Test FunctionKey.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_FunctionKey_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_FunctionKey_0100";
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

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100
     * @tc.desc: Test callback getDeviceInfo interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0100";
      try {
        inputDevice.getDeviceInfo(1, (error: BusinessError<void>|null, deviceData: inputDevice.InputDeviceData|undefined):void => {
          if (error) {
            hilog.info(domain, tag, `${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Device info: ${JSON.stringify(deviceData)}`);
            hilog.info(domain, tag, `deviceData: ${typeof(deviceData)}`);
            ExpectTrue(typeof(deviceData) == 'object');
            done();
          }
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag,`${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200
     * @tc.desc: Test promise getDeviceInfo interface to get information about a specified input device.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceInfo_0200";
      try {
        inputDevice.getDeviceInfo(1).then((deviceData: inputDevice.InputDeviceData) => {
          hilog.info(domain, tag, `${caseName} Device info: ${JSON.stringify(deviceData)}`);
          ExpectTrue(typeof(deviceData) == 'object');
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `${caseName} Failed to get device info, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceList_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceList_0100
     * @tc.desc: Test callback getDeviceList interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0100";
      try {
        inputDevice.getDeviceList((error: BusinessError<void>|null, ids: Array<Double>|undefined):void => {
          if (error) {
            hilog.info(domain, tag, `${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Device id list: ${JSON.stringify(ids)}`);
            ExpectTrue(Array.isArray(ids));
            done();
          }
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `${caseName} Failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_getDeviceList_0200
     * @tc.name: SUB_MMI_Input_Api_IptDev_getDeviceList_0200
     * @tc.desc: Test promise getDeviceList interface to get the ID list of all input devices.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_getDeviceList_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      let caseName = "SUB_MMI_Input_Api_IptDev_getDeviceList_0200";
      try {
        inputDevice.getDeviceList().then((ids: Array<Number>) => {
          hilog.info(domain, tag, `${caseName} Device id list: ${JSON.stringify(ids)}`);
          ExpectTrue(Array.isArray(ids));
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `${caseName} Failed to get device id list, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_IptDev_inputDeviceOn_0100
     * @tc.name: SUB_MMI_Input_Api_IptDev_inputDeviceOn_0100
     * @tc.desc: Test inputDevice on interface
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_inputDeviceOn_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      hilog.info(domain, tag, `InputDevice_on_test enter`);
      let isPhysicalKeyboardExist = 0;
      try {
        inputDevice.on("change", (data): void => {
          hilog.info(domain, tag, `InputDevice_on_test type: ${data.type}, deviceId: ${data.deviceId}`);
          isPhysicalKeyboardExist++;
          ExpectTrue(isPhysicalKeyboardExist == 1);
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `InputDevice_on_test error`);
        ExpectFalse(true);
      }
      done();
      hilog.info(domain, tag, `InputDevice_on_test exit`);
    })
  })
}