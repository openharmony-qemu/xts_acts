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
import data_rdb from "@ohos.data.rdb";
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[ttt]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " +
  "age INTEGER, " +
  "salary REAL, " +
  "blobType BLOB)";

const STORE_CONFIG: data_rdb.StoreConfig = {
  name: "RdbSyncModeBoundaryTest.db",
};

let rdbStore: data_rdb.RdbStore;
let u8 = new Uint8Array([1, 2, 3]);
const DEFAULT_VALUES: data_rdb.ValuesBucket = {
  "name": "zhangsan",
  "age": 18,
  "salary": 100.5,
  "blobType": u8,
};


export default function rdbSyncModeBoundaryTest() {
  describe("rdbSyncModeBoundaryTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      rdbStore = await data_rdb.getRdbStore(context, STORE_CONFIG, 1);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await rdbStore.executeSql("DELETE FROM test");
      await rdbStore.insert("test", DEFAULT_VALUES);
      console.info(TAG + "beforeEach");
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      await data_rdb.deleteRdbStore(context, "RdbSyncModeBoundaryTest.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    // ==================== RdbStore.sync(mode: SyncMode, predicates: RdbPredicates): Promise<Array<[string, number]>> ====================
    // SyncMode enum valid values: SYNC_MODE_PUSH(0), SYNC_MODE_PULL(1), SYNC_MODE_TIME_FIRST(2)
    // Boundary coverage: null, undefined, out-of-range enum values

    /**
     * @tc.name   testRdbSyncModeNull
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncModeNull_0100
     * @tc.desc   RdbStore sync with mode:null expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbSyncModeNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testRdbSyncModeNull start-----");
      const predicates = new data_rdb.RdbPredicates("test");
      predicates.inDevices(["12345678abcd"]);
      try {
        await rdbStore!.sync(null, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `sync mode=null, code:${error.code}, message: ${error.message}`);
        expect(error.message).assertEqual("async error.");
        done();
      }
      console.info(TAG + "----- testRdbSyncModeNull end-----");
    })

    /**
     * @tc.name   testRdbSyncModeUndefined
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncModeUndefined_0200
     * @tc.desc   RdbStore sync with mode:undefined expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbSyncModeUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testRdbSyncModeUndefined start-----");
      const predicates = new data_rdb.RdbPredicates("test");
      predicates.inDevices(["12345678abcd"]);
      try {
        await rdbStore!.sync(undefined, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `sync mode=undefined, code:${error.code}, message: ${error.message}`);
        expect(error.message).assertEqual("async error.");
        done();
      }
      console.info(TAG + "----- testRdbSyncModeUndefined end-----");
    })

    /**
     * @tc.name   testRdbSyncModeNegativeOne
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncModeNegOne_0300
     * @tc.desc   RdbStore sync with mode:-1 (out-of-range SyncMode, below min) expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbSyncModeNegativeOne", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testRdbSyncModeNegativeOne start-----");
      const predicates = new data_rdb.RdbPredicates("test");
      predicates.inDevices(["12345678abcd"]);
      try {
        await rdbStore!.sync(-1 as data_rdb.SyncMode, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `sync mode=-1, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testRdbSyncModeNegativeOne end-----");
    })

    /**
     * @tc.name   testRdbSyncModeMaxInt
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncModeMaxInt_0400
     * @tc.desc   RdbStore sync with mode:2147483647 (out-of-range SyncMode, above max) expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbSyncModeMaxInt", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "----- testRdbSyncModeMaxInt start-----");
      const predicates = new data_rdb.RdbPredicates("test");
      predicates.inDevices(["12345678abcd"]);
      try {
        await rdbStore!.sync(2147483647 as data_rdb.SyncMode, predicates);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(TAG + `sync mode=2147483647, code:${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual("401");
        done();
      }
      console.info(TAG + "----- testRdbSyncModeMaxInt end-----");
    })


    /**
     * @tc.name   testRdbSyncModeValidTimeFirst
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncModeValidTimeFirst_1200
     * @tc.desc   predicates equalTo normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbSyncModeValidTimeFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* testRdbSyncModeValidTimeFirst start *************");
      let predicates = await new data_rdb.RdbPredicates("AllDataType");
      {
        predicates.equalTo("booleanValue", true as data_rdb.ValueType);
        let result : data_rdb.ResultSet | null = null;
        result = await rdbStore.query(predicates);
        expect(result).assertInstanceOf("Object");
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbSyncModeValidTimeFirst end   *************");
    })

  })
}