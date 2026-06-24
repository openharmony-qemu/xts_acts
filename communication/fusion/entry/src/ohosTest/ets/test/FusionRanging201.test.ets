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

import {describe, it, beforeAll, expect, Level, TestType, Size} from '@ohos/hypium';
import ranging from '@ohos.FusionConnectivity.ranging';
import { BusinessError } from '@kit.BasicServicesKit';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'


let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";
async function clickRequestPermission(text:string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
  }
}

export default function RangingTest201() {
  describe('RangingTest201', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll called')
      await clickRequestPermission(PERMISSION_TEXT);
      done();
    })

    /**
     * @tc.name testStartRangingErrcode201
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTRANGING_NOP_0100
     * @tc.desc 启动测距权限不足
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStartRangingErrcode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try {
        ranging.startRanging(params, (result: ranging.RangingResult) => {
          console.info("[fusion_js] testStartRangingErrcode201 result is: " + JSON.stringify(result));
        });
        console.info("[fusion_js] testStartRangingErrcode201 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartRangingErrcode201 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(201);
        }

        done();
      }
    });



    //
    /**
     * @tc.name testStopRangingErrcode201
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPRANGING_NOP_0100
     * @tc.desc 停止测距权限不足
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStopRangingErrcode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let params: ranging.RangingParams = {
        deviceId: "11:22:33:44:55:66",
        capabilityType: ranging.RangingTypes.NEARLINK_HADM
      };

      try {
        ranging.stopRanging((result: ranging.RangingResult) => {
          console.info("[fusion_js] testStopRangingErrcode201 result is: " + JSON.stringify(result));
          expect().assertFail();
        }, params);
        console.info("[fusion_js] testStopRangingErrcode201 callback should not be called.");
        expect().assertFail();
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info("[fusion_js] testStopRangingErrcode201 error: " + JSON.stringify(error));
        expect(error.code).assertEqual(201);
        done();
      }
    });


    /**
     * @tc.name testStartPassiveRangingErrcode201
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STARTPASSIVERANGING_NOP_0100
     * @tc.desc 启动被动测距权限不足
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStartPassiveRangingErrcode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await ranging.startPassiveRanging(ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStartPassiveRangingErrcode201 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStartPassiveRangingErrcode201 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(201);
        }
        done();
      }
    });


    /**
     * @tc.name testStopPassiveRangingErrcode201
     * @tc.number SUB_COMMUNICATION_CONNECTIVITYKIT_RANGING_STOPPASSIVERANGING_NOP_0100
     * @tc.desc 停止被动测距权限不足
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testStopPassiveRangingErrcode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let handle: number = 123;

      try {
        console.info("[fusion_js] testStopPassiveRangingErrcode201 handle value is: " + handle);
        ranging.stopPassiveRanging(handle, ranging.RangingTypes.NEARLINK_HADM);
        console.info("[fusion_js] testStopPassiveRangingErrcode201 should fail.");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("[fusion_js] testStopPassiveRangingErrcode201 error: " + JSON.stringify(err));
        if (err.code === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
          let isSupport: boolean = ranging.isRangingSupported();
          expect(isSupport).assertFalse();
        } else {
          expect(err.code).assertEqual(201);
        }
        done();
      }
    });


  });
}