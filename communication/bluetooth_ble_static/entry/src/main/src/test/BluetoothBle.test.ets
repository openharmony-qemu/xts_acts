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
} from '../../../hypium';
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
} from '@ohos.UiTest'
import common from '@ohos.bluetooth.common';
import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'bluetoothBleTest';
let PERMISSION_TEXT: string = "允许";
let OPEN_BT_TEXT: string = "开启";
let BleScanner: bluetooth.BleScanner | undefined;
let gattServer: bluetooth.GattServer | undefined;
let device: bluetooth.GattClientDevice | undefined;
let deviceId = "00:11:22:33:44:55";
let phyValue1: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_1M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_1M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S2,
};
let phyValue2: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_1M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_2M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S8,
};
let phyValue3: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_1M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_CODED,
};
let phyValue4: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_2M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_1M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S8,
};
let phyValue5: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_2M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_2M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S2,
};
let phyValue6: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_2M,
  rxPhy: bluetooth.BlePhy.BLE_PHY_CODED,
};
let phyValue7: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_CODED,
  rxPhy: bluetooth.BlePhy.BLE_PHY_1M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S2,
};
let phyValue8: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_CODED,
  rxPhy: bluetooth.BlePhy.BLE_PHY_2M,
  phyMode: bluetooth.CodedPhyMode.BLE_PHY_CODED_S8,
};
let phyValue9: bluetooth.PhyValue = {
  txPhy: bluetooth.BlePhy.BLE_PHY_CODED,
  rxPhy: bluetooth.BlePhy.BLE_PHY_CODED,
};

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
      clickRequestPermission(OPEN_BT_TEXT);
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
      clickRequestPermission(OPEN_BT_TEXT);
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

function onReceiveEvent(data: Array<bluetooth.ScanResult>) {
  hilog.info(domain, tag, 'bluetooth device find = ' + JSON.stringify(data));
  try {
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property advertiseFlags is :' + JSON.stringify(data[0].advertiseFlags));
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property manufacturerDataMap is :' + JSON.stringify(data[0].manufacturerDataMap));
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property serviceDataMap is :' + JSON.stringify(data[0].serviceDataMap));
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property serviceUuids is :' + JSON.stringify(data[0].serviceUuids));
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property txPowerLevel is :' + JSON.stringify(data[0].txPowerLevel));
    hilog.info(domain, tag,
      '[bluetooth_js]ScanResult Property advertisingDataMap is :' + JSON.stringify(data[0].advertisingDataMap));
    hilog.info(domain, tag, '[bluetooth_js]ScanResult Property address is :' + JSON.stringify(data[0].address));
  } catch (error) {
    hilog.error(domain, tag, "[bt_arkts]ScanResult Property is Optional");
  }
}

function onReceiveEvent_void() {
  hilog.info(domain, tag, '[bluetooth_js] BLEscan device result_viod');
}

function onReceiveEvents(data: bluetooth.ScanReport) {
  hilog.info(domain, tag, '[bluetooth_js] bleScanner startScan device result: ' + JSON.stringify(data));
  hilog.info(domain, tag, '[bluetooth_js] reportType result: ' + JSON.stringify(data.reportType));
  hilog.info(domain, tag, '[bluetooth_js] scanResult result: ' + JSON.stringify(data.scanResult));
  hilog.info(domain, tag, '[bluetooth_js] deviceId result: ' + JSON.stringify(data.scanResult[0].deviceId));
  hilog.info(domain, tag, '[bluetooth_js] rssi result: ' + JSON.stringify(data.scanResult[0].rssi));
  hilog.info(domain, tag, '[bluetooth_js] data result: ' + JSON.stringify(data.scanResult[0].data));
  hilog.info(domain, tag, '[bluetooth_js] deviceName result: ' + JSON.stringify(data.scanResult[0].deviceName));
  hilog.info(domain, tag, '[bluetooth_js] connectable result: ' + JSON.stringify(data.scanResult[0].connectable));
}

