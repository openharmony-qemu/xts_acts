/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = "[RDB_DUMP_STACK_ON_FILE_DELETION_TEST]";
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const STORE_NAME = "dump_stack_on_file_deletion.db";
const TABLE_NAME = "dump_stack_file_deletion_test";
const CREATE_TABLE_SQL = 'CREATE TABLE IF NOT EXISTS dump_stack_file_deletion_test ' +
  '(id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER)';
let rdbStore: relationalStore.RdbStore | undefined;

export default function dumpStackOnFileDeletionTest() {
  describe('rdbDumpStackOnFileDeletionTest', function () {
    beforeAll(async function () {
      console.info(TAG + 'beforeAll');
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
      console.info(TAG + 'afterEach');
      if (rdbStore != undefined) {
        await rdbStore.close();
      }
      rdbStore = undefined;
      await relationalStore.deleteRdbStore(context, STORE_NAME);
    })

    afterAll(function () {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name testDumpStackOnFileDeletion0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_0100
     * @tc.desc open rdb store with dumpStackOnFileDeletion set to true succeeds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDumpStackOnFileDeletion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testDumpStackOnFileDeletion0001 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: true
        };
        expect(storeConfig.dumpStackOnFileDeletion).assertTrue();
        rdbStore = await relationalStore.getRdbStore(context, storeConfig);
        expect(rdbStore !== null && rdbStore !== undefined).assertTrue();
        await rdbStore.executeSql(CREATE_TABLE_SQL);
      } catch (err) {
        console.log(TAG + `failed, errcode:${JSON.stringify(err)}.`);
        expect().assertFail()
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0001 end   *************");
    })

    /**
     * @tc.name testDumpStackOnFileDeletion0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_0200
     * @tc.desc open rdb store with dumpStackOnFileDeletion set to false succeeds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDumpStackOnFileDeletion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testDumpStackOnFileDeletion0002 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: false
        };
        expect(storeConfig.dumpStackOnFileDeletion).assertFalse();
        rdbStore = await relationalStore.getRdbStore(context, storeConfig);
        expect(rdbStore !== null && rdbStore !== undefined).assertTrue();
        await rdbStore.executeSql(CREATE_TABLE_SQL);
      } catch (err) {
        console.log(TAG + `failed, errcode:${JSON.stringify(err)}.`);
        expect().assertFail()
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0002 end   *************");
    })

    /**
     * @tc.name testDumpStackOnFileDeletion0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_0300
     * @tc.desc open rdb store without passing dumpStackOnFileDeletion (default false),
     *           create table and CRUD operations succeed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDumpStackOnFileDeletion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testDumpStackOnFileDeletion0003 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1
        };
        rdbStore = await relationalStore.getRdbStore(context, storeConfig);
        expect(rdbStore !== null && rdbStore !== undefined).assertTrue();
        await rdbStore.executeSql(CREATE_TABLE_SQL);
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'test_data_003',
          'data2': 100
        };
        let rowId = await rdbStore.insert(TABLE_NAME, valueBucket);
        expect(rowId > 0).assertTrue();
        let queryResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(queryResultSet.rowCount).assertEqual(1);
        expect(queryResultSet.goToNextRow()).assertTrue();
        expect(queryResultSet.getString(queryResultSet.getColumnIndex('data1'))).assertEqual('test_data_003');
        expect(queryResultSet.getLong(queryResultSet.getColumnIndex('data2'))).assertEqual(100);
        queryResultSet.close();
        const updateBucket: relationalStore.ValuesBucket = {
          'data1': 'test_data_003_update',
          'data2': 300
        };
        let updateRows = await rdbStore.update(updateBucket, new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateRows).assertEqual(1);
        let updateResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateResultSet.rowCount).assertEqual(1);
        expect(updateResultSet.goToNextRow()).assertTrue();
        expect(updateResultSet.getString(updateResultSet.getColumnIndex('data1'))).assertEqual('test_data_003_update');
        expect(updateResultSet.getLong(updateResultSet.getColumnIndex('data2'))).assertEqual(300);
        updateResultSet.close();
        let deleteRows = await rdbStore.delete(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteRows).assertEqual(1);
        let deleteResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteResultSet.rowCount).assertEqual(0);
        deleteResultSet.close();
      } catch (err) {
        console.log(TAG + `failed, errcode:${JSON.stringify(err)}.`);
        expect().assertFail()
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0003 end   *************");
    })

    /**
     * @tc.name testDumpStackOnFileDeletion0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DumpStackOnFileDeletion_0400
     * @tc.desc open rdb store with dumpStackOnFileDeletion set to undefined,
     *           create table and CRUD operations succeed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDumpStackOnFileDeletion0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info(TAG + "************* testDumpStackOnFileDeletion0004 start *************");
      try {
        let storeConfig: relationalStore.StoreConfig = {
          name: STORE_NAME,
          securityLevel: relationalStore.SecurityLevel.S1,
          dumpStackOnFileDeletion: undefined
        };
        rdbStore = await relationalStore.getRdbStore(context, storeConfig);
        expect(rdbStore !== null && rdbStore !== undefined).assertTrue();
        await rdbStore.executeSql(CREATE_TABLE_SQL);
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'test_data_004',
          'data2': 200
        };
        let rowId = await rdbStore.insert(TABLE_NAME, valueBucket);
        expect(rowId > 0).assertTrue();
        let queryResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(queryResultSet.rowCount).assertEqual(1);
        expect(queryResultSet.goToNextRow()).assertTrue();
        expect(queryResultSet.getString(queryResultSet.getColumnIndex('data1'))).assertEqual('test_data_004');
        expect(queryResultSet.getLong(queryResultSet.getColumnIndex('data2'))).assertEqual(200);
        queryResultSet.close();
        const updateBucket: relationalStore.ValuesBucket = {
          'data1': 'test_data_004_update',
          'data2': 400
        };
        let updateRows = await rdbStore.update(updateBucket, new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateRows).assertEqual(1);
        let updateResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(updateResultSet.rowCount).assertEqual(1);
        expect(updateResultSet.goToNextRow()).assertTrue();
        expect(updateResultSet.getString(updateResultSet.getColumnIndex('data1'))).assertEqual('test_data_004_update');
        expect(updateResultSet.getLong(updateResultSet.getColumnIndex('data2'))).assertEqual(400);
        updateResultSet.close();
        let deleteRows = await rdbStore.delete(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteRows).assertEqual(1);
        let deleteResultSet = await rdbStore.query(new relationalStore.RdbPredicates(TABLE_NAME));
        expect(deleteResultSet.rowCount).assertEqual(0);
        deleteResultSet.close();
      } catch (err) {
        console.log(TAG + `failed, errcode:${JSON.stringify(err)}.`);
        expect().assertFail()
      }
      console.info(TAG + "************* testDumpStackOnFileDeletion0004 end   *************");
    })
  })
}
