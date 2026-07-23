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


// API 26.0.0 双参数版本默认 GattSetting（autoConnect: false, transport: TRANSPORT_LE）
let defaultSetting: ble.GattSetting = {
  autoConnect: false,
  transport: connection.BluetoothTransport.TRANSPORT_LE
};
export default function CreateGattClientDeviceTest() {
  describe('CreateGattClientDeviceTest', () => {

    /**
     * @tc.name testCreateGattClientDeviceNormal001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0100
     * @tc.desc 测试 createGattClientDevice 方法 - 正常MAC地址格式场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNormal001', Level.LEVEL0, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', defaultSetting);
        console.info('testCreateGattClientDeviceNormal001 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNormal001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceNormal002
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0200
     * @tc.desc 测试 createGattClientDevice 方法 - 字母大写格式场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNormal002', Level.LEVEL0, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('AA:BB:CC:DD:EE:FF', defaultSetting);
        console.info('testCreateGattClientDeviceNormal002 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNormal002 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceNormal003
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0300
     * @tc.desc 测试 createGattClientDevice 方法 - 字母小写格式场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNormal003', Level.LEVEL1, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('aa:bb:cc:dd:ee:ff', defaultSetting);
        console.info('testCreateGattClientDeviceNormal003 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNormal003 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceNormal004
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0400
     * @tc.desc 测试 createGattClientDevice 方法 - 混合大小写格式场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNormal004', Level.LEVEL1, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('Aa:Bb:Cc:Dd:Ee:Ff', defaultSetting);
        console.info('testCreateGattClientDeviceNormal004 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNormal004 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceEmptyString001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0500
     * @tc.desc 测试 createGattClientDevice 方法 - 空字符串场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceEmptyString001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('', defaultSetting);
        console.info('testCreateGattClientDeviceEmptyString001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceEmptyString001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceNull001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0600
     * @tc.desc 测试 createGattClientDevice 方法 - null参数场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNull001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice(null, defaultSetting);
        console.info('testCreateGattClientDeviceNull001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNull001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceUndefined001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0700
     * @tc.desc 测试 createGattClientDevice 方法 - undefined参数场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceUndefined001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice(undefined, defaultSetting);
        console.info('testCreateGattClientDeviceUndefined001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceUndefined001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceInvalidFormat001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0800
     * @tc.desc 测试 createGattClientDevice 方法 - 错误格式MAC地址场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceInvalidFormat001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11-22-33-44-55-66', defaultSetting);
        console.info('testCreateGattClientDeviceInvalidFormat001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceInvalidFormat001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceIncomplete001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_0900
     * @tc.desc 测试 createGattClientDevice 方法 - 不完整MAC地址场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceIncomplete001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55', defaultSetting);
        console.info('testCreateGattClientDeviceIncomplete001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceIncomplete001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceTooLong001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_1000
     * @tc.desc 测试 createGattClientDevice 方法 - 过长MAC地址场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTooLong001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66:77', defaultSetting);
        console.info('testCreateGattClientDeviceTooLong001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTooLong001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceNonHex001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_1100
     * @tc.desc 测试 createGattClientDevice 方法 - 非十六进制字符场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceNonHex001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('GG:HH:II:JJ:KK:LL', defaultSetting);
        console.info('testCreateGattClientDeviceNonHex001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceNonHex001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceSpecialChar001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_1200
     * @tc.desc 测试 createGattClientDevice 方法 - 特殊字符场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceSpecialChar001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:$$', defaultSetting);
        console.info('testCreateGattClientDeviceSpecialChar001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceSpecialChar001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceChinese001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_PARAM_1300
     * @tc.desc 测试 createGattClientDevice 方法 - 中文字符场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceChinese001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('十一:二十二:三十三:四十四:五十五:六十六', defaultSetting);
        console.info('testCreateGattClientDeviceChinese001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceChinese001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceOptional001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_OPTIONAL_0100
     * @tc.desc 测试 createGattClientDevice 方法 - 传入默认setting参数场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceOptional001', Level.LEVEL0, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', defaultSetting);
        console.info('testCreateGattClientDeviceOptional001 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceOptional001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceOptional002
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_OPTIONAL_0200
     * @tc.desc 测试 createGattClientDevice 方法 - 传入setting参数autoConnect为true场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceOptional002', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: true,
          transport: connection.BluetoothTransport.TRANSPORT_LE
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceOptional002 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceOptional002 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceOptional003
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_OPTIONAL_0300
     * @tc.desc 测试 createGattClientDevice 方法 - 传入setting参数autoConnect为false场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceOptional003', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false,
          transport: connection.BluetoothTransport.TRANSPORT_LE
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceOptional003 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceOptional003 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceOptional004
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_OPTIONAL_0400
     * @tc.desc 测试 createGattClientDevice 方法 - 传入完整GattSetting对象场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceOptional004', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: true,
          transport: connection.BluetoothTransport.TRANSPORT_LE
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceOptional004 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceOptional004 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceError001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_ERROR_0100
     * @tc.desc 测试 createGattClientDevice 方法 - 参数错误触发401错误码场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceError001', Level.LEVEL2, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('invalid', defaultSetting);
        console.info('testCreateGattClientDeviceError001 device=' + device);
        expect().assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceError001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });


    /**
     * @tc.name testCreateGattClientDeviceReturn001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_RETURN_0100
     * @tc.desc 测试 createGattClientDevice 方法 - 验证返回值类型为GattClientDevice场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceReturn001', Level.LEVEL0, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', defaultSetting);
        console.info('testCreateGattClientDeviceReturn001 device=' + device);
        expect(typeof device).assertEqual('object');
        expect(device).not().assertNull();
        expect(device.connect).not().assertNull();
        expect(device.disconnect).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceReturn001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceReturn002
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_RETURN_0200
     * @tc.desc 测试 createGattClientDevice 方法 - 验证返回值实例方法可用性场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceReturn002', Level.LEVEL1, () => {
      try {
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', defaultSetting);
        console.info('testCreateGattClientDeviceReturn002 device=' + device);
        expect(typeof device.connect).assertEqual('function');
        expect(typeof device.disconnect).assertEqual('function');
        expect(typeof device.getServices).assertEqual('function');
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceReturn002 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceTransport001
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_TRANSPORT_0100
     * @tc.desc 测试 createGattClientDevice 方法 - transport为TRANSPORT_BR_EDR场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTransport001', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false,
          transport: connection.BluetoothTransport.TRANSPORT_BR_EDR
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceTransport001 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTransport001 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceTransport002
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_TRANSPORT_0200
     * @tc.desc 测试 createGattClientDevice 方法 - transport为TRANSPORT_LE场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTransport002', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false,
          transport: connection.BluetoothTransport.TRANSPORT_LE
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceTransport002 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTransport002 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceTransport003
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_TRANSPORT_0300
     * @tc.desc 测试 createGattClientDevice 方法 - transport为TRANSPORT_DUAL场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTransport003', Level.LEVEL1, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false,
          transport: connection.BluetoothTransport.TRANSPORT_DUAL
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceTransport003 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTransport003 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.name testCreateGattClientDeviceTransport006
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_TRANSPORT_0600
     * @tc.desc 测试 createGattClientDevice 方法 - transport为undefined场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTransport006', Level.LEVEL2, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false,
          transport: undefined
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceTransport006 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTransport006 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect(Number(error.code)).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name testCreateGattClientDeviceTransport007
     * @tc.number SUB_BLUETOOTH_BLE_CREATE_TRANSPORT_0700
     * @tc.desc 测试 createGattClientDevice 方法 - 不配置transport属性场景
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     * @co.authored.by.agent
     */
    it('testCreateGattClientDeviceTransport007', Level.LEVEL2, () => {
      try {
        let setting: ble.GattSetting = {
          autoConnect: false
        };
        let device: ble.GattClientDevice = ble.createGattClientDevice('11:22:33:44:55:66', setting);
        console.info('testCreateGattClientDeviceTransport007 device=' + device);
        expect(device).not().assertNull();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.info('testCreateGattClientDeviceTransport007 err: code=' + error.code + ', message=' + error.message);
        if (Number(error.code) === 801) {
          expect(Number(error.code)).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
    });
  });
}