function onReceiveEvent_value(data: bluetooth.PhyValue) {
  hilog.info(domain, tag, 'bluetooth PhyValue txPhy = ' + JSON.stringify(data.txPhy));
  hilog.info(domain, tag, 'bluetooth PhyValue rxPhy = ' + JSON.stringify(data.rxPhy));
  hilog.info(domain, tag, 'bluetooth PhyValue phyMode = ' + JSON.stringify(data.phyMode));
  expect(data.txPhy).not().assertUndefined();
  expect(data.rxPhy).not().assertUndefined();
  hilog.info(domain, tag, 'bluetooth onBlePhyUpdate success');
}

export default function bluetoothBleTest(): void {
  describe('bluetoothBleTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      await clickRequestPermission(PERMISSION_TEXT);

      hilog.info(domain, tag, 'beforeAll called')
      BleScanner = bluetooth.createBleScanner();
      hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(BleScanner));
      expect(true).assertEqual(BleScanner != null);
      gattServer = bluetooth.createGattServer();
      hilog.info(domain, tag, 'bluetooth ble create gattServer result:' + JSON.stringify(gattServer));
      device = bluetooth.createGattClientDevice('00:11:22:33:44:55');
      hilog.info(domain, tag, 'createGattClientDevice result:' + JSON.stringify(device));
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeEach called');
      await tryToEnableBt();
      done();
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called')
    })
    afterAll(async (done: () => void): Promise<void> => {
      await tryToEnableBt();
      hilog.info(domain, tag, 'afterAll called');
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERNOTCONNECT_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0200
     * @tc.desc API23 server readPhy 连接未建立 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let data: bluetooth.PhyValue = await gattServer!.readPhy(deviceId);
          hilog.info(domain, tag, '[bt_arkts] server readPhy:' + JSON.stringify(data));
          hilog.info(domain, tag, '[bt_arkts] server readPhy txPhy: ' + JSON.stringify(data.txPhy));
          expect(data.txPhy).not().assertUndefined();
          hilog.info(domain, tag, '[bt_arkts] server readPhy rxPhy: ' + JSON.stringify(data.rxPhy));
          expect(data.rxPhy).not().assertUndefined();
          hilog.info(domain, tag, '[bt_arkts] server readPhy phyMode: ' + JSON.stringify(data.phyMode));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]readPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERNOTCONNECT_0300
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0300
     * @tc.desc API23 client readPhy 连接未建立 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let data: bluetooth.PhyValue = await device!.readPhy();
          hilog.info(domain, tag, '[bt_arkts] client readPhy:' + JSON.stringify(data));
          hilog.info(domain, tag, '[bt_arkts] client readPhy txPhy: ' + JSON.stringify(data.txPhy));
          expect(data.txPhy).not().assertUndefined();
          hilog.info(domain, tag, '[bt_arkts] client readPhy rxPhy: ' + JSON.stringify(data.rxPhy));
          expect(data.rxPhy).not().assertUndefined();
          hilog.info(domain, tag, '[bt_arkts] client readPhy phyMode: ' + JSON.stringify(data.phyMode));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client readPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]readPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0300
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0300
     * @tc.desc API23 server readPhy 入参不合法 401 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let data: bluetooth.PhyValue = await gattServer!.readPhy('11111111');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]readPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_2000
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2000
     * @tc.desc API23 server readPhy 入参不合法 401 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let data: bluetooth.PhyValue = await gattServer!.readPhy('');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]readPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVEROBPU_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_static_0100
     * @tc.desc API23 on/offBlePhyUpdate(callback: Callback<PhyValue>): void;test normal
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onBlePhyUpdate(onReceiveEvent_value);
          gattServer!.offBlePhyUpdate(onReceiveEvent_value);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] server onBlePhyUpdate is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVEROBPU_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_static_0200
     * @tc.desc API23 on/offBlePhyUpdate(callback: Callback<PhyValue>): void;test normal
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_OBPU_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          gattServer!.onBlePhyUpdate(onReceiveEvent_value);
          gattServer!.offBlePhyUpdate();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] server onBlePhyUpdate is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEOBPU_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_static_0100
     * @tc.desc API23 client on/off BlePhyUpdate(callback: Callback<PhyValue>): void;normal
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          device!.onBlePhyUpdate(onReceiveEvent_value);
          device!.offBlePhyUpdate(onReceiveEvent_value);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] client onBlePhyUpdate is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEOBPU_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_static_0200
     * @tc.desc API23 client on/off BlePhyUpdate(callback: Callback<PhyValue>): void;normal
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_OBPU_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          device!.onBlePhyUpdate(onReceiveEvent_value);
          device!.offBlePhyUpdate();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client onBlePhyUpdate is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] client onBlePhyUpdate is not support');
            expect(error.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERNOTCONNECT_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0100
     * @tc.desc API23 server setPhy 连接未建立 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue1);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERNOTCONNECT_0400
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0400
     * @tc.desc API23 client setPhy 连接未建立 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_NOTCONNECT_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue1);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        await sleep(11000);
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0400
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0400
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue2);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }

        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0500
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0500
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await sleep(3000);
          await device!.setPhy(phyValue3);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0600
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0600
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue4);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0700
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0700
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue5);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0800
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0800
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue6);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_0900
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0900
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue7);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1000
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1000
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue8);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1100
     * @tc.desc API23 client setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await device!.setPhy(phyValue9);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1200
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue2);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1300
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1300
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue3);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1400
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1400
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue4);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1500
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1500
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue5);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1600
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1600
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue6);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1700
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1700
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue7);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1800
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1800
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue8);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_1900
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1900
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy(deviceId, phyValue9);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_2100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2100
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          await gattServer!.setPhy("", phyValue9);
          hilog.info(domain, tag, '[bt_arkts] client setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_2200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2200
     * @tc.desc API23 client setPhy 连接未建立 非法枚举值 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let phyValueIllegal: bluetooth.PhyValue = {
            txPhy: 99 as bluetooth.BlePhy,
            rxPhy: 99 as bluetooth.BlePhy,
            phyMode: 99 as bluetooth.CodedPhyMode,
          };
          await device!.setPhy(phyValueIllegal);
          hilog.info(domain, tag, '[bt_arkts] client setPhy success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] client setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else if (error.code === 401) {
            hilog.info(domain, tag, '[bt_arkts]client setPhy invalid param.');
            expect(error.code).assertEqual(401);
          } else {
            hilog.info(domain, tag, '[bt_arkts]client The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_ADD_2300
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2300
     * @tc.desc API23 server setPhy 连接未建立 非法枚举值 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_ADD_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let phyValueIllegal: bluetooth.PhyValue = {
            txPhy: 99 as bluetooth.BlePhy,
            rxPhy: 99 as bluetooth.BlePhy,
            phyMode: 99 as bluetooth.CodedPhyMode,
          };
          await gattServer!.setPhy(deviceId, phyValueIllegal);
          hilog.info(domain, tag, '[bt_arkts] server setPhy is success');
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] server setPhy is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]setPhy is not support');
            expect(error.code === 801).assertTrue();
          } else if (error.code === 401) {
            hilog.info(domain, tag, '[bt_arkts]server setPhy invalid param.');
            expect(error.code).assertEqual(401);
          } else {
            hilog.info(domain, tag, '[bt_arkts] server The connection is not established.');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETSERVICES_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_static_0100
     * @tc.desc 20251113API22用例覆盖 GattServer-getServices.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICES_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let return_list: bluetooth.GattService[] = gattServer!.getServices();
          hilog.info(domain, tag, '[bt_arkts] return_list is' + JSON.stringify(return_list));
          hilog.info(domain, tag, '[bt_arkts] return_list length is ' + return_list.length);
          if (return_list.length > 0) {
            hilog.info(domain, tag, '[bt_arkts]return_result is >0' + JSON.stringify(return_list[0]));
          } else {
            hilog.info(domain, tag, '[bt_arkts]return_result is' + JSON.stringify(return_list));
          }
        } catch (error) {
          hilog.error(domain, tag, `[bt_arkts]getservices failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]getservices is not support');
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
     * @tc.desc   Test startBLEScan api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{
              deviceId: "00:11:22:33:44:55",
              name: "test",
              serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
            }],
            {
              interval: 500,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
              matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
              phyType: bluetooth.PhyType.PHY_LE_1M
            }
          );
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startBLEScan is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300
     * @tc.desc   Test on-BLEDeviceFind api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
        } catch (err) {
          hilog.error(domain, tag, "03errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400
     * @tc.desc   Test off-BLEDeviceFind api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        bluetooth.onBLEDeviceFind(onReceiveEvent);
        try {
          bluetooth.offBLEDeviceFind(onReceiveEvent);
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0500
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(null);
          await sleep(1000);
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0600
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan([{ deviceId: "00:11:22:33:44:55" }]);
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off2');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0700
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan([{ name: "blue_test" }]);
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off3');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0800
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0800
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan([{ serviceUuid: "00001888-0000-1000-8000-00805f9b34fb" }]);
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off4');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0900
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0900
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{}],
            {
              interval: 100,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
              matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
          );
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off5');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1000
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1000
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let ScanOptions: bluetooth.ScanOptions = {
            interval: 100,
            dutyMode: bluetooth.ScanDuty.SCAN_MODE_BALANCED,
            matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          };
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan([{}], ScanOptions);
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off6');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1100
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{}],
            {
              interval: 100,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
              matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
          );
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off7');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1200
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{}],
            {
              interval: 0,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
              matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
          );
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off7');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1300
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1300
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{}],
            {
              interval: 500,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
              matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
          );
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off10');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "13errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_1400
     * @tc.desc   Test ClassicStartBLEScan api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{}],
            {
              interval: 500,
              dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY,
              matchMode: bluetooth.MatchMode.MATCH_MODE_STICKY,
            }
          );
          await sleep(1000);
          hilog.info(domain, tag, '[bluetooth_js] BLE scan off12');
          bluetooth.stopBLEScan();
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          expect(err.code).assertEqual(2900099);
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_OFFNOPARAM_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCANOFFNOPARAM_0100
     * @tc.desc   Test off-BLEDeviceFind without param api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_OFFNOPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.offBLEDeviceFind();
          hilog.info(domain, tag, '[bluetooth_js]offBLEDeviceFind without param is success');
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]offBLEDeviceFind is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_0200
     * @tc.desc   Test startScan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let arrayBuffer = new ArrayBuffer(8);
        let scanFilter: bluetooth.ScanFilter = {
          deviceId: "00:11:22:33:44:55",
          name: "testStartScan",
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
          serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceData: arrayBuffer,
          serviceDataMask: arrayBuffer,
          manufactureId: 4567,
          manufactureData: arrayBuffer,
          manufactureDataMask: arrayBuffer
        };

        try {
          BleScanner!.onBLEDeviceFind(onReceiveEvents);
          await BleScanner!.startScan([scanFilter]);
          hilog.info(domain, tag, '[bluetooth_js] bleScanner startScan success');
          await sleep(500);
          await BleScanner!.stopScan();
          hilog.info(domain, tag, '[bluetooth_js] bleScanner stopScan success');
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          BleScanner!.offBLEDeviceFind(onReceiveEvents);
          if (err.code === 801 || err.code === 2900009) {
            hilog.info(domain, tag, '[bluetooth_js]startScan is not support or start scan as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        BleScanner!.offBLEDeviceFind(onReceiveEvents);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0400
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCANADD_0400
     * @tc.desc   Test startBLEScan api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0400"
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.NORMAL
        };
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{
              deviceId: "00:11:22:33:44:55",
              name: "test",
              serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
            }], scanOptions);
          hilog.info(domain, tag, `${caseName} ` + "startBLEScan success");
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startBLEScan is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0500
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCANADD_0500
     * @tc.desc   Test startBLEScan api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0500"
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.BATCH
        };
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{
              deviceId: "00:11:22:33:44:55",
              name: "test",
              serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
            }], scanOptions);
          hilog.info(domain, tag, `${caseName} ` + "startBLEScan success");
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startBLEScan is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0600
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCANADD_0600
     * @tc.desc   Test startBLEScan api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0600"
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.FENCE_SENSITIVITY_LOW
        };
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{
              deviceId: "00:11:22:33:44:55",
              name: "test",
              serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
            }], scanOptions);
          hilog.info(domain, tag, `${caseName} ` + "startBLEScan success");
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startBLEScan is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0700
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCANADD_0700
     * @tc.desc   Test startBLEScan api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_ADD_static_0700"
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.FENCE_SENSITIVITY_HIGH
        };
        try {
          bluetooth.onBLEDeviceFind(onReceiveEvent);
          bluetooth.startBLEScan(
            [{
              deviceId: "00:11:22:33:44:55",
              name: "test",
              serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
            }], scanOptions);
          hilog.info(domain, tag, `${caseName} ` + "startBLEScan success");
        } catch (err) {
          hilog.error(domain, tag, `${caseName} ` + "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]startBLEScan is not support');
            expect(true).assertTrue();
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        bluetooth.offBLEDeviceFind(onReceiveEvent);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_ISEXTENDED_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNERISEXTENDED_0100
     * @tc.desc   Test startScan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_ISEXTENDED_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let arrayBuffer = new ArrayBuffer(8);
        let scanFilter: bluetooth.ScanFilter = {
          deviceId: "00:11:22:33:44:55",
          name: "testStartScan",
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
          serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceData: arrayBuffer,
          serviceDataMask: arrayBuffer,
          manufactureId: 4567,
          manufactureData: arrayBuffer,
          manufactureDataMask: arrayBuffer
        };
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.NORMAL,
          isExtended: true
        };

        try {
          hilog.info(domain, tag, 'lmq1 111');
          await BleScanner!.stopScan();
          hilog.info(domain, tag, '[bluetooth_js] bleScanner stopScan success');
          hilog.info(domain, tag, 'lmq1 112');
          BleScanner!.onBLEDeviceFind(onReceiveEvents);
          hilog.info(domain, tag, 'lmq1 113');
          await BleScanner!.startScan([scanFilter], scanOptions);
          hilog.info(domain, tag, '[bluetooth_js] bleScanner startScan success');
          await sleep(500);
          hilog.info(domain, tag, 'lmq1 114');
          await BleScanner!.stopScan();
          hilog.info(domain, tag, '[bluetooth_js] bleScanner stopScan success');
          hilog.info(domain, tag, 'lmq1 115');
        } catch (err) {
          hilog.info(domain, tag, 'lmq1 116');
          hilog.error(domain, tag, "isExtended errCode:" + err.code + ",errMessage:" + err.message);
          BleScanner!.offBLEDeviceFind(onReceiveEvents);
          hilog.info(domain, tag, 'lmq1 117');
          if (err.code === 801 || err.code === 2900099) {
            hilog.info(domain, tag, '[bluetooth_js]startScan is not support or start scan as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        BleScanner!.offBLEDeviceFind(onReceiveEvents);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_ISEXTENDED_static_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNERISEXTENDED_0200
     * @tc.desc   Test startScan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_ISEXTENDED_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let arrayBuffer = new ArrayBuffer(8);
        let scanFilter: bluetooth.ScanFilter = {
          deviceId: "00:11:22:33:44:55",
          name: "testStartScan",
          serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
          serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
          serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
          serviceData: arrayBuffer,
          serviceDataMask: arrayBuffer,
          manufactureId: 4567,
          manufactureData: arrayBuffer,
          manufactureDataMask: arrayBuffer
        };
        let scanOptions: bluetooth.ScanOptions = {
          interval: 500,
          dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
          matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
          phyType: bluetooth.PhyType.PHY_LE_ALL_SUPPORTED,
          reportMode: bluetooth.ScanReportMode.NORMAL,
          isExtended: false
        };

        try {
          BleScanner!.onBLEDeviceFind(onReceiveEvents);
          await BleScanner!.startScan([scanFilter], scanOptions);
          hilog.info(domain, tag, '[bluetooth_js] bleScanner startScan success');
          await sleep(500);
          await BleScanner!.stopScan();
          hilog.info(domain, tag, '[bluetooth_js] bleScanner stopScan success');
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          BleScanner!.offBLEDeviceFind(onReceiveEvents);
          if (err.code === 801 || err.code === 2900009) {
            hilog.info(domain, tag, '[bluetooth_js]startScan is not support or start scan as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        BleScanner!.offBLEDeviceFind(onReceiveEvents);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_OFFNOPARAM_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLESCANNEROFFNOPARAM_0100
     * @tc.desc   Test BleScanner off-BLEDeviceFind without param api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLESCANNER_OFFNOPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          BleScanner!.onBLEDeviceFind(onReceiveEvents);
          BleScanner!.offBLEDeviceFind();
          hilog.info(domain, tag, '[bluetooth_js]BleScanner offBLEDeviceFind without param is success');
        } catch (err) {
          hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, '[bluetooth_js]offBLEDeviceFind is not support');
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_CREATEGATTCLIENTDEVICEADD_2000
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_createGattClientDevice_ADD_static_2000
     * @tc.desc API23 server setPhy 连接未建立 参数覆盖 test
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_createGattClientDevice_ADD_static_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          device = bluetooth.createGattClientDevice("");
          hilog.info(domain, tag, 'createGattClientDevice result:' + JSON.stringify(device));
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] createGattClientDevice failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]createGattClientDevice is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] createGattClientDevice failed, invalid parameter.');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETCONNECTEDSTATE_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_static_0100
     * @tc.desc 20251113API22用例覆盖GattServer-getConnectedState.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let return_status: bluetooth.ProfileConnectionState = gattServer!.getConnectedState('01:02:00:02:03:01');
          hilog.info(domain, tag, '[bt_arkts]get status is' + JSON.stringify(return_status))
          expect(return_status).assertEqual(0);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]server ProfileConnectionState 0100 is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]getConnectedState is not support');
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETCONNECTEDSTATE_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_static_0200
     * @tc.desc 20251113API22用例覆盖GattServer-getConnectedState 401.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let return_status: bluetooth.ProfileConnectionState = gattServer!.getConnectedState('01');
          hilog.info(domain, tag, '[bt_arkts]get status is' + JSON.stringify(return_status))
          expect(return_status).assertEqual(0);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]server ProfileConnectionState 0300 is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]getConnectedState is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server getConnectedState input is error');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEGETCONNECTEDSTATE_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_static_0100
     * @tc.desc 20251113API22用例覆盖GattClientDevice-getConnectedState.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_GETCONNECTEDSTATE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let return_status = device!.getConnectedState();
          hilog.info(domain, tag, '[bt_arkts] client ProfileConnectionState 0100 is' + JSON.stringify(return_status))
          expect(return_status).assertEqual(0);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]getConnectedState status is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]getConnectedState is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]error code is 2900009');
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETCONNECTEDSTATEADD_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_ADD_static_0100
     * @tc.desc 20251113API22用例覆盖GattServer-getConnectedState 401.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETCONNECTEDSTATE_ADD_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let return_status: bluetooth.ProfileConnectionState = gattServer!.getConnectedState('');
          hilog.info(domain, tag, '[bt_arkts]get status is' + JSON.stringify(return_status))
          expect(return_status).assertEqual(0);
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]server getConnectedState is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]getConnectedState is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] server getConnectedState input is error');
            expect(error.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICESERVICECHANGE_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_static_0100
     * @tc.desc 20251113API22用例覆盖 on_serviceChange/off_serviceChange 1-1.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          device!.onServiceChange(onReceiveEvent_void);
          hilog.info(domain, tag, '[bt_arkts]return_on value type is null，device on success')
          device!.offServiceChange(onReceiveEvent_void);
          hilog.info(domain, tag, '[bt_arkts]return_off value type is null，device off success')
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]service change is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]is not support');
            expect(error.code === 801).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICESERVICECHANGEOFFNOPARAM_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_OFFNOPARAM_static_0100
     * @tc.desc 20251113API22用例覆盖 off_serviceChange 无入参调用.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_SERVICECHANGE_OFFNOPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          device!.onServiceChange(onReceiveEvent_void);
          hilog.info(domain, tag, '[bt_arkts]return_on value type is null，device on success')
          device!.offServiceChange();
          hilog.info(domain, tag, '[bt_arkts]return_off value type is null，device off without param success')
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]service change is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts]is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]device offServiceChange without param is error');
            expect(error.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETSERVICE_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_static_0100
     * @tc.desc 20251113API22用例覆盖 GattServer-getService 2901008 Gatt service is not found.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let serviceUuid = '00001888-0000-1000-8000-00805f9b34fb';
          let returu_gattservice: bluetooth.GattService = gattServer!.getService(serviceUuid);
          hilog.info(domain, tag,
            '[bt_arkts]gattServer getService get return_values is' + JSON.stringify(returu_gattservice));
          let return_serviceUuid = returu_gattservice.serviceUuid;
          hilog.info(domain, tag, '[bt_arkts]get method attribute_serviceUuid' + JSON.stringify(return_serviceUuid));
          let isprimary = returu_gattservice.isPrimary;
          hilog.info(domain, tag, '[bt_arkts]get method attribute_isPrimary' + JSON.stringify(isprimary));
          let characteristics = returu_gattservice.characteristics;
          hilog.info(domain, tag, '[bt_arkts]get method attribute_characteristics' + JSON.stringify(characteristics));
          let includeServices = returu_gattservice.includeServices;
          hilog.info(domain, tag, '[bt_arkts]get method attribute_includeServices' + JSON.stringify(includeServices));
          hilog.info(domain, tag, '[bt_arkts]get method all attribute is success');
        } catch (error) {
          hilog.error(domain, tag, `[bt_arkts]getservice failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag,
              '[bt_arkts]SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_static_0100 getservice is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts]error is 2901008');
            expect(error.code).assertEqual(2901008);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVERGETSERVICEADD_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_ADD_static_0200
     * @tc.desc 20251113API22用例覆盖 GattServer-getService input is error.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTSERVER_GETSERVICE_ADD_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          let returu_gattservice: bluetooth.GattService = gattServer!.getService("");
          expect().assertFail();
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts] gattServer getService input is null, code is ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEUPDATECONNECTIONPARAM_0100
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0100
     * @tc.desc 20251113API22用例覆盖 updateConnectionParam 1-3 .
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await device!.updateConnectionParam(bluetooth.ConnectionParam.LOW_POWER);
          hilog.info(domain, tag, '[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam is not support');
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEUPDATECONNECTIONPARAM_0200
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0200
     * @tc.desc 20251113API22用例覆盖 updateConnectionParam 2-3 .
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await device!.updateConnectionParam(bluetooth.ConnectionParam.BALANCED);
          hilog.info(domain, tag, '[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam is not support');
            expect(error.code === 801).assertTrue();
          } else {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam error is 2900099');
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEUPDATECONNECTIONPARAM_0300
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0300
     * @tc.desc 20251113API22用例覆盖 updateConnectionParam GATT未连接.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await device!.updateConnectionParam(bluetooth.ConnectionParam.HIGH);
          hilog.info(domain, tag, '[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam is not support');
            expect(error.code === 801).assertTrue();
          } else {
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICEUPDATECONNECTIONPARAM_0400
     * @tc.name SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0400
     * @tc.desc 20251113API22用例覆盖 updateConnectionParam 非法枚举值.
     * @tc.type Method
     * @tc.size MEDIUMTEST
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHBLE_GATTCLIENTDEVICE_UPDATECONNECTIONPARAM_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          await device!.updateConnectionParam(99 as bluetooth.ConnectionParam);
          hilog.info(domain, tag, '[bt_arkts]get device updateConnectionParam is' + JSON.stringify(device))
        } catch (error) {
          hilog.error(domain, tag,
            `[bt_arkts]device updateConnectionParam is failed, code is ${error.code},message is ${error.message}`);
          if (error.code === 801) {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam is not support');
            expect(error.code === 801).assertTrue();
          } else if (error.code === 401) {
            hilog.info(domain, tag, '[bt_arkts] device updateConnectionParam invalid param.');
            expect(error.code).assertEqual(401);
          } else {
            expect(error.code).assertEqual(2901003);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_static_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_GATTSERVERREMOVEALLSERVICES_0100
     * @tc.desc   Test startScan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_GATTSERVER_REMOVEALLSERVICES_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
          gattServer!.removeAllServices();
          hilog.info(domain, tag, "removeAllServices success")
        } catch (err) {
          hilog.error(domain, tag, "removeAllServices error，errCode:" + err.code + ",errMessage:" + err.message);
          if (err.code === 801 || err.code === 2900009) {
            hilog.info(domain, tag,
              '[bluetooth_js]removeAllServices is not support or removeAllServices as it is out of hardware');
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      })

  })

}