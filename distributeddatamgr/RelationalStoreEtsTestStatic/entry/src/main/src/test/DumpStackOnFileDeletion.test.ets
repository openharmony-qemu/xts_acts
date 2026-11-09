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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

const TAG: string = "[RdbDumpStackOnFileDeletionTest]";
const STORE_NAME: string = "dump_stack_on_file_deletion.db";
const TABLE_NAME: string = "dump_stack_test";
const CREATE_TABLE_SQL: string = "CREATE TABLE IF NOT EXISTS dump_stack_test " +
  "(id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER)";

let context: common.UIAbilityContext | undefined = undefined;
let rdbStore: relationalStore.RdbStore | undefined = undefined;

export default function dumpStackOnFileDeletionTest(): void {
  describe('rdbDumpStackOnFileDeletionTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let cmd: string = "aa start -a EntryAbility -b com.example.relationalstore";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      console.info(TAG + 'beforeAll end');
    })

    beforeEach((): void => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach start');
      if (rdbStore != undefined) {
        await rdbStore.close();
        rdbStore = undefined;
      }
      await relationalStore.deleteRdbStore(context!, STORE_NAME);
      console.info(TAG + 'afterEach end');
    })

    afterAll((): void => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   testDumpStackOnFileDeletion0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_static_0100
     * @tc.desc   open rdb store with dumpStackOnFileDeletion set to true succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDumpStackOnFileDeletion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testDumpStackOnFileDeletion0001 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: true
        };
        expect(storeConfig.dumpStackOnFileDeletion).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
        expect(rdbStore !== undefined).assertTrue();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(TAG + `testDumpStackOnFileDeletion0001 failed, code:${e.code}, message:${e.message}.`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0001 end   *************");
    })

    /**
     * @tc.name   testDumpStackOnFileDeletion0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_static_0200
     * @tc.desc   open rdb store with dumpStackOnFileDeletion set to false succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDumpStackOnFileDeletion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testDumpStackOnFileDeletion0002 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: false
        };
        expect(storeConfig.dumpStackOnFileDeletion).assertFalse();
        rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
        expect(rdbStore !== undefined).assertTrue();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(TAG + `testDumpStackOnFileDeletion0002 failed, code:${e.code}, message:${e.message}.`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0002 end   *************");
    })

    /**
     * @tc.name   testDumpStackOnFileDeletion0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_static_0300
     * @tc.desc   open rdb store without passing dumpStackOnFileDeletion (undefined, default false),
     *            create table and CRUD operations succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDumpStackOnFileDeletion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testDumpStackOnFileDeletion0003 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1
        };
        expect(storeConfig.dumpStackOnFileDeletion === undefined).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
        expect(rdbStore !== undefined).assertTrue();
        await rdbStore!.executeSql(CREATE_TABLE_SQL);
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": "test_data_003",
          "data2": 100 as long
        };
        let rowId = await rdbStore!.insert(TABLE_NAME, valueBucket);
        expect(rowId).assertEqual(1);
        let queryPredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        let resultSet = await rdbStore!.query(queryPredicates);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.goToFirstRow();
        expect(resultSet.getString(resultSet.getColumnIndex("data1"))).assertEqual("test_data_003");
        resultSet.close();
        const updateBucket: relationalStore.ValuesBucket = {
          "data1": "test_data_003_update",
          "data2": 101 as long
        };
        let updatePredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        updatePredicates.equalTo("id", 1 as long);
        let updateNum = await rdbStore!.update(updateBucket, updatePredicates);
        expect(updateNum).assertEqual(1);
        let updateResultSet = await rdbStore!.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateResultSet.rowCount).assertEqual(1);
        updateResultSet.goToFirstRow();
        expect(updateResultSet.getString(updateResultSet.getColumnIndex("data1"))).assertEqual("test_data_003_update");
        updateResultSet.close();
        let deletePredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        let deleteNum = await rdbStore!.delete(deletePredicates);
        expect(deleteNum).assertEqual(1);
        let deleteResultSet = await rdbStore!.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteResultSet.rowCount).assertEqual(0);
        deleteResultSet.close();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(TAG + `testDumpStackOnFileDeletion0003 failed, code:${e.code}, message:${e.message}.`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0003 end   *************");
    })

    /**
     * @tc.name   testDumpStackOnFileDeletion0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_static_0400
     * @tc.desc   open rdb store with dumpStackOnFileDeletion set to undefined,
     *            create table and CRUD operations succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDumpStackOnFileDeletion0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "************* testDumpStackOnFileDeletion0004 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: undefined
        };
        expect(storeConfig.dumpStackOnFileDeletion === undefined).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
        expect(rdbStore !== undefined).assertTrue();
        await rdbStore!.executeSql(CREATE_TABLE_SQL);
        const valueBucket: relationalStore.ValuesBucket = {
          "data1": "test_data_004",
          "data2": 200 as long
        };
        let rowId = await rdbStore!.insert(TABLE_NAME, valueBucket);
        expect(rowId).assertEqual(1);
        let queryPredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        let resultSet = await rdbStore!.query(queryPredicates);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.goToFirstRow();
        expect(resultSet.getString(resultSet.getColumnIndex("data1"))).assertEqual("test_data_004");
        resultSet.close();
        const updateBucket: relationalStore.ValuesBucket = {
          "data1": "test_data_004_update",
          "data2": 201 as long
        };
        let updatePredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        updatePredicates.equalTo("id", 1 as long);
        let updateNum = await rdbStore!.update(updateBucket, updatePredicates);
        expect(updateNum).assertEqual(1);
        let updateResultSet = await rdbStore!.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateResultSet.rowCount).assertEqual(1);
        updateResultSet.goToFirstRow();
        expect(updateResultSet.getString(updateResultSet.getColumnIndex("data1"))).assertEqual("test_data_004_update");
        updateResultSet.close();
        let deletePredicates = new relationalStore.RdbPredicates(TABLE_NAME);
        let deleteNum = await rdbStore!.delete(deletePredicates);
        expect(deleteNum).assertEqual(1);
        let deleteResultSet = await rdbStore!.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteResultSet.rowCount).assertEqual(0);
        deleteResultSet.close();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(TAG + `testDumpStackOnFileDeletion0004 failed, code:${e.code}, message:${e.message}.`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0004 end   *************");
    })
  })
}
