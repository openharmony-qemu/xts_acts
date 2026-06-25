/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import common from '@ohos.bluetooth.common';
const PERMISSION_DENIED_CODE = 201
let btAddr: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.REAL,
};
let deviceAddress: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddr,
};
let deviceCapability: partnerAgent.DeviceCapability = {
  "supportBR": true,
  "supportBleAdvertiser": true,
};
let businessCapability: partnerAgent.BusinessCapability = {
  "supportMediaControl": true,
  "supportTelephonyControl": true,
};
let partnerAgentExtensionAbilityName: string = "testAbilityName";


export default function fusionNopUiJsunit() {
  describe('fusionNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      console.info('beforeAll end');
    });
    beforeEach(() => {
      console.info('beforeEach end');
    });
    afterEach(() => {
      console.info('afterEach end');
    });
    afterAll(() => {
      console.info('afterAll end');
    });
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_0100
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_NOP_0100
     * @tc.desc   Test function bindDevice;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability, partnerAgentExtensionAbilityName);
        expect().assertFail();
      } catch (error) {
        console.error(`[fusion_js]bindDevice  is failed, code is ${error.code},message is ${error.message}`);
        if (Number(error.code) === 801) {
          console.info('[bluetooth_js]设备 is not support');
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_0200
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_NOP_0200
     * @tc.desc   Test function bindDevice;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        await partnerAgent.unbindDevice(deviceAddress);
        expect().assertFail();
      } catch (error) {
        console.error(`[fusion_js]unbindDevice  is failed, code is ${error.code},message is ${error.message}`);
        if (Number(error.code) === 801) {
          console.info('[bluetooth_js]设备 is not support');
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_0300
     * @tc.number SUB_COMMUNICATION_FUSION_AGENT_NOP_0300
     * @tc.desc   Test function bindDevice;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done : Function) => {
      try {
        partnerAgent.getBoundDevices();
        expect().assertFail();
      } catch (error) {
        console.error(`[fusion_js]unbindDevice  is failed, code is ${error.code},message is ${error.message}`);
        if (Number(error.code) === 801) {
          console.info('[bluetooth_js]设备 is not support');
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
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
    })
  })
}
