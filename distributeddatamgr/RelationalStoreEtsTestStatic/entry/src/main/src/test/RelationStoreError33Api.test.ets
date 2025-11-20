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
import {
    describe,
    it,
    expect,
    TestType,
    Size,
    Level,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll
  } from "../../../hypium/index";
  import hilog from '@ohos.hilog'
  import relationalStore from '@ohos.data.relationalStore';
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import { BusinessError } from '@ohos.base';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import Utils from './Util.test';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import common from '@ohos.app.ability.common';
  
  let context: common.UIAbilityContext;
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const TAG = "[ttt]";
  let domain: int  = 0x0000;
  let tag: string = 'testTag';
  const CREATE_TABLE_TEST =
    "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
  const STORE_CONFIG: relationalStore.StoreConfig = {
    name: "rdbStore.db",
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  let rdbStore: relationalStore.RdbStore;
  
  export default function RelationStoreError33Test() {
    describe('RelationStoreError33Test', (): void => {
      beforeAll(async () : Promise<void> => {
        console.info(TAG + "*************Unit Test Begin*************");
        console.info(TAG + 'beforeAll');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
        await Utils.msSleep(2000)
        context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      })
  
      beforeEach(async () : Promise<void> => {
        console.info(TAG + 'beforeEach');
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        console.info(TAG + "create rdb store success")
        await rdbStore.execute(CREATE_TABLE_TEST);
        let u8 = new Uint8Array([3, 4, 5])
        const valueBucket: relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1,
          "data4": u8
        }
        const valueBucket2: relationalStore.ValuesBucket = {
          "name": "Lisa",
          "age": 31 as long,
          "salary": 2000.1,
          "data4": u8
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", valueBucket);
        await (rdbStore as relationalStore.RdbStore).insert("employee", valueBucket2)
      })
  
      afterEach(async () : Promise<void> => {
        console.info(TAG + 'afterEach');
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      })
  
      afterAll(async () : Promise<void> => {
        console.info(TAG + 'afterAll');
        console.info(TAG + "*************Unit Test end*************");
      })
  
      /**
       * @tc.name relationalStoreTest001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
       * @tc.desc relationalStoreTest001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          rdbStore.insertSync("employee", valueBucket);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest001 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest001 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest011
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0101
       * @tc.desc relationalStoreTest011
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest011 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          rdbStore.insertSync("employee", valueBucket);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest011 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
        console.info(TAG + "************* relationalStoreTest011 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0200
       * @tc.desc relationalStoreTest002
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest002 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          rdbStore.insertSync("employee", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest002 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest001 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest035
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0300
       * @tc.desc relationalStoreTest035
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest035 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          await rdbStore.insert("employee", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest035 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest035 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest135
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0301
       * @tc.desc relationalStoreTest135
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest135 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          await rdbStore.insert("employee", valueBucket);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest135 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
        console.info(TAG + "************* relationalStoreTest135 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest036
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0400
       * @tc.desc relationalStoreTest036
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest036 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        try {
          await rdbStore.insert("employee", valueBucket);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest036 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest036 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest003
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0500
       * @tc.desc relationalStoreTest003
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest003 start *************");
        let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        values.push(valueBucket)
        try {
          rdbStore.batchInsertSync("employee", values);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "batchInsertSync fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        try {
          await rdbStore.batchInsert("employee", values);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "batchInsert fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest003 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest004
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0600
       * @tc.desc relationalStoreTest004
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest004 start *************");
        let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        const valueBucket: relationalStore.ValuesBucket = {
          "age": "30",
          "salary": 2000.1
        }
        values.push(valueBucket)
        try {
          await rdbStore.batchInsert("employee", values);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "batchInsert fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        try {
          rdbStore.batchInsertSync("employee", values);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "batchInsertSync fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
        console.info(TAG + "************* relationalStoreTest004 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest006
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0700
       * @tc.desc update success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest006 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          rdbStore.updateSync(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest006 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest006 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest016
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0701
       * @tc.desc update success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest016 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "name": null,
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          rdbStore.updateSync(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest016 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
        console.info(TAG + "************* relationalStoreTest016 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest007
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0800
       * @tc.desc update success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest007 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.update(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest007 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest007 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest017
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0801
       * @tc.desc update success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest017 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "name": null,
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.update(valueBucket, predicates);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest017 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
        console.info(TAG + "************* relationalStoreTest017 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest008
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0900
       * @tc.desc update success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest008 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          expect().assertFail();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest008 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest008 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest012
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0110
       * @tc.desc delete success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest012 start *************");
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          rdbStore.deleteSync(predicates);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest012 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest012 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest013
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0120
       * @tc.desc delete success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest013 start *************");
        let predicates = new relationalStore.RdbPredicates("employee");
        predicates.equalTo("name", "Jim");
        try {
          await rdbStore.delete(predicates);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest013 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest013 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest023
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0130
       * @tc.desc cleanDirtyData success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest023 start *************");
        const SQL_DELETE_TABLE = 'DELETE FROM employee';
        try {
          await rdbStore.execute(SQL_DELETE_TABLE);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest023 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest023 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest024
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0140
       * @tc.desc cleanDirtyData success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest024 start *************");
        try {
          const SQL_DELETE_TABLE = 'delete FROM employee WHERE name = ?';
          await rdbStore.execute(SQL_DELETE_TABLE, ['Jim'])
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest024 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest024 end *************");
      })
  
      /**
       * @tc.name relationalStoreTest025
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0150
       * @tc.desc cleanDirtyData success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* relationalStoreTest025 start *************");
        const SQL_DELETE_TABLE = 'delete FROM employee';
        try {
          await rdbStore.execute(SQL_DELETE_TABLE);
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest025 fail code is " + e.code + " message is " + e.message);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* relationalStoreTest025 end *************");
      })
  
      /**
       * @tc.name testGetColumnIndex0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0160
       * @tc.desc testGetColumnIndex0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testGetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testGetColumnIndex0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getColumnIndex('id')
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getColumnIndex failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testGetColumnIndex0001 end *************");
      })
  
      /**
       * @tc.name testGetColumnName0002
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0170
       * @tc.desc testGetColumnName0002
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testGetColumnName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testGetColumnIndex0002 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getColumnName(1)
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getColumnName failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testGetColumnIndex0002 end *************");
      })
  
      /**
       * @tc.name testgoToFirstRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0310
       * @tc.desc testgoToFirstRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoToFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoToFirstRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        try {
          resultSet.goToFirstRow()
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goToFirstRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoToFirstRow0001 end *************");
      })
  
      /**
       * @tc.name testgoToNextRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0300
       * @tc.desc testgoToNextRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoToNextRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoToNextRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToNextRow()
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goToNextRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoToNextRow0001 start *************");
      })
  
      /**
       * @tc.name testgoToLastRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0290
       * @tc.desc testgoToLastRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoToLastRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoToLastRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        try {
          resultSet.goToLastRow()
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goToLastRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoToLastRow0001 end *************");
      })
  
      /**
       * @tc.name testgoToRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0280
       * @tc.desc testgoToRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoToRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoToRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToRow(0)
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goToRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoToRow0001 end *************");
      })
  
      /**
       * @tc.name testgoTo0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0270
       * @tc.desc testgoTo0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoTo0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goTo(0)
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goTo failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoTo0001 end *************");
      })
  
      /**
       * @tc.name testgoToPreviousRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0260
       * @tc.desc testgoToPreviousRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgoToPreviousRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgoToPreviousRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.goToPreviousRow()
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `goToPreviousRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgoToPreviousRow0001 end *************");
      })
  
      /**
       * @tc.name testgetBlob0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0250
       * @tc.desc testgetBlob0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetBlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetBlob0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getBlob(resultSet.getColumnIndex('data4'))
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getBlob failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetBlob0001 end *************");
      })
  
      /**
       * @tc.name testgetString0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0240
       * @tc.desc testgetString0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetString0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getString(resultSet.getColumnIndex('name'))
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getString failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetString0001 end *************");
      })
  
      /**
       * @tc.name testgetLong0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0230
       * @tc.desc testgetLong0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetLong0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getLong(resultSet.getColumnIndex('age'))
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getLong failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetLong0001 end *************");
      })
  
      /**
       * @tc.name testgetDouble0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0220
       * @tc.desc testgetDouble0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetDouble0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getDouble(resultSet.getColumnIndex('salary'))
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getDouble failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetDouble0001 end *************");
      })
  
      /**
       * @tc.name testgetAsset0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0210
       * @tc.desc testgetAsset0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetAsset0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getAsset(resultSet.getColumnIndex('data5'));
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getAsset failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetAsset0001 end *************");
      })
  
      /**
       * @tc.name testgetAssets0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0200
       * @tc.desc testgetAssets0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetAssets0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getAsset(resultSet.getColumnIndex('data6'));
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getAssets failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetAssets0001 end *************");
      })
  
      /**
       * @tc.name testgetValue0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0190
       * @tc.desc testgetValue0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetValue0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getValue(resultSet.getColumnIndex('salary'))
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getValue failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetValue0001 end *************");
      })
  
      /**
       * @tc.name testgetRow0001
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0180
       * @tc.desc testgetRow0001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testgetRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.info(TAG + "************* testgetRow0001 start *************");
        let predicates = new relationalStore.RdbPredicates('employee');
        let resultSet = await rdbStore.query(predicates);
        expect(true).assertEqual(resultSet.goToFirstRow())
        try {
          resultSet.getRow()
          resultSet.close();
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
          expect(e.code).assertEqual(14800033);
        }
        done();
        console.info(TAG + "************* testgetRow0001 end *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans001
       * @tc.name testRdbStoreTrans001
       * @tc.desc testRdbStoreTrans001
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans001 start *************");
        rdbStore.createTransaction().then((transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          try {
            let rowId: long = (transaction as relationalStore.Transaction).insertSync("employee", valueBucket1,
              relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            transaction.commit();
            console.info(TAG + `Insert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans001 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans002
       * @tc.name testRdbStoreTrans002
       * @tc.desc testRdbStoreTrans002
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans002 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          try {
            let rowId: long =
              await transaction.insert("employee", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            transaction.commit();
            console.info(TAG + `Insert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans002 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans003
       * @tc.name testRdbStoreTrans003
       * @tc.desc testRdbStoreTrans003
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans003 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1);
          try {
            let rowId: long = await transaction.batchInsert("employee", valueBuckets);
            transaction.commit();
            console.info(TAG + `batchInsert is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `batchInsert is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans003 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans004
       * @tc.name testRdbStoreTrans004
       * @tc.desc testRdbStoreTrans004
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans004 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket1);
          try {
            let rowId: long = transaction.batchInsertSync("employee", valueBuckets);
            transaction.commit();
            console.info(TAG + `batchInsertSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `batchInsertSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans004 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans005
       * @tc.name testRdbStoreTrans005
       * @tc.desc testRdbStoreTrans005
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans005 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let predicates = new relationalStore.RdbPredicates("employee");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long =
              transaction.updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
            transaction.commit();
            console.info(TAG + `updateSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans005 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans006
       * @tc.name testRdbStoreTrans006
       * @tc.desc testRdbStoreTrans006
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans006 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          const valueBucket1: relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "Jim",
            "age": 30 as long,
            "salary": 2000.1
          }
          let predicates = new relationalStore.RdbPredicates("employee");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long =
              await transaction.update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
            transaction.commit();
            console.info(TAG + `update is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `update is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          }
          ;
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans006 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans007
       * @tc.name testRdbStoreTrans007
       * @tc.desc testRdbStoreTrans007
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans007 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          let predicates = new relationalStore.RdbPredicates("employee");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long = await transaction.delete(predicates);
            transaction.commit();
            console.info(TAG + `delete is successful, rowId = ${rowId}`);
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `delete is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans007 end   *************");
      })
  
      /**
       * @tc.number testRdbStoreTrans008
       * @tc.name testRdbStoreTrans008
       * @tc.desc testRdbStoreTrans008
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('testRdbStoreTrans008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
        console.log(TAG + "************* testRdbStoreTrans008 start *************");
        rdbStore.createTransaction().then(async (transaction: relationalStore.Transaction) => {
          let predicates = new relationalStore.RdbPredicates("employee");
          predicates.equalTo("name", "Jim");
          try {
            let rowId: long = transaction.deleteSync(predicates);
            transaction.commit();
            console.info(TAG + `deleteSync is successful, rowId = ${rowId}`);
          } catch (e) {
            e = e as BusinessError;
            transaction.rollback();
            console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
            expect(e.code).assertEqual(14800033);
          };
        }).catch((e: Error): void => {
          let err = e as BusinessError;
          console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
        done();
        console.log(TAG + "************* testRdbStoreTrans008 end   *************");
      })
    })
  
  }