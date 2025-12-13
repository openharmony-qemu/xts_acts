import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Want } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'distributedTables';
const TAG = "[RdbErrorCode1480033]"
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_EMPLOYEE1 = "CREATE TABLE IF NOT EXISTS employee1 (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore33.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: data_relationalStore.StoreConfig = {
  name: "myRdbStore33.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext;
let rdbStore: data_relationalStore.RdbStore | undefined | null;
let dataBaseDir: String;

async function createTest() {
  console.log(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10 as long,
      "data3": 1.0,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5 as long,
      "data3": 2.5,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3 as long,
      "data3": 1.8,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
  }
  console.log(TAG + "createTest data end");
}

async function attachInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  await store.insert(tableName, valueBucket);
}

async function insertCheck(store: data_relationalStore.RdbStore, tableName: string, ret: int) {
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  let resultSet = await store.query(predicates);
  let count = resultSet.rowCount;
  //expect(ret).assertEqual(count);
  resultSet.close();
}

async function updateCheck(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([4, 5, 6]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "lisi",
    "age": 20 as long,
    "salary": 200.5,
    "blobType": u8,
  };
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  predicates.equalTo("id", "1");
  let ret = await store.update(valueBucket, predicates);
  expect(1).assertEqual(ret);
}

async function attachBatchInsert(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray = new Array<data_relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

async function deleteCheck(store: data_relationalStore.RdbStore, tableName: string, count: int) {
  let predicates = new data_relationalStore.RdbPredicates(tableName);
  let ret = await store.delete(predicates);
  //expect(count).assertEqual(ret);
}

async function attachCheck(store: data_relationalStore.RdbStore) {
  await attachInsert(store, "test");
  await insertCheck(store, "test", 2);
  await updateCheck(store, "test");
  await attachBatchInsert(store, "test");
  await insertCheck(store, "test", 12);
  await deleteCheck(store, "test", 12);

  await attachInsert(store, "test1");
  await insertCheck(store, "test1", 1);
  await updateCheck(store, "test1");
  await attachBatchInsert(store, "test1");
  await insertCheck(store, "test1", 11);
  await deleteCheck(store, "test1", 11);
}

export default function rdbErrorCode14800033() {

  describe("rdbErrorCode14800033", (): void => {
    beforeAll(async (): Promise<void> => {
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want: Want = {
        bundleName: "com.example.relationalstore",
        abilityName: "EntryAbility"
      }
      delegator.startAbility(want)
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      let attachStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      console.info(TAG + 'beforeEach context databasedir: ' + context.databaseDir);
      dataBaseDir = context.databaseDir + "/rdb/";
      console.info(TAG + 'beforeEach STORE_CONFIG1 success');
      await attachStore.executeSql(CREATE_TABLE_TEST1);
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      dataBaseDir = context.databaseDir + "/rdb/";
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_EMPLOYEE1);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30.0,
        "salary": 2000.0,
        "data4": u8
      }
      const valueBucket2: data_relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31.0,
        "salary": 2000.0,
        "data4": u8
      }
      await rdbStore!.insert("employee1", valueBucket);
      await rdbStore!.insert("employee1", valueBucket2);
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      console.info(TAG + "*************Unit Test end*************");
    });

    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0200
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30.0,
        "salary": 2000.0
      }
      try {
        rdbStore!.insertSync("test", valueBucket);
        expect().assertFail();
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest001 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
      done();
    })

    /**
     * @tc.name   relationalStoreTest002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0300
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest002 start *************");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30.0,
        "salary": 2000.0
      }
      try {
        rdbStore!.insertSync("test", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
        expect().assertFail();
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest002 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      console.info(TAG + "************* relationalStoreTest002 end *************");
      done();
    })

    /**
     * @tc.name   relationalStoreTest003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0500
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest003 start *************");
      let values: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>();
      const valueBucket: data_relationalStore.ValuesBucket = {
        "id": "abc",
        "name": "Jim",
        "age": 30.0,
        "salary": 2000.0
      }
      values.push(valueBucket)
      try {
        rdbStore!.batchInsertSync("test", values);
        console.info(TAG + "relationalStoreTest003 success ");
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest003 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      console.info(TAG + "************* relationalStoreTest003 end *************");
      done();
    })


    /**
     * @tc.name   relationalStoreTest006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0600
     * @tc.desc   update success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest006 start *************");
      const valueBucket: data_relationalStore.ValuesBucket = {
        "age": 30.0,
        "salary": 2000.0
      }
      try {
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Jim");
        rdbStore!.updateSync(valueBucket, predicates);
        console.info(TAG + `relationalStoreTest006 updateSync is successful`);
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest006 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0700
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest006 start *************");
      try {
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Jim");
        rdbStore!.deleteSync(predicates);
        console.info(TAG + "deleteSync success ");
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest012 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })


    /**
     * @tc.name   relationalStoreTest015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0800
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
    //   console.log(TAG + "************* relationalStoreTest015 start *************");
    //   await rdbStore!.setDistributedTables(
    //     ["employee1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, { autoSync: false });
    //   try {
    //     let PRIKey: data_relationalStore.PRIKeyType[] = [1 as long, 2 as long];
    //     await rdbStore!.getModifyTime("employee1", "id", PRIKey);
    //   } catch (err: Error) {
    //     console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
    //     expect(err.code).assertEqual(14800033);
    //   }
    //   console.log(TAG + "************* relationalStoreTest015 end *************");
    //   done();
    // })


    /**
     * @tc.name   relationalStoreTest017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0900
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest017 start *************");
      try {
        await rdbStore!.cleanDirtyData('employee', 100).then(() => {
          console.info(TAG + 'clean dirty data  succeeded');
        }).catch((err: Error) => {
          console.error(TAG + `clean dirty data failed, code is ${err.code},message is ${err.message}`);
        });
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest017 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })


    /**
     * @tc.name   relationalStoreTest022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01100
     * @tc.desc   executeSync success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest022 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM employee1';
      try {
        rdbStore!.executeSync(SQL_DELETE_TABLE);
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest022 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01200
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest032 start *************");
      try {
        await rdbStore!.backup("backup.db");
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest032 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01300
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest033 start *************");
      await rdbStore!.backup("backup2.db");
      try {
        await rdbStore!.restore("backup2.db");
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest033 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testGetRows0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetEtsAPITest_0100
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let predicates = new data_relationalStore.RdbPredicates('employee1');
      let resultSet = await rdbStore!.query(predicates);
      expect(true).assertEqual(resultSet.goToFirstRow())
      try {
        resultSet.getRows(50, 50)
        resultSet.close();
      } catch (e: Error) {
        console.error(TAG + `getRow failed, code is ${e.code},message is ${e.message}`);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testRdbStoreUnLockRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0300
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreUnLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreUnLockRow0003 start *************");
      await rdbStore!.setDistributedTables(["employee1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new data_relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        await rdbStore!.unlockRow(predicates);
      } catch (e: Error) {
        console.error(TAG + `unlockRow failed, code is ${e.code},message is ${e.message}`);
        expect(14800033).assertEqual(e.code);
      }
      console.log(TAG + "************* testRdbStoreUnLockRow0003 end   *************");
      done();
    });

    /**
     * @tc.name   testRdbStoreLockRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0400
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreLockRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreLockRow0003 start *************");
      await rdbStore!.setDistributedTables(["employee1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD);
      try {
        let predicates = new data_relationalStore.RdbPredicates("employee1");
        predicates.equalTo("id", "1");
        await rdbStore!.lockRow(predicates);
      } catch (e: Error) {
        console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
        expect(14800033).assertEqual(e.code);
      }
      done();
      console.log(TAG + "************* testRdbStoreLockRow0003 end   *************");
    })

    /**
     * @tc.name   testRdbStoreQueryLockedRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0500
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreQueryLockedRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbStoreQueryLockedRow0003 start *************");
        try {
          let predicates = new data_relationalStore.RdbPredicates("test");
          predicates.equalTo("name", "Jim");
          await rdbStore!.queryLockedRow(predicates, []);
        } catch (e: Error) {
          console.error(TAG + `lockRow failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        console.log(TAG + "************* testRdbStoreQueryLockedRow0003 end   *************");
        done();
      })

    /**
     * @tc.name   relationalStoreTest023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_01400
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest023 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM employee1';
      try {
        await rdbStore!.execute(SQL_DELETE_TABLE);
      } catch (e: Error) {
        console.error(TAG + "relationalStoreTest023 fail code is " + e.code + " message is " + e.message);
        expect(14800033).assertEqual(e.code);
      }
      done();
    })

    /**
     * @tc.name   testgetColumnTypeSyncErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5100
     * @tc.desc   getColumnTypeSync errcode is 14800033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testgetColumnTypeSyncErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void) => {
    //     console.log(TAG + "************* testgetColumnTypeSyncErrcode0200 start *************");
    //     await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
    //     await createTest();
    //     try {
    //       const valueBucket: data_relationalStore.ValuesBucket = {
    //         "data1": null,
    //         "data2": null,
    //         "data3": null,
    //         "data4": null,
    //         "data5": null,
    //         "data6": null,
    //         "data7": null,
    //         "data8": null
    //       };
    //       await rdbStore!.insert("employee", valueBucket);
    //     } catch (err: Error) {
    //       console.error(TAG + "testgetColumnTypeSyncErrcode0200 insert failed " + err);
    //     }
    //     try {
    //       let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM employee");
    //       let count = resultSet.rowCount;
    //       expect(true).assertEqual(resultSet?.goToRow(count - 1));
    //       let type:data_relationalStore.ColumnType;
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
    //       expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
    //       resultSet?.close();
    //       done();
    //     } catch (err: Error) {
    //       console.error(TAG + "testgetColumnTypeSync0200  failed " + err.code + err.message);
    //       expect(14800033).assertEqual(err.code);
    //       done();
    //     }
    //     done();
    //     console.log(TAG + "************* testgetColumnTypeSyncErrcode0200 end *************");
    //   });

    /**
     * @tc.name   testgetColumnTypeErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionEtsAPI16Test_5400
     * @tc.desc   getColumnType errcode is 14800033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testgetColumnTypeErrcode0200 start *************");
      try {
        await rdbStore!.execute(CREATE_TABLE_EMPLOYEE);
        await createTest();
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
          "data2": null,
          "data3": null,
          "data4": null,
          "data5": null,
          "data6": null,
          "data7": null,
          "data8": null
        };
        await rdbStore!.insert("employee", valueBucket);
      } catch (err: Error) {
        console.error(TAG + "testgetColumnTypeErrcode0200 insert failed " + err);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM employee");
        let count = resultSet.rowCount;
        expect(true).assertEqual(resultSet!.goToRow(count - 1));
        let type = data_relationalStore.ColumnType.NULL;
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("id"));
        expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data1"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data2"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data3"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data4"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data5"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data6"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data7"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        type = await resultSet!.getColumnType(resultSet!.getColumnIndex("data8"));
        expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
        resultSet?.close();
        done();
      } catch (err: Error) {
        console.error(TAG + "testgetColumnTypeErrcode0200  failed " + err.code + err.message);
        expect(14800033).assertEqual(err.code);
        done();
      }
      done();
      console.log(TAG + "************* testgetColumnTypeErrcode0200 end *************");
    });

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0600
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0600
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0600 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "id": "sdf",
            "name": "zhangsan",
            "age": 18.0,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          await (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolution("test", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "batchInsertWithConflictResolution failed");
          done();
        } catch (err: Error) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0600 end *************");
      })

    /**
     * @tc.name   testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600
     * @tc.number testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600
     * @tc.desc   testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "id": "sdf",
            "name": "zhangsan",
            "age": 18.0,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
          for (let i = 0; i < 3; i++) {
            valueBucketArray.push(valueBucket);
          }
          (rdbStore as data_relationalStore.RdbStore).batchInsertWithConflictResolutionSync("test",
            valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_FAIL);
          console.log(TAG + "testRdbStorebatchInsertWithConflictResolutionSync failed");
          done();
        } catch (err: Error) {
          console.log(TAG + err + "testRdbStorebatchInsertWithConflictResolutionSync failed" + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG +
          "************* testRdbStorebatchInsertWithConflictResolutionSyncErrcode0600 end *************");
      })

 


    /**
     * @tc.name   testRdbStoreTrans004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0800
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans004 start *************");
      await rdbStore!.createTransaction().then(async (transaction: data_relationalStore.Transaction) => {
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30.0,
          "salary": 2000.0
        }
        let valueBuckets = new Array<data_relationalStore.ValuesBucket>(valueBucket1);
        try {
          let rowId: number = transaction.batchInsertSync("test", valueBuckets);
          transaction.commit();
          console.info(TAG + `batchInsertSync is successful, rowId = ${rowId}`);
          expect().assertFail();
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `batchInsertSync is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
          done();
        }
        ;
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect(14800033).assertEqual(err.code);
        done();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans004 end   *************");
    })


    /**
     * @tc.name   testTransactionBatchInsertWithConflictResolutionErrcode0400
     * @tc.number testTransactionBatchInsertWithConflictResolutionErrcode0400
     * @tc.desc   testTransactionBatchInsertWithConflictResolutionErrcode0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransactionBatchInsertWithConflictResolutionErrcode0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testTransactionBatchInsertWithConflictResolutionErrcode0400 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "zhangsan",
            "age": 18 as long,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);

          }
          await transaction.batchInsertWithConflictResolution("test", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0400 error");
          expect(null).assertFail()
          done();
        } catch (err: Error) {
          console.log(TAG + err + " code: " + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "testTransactionBatchInsertWithConflictResolutionErrcode0400 end");
      })


    /**
     * @tc.name   testTransactionBatchInsertWithConflictResolutionSyncErrcode0300
     * @tc.number testTransactionBatchInsertWithConflictResolutionSyncErrcode0300
     * @tc.desc   testTransactionBatchInsertWithConflictResolutionSyncErrcode0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTransactionBatchInsertWithConflictResolutionSyncErrcode0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 start *************");
        let u8 = new Uint8Array([1, 2, 3]);
        let transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "id": "abc",
            "name": "zhangsan",
            "age": 18.0,
            "salary": 100.5,
            "blobType": u8,
          };
          let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
          for (let i = 0; i < 2; i++) {
            valueBucketArray.push(valueBucket);
          }
          transaction.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          console.log(TAG + "testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 error");
          expect(null).assertFail()
          done();
        } catch (err: Error) {
          console.log(TAG + err + " code: " + err.code);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(TAG + "testTransactionBatchInsertWithConflictResolutionSyncErrcode0300 end");
      })

    /**
     * @tc.name   testRdbStoreTrans008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRow_0900
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans008 start *************");
      await rdbStore!.createTransaction().then(async (transaction: data_relationalStore.Transaction) => {
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "Jim");
        try {
          let rowId: number = transaction.deleteSync(predicates);
          transaction.commit();
          console.info(TAG + `deleteSync is successful, rowId = ${rowId}`);
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `deleteSync is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        ;
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans008 end   *************");
    })

    /**
     * @tc.name   testRdbStoreTrans010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ROLLBACK_0300
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans010 start *************");
      await rdbStore!.createTransaction().then(async (transaction: data_relationalStore.Transaction) => {
        try {
          const SQL_DELETE_TABLE = 'DELETE FROM employee1';
          await transaction.execute(SQL_DELETE_TABLE);
          transaction.commit();
          console.info(TAG + `execute is successful`);
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `execute is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        ;
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans010 end   *************");
    });

    /**
     * @tc.name   testRdbStoreTrans009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ROLLBACK_0300
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans009 start *************");
      await rdbStore!.createTransaction().then(async (transaction: data_relationalStore.Transaction) => {
        try {
          const SQL_DELETE_TABLE = 'DELETE FROM employee1';
          transaction.executeSync(SQL_DELETE_TABLE);
          transaction.commit();
          console.info(TAG + `executeSync is successful`);
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `executeSync is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        ;
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans009 end   *************");
    })

    /**
     * @tc.name   testRdbStoreTrans001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ROLLBACK_0800
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans001 start *************");
      await rdbStore!.createTransaction().then((transaction: data_relationalStore.Transaction) => {
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30.0,
          "salary": 2000.0
        }
        try {
          let rowId: number = (transaction as data_relationalStore.Transaction).insertSync("test", valueBucket1,
            data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          transaction.commit();
          console.info(TAG + `Insert is successful, rowId = ${rowId}`);
          expect().assertFail();
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `Insert is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        }
        ;
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans001 end   *************");
    })

    /**
     * @tc.name   testRdbStoreTrans005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UPDATESYNC_0300
     * @tc.desc   Configure predicates (TABLE name: "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreTrans005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreTrans005 start *************");
      await rdbStore!.createTransaction().then(async (transaction: data_relationalStore.Transaction) => {
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30.0,
          "salary": 2000.0
        }
        let predicates = new data_relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        try {
          let rowId: number =
            transaction.updateSync(valueBucket1, predicates,
              data_relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK);
          transaction.commit();
          console.info(TAG + `updateSync is successful, rowId = ${rowId}`);
          expect().assertFail();
        } catch (e: Error) {
          transaction.rollback();
          console.error(TAG + `updateSync is failed, code is ${e.code},message is ${e.message}`);
          expect(14800033).assertEqual(e.code);
        };
      }).catch((err: Error) => {
        console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      });
      done();
      console.log(TAG + "************* testRdbStoreTrans004 end   *************");
    })

  })
}