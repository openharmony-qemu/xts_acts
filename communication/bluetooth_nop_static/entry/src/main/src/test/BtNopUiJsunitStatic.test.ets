/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.bluetooth.connection';
import a2dp from '@ohos.bluetooth.a2dp';
import hfp from '@ohos.bluetooth.hfp';
import hid from '@ohos.bluetooth.hid';
import access from '@ohos.bluetooth.access';
import baseProfile from '@ohos.bluetooth.baseProfile';
import ble from '@ohos.bluetooth.ble';
import constant from '@ohos.bluetooth.constant';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtNotPermissionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice;
let gattServerDevice: ble.GattServer;

export default function btNopUiJsunit() {
    describe('btNopUiJsunit', (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        /**
         * @tc.number  disableBluetoothErrCode201Test
         * @tc.name    disableBluetoothErrCode201Test
         * @tc.desc    Test disableBluetoothErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("disableBluetoothErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.disableBluetooth();
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  enableBluetoothErrCode201Test
         * @tc.name    enableBluetoothErrCode201Test
         * @tc.desc    Test enableBluetoothErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("enableBluetoothErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.enableBluetooth();
                expect().assertFail();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceNameErrCode201Test
         * @tc.name    getRemoteDeviceNameErrCode201Test
         * @tc.desc    Test getRemoteDeviceNameErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceName:" + name);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceNameAliasErrCode201Test
         * @tc.name    getRemoteDeviceNameAliasErrCode201Test
         * @tc.desc    Test getRemoteDeviceNameAliasErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameAliasErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
                hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  setBluetoothScanModeErrCode201Test
         * @tc.name    setBluetoothScanModeErrCode201Test
         * @tc.desc    Test setBluetoothScanModeErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("setBluetoothScanModeErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  clientCloseErrCode201Test
         * @tc.name    clientCloseErrCode201Test
         * @tc.desc    Test clientCloseErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientCloseErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice.close();
                hilog.info(domain, tag, 'gattClientDevice close success');
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  serverCloseErrCode201Test
         * @tc.name    serverCloseErrCode201Test
         * @tc.desc    Test serverCloseErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("serverCloseErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattServerDevice.close();
                hilog.info(domain, tag, 'gattServerDevice close success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattServerDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  clientConnectErrCode201Test
         * @tc.name    clientConnectErrCode201Test
         * @tc.desc    Test clientConnectErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientConnectErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice.connect();
                hilog.info(domain, tag, 'gattClientDevice connect success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  stopBleScanErrCode201Test
         * @tc.name    stopBleScanErrCode201Test
         * @tc.desc    Test stopBleScanErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("stopBleScanErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
                hilog.info(domain, tag, 'stopBLEScan success');
                expect(true).assertFalse();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPlayingStateNop
         * @tc.name    testGetPlayingStateNop
         * @tc.desc    test testGetPlayingStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPlayingStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let state = a2dpSrc.getPlayingState('3e:45:7f:cc:45:3f');
                hilog.info(domain, tag, "getPlayingState:" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPlayingState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetConnectedDevicesNop
         * @tc.name    testGetConnectedDevicesNop
         * @tc.desc    test testGetConnectedDevicesNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetConnectedDevicesNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let devices = a2dpSrc.getConnectedDevices();
                hilog.info(domain, tag, "getConnectedDevices without permission =" + JSON.stringify(devices));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetConnectionStateNop
         * @tc.name    testGetConnectionStateNop
         * @tc.desc    test testGetConnectionStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetConnectionStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let state = a2dpSrc.getConnectionState('3e:45:7f:cc:45:3f');
                hilog.info(domain, tag, "the connection state:" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testEnableBluetoothAsyncNop
         * @tc.name    testEnableBluetoothAsyncNop
         * @tc.desc    test testEnableBluetoothAsyncNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testEnableBluetoothAsyncNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.enableBluetoothAsync().then(() => {
                    hilog.info(domain, tag, 'enableBluetoothAsync success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetoothAsync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testDisableBluetoothAsyncNop
         * @tc.name    testDisableBluetoothAsyncNop
         * @tc.desc    test testDisableBluetoothAsyncNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDisableBluetoothAsyncNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.disableBluetoothAsync().then(() => {
                    hilog.info(domain, tag, 'disableBluetoothAsync success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetoothAsync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testAddPersistentDeviceIdNop
         * @tc.name    testAddPersistentDeviceIdNop
         * @tc.desc    test testAddPersistentDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testAddPersistentDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.addPersistentDeviceId('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'addPersistentDeviceId success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addPersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testDeletePersistentDeviceIdNop
         * @tc.name    testDeletePersistentDeviceIdNop
         * @tc.desc    test testDeletePersistentDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDeletePersistentDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.deletePersistentDeviceId('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'deletePersistentDeviceId success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "deletePersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPersistentDeviceIdsNop
         * @tc.name    testGetPersistentDeviceIdsNop
         * @tc.desc    test testGetPersistentDeviceIdsNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPersistentDeviceIdsNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let macs: string[] = access.getPersistentDeviceIds();
                hilog.info(domain, tag, "getPersistentDeviceIds result:" + JSON.stringify(macs));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPersistentDeviceIds get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testIsValidRandomDeviceIdNop
         * @tc.name    testIsValidRandomDeviceIdNop
         * @tc.desc    test testIsValidRandomDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testIsValidRandomDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let isValidRandom = access.isValidRandomDeviceId('11:22:33:44:55:66');
                hilog.info(domain, tag, "isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isValidRandomDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetProfileConnectionStateNop
         * @tc.name    testGetProfileConnectionStateNop
         * @tc.desc    test testGetProfileConnectionStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetProfileConnectionStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state = connection.getProfileConnectionState(constant.ProfileId.PROFILE_A2DP_SOURCE);
                hilog.info(domain, tag, "getProfileConnectionState without permission name =" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getProfileConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testPairDeviceCallbackNop
         * @tc.name    testPairDeviceCallbackNop
         * @tc.desc    test testPairDeviceCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testPairDeviceCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.pairDevice('11:22:33:44:55:66', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "pairDevice,device name err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "pairDevice success");
                    }
                });
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "pairDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testPairDevicePromiseNop
         * @tc.name    testPairDevicePromiseNop
         * @tc.desc    test testPairDevicePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testPairDevicePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.pairDevice('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'pairDevice success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "pairDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetLocalNameNop
         * @tc.name    testGetLocalNameNop
         * @tc.desc    test testGetLocalNameNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetLocalNameNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name = connection.getLocalName();
                hilog.info(domain, tag, "getLocalName name = " + JSON.stringify(name));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLocalName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPairedDevicesNop
         * @tc.name    testGetPairedDevicesNop
         * @tc.desc    test testGetPairedDevicesNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPairedDevicesNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let ret = connection.getPairedDevices();
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPairStateNop
         * @tc.name    testGetPairStateNop
         * @tc.desc    test testGetPairStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPairStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state: connection.BondState = connection.getPairState('11:22:33:44:55:66');
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePairingConfirmationNop
         * @tc.name    testSetDevicePairingConfirmationNop
         * @tc.desc    test testSetDevicePairingConfirmationNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePairingConfirmationNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setDevicePairingConfirmation('11:22:33:44:55:66', true);
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePinCodeCallbackNop
         * @tc.name    testSetDevicePinCodeCallbackNop
         * @tc.desc    test testSetDevicePinCodeCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePinCodeCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setDevicePinCode('11:22:33:44:55:66', '12345', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "setDevicePinCode, err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "setDevicePinCode success");
                    }
                });
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePinCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePinCodePromiseNop
         * @tc.name    testSetDevicePinCodePromiseNop
         * @tc.desc    test testSetDevicePinCodePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePinCodePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                    hilog.info(domain, tag, 'setDevicePinCode success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePinCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetBluetoothScanModeNop
         * @tc.name    testGetBluetoothScanModeNop
         * @tc.desc    test testGetBluetoothScanModeNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetBluetoothScanModeNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "getBluetoothScanMode without permission scanMode = " + JSON.stringify(scanMode));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartBluetoothDiscoveryNop
         * @tc.name    testStartBluetoothDiscoveryNop
         * @tc.desc    test testStartBluetoothDiscoveryNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartBluetoothDiscoveryNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.startBluetoothDiscovery();
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStopBluetoothDiscoveryNop
         * @tc.name    testStopBluetoothDiscoveryNop
         * @tc.desc    test testStopBluetoothDiscoveryNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStopBluetoothDiscoveryNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.stopBluetoothDiscovery();
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testIsBluetoothDiscoveringNop
         * @tc.name    testIsBluetoothDiscoveringNop
         * @tc.desc    test testIsBluetoothDiscoveringNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testIsBluetoothDiscoveringNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let isBluetoothDiscovering =  connection.isBluetoothDiscovering();
                hilog.info(domain, tag, "isBluetoothDiscovering without permission ret = " + JSON.stringify(isBluetoothDiscovering));
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteProfileUuidsCallbackNop
         * @tc.name    testGetRemoteProfileUuidsCallbackNop
         * @tc.desc    test testGetRemoteProfileUuidsCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteProfileUuidsCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.getRemoteProfileUuids('11:22:33:44:55:66', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback, error:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback success");
                    }
                });
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteProfileUuidsPromiseNop
         * @tc.name    testGetRemoteProfileUuidsPromiseNop
         * @tc.desc    test testGetRemoteProfileUuidsPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteProfileUuidsPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteProfileUuids('11:22:33:44:55:66').then(()=> {
                    hilog.info(domain, tag, "getRemoteProfileUuids_promise success");
                });
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testConnectAllowedProfilesCallbackNop
         * @tc.name    testConnectAllowedProfilesCallbackNop
         * @tc.desc    test testConnectAllowedProfilesCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testConnectAllowedProfilesCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.connectAllowedProfiles('00:11:22:33:44:55', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "connectAllowedProfiles_callback, err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "connectAllowedProfiles_callback success");
                    }
                });
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectAllowedProfiles get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testConnectAllowedProfilesPromiseNop
         * @tc.name    testConnectAllowedProfilesPromiseNop
         * @tc.desc    test testConnectAllowedProfilesPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testConnectAllowedProfilesPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'connectAllowedProfiles success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectAllowedProfiles get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteDeviceBatteryInfoNop
         * @tc.name    testGetRemoteDeviceBatteryInfoNop
         * @tc.desc    test testGetRemoteDeviceBatteryInfoNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteDeviceBatteryInfoNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'getRemoteDeviceBatteryInfo success');
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceBatteryInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetRemoteDeviceNameNop
         * @tc.name    testSetRemoteDeviceNameNop
         * @tc.desc    test testSetRemoteDeviceNameNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetRemoteDeviceNameNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setRemoteDeviceName('11:22:33:44:55:66', "RemoteDeviceName").then(() => {
                    hilog.info(domain, tag, "setRemoteDeviceName success");
                });
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartBleScanNop
         * @tc.name    testStartBleScanNop
         * @tc.desc    test testStartBleScanNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartBleScanNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.startBLEScan([{}]);
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartAdvertisingNop
         * @tc.name    testStartAdvertisingNop
         * @tc.desc    test testStartAdvertisingNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartAdvertisingNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            hilog.info(domain, tag, 'manufactureValueBuffer = ' + JSON.stringify(manufactureValueBuffer));
            hilog.info(domain, tag, 'serviceValueBuffer = ' + JSON.stringify(serviceValueBuffer));
            try {
                let setting: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let manufactureDataUnit: ble.ManufactureData = {
                    manufactureId: 4567,
                    manufactureValue: manufactureValueBuffer.buffer
                };
                let serviceDataUnit: ble.ServiceData = {
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue: serviceValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                let advResponse: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                ble.startAdvertising(setting, advData, advResponse);
                expect(true).assertFalse();
            } catch (err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startAdvertising get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code == 401);
                } else {
                    expect(true).assertEqual(err.code == 201);
                }
            }
            done();
        })
    })
}