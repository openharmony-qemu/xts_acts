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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "@ohos/hypium-binary/src/main/indexStatic";
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import UIAbility from '@ohos.app.ability.UIAbility';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

let context: common.UIAbilityContext | undefined;
const TAG: string = "[RELATIONAL_STORE_SYNCEX_JSKITS_TEST]";

const STORE_CONFIG: relationalStore.StoreConfig = {
    name: "RdbTest.db",
    securityLevel: relationalStore.SecurityLevel.S1,
};

const CREATE_TABLE_TEST: string = 'CREATE TABLE IF NOT EXISTS EMPLOYEE ' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER NOT NULL UNIQUE)';

let rdbStore: relationalStore.RdbStore | null = null;
let logTag: string = 'rdbSyncFirstLevelTest:  ';
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function RelationalStoreSyncExTest(): void {
    describe('RelationalStoreSyncExTest', () => {
        beforeAll(async (): Promise<void> => {
            console.info(TAG + 'beforeAll');
            await Utils.msSleep(2000)
            let cmd = "aa start -a EntryAbility -b com.example.relationalstore";
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
            if(user !== undefined){
                cmd += ' -u ' + user;
            }
            abilityDelegator.executeShellCommand(cmd)
            await Utils.msSleep(10000)
            context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        });
        beforeEach(async (): Promise<void> => {
            console.info(TAG + 'beforeEach');
            rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            if (rdbStore !== null) {
                expect(rdbStore !== undefined).assertTrue();
                await rdbStore!.executeSql(CREATE_TABLE_TEST);
            }
        });
        afterEach(async (): Promise<void> => {
            console.info(TAG + 'afterEach');
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        });
        afterAll(async (): Promise<void> => {
            console.info(TAG + 'afterAll');
        });
        console.log(TAG + "*************Unit Test Begin*************");

        /**
         * @tc.name   testRdbStoreArksyncExTest0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0100
         * @tc.desc   No sync permission and syncEx returns 201
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest0100 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest0100 is successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest0100 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0200
         * @tc.desc   Sync mode is SYNC_MODE_CLOUD_FIRST and syncEx returns 14800001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* syncExTest0200 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'syncExTest0200 is successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 14800001).assertTrue();
            }
            console.log(TAG + "************* syncExTest0200 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0300
         * @tc.desc   store is closed and syncEx returns 14800014
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest0300 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'syncExTest0300 is successfully.');
                    await rdbStore!.close();
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 14800014).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest0300 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest0700
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0700
         * @tc.desc   sync with SYNC_MODE_PUSH, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest0700 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest0700 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest0700 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest0800
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0800
         * @tc.desc   sync with SYNC_MODE_PULL, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest0800 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest0800 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PULL, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest0800 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest0900
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_0900
         * @tc.desc   sync with SYNC_MODE_TIME_FIRST, expect 14800001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest0900 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest0900 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 14800001).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest0900 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1000
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1000
         * @tc.desc   sync with SYNC_MODE_NATIVE_FIRST, expect 14800001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1000 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1000 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 14800001).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1000 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1100
         * @tc.desc   SYNC_MODE_CLOUD_FIRST and syncEx returns 14800001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1100 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1100 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 14800001).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1100 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1200
         * @tc.desc   predicates with non-existent table, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1200 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1200 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('NON_EXISTENT_TABLE');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1200 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1300
         * @tc.desc   sync with predicates containing where condition, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1300 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1300 setDistributedTables successfully.');
                    const valueBucket: relationalStore.ValuesBucket = {
                        'name': 'TestEmployee',
                        'age': 30 as long
                    };
                    await rdbStore!.insert('EMPLOYEE', valueBucket);
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    predicates.equalTo('age', 30 as long);
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1300 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1400
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1400
         * @tc.desc   sync with predicates containing limitAs, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1400 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1400 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    predicates.limitAs(10);
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1400 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1500
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1500
         * @tc.desc   sync with predicates containing orderBy, expect 201 due to no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1500 start *************");
            try {
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1500 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    predicates.orderByDesc('age');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1500 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest1600
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_1600
         * @tc.desc   verify SyncResultCode enum values
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreArksyncExTest1600 start *************");
            try {
                expect(relationalStore.SyncResultCode.SUCCESS).assertEqual(0);
                console.info(TAG + 'SetDistributedTable EMPLOYEE begin');
                if (rdbStore !== null) {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    console.info(TAG + 'testRdbStoreArksyncExTest1600 setDistributedTables successfully.');
                    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
                    predicates.orderByDesc('age');
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
                    expect(null).assertFail();
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.error(TAG + 'syncEx is failed, code is ' + error.code + ', message is ' + error.message);
                expect(error.code == 201).assertTrue();
            }
            console.log(TAG + "************* testRdbStoreArksyncExTest1600 end *************");
            done();
        });

        /**
         * @tc.name   testRdbStoreArksyncExTest2200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoreArksyncExTest_2200
         * @tc.desc   the test of SyncResultCode enum values
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreArksyncExTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info(logTag + "testRdbStoreArksyncExTest2200 start");
            const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
            predicates.orderByDesc('age');
            try {
                if (rdbStore !== null) {
                    const result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
                    expect(relationalStore.SyncResultCode.SUCCESS).assertEqual(0);
                    expect(relationalStore.SyncResultCode.FAIL).assertEqual(1);
                    expect(relationalStore.SyncResultCode.OFFLINE).assertEqual(2);
                    expect(relationalStore.SyncResultCode.INVALID_ARGS).assertEqual(3);
                    expect(relationalStore.SyncResultCode.DISTRIBUTED_TABLE_NOT_SET).assertEqual(4);
                    expect(relationalStore.SyncResultCode.TABLE_FIELD_MISMATCH).assertEqual(5);
                    expect(relationalStore.SyncResultCode.DISTRIBUTED_SCHEMA_MISMATCH).assertEqual(6);
                    expect(relationalStore.SyncResultCode.BUSY).assertEqual(7);
                    expect(relationalStore.SyncResultCode.CORRUPTED).assertEqual(8);
                    expect(relationalStore.SyncResultCode.TIMEOUT).assertEqual(9);
                    expect(relationalStore.SyncResultCode.SCHEMA_CHANGED).assertEqual(10);
                    expect(relationalStore.SyncResultCode.CONSTRAINT_VIOLATION).assertEqual(11);
                }
            } catch (err) {
                const error: BusinessError = err as BusinessError;
                console.info(logTag + 'testRdbStoreArksyncExTest2200 sync failed ' + error.code + ' ' + error.message);
                expect(error.code == 14800001).assertTrue();
            }
            done();
            console.info(logTag + "************* testRdbStoreArksyncExTest2200 end *************");
        });

        console.log(TAG + "*************Unit Test End*************");
    });
}