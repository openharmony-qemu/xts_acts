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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import ble from '@ohos.bluetooth.ble';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtBleServerTestTag';
const Domain: int = 0x0000;
const CONNECTION_NOT_ESTABLISHED = 2901003;

export default function btBleServerNopUiJsunit(): void {
  describe('btBleServerNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testGattClientDisconnectNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTDISCONNECTNOP_0100
     * @tc.desc   test gatt client disconnect without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientDisconnectNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          gattClient.disconnect();
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient disconnect error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(OPERATION_FAILED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientGetServicesCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTGETSERVICESCALLBACKNOP_0100
     * @tc.desc   test gatt client getServices callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetServicesCallbackNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let functionGetServices = async () => {
          return new Promise<int>((resolve, reject) => {
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getServices(error => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionGetServices();
          hilog.info(Domain, TAG, `callback gattClient getServices`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getServices callback error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(OPERATION_FAILED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientGetServicesPromiseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTGETSERVICESPROMISENOP_0100
     * @tc.desc   test gatt client getServices promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetServicesPromiseNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          await gattClient.getServices();
          hilog.info(Domain, TAG, `promise gattClient getServices`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getServices promise error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(OPERATION_FAILED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientReadCharacteristicValueCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTREADCHARACTERISTICVALUECALLBACKNOP_0100
     * @tc.desc   test gatt client readCharacteristicValue callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientReadCharacteristicValueCallbackNop_static_0100",
      TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let descriptors: Array<ble.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor: ble.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: ble.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors
        };
        let functionReadCharacteristicValue = async () => {
          return new Promise<int>((resolve, reject) => {
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.readCharacteristicValue(characteristic, error => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionReadCharacteristicValue();
          hilog.info(Domain, TAG, `callback gattClient readCharacteristicValue`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient readCharacteristicValue callback error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PARAM_ERROR_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientReadCharacteristicValuePromiseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTREADCHARACTERISTICVALUEPROMISENOP_0100
     * @tc.desc   test gatt client readCharacteristicValue promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientReadCharacteristicValuePromiseNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let descriptors: Array<ble.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor: ble.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: ble.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors
        };
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          await gattClient.readCharacteristicValue(characteristic);
          hilog.info(Domain, TAG, `promise gattClient readCharacteristicValue`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient readCharacteristicValue promise error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PARAM_ERROR_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGetRssiValueCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGETRSSIVALUECALLBACKNOP_0100
     * @tc.desc   test gatt client getRssiValue callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRssiValueCallbackNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let functionGetRssiValue = async () => {
          return new Promise<int>((resolve, reject) => {
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getRssiValue(error => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionGetRssiValue();
          hilog.info(Domain, TAG, `callback gattClient getRssiValue`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getRssiValue callback error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CONNECTION_NOT_ESTABLISHED);
        }
        done();
      })

    /**
     * @tc.name   testGetRssiValuePromiseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGETRSSIVALUEPROMISENOP_0100
     * @tc.desc   test gatt client getRssiValue promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRssiValuePromiseNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          await gattClient.getRssiValue();
          hilog.info(Domain, TAG, `promise gattClient getRssiValue`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getRssiValue promise error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CONNECTION_NOT_ESTABLISHED);
        }
        done();
      })

    /**
     * @tc.name   testGattClientConnectNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTCONNECTNOP_0100
     * @tc.desc   test gatt client connect without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientConnectNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          gattClient.connect();
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient connect error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientCloseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTCLOSENOP_0100
     * @tc.desc   test gatt client close without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientCloseNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          gattClient.close();
        } catch (e) {
          hilog.error(Domain, TAG, `gattClient close error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientGetDeviceNameCallbackNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTGETDEVICENAMECALLBACKNOP_0100
     * @tc.desc   test gatt client getDeviceName callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetDeviceNameCallbackNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let functionGetDeviceName = async () => {
          return new Promise<int>((resolve, reject) => {
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getDeviceName(error => {
              if (error) {
                reject(error)
              } else {
                resolve(0);
              }
            });
          })
        }
        try {
          await functionGetDeviceName();
          hilog.info(Domain, TAG, `callback gattClient getDeviceName`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getDeviceName callback error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGattClientGetDeviceNamePromiseNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTGATTCLIENTGETDEVICENAMEPROMISENOP_0100
     * @tc.desc   test gatt client getDeviceName promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetDeviceNamePromiseNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          await gattClient.getDeviceName();
          hilog.info(Domain, TAG, `promise gattClient getDeviceName`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient getDeviceName promise error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testSetBLEMtuSizeNop_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_TESTSETBLEMTUSIZENOP_0100
     * @tc.desc   test gatt client setBLEMtuSize without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testSetBLEMtuSizeNop_static_0100", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
          gattClient.setBLEMtuSize(500);
          hilog.info(Domain, TAG, `gattClient setBLEMtuSize success`);
          expect(true).assertFalse();
        } catch (e) {
          hilog.error(Domain, TAG,
            `gattClient setBLEMtuSize error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(OPERATION_FAILED_CODE);
        }
        done();
      })

  })
}