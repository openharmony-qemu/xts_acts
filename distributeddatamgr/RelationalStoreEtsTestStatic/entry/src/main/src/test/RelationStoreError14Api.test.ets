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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach,afterAll,afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.DEFERRED
}
let domain: int = 0x0000;
let tag: string = 'testTag';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const CREATE_TABLE_TESTTRANS = "CREATE TABLE IF NOT EXISTS testTrans (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"

let STORE_CONFIG1 :data_relationalStore.StoreConfig = {
  name: "test1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  encrypt:false,
}
const CREATE_TABLE_TESTERRCODE = "CREATE TABLE IF NOT EXISTS testerrcode (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 TEXT NOT NULL," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TESTERRCODE = "DROP TABLE IF EXISTS testerrcode";

let STORE_CONFIG2 :data_relationalStore.StoreConfig = {
  name: "test2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore : data_relationalStore.RdbStore
let rdbStore1 : data_relationalStore.RdbStore
let rdbStore2 : data_relationalStore.RdbStore
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(3);
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :data_relationalStore.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

const valueBucket3 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 100 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}

export default function ErrorCodeRdbStore14Test() {
  describe('ErrorCodeRdbStore14Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      rdbStore2 = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
    })
    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
    })
    afterAll(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name       : RelationStoreError14Test0001
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0001 start *************');
      await rdbStore.close();
      try{
        let num = await rdbStore.insert("test", valueBucket0);
        expect(num == 1).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0001 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0002
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0002 start *************');
      await rdbStore.close();
      try{
        let num = await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(num == 1).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0002 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0003
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0003 start *************');
      await rdbStore.close();
      try{
        let num = rdbStore.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect(num == 1).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0003 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0004
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0004 start *************');
      await rdbStore.close();
      try{
        let num = rdbStore.insertSync("test", valueBucket1);
        expect(num == 1).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0004 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0005
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0005 start *************');
      await rdbStore.close();
      try{
        let num = await rdbStore.batchInsert("test", vbs);
        expect(num == 3).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0005 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0006
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0006 start *************');
      await rdbStore.close();
      try{
        let num = rdbStore.batchInsertSync("test", vbs);
        expect(num == 3).assertFail();
        done();
      }catch(err: BusinessError){
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0006 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0007
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0007 start *************');
      let num = await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows:number = await rdbStore.update(valueBucket3, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0007 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0007 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0007 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0008
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0008 start *************');
      let num = await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows:number = rdbStore.updateSync(valueBucket3, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0008 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0008 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0008 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0009
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_0900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0009 start *************');
      let num = await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows:number = await rdbStore.update(valueBucket3, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0009 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0009 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0009 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0010
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0010 start *************');
      let num = await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows:number = rdbStore.updateSync(valueBucket3, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0010 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0010 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0010 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0011
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0011 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows =await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0011 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0011 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0011 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0012
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0012 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0012 rows *************' + rows);
        expect(rows == 1).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0012 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0012 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0013
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0013 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows =await rdbStore.query(predicates,["data1"]);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0013 rows *************' + rows.columnCount);
        expect(rows.columnCount == 1 ).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0013 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0013 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0014
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0014 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows =await rdbStore.query(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0014 rows *************' + rows);
        expect(rows.columnCount == 1 ).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0014 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0014 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0015
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0015 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows = rdbStore.querySync(predicates, ["data1"]);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0015 rows *************' + rows.columnCount);
        expect(rows.columnCount == 1 ).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0015 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0015 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0016
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0016 start *************');
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows = rdbStore.querySync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0016 rows *************' + rows.rowCount);
        expect(rows.columnCount == 1 ).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0016 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0016 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0017
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0017 start *************');
      let num = await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      try{
        let rows = await rdbStore.querySql("SELECT * FROM test WHERE data1 = ?", ['hello']);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0017 rows *************' + rows.rowCount);
        expect(rows.columnCount == 1 ).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0017 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0017 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0018
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0018 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      await rdbStore.close();
      try{
        let rows = await rdbStore.execute("select data1 from test");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0018 rows *************' + rows);
        expect(rows).assertEqual("ok");
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0018 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0018 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0019
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_1900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0019 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      await rdbStore.close();
      try{
        let rows = await rdbStore.execute("select data1 from test where data1",[]);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0019 rows *************' + rows);
        expect(rows).assertEqual("ok");
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0019 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0019 end *************');
    })


    /**
     * @tc.name       : RelationStoreError14Test0020
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0020 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      await rdbStore.close();
      try{
        let rows = await rdbStore.createTransaction();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0020 rows *************' + rows);
        expect(rows).assertFail();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0020 err *************' + err);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0020 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0021
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0021 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await rdbStore.close();
      try{
        let rows = await trans.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0021 rows *************' + rows);
        expect(rows).assertFail();
        trans.rollback();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0021 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        trans.rollback();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0021 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0022
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0022 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await rdbStore.close();
      try{
        let rows = await trans.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0022 rows *************' + rows);
        expect(rows).assertFail();
        trans.rollback();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0022 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        trans.rollback();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0022 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0023
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0023 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await rdbStore.close();
      try{
        let rows = trans.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0023 rows *************' + rows);
        expect(rows).assertFail();
        trans.rollback();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0023 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        trans.rollback();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0023 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0024
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0024 start *************');
      let num =await rdbStore.batchInsert("test", vbs);
      let trans = await rdbStore.createTransaction();
      await rdbStore.close();
      try{
        let rows = trans.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0024 rows *************' + rows);
        expect(rows).assertFail();
        trans.rollback();
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0024 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        trans.rollback();
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0024 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0025
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0025 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      await rdbStore.close();
      try{
        let rows:number = rdbStore.batchInsertSync("test",vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0025 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0025 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0025 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0026
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0026 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goTo(1)
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0026 res *************'+res);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0026 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0026 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0027
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0027 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goToRow(-1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0027 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0027 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0027 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0028
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0028 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goToFirstRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0028 end *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0028 end *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0028 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0029
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_2900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0029 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goToLastRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0029 end *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0029 end *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0029 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0030
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0030 start *************');
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goToNextRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0030 end *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0030 end *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0030 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0031
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0031 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.close();
      try{
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0031 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0031 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0031 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0032
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0032 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goTo(resultSet.rowCount);
      resultSet.close();
      try{
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0032 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0032 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0032 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0035
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0035 start *************');
      await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      resultSet.close();
      try{
        let res = resultSet.getString(resultSet.getColumnIndex("data1"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0035 res *************' +res);
        expect(res == "hello" ).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0035 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0035 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0036
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0036 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data4")
      resultSet.close();
      try{
        let res = resultSet.getBlob(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0036 res *************' +res);
        expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0036 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0036 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0037
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0037 start *************');
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data2");
      resultSet.close();
      try{
        let res = resultSet.getLong(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0037 res *************' +res);
        expect(res == 10).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0037 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0037 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0038
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0038 start *************');
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data3");
      resultSet.close();
      try{
        let res = resultSet.getDouble(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0038 res *************' +res);
        expect(res == 1).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0038 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0038 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0039
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_3900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0039 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data5");
      resultSet.close();
      try{
        let res = resultSet.getAsset(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0039 res *************' +res);
        expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}').assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0039 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0039 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0041
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0041 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data5");
      resultSet.close();
      try{
        let res = resultSet.getValue(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0041 res *************' +res);
        expect(res == null).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0041 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0041 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0042
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0042 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      resultSet.close();
      try{
        let res = resultSet.getRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0042 JSON.stringify(res) *************' +JSON.stringify(res));
        expect(JSON.stringify(res) == '{"data1":"hello","data2":10,"data5":'+null+',"data3":1,"data8":null,"id":1,"data4":{"BYTES_PER_ELEMENT":1,"buffer":{"data":[],"data6":null,"data7":null}').assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0042 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0042 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0043
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0043 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data5");
      resultSet.close();
      try{
        let res = resultSet.isColumnNull(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0043 res *************' +res);
        expect(res).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0043 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0043 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0044
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0044 start *************');
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      resultSet.goToFirstRow();
      let num = resultSet.getColumnIndex("data7");
      resultSet.close();
      try{
        let res = resultSet.getFloat32Array(num);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0044 err ************* ' +res.length);
        expect(res.length == 0).assertFail();
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0044 err *************'+err.code + err.message);
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0044 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0045
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0045 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows =await trans.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0045 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0045 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0045 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0046
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0046 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows =await trans.batchInsert("test",vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0046 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0046 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0046 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0047
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0047 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows = trans.batchInsertSync("test",vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0047 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0047  err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0047 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0048
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0048 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let trans = await rdbStore.createTransaction();
      let num =await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows = trans.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0048 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0048 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test00468RelationStoreError14Test0048 end *************');
    })

    /**
     * @tc.name       : RelationStoreError14Test0049
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_4900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0049 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows:number = await trans.update(valueBucket3, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0049 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0049 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0049 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0050
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_5000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows:number = await trans.update(valueBucket3, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0050 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0050 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0050 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0051
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_5100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0051 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows:number = trans.updateSync(valueBucket3, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0051 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0051 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0051 end *************');
    })
    /**
     * @tc.name       : RelationStoreError14Test0052
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error14Test_5200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError14Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0052 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.close();
      await trans.rollback();
      try{
        let rows:number = trans.updateSync(valueBucket3, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0052 rows *************' + rows);
        expect(rows == 1).assertFail();
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0052 err *************' + err);
        expect(err.code == 14800014).assertEqual(true);
        await trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0052 end *************');
    })

  })
}
