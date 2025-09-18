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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

let domain: int = 0x0000;
let tag: string = 'testTag';


let rdbStore:data_relationalStore.RdbStore;
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "testxq.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testxq.db"
let dbPath = "";
let dbPathWal = "";
let dbPathShm = "";

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err:BusinessError) {
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}

async function CreateCorruptDb1() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.WRITE_ONLY );
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err:BusinessError) {
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}
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
let vbs :Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(2);
vbs[0] = valueBucket0
vbs[1] = valueBucket1
export default function RelationStoreError11Test() {
  describe('RelationStoreError11Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      dbPath = context.databaseDir + "/rdb/" + dbName;
      dbPathWal = context.databaseDir + "/rdb/" + dbName + "-wal";
      dbPathShm = context.databaseDir + "/rdb/" + dbName + "-shm";
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })
    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
    })
    afterEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name       : RelationStoreError11Test0001
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 start *************');
      await CreateCorruptDb();
      try{
        let num = await rdbStore.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 ************* num ' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 ************* err ' + err.code);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0002
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0002 start *************');
      await CreateCorruptDb();
      try{
        let num = await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0002 ************* num ' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0002 ************* err ' + err.code);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0002 end *************');
    })


    /**
     * @tc.name       : RelationStoreError11Test0003
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0003 start *************');
      await CreateCorruptDb();
      try{
        let num = rdbStore.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0003 ************* num ' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0003 ************* err ' + err.code);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0003 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0004
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0004 start *************');
      await CreateCorruptDb();
      try{
        let num = rdbStore.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0004 ************* num ' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0004 ************* err ' + err.code);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0004 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0005
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0005 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows:number = await rdbStore.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0005 end *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0005 end *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0005 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0006
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0006 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows:number = rdbStore.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0006 end *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0006 end *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0006 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0007
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0007 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows:number = await rdbStore.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0007 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0007 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0007 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0008
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0008 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows:number = rdbStore.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0008 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0008 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0008 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0009
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_0900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0009 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows =await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0009 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0009 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0009 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0010
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0010 start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await CreateCorruptDb();
      try{
        let rows = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0010 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0010 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0010 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0011
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0011 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try{
        let rows = await rdbStore.execute("PRAGMA integrity_check");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0011 rows *************' + rows);
        expect(rows == "ok").assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0011 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0011 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0012
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0012 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try{
        let rows = await trans.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0012 rows *************' + rows);
        expect(rows != null).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0012 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0012 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0013
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0013 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try{
        let rows = await trans.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0013 rows *************' + rows);
        expect(rows != null).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0013 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0013 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0014
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0014 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try{
        let rows =  trans.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0014 rows *************' + rows);
        expect(rows != null).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0014 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0014 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0015
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0015 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      await CreateCorruptDb();
      try{
        let rows = trans.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0015 rows *************' + rows);
        expect(rows != null).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0015 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0015 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0016
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0016 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = await trans.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0016 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0016 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0016 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0017
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0017 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = await trans.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0017 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0017 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0017 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0018
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0018 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = trans.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0018 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0018 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0018 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0019
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_1900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0019 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = trans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0019 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0019 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0019 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0020
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0020 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = trans.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0020 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0020 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0020 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0021
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0021 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = trans.batchInsertSync("test",vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0021 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0021 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0021 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0022
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0022 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows:number = await trans.batchInsert("test",vbs);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0022 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0022 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0022 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0023
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0023 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getColumnIndex("data1");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0023 res *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0023 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0023 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0024
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0024 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getColumnName(0);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0024 res *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0024 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0024 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0025
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0025 start *************');
      await CreateCorruptDb();
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getString(resultSet.getColumnIndex("data1"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0025 res *************' +res);
        expect(res == "hello" ).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0025 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0025 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0026
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2600
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0026 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0026 res *************' +res);
        expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0026 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0026 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0027
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2700
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0027 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0027 res *************' +res);
        expect(res == 10).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0027 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0027 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0028
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2800
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0028 start *************');
      await CreateCorruptDb();
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0028 res *************' +res);
        expect(res == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0028 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0028 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0029
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_2900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0029 start *************');
      await CreateCorruptDb();
      let resultSet =await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0029 res *************' +res);
        expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}').assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0029 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0029 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0030
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_3000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0030 start *************');
      let asset:data_relationalStore.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: data_relationalStore.AssetStatus.ASSET_NORMAL,
      };
      const assets = [asset];
      const valueBucket:data_relationalStore.ValuesBucket = {
        "data1": "hello world 1",
        "data2": 3 as long,
        "data3": 10.5,
        "data4": new Uint8Array([1, 2, 3]),
        "data5": asset,
        "data6": assets,
        "data7": new Float32Array([1.5, 2.5]),
        "data8": 100n
      };
      let num = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getAssets(resultSet.getColumnIndex("data6"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0030 res *************' +res.length);
        expect(res.length == 0).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0030 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0030 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0031
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_3100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0031 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getValue(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0031 res *************' +res);
        expect(res == null).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0031 err *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0031 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0032
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_3200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0032 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.getRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0032 end *************' +JSON.stringify(res));
        expect(JSON.stringify(res) != '{}').assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0032 end *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0032 end *************');
    })


    /**
     * @tc.name       : RelationStoreError11Test0033
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_3300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0033 start *************');
      await CreateCorruptDb();
      let resultSet = await rdbStore.querySql("SELECT * FROM test");
      try{
        let res = resultSet.isColumnNull(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0033 end *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0033 end *************'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0033 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0034
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_3400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0034 start *************');
      await CreateCorruptDb1();
      await rdbStore.close();
      try{
        await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0034  ************* res');
        expect().assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0034  ************* err'+err.code + err.message);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0034 end *************');
    })

    /**
     * @tc.name       : RelationStoreError11Test0035
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_35000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0035 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        let rows = await trans.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0035 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0035 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0035 end *************');
    })
    /**
     * @tc.name       : RelationStoreError11Test0036
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error11Test_36000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError11Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0036 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("test");
      await CreateCorruptDb();
      try{
        await rdbStore.createTransaction();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0036 1111111111111 *************');
        expect().assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0036 err *************' + err);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0036 end *************');
    })
  })
}