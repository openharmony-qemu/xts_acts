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
import { BusinessError } from '@ohos.base';
import relationalStore from '@ohos.data.relationalStore';
import dataRdb from '@ohos.data.relationalStore';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let num = 'a'.repeat(1024*1024*2);
const valueBucket2m: relationalStore.ValuesBucket = {
  'name': num,
  'age': 19 as long,
};
const valueBucket2k: relationalStore.ValuesBucket = {
  'name': "zhangsan",
  'age': 19 as long,
};
let dataBaseDir : String;
let domain: int  = 0x0000;
let tag: string = 'RdbErrorCode14800012';
const TAG = "[ttt]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER," + "salary  REAL," + "data BLOB)";
const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";


const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test0012.db",
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

export async function attachBatchInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": "18",
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray = new Array<data_relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

const valueBucketEqual2m: relationalStore.ValuesBucket = {
  'name': num,
};


export default function RdbErrorCode14800012() {

  describe("RdbErrorCode14800012", (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });

    beforeEach(async(): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(CREATE_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST1);
      await rdbStore.execute(CREATE_TABLE_EMPLOYEE);
      let num = await rdbStore.batchInsert("test", vbs);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: creat rdbStore success');
    })

    afterAll(async () : Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name   testgetColumnTypeSync0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0400
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeSync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeSync0400 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        resultSet?.getColumnTypeSync(0);
        console.error(TAG + "testgetColumnTypeSync0400 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeSync0400 getColumnType failed " + err);
        expect(14800012).assertEqual(err.code);
        resultSet?.close();
        done();
      }
    });


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err: BusinessError) {
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400 getColumnType success ");
        await resultSet.getColumnType(0);
        expect(true).assertFail();
        done();;
      } catch (err: BusinessError) {
        expect(14800012).assertEqual(err.code);
        resultSet.close();
        done();
        console.error(TAG + "SUB_DistributedData_RelationalStore_SDK_ResultSetJS_EtsAPI16getColumnTypeTest_0400 getColumnType failed " + err);
      }
    });

    /**
     * @tc.name   errcode002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10100
     * @tc.desc   offsetAs errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* errcode002 start *************");
      let resultSet:relationalStore.ResultSet;
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates)
      console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
      try{
        resultSet.goTo(980);
        resultSet.goToRow(980);
        resultSet.goToFirstRow();
        resultSet.goToNextRow();
        resultSet.goToPreviousRow();
        resultSet.getBlob(5);
        resultSet.getString(5);
        resultSet.getLong(5);
        resultSet.getDouble(5);
        resultSet.getAsset(5);
        resultSet.getAssets(5);
        resultSet.getValue(5);
        resultSet.getRow();
        resultSet.getRows(5);
        resultSet.isColumnNull(-1);
        resultSet.close();
        expect().assertFail();
        resultSet.close();
      }catch(err: BusinessError){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode002 end *************");
    })

    /**
     * @tc.name   relationalStoreTest029
     * @tc.number relationalStoreTest029
     * @tc.desc   insertSync para greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* relationalStoreTest029 start *************");
      let resultSet:relationalStore.ResultSet|undefined;
      console.info(TAG + "************* relationalStoreTest029 insertSync start *************");
      rdbStore.insertSync("employee",valueBucket2m,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      console.info(TAG + "************* relationalStoreTest029 RdbPredicates start *************");
      let predicates = new relationalStore.RdbPredicates("employee")
      console.info(TAG + "************* relationalStoreTest029 query start *************");
      resultSet = await rdbStore.query(predicates);
      console.info(TAG + "************* relationalStoreTest029 goToFirstRow start *************");
      resultSet.goToFirstRow();
      try{
        console.info(TAG + "************* relationalStoreTest029 getString start *************");
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "relationalStoreTest029 name:" + name);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest029 end *************");
    })

    /**
     * @tc.name   relationalStoreTest031
     * @tc.number relationalStoreTest031
     * @tc.desc   insert para greater than 2MB queryLockedRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* relationalStoreTest031 start *************");
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore.insert("employee",valueBucket2k);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore.queryLockedRow(predicates);
      resultSet.goToFirstRow();
      try{
        console.info(TAG + "************* relationalStoreTest031 start getString *************");
        const name = resultSet?.getString(resultSet.getColumnIndex("name"));
        console.log(TAG + "relationalStoreTest031 name:" + name);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* relationalStoreTest031 end *************");
    })

    /**
     * @tc.name   relationalStoreTest043
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3800
     * @tc.desc   updateSync param equal 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* relationalStoreTest043 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      rdbStore?.updateSync(valueBucketEqual2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest043 end *************");
    })

    /**
     * @tc.name   relationalStoreTest035
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2000
     * @tc.desc   updateSync param greater than 2MB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* relationalStoreTest035 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      rdbStore?.updateSync(valueBucket2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      done();
      console.info(TAG + "************* relationalStoreTest035 end *************");
    })

  })

}