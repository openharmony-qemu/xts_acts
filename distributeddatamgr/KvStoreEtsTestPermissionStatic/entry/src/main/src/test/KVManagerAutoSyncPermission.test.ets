'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium/index';
import factory from '@ohos.data.distributedKVStore';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';

const domain = 0xFF00;
const TAG = "[testtag >>>>>> ]"
let context: common.UIAbilityContext|null = null;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.permission.static';
const TEST_STORE_ID_SINGLE = 'KVManagerAutoSyncSingle';
const TEST_STORE_ID_DEVICE = 'KVManagerAutoSyncDevice';
let kvManager: factory.KVManager|null = null;
let singleKvStore : factory.SingleKVStore|null = null;
let deviceKvStore : factory.DeviceKVStore|null = null;

const g_optionsAutoSyncTrueSingle: factory.Options = {
    createIfMissing: true,
    encrypt: false,
    backup: false,
    autoSync: true,
    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
    securityLevel: factory.SecurityLevel.S2,
};

const g_optionsAutoSyncFalseSingle: factory.Options = {
    createIfMissing: true,
    encrypt: false,
    backup: false,
    autoSync: false,
    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
    securityLevel: factory.SecurityLevel.S2,
};

const g_optionsAutoSyncTrueDevice: factory.Options = {
    createIfMissing: true,
    encrypt: false,
    backup: false,
    autoSync: true,
    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
    securityLevel: factory.SecurityLevel.S2,
};

export default function KVManagerAutoSyncPermission() {
    describe('KVManagerAutoSyncPermission', (): void => {
        beforeAll(async (done: () => void): Promise<void> => {
            try {
                hilog.info(domain, TAG, '%{public}s', '================ beforeAll start KVManagerAutoSyncPermission==========');
                await Utils.msSleep(2000)
                let cmd = "aa start -a EntryAbility -b com.example.kvstoreetstest.permission.static";
                let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
                if(user !== undefined){
                    cmd += ' -u ' + user;
                }
                abilityDelegator.executeShellCommand(cmd)

                await Utils.msSleep(8000)
                context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
                hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);

                const config: factory.KVManagerConfig = {
                    bundleName: TEST_BUNDLE_NAME,
                    context: context!
                };
                kvManager = factory.createKVManager(config);
                console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
                done();
            } catch (e) {
                hilog.info(domain, TAG, '%{public}s', "============beforeAll context e: " + e);
                hilog.info(domain, TAG, '%{public}s', '================ beforeAll context end==========');
                done();
            }
        });
        afterAll(async (done: () => void): Promise<void> => {
            console.info(TAG + 'afterAll');
            if (kvManager !== null) {
                try {
                    if (singleKvStore !== null) {
                        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID_SINGLE, g_optionsAutoSyncTrueSingle);
                        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID_SINGLE, g_optionsAutoSyncTrueSingle);
                        singleKvStore = null;
                    }
                    if (deviceKvStore !== null) {
                        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID_DEVICE, g_optionsAutoSyncTrueDevice);
                        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID_DEVICE, g_optionsAutoSyncTrueDevice);
                        deviceKvStore = null;
                    }
                } catch (e) {
                    console.error(TAG + 'afterAll cleanup error: ' + e);
                }
            }
            done();
        });
        beforeEach(async (done: () => void): Promise<void> => {
            console.info(TAG + 'beforeEach');
            done();
        });
        afterEach(async (done: () => void): Promise<void> => {
            console.info(TAG + 'afterEach');
            done();
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_Options_autoSync_Permission_Single_0010
         * @tc.name OptionsAutoSyncPermissionSingle0010
         * @tc.desc   Options.autoSync=true, 已申请ohos.permission.DISTRIBUTED_DATASYNC权限, 创建SingleKVStore成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('OptionsAutoSyncPermissionSingle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info(TAG + '---------OptionsAutoSyncPermissionSingle0010---------');
            try {
                expect(g_optionsAutoSyncTrueSingle.autoSync).assertEqual(true);
                await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID_SINGLE, g_optionsAutoSyncTrueSingle).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore Single with autoSync=true success');
                    expect(store != undefined && store != null).assertTrue();
                    singleKvStore = store;
                    done();
                }).catch((err: Error) => {
                    console.error(TAG + ' getKVStore Single err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' test e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_Options_autoSync_Permission_Device_0020
         * @tc.name OptionsAutoSyncPermissionDevice0020
         * @tc.desc   Options.autoSync=true, 已申请ohos.permission.DISTRIBUTED_DATASYNC权限, 创建DeviceKVStore成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('OptionsAutoSyncPermissionDevice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info(TAG + '---------OptionsAutoSyncPermissionDevice0020---------');
            try {
                expect(g_optionsAutoSyncTrueDevice.autoSync).assertEqual(true);
                expect(g_optionsAutoSyncTrueDevice.kvStoreType).assertEqual(factory.KVStoreType.DEVICE_COLLABORATION);
                await kvManager!.getKVStore<factory.DeviceKVStore>(TEST_STORE_ID_DEVICE, g_optionsAutoSyncTrueDevice).then((store: factory.DeviceKVStore) => {
                    console.info(TAG + ' getKVStore Device with autoSync=true success');
                    expect(store != undefined && store != null).assertTrue();
                    deviceKvStore = store;
                    done();
                }).catch((err: Error) => {
                    console.error(TAG + ' getKVStore Device err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' test e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_Options_autoSync_Permission_False_0030
         * @tc.name OptionsAutoSyncPermissionFalse0030
         * @tc.desc   Options.autoSync=false, 已申请权限时创建SingleKVStore成功
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('OptionsAutoSyncPermissionFalse0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info(TAG + '---------OptionsAutoSyncPermissionFalse0030---------');
            const testStoreId = 'KVManagerAutoSyncFalsePermTest';
            try {
                expect(g_optionsAutoSyncFalseSingle.autoSync).assertEqual(false);
                await kvManager!.getKVStore<factory.SingleKVStore>(testStoreId, g_optionsAutoSyncFalseSingle).then(async (store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore with autoSync=false (with permission) success');
                    expect(store != undefined && store != null).assertTrue();
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, testStoreId, g_optionsAutoSyncFalseSingle).then(async () => {
                        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, testStoreId, g_optionsAutoSyncFalseSingle).then(() => {
                            done();
                        }).catch((err: Error) => {
                            console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                            expect(null).assertFail();
                            done();
                        });
                    }).catch((err: Error) => {
                        console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }).catch((err: Error) => {
                    console.error(TAG + ' getKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' test e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });
    });
}
