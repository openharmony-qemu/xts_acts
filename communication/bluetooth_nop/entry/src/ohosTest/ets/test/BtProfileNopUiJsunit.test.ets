/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import baseProfile from '@ohos.bluetooth.baseProfile';
import a2dp from '@ohos.bluetooth.a2dp';
import pan from '@ohos.bluetooth.pan';
import hilog from '@ohos.hilog';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtProfileTestTag';
const Domain: number = 0x0000;

export default function btProfileNopUiJsunit() {
  describe('btProfileNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testGetConnectionStateNop
     * @tc.number testGetConnectionStateNop
     * @tc.desc   test getConnectionState without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetConnectionStateNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let a2dpSrc = a2dp.createA2dpSrcProfile();
        let state = a2dpSrc.getConnectionState('3e:45:7f:cc:45:3f');
        hilog.info(Domain, TAG, `getConnectionState ${state}`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `getConnectionState error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PARAM_ERROR_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetConnectedDevicesNop
     * @tc.number testGetConnectedDevicesNop
     * @tc.desc   test getConnectedDevices without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetConnectedDevicesNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let a2dpSrc = a2dp.createA2dpSrcProfile();
        let devices = a2dpSrc.getConnectedDevices();
        hilog.info(Domain, TAG, `getConnectedDevices without permission ${JSON.stringify(devices)}`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `getConnectedDevices error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetPlayingStateNop
     * @tc.number testGetPlayingStateNop
     * @tc.desc   test getPlayingState without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetPlayingStateNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let a2dpSrc = a2dp.createA2dpSrcProfile();
        let state = a2dpSrc.getPlayingState('3e:45:7f:cc:45:3f');
        hilog.info(Domain, TAG, `getPlayingState ${state}`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `getPlayingState error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PARAM_ERROR_CODE);
      }
      done();
    })

    /**
     * @tc.name SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_NOP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_NOP_0100
     * @tc.desc 测试 PanProfile 的 isTetheringOn 方法 - 缺少蓝牙访问权限
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
     it('SUB_COMMUNICATION_BLUETOOTH_PAN_ISTETHERINGON_NOP_0100', Level.LEVEL1,   () => {
      try {
        let panProfile: pan.PanProfile = pan.createPanProfile();
        panProfile.isTetheringOn();
        expect().assertFail();
      } catch (err) {
        console.info("[bt_arkts] isTetheringOn error: " + JSON.stringify(err));
        if (Number(err.code) === 801) {
          console.info("设备 is not support.");
          expect(Number(err.code)).assertEqual(801);
        } else {
          expect(Number(err.code)).assertEqual(201);
        }
      }
    });
  })
}