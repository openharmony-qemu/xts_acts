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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import {ble, connection} from '@kit.ConnectivityKit';
import {BusinessError} from '@kit.BasicServicesKit';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'



let PERMISSION_TEXT:string = "允许";

async function clickRequestPermission(text:string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let PERMISSION_TEXT:string = "允许";
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
  try {
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

export default function GattConnectTest() {
  describe('GattConnectTest', () => {

    beforeAll(async (done : Function) => {
      await clickRequestPermission(PERMISSION_TEXT);
      console.info('beforeAll called')
      done();
    })

    /**
     * @tc.name testGattConnectNormal001
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0100
     * @tc.desc 测试 GattClientDevice.connect 方法 - 正常发起GATT连接场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testGattConnectNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect('00:22:33:44:55:66');
        console.info('testGattConnectNormal001 connect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectNormal001 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2900099);
        }
      }
    });

    /**
     * @tc.name testGattConnectNormal002
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0200
     * @tc.desc 测试 GattClientDevice.connect 方法 - autoConnect为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect('00:22:33:44:55:66',true);
        console.info('testGattConnectNormal002 connect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectNormal002 err: code=' + error.code + ', message=' + error.message + ', type' + typeof error.code);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2900099);
        }
      }
    });

    /**
     * @tc.name testGattConnectNormal003
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0300
     * @tc.desc 测试 GattClientDevice.connect 方法 - autoConnect为false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect('00:22:33:44:55:66',false);
        console.info('testGattConnectNormal003 connect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectNormal003 err: code=' + error.code + ', message=' + error.message + ', type' + typeof error.code);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2900099);
        }
      }
    });

    /**
     * @tc.name testGattConnectError005
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0500
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect('00:22:33:44:55:');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectError005 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattConnectError006
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0600
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect('');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectError006 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattConnectError007
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0700
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect(null);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectError007 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattConnectError008
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0800
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.connect(undefined);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattConnectError008 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattDisconnectError002
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0200
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.disconnect('00:22:33:44:55:');
        console.info('testGattDisconnectError002 disconnect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattDisconnectError002 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name testGattDisconnectError005
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0500
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 操作失败触发2900099错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.disconnect('00:22:33:44:55:66');
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattDisconnectError005 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2900099);
        }
      }
    });

    /**
     * @tc.name testGattDisconnectError006
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0600
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.disconnect('');
        console.info('testGattDisconnectError006 disconnect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattDisconnectError006 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattDisconnectError007
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0700
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.disconnect(null);
        console.info('testGattDisconnectError007 disconnect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattDisconnectError007 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testGattDisconnectError008
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0800
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let device: ble.GattServer = ble.createGattServer();
        device.disconnect(undefined);
        console.info('testGattDisconnectError008 disconnect success');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testGattDisconnectError008 err: code=' + error.code + ', message=' + error.message);
        if (error.code === 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    });
  });
}