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
import access from '@ohos.bluetooth.access';
import constant from '@ohos.bluetooth.constant';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtBleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;

export default function bluetoothAccessTest() {

    describe("bluetoothAccessTest", (): void => {
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
         * @tc.number: constantTest
         * @tc.name: constantTest
         * @tc.desc: Test constantTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("constantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let STATE_DISCONNECTED: constant.ProfileConnectionState = constant.ProfileConnectionState.STATE_DISCONNECTED;
                hilog.info(domain, tag, "STATE_DISCONNECTED:" + STATE_DISCONNECTED);
                expect(true).assertEqual(STATE_DISCONNECTED == 0);
                let STATE_CONNECTED: constant.ProfileConnectionState = constant.ProfileConnectionState.STATE_CONNECTED;
                hilog.info(domain, tag, "STATE_CONNECTED:" + STATE_CONNECTED);
                expect(true).assertEqual(STATE_CONNECTED == 2);
                let MAJOR_AUDIO_VIDEO: constant.MajorClass = constant.MajorClass.MAJOR_AUDIO_VIDEO;
                hilog.info(domain, tag, "MAJOR_AUDIO_VIDEO:" + MAJOR_AUDIO_VIDEO);
                expect(true).assertEqual(MAJOR_AUDIO_VIDEO == 0x0400);
                let MAJOR_UNCATEGORIZED: constant.MajorClass = constant.MajorClass.MAJOR_UNCATEGORIZED;
                hilog.info(domain, tag, "MAJOR_UNCATEGORIZED:" + MAJOR_UNCATEGORIZED);
                expect(true).assertEqual(MAJOR_UNCATEGORIZED == 0x1F00);
                let MAJOR_PHONE: constant.MajorClass = constant.MajorClass.MAJOR_PHONE;
                hilog.info(domain, tag, "MAJOR_PHONE:" + MAJOR_PHONE);
                expect(true).assertEqual(MAJOR_PHONE == 0x0200);
                let AUDIO_VIDEO_LOUDSPEAKER: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_LOUDSPEAKER;
                hilog.info(domain, tag, "AUDIO_VIDEO_LOUDSPEAKER:" + AUDIO_VIDEO_LOUDSPEAKER);
                expect(true).assertEqual(AUDIO_VIDEO_LOUDSPEAKER == 0x0414);
                let AUDIO_VIDEO_WEARABLE_HEADSET: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_WEARABLE_HEADSET;
                hilog.info(domain, tag, "AUDIO_VIDEO_WEARABLE_HEADSET:" + AUDIO_VIDEO_WEARABLE_HEADSET);
                expect(true).assertEqual(AUDIO_VIDEO_WEARABLE_HEADSET == 0x0404);
                let AUDIO_VIDEO_HEADPHONES: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_HEADPHONES;
                hilog.info(domain, tag, "AUDIO_VIDEO_HEADPHONES:" + AUDIO_VIDEO_HEADPHONES);
                expect(true).assertEqual(AUDIO_VIDEO_HEADPHONES == 0x0418);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: bluetoothOnOffStateTest
         * @tc.name: bluetoothOnOffStateTest
         * @tc.desc: Test bluetoothOnOffStateTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("bluetoothOnOffStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.disableBluetooth();
                await Utils.clickRequestPermission("关闭");
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try{
                let state: access.BluetoothState = access.getState();
                hilog.info(domain, tag, "getState:" + state);
                expect(true).assertEqual(state == access.BluetoothState.STATE_OFF);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                access.enableBluetooth();
                await Utils.clickRequestPermission("开启");
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try {
                let states: access.BluetoothState = access.getState();
                hilog.info(domain, tag, "getState:" + states);
                expect(true).assertEqual(states == access.BluetoothState.STATE_ON);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getState get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number: accessConstantTest
         * @tc.name: accessConstantTest
         * @tc.desc: Test accessConstantTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("accessConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let STATE_OFF: access.BluetoothState = access.BluetoothState.STATE_OFF;
                hilog.info(domain, tag, "STATE_OFF:" + STATE_OFF);
                expect(true).assertEqual(STATE_OFF == 0);
                let STATE_ON: access.BluetoothState = access.BluetoothState.STATE_ON;
                hilog.info(domain, tag, "STATE_ON:" + STATE_ON);
                expect(true).assertEqual(STATE_ON == 2);
                let STATE_TURNING_OFF: access.BluetoothState = access.BluetoothState.STATE_TURNING_OFF;
                hilog.info(domain, tag, "STATE_TURNING_OFF:" + STATE_TURNING_OFF);
                expect(true).assertEqual(STATE_TURNING_OFF == 3);
                let STATE_TURNING_ON: access.BluetoothState = access.BluetoothState.STATE_TURNING_ON;
                hilog.info(domain, tag, "STATE_TURNING_ON:" + STATE_TURNING_ON);
                expect(true).assertEqual(STATE_TURNING_ON == 1);
                let STATE_BLE_TURNING_OFF: access.BluetoothState = access.BluetoothState.STATE_BLE_TURNING_OFF;
                hilog.info(domain, tag, "STATE_BLE_TURNING_OFF:" + STATE_BLE_TURNING_OFF);
                expect(true).assertEqual(STATE_BLE_TURNING_OFF == 6);
                let STATE_BLE_ON: access.BluetoothState = access.BluetoothState.STATE_BLE_ON;
                hilog.info(domain, tag, "STATE_BLE_ON:" + STATE_BLE_ON);
                expect(true).assertEqual(STATE_BLE_ON == 5);
                let STATE_BLE_TURNING_ON: access.BluetoothState = access.BluetoothState.STATE_BLE_TURNING_ON;
                hilog.info(domain, tag, "STATE_BLE_TURNING_ON:" + STATE_BLE_TURNING_ON);
                expect(true).assertEqual(STATE_BLE_TURNING_ON == 4);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "accessConstant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number DeletePersistentDeviceIdSyncTest
         * @tc.name DeletePersistentDeviceIdSyncTest
         * @tc.desc Test DeletePersistentDeviceIdSync API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("DeletePersistentDeviceIdSyncTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                await access.deletePersistentDeviceId("11:22:33:44:55:66").then(() => {
                    hilog.info(domain, tag, "deletePersistentDeviceId success");
                }).catch((err) => {
                    hilog.info(domain, tag, "deletePersistentDeviceId failed");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "deletePersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    hilog.info(domain, tag, "deletePersistentDeviceId is not support");
                    expect(true).assertEqual(err.code == 801);
                }else {
                    expect(true).assertEqual(err.code == 401);
                }
            }
            done();
        })

        /**
         * @tc.number getPersistentDeviceIdsTest
         * @tc.name getPersistentDeviceIdsTest
         * @tc.desc Test getPersistentDeviceIds API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("getPersistentDeviceIdsTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                let macs: string[] = access.getPersistentDeviceIds();
                hilog.info(domain, tag, "getPersistentDeviceIds:" + JSON.stringify(macs));
                expect(true).assertEqual(macs.length == 0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPersistentDeviceIds get errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    hilog.info(domain, tag, "getPersistentDeviceIds is not support");
                    expect(true).assertEqual(err.code == 801);
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number IsValidRandomDeviceIdTest
         * @tc.name IsValidRandomDeviceIdTest
         * @tc.desc Test IsValidRandomDeviceId API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("IsValidRandomDeviceIdTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                let isValidRandom = access.isValidRandomDeviceId("11:22:33:44:55:66");
                hilog.info(domain, tag, "isValidRandomDeviceId:" + JSON.stringify(isValidRandom));
                expect(isValidRandom).assertFalse();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isValidRandomDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, "isValidRandomDeviceId is not support");
                    expect(true).assertEqual(err.code == 801);
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number AddPersistentDeviceIdTest
         * @tc.name AddPersistentDeviceIdTest
         * @tc.desc Test AddPersistentDeviceId API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("AddPersistentDeviceIdTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                await access.addPersistentDeviceId("11:22:33:44:55:66").then(() => {
                    hilog.info(domain, tag, "addPersistentDeviceId success");
                }).catch((err) => {
                    hilog.info(domain, tag, "addPersistentDeviceId failed");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addPersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    hilog.info(domain, tag, 'addPersistentDeviceId is not support');
                    expect(true).assertEqual(err.code == 801);
                }else {
                    expect(true).assertEqual(err.code == 401);
                }
            }
            done();
        })

        /**
         * @tc.number DisableBluetoothTest
         * @tc.name DisableBluetoothTest
         * @tc.desc Test DisableBluetooth API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("DisableBluetoothTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            let state = access.getState();
            hilog.info(domain, tag, "disableBluetooth, bluetooth state = "+ JSON.stringify(state));
            if(state != access.BluetoothState.STATE_ON) {
                access.enableBluetooth();
                await Utils.msSleep(10000);
                let openSt = access.getState();
                hilog.info(domain, tag, "disableBluetooth, bluetooth enable state ="+ JSON.stringify(openSt));
                expect(openSt).assertEqual(access.BluetoothState.STATE_ON);
            } else {
                hilog.info(domain, tag, "disableBluetooth, bluetooth state is ON");
            }
            try {
                access.disableBluetooth();
                await Utils.msSleep(10000);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "disableBluetooth, get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            let closeSt = access.getState();
            hilog.info(domain, tag, "disableBluetooth, bluetooth disable state ="+ JSON.stringify(closeSt));
            expect(closeSt).assertEqual(access.BluetoothState.STATE_OFF);
            done();
        })

        /**
         * @tc.number enableBluetoothTest
         * @tc.name enableBluetoothTest
         * @tc.desc Test enableBluetooth API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("EnableBluetoothTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            let state = access.getState();
            hilog.info(domain, tag, "enableBluetooth, bluetooth state = "+ JSON.stringify(state));
            if(state != access.BluetoothState.STATE_OFF) {
                access.disableBluetooth();
                await Utils.msSleep(10000);
                let closeSt = access.getState();
                hilog.info(domain, tag, "enableBluetooth, bluetooth disable state ="+ JSON.stringify(closeSt));
                expect(closeSt).assertEqual(access.BluetoothState.STATE_OFF);
            } else {
                hilog.info(domain, tag, "enableBluetooth, bluetooth state is OFF");
            }
            try {
                access.enableBluetooth();
                await Utils.msSleep(10000);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "enableBluetooth, get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            let openSt = access.getState();
            hilog.info(domain, tag, "enableBluetooth, bluetooth enable state ="+ JSON.stringify(openSt));
            expect(openSt).assertEqual(access.BluetoothState.STATE_ON);
            done();
        })

        /**
         * @tc.number GetLocalAddressTest
         * @tc.name GetLocalAddressTest
         * @tc.desc Test GetLocalAddress API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("getLocalAddressTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                let macs: string = access.getLocalAddress();
                hilog.info(domain, tag, "GetLocalAddress:" + JSON.stringify(macs));
                expect(true).assertEqual(macs.length == 0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "GetLocalAddress get errCode:" + err.code + ",errMessage:" + err.message);
                if (Number(err.code) == 801) {
                    hilog.info(domain, tag, "GetLocalAddress is not support");
                    expect(true).assertEqual(err.code == 801);
                }else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number FactoryReset_Callback
         * @tc.name FactoryReset_Callback
         * @tc.desc Test FactoryReset API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("FactoryReset_Callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                access.factoryReset((err) => {
                    if (err) {
                        hilog.info(domain, tag, "factoryReset_callback error");
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "errCode: " + err.code + ", errMessage: "+ err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number FactoryReset_Promise
         * @tc.name FactoryReset_Promise
         * @tc.desc Test FactoryReset API functionality
         * @tc.type Function
         * @tc.size MEDIUMTEST
         * @tc.level Level 0
         */
        it("FactoryReset_Promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done : () => void): Promise<void> =>  {
            try {
                await access.factoryReset().then(() => {
                    hilog.info(domain, tag, "factoryReset_promise success");
                }).catch((err) => {
                    hilog.info(domain, tag, "factoryReset_promise failed");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "errCode: " + err.code + ", errMessage: "+ err.message);
                expect().assertFail();
            }
            done();
        })
    })
}