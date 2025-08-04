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
import a2dp from '@ohos.bluetooth.a2dp';
import hfp from '@ohos.bluetooth.hfp';
import hid from '@ohos.bluetooth.hid';
import baseProfile from '@ohos.bluetooth.baseProfile';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtProfilesTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;
let deviceId: string = "00:11:22:33:44:55";

function onReceiveEvent(data: baseProfile.StateChangeParam) {
    hilog.info(domain, tag, 'a2dp state = '+ JSON.stringify(data));
}

export default function bluetoothProfilesTest() {

    describe("bluetoothProfilesTest", (): void => {
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
         * @tc.number: createA2dpSrcProfileTest
         * @tc.name: createA2dpSrcProfileTest
         * @tc.desc: Test createA2dpSrcProfileTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("createA2dpSrcProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
                expect(true).assertEqual(a2dpProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createA2dpSrcProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number: setConnectionStrategy_callback
         * @tc.name: setConnectionStrategy_callback
         * @tc.desc: Test setConnectionStrategy_callback API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setConnectionStrategy_callback", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                a2dpProfile.setConnectionStrategy(deviceId, baseProfile.ConnectionStrategy.CONNECTION_STRATEGY_UNSUPPORTED, (err) => {
                    if(err) {
                        hilog.info(domain, tag, "setConnectionStrategy, err: " + JSON.stringify(err));
                    }else{
                        hilog.info(domain, tag, "setConnectionStrategy success");
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setConnectionStrategy get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: setConnectionStrategy_promise
         * @tc.name: setConnectionStrategy_promise
         * @tc.desc: Test setConnectionStrategy_promise API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("setConnectionStrategy_promise", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                await a2dpProfile.setConnectionStrategy(deviceId, baseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED).then(() => {
                    hilog.info(domain, tag, "setConnectionStrategy");
                }).catch((err) => {
                    hilog.info(domain, tag, "setConnectionStrategy error");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setConnectionStrategy get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: getConnectionStrategy_callback
         * @tc.name: getConnectionStrategy_callback
         * @tc.desc: Test getConnectionStrategy_callback API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectionStrategy_callback", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                a2dpProfile.getConnectionStrategy(deviceId, (error, data) => {
                    if(error){
                        hilog.info(domain, tag, "getConnectionStrategy, err: " + JSON.stringify(error));
                    }else{
                        hilog.info(domain, tag, "getConnectionStrategy success");
                    }
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStrategy get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: getConnectionStrategy_promise
         * @tc.name: getConnectionStrategy_promise
         * @tc.desc: Test getConnectionStrategy_promise API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectionStrategy_promise", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                await a2dpProfile.getConnectionStrategy(deviceId).then((data: baseProfile.ConnectionStrategy) => {
                    hilog.info(domain, tag, "getConnectionStrategy");
                }).catch((err) => {
                    hilog.info(domain, tag, "getConnectionStrategy error");
                    expect().assertFail();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStrategy get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: getConnectedDevicesTest
         * @tc.name: getConnectedDevicesTest
         * @tc.desc: Test getConnectedDevicesTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectedDevicesTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                let devices: Array<string> = a2dpProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /*
         * @tc.number: getConnectionStateTest
         * @tc.name: getConnectionStateTest
         * @tc.desc: Test getConnectionStateTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectionStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                let state : baseProfile.ProfileConnectionState = a2dpProfile.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state == 0 || state == 1 || state == 2);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /*
         * @tc.number: testOnConnectionStateChange
         * @tc.name: testOnConnectionStateChange
         * @tc.desc: Test testOnConnectionStateChange API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOnConnectionStateChange", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            try {
                a2dpProfile.on('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: on");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOnConnectionStateChange get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            a2dpProfile.off('connectionStateChange', onReceiveEvent);
            done();
        })

        /*
         * @tc.number: testOffConnectionStateChange
         * @tc.name: testOffConnectionStateChange
         * @tc.desc: Test testOffConnectionStateChange API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOffConnectionStateChange", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
            expect(true).assertEqual(a2dpProfile != null);
            a2dpProfile.on('connectionStateChange', onReceiveEvent);
            try {
                a2dpProfile.off('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: off");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOffConnectionStateChange get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })

        /*
         * @tc.number: createHfpAgProfileTest
         * @tc.name: createHfpAgProfileTest
         * @tc.desc: Test createHfpAgProfileTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("createHfpAgProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
                expect(true).assertEqual(hfpProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHfpAgProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number: getConnectedDevicesTest_001
         * @tc.name: getConnectedDevicesTest_001
         * @tc.desc: Test getConnectedDevicesTest_001 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectedDevicesTest_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                let devices : Array<string> = hfpProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })

        /*
         * @tc.number: getConnectionStateTest_001
         * @tc.name: getConnectionStateTest_001
         * @tc.desc: Test getConnectionStateTest_001 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectionStateTest_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                let state : baseProfile.ProfileConnectionState = hfpProfile.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state == 0 || state == 1 || state == 2);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStateTest_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /*
         * @tc.number: testOnConnectionStateChange_001
         * @tc.name: testOnConnectionStateChange_001
         * @tc.desc: Test testOnConnectionStateChange_001 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOnConnectionStateChange_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                hfpProfile.on('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: on");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOnConnectionStateChange_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            hfpProfile.off('connectionStateChange', onReceiveEvent);
            done();
        })

        /*
         * @tc.number: testOffConnectionStateChange_001
         * @tc.name: testOffConnectionStateChange_001
         * @tc.desc: Test testOffConnectionStateChange_001 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOffConnectionStateChange_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            hfpProfile.on('connectionStateChange', onReceiveEvent);
            try {
                hfpProfile.off('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: off");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOffConnectionStateChange_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })

        /*
         * @tc.number: handsFreeAudioGatewayProfileConnectDisconnectTest
         * @tc.name: handsFreeAudioGatewayProfileConnectDisconnectTest
         * @tc.desc: handsFreeAudioGatewayProfileConnectDisconnectTest
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("handsFreeAudioGatewayProfileConnectDisconnectTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = "handsFreeAudioGatewayProfileConnectDisconnectTest";
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                hfpProfile.connect(deviceId);
                hilog.info(domain, tag, `${caseName} connect successful`);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `${caseName} get errCode:  ${err.code}, errMessage: ${err.message}`);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'Invalid parameter');
                    expect(true).assertEqual(err.code == 401);
                } else if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                hfpProfile.disconnect(deviceId);
                hilog.info(domain, tag, `${caseName} disconnect successful`);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `${caseName} get errCode:  ${err.code}, errMessage: ${err.message}`);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'Invalid parameter');
                    expect(true).assertEqual(err.code == 401);
                } else if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /*
         * @tc.number: createHidHostProfileTest
         * @tc.name: createHidHostProfileTest
         * @tc.desc: Test createHidHostProfileTest API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("createHidHostProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
                expect(true).assertEqual(hidProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHidHostProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number: getConnectedDevicesTest_002
         * @tc.name: getConnectedDevicesTest_002
         * @tc.desc: Test getConnectedDevicesTest_002 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectedDevicesTest_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                let devices : Array<string> = hidProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })

        /*
         * @tc.number: getConnectionStateTest_002
         * @tc.name: getConnectionStateTest_002
         * @tc.desc: Test getConnectionStateTest_002 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("getConnectionStateTest_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                let state : baseProfile.ProfileConnectionState = hidProfile.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state == 0 || state == 1 || state == 2);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStateTest_002 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /*
         * @tc.number: testOnConnectionStateChange_002
         * @tc.name: testOnConnectionStateChange_002
         * @tc.desc: Test testOnConnectionStateChange_002 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOnConnectionStateChange_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                hidProfile.on('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: on");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOnConnectionStateChange_002 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            hidProfile.off('connectionStateChange', onReceiveEvent);
            done();
        })

        /*
         * @tc.number: testOffConnectionStateChange_002
         * @tc.name: testOffConnectionStateChange_002
         * @tc.desc: Test testOffConnectionStateChange_002 API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("testOffConnectionStateChange_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            hidProfile.on('connectionStateChange', onReceiveEvent);
            try {
                hidProfile.off('connectionStateChange', onReceiveEvent);
                hilog.info(domain, tag, "the connection state: off");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testOffConnectionStateChange_002 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })

        /*
         * @tc.number: hidHostProfileConnectDisconnectTest
         * @tc.name: hidHostProfileConnectDisconnectTest
         * @tc.desc: hidHostProfileConnectDisconnectTest
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it("hidHostProfileConnectDisconnectTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = "hidHostProfileConnectDisconnectTest";
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                hidProfile.connect(deviceId);
                hilog.info(domain, tag, `${caseName} connect successful`);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `${caseName} get errCode:  ${err.code}, errMessage: ${err.message}`);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'Invalid parameter');
                    expect(true).assertEqual(err.code == 401);
                } else if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                hidProfile.disconnect(deviceId);
                hilog.info(domain, tag, `${caseName} disconnect successful`);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, `${caseName} get errCode:  ${err.code}, errMessage: ${err.message}`);
                if (err.code == 401) {
                    hilog.info(domain, tag, 'Invalid parameter');
                    expect(true).assertEqual(err.code == 401);
                } else if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
    })
}