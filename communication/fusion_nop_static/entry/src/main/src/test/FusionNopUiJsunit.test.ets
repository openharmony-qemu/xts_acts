'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium';
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import ranging from '@ohos.FusionConnectivity.ranging';
import common from '@ohos.bluetooth.common';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'fusionNopUiJsunit';
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

export default function fusionNopUiJsunit(): void {
  describe('fusionNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll end');
    });
    beforeEach(() => {
      hilog.info(domain, tag, 'beforeEach end');
    });
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach end');
    });
    afterAll(() => {
      hilog.info(domain, tag, 'afterAll end');
    });
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_FUSION_AGENTNOP_0100
     * @tc.desc   Test function bindDevice 0100;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.bindDevice(deviceAddress, deviceCapability, businessCapability,
            partnerAgentExtensionAbilityName);
          expect().assertFail();
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[fusion_js]bindDevice  is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]设备 is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
          done();
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0200
     * @tc.number SUB_COMMUNICATION_FUSION_AGENTNOP_0200
     * @tc.desc   Test function bindDevice 0200;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await partnerAgent.unbindDevice(deviceAddress);
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[fusion_js]unbindDevice  is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]设备 is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0300
     * @tc.number SUB_COMMUNICATION_FUSION_AGENTNOP_0300
     * @tc.desc   Test function bindDevice 0300;API 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_FUSION_AGENT_NOP_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          partnerAgent.getBoundDevices();
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[fusion_js]unbindDevice  is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]设备 is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

  })
}