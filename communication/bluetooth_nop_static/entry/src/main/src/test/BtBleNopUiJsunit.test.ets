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

import hilog from '@ohos.hilog';
import ble from '@ohos.bluetooth.ble';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import common from '@ohos.bluetooth.common';
import hid from '@ohos.bluetooth.hid';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtBleTestTag';
const Domain: int = 0x0000;
const INVALID_ADVERTISING_ID = 2902055;
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let device: ble.GattClientDevice | undefined;
let gattServer: ble.GattServer | undefined;
let btAddr: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.REAL,
};
let deviceId = "00:11:22:33:44:55";

let phyValue: ble.PhyValue = {
  txPhy: ble.BlePhy.BLE_PHY_1M,
  rxPhy: ble.BlePhy.BLE_PHY_2M,
  phyMode: ble.CodedPhyMode.BLE_PHY_CODED_S2,
};

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

export default function btBleNopUiJsunit(): void {
  describe('btBleNopUiJsunit', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      device = ble.createGattClientDevice('00:11:22:33:44:55');
      hilog.info(Domain, TAG, '[bt_arkts] client readPhy success');
      gattServer = ble.createGattServer();
      hilog.info(Domain, TAG, '[bt_arkts] client readPhy success');
      hilog.info(Domain, TAG, 'beforeAll');
      done();
    });
    beforeEach(() => {
      hilog.info(Domain, TAG, 'beforeEach');
    });
    afterEach(() => {
      hilog.info(Domain, TAG, 'afterEach');
    });
    afterAll(() => {
      hilog.info(Domain, TAG, 'afterAll');
    });

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESNOP_0100
     * @tc.desc   Test server readPhy without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.readPhy(deviceId);
          hilog.info(Domain, TAG, '[bt_arkts] server readPhy is success')
          expect().assertFail();
        } catch (error) {
          hilog.error(Domain, TAG,
            `[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
          if ( error.code === 801) {
            hilog.info(Domain, TAG, "RK板 is not support.");
            expect( error.code === 801).assertTrue();
          } else {
            expect( error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESNOP_0200
     * @tc.desc   Test server setPhy  without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let deviceId = "00:11:22:33:44:55";
          await gattServer!.setPhy(deviceId, phyValue);
          hilog.info(Domain, TAG, '[bt_arkts]server setPhy is success')
          expect().assertFail();
        } catch (error) {
          hilog.error(Domain, TAG,
            `[bt_arkts]server setPhy  is failed, code is ${error.code},message is ${error.message}`);
          if ( error.code === 801) {
            hilog.info(Domain, TAG, "RK板 is not support.");
            expect( error.code === 801).assertTrue();
          } else {
            expect( error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   testStopAdvertisingNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTSTOPADVERTISINGNOP_0100
     * @tc.desc   test stopAdvertising by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let advHandle = 0xFF;
          await ble.stopAdvertising(advHandle);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG, `stopAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(INVALID_ADVERTISING_ID);
        }
        done();
      })

    /**
     * @tc.name   testStopAdvertisingAsyncCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTSTOPADVERTISINGASYNCCALLBACKNOP_0100
     * @tc.desc   test stopAdvertising by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingAsyncCallbackNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let advHandle = 0xFF;
        let functionStopAdvertising = async () => {
          return new Promise<int>((resolve, reject) => {
            ble.stopAdvertising(advHandle, (error: BusinessError | null) => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionStopAdvertising();
          hilog.info(Domain, TAG, `callback stopAdvertising`);
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `callback stopAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
          expect( error.code).assertEqual(INVALID_ADVERTISING_ID);
        }
        done();
      })

    /**
     * @tc.name   testStopAdvertisingNoParamNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTSTOPADVERTISINGNOPARAMNOP_0100
     * @tc.desc   test stopAdvertising without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingNoParamNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          ble.stopAdvertising();
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `stopAdvertising no param error, error code is: ${error.code}, error message is: ${error.message}`);
          expect( error.code).assertEqual(INVALID_ADVERTISING_ID);
        }
        done();
      })

    /**
     * @tc.name   testGATTSERVER_GETCONNECTEDSTATE_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETCONNECTEDSTATENOP_0100
     * @tc.desc   20251113API22用例覆盖GattServer-getConnectedState without permission .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGATTSERVER_GETCONNECTEDSTATE_NOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let return_status = gattServer!.getConnectedState('01:02:00:02:03:01');
          hilog.info(Domain, TAG, '[bt_arkts]get status is' + JSON.stringify(return_status))
          expect().assertFail();
        } catch (error) {
          hilog.error(Domain, TAG,
            `[bt_arkts]server ProfileConnectionState 0100 is failed, code is ${error.code},message is ${error.message}`);
          if ( error.code === 801) {
            hilog.info(Domain, TAG, "RK板 is not support.");
            expect( error.code === 801).assertTrue();
          } else {
            expect( error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   testGATTCLIENTDEVICE_GETCONNECTEDSTATE_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEGETCONNECTEDSTATENOP_0100
     * @tc.desc   20251113API22用例覆盖GattClientDevice-getConnectedState without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGATTCLIENTDEVICE_GETCONNECTEDSTATE_NOP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let return_status = device!.getConnectedState();
          hilog.info(Domain, TAG, '[bt_arkts] client ProfileConnectionState 0100 is' + JSON.stringify(return_status))
          expect().assertFail();
        } catch (error) {
          hilog.error(Domain, TAG,
            `[bt_arkts]getConnectedState status is failed, code is ${error.code},message is ${error.message}`);
          if ( error.code === 801) {
            hilog.info(Domain, TAG, "RK板 is not support.");
            expect( error.code === 801).assertTrue();
          } else {
            expect( error.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_NOP_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTSERVERREMOVEALLSERVICESNOP_0100
     * @tc.desc   Test removeAllServices without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_NOP_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          gattServer!.removeAllServices();
          hilog.info(Domain, TAG, "removeAllServices success")
          expect().assertFail();
        } catch (err) {
          hilog.error(Domain, TAG,
            "removeAllServices error, errCode:" + err.code + ",errMessage:" + err.message + typeof err.code);
          if (err.code === 801) {
            hilog.info(Domain, TAG,
              '[bluetooth_js]removeAllServices is not support or removeAllServices as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

  })
}