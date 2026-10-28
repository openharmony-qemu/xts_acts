'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium-static/src/main/indexStatic";
import connection from '@ohos.bluetooth.connection';
import hilog from '@ohos.hilog';
import constant from '@ohos.bluetooth.constant';
import access from '@ohos.bluetooth.access';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtConnectionTestTag';
const Domain: int = 0x0000;

function onReceiveEvent_ScanMode_real(data: connection.ScanMode) {
  hilog.info(Domain, TAG, '[bluetooth_js]hid onReceiveEvent_ScanMode result' + JSON.stringify(data));
  if (data === connection.ScanMode.SCAN_MODE_NONE) {
    hilog.info(Domain, TAG, '[bluetooth_js]hid onReceiveEvent_ScanMode success');
    expect(data === connection.ScanMode.SCAN_MODE_NONE).assertTrue();
    connection.offScanModeChange()
  } else {
    expect().assertFail();
    connection.offScanModeChange()
  }
}

export default function btConnectionNopUiJsunit(): void {
  describe('btConnectionNopUiJsunit', () => {

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
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAMENOP_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_NOP_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          connection.setLocalName('1111111111111111111');
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `setLocalName promise error, error code is: ${e.code}, error message is: ${e.message}`);
          if (e.code === 801) {
            hilog.info(Domain, TAG, '[bluetooth_js] RK板 is not support');
            expect(e.code === 801).assertTrue();
          } else {
            hilog.info(Domain, TAG, '[bluetooth_js] PERMISSION_DENIED_CODE 201');
            expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTION_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTIONNOP_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTION_NOP_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let oldScanMode = connection.getBluetoothScanMode();
          hilog.info(Domain, TAG, '[bluetooth_js] ScanMode_0300 oldScanMode = ' + JSON.stringify(oldScanMode));
          connection.onScanModeChange(onReceiveEvent_ScanMode_real);
          connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_NONE, 0);
          hilog.info(Domain, TAG, "[bluetooth_js]connection on/offScanModeChange  is success ");
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            "[bluetooth_js]connection on/offScanModeChange is fail , errCode:" + e.code + ",errMessage:" + e.message);
          if (e.code === 801) {
            hilog.info(Domain, TAG, '[bluetooth_js] RK板 is not support');
            expect(e.code === 801).assertTrue();
          } else {
            hilog.info(Domain, TAG, '[bluetooth_js] PERMISSION_DENIED_CODE 201');
            expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTION_HASH_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTIONHASHNOP_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONNECTION_HASH_NOP_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let hashValue: string = "c10b57deb2e1aafd255596e0d4fd6789";
        try {
          let addr: string =
            connection.getVirtualAddressByHash(connection.HashAlgorithmType.HASH_ALGORITHM_SHA256, hashValue)
          expect().assertFail();
        } catch (e) {
          if (e.code === 801) {
            hilog.info(Domain, TAG, '[bluetooth_js] RK板 is not support');
            expect(e.code === 801).assertTrue();
          } else {
            hilog.info(Domain, TAG, '[bluetooth_js] getVirtualAddressByHash fail 201');
            expect(e.code).assertEqual(201);
          }
        }
        done();
      })

  })
}