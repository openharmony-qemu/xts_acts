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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_relationalStore from "@ohos.data.relationalStore";
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { sendableRelationalStore } from '@kit.ArkData';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStoreCoverageTest]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "CoverageTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
};

let rdbStore: data_relationalStore.RdbStore | undefined
let u8 = new Uint8Array([1, 2, 3]);
const DEFAULT_VALUES: data_relationalStore.ValuesBucket = {
  "name": "zhangsan",
  "age": 18,
  "salary": 100.5,
  "blobType": u8,
};

export default function relationalStoreCoverageTest() {
  describe("relationalStoreCoverageTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      console.info(TAG + 'Get context successful. context=' + context);
    });
    beforeEach(async () => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await rdbStore.executeSql("DELETE FROM test");
      console.info(TAG + "beforeEach");
    });
    afterEach(async () => {
      console.info(TAG + "afterEach");
      await data_relationalStore.deleteRdbStore(context, "CoverageTest.db");
    });
    afterAll(async () => {
      console.info(TAG + "afterAll");
    });
    // ==================== RdbStore.batchInsertWithConflictResolution ====================
    /**
     * @tc.name   testBatchInsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolution_0100
     * @tc.desc   RdbStore batchInsertWithConflictResolution with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testBatchInsertWithConflictResolution0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testBatchInsertWithConflictResolution0100 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.batchInsertWithConflictResolution("test", [valueBucket], null);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertWithConflictResolution null conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testBatchInsertWithConflictResolution0100 end-----");
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolution0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolution_0200
     * @tc.desc   RdbStore batchInsertWithConflictResolution with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testBatchInsertWithConflictResolution0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testBatchInsertWithConflictResolution0200 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.batchInsertWithConflictResolution("test", [valueBucket], undefined);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertWithConflictResolution undefined conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testBatchInsertWithConflictResolution0200 end-----");
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolution0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolution_0300
     * @tc.desc   RdbStore batchInsertWithConflictResolution with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testBatchInsertWithConflictResolution0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testBatchInsertWithConflictResolution0300 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.batchInsertWithConflictResolution("test", [valueBucket], 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertWithConflictResolution invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testBatchInsertWithConflictResolution0300 end-----");
    })

    // ==================== Transaction.batchInsertWithConflictResolution ====================
    /**
     * @tc.name   testTransBatchInsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolution_0100
     * @tc.desc   Transaction batchInsertWithConflictResolution with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.batchInsertWithConflictResolution("test", [valueBucket], null);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsert null conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0100 end-----")
    })

    /**
     * @tc.name   testTransBatchInsertWithConflictResolution0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolution_0200
     * @tc.desc   Transaction batchInsertWithConflictResolution with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolution0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.batchInsertWithConflictResolution("test", [valueBucket], undefined);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsert undefined conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0200 end-----")
    })

    /**
     * @tc.name   testTransBatchInsertWithConflictResolution0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolution_0300
     * @tc.desc   Transaction batchInsertWithConflictResolution with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolution0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.batchInsertWithConflictResolution("test", [valueBucket], 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsertWithConflictResolution invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolution0300 end-----")
    })

    // ==================== RdbStore.batchInsertWithConflictResolutionSync ====================
    /**
     * @tc.name   testBatchInsertWithConflictResolutionSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSync_0100
     * @tc.desc   RdbStore batchInsertWithConflictResolutionSync with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.batchInsertWithConflictResolutionSync("test", [valueBucket], null);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertSync null conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0100 end-----")
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSync_0200
     * @tc.desc   RdbStore batchInsertWithConflictResolutionSync with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.batchInsertWithConflictResolutionSync("test", [valueBucket], undefined);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertSync undefined conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0200 end-----")
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSync_0300
     * @tc.desc   RdbStore batchInsertWithConflictResolutionSync with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.batchInsertWithConflictResolutionSync("test", [valueBucket], 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `batchInsertWithConflictResolutionSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testBatchInsertWithConflictResolutionSync0300 end-----")
    })

    // ==================== Transaction.batchInsertWithConflictResolutionSync ====================
    /**
     * @tc.name   testTransBatchInsertWithConflictResolutionSync0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolutionSync_0100
     * @tc.desc   Transaction batchInsertWithConflictResolutionSync with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolutionSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.batchInsertWithConflictResolutionSync("test", [valueBucket], null);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsertWithConflictResolutionSync null conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0100 end-----")
    })

    /**
     * @tc.name   testTransBatchInsertWithConflictResolutionSync0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolutionSync_0200
     * @tc.desc   Transaction batchInsertWithConflictResolutionSync with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolutionSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.batchInsertWithConflictResolutionSync("test", [valueBucket], undefined);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsertWithConflictResolutionSync undefined conflict, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0200 end-----")
    })

    /**
     * @tc.name   testTransBatchInsertWithConflictResolutionSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransBatchInsertWithConflictResolutionSync_0300
     * @tc.desc   Transaction batchInsertWithConflictResolutionSync with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransBatchInsertWithConflictResolutionSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.batchInsertWithConflictResolutionSync("test", [valueBucket], 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans batchInsertWithConflictResolutionSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransBatchInsertWithConflictResolutionSync0300 end-----")
    })

    // ==================== RdbStore.insert callback ====================
    /**
     * @tc.name   testInsertConflictCallback0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictCallback_0100
     * @tc.desc   RdbStore insert callback with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictCallback0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictCallback0100 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insert("test", valueBucket, null, (err: BusinessError, rowId: number) => {
          expect(rowId).assertEqual(1);
          console.info(TAG + `insert callback success, rowId: ${rowId}`);
          done();
        });
      } catch (err) {
        console.error(TAG + `insert null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testInsertConflictCallback0100 end-----");
    })

    /**
     * @tc.name   testInsertConflictCallback0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictCallback_0200
     * @tc.desc   RdbStore insert callback with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictCallback0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictCallback0200 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insert("test", valueBucket, undefined, (err: BusinessError, rowId: number) => {
          expect(rowId).assertEqual(1);
          console.info(TAG + `insert callback success, rowId: ${rowId}`);
          done();
        });
      } catch (err) {
        console.error(TAG + `insert undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testInsertConflictCallback0200 end-----");
    })

    /**
     * @tc.name   testInsertConflictCallback0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictCallback_0300
     * @tc.desc   RdbStore insert callback with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictCallback0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictCallback0300 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insert("test", valueBucket, 999 as data_relationalStore.ConflictResolution, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(TAG + `insert callback invalid enum, code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual("401");
            done();
            return;
          }
          expect().assertFail();
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `insert callback invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testInsertConflictCallback0300 end-----");
    })

    // ==================== RdbStore.insert promise ====================
    /**
     * @tc.name   testInsertConflictPromise0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictPromise_0100
     * @tc.desc   RdbStore insert promise with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictPromise0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictPromise0100 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.insert("test", valueBucket, null);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `insert promise query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insert promise null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testInsertConflictPromise0100 end-----");
    })

    /**
     * @tc.name   testInsertConflictPromise0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictPromise_0200
     * @tc.desc   RdbStore insert promise with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictPromise0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictPromise0200 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.insert("test", valueBucket, undefined);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `insert promise query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insert promise undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testInsertConflictPromise0200 end-----");
    })

    /**
     * @tc.name   testInsertConflictPromise0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertConflictPromise_0300
     * @tc.desc   RdbStore insert promise with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertConflictPromise0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testInsertConflictPromise0300 start-----");
      const valueBucket = DEFAULT_VALUES;
      try {
        await rdbStore!.insert("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `insert promise invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testInsertConflictPromise0300 end-----");
    })

    // ==================== Transaction.insert ====================
    /**
     * @tc.name   testTransInsertConflict0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsert_0100
     * @tc.desc   Transaction insert with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertConflict0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertConflict0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.insert("test", valueBucket, null);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `trans insert query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans insert null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testTransInsertConflict0100 end-----")
    })

    /**
     * @tc.name   testTransInsertConflict0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsert_0200
     * @tc.desc   Transaction insert with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertConflict0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertConflict0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.insert("test", valueBucket, undefined);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `trans insert undefined query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans insert undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testTransInsertConflict0200 end-----")
    })

    /**
     * @tc.name   testTransInsertConflict0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsert_0300
     * @tc.desc   Transaction insert with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertConflict0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertConflict0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.insert("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans insert invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransInsertConflict0300 end-----")
    })

    // ==================== RdbStore.insertSync ====================
    /**
     * @tc.name   testInsertSyncConflict0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0100
     * @tc.desc   RdbStore insertSync with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncConflict0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncConflict0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insertSync("test", valueBucket, null);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `insertSync query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insertSync null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testInsertSyncConflict0100 end-----")
    })

    /**
     * @tc.name   testInsertSyncConflict0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0200
     * @tc.desc   RdbStore insertSync with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncConflict0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncConflict0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insertSync("test", valueBucket, undefined);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `insertSync query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insertSync undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testInsertSyncConflict0200 end-----")
    })

    /**
     * @tc.name   testInsertSyncConflict0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0300
     * @tc.desc   RdbStore insertSync with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncConflict0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncConflict0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        rdbStore!.insertSync("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `insertSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testInsertSyncConflict0300 end-----")
    })

    // ==================== RdbStore.insertSync SendableValuesBucket ====================
    /**
     * @tc.name   testInsertSyncSendableConflict0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0400
     * @tc.desc   RdbStore insertSync with SendableValuesBucket conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncSendableConflict0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncSendableConflict0400 start-----")
      const valueBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket({
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": new Uint8Array([1, 2, 3]),
      });
      try {
        rdbStore!.insertSync("test", valueBucket, null);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        expect(resultSet.getLong(2)).assertEqual(18);
        expect(resultSet.getDouble(3)).assertEqual(100.5);
        console.info(TAG + `insertSync null conflict query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insertSync null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testInsertSyncSendableConflict0400 end-----")
    })

    /**
     * @tc.name   testInsertSyncSendableConflict0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0500
     * @tc.desc   RdbStore insertSync with SendableValuesBucket conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncSendableConflict0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncSendableConflict0500 start-----")
      const valueBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket({
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": new Uint8Array([1, 2, 3]),
      });
      try {
        rdbStore!.insertSync("test", valueBucket, undefined);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        expect(resultSet.getLong(2)).assertEqual(18);
        expect(resultSet.getDouble(3)).assertEqual(100.5);
        console.info(TAG + `insertSync undefined conflict query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `insertSync undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testInsertSyncSendableConflict0500 end-----")
    })

    /**
     * @tc.name   testInsertSyncSendableConflict0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSync_0600
     * @tc.desc   RdbStore insertSync with SendableValuesBucket conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInsertSyncSendableConflict0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testInsertSyncSendableConflict0600 start-----")
      const valueBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket({
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": new Uint8Array([1, 2, 3]),
      });
      try {
        rdbStore!.insertSync("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `insertSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testInsertSyncSendableConflict0600 end-----")
    })

    // ==================== Transaction.insertSync ====================
    /**
     * @tc.name   testTransInsertSyncConflict0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsertSync_0100
     * @tc.desc   Transaction insertSync with conflictResolution:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertSyncConflict0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertSyncConflict0100 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.insertSync("test", valueBucket, null);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `trans insertSync query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans insertSync null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testTransInsertSyncConflict0100 end-----")
    })

    /**
     * @tc.name   testTransInsertSyncConflict0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsertSync_0200
     * @tc.desc   Transaction insertSync with conflictResolution:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertSyncConflict0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertSyncConflict0200 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.insertSync("test", valueBucket, undefined);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `trans insertSync undefined query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans insertSync undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "-----testTransInsertSyncConflict0200 end-----")
    })

    /**
     * @tc.name   testTransInsertSyncConflict0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransInsertSync_0300
     * @tc.desc   Transaction insertSync with conflictResolution:999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransInsertSyncConflict0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "-----testTransInsertSyncConflict0300 start-----")
      const valueBucket = DEFAULT_VALUES;
      try {
        const transaction = await rdbStore!.createTransaction();
        transaction.insertSync("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans insertSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "-----testTransInsertSyncConflict0300 end-----")
    })

    // ==================== RdbStore.update callback ====================
    /**
     * @tc.name   testUpdateConflictCallbackNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictCallback_0100
     * @tc.desc   Test update callback with conflictResolution null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictCallbackNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictCallbackNull start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        rdbStore!.update(updateValueBucket, predicates, null, async (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(TAG + `update callback null conflict err: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          const resultSet = await rdbStore!.querySql("SELECT * FROM test");
          expect(resultSet.goToFirstRow()).assertTrue();
          expect(resultSet.getString(1)).assertEqual("lisi");
          expect(resultSet.getLong(2)).assertEqual(20);
          expect(resultSet.getDouble(3)).assertEqual(200.5);
          console.info(TAG + `update callback null conflict query success, name: ${resultSet.getString(1)}`);
          resultSet.close();
          done();
        });
      } catch (err) {
        console.error(TAG + `update callback null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateConflictCallbackNull end-----");
    })
    /**
     * @tc.name   testUpdateConflictCallbackUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictCallback_0200
     * @tc.desc   Test update callback with conflictResolution undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictCallbackUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictCallbackUndefined start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        rdbStore!.update(updateValueBucket, predicates, undefined, async (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(TAG + `update callback undefined conflict err: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          const resultSet = await rdbStore!.querySql("SELECT * FROM test");
          expect(resultSet.goToFirstRow()).assertTrue();
          expect(resultSet.getString(1)).assertEqual("lisi");
          expect(resultSet.getLong(2)).assertEqual(20);
          expect(resultSet.getDouble(3)).assertEqual(200.5);
          console.info(TAG + `update callback undefined conflict query success, name: ${resultSet.getString(1)}`);
          resultSet.close();
          done();
        });
      } catch (err) {
        console.error(TAG + `update callback undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateConflictCallbackUndefined end-----");
    })
    /**
     * @tc.name   testUpdateConflictCallback999
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictCallback_0300
     * @tc.desc   Test update callback with conflictResolution 999 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictCallback999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictCallback999 start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        rdbStore!.update(updateValueBucket, predicates, 999 as data_relationalStore.ConflictResolution, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(TAG + `update callback invalid enum, code:${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual("401");
            done();
            return;
          }
          expect().assertFail();
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `update callback invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testUpdateConflictCallback999 end-----");
    })

    // ==================== RdbStore.update promise ====================
    /**
     * @tc.name   testUpdateConflictPromiseNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictPromise_0100
     * @tc.desc   Test update promise with conflictResolution null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictPromiseNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictPromiseNull start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        await rdbStore!.update(updateValueBucket, predicates, null);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        expect(resultSet.getLong(2)).assertEqual(20);
        expect(resultSet.getDouble(3)).assertEqual(200.5);
        console.info(TAG + `update promise null conflict query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `update promise null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateConflictPromiseNull end-----");
    })
    /**
     * @tc.name   testUpdateConflictPromiseUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictPromise_0200
     * @tc.desc   Test update promise with conflictResolution undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictPromiseUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictPromiseUndefined start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        await rdbStore!.update(updateValueBucket, predicates, undefined);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        expect(resultSet.getLong(2)).assertEqual(20);
        expect(resultSet.getDouble(3)).assertEqual(200.5);
        console.info(TAG + `update promise undefined conflict query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `update promise undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateConflictPromiseUndefined end-----");
    })
    /**
     * @tc.name   testUpdateConflictPromise999
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateConflictPromise_0300
     * @tc.desc   Test update promise with conflictResolution 999 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateConflictPromise999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateConflictPromise999 start-----");
      const insertBucket = DEFAULT_VALUES;
      await rdbStore!.insert("test", insertBucket);
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      try {
        await rdbStore!.update(updateValueBucket, predicates, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `update promise invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testUpdateConflictPromise999 end-----");
    })

    // ==================== Transaction.update ====================
    /**
     * @tc.name   testTransUpdateConflictNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdate_0100
     * @tc.desc   Test Transaction.update with conflictResolution null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateConflictNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateConflictNull start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        await transaction.update(updateValueBucket, predicates, null);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `trans update query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans update null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testTransUpdateConflictNull end-----");
    })
    /**
     * @tc.name   testTransUpdateConflictUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdate_0200
     * @tc.desc   Test Transaction.update with conflictResolution undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateConflictUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateConflictUndefined start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        await transaction.update(updateValueBucket, predicates, undefined);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `trans update undefined query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans update undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testTransUpdateConflictUndefined end-----");
    })
    /**
     * @tc.name   testTransUpdateConflict999
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdate_0300
     * @tc.desc   Test Transaction.update with conflictResolution 999 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateConflict999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateConflict999 start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        await transaction.update(updateValueBucket, predicates, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans update invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testTransUpdateConflict999 end-----");
    })

    // ==================== RdbStore.updateSync ====================
    /**
     * @tc.name   testUpdateSyncConflictNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSync_0100
     * @tc.desc   Test updateSync with conflictResolution null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateSyncConflictNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateSyncConflictNull start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      await rdbStore!.insert("test", DEFAULT_VALUES);
      try {
        rdbStore!.updateSync(updateValueBucket, predicates, null);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `updateSync query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `updateSync null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateSyncConflictNull end-----");
    })
    /**
     * @tc.name   testUpdateSyncConflictUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSync_0200
     * @tc.desc   Test updateSync with conflictResolution undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateSyncConflictUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateSyncConflictUndefined start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "zhangsan");
      await rdbStore!.insert("test", DEFAULT_VALUES);
      try {
        rdbStore!.updateSync(updateValueBucket, predicates, undefined);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `updateSync undefined query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `updateSync undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testUpdateSyncConflictUndefined end-----");
    })
    /**
     * @tc.name   testUpdateSyncConflict999
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSync_0300
     * @tc.desc   Test updateSync with conflictResolution 999 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateSyncConflict999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testUpdateSyncConflict999 start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        rdbStore!.updateSync(updateValueBucket, predicates, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `updateSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testUpdateSyncConflict999 end-----");
    })

    // ==================== Transaction.updateSync ====================
    /**
     * @tc.name   testTransUpdateSyncConflictNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdateSync_0100
     * @tc.desc   Test Transaction.updateSync with conflictResolution null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateSyncConflictNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateSyncConflictNull start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        transaction.updateSync(updateValueBucket, predicates, null);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `trans updateSync query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans updateSync null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testTransUpdateSyncConflictNull end-----");
    })
    /**
     * @tc.name   testTransUpdateSyncConflictUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdateSync_0200
     * @tc.desc   Test Transaction.updateSync with conflictResolution undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateSyncConflictUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateSyncConflictUndefined start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        transaction.updateSync(updateValueBucket, predicates, undefined);
        await transaction.commit();
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("lisi");
        console.info(TAG + `trans updateSync undefined query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `trans updateSync undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- testTransUpdateSyncConflictUndefined end-----");
    })
    /**
     * @tc.name   testTransUpdateSyncConflict999
     * @tc.number SUB_DistributedData_RelationalStore_SDK_TransUpdateSync_0300
     * @tc.desc   Test Transaction.updateSync with conflictResolution 999 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTransUpdateSyncConflict999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testTransUpdateSyncConflict999 start-----");
      const updateValueBucket: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 200.5,
        "blobType": u8,
      };
      let predicates = new data_relationalStore.RdbPredicates("test");
      try {
        await rdbStore!.insert("test", DEFAULT_VALUES);
        const transaction = await rdbStore!.createTransaction();
        transaction.updateSync(updateValueBucket, predicates, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `trans updateSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testTransUpdateSyncConflict999 end-----");
    })

    // ==================== RdbStore.cloudSync ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_CloudSync_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSync_0100
     * @tc.desc   Test cloudSync with mode:null expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_CloudSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0100 start-----");
      let progressCallback = (progress: data_relationalStore.ProgressDetails) => {
        console.info(TAG + 'cloudSync progress: ' + JSON.stringify(progress));
      };
      try {
        rdbStore!.cloudSync(null, progressCallback);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `cloudSync null mode, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_CloudSync_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSync_0200
     * @tc.desc   Test cloudSync with mode:undefined expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_CloudSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0200 start-----");
      let progressCallback = (progress: data_relationalStore.ProgressDetails) => {
        console.info(TAG + 'cloudSync progress: ' + JSON.stringify(progress));
      };
      try {
        rdbStore!.cloudSync(undefined, progressCallback);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `cloudSync undefined mode, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0200 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_CloudSync_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CloudSync_0300
     * @tc.desc   Test cloudSync with mode:999(out-of-range SyncMode) expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_CloudSync_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0300 start-----");
      let progressCallback = (progress: data_relationalStore.ProgressDetails) => {
        console.info(TAG + 'cloudSync progress: ' + JSON.stringify(progress));
      };
      try {
        rdbStore!.cloudSync(999 as data_relationalStore.SyncMode, progressCallback);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `cloudSync invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CloudSync_0300 end-----");
    })

    // ==================== RdbStore.createTransaction ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100
     * @tc.desc   Test createTransaction with options:TransactionOptions{transactionType:999(out-of-range TransactionType)} expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100 start-----");
      try {
        let invalidOptions: data_relationalStore.TransactionOptions = {
          transactionType: 999 as data_relationalStore.TransactionType
        };
        await rdbStore!.createTransaction(invalidOptions);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `createTransaction invalid transactionType, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0200
     * @tc.desc   Test createTransaction with no parameters (default option) expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0200 start-----");
      try {
        let transaction = await rdbStore!.createTransaction();
        expect(transaction).not().assertEqual(null);
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `createTransaction no options, code:${error.code}, message: ${error.message}`);
      }
      done();
      console.info(TAG + "-----SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0200 end-----");
    })

    // ==================== data_relationalStore.getInsertSqlInfo ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0100
     * @tc.desc   Test getInsertSqlInfo with conflictResolution:null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0100 start-----");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      try {
        let sqlInfo = data_relationalStore.getInsertSqlInfo("test", valueBucket, null);
        console.info(TAG + `getInsertSqlInfo args[0]: ${sqlInfo.args[0]}`);
        expect(sqlInfo.args[0]).assertEqual(20);
        done();
      } catch (err) {
        console.error(TAG + `getInsertSqlInfo null conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0200
     * @tc.desc   Test getInsertSqlInfo with conflictResolution:undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0200 start-----");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      try {
        let sqlInfo = data_relationalStore.getInsertSqlInfo("test", valueBucket, undefined);
        console.info(TAG + `getInsertSqlInfo args[0]: ${sqlInfo.args[0]}`);
        expect(sqlInfo.args[0]).assertEqual(20);
        done();
      } catch (err) {
        console.error(TAG + `getInsertSqlInfo undefined conflict failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0200 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0300
     * @tc.desc   Test getInsertSqlInfo with conflictResolution:999(out-of-range ConflictResolution) expect 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0300 start-----");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      try {
        data_relationalStore.getInsertSqlInfo("test", valueBucket, 999 as data_relationalStore.ConflictResolution);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `getInsertSqlInfo invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_GetInsertSqlInfo_0300 end-----");
    })

    // ==================== data_relationalStore.isTokenizerSupported ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0100
     * @tc.desc   Test isTokenizerSupported with tokenizer:undefined expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0100 start-----");
      try {
        data_relationalStore.isTokenizerSupported(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `isTokenizerSupported undefined, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0200
     * @tc.desc   Test isTokenizerSupported with tokenizer:999(out-of-range Tokenizer) expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0200 start-----");
      try {
        data_relationalStore.isTokenizerSupported(999 as data_relationalStore.Tokenizer);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `isTokenizerSupported invalid enum, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0200 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0300
     * @tc.desc   Test isTokenizerSupported with tokenizer:null expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0300 start-----");
      try {
        data_relationalStore.isTokenizerSupported(null);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `isTokenizerSupported null, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_IsTokenizerSupported_0300 end-----");
    })

    // ==================== RdbStore.rekey ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_Rekey_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_0100
     * @tc.desc   Test rekey with cryptoParam encryptionAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_Rekey_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0100 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: -1 as data_relationalStore.EncryptionAlgo,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      }
      try {
        await rdbStore!.rekey(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid encryptionAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_Rekey_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_0200
     * @tc.desc   Test rekey with cryptoParam hmacAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_Rekey_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0200 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: -1 as data_relationalStore.HmacAlgo,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      }
      try {
        await rdbStore!.rekey(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid hmacAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0200 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_Rekey_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_0300
     * @tc.desc   Test rekey with cryptoParam kdfAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_Rekey_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0300 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: -1 as data_relationalStore.KdfAlgo,
      }
      try {
        await rdbStore!.rekey(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid kdfAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Rekey_0300 end-----");
    })

    // ==================== RdbStore.rekeyEx ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RekeyEx_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_0100
     * @tc.desc   Test rekeyEx with cryptoParam encryptionAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_RekeyEx_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0100 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: -1 as data_relationalStore.EncryptionAlgo,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      }
      try {
        await rdbStore!.rekeyEx(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid encryptionAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RekeyEx_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_0200
     * @tc.desc   Test rekeyEx with cryptoParam hmacAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_RekeyEx_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0200 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: -1 as data_relationalStore.HmacAlgo,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      }
      try {
        await rdbStore!.rekeyEx(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid hmacAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0200 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_RekeyEx_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_0300
     * @tc.desc   Test rekeyEx with cryptoParam kdfAlgo:-1 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_RekeyEx_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0300 start-----");
      let rekeyCryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([10, 20, 30]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: -1 as data_relationalStore.KdfAlgo,
      }
      try {
        await rdbStore!.rekeyEx(rekeyCryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid kdfAlgo, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_RekeyEx_0300 end-----");
    })

    // ==================== RdbStore.restore ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_Restore_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Restore_0100
     * @tc.desc   Test restore with srcName:null callback expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_Restore_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Restore_0100 start-----");
      try {
        rdbStore!.restore(null, (err: BusinessError) => {
          if (err) {
            console.info(TAG + 'restore null srcName callback err: ' + err.message);
          }
        });
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `restore null srcName, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Restore_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_Restore_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Restore_0200
     * @tc.desc   Test restore with srcName:undefined callback expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_Restore_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Restore_0200 start-----");
      try {
        rdbStore!.restore(undefined, (err: BusinessError) => {
          if (err) {
            console.info(TAG + 'restore undefined srcName callback err: ' + err.message);
          }
        });
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `restore undefined srcName, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_Restore_0200 end-----");
    })

    // ==================== RdbStore.setDistributedTables ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100
     * @tc.desc   Test setDistributedTables with type:null expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 start-----");
      try {
        const valueBucket = DEFAULT_VALUES;
        await rdbStore!.setDistributedTables(["test"], null)
        await rdbStore!.insert("test", valueBucket);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `setDistributedTables insert query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `setDistributedTables null type failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 end-----");
    })
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200
     * @tc.desc   Test setDistributedTables with type:undefined expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 start-----");
      try {
        const valueBucket = DEFAULT_VALUES;
        await rdbStore!.setDistributedTables(["test"], undefined)
        await rdbStore!.insert("test", valueBucket);
        const resultSet = await rdbStore!.querySql("SELECT * FROM test");
        expect(resultSet.goToFirstRow()).assertTrue();
        expect(resultSet.getString(1)).assertEqual("zhangsan");
        console.info(TAG + `setDistributedTables insert query success, name: ${resultSet.getString(1)}`);
        resultSet.close();
        done();
      } catch (err) {
        console.error(TAG + `setDistributedTables undefined type failed`);
        expect().assertFail();
        done();
      }
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 end-----");
    })

    // ==================== Enum Validation ====================
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_AssetStatus_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AssetStatus_0100
     * @tc.desc   Verify AssetStatus enum values - ASSET_UPDATE=3, ASSET_DELETE=4, ASSET_ABNORMAL=5, ASSET_DOWNLOADING=6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_AssetStatus_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_AssetStatus_0100 start-----");
      expect(data_relationalStore.AssetStatus.ASSET_NORMAL).assertEqual(1);
      console.info(TAG + data_relationalStore.AssetStatus.ASSET_NORMAL + data_relationalStore.AssetStatus.ASSET_INSERT)
      expect(data_relationalStore.AssetStatus.ASSET_INSERT).assertEqual(2);
      expect(data_relationalStore.AssetStatus.ASSET_UPDATE).assertEqual(3);
      expect(data_relationalStore.AssetStatus.ASSET_DELETE).assertEqual(4);
      expect(data_relationalStore.AssetStatus.ASSET_ABNORMAL).assertEqual(5);
      expect(data_relationalStore.AssetStatus.ASSET_DOWNLOADING).assertEqual(6);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_AssetStatus_0100 end-----");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DistributedTableType_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DistributedTableType_0100
     * @tc.desc   Verify DistributedTableType enum values - DEVICE_COLLABORATION=0, SINGLE_VERSION=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_DistributedTableType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedTableType_0100 start-----");
      expect(data_relationalStore.DistributedTableType.DEVICE_COLLABORATION).assertEqual(0);
      expect(data_relationalStore.DistributedTableType.SINGLE_VERSION).assertEqual(1);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedTableType_0100 end-----");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DistributedConfigTableType_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DistributedConfigTableType_0100
     * @tc.desc   Verify DistributedConfig.tableType property assignment - DEVICE_COLLABORATION and SINGLE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_DistributedConfigTableType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedConfigTableType_0100 start-----");
      let distributedConfig: data_relationalStore.DistributedConfig = {
        autoSync: false,
        asyncDownloadAsset: false,
        enableCloud: false,
        tableType: data_relationalStore.DistributedTableType.DEVICE_COLLABORATION
      };
      expect(distributedConfig.tableType).assertEqual(data_relationalStore.DistributedTableType.DEVICE_COLLABORATION);
      distributedConfig.tableType = data_relationalStore.DistributedTableType.SINGLE_VERSION;
      expect(distributedConfig.tableType).assertEqual(data_relationalStore.DistributedTableType.SINGLE_VERSION);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedConfigTableType_0100 end-----");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_ChangeType_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ChangeType_0100
     * @tc.desc   Verify ChangeType enum values - DATA_CHANGE=0, ASSET_CHANGE=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_ChangeType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_ChangeType_0100 start-----");
      expect(data_relationalStore.ChangeType.DATA_CHANGE).assertEqual(0);
      expect(data_relationalStore.ChangeType.ASSET_CHANGE).assertEqual(1);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_ChangeType_0100 end-----");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DistributedType_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DistributedType_0100
     * @tc.desc   Verify DistributedType enum values - DISTRIBUTED_CLOUD=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_DistributedType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedType_0100 start-----");
      expect(data_relationalStore.DistributedType.DISTRIBUTED_CLOUD).assertEqual(1);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_DistributedType_0100 end-----");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SubscribeType_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SubscribeType_0100
     * @tc.desc   Verify SubscribeType enum values - SUBSCRIBE_TYPE_REMOTE=0, SUBSCRIBE_TYPE_CLOUD=1, SUBSCRIBE_TYPE_CLOUD_DETAILS=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_SubscribeType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SubscribeType_0100 start-----");
      expect(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE).assertEqual(0);
      expect(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD).assertEqual(1);
      expect(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_CLOUD_DETAILS).assertEqual(2);
      console.info(TAG + "----- SUB_DistributedData_RelationalStore_SDK_SubscribeType_0100 end-----");
    });
    // ==================== 20260817setDistributedTables=====================================================================================================================================
    /**
     * @tc.name   setCloudDistributedTableTest1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100
     * @tc.desc   Test setDistributedTables with null and undefined callback parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('setCloudDistributedTableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* setCloudDistributedTableTest1100 start *************");
      if(rdbStore== undefined) {
        expect(null).assertFail();
      } else {
        try {
          await rdbStore.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
        } catch (e) {
          console.error(`executeSql error, code is ${e.code}, messegeis ${e.message}`);
          expect(null).assertFail();
        }
        try {
          rdbStore.setDistributedTables(["EMPLOYEE"], null, (err) => {
            if(err){
              expect().assertFail();
            }else{
              console.info('setCloudDistributedTables EMPLOYEE successfully');
              try {
                rdbStore!.setDistributedTables(["EMPLOYEE"], undefined, (error: BusinessError) =>{
                  if(error){
                    console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${error.code}, messegeis ${error.message}`);
                    expect().assertFail();
                  }else{
                    console.info('setCloudDistributedTables EMPLOYEE successfully');
                    done();
                  }
                });
              } catch (err) {
                console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
                expect(err.code).assertEqual("401");
              }
            }
          });
        } catch (err) {
          console.error(`setCloudDistributedTables EMPLOYEE failed, code is ${err.code}, messegeis ${err.message}`);
          expect(err.code).assertEqual("401");
        }
      }
      console.log(TAG + "************* setCloudDistributedTableTest1100 end *************");
    })
    // ==================== RdbStore.createTransaction ====================
    /**
     * @tc.name   testCreateTransaction0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CreateTransaction_0100
     * @tc.desc   RdbStore createTransaction with out of range transactionType enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testCreateTransaction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testCreateTransaction0001 start *************");
      try {
        let options: data_relationalStore.TransactionOptions = {
          transactionType: 999 as data_relationalStore.TransactionType
        };
        await rdbStore!.createTransaction(options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `createTransaction invalid enum, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testCreateTransaction0001 end *************");
    });

    // ==================== RdbStore.rekey ====================

    /**
     * @tc.name   testRekeyEncryptionAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_EncryptionAlgo_0100
     * @tc.desc   RdbStore rekey with out of range encryptionAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyEncryptionAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyEncryptionAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          encryptionAlgo: 999 as data_relationalStore.EncryptionAlgo
        };
        await rdbStore!.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid encryptionAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyEncryptionAlgoOutOfRange end *************");
    });

    /**
     * @tc.name   testRekeyHmacAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_HmacAlgo_0100
     * @tc.desc   RdbStore rekey with out of range hmacAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyHmacAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyHmacAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          hmacAlgo: 999 as data_relationalStore.HmacAlgo
        };
        await rdbStore!.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid hmacAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyHmacAlgoOutOfRange end *************");
    });

    /**
     * @tc.name   testRekeyKdfAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Rekey_KdfAlgo_0100
     * @tc.desc   RdbStore rekey with out of range kdfAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyKdfAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyKdfAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          kdfAlgo: 999 as data_relationalStore.KdfAlgo
        };
        await rdbStore!.rekey(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekey invalid kdfAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyKdfAlgoOutOfRange end *************");
    });

    // ==================== RdbStore.rekeyEx ====================

    /**
     * @tc.name   testRekeyExEncryptionAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_EncryptionAlgo_0100
     * @tc.desc   RdbStore rekeyEx with out of range encryptionAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyExEncryptionAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyExEncryptionAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          encryptionAlgo: 999 as data_relationalStore.EncryptionAlgo
        };
        await rdbStore!.rekeyEx(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid encryptionAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyExEncryptionAlgoOutOfRange end *************");
    });

    /**
     * @tc.name   testRekeyExHmacAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_HmacAlgo_0100
     * @tc.desc   RdbStore rekeyEx with out of range hmacAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyExHmacAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyExHmacAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          hmacAlgo: 999 as data_relationalStore.HmacAlgo
        };
        await rdbStore!.rekeyEx(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid hmacAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyExHmacAlgoOutOfRange end *************");
    });

    /**
     * @tc.name   testRekeyExKdfAlgoOutOfRange
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RekeyEx_KdfAlgo_0100
     * @tc.desc   RdbStore rekeyEx with out of range kdfAlgo enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRekeyExKdfAlgoOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRekeyExKdfAlgoOutOfRange start *************");
      try {
        let cryptoParam: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
          kdfAlgo: 999 as data_relationalStore.KdfAlgo
        };
        await rdbStore!.rekeyEx(cryptoParam);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `rekeyEx invalid kdfAlgo, code:${error.code}, message:${error.message}`);
        expect(error.code).assertEqual("14800001");
        done();
      }
      console.info(TAG + "************* testRekeyExKdfAlgoOutOfRange end *************");
    });

  })
}