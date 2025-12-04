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
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import { BusinessError } from '@ohos.base';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import Utils from './Util.test';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import common from '@ohos.app.ability.common';
  import relationalStore from '@ohos.data.relationalStore';
  
  let context: common.UIAbilityContext;
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const TAG = "[RELATIONAL_STORE_JS_READ_ONLY_TEST]";
  let rdbStore: relationalStore.RdbStore;
  
  let STORE_CONFIG: relationalStore.StoreConfig = {
    name: "test.db",
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  
  let STORE_CONFIG1: relationalStore.StoreConfig = {
    name: "test.db",
    securityLevel: relationalStore.SecurityLevel.S1,
    isReadOnly: true,
  }
  
  const valueBucket: relationalStore.ValuesBucket = {
    'name': 'zhangsan',
    'age': 18 as long,
    'salary': 25000.1,
    'blobType': new Uint8Array([1, 2, 3]),
  };
  
  const valueBucket1: relationalStore.ValuesBucket = {
    'name': 'lisi',
    'age': 19 as long,
    'salary': 30000.2,
    'blobType': new Uint8Array([1, 2, 3]),
  };
  
  export default function RelationStoreError801Test() {
    describe('RelationStoreError801Test', (): void => {
      beforeAll(async () : Promise<void> => {
        console.log(TAG + 'beforeAll');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
        await Utils.msSleep(2000)
        context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "name TEXT, age INTEGER, salary REAL, blobType BLOB)";
        await rdbStore.execute(CREATE_TABLE_SQL);
        rdbStore.close();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
        console.info(TAG + 'beforeAll End ');
      })
  
      beforeEach(async () => {
        console.info(TAG + 'beforeEach');
      })
  
      afterEach(async () => {
        console.info(TAG + 'afterEach')
      })
  
      afterAll(async () : Promise<void> => {
        console.info(TAG + 'afterAll');
        await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      })
  
      console.info(TAG + "*************JS Test Begin*************");
  
      /**
       * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0100
       * @tc.name ReadonlyErrCode001
       * @tc.desc 1. set isReadOnly as true
       *          2. open read-only database
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 3
       */
      it('ReadonlyErrCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        async (done: () => void): Promise<void> => {
          console.info(TAG + "************* ReadonlyErrCode001 start *************");
          rdbStore.insert("test", valueBucket).then((rowId: long) => {
            console.info(`ReadonlyErrCode001 Insert2 is successful, rowId = ${rowId}`);
            expect().assertFail();
          }).catch((e: Error): void => {
            let err = e as BusinessError;
            console.error(TAG + `ReadonlyErrCode001 Insert2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code == 801).assertTrue();
          });
  
          try {
            await rdbStore.insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(`ReadonlyErrCode001 insert is successful`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(TAG +
              `ReadonlyErrCode001 insert is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 801).assertTrue();
          }
          try {
            await rdbStore.execute("INSERT INTO test (name, age, salary, blobType) VALUES (?, ?, ?, ?)");
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(TAG +
              `ReadonlyErrCode001 execute is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 801).assertTrue();
          }
          try {
            rdbStore.insertSync("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + `ReadonlyErrCode001 insertSync1 is successful`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(TAG +
              `ReadonlyErrCode001 insertSync1 is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 801).assertTrue();
          }
  
          let valueBuckets = new Array<relationalStore.ValuesBucket>(valueBucket, valueBucket1);
          rdbStore.batchInsert("test", valueBuckets).then((insertNum: long) => {
            console.info(TAG +
              `ReadonlyErrCode001 batchInsert2 is successful, the number of values that were inserted = ${insertNum}`);
            expect().assertFail();
          }).catch((e: Error): void => {
            let err = e as BusinessError;
            console.error(TAG +
              `ReadonlyErrCode001 batchInsert2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code == 801).assertTrue();
          });
  
          try {
            let rowId: long = rdbStore.batchInsertSync("test", valueBuckets);
            console.info(TAG + `ReadonlyErrCode001 batchInsertSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (error) {
            error = error as BusinessError;
            console.error(TAG +
              `ReadonlyErrCode001 batchInsertSync is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code == 801).assertTrue();
          }
          done();
          console.log(TAG + "************* ReadonlyErrCode001 end *************");
        })
    })
  }