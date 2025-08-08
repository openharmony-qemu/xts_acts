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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.bluetooth.connection';
import ble from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtConnectionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let deviceId: string = "00:11:22:33:44:55";
let g_context: common.UIAbilityContext;

function onReceivePinRequiredEvent(data: connection.PinRequiredParam) { // data为配对请求的入参，配对请求参数
    hilog.info(domain, tag, "pin required  = "+ JSON.stringify(data));
    connection.setDevicePairingConfirmation(data.deviceId, true);
}

function BondStateParam(data: connection.BondStateParam) {
    hilog.info(domain, tag, "bondStateChange on:" + JSON.stringify(data));
}

function BondStateParam1(data: connection.BondStateParam) {
    hilog.info(domain, tag, "bondStateChange on:" + JSON.stringify(data)
        +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
}

function onReceiveEvent2(data: Array<string>) {
    hilog.info(domain, tag, 'Device' + JSON.stringify(data) +
        'length' + data.length);
    expect(data.length > 0).assertTrue();
}

export default function bluetoothConnectionTest() {

    describe("bluetoothConnectionTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.ACCESS_BLUETOOTH')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /*
         * @tc.number: getRemoteDeviceNameAliasTest
         * @tc.name: getRemoteDeviceNameAliasTest
         * @tc.desc: Test getRemoteDeviceNameAliasTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceNameAliasTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
                hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
                expect(true).assertEqual(aliasName == "");
                let aliasNames: string = connection.getRemoteDeviceName("00:11:22:33:44:55", false);
                hilog.info(domain, tag, "getRemoteDeviceName alias is false:" + aliasNames);
                expect(true).assertEqual(aliasNames == "");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getRemoteDeviceClassTest
         * @tc.name: getRemoteDeviceClassTest
         * @tc.desc: Test getRemoteDeviceClassTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceClassTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + JSON.stringify(deviceClass.majorClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorMinorClass:" + JSON.stringify(deviceClass.majorMinorClass));
                expect(true).assertEqual(deviceClass != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: setBluetoothScanModeTest
         * @tc.name: setBluetoothScanModeTest
         * @tc.desc: Test setBluetoothScanModeTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setBluetoothScanModeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
                hilog.info(domain, tag, "setBluetoothScanMode success");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getPairedDevicesTest
         * @tc.name: getPairedDevicesTest
         * @tc.desc: Test getPairedDevicesTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getPairedDevicesTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let devices: Array<string> = connection.getPairedDevices();
                hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
                expect(true).assertEqual(devices != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: connectionConstantTest
         * @tc.name: connectionConstantTest
         * @tc.desc: Test connectionConstantTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("connectionConstantTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let BOND_STATE_BONDED: connection.BondState = connection.BondState.BOND_STATE_BONDED;
                hilog.info(domain, tag, "BOND_STATE_BONDED:" + BOND_STATE_BONDED);
                expect(true).assertEqual(BOND_STATE_BONDED == 2);
                let SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE: connection.ScanMode = connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE;
                hilog.info(domain, tag, "SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE:" + SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
                expect(true).assertEqual(SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE == 4);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "ConnectionConstant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: controlDeviceActionTest
         * @tc.name: controlDeviceActionTest
         * @tc.desc: Test controlDeviceActionfiles API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("controlDeviceActionTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let controlDeviceActionParams: connection.ControlDeviceActionParams = {
                    deviceId: "40:DC:A5:E5:75:C3",
                    type: connection.ControlType.PLAY,
                    typeValue: connection.ControlTypeValue.ENABLE,
                    controlObject: connection.ControlObject.LEFT_EAR
                };
                await connection.controlDeviceAction(controlDeviceActionParams).then(() => {
                    hilog.info(domain, tag, "controlDeviceAction success");
                }).catch((err) => {
                    hilog.info(domain, tag, "controlDeviceAction error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "controlDeviceAction get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getLastConnectionTimeTest
         * @tc.name: getLastConnectionTimeTest
         * @tc.desc: Test getLastConnectionTime API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getLastConnectionTimeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getLastConnectionTime(deviceId).then((time: long) => {
                    hilog.info(domain, tag, "getLastConnectionTime result:" + JSON.stringify(time));
                }).catch((err) => {
                    hilog.info(domain, tag, "getLastConnectionTime error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLastConnectionTime get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getRemoteDeviceTypeTest
         * @tc.name: getRemoteDeviceTypeTest
         * @tc.desc: Test getRemoteDeviceType API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceTypeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteDeviceType(deviceId).then((data: connection.DeviceType) => {
                    hilog.info(domain, tag, "getRemoteDeviceType success, deviceType: "+JSON.stringify(data));
                }).catch((err) => {
                    hilog.info(domain, tag, "getRemoteDeviceType error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceType get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: updateCloudBluetoothDeviceTest
         * @tc.name: updateCloudBluetoothDeviceTest
         * @tc.desc: Test updateCloudBluetoothDevice API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("updateCloudBluetoothDeviceTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const trustPairDeviceArr: connection.TrustedPairedDevice[] = [];
            let descBuffer = new ArrayBuffer(1);
            trustPairDeviceArr.push({
                sn: '',
                deviceType: '',
                modelId: '',
                manufactory: '',
                productId: '',
                hiLinkVersion: '',
                macAddress: '11:22:33:44:55:66',
                serviceType: '',
                serviceId: '',
                deviceName: '',
                uuids: '',
                bluetoothClass: 0,
                token: descBuffer,
                deviceNameTime: 0,
                secureAdvertisingInfo: descBuffer,
                pairState: 0
            });
            const trustPairDevices: connection.TrustedPairedDevices = { trustedPairedDevices: trustPairDeviceArr };
            try {
                connection.updateCloudBluetoothDevice(trustPairDevices).then(() => {
                    hilog.info(domain, tag, "updateCloudBluetoothDevice success!");
                }).catch((err) => {
                    hilog.info(domain, tag, "updateCloudBluetoothDevice error");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "updateCloudBluetoothDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: getRemoteDeviceBatteryInfoTest
         * @tc.name: getRemoteDeviceBatteryInfoTest
         * @tc.desc: Test getRemoteDeviceBatteryInfo API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getRemoteDeviceBatteryInfoTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteDeviceBatteryInfo(deviceId).then((data:connection.BatteryInfo) => {
                    hilog.info(domain, tag, "getRemoteDeviceBatteryInfo success");
                }).catch((err) => {
                    hilog.info(domain, tag, "getRemoteDeviceBatteryInfo error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceBatteryInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: setRemoteDeviceNameTest
         * @tc.name: setRemoteDeviceNameTest
         * @tc.desc: Test setRemoteDeviceName API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setRemoteDeviceNameTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setRemoteDeviceName(deviceId, "RemoteDeviceName").then(() => {
                    hilog.info(domain, tag, "setRemoteDeviceName success");
                }).catch((err) => {
                    hilog.info(domain, tag, "setRemoteDeviceName error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: setRemoteDeviceTypeTest
         * @tc.name: setRemoteDeviceTypeTest
         * @tc.desc: Test setRemoteDeviceType API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setRemoteDeviceTypeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setRemoteDeviceType(deviceId, connection.DeviceType.DEVICE_TYPE_HEADSET).then(() => {
                    hilog.info(domain, tag, "setRemoteDeviceType success");
                }).catch((err) => {
                    hilog.info(domain, tag, "setRemoteDeviceType error " + JSON.stringify(err));
                    expect(Number(err.code)).assertEqual(0);
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setRemoteDeviceType get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: setDevicePairingConfirmationTest
         * @tc.name: setDevicePairingConfirmationTest
         * @tc.desc: Test setDevicePairingConfirmationTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setDevicePairingConfirmationTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.on("pinRequired", onReceivePinRequiredEvent);
                hilog.info(domain, tag, "setDevicePairingConfirmation success");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
        * @tc.number: getBluetoothScanModeTest
        * @tc.name: getBluetoothScanModeTest
        * @tc.desc: Test getBluetoothScanMode API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("getBluetoothScanModeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let state = btAccess.getState();
            hilog.info(domain, tag, 'get bluetooth state001'+ JSON.stringify(state));
            if(state == 2)
            {
                let oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0100 oldScanMode = '+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_NONE,0);
                let getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0100 newscanmode = '+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_NONE);
                connection.setBluetoothScanMode(oldScanMode,0);
                let getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0100 setoldscanmode = '+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0200 oldScanMode = '+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0200 newscanmode = '+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0200 setoldscanmode = '+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0300 oldScanMode = '+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,40000);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0300 getScanMode = '+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0300 getOldScanMode = '+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0400 oldScanMode = "+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,40000);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0400 getScanMode = "+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0400 getOldScanMode = "+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0500 oldScanMode = "+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,0);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0500 getScanMode = "+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0500 getOldScanMode = "+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0600 oldScanMode = "+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,0);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0600 getScanMode = "+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0600 getOldScanMode = "+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0700 oldScanMode = "+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,20000);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0700 getScanMode = "+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0700 getOldScanMode = "+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "ScanMode_0800 oldScanMode = "+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,0);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0800 getScanMode = '+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0800 getOldScanMode = '+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();

                oldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0900 oldScanMode = '+ JSON.stringify(Number(oldScanMode)));
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,30000);
                getScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0900 getScanMode = '+ JSON.stringify(Number(getScanMode)));
                expect(true).assertEqual(getScanMode == connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
                connection.setBluetoothScanMode(oldScanMode,0);
                getOldScanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, 'ScanMode_0900 getOldScanMode = '+ JSON.stringify(Number(getOldScanMode)));
                expect(true).assertEqual(oldScanMode == getOldScanMode);
                done();
            }
            else
            {
                hilog.info(domain, tag, 'bluetooth switch  off,state is   = '+ JSON.stringify(state));
                expect(true).assertFalse();
                done();
            }
        })

        /*
        * @tc.number: getProfileConnectionStateTest
        * @tc.name: getProfileConnectionStateTest
        * @tc.desc: Test getProfileConnectionState API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("getProfileConnectionStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let connectionState = connection.getProfileConnectionState();
                expect(true).assertEqual(connectionState == 0 || connectionState == 1 || connectionState == 2 || connectionState == 3);

                let result = connection.getProfileConnectionState(connection.ProfileId.PROFILE_A2DP_SOURCE);
                expect(true).assertEqual(result == 0 || result == 1 || result == 2 || result == 3);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
        * @tc.number: getLocalNameTest
        * @tc.name: getLocalNameTest
        * @tc.desc: Test getLocalName API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("getLocalNameTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let getNewName = connection.getLocalName();
                hilog.info(domain, tag, 'LocalName_0700 NewName = '+ JSON.stringify(getNewName));
                expect(true).assertEqual(getNewName != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })


        /*
        * @tc.number: getPairStateTest
        * @tc.name: getPairStateTest
        * @tc.desc: Test getPairState API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("getPairStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state: connection.BondState = connection.getPairState("00:11:22:33:44:55");
                hilog.info(domain, tag, "getPairState: " + state);
                expect(true).assertEqual(state == 0 || state == 1 || state == 2);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "getPairState errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })


        /*
        * @tc.number: startBluetoothDiscoveryTest
        * @tc.name: startBluetoothDiscoveryTest
        * @tc.desc: Test startBluetoothDiscovery API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("startBluetoothDiscoveryTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.on("bluetoothDeviceFind", onReceiveEvent2);
                connection.startBluetoothDiscovery();
                connection.off('bluetoothDeviceFind', onReceiveEvent2);
                connection.stopBluetoothDiscovery();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `[bluetooth_js]bluetoothDeviceFin error, code is ${err.code},message is ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            connection.off('bluetoothDeviceFind', onReceiveEvent2);
            done();
        })

        /*
        * @tc.number: isBluetoothDiscoveringTest
        * @tc.name: isBluetoothDiscoveringTest
        * @tc.desc: Test isBluetoothDiscovering API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("isBluetoothDiscoveringTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let result: boolean = connection.isBluetoothDiscovering();
                hilog.info(domain, tag, "isBluetoothDiscovering: " + result);
                expect(result).assertEqual(false);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "isBluetoothDiscovering errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
        * @tc.number: stopBluetoothDiscoveryTest
        * @tc.name: stopBluetoothDiscoveryTest
        * @tc.desc: Test stopBluetoothDiscovery API functionality
        * @tc.level: Level 0
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
        it("stopBluetoothDiscoveryTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.on("bluetoothDeviceFind", onReceiveEvent2);
                connection.startBluetoothDiscovery();
                connection.off('bluetoothDeviceFind', onReceiveEvent2);
                connection.stopBluetoothDiscovery();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `[bluetooth_js]bluetoothDeviceFin error, code is ${err.code},message is ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            connection.off('bluetoothDeviceFind', onReceiveEvent2);
            done();
        })
    })
}