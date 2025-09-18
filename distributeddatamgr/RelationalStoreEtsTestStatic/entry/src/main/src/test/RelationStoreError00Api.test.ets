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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
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
  name: "testljj.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testljj.db"
let dbPath =  "";
let dbPathWal =  "";
let dbPathShm = "";
async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.TRUNC);
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
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
export default function RelationStoreError00Test() {
  describe('RelationStoreError00Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      dbPath = context.databaseDir + "/rdb/" + dbName;
      dbPathWal = context.databaseDir + "/rdb/" + dbName + "-wal";
      context.databaseDir + "/rdb/" + dbName + "-shm";
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })

    /**
     * @tc.name       : RelationStoreError00Test0001
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0100
     * @tc.desc       : RdbStore insert
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      try{
        let num = await rdbStore.insert("", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 num *************  ' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 err *************  ' + err.code);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0002
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0200
     * @tc.desc       : RdbStore insert
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0002 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      try{
        let num = await rdbStore.insert("", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0002 num *************' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0002 err *************  ' + err.code);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0002 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0003
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0300
     * @tc.desc       : RdbStore insertSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0003 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      try{
        let num = rdbStore.insertSync("", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0003 num *************' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0003 err *************  ' + err.code);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0003 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0004
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0400
     * @tc.desc       : RdbStore insertSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0004 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      try{
        let num = rdbStore.insertSync("", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0004 num *************' + num);
        expect(num == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0004 err *************  ' + err.code);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0004 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0005
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0500
     * @tc.desc       : RdbStore update
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0005 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = await rdbStore.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0005 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0005 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0005 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0006
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0600
     * @tc.desc       : RdbStore update
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0006 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = await rdbStore.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0006 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0006 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0006 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0007
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0700
     * @tc.desc       : RdbStore updateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0007 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = rdbStore.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0007 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0007 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0007 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0008
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0800
     * @tc.desc       : RdbStore updateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0008 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = rdbStore.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0008 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0008 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0008 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0009
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_0900
     * @tc.desc       : RdbStore delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0009 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows =await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0009 end *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0009 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0009 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0010
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1000
     * @tc.desc       : RdbStore deleteSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0010 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0010 end *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0010 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0010 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0011
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1100
     * @tc.desc       : Transaction insert
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0011 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      try{
        let rows = await trans.insert("", valueBucket1);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0011 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0011 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0012
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1200
     * @tc.desc       : Transaction insert
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0012 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      try{
        let rows = await trans.insert("", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0012 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0012 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0013
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1300
     * @tc.desc       : Transaction insertSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0013 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      try{
        let rows = trans.insertSync("", valueBucket1);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0013 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0013 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0014
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1400
     * @tc.desc       : Transaction insertSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0014 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      try{
        let rows = trans.insertSync("", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0014 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0014 end *************');
    })


    /**
     * @tc.name       : RelationStoreError00Test0015
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1500
     * @tc.desc       : Transaction update
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0015 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = await trans.update(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0015 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0015 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0015 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0016
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1600
     * @tc.desc       : Transaction update
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0016 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = await trans.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0016 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0016 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0016 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0017
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1600
     * @tc.desc       : Transaction updateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0017 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = trans.updateSync(valueBucket1, predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0017 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0017 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0017 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0018
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1800
     * @tc.desc       : Transaction updateSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0018 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows:number = trans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0018 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0018 err *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0018 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0019
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_1900
     * @tc.desc       : Transaction delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0019 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows =await trans.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0019 end *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0019 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0019 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0020
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2000
     * @tc.desc       : Transaction delete
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0020 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      let trans = await rdbStore.createTransaction();
      let predicates = new data_relationalStore.RdbPredicates("");
      try{
        let rows = trans.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0020 end *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0020 end *************' + err);
        expect(err.code == 14800000).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0020 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0022
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2200
     * @tc.desc       : Transaction getColumnName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0022 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet =await rdbStore.querySql("");
      try{
        let res = resultSet.getColumnName(0);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0022 end *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0022 end *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0022 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0023
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2300
     * @tc.desc       : Transaction goTo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0023 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("");
      try{
        let res = resultSet.goTo(1)
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0023 res *************'+res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0023 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0023 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0024
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2400
     * @tc.desc       : Transaction goToRow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0024 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet =await rdbStore.querySql("");
      try{
        let res = resultSet.goToRow(-1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0024 res *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0024 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0024 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0025
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2500
     * @tc.desc       : Transaction goToFirstRow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0025 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("");
      try{
        let res = resultSet.goToFirstRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0025 res *************' +resultSet.rowCount);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0025 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0025 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0026
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2600
     * @tc.desc       : Transaction goToLastRow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0026 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet =await rdbStore.querySql("");
      try{
        let res = resultSet.goToLastRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0026 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0026 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0026 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0027
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2700
     * @tc.desc       : Transaction goToLastRow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0027 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("");
      try{
        let res = resultSet.goToNextRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0027 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0027 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0027 end *************');
    })

    /**
     * @tc.name       : RelationStoreError00Test0028
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2800
     * @tc.desc       : Transaction goToPreviousRow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0028 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("");
      try{
        let res = resultSet.goToPreviousRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0028 resultSet *************' +resultSet.rowCount);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0028 err *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0028 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0029
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2900
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet =await rdbStore.querySql("");
      try{
        let res = resultSet.getRow();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 end *************' +JSON.stringify(res));
        expect(JSON.stringify(res) == '{"data1":"hello","data2":10,"data5":'+null+',"data3":1,"data8":null,"id":1,"data4":{"BYTES_PER_ELEMENT":1,"buffer":{"data":[],"data6":null,"data7":null}').assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 end *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 end *************');
    })
    /**
     * @tc.name       : RelationStoreError00Test0030
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
      let resultSet = await rdbStore.querySql("");
      try{
        let res = resultSet.isColumnNull(resultSet.getColumnIndex("data5"));
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 end *************' +res);
        expect(res).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err: BusinessError){
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 end *************'+err.code + err.message);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 end *************');
    })
  })
}