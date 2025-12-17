import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TAG = "[RdbErrorCode14800011]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST2 = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "dec TEXT)";


const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "Resultset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "Resultset1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  isReadOnly:false
}
let rdbStore:data_relationalStore.RdbStore | undefined | null;
const dbName = "Resultset.db"
const dbPath = "/data/storage/el2/database/entry/rdb/" + dbName;
const dbPathWal = "/data/storage/el2/database/entry/rdb/" + dbName + "-wal";
const dbPathShm = "/data/storage/el2/database/entry/rdb/" + dbName + "-shm";

const dbName1 = "Resultset.db"
const dbPath1 = "/data/storage/el2/database/entry/rdb/" + dbName;
const dbPathWal1 = "/data/storage/el2/database/entry/rdb/" + dbName + "-wal";
const dbPathShm1 = "/data/storage/el2/database/entry/rdb/" + dbName + "-shm";
async function createTest(): Promise<void> {
  console.log(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello",
      "data2": 10.0,
      "data3": 1.0,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5.0,
      "data3": 2.5,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3.0,
      "data3": 1.8,
      "data4": u8,
    };
    await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
  }
  console.log(TAG + "createTest data end");
  return new Promise<void>(():void => {});
}

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4);
    fs.truncateSync(dbPathShm, 4);
    let file = fs.openSync(dbPath, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd);
    fs.closeSync(file);
  } catch (err: Error) {
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}

async function CreateCorruptDb1() {
  try {
    let fileExist = fs.accessSync(dbPath1);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal1, 4);
    fs.truncateSync(dbPathShm1, 4);
    let file = fs.openSync(dbPath1, fs.OpenMode.READ_WRITE);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd);
    fs.closeSync(file);
  } catch (err: Error) {
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}

