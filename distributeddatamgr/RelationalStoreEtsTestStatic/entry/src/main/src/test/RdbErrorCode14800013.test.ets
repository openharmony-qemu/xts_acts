import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let dataBaseDir : String;
let domain: int  = 0x00ff;
let tag: string = 'rdbErrorCode14800013';
const TAG = "[ttt]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :data_relationalStore.StoreConfig = {
  name: "test3.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

const TABLE_NAME = "testTrans"
let rdbStore : data_relationalStore.RdbStore
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

export default function rdbErrorCode14800013() {

  describe("rdbErrorCode14800013", (): void => {
    beforeAll(async () : Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.batchInsert("test", vbs);
      hilog.info(domain, tag, 'batchInsert %{public}d rows.', num);
    });

    afterAll(async () : Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })
    /**
     * @tc.name   testgetColumnTypeSync0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0500
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeSync0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.log(TAG + "************* testgetColumnTypeSync0500 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeSync0500 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet.columnCount;
        expect(9).assertEqual(columnCount);
        resultSet?.getColumnTypeSync(columnCount);
        console.error(TAG + "testgetColumnTypeSync0500 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err: BusinessError) {
        expect(14800013).assertEqual(err.code);
        resultSet?.close();
        done()
        console.error(TAG + "testgetColumnTypeSync0500 getColumnType failed " + err);
      }
      console.log(TAG + "************* testgetColumnTypeSync0500 end *************");
    });

    /**
     * @tc.name   testgetColumnTypeJsTest0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0600
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.log(TAG + "************* testgetColumnTypeJsTest0500 start *************");
      try {
        const valueBucket:data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest0500 insert failed " + err);
      }
      let resultSet:data_relationalStore.ResultSet;
      resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
      try {
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let columnCount = resultSet.columnCount;
        expect(9).assertEqual(columnCount);
        await resultSet.getColumnType(columnCount);
        console.error(TAG + "testgetColumnTypeJsTest0500 getColumnType success ");
        expect(true).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(TAG + "testgetColumnTypeJsTest0500 getColumnType failed " + err.code + err.message);
        expect(14800013).assertEqual(err.code);
        resultSet?.close();
        done();
      }
      console.log(TAG + "************* testgetColumnTypeJsTest0500 end *************");
    });

    /**
     * @tc.name   errcode006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_0600
     * @tc.desc   errcode is 14800013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + "************* errcode006 start *************");
      const CREATE_TABLE_TEST2 = "CREATE TABLE IF NOT EXISTS test2 (" + "id INTEGER PRIMARY KEY, " +
        "name TEXT NOT NULL, " + "age INTEGER, "  + "blobType BLOB)";
      await (rdbStore as data_relationalStore.RdbStore).execute(CREATE_TABLE_TEST2, []);
      let u8 = new Uint8Array([1,2,3]);
      const record:data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": "30",
        "blobType":u8,
      };
      await (rdbStore as data_relationalStore.RdbStore).insert("test2", record)
      let predicates = new data_relationalStore.RdbPredicates("test2");
      predicates.equalTo("age", "30");
      try{
        let resultSet =  await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount);
        resultSet.goToFirstRow();
        resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        resultSet.getString(resultSet.getColumnIndex("name"));
        resultSet.getRow();
        resultSet.getRows(1);
        //resultSet.getSendableRow();
        expect(resultSet.rowCount == 1).assertTrue();
        resultSet.close()
        done()
      }catch(err: BusinessError){
        console.log(TAG+"err.code"+err.code + "err.message"+err.message)
        expect(err.code == 14800013).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode006 end *************");
    })

  })

}