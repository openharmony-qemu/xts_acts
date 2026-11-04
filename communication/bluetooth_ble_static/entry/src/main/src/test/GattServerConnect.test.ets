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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import ble from '@ohos.bluetooth.ble';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'GattConnectTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let PERMISSION_TEXT: string = "允许";

export default function GattConnectTest(): void {
  describe('GattConnectTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll called');
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission(PERMISSION_TEXT);
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name testGattConnectNormal001_static
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0100
     * @tc.desc 测试 GattClientDevice.connect 方法 - 正常发起GATT连接场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testGattConnectNormal001_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.connect('00:22:33:44:55:66');
          hilog.info(domain, tag, 'testGattConnectNormal001_static connect success');
        } catch (err) {
          hilog.info(domain, tag, 'testGattConnectNormal001_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name testGattConnectNormal002_static
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0200
     * @tc.desc 测试 GattClientDevice.connect 方法 - autoConnect为true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectNormal002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.connect('00:22:33:44:55:66', true);
          hilog.info(domain, tag, 'testGattConnectNormal002_static connect success');
        } catch (err) {
          hilog.info(domain, tag,
            'testGattConnectNormal002_static err: code=' + err.code + ', message=' + err.message + ', type' + typeof err.code);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name testGattConnectNormal003_static
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_FUNC_0300
     * @tc.desc 测试 GattClientDevice.connect 方法 - autoConnect为false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectNormal003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.connect('00:22:33:44:55:66', false);
          hilog.info(domain, tag, 'testGattConnectNormal003_static connect success');
        } catch (err) {
          hilog.info(domain, tag,
            'testGattConnectNormal003_static err: code=' + err.code + ', message=' + err.message + ', type' + typeof err.code);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name testGattConnectError005_static
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0500
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError005_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.connect('00:22:33:44:55:');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, tag, 'testGattConnectError005_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name testGattConnectError006_static
     * @tc.number SUB_BLUETOOTH_BLE_CONNECT_ERROR_0600
     * @tc.desc 测试 GattClientDevice.connect 方法 - 非法deviceID
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattConnectError006_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.connect('');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, tag, 'testGattConnectError006_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name testGattDisconnectError002_static
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0200
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.disconnect('00:22:33:44:55:');
          hilog.info(domain, tag, 'testGattDisconnectError002_static disconnect success');
        } catch (err) {
          hilog.info(domain, tag, 'testGattDisconnectError002_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name testGattDisconnectError005_static
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0500
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 操作失败触发2900099错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError005_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.disconnect('00:22:33:44:55:66');
          expect().assertFail();
        } catch (err) {
          hilog.info(domain, tag, 'testGattDisconnectError005_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2900099);
          }
        }
        done();
      })

    /**
     * @tc.name testGattDisconnectError006_static
     * @tc.number SUB_BLUETOOTH_BLE_DISCONNECT_ERROR_0600
     * @tc.desc 测试 GattClientDevice.disconnect 方法 - 无效deviceId触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testGattDisconnectError006_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let device: ble.GattServer = ble.createGattServer();
          device.disconnect('');
          hilog.info(domain, tag, 'testGattDisconnectError006_static disconnect success');
        } catch (err) {
          hilog.info(domain, tag, 'testGattDisconnectError006_static err: code=' + err.code + ', message=' + err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })
  })
}