export default function RdbErrorCode14800011() {

  describe("RdbErrorCode14800011", (): void => {
    beforeAll(async(): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'RdbErrorCode14800011 beforeAll');
      //abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'beforeAll:' + context.databaseDir);
    });

    beforeEach(async(): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: creat rdbStore success');
    })

    afterEach(async(): Promise<void> => {

    })

    /**
     * @tc.name   testGetColumnTypeSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetColumnTypeSyncTest_1000
     * @tc.desc   getColumnTypeSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetColumnTypeSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testGetColumnTypeSyncErrcode0100 start *************");
      try {
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
        let a:long = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 end insert`);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 + ${err}`);
      }
      try {
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
        let count = resultSet.rowCount;
        hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 count=${count}`);
        expect(true).assertEqual(resultSet?.goToRow(count - 1));
        let type: data_relationalStore.ColumnType | null = null;
        hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 start CreateCorruptDb`);
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testGetColumnTypeSyncErrcode0100 end CreateCorruptDb');
        type = resultSet.getColumnTypeSync(0 as int)!;
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testGetColumnTypeErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetColumnTypeTest_1000
     * @tc.desc   getColumnType errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testGetColumnTypeErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testGetColumnTypeErrcode0100 start *************");
    //   try {
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "data1": null,
    //       "data2": null,
    //       "data3": null,
    //       "data4": null,
    //       "data5": null,
    //       "data6": null,
    //       "data7": null,
    //       "data8": null
    //     };
    //     let a:long = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testGetColumnTypeErrcode0100 + ${err}`);
    //   }
    //   try {
    //     let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
    //     let count = resultSet.rowCount;
    //     hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 count=${count}`);
    //     expect(true).assertEqual(resultSet?.goToRow(count - 1));
    //     //let type: data_relationalStore.ColumnType | undefined = undefined;
    //     hilog.info(domain, tag, '%{public}s', `testGetColumnTypeSyncErrcode0100 start CreateCorruptDb`);
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testGetColumnTypeSyncErrcode0100 end CreateCorruptDb');
    //     await resultSet.getColumnType(0 as int)!;
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testGetColumnTypeErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testGetRowsErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetRowsTest_1000
     * @tc.desc   getRows errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testGetRowsErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testGetRowsErrcode0100 start *************");
    //   try {
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "data1": null,
    //       "data2": null,
    //       "data3": null,
    //       "data4": null,
    //       "data5": null,
    //       "data6": null,
    //       "data7": null,
    //       "data8": null
    //     };
    //     await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testGetRowsErrcode0100 + ${err}`);
    //   }
    //   try {
    //     let resultSet = await (rdbStore as data_relationalStore.RdbStore).querySql("SELECT * FROM test");
    //     let count = resultSet.rowCount;
    //     expect(true).assertEqual(resultSet?.goToRow(count - 1));
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testGetRowsErrcode0100 end CreateCorruptDb');
    //     let array:Array<data_relationalStore.ValuesBucket> | null = null;
    //     array = await resultSet?.getRows(count - 1)!;
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testGetRowsErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testAttachContextErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AttachContextTest_1000
     * @tc.desc   attachContext errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testAttachContextErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testAttachContextErrcode0100 start *************");
    //   try {
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testAttachContextErrcode0100 end CreateCorruptDb');
    //     let resulet: int = await rdbStore!.attach(context, STORE_CONFIG, "Resultset.db");
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testAttachContextErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testAttachFullPathErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_AttachFullPathTest_1000
     * @tc.desc   attachFullPath errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testAttachFullPathErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testAttachFullPathErrcode0100 start *************");
    //   try {
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testAttachFullPathErrcode0100 end CreateCorruptDb');
    //     const dbPath = context.databaseDir+"/rdb/Resultset.db";
    //     let resulet: int = await rdbStore!.attach(dbPath, "Resultset.db");
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testAttachFullPathErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testBackupErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupTest_1000
     * @tc.desc   backup errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testBackupErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testBackupErrcode0100 start *************");
    //   try {
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testBackupErrcode0100 end CreateCorruptDb');
    //     await rdbStore!.backup("Resultset.db");
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testBackupErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000
     * @tc.desc   Test Js Api relationalStore.insertSync() testcase Corrupt database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done: () => void): Promise<void> => {
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000');
      let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore1!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18.0 as long,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
      rdbStore1!.batchInsertSync("test1", valueBuckets);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      let res = rdbStore1.querySync(predicates);
      await CreateCorruptDb1();
      try{
        let res = rdbStore1.batchInsertSync("test1", valueBuckets);
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000`+  res)
      } catch (err: BusinessError) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000 err.code ${err.code}, err.message ${err.message}`)
        expect(14800011).assertEqual(err.code);
      }
      res.close();
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
      console.info('SUB_DistributedData_RelationalStore_SDK_SyncAPITest_4000');
      done();
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionTest_1000
     * @tc.desc   batchInsertWithConflictResolution errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testBatchInsertWithConflictResolutionErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testBatchInsertWithConflictResolutionErrcode0100 start *************");
      try {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testBatchInsertWithConflictResolutionErrcode0100 end CreateCorruptDb');
        let conflict: data_relationalStore.ConflictResolution = data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await rdbStore!.batchInsertWithConflictResolution("test1",valueBuckets,conflict);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testBatchInsertWithConflictResolutionErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BatchInsertWithConflictResolutionSyncTest_1000
     * @tc.desc   batchInsertWithConflictResolutionSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testBatchInsertWithConflictResolutionSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testBatchInsertWithConflictResolutionSyncErrcode0100 start *************");
      try {
        let b2 = await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testBatchInsertWithConflictResolutionSyncErrcode0100 end CreateCorruptDb');
        let conflict: data_relationalStore.ConflictResolution = data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await rdbStore!.batchInsertWithConflictResolution("test1",valueBuckets,conflict);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testBatchInsertWithConflictResolutionSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testCleanDirtyDataErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_CleanDirtyDataTest_1000
     * @tc.desc   cleanDirtyData errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testCleanDirtyDataErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testCleanDirtyDataErrcode0100 start *************");
    //   try {
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testCleanDirtyDataErrcode0100 end CreateCorruptDb');
    //     await rdbStore!.cleanDirtyData("test1");
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testCleanDirtyDataErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testDeleteSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteSyncTest_1000
     * @tc.desc   deleteSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testDeleteSyncErrcode0100 start *************");
      try {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        rdbStore!.insertSync("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testDeleteSyncErrcode0100 end CreateCorruptDb');
        let result = rdbStore!.deleteSync(predicates);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testDeleteSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testDetachErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DetachTest_1000
     * @tc.desc   detach errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDetachErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testDetachErrcode0100 start *************");
      try {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testDetachErrcode0100 end CreateCorruptDb');
        let result = await rdbStore!.detach('Resultset.db');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testDetachErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testExecuteSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteSyncTest_1000
     * @tc.desc   executeSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testExecuteSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testExecuteSyncErrcode0100 start *************");
      try {
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testExecuteSyncErrcode0100 end CreateCorruptDb');
        rdbStore!.executeSync(CREATE_TABLE_TEST1);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testExecuteSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testGetModifyTimeErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GetModifyTimeTest_1000
     * @tc.desc   getModifyTime errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testGetModifyTimeErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testGetModifyTimeErrcode0100 start *************");
    //   rdbStore!.executeSync(CREATE_TABLE_TEST1);
    //   const u8 = new Uint8Array([1, 2, 3]);
    //   const valueBucket: data_relationalStore.ValuesBucket = {
    //     "name": "zhangsan",
    //     "age": 20 as long,
    //     "salary": 220.5,
    //     "blobType": u8,
    //   };
    //   await rdbStore!.insert("test1", valueBucket);
    //   let PRIKey: data_relationalStore.PRIKeyType[] = [0 as long];
    //   try {
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testGetModifyTimeErrcode0100 end CreateCorruptDb');
    //     await rdbStore!.getModifyTime("test1", "NAME", PRIKey);
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testGetModifyTimeErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);;
    //     done();
    //   }
    // })

    /**
     * @tc.name   testInsertSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSyncTest_1000
     * @tc.desc   insertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testInsertSyncErrcode0100 start *************");
      try {
        rdbStore!.executeSync(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testInsertSyncErrcode0100 end CreateCorruptDb');
        rdbStore!.insertSync("test1", valueBucket);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testInsertSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testLockRowErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_LockRowTest_2000
     * @tc.desc   LockRow errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testLockRowErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done: () => void): Promise<void> => {
    //   let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
    //   await rdbStore1!.execute(CREATE_TABLE_TEST1);
    //   let u8 = new Uint8Array([1, 2, 3]);
    //   const valueBucket:data_relationalStore.ValuesBucket = {
    //     "name": "zhangsan",
    //     "age": 18 as long,
    //     "salary": 100.5,
    //     "blobType": u8,
    //   }
    //   let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
    //   rdbStore1.batchInsertSync("test1", valueBuckets);
    //   let predicates = new data_relationalStore.RdbPredicates("test1");
    //   predicates.equalTo("NAME", "zhangsan");
    //   await CreateCorruptDb1();
    //   hilog.info(domain, tag, '%{public}s', 'testLockRowErrcode0100 end CreateCorruptDb');
    //   try{
    //     await rdbStore1.lockRow(predicates);
    //   } catch (err: BusinessError) {
    //     console.info(TAG, `testLockRowErrcode0100 err.code ${err.code}, err.message ${err.message}`)
    //     expect(14800011).assertEqual(err.code);
    //   }
    //   await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
    //   console.info('testLockRowErrcode0100');
    //   done();
    // })

    /**
     * @tc.name   testQueryLockedRowErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryLockedRowTest_2000
     * @tc.desc   QueryLockedRow errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryLockedRowErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'testQueryLockedRowErrcode0100 start');
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5,
        "blobType": u8,
      }
      let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
      hilog.info(domain, tag, '%{public}s', 'testQueryLockedRowErrcode0100 batchInsertSync start');
      rdbStore!.batchInsertSync("test1", valueBuckets);
      hilog.info(domain, tag, '%{public}s', 'testQueryLockedRowErrcode0100 RdbPredicates start');
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("name", "zhangsan");
      hilog.info(domain, tag, '%{public}s', 'testQueryLockedRowErrcode0100 CreateCorruptDb start');
      await CreateCorruptDb();
      hilog.info(domain, tag, '%{public}s', 'testQueryLockedRowErrcode0100 end CreateCorruptDb');
      try{
        await rdbStore!.queryLockedRow(predicates);
      } catch (err: BusinessError) {
        console.info(TAG, `testQueryLockedRowErrcode0100 err.code ${err.code}, err.message ${err.message}`)
        expect(14800011).assertEqual(err.code);
      }
      console.info('testQueryLockedRowErrcode0100');
      done();
    })

    /**
     * @tc.name   testRestoreErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RestoreTest_1000
     * @tc.desc   restore no argument errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testRestoreErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testRestoreErrcode0100 start *************");
    //   try {
    //     rdbStore!.executeSync(CREATE_TABLE_TEST1);
    //     const u8 = new Uint8Array([1, 2, 3]);
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "name": "zhangsan",
    //       "age": 20 as long,
    //       "salary": 220.5,
    //       "blobType": u8,
    //     };
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testRestoreErrcode0100 end CreateCorruptDb');
    //     await rdbStore!.restore();
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testRestoreErrcode0100 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);;
    //     done();
    //   }
    // })

    /**
     * @tc.name   testRestoreErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RestoreTest_2000
     * @tc.desc   restore has argument errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testRestoreErrcode0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testRestoreErrcode0200 start *************");
    //   try {
    //     rdbStore!.executeSync(CREATE_TABLE_TEST1);
    //     const u8 = new Uint8Array([1, 2, 3]);
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "name": "zhangsan",
    //       "age": 20 as long,
    //       "salary": 220.5,
    //       "blobType": u8,
    //     };
    //     await CreateCorruptDb();
    //     hilog.info(domain, tag, '%{public}s', 'testRestoreErrcode0200 end CreateCorruptDb');
    //     await rdbStore!.restore("Resultset.db");
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testRestoreErrcode0200 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);;
    //     done();
    //   }
    // })

    /**
     * @tc.name   testUnlockRowErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UnlockRowTest_2000
     * @tc.desc   unlockRow has argument errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it("testUnlockRowErrcode0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   hilog.info(domain, tag, '%{public}s', "************* testUnlockRowErrcode0200 start *************");
    //   try {
    //     let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
    //     await rdbStore1!.execute(CREATE_TABLE_TEST1);
    //     let u8 = new Uint8Array([1, 2, 3]);
    //     const valueBucket:data_relationalStore.ValuesBucket = {
    //       "name": "zhangsan",
    //       "age": 18.0 as long,
    //       "salary": 100.5,
    //       "blobType": u8,
    //     }
    //     let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
    //     rdbStore1.batchInsertSync("test1", valueBuckets);
    //     let predicates = new data_relationalStore.RdbPredicates("test1");
    //     predicates.equalTo("NAME", "zhangsan");
    //     //await rdbStore1.lockRow(predicates);
    //     await CreateCorruptDb1();
    //     hilog.info(domain, tag, '%{public}s', 'testUnlockRowErrcode0200 end CreateCorruptDb');
    //     await rdbStore1.unlockRow(predicates);
    //     done();
    //   } catch (err: BusinessError) {
    //     hilog.info(domain, tag, '%{public}s', `testUnlockRowErrcode0200 + ${err.code} + ${err.message}`);
    //     expect(14800011).assertEqual(err.code);;
    //     await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
    //     done();
    //   }
    // })

    /**
     * @tc.name   testUpdateSyncErrcode0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSyncTest_1000
     * @tc.desc   updateSync has argument errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testUpdateSyncErrcode0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testUpdateSyncErrcode0100 start *************");
      try {
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore1!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket, valueBucket, valueBucket);
        rdbStore1.batchInsertSync("test1", valueBuckets);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await CreateCorruptDb1();
        hilog.info(domain, tag, '%{public}s', 'testUpdateSyncErrcode0100 end CreateCorruptDb');
        let rows: Number = rdbStore1.updateSync(valueBucket1, predicates);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `testUpdateSyncErrcode0100 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG1);
        done();
      }
    })

    /**
     * @tc.name   testBatchInsertSyncErrTest0200
     * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0100
     * @tc.desc   Test batchInsertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertSyncErrTest0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): void => {
        let transaction: data_relationalStore.Transaction;
        try {
          await rdbStore!.execute(CREATE_TABLE_TEST1);
          transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
          await CreateCorruptDb();
          hilog.info(domain, tag, '%{public}s','testBatchInsertSyncErrTest0200 end CreateCorruptDb');
          let u8 = new Uint8Array([1, 2, 3]);
          const valueBucket: data_relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 18.0 as long,
            "salary": 100.5,
            "blobType": u8,
          }
          let valueBuckets: Array<data_relationalStore.ValuesBucket> =
            new Array<data_relationalStore.ValuesBucket>(valueBucket);
          let insertNum: number =
            transaction.batchInsertSync("test1", valueBuckets);
          done();
        } catch(err: BusinessError) {
          await transaction.rollback();
          hilog.info(domain, tag, '%{public}s', `testBatchInsertSyncErrTest0200 + ${err.code} + ${err.message}`);
          expect(14800011).assertEqual(err.code);;
          done();
        }
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_batchInsertWithConflictResolution_ErrTest_0100
     * @tc.desc   Test batchInsertWithConflictResolution errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionErrcode0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): void => {
      let transaction: data_relationalStore.Transaction;
      try {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBuckets: Array<data_relationalStore.ValuesBucket> =
          new Array<data_relationalStore.ValuesBucket>(valueBucket);
        let conflict: data_relationalStore.ConflictResolution = data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s',
          'testBatchInsertWithConflictResolutionErrcode0200 end CreateCorruptDb');
        let insertNum: number =
         await transaction.batchInsertWithConflictResolution("test1", valueBuckets, conflict);
        done();
      } catch(err: BusinessError) {
        await transaction.rollback()
        hilog.info(domain, tag, '%{public}s', `testBatchInsertWithConflictResolutionErrcode0200 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testBatchInsertWithConflictResolutionSyncErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_batchInsertWithConflictResolutionSync_ErrTest_0100
     * @tc.desc   Test batchInsertWithConflictResolutionSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchInsertWithConflictResolutionSyncErrcode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): void => {
      let transaction: data_relationalStore.Transaction;
      try {
        hilog.info(domain, tag, '%{public}s', "************* testBatchInsertWithConflictResolutionSyncErrcode0200 start *************");
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBuckets: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>(valueBucket);
        hilog.info(domain, tag, '%{public}s', 'testBatchInsertWithConflictResolutionSyncErrcode0200 end CreateCorruptDb');
        let conflict: data_relationalStore.ConflictResolution = data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE;
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s','testBatchInsertWithConflictResolutionSyncErrcode0200 end CreateCorruptDb');
        let insertNum: number = transaction.batchInsertWithConflictResolutionSync("test1", valueBuckets, conflict);
        done();
      } catch(err: BusinessError) {
        await transaction.rollback()
        hilog.info(domain, tag, '%{public}s', `testBatchInsertWithConflictResolutionSyncErrcode0200 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testDeleteSyncErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteSyncTest_2000
     * @tc.desc   Transaction deleteSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testDeleteSyncErrcode0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testDeleteSyncErrcode0200 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        rdbStore!.insertSync("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        hilog.info(domain, tag, '%{public}s','testDeleteSyncErrcode0200 end createTransaction');
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s','testDeleteSyncErrcode0200 end CreateCorruptDb');
        let result =  transaction.deleteSync(predicates);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `testDeleteSyncErrcode0200 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testExecuteErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteTest_2000
     * @tc.desc   Transaction Execute errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testExecuteErrcode0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testExecuteErrcode0200 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        hilog.info(domain, tag, '%{public}s','testExecuteErrcode0200 end createTransaction');
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s','testExecuteErrcode0200 end CreateCorruptDb');
        let result =  await transaction.execute(CREATE_TABLE_TEST1);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `testExecuteErrcode0200 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testExecuteSyncErrcode0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ExecuteSyncTest_2000
     * @tc.desc   Transaction executeSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testExecuteSyncErrcode0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testExecuteSyncErrcode0200 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        hilog.info(domain, tag, '%{public}s','testExecuteSyncErrcode0200 end createTransaction');
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s','testExecuteSyncErrcode0200 end CreateCorruptDb');
        let result =  transaction.executeSync(CREATE_TABLE_TEST1);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `testExecuteSyncErrcode0200 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   testInsertSyncErrcode0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSyncTest_2000
     * @tc.desc   Transaction insertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testInsertSyncErrcode0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testInsertSyncErrcode0300 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        rdbStore!.executeSync(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        hilog.info(domain, tag, '%{public}s','testExecuteSyncErrcode0200 end createTransaction');
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'testInsertSyncErrcode0300 end CreateCorruptDb');
        transaction.insertSync("test1", valueBucket);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `testInsertSyncErrcode0300 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000
     * @tc.desc   Transaction insertSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        rdbStore!.executeSync(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction();
        hilog.info(domain, tag, '%{public}s','SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000 end createTransaction');
        transaction.insertSync("test1", valueBucket);
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000 end CreateCorruptDb');
        let array: Array<data_relationalStore.ValueType> = new Array<data_relationalStore.ValueType>("zhangsan");
        transaction.querySqlSync("select * from test where name = ?", array);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `SUB_DistributedData_RelationalStore_SDK_InsertSyncUint8ArrayTest_1000 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000
     * @tc.desc   Transaction updateSync errcode is 14800011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000 start *************");
      let transaction: data_relationalStore.Transaction;
      try {
        rdbStore!.executeSync(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 30 as long,
          "salary": 20.5,
          "blobType": u8,
        };
        transaction = await rdbStore!.createTransaction();
        hilog.info(domain, tag, '%{public}s','SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000 end createTransaction');
        transaction.insertSync("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        await CreateCorruptDb();
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000 end CreateCorruptDb');
        transaction.updateSync(valueBucket1, predicates);
        done();
      } catch (err: BusinessError) {
        await transaction.rollback();
        hilog.info(domain, tag, '%{public}s', `SUB_DistributedData_RelationalStore_SDK_UpdateSynctestUpdateSyncErrcode0200Test_1000 + ${err.code} + ${err.message}`);
        expect(14800011).assertEqual(err.code);
        done();
      }
    })

  })
}