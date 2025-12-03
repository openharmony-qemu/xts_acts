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
  } catch (err) {
    err = err as BusinessError;
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

let options:data_relationalStore.TransactionOptions = {
  transactionType:data_relationalStore.TransactionType.IMMEDIATE
}

export default function RelationStoreError32Test() {
  describe('RelationStoreError32Test', (): void => {
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

    afterEach(async (): Promise<void> => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
	
    /**
     * @tc.name   RelationStoreError00Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error00Test_0100
     * @tc.desc   RdbStore insert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 err *************  ' + err.code);
        expect(err.code == 14800000).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0001 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0001 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        await rdbStore.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s',
          "RelationStoreError32Test0001 (rdbStore as data_relationalStore.RdbStore).insert success ");
        expect(null).assertFail();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0001 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0001 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   RelationalStoreEnumerateTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RelationalStoreEnumerateTest_0100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationalStoreEnumerateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 start *************');
      let STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "MyStore.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      };
      try{
        store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(store != undefined).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch(err) {
        err = err as BusinessError;
        console.error(`RelationalStoreEnumerateTest001, code is ${err.code},message is ${err.message}`);
        expect(err != null).assertFail();
        await data_relationalStore.deleteRdbStore(context,STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* testGetColumnIndex0001 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0200
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0002 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s',
          "RelationStoreError32Test0002 (rdbStore as data_relationalStore.RdbStore).insert success ");
        expect(null).assertFail();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0002 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0002 start *************")
        done();
      }
    })

    /**
     * @tc.name   RelationStoreError10Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error10Test_2300
     * @tc.desc   Transaction goTo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelationStoreError10Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError10Test0001 start *************");

      const STORE_CONFIG1  : data_relationalStore.StoreConfig = {
        name: "rootDirTest.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        pluginLibs: [ "/data/app/el1/bundle/public/" ],
        encrypt:false,
      }
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError10Test0001 22 *************");
      try {
        await data_relationalStore.getRdbStore(context,STORE_CONFIG1);
        hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError10Test0001 1111 *************");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError10Test0001 333 *************");
        hilog.info(domain, tag, '%{public}s', "RelationStoreError10Test0001, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual(14800010);
      }
      try {
        await data_relationalStore.deleteRdbStore(context,STORE_CONFIG1);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', "deleteRdbStore, error code: "+err.code, "err message:"+ err.message);
        expect(err.code).assertEqual(14800010);
      }
      done();
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError10Test0001 end *************");
    })
	
    /**
     * @tc.name   RelationStoreError32Test0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0300
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0003 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        rdbStore.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s',
          "RelationStoreError32Test0003 (rdbStore as data_relationalStore.RdbStore).insert success ");
        expect(null).assertFail();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0003 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0003 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   RelationStoreError11Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error11Test_0100
     * @tc.desc   Transaction getLong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 ************* err ' + err.code);
        expect(err.code == 14800011).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError11Test0001 end *************');
    })
	
    /**
     * @tc.name   RelationStoreError32Test0017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1700
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0017 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows =await trans.update(valueBucket0,predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0017 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0017 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0017 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0400
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0004 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        rdbStore.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s',
          "RelationStoreError32Test0004 (rdbStore as data_relationalStore.RdbStore).insert success ");
        expect(null).assertFail();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0004 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0004 start *************")
        done();
      }
    })

    /**
     * @tc.name   RelationStoreError12Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error12Test_0100
     * @tc.desc   Transaction getBlob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError12Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 end *************' + res);
          expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0001 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 end *************');
      })
	  
    /**
     * @tc.name   RelationStoreError32Test0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0500
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0005 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = await rdbStore.delete(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0005 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0005 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0005 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   RelationStoreError14Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error14Test_0100
     * @tc.desc   Transaction getLong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError14Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0001 start *************');
      await rdbStore.close();
      try{
        let num = await rdbStore.insert("test", valueBucket0);
        expect(num == 1).assertFail();
        done();
      }catch(err) {
        err = err as BusinessError;
        expect(err.code == 14800014).assertEqual(true)
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError14Test0001 end *************');
    })


    /**
     * @tc.name   RelationStoreError32Test0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0600
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0006 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = rdbStore.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0006 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0006 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0006 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   RelationStoreError17Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error17Test_0100
     * @tc.desc   Transaction goTo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError17Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError17Test0001 start *************');
        const STORE_CONFIG3: data_relationalStore.StoreConfig = {
          name: "testljj.db",
          securityLevel: data_relationalStore.SecurityLevel.S4
        }
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG3);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError17Test0001 err *************  ' + err.code);
          expect(err.code == 14800017).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError17Test0001 end *************');
      })

    /**
     * @tc.name   RelationStoreError32Test0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0700
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0007 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = await rdbStore.update(valueBucket0,predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0007 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0007 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0007 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   RelationStoreError21Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error21Test_0100
     * @tc.desc   insert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError21Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try{
        let num = await rdbStore.insert("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 ************* num ' + num);
        expect(num != 1).assertFail();
        await data_relationalStore.deleteRdbStore(context,STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0001 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0800
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0008 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = rdbStore.updateSync(valueBucket0,predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0008 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0008 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0008 start *************")
        done();
      }
    })


    /**
     * @tc.name   RelationStoreError32Test0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_0900
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0009 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = await rdbStore.update(valueBucket0,predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0009 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0009 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0009 start *************")
        done();
      }
    })

    /**
     * @tc.name   RelationStoreError24Test0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error24Test_0100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError24Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const rdbTrans = await rdbStore.createTransaction(options);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": name,
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbTrans.insert("test", valueBucket2);
      try{
        let num = await rdbStore.insert("test", valueBucket2);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 ************* num ' + num);
        expect(num == 1).assertFail();
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 ************* err ' + err.code);
        expect(err.code == 14800024).assertEqual(true);
        rdbTrans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError24Test0001 end *************');
    })
	
    /**
     * @tc.name   RelationStoreError32Test0018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1800
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0018 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows =await trans.update(valueBucket0,predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0018 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0018 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0018 end *************');
    })
	
    /**
     * @tc.name   RelationStoreError32Test0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1000
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0010 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows:long = rdbStore.updateSync(valueBucket0,predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0010 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0010 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0010 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   relationalStoreTest001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   RelationStoreError32Test0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1100
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s',  "************* RelationStoreError32Test0011 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try {
        let rows = await rdbStore.execute("UPDATE test SET data1 = '王五'");
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0011 rows *************' + rows);
        expect(rows == 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0011 start *************" + e);
        expect(e.code).assertEqual(14800032);
        hilog.info(domain, tag, '%{public}s',
          "************* RelationStoreError32Test0011 start *************")
        done();
      }
    })
	
    /**
     * @tc.name   ReadonlyErrCode001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0100
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* ReadonlyErrCode001 start *************");
        await rdbStore.insert("test", valueBucket).then((rowId: long) => {
          console.info(`ReadonlyErrCode001 Insert2 is successful, rowId = ${rowId}`);
          expect().assertFail();
        }).catch((err) => {
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
        await rdbStore.batchInsert("test", valueBuckets).then((insertNum: long) => {
          console.info(TAG +
            `ReadonlyErrCode001 batchInsert2 is successful, the number of values that were inserted = ${insertNum}`);
          expect().assertFail();
        }).catch((err) => {
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

    /**
     * @tc.name   RelationStoreError32Test0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1200
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0012 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE DELETE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows:number = trans.deleteSync(predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0012 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0012 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0012 end *************');
    })
	
    /**
     * @tc.name   RelationStoreError32Test0019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1900
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0019 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE UPDATE ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows = trans.updateSync(valueBucket0,predicates);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0019 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0019 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0019 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1300
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0013 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows:number = trans.insertSync("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0013 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0013 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0013 end *************');
    })

    /**
     * @tc.name   RelationStoreError21Test0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error21Test_0300
     * @tc.desc   insert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError21Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      console.info(tag + "222")
      let path = context.databaseDir;
      console.info('testErrorCode14800027Test0001'+ path);
      await rdbStore.insert("test", valueBucket0);
      await CreateCorruptDb();
      try{
        let num = await rdbStore.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 ************* num ' + num);
        expect(num != 1).assertFail();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 ************* err ' + err.code);
        expect(err.code == 14800021).assertEqual(true);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError21Test0003 end *************');
    })

    /**
     * @tc.name   RelationStoreError32Test0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1400
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0014 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows:number = trans.insertSync("test", valueBucket1);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0014 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0014 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0014 end *************');
    })

    /**
     * @tc.name   RelationStoreError17Test0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error17Test_0200
     * @tc.desc   Transaction goTo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError17Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError17Test0002 start *************');
        const STORE_CONFIG3: data_relationalStore.StoreConfig = {
          name: "testljj.db",
          securityLevel: data_relationalStore.SecurityLevel.S4
        }
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG3);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG3);
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError17Test0002 err *************  ' + err.code);
          expect(err.code == 14800017).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG3);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError17Test0002 end *************');
      })

    /**
     * @tc.name   RelationStoreError32Test0016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Error32Test_1600
     * @tc.desc   getColumnIndex normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RelationStoreError32Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0016 start *************');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      const valueBucket2 :data_relationalStore.ValuesBucket = {
        "data1": "hello",
        "data2": 10 as long,
        "data3": 1.0,
        "data4": new Uint8Array([1, 2, 3]),
      }
      await rdbStore.insert("test", valueBucket2);
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "hello");
      let trans = await rdbStore.createTransaction();
      await rdbStore.execute("CREATE TRIGGER prevent_insert_example BEFORE INSERT ON test BEGIN SELECT RAISE(FAIL, '表example_table为只读模式'); END;");
      try{
        let rows =await trans.insert("test", valueBucket1, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0016 rows *************' + rows);
        expect(rows == 1).assertFail();
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }catch(err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0016 err *************' + err);
        expect(err.code == 14800032).assertEqual(true);
        trans.rollback();
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
        done();
      }
      hilog.info(domain, tag, '%{public}s', '************* RelationStoreError32Test0016 end *************');
    })

  })
}