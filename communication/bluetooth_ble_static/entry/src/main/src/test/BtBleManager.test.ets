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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '@ohos/hypium-static/src/main/indexStatic';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  UiDirection,
  MouseButton,
  WindowMode,
  PointerMatrix,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import bluetoothBle from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import connection from '@ohos.bluetooth.connection';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'btBleManagerTest';
let gattS: bluetoothBle.GattServer | undefined;
let gattC: bluetoothBle.GattClientDevice | undefined;

let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let nLength: number = 0;

function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay)
  });
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  switch (sta) {
    case btAccess.BluetoothState.STATE_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
      break;
    case btAccess.BluetoothState.STATE_TURNING_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turning on:' + JSON.stringify(sta));
      await sleep(3000);
      break;
    case btAccess.BluetoothState.STATE_ON:
      hilog.info(domain, tag, '[bluetooth_js] bt turn on:' + JSON.stringify(sta));
      break;
    case btAccess.BluetoothState.STATE_TURNING_OFF:
      btAccess.enableBluetooth();
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      hilog.info(domain, tag, '[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
      break;
    default:
      hilog.info(domain, tag, '[bluetooth_js] enable success');
  }
}

async function clickRequestPermission(text: string) {
  hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission start');
  let PERMISSION_TEXT: string = "允许";
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1!.click();
    await driver.delayMs(3000);
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    hilog.info(domain, tag, '[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

function ConnectStateChanged(state: bluetoothBle.BLEConnectionChangeState) {
  hilog.info(domain, tag, 'bluetooth connect state changed');
  let connectState: bluetoothBle.ProfileConnectionState = state.state;
  hilog.info(domain, tag, '[bluetooth_js] state changed' + connectState)
  expect(true).assertEqual(connectState != null);
  hilog.info(domain, tag, 'bluetooth BLEConnectionChangeState reason:' + state.reason);
}

function getRssi() {
  return new Promise<int>((resolve, reject) => {
    gattC!.getRssiValue((err: BusinessError | null, data: int | undefined) => {
      if (err) {
        hilog.error(domain, tag, 'getRssi failed' + err);
        reject(err);
      } else {
        hilog.info(domain, tag, '[bluetooth_js]getRssi value:' + JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve(0);
    });
  });
}

function getService() {
  return new Promise<int>((resolve, reject) => {
    gattC!.getServices((err: BusinessError | null, data: Array<bluetoothBle.GattService> | undefined) => {
      if (err) {
        hilog.error(domain, tag, 'getService failed' + err);
        reject(err);
      } else {
        hilog.info(domain, tag, '[bluetooth_js]getService value:' + JSON.stringify(data));
        expect(true).assertEqual(data != null);
      }
      resolve(0);
    });
  });
}

function ReadCharacteristicReq(CharacteristicReadRequest: bluetoothBle.CharacteristicReadRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  cccValue[0] = 1123;
  let deviceId: string = CharacteristicReadRequest.deviceId;
  let transId: int = CharacteristicReadRequest.transId;
  let offset: int = CharacteristicReadRequest.offset;
  let characteristicUuid: string = CharacteristicReadRequest.characteristicUuid;
  let serviceUuid: string = CharacteristicReadRequest.serviceUuid;

  let serverResponse: bluetoothBle.ServerResponse = {
    deviceId: deviceId,
    transId: transId,
    status: 0,
    offset: offset,
    value: arrayBufferCCC
  };

  try {
    gattS!.sendResponse(serverResponse);
  } catch (err) {
    hilog.error(domain, tag, "sendResponese errCode:" + err.code + ",errMessage:" + err.message);
  }
}

function readDesc(code: BusinessError, BLEDescriptor: bluetoothBle.BLEDescriptor) {
  if (code.code != 0) {
    return;
  }
  hilog.info(domain, tag, 'bluetooth BLEDescriptor serviceUuid: ' + BLEDescriptor.serviceUuid);
  hilog.info(domain, tag, 'bluetooth BLEDescriptor characteristicUuid: ' + BLEDescriptor.characteristicUuid);
  hilog.info(domain, tag, 'bluetooth BLEDescriptor descriptorUuid: ' + BLEDescriptor.descriptorUuid);
  hilog.info(domain, tag, 'bluetooth BLEDescriptor descriptorValue: ' + BLEDescriptor.descriptorValue);
  let value = new Uint8Array(BLEDescriptor.descriptorValue);
  hilog.info(domain, tag, 'bluetooth descriptor value: ' + value[0] + ',' + value[1] + ',' + value[2] + ',' + value[3]);
}

function ReadDescriptorReq(DescriptorReadReq: bluetoothBle.DescriptorReadRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  cccValue[0] = 1011;
  let deviceId: string = DescriptorReadReq.deviceId;
  let transId: int = DescriptorReadReq.transId;
  let offset: int = DescriptorReadReq.offset;
  let characteristicUuid: string = DescriptorReadReq.characteristicUuid;
  let serverResponse: bluetoothBle.ServerResponse = {
    deviceId: deviceId,
    transId: transId,
    status: 0,
    offset: offset,
    value: arrayBufferCCC
  };
  gattS!.sendResponse(serverResponse);
  hilog.info(domain, tag, "[bluetooth_js] DesRedon jsondata:" +
    'deviceId:' + deviceId + 'transId:' + transId + 'offset:' +
    offset + 'descriptorUuid:' + DescriptorReadReq.descriptorUuid +
    'characteristicUuid:' + characteristicUuid +
    'serviceUuid:' + DescriptorReadReq.serviceUuid);
  expect(true).assertEqual(DescriptorReadReq != null);
}

function wrCharacteristicVal() {
  let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
  let arrayBuffer = new ArrayBuffer(8);
  let desValue = new Uint8Array(arrayBuffer);
  desValue[0] = 11;
  let descriptor: bluetoothBle.BLEDescriptor = {
    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
    descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
    descriptorValue: arrayBuffer
  };
  descriptors.push(descriptor);
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  cccValue[0] = 32;
  let characteristic: bluetoothBle.BLECharacteristic = {
    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
    characteristicValue: arrayBufferCCC,
    descriptors: descriptors
  };
  return new Promise<int>((resolve, reject) => {
    gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE,
      (err: BusinessError | null) => {
        if (err) {
          hilog.info(domain, tag, 'wrCharacteristicVal failed' + err);
          reject(err);
        } else {
          // hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value:' + JSON.stringify(data));
          // expect(true).assertEqual(data != null);
          hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value success');
          expect().assertFail();
        }
        resolve(0);
      });
  });
}

function WriteCharacteristicReq(CharacteristicWriteRequest: bluetoothBle.CharacteristicWriteRequest) {
  let arrayBufferCCC = new ArrayBuffer(8);
  let cccValue = new Uint8Array(arrayBufferCCC);
  let deviceId: string = CharacteristicWriteRequest.deviceId;
  let transId: int = CharacteristicWriteRequest.transId;
  let offset: int = CharacteristicWriteRequest.offset;
  let isPrepared: boolean = CharacteristicWriteRequest.isPrepared;
  let needRsp: boolean = CharacteristicWriteRequest.needRsp;
  let value: Uint8Array = new Uint8Array(CharacteristicWriteRequest.value);
  let characteristicUuid: string = CharacteristicWriteRequest.characteristicUuid;
  let serviceUuid: string = CharacteristicWriteRequest.serviceUuid;
  hilog.info(domain, tag, 'CharacteristicWriteRequest deviceId:' + deviceId);
  hilog.info(domain, tag, 'CharacteristicWriteRequest transId:' + transId);
  hilog.info(domain, tag, 'CharacteristicWriteRequest offset:' + offset);
  hilog.info(domain, tag, 'CharacteristicWriteRequest isPrepared:' + isPrepared);
  hilog.info(domain, tag, 'CharacteristicWriteRequest needRsp:' + needRsp);
  hilog.info(domain, tag, 'CharacteristicWriteRequest value:' + value);
  hilog.info(domain, tag, 'CharacteristicWriteRequest characteristicUuid:' + characteristicUuid);
  hilog.info(domain, tag, 'CharacteristicWriteRequest serviceUuid:' + serviceUuid);
  cccValue[0] = value[0];
  let serverResponse: bluetoothBle.ServerResponse = {
    deviceId: deviceId,
    transId: transId,
    status: 0,
    offset: offset,
    value: arrayBufferCCC
  };
  gattS!.sendResponse(serverResponse);
}

function wrDescriptorVal() {
  let bufferDesc = new ArrayBuffer(8);
  let descV = new Uint8Array(bufferDesc);
  descV[0] = 22;
  let descriptor: bluetoothBle.BLEDescriptor = {
    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
    descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
    descriptorValue: bufferDesc
  };
  return new Promise<int>((resolve, reject) => {
    gattC!.writeDescriptorValue(descriptor, (err: BusinessError | null) => {
      if (err) {
        hilog.error(domain, tag, 'Descriptor failed' + err);
        reject(err);
      } else {
        // hilog.info(domain, tag, '[bluetooth_js]Descriptor value:' + JSON.stringify(data));
        // expect(true).assertEqual(data != null);
        hilog.info(domain, tag, '[bluetooth_js]Descriptor value success');
        expect().assertFail();
      }
      resolve(0);
    });
  });
}

function WriteDescriptorReq(DescriptorWriteRequest: bluetoothBle.DescriptorWriteRequest) { //
  let arrayBufferDesc = new ArrayBuffer(8);
  let descValue = new Uint8Array(arrayBufferDesc);
  let deviceId: string = DescriptorWriteRequest.deviceId;
  let transId: int = DescriptorWriteRequest.transId;
  let offset: int = DescriptorWriteRequest.offset;
  let isPrepared: boolean = DescriptorWriteRequest.isPrepared;
  let needRsp: boolean = DescriptorWriteRequest.needRsp;
  let value: Uint8Array = new Uint8Array(DescriptorWriteRequest.value);
  let descriptorUuid: string = DescriptorWriteRequest.descriptorUuid;
  descValue[0] = value[0];
  let serverResponse: bluetoothBle.ServerResponse = {
    deviceId: deviceId,
    transId: transId,
    status: 0,
    offset: offset,
    value: arrayBufferDesc
  };
  gattS!.sendResponse(serverResponse);
  hilog.info(domain, tag, "[bluetooth_js] desWriOn jsondata: " + 'deviceId: '
    + deviceId + 'transId:' + transId + 'offset:' + offset + 'descriptorUuid:'
    + descriptorUuid + 'charUuid:' + DescriptorWriteRequest.characteristicUuid +
    'serviceUuid:' + DescriptorWriteRequest.serviceUuid +
    'value:' + DescriptorWriteRequest.value + 'needRsp' +
    needRsp + 'isPrepared:' + isPrepared);
  expect(true).assertEqual(DescriptorWriteRequest != null);
}

function CharacteristicChange(CharacteristicChangeReq: bluetoothBle.BLECharacteristic) {
  let serviceUuid: string = CharacteristicChangeReq.serviceUuid;
  let characteristicUuid: string = CharacteristicChangeReq.characteristicUuid;
  let value: Uint8Array = new Uint8Array(CharacteristicChangeReq.characteristicValue);
  let characteristicValueHandle = CharacteristicChangeReq.characteristicValueHandle;
  expect(true).assertEqual(CharacteristicChangeReq != null);
}

function setCCN() {
  let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
  let arrayBuffer = new ArrayBuffer(8);
  let descV = new Uint8Array(arrayBuffer);
  descV[0] = 11;
  let descriptor: bluetoothBle.BLEDescriptor = {
    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
    descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
    descriptorValue: arrayBuffer
  };
  descriptors.push(descriptor);
  let arrayBufferC = new ArrayBuffer(8);
  let gattProperties: bluetoothBle.GattProperties = {
    write: false,
    writeNoResponse: false,
    read: false,
    notify: false,
    indicate: false,
    broadcast: false,
    authenticatedSignedWrite: false,
    extendedProperties: false
  };
  let gattPermissions: bluetoothBle.GattPermissions = {
    read: false,
    readEncrypted: false,
    readEncryptedMitm: false,
    write: false,
    writeEncrypted: false,
    writeEncryptedMitm: false,
    writeSigned: false,
    writeSignedMitm: false
  }
  let characteristic: bluetoothBle.BLECharacteristic = {
    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
    characteristicValue: arrayBufferC,
    descriptors: descriptors,
    properties: gattProperties,
    permissions: gattPermissions
  };
  return new Promise<int>((resolve, reject) => {
    gattC!.setCharacteristicChangeNotification(characteristic, false, (err: BusinessError | null) => {
      if (err) {
        hilog.error(domain, tag, 'setCCN failed' + err);
        reject(err);
      } else {
        // hilog.info(domain, tag, '[bluetooth_js]setCCN value:' + JSON.stringify(data));
        // expect(true).assertEqual(data != null);
        hilog.info(domain, tag, '[bluetooth_js]setCCN value success');
        expect().assertFail();
      }
      resolve(0);
    });
  });
}

function readCcc(code: BusinessError | null, BLECharacteristic: bluetoothBle.BLECharacteristic | undefined) {
  if (code!.code != 0) {
    return;
  }
  hilog.info(domain, tag, 'bluetooth characteristic uuid: ' + BLECharacteristic!.characteristicUuid);
  let value = new Uint8Array(BLECharacteristic!.characteristicValue);
  hilog.info(domain, tag,
    'bluetooth characteristic value: ' + value[0] + ',' + value[1] + ',' + value[2] + ',' + value[3]);
}

function WriteDC(err: BusinessError | null) {
  if (err) {
    hilog.error(domain, tag, 'Descriptor failed' + err);
  } else {
    hilog.info(domain, tag, '[bluetooth_js]Descriptor value:');
  }
}

export default function btBleManagerTest(): void {
  describe('btBleManagerTest', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      await clickRequestPermission(PERMISSION_TEXT);
      await tryToEnableBt()
      gattS = bluetoothBle.createGattServer();
      hilog.info(domain, tag, 'bluetooth ble create gattserver result:' + gattS);
      gattC = bluetoothBle.createGattClientDevice('04:30:02:01:00:07');
      hilog.info(domain, tag, 'bluetooth ble create gattclientdevice result:' + gattC);
      try {
        let deviceName = connection.getLocalName()
        nLength = deviceName.length
        hilog.info(domain, tag, `deviceName.length = ${nLength}`)
      } catch (err) {
        expect(err.code).assertEqual(801)
      }
      hilog.info(domain, tag, 'beforeAll called')
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called')
      await tryToEnableBt()
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called')
      gattC!.close();
      hilog.info(domain, tag, 'bluetooth gattC close success');
      gattS!.close();
      hilog.info(domain, tag, 'bluetooth gattS close success');
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1000
     * @tc.desc   Test Client WriteDescriptorValue promsie api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 22;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc
        };
        try {
          gattC!.writeDescriptorValue(descriptor).then(() => {
            hilog.info(domain, tag, "writeDescriptorValue");
            done();
          }, (error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, "writeDescriptorValue:errCode" + err.code + ",errMessage:" + err.message);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]writeDescriptorValue failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createA2dpSrcProfile is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1100
     * @tc.desc   Test Client WriteDescriptorValue callback api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 22;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc
        };
        try {
          wrDescriptorVal().then((data) => {
            hilog.info(domain, tag, "[bluetooth_js]11 writeDescriptorValue done");
            done();
          })
            .catch((error) => {
              let e = error as BusinessError;
              hilog.info(domain, tag, "[bluetooth_js]11 writeDescriptorValue failed" + e);
              expect(401).assertEqual(Number(e.code));
              done();
            })
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeDescriptorValue error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createA2dpSrcProfile is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTORADD_0500
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0500"
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc,
          permissions: gattPermissions
        };
        try {
          await gattC!.writeDescriptorValue(descriptor);
          expect(true).assertFalse();
          done();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTORADD_0600
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0600"
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc,
          permissions: gattPermissions
        };
        try {
          await gattC!.writeDescriptorValue(descriptor);
          expect(true).assertFalse();
          done();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTORADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0700"
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc,
          permissions: gattPermissions
        };
        let Callback = (err: BusinessError | null, data: undefined) => {
          if (err) {
            hilog.error(domain, tag, `$\{caseName} ` + 'Descriptor failed' + err);
            if (err.code === 801) {
              hilog.info(domain, tag, `$\{caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
              expect(true).assertTrue();
            } else {
              expect(err.code).assertEqual(401);
            }
          } else {
            hilog.info(domain, tag, `$\{caseName} ` + '[bluetooth_js]Descriptor value:');
            expect().assertFail();
          }
          done();
        }
        gattC!.writeDescriptorValue(descriptor, Callback);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTORADD_0800
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_ADD_static_0800"
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc,
          permissions: gattPermissions
        };
        let Callback = (err: BusinessError | null, data: undefined) => {
          if (err) {
            hilog.error(domain, tag, `$\{caseName} ` + 'Descriptor failed' + err);
            if (err.code === 801) {
              hilog.info(domain, tag, `$\{caseName} ` + '[bluetooth_js]readDescriptorValue is not support');
              expect(true).assertTrue();
            } else {
              expect(err.code).assertEqual(401);
            }
          } else {
            hilog.info(domain, tag, `$\{caseName} ` + '[bluetooth_js]Descriptor value:');
            expect().assertFail();
          }
          done();
        }
        gattC!.writeDescriptorValue(descriptor, Callback);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_0100
     * @tc.desc   Test api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTDISCONNECT_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.disconnect();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]disconnect failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]disconnect is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0100
     * @tc.desc   Test GetServices api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.getServices().then((GattService) => {
            hilog.info(domain, tag, '[bluetooth_js] getServices successfully:' + JSON.stringify(GattService));
            expect(GattService).assertNull();
            done();
          }).catch((error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, '[bluetooth_js] getServices has error:' + JSON.stringify(err));
            done();
          });
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]GetService_0100 failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]getServices is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_0200
     * @tc.desc   Test GetServices api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETSERVICE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          getService().then((data) => {
            hilog.info(domain, tag, "[bluetooth_js]02 getServices done");
            done();
          }).catch((error) => {
            let e = error as BusinessError;
            hilog.info(domain, tag, "[bluetooth_js]02 getServices failed" + e);
            expect(2900099).assertEqual(Number(e.code));
            done();
          })
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]getServices error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]getServices is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_0100
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let manufactureValueBuffer = new Uint8Array(4);
        manufactureValueBuffer[0] = 1;
        manufactureValueBuffer[1] = 2;
        manufactureValueBuffer[2] = 3;
        manufactureValueBuffer[3] = 4;
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;

        let setting: bluetoothBle.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: true,
        }
        let manufactureDataUnit1: bluetoothBle.ManufactureData = {
          manufactureId: 4567,
          manufactureValue: manufactureValueBuffer.buffer
        };
        let advData: bluetoothBle.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [manufactureDataUnit1],
          serviceData: [{
            serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
            serviceValue: serviceValueBuffer.buffer
          }],
          includeDeviceName: false
        }
        let manufactureDataUnit2: bluetoothBle.ManufactureData = {
          manufactureId: 1789,
          manufactureValue: manufactureValueBuffer.buffer
        }
        let serviceDataUnit: bluetoothBle.ServiceData = {
          serviceUuid: "00001889-0000-1000-8000-00805f9b34fb",
          serviceValue: serviceValueBuffer.buffer
        }
        let advResponse: bluetoothBle.AdvertiseData = {
          serviceUuids: ["00001889-0000-1000-8000-00805f9b34fb"],
          manufactureData: [manufactureDataUnit2],
          serviceData: [serviceDataUnit],
        }
        try {
          bluetoothBle.startAdvertising(setting, advData, advResponse);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising1 success');
          bluetoothBle.stopAdvertising();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]createA2dpSrcProfile is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERTADD_0100
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_static_0100'

        let setting: bluetoothBle.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        }

        let advData: bluetoothBle.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        }

        let advResponse: bluetoothBle.AdvertiseData = {
          serviceUuids: [],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        }
        try {
          hilog.info(domain, tag, `${caseName} test start`)
          hilog.info(domain, tag, `${caseName} deviceName.length = ${nLength}`)
          bluetoothBle.startAdvertising(setting, advData, advResponse);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising1 success');
          bluetoothBle.stopAdvertising();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising1 is not support');
            expect(true).assertTrue();
          } else {
            if (nLength > 24) {
              expect(error.code === 2902054).assertTrue();
            } else {
              expect(error.code).assertEqual(2900099);
            }
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERTADD_0200
     * @tc.desc   Test StartAdvertising api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTADVERT_ADD_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let manufactureValueBuffer = new Uint8Array(4);
        manufactureValueBuffer[0] = 1;
        manufactureValueBuffer[1] = 2;
        manufactureValueBuffer[2] = 3;
        manufactureValueBuffer[3] = 4;
        let serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;

        let setting: bluetoothBle.AdvertiseSetting = {
          interval: 32,
          txPower: 1,
          connectable: false,
        }
        let advData: bluetoothBle.AdvertiseData = {
          serviceUuids: [""],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: true,
          includeTxPower: true
        }
        let advResponse: bluetoothBle.AdvertiseData = {
          serviceUuids: [""],
          manufactureData: [],
          serviceData: [],
          includeDeviceName: false,
          includeTxPower: false
        }
        try {
          bluetoothBle.startAdvertising(setting, advData, advResponse);
          hilog.info(domain, tag, '[bluetooth_js]startAdvertising1 success');
          bluetoothBle.stopAdvertising();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]startAdvertising1 failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startAdvertising1 is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_1900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors
        };
        try {
          gattC!.readCharacteristicValue(characteristic);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2000
     * @tc.desc   Test ReadDescriptorValue api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
          descriptorValue: bufferDesc
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors
        };
        try {
          gattC!.readCharacteristicValue(characteristic, readCcc);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTICADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.readCharacteristicValue(characteristic);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTICADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.readCharacteristicValue(characteristic);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTICADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.readCharacteristicValue(characteristic, readCcc);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTICADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_ADD_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.readCharacteristicValue(characteristic, readCcc);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]readCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]readCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0100
     * @tc.desc   Test setCharacteristicChangeNotification api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
          descriptorValue: arrayBuffer
        };
        descriptors.push(descriptor);
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: arrayBufferC,
          descriptors: descriptors
        };
        try {

          setCCN().then((data) => {
            hilog.info(domain, tag, "[bluetooth_js]01 setCharacteristicChangeNotification done");
            done();
          })
            .catch((error) => {
              let e = error as BusinessError;
              hilog.info(domain, tag, "[bluetooth_js]01 setCharacteristicChangeNotification failed" + e);
              expect(401).assertEqual(Number(e.code));
              done();
            })
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]setCharacteristicChangeNotification error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_0200
     * @tc.desc   Test setCharacteristicChangeNotification api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHACCESS_BLECHARACTERISTIC_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
          descriptorValue: arrayBuffer
        };
        descriptors.push(descriptor);
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: arrayBufferC,
          descriptors: descriptors
        };
        try {
          gattC!.setCharacteristicChangeNotification(characteristic, true).then(() => {
            hilog.info(domain, tag, "setCharacteristicChangeNotification");
          }).catch((error) => {
            hilog.error(domain, tag, `case error, error -> ${JSON.stringify(error)}`);
          });
          done();
        } catch (err) {
          hilog.error(domain, tag,
            'setCharacteristicChangeNotification failed errCode: ' + err.code + ', errMessage: ' + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(401);
          }
          done();
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTICADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.setCharacteristicChangeNotification(characteristic, false);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTICADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.setCharacteristicChangeNotification(characteristic, true);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTICADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.setCharacteristicChangeNotification(characteristic, false, (err: BusinessError | null) => {
            if (err) {
              hilog.info(domain, tag, 'setCharacteristicChangeNotification failed' + err);
            } else {
              // hilog.info(domain, tag,
              //   '[bluetooth_js]setCharacteristicChangeNotification value:' + JSON.stringify(data));
              // expect(true).assertEqual(data != null);
              hilog.info(domain, tag,
                '[bluetooth_js]setCharacteristicChangeNotification value success');
              expect().assertFail();
            }
          });
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTICADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLECHARACTERISTIC_ADD_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.setCharacteristicChangeNotification(characteristic, true, (err: BusinessError | null) => {
            if (err) {
              hilog.info(domain, tag, 'setCharacteristicChangeNotification failed' + err);
            } else {
              // hilog.info(domain, tag,
              //   '[bluetooth_js]setCharacteristicChangeNotification value:' + JSON.stringify(data));
              // expect(true).assertEqual(data != null);
              hilog.info(domain, tag,
                '[bluetooth_js]setCharacteristicChangeNotification value success');
              expect().assertFail();
            }
          });
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]setCharacteristicChangeNotification failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]setCharacteristicChangeNotification is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0100
     * @tc.desc   Test getRssiValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.getRssiValue().then((data) => {
            hilog.info(domain, tag, '[bluetooth_js] BLE read rssi: ' + JSON.stringify(data));
            expect(true).assertEqual(data != null);
            done();
          }).catch((error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, 'bluetooth getRssiValue has error: ' + JSON.stringify(err));
            let b = false;
            if (err.code === 2901003 || err.code === -1) {
              b = true
            }
            expect(true).assertEqual(b);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]getRssiValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_0200
     * @tc.desc   Test testGetDeviceName api10 by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GETRSSIVALUE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          getRssi().then((data) => {
            hilog.info(domain, tag, "[bluetooth_js]02 getRssiValue done");
            done();
          })
            .catch((error) => {
              let e = error as BusinessError;
              hilog.info(domain, tag, "[bluetooth_js]02 getRssiValue failed" + e);
              expect(2901003).assertEqual(Number(e.code));
              done();
            })
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]GetRssiValue error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]getRssiValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_1800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1800
     * @tc.desc   Test Client WriteCharacteristicValue api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue = new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
          descriptorValue: arrayBuffer
        };
        descriptors.push(descriptor);
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: arrayBufferCCC,
          descriptors: descriptors
        };
        try {
          wrCharacteristicVal().then((data) => {
            hilog.info(domain, tag, "[bluetooth_js]18 writeCharacteristicValue done");
            done();
          })
            .catch((error) => {
              let e = error as BusinessError;
              hilog.info(domain, tag, "[bluetooth_js]18 writeCharacteristicValue failed" + e);
              expect(401).assertEqual(Number(e.code));
              done();
            })
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue error, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_1900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_1900
     * @tc.desc   Test Client WriteCharacteristicValue api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
          let arrayBuffer = new ArrayBuffer(8);
          let desValue = new Uint8Array(arrayBuffer);
          desValue[0] = 11;
          let descriptor: bluetoothBle.BLEDescriptor = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer
          };
          descriptors.push(descriptor);
          let arrayBufferCCC = new ArrayBuffer(8);
          let cccValue = new Uint8Array(arrayBufferCCC);
          cccValue[0] = 32;
          let characteristic: bluetoothBle.BLECharacteristic = {
            serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC,
            descriptors: descriptors
          };
          gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE).then(() => {
            hilog.info(domain, tag, "writeCharacteristicValue");
            done();
          }).catch((error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, "writeCharacteristicValue:errCode" + err.code + ",errMessage:" + err.message);
            expect(401).assertEqual(err.code);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTICADD_0700
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTICADD_0800
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTICADD_0900
     * @tc.desc   Test ReadDescriptorValue api10 by promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: true,
          readEncrypted: true,
          readEncryptedMitm: true,
          write: true,
          writeEncrypted: true,
          writeEncryptedMitm: true,
          writeSigned: true,
          writeSignedMitm: true
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: true,
          writeNoResponse: true,
          read: true,
          notify: true,
          indicate: true,
          broadcast: true,
          authenticatedSignedWrite: true,
          extendedProperties: true
        };
        let descriptor: bluetoothBle.BLEDescriptor = {
          serviceUuid: '',
          characteristicUuid: '',
          descriptorUuid: '',
          descriptorValue: bufferDesc,
          descriptorHandle: 0,
          permissions: gattPermissions
        };
        descriptors.push(descriptor);

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '',
          characteristicUuid: '',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE_NO_RESPONSE,
            (err: BusinessError | null) => {
              if (err) {
                hilog.info(domain, tag, 'wrCharacteristicVal failed' + err);
              } else {
                // hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value:' + JSON.stringify(data));
                // expect(true).assertEqual(data != null);
                hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value success');
                expect().assertFail();
              }
            });
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTICADD_1000
     * @tc.desc   xts 用例覆盖descriptors空数组情况.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_ADD_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let descriptors: Array<bluetoothBle.BLEDescriptor> = [];
        let bufferDesc = new ArrayBuffer(8);
        let descV = new Uint8Array(bufferDesc);
        descV[0] = 11;
        let gattPermissions: bluetoothBle.GattPermissions = {
          read: false,
          readEncrypted: false,
          readEncryptedMitm: false,
          write: false,
          writeEncrypted: false,
          writeEncryptedMitm: false,
          writeSigned: false,
          writeSignedMitm: false
        }
        let gattProperties: bluetoothBle.GattProperties = {
          write: false,
          writeNoResponse: false,
          read: false,
          notify: false,
          indicate: false,
          broadcast: false,
          authenticatedSignedWrite: false,
          extendedProperties: false
        };

        let bufferCCC = new ArrayBuffer(8);
        let cccV = new Uint8Array(bufferCCC);
        cccV[0] = 1;
        let characteristic: bluetoothBle.BLECharacteristic = {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          characteristicValue: bufferCCC,
          descriptors: descriptors,
          properties: gattProperties,
          permissions: gattPermissions
        };
        try {
          gattC!.writeCharacteristicValue(characteristic, bluetoothBle.GattWriteType.WRITE,
            (err: BusinessError | null) => {
              if (err) {
                hilog.info(domain, tag, 'wrCharacteristicVal failed' + err);
              } else {
                // hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value:' + JSON.stringify(data));
                // expect(true).assertEqual(data != null);
                hilog.info(domain, tag, '[bluetooth_js]wrCharacteristicVal value success');
                expect().assertFail();
              }
            });
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]writeCharacteristicValue failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]writeCharacteristicValue is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2100
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          gattS!.onCharacteristicRead(ReadCharacteristicReq);
          done();
        } catch (err) {
          hilog.info(domain, tag, "characteristicReadOn errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]characteristicRead is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        gattS!.offCharacteristicRead(ReadCharacteristicReq);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_2200
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READCHARACTERISTIC_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        gattS!.onCharacteristicRead(ReadCharacteristicReq);
        try {
          gattS!.offCharacteristicRead(ReadCharacteristicReq);
          done();
        } catch (err) {
          hilog.info(domain, tag, "characteristicReadOff errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]characteristicRead is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }

        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_2000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2000
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          gattS!.onCharacteristicWrite(WriteCharacteristicReq);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]characteristicWrite is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        gattS!.offCharacteristicWrite(WriteCharacteristicReq);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_2100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_2100
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITECHARACTERISTIC_static_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        gattS!.onCharacteristicWrite(WriteCharacteristicReq);
        try {
          gattS!.offCharacteristicWrite(WriteCharacteristicReq);
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]characteristicWrite failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]characteristicWrite is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GATTCLIENT_CLOSE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTCLIENTCLOSE_0100
     * @tc.desc   test gattClient close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTCLIENT_CLOSE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let gattClients = bluetoothBle.createGattClientDevice("99:99:99:99:99:99");
          gattClients.close();
        } catch (err) {
          hilog.error(domain, tag,
            "bluetooth gattClient close errCode:" + err.code + ",bluetooth gattClient close errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]close is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0100
     * @tc.desc   test GattClientDevice on blemtuchange api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.onBLEMtuChange((mtu: int) => {
            hilog.info(domain, tag, 'BLEMtuChange, mtu: ' + mtu);
          });
        } catch (err) {
          hilog.info(domain, tag,
            "bluetooth mtu changed errCode:" + err.code + ",bluetooth mtu changed errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEMtuChange is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        gattC!.offBLEMtuChange((mtu: int) => {
          hilog.info(domain, tag, 'BLEMtuChange, mtu: ' + mtu);
        });
        done();

      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_0200
     * @tc.desc   test GattClientDevice off blemtuchange api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLEC_MTUCHANGE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattC!.onBLEMtuChange((mtu: int) => {
          hilog.info(domain, tag, 'BLEMtuChange, mtu: ' + mtu);
        });
        try {
          gattC!.offBLEMtuChange((mtu: int) => {
            hilog.info(domain, tag, 'BLEMtuChange, mtu: ' + mtu);
          });
        } catch (err) {
          hilog.info(domain, tag,
            "bluetooth mtu changed off errCode:" + err.code + ",bluetooth mtu changed off errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEMtuChange is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_static_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1400
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          gattC!.onBLECharacteristicChange(CharacteristicChange);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]BLECharacteristicChangeON failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLECharacteristicChangeON is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        gattC!.offBLECharacteristicChange(CharacteristicChange);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_static_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_1500
     * @tc.desc   Test On and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_SETNOTIFYCHARACTERISTIC_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        gattC!.onBLECharacteristicChange(CharacteristicChange);
        try {
          gattC!.offBLECharacteristicChange(CharacteristicChange);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]BLECharacteristicChangeOFF failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLECharacteristicChangeOFF is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0300
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.onBLEConnectionStateChange(ConnectStateChanged);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]GattConnect failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEConnectionStateChange is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        gattC!.offBLEConnectionStateChange(ConnectStateChanged);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0400
     * @tc.desc   Test on and off api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattC!.onBLEConnectionStateChange(ConnectStateChanged);
        try {
          gattC!.offBLEConnectionStateChange(ConnectStateChanged);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]GattConnect failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]BLEConnectionStateChange is not support');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1200
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattS!.onDescriptorWrite(WriteDescriptorReq);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]descriptorWrite is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        gattS!.offDescriptorWrite(WriteDescriptorReq);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_1300
     * @tc.desc   Test on and off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_WRITEDESCRIPTOR_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattS!.onDescriptorWrite(WriteDescriptorReq);
        try {
          gattS!.offDescriptorWrite(WriteDescriptorReq);
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]descriptorWrite failed, code is ${error.code},
            message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]descriptorWrite is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_static_1500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1500
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattS!.onDescriptorRead(ReadDescriptorReq);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]descriptorRead is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        gattS!.offDescriptorRead(ReadDescriptorReq);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_static_1600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_1600
     * @tc.desc   Test On and Off api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_READDESCRIPTOR_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        gattS!.onDescriptorRead(ReadDescriptorReq);
        try {
          gattS!.offDescriptorRead(ReadDescriptorReq);
        } catch (error) {
          hilog.error(domain, tag,
            `[bluetooth_js]descriptorRead failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]descriptorRead is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_0100
     * @tc.desc   Test api10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCONNECT_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattC!.connect();
        } catch (error) {
          hilog.error(domain, tag, `[bluetooth_js]connect failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]connect is not support');
            expect(true).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

  })
}