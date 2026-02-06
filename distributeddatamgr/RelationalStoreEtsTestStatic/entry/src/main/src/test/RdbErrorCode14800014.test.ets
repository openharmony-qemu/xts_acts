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
const TAG = "[RdbErrorCode14800014]"
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

let context: common.UIAbilityContext | undefined;
let dmInstance: distributedDeviceManager.DeviceManager;
let deviceId: string | undefined = undefined;
let rdbStore: data_relationalStore.RdbStore | undefined | null;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const DROP_TABLE_TEST = "DROP TABLE " + TABLE;

const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "Rst14.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG3: data_relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}


const asset1: data_relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2: data_relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: data_relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3: data_relationalStore.Asset = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: data_relationalStore.AssetStatus.ASSET_UPDATE,
}

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
    await rdbStore!.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "2",
      "data2": -5.0,
      "data3": 2.5,
      "data4": u8,
    };
    await rdbStore!.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: data_relationalStore.ValuesBucket = {
      "data1": "hello world",
      "data2": 3.0,
      "data3": 1.8,
      "data4": u8,
    };
    await rdbStore!.insert("test", valueBucket);
  }
  console.log(TAG + "createTest data end");
  return new Promise<void>((): void => {
  });
}

export default function RdbErrorCode14800014() {

  describe("RdbErrorCode14800014", (): void => {
    beforeAll(async (): Promise<void> => {
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want: Want = {
        bundleName: "com.example.relationalstore",
        abilityName: "EntryAbility"
      }
      delegator.startAbility(want)
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      //await createTest();
    });
    beforeEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: delete rdbStore success');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.execute(CREATE_TABLE_TEST);
      await rdbStore!.execute(CREATE_TABLE_TEST1);
      hilog.info(domain, tag, '%{public}s', 'beforeEach: creat rdbStore success');
      console.info(TAG + 'beforeEach');
      const valueBucket: data_relationalStore.ValuesBucket = {
        'name': 'zhangsan',
        'age': 18 as long,
        'salary': 25000 as long,
      };
      await rdbStore!.insert('test1', valueBucket);
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    });

    /**
     * @tc.name   testgetColumnTypeSync0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_0300
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeSync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testgetColumnTypeSync0300 start *************");
      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": null,
        };
        await rdbStore!.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0300 insert failed " + err);
      }
      try {
        let resultSet = await rdbStore!.querySql("SELECT * FROM test");
        let count = resultSet!.rowCount;
        expect(true).assertEqual(resultSet!.goToRow(count - 1)!);
        resultSet!.close();
        resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id")!);
        console.error(TAG + "testgetColumnTypeSync0300 getColumnTypeSync success");
        expect(true).assertFail();
        done();
      } catch (err) {
        console.error(TAG + "testgetColumnTypeSync0300 getColumnTypeSync failed. " + err);
        expect(14800014).assertEqual(err.code);
        done();
      }
      console.log(TAG + "************* testgetColumnTypeSync0300 end *************");
    });

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0100
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0100 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          await rdbStore!.batchInsertWithConflictResolution("test1", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err + "batchInsertWithConflictResolution failed" + err.code);
          expect(err.code == 14800014).assertTrue()
          done();
        }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0100 end *************");
      })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          rdbStore!.batchInsertWithConflictResolutionSync("test1", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
          done();
        }
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode0100 end *************");
      })

    /**
     * @tc.name   testRdbStorePerfStat0021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_2100
     * @tc.desc   1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testRdbStorePerfStat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
    //   console.log(TAG + "************* testRdbStorePerfStat0021 start *************");
    //   let observer = (SqlExeInfo: data_relationalStore.SqlExecutionInfo) => {
    //     expect().assertFail();
    //   };
    //   rdbStore!.close();
    //   try {
    //     rdbStore!.off('perfStat', observer);
    //     expect().assertFail();
    //     done();
    //   } catch (err) {
    //     console.log(TAG + "err:" + err.code + err.message);
    //     expect(14800014).assertEqual(err.code);
    //     done();
    //   }
    //   console.log(TAG + "************* testRdbStorePerfStat0021 end *************");
    // })

    /**
     * @tc.name   testRdbStorePerfStat0019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onPerfStatJsAPITest_1900
     * @tc.desc   1. Register callback for perfStat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testRdbStorePerfStat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
    //   console.log(TAG + "************* testRdbStorePerfStat0019 start *************");
    //   let observer = (SqlExeInfo: data_relationalStore.SqlExecutionInfo) => {
    //     expect().assertFail();
    //   };
    //   rdbStore!.close();
    //   try {
    //     rdbStore!.on('perfStat', observer);
    //     expect().assertFail();
    //     done();
    //   } catch (err) {
    //     console.log(TAG + "err" + err.code + err.message)
    //     expect(14800014).assertEqual(err.code);
    //     done();
    //   }
    //   console.log(TAG + "************* testRdbStorePerfStat0019 end *************");
    // })

    /**
     * @tc.name   testRdbStoreOnsqliteErrorOccurred0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_0100
     * @tc.desc   1.create db 2.close db 3.OnsqliteErrorOccurred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testRdbStoreOnsqliteErrorOccurred0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void) => {
    //     console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 start *************");
    //     try {
    //       rdbStore!.close();
    //       let exceptionMessage: data_relationalStore.ExceptionMessage;
    //       rdbStore!.on('sqliteErrorOccurred', exceptionMessage => {
    //         console.log(TAG + `error log is ${exceptionMessage.code}`)
    //         expect().assertFail();
    //         done();
    //       });
    //     } catch (err) {
    //       expect(14800014).assertEqual(err.code);
    //       console.log(TAG + `error is failed code:${err.code},message:${err.message}`);
    //       done();
    //     }
    //     console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurred0001 end *************");
    //   })

    /**
     * @tc.name   errcode038
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_13500
     * @tc.desc   rdbStore!.setDistributedTables  errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode038 start *************");
      await rdbStore!.close();
      try {
        await rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          { autoSync: true } as data_relationalStore.DistributedConfig)
      } catch (err) {
        console.info(TAG + "setDistributed002 failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800014).assertTrue()
      }
      console.info(TAG + "************* errcode038 end *************");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_DETACH_1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DETACH_1600
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_DETACH_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.info(TAG + "************* SUB_DistributedData_RelationalStore_SDK_DETACH_1600 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          await rdbStore!.detach("attachDB");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        console.info(TAG + "************* SUB_DistributedData_RelationalStore_SDK_DETACH_1600 end *************");
        done();
      })

    /**
     * @tc.name   testgetColumnTypeJsTest1700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSet_EtsAPI16Test_1700
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetColumnTypeJsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* testgetColumnTypeJsTest1700 start *************");
      try {
        let predicates = new data_relationalStore.RdbPredicates("test");
        await rdbStore!.delete(predicates);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "zhangsan",
        };
        await rdbStore!.insert("test", valueBucket);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1700 insert failed " + err);
      }
      let resultSet = await rdbStore!.querySql("SELECT data1 FROM test");
      let count = resultSet.rowCount;
      console.error(TAG + "testgetColumnTypeJsTest1700 rowCount " + count);
      expect(true).assertEqual(resultSet?.goToRow(count - 1));
      resultSet!.close();
      try {
        await resultSet!.getColumnType(0);
      } catch (err) {
        console.error(TAG + "testgetColumnTypeJsTest1700 success " + err.code + err.message);
        expect(14800014).assertEqual(err.code);
      }
      done();
      console.log(TAG + "************* testgetColumnTypeJsTest1700 end *************");
    });

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.log(TAG + "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100 start *************");
        const assets1 = [asset1];
        const assets2 = [asset1, asset2, asset3];
        let valuesBucket: data_relationalStore.ValuesBucket = {
          "data1": asset1,
          "data2": asset2,
          "data3": assets1,
        }
        await rdbStore!.insert("test", valuesBucket);
        let valuesBucket2: data_relationalStore.ValuesBucket = {
          "data1": asset2,
          "data2": asset3,
          "data3": assets2,
        }
        await rdbStore!.insert("test", valuesBucket2);
        let valuesBucket3: data_relationalStore.ValuesBucket = {
          "data1": asset1,
          "data3": new Array<data_relationalStore.Asset>()
        }
        await rdbStore!.insert("test", valuesBucket3);
        let predicates = new data_relationalStore.RdbPredicates("test");
        let resultSet: data_relationalStore.ResultSet = await rdbStore!.query(predicates);
        resultSet!.close();
        try {
          await resultSet.getRows(1);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code);
        }
        await rdbStore!.close();
        rdbStore = undefined;
        done();
        console.log(TAG + "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100 end *************");
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        const dbPath = context!.databaseDir + "/rdb/Rst14.db";
        try {
          rdbStore!.attach(dbPath, "attachDB").then((number: int) => {
            console.info('attach succeeded');
            expect().assertFail();
          }).catch((err: Error) => {
            console.error(`attach failed, code is ${err.code},message is ${err.message}`);
            expect(14800014).assertEqual(err.code);
          })
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0600
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0600
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        const dbPath = context!.databaseDir + "/rdb/Rst14.db";
        try {
          await rdbStore!.attach(context!, STORE_CONFIG3, "attachDB");
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.emit('storeObserver');
          expect().assertFail();
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.offAutoSyncProgress((progressDetail: data_relationalStore.ProgressDetails) => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2600
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2600
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.offDataChange(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<string>) => {
              expect().assertFail();
            })
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.offDataChange(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<data_relationalStore.ChangeInfo>) => {
              expect().assertFail();
            });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2800
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2800
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.offStatistics((sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.offStatistics((sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.onAutoSyncProgress((progressDetail: data_relationalStore.ProgressDetails) => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.onDataChange(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<string>) => {
              expect().assertFail();
            })
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, tag, '%{public}s', "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3200 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.onDataChange(data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
            (devices: Array<data_relationalStore.ChangeInfo>) => {
              expect().assertFail();
            });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        hilog.info(domain, tag, '%{public}s', "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3200 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.onStatistics((sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.on('storeObserver', false, () => {
            expect().assertFail();
          });
        } catch (err) {
          console.log(TAG + "err.code:" + err.code);
          expect(14800014).assertEqual(err.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.backup("TransactionTest.db")
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.restore().then(() => {
            console.info('Backup success.');
            expect().assertFail();
          }).catch((err: Error) => {
            console.log(TAG + "err.code:" + err.code);
            expect(14800014).assertEqual(err.code)
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.restore("TransactionTest.db").then(() => {
            console.info('Backup success.');
            expect().assertFail();
          }).catch((err: Error) => {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            expect(14800014).assertEqual(err.code)
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0800
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0800
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.batchInsertSync("test1", [valueBucket, valueBucket]);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
        console.log(TAG + "************* testGetAssets0001 end *************");
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.insertSync("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          expect().assertFail();
          ;
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
        console.log(TAG + "************* testGetAssets0001 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.batchInsertSync("test1", [valueBucket, valueBucket]);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
        console.log(TAG + "************* testGetAssets0001 end *************");
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.cleanDirtyData('test1', 10).then(() => {
            expect().assertFail();
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        let PRIKey: Array<data_relationalStore.PRIKeyType> = [1 as long, 4 as long, 2 as long, 3 as long];

        try {
          rdbStore!.getModifyTime("test1", "NAME", PRIKey)
            .then((modifyTime: data_relationalStore.ModifyTime) => {
              expect().assertFail();
            })
            .catch((err: Error) => {
              console.log(TAG + "err.code:" + err.code);
              expect(14800014).assertEqual(err.code);
            });
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12001
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12001
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        let deviceIds: Array<string> = [];
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          rdbStore!.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates)
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code);
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect().assertFail();
            });
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          await rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, ["test1"],
            (progressDetail: data_relationalStore.ProgressDetails) => {
              console.info(`progress: ${progressDetail}`);
              expect().assertFail();
            });
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, tag, '%{public}s',
          "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400 close succeeded`);
        } catch (err) {
          console.error(`${TAG} SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400 close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.obtainDistributedTableName("", "EMPLOYEE");
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code);
          done();
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
        hilog.info(domain, tag, '%{public}s',
          "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2400 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200
     * @tc.desc   test remoteQuery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        hilog.info(domain, tag, '%{public}s',
          "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        let deviceIds: Array<string> = [];
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          hilog.info(domain, tag, '%{public}s',
            "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200 remoteQuery start *************");
          await rdbStore!.remoteQuery("", "test1", predicates, ["id", "name", "age", "salary", "blobType"]);
        } catch (e) {
          console.log(TAG + "SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200 e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        hilog.info(domain, tag, '%{public}s',
          "************* SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_RemoteQuery_1200 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        let deviceIds: Array<string> = [];
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        try {
          await rdbStore!.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          let rows: Number = rdbStore!.deleteSync(predicates)
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1800
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1800
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          rdbStore!.executeSync("select * from test1")
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.execute("DELETE FROM TEST1 WHERE age = ? OR age = ?", ["18", "20"]);
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.executeSync("select * from test1",)
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          await rdbStore!.lockRow(predicates);
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.queryLockedRow(predicates, ["id", "name", "age", "salary", "blobType"]);
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          await rdbStore!.unlockRow(predicates);
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: data_relationalStore.TransactionOptions = {
          transactionType: data_relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          await rdbTrans.update(valueBucket1, predicates);
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        try {
          rdbTrans.querySqlSync("SELECT * FROM test1");
          rdbTrans.rollback();
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: data_relationalStore.TransactionOptions = {
          transactionType: data_relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          await rdbTrans.update(valueBucket1, predicates);
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        try {
          rdbTrans.querySqlSync("SELECT * FROM test1");
          rdbTrans.rollback();
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        let u8 = new Uint8Array(2);
        u8.fill(1);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 16.0,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let options: data_relationalStore.TransactionOptions = {
          transactionType: data_relationalStore.TransactionType.IMMEDIATE
        }
        const rdbTrans = await rdbStore!.createTransaction(options);
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try {
          await rdbTrans.update(valueBucket1, predicates);
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        try {
          rdbTrans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          rdbTrans.rollback();
          console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
          rdbTrans.rollback();
          expect(err.code).assertEqual(14800014)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          let rows: Number = rdbStore!.deleteSync(predicates)
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }

        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionErrcode0300
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionErrcode0300
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionErrcode0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionErrcode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0300 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!!.close();
        try {
          await rdbStore!!.batchInsertWithConflictResolution("test", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          expect(null).assertFail()
          done();
        } catch (err) {
          console.log(TAG + err + "testRdbStoreBatchInsertWithConflictResolutionErrcode0300 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
          done();
        }
        console.log(TAG + "************* testRdbStoreBatchInsertWithConflictResolutionErrcode0300 end *************");
      })


    /**
     * @tc.name   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode01200
     * @tc.number testRdbStoreBatchInsertWithConflictResolutionSyncErrcode02100
     * @tc.desc   testRdbStoreBatchInsertWithConflictResolutionSyncErrcode02100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreBatchInsertWithConflictResolutionSyncErrcode01200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode01200 start *************");
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18.0,
          "salary": 100.5,
          "blobType": u8,
        }
        let valueBucketArray: data_relationalStore.ValuesBucket[] = new Array<data_relationalStore.ValuesBucket>();
        for (let i = 0; i < 2; i++) {
          valueBucketArray.push(valueBucket);
        }
        await rdbStore!.close();
        try {
          rdbStore!.batchInsertWithConflictResolutionSync("test", valueBucketArray,
            data_relationalStore.ConflictResolution.ON_CONFLICT_NONE);
          done();
        } catch (err) {
          console.log(TAG + err + "testRdbStoreBatchInsertWithConflictResolutionSyncErrcode01200 failed" + err.code);
          expect(err.code == 14800014).assertTrue()
          done();
        }
        console.log(TAG +
          "************* testRdbStoreBatchInsertWithConflictResolutionSyncErrcode01200 end *************");
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG3);
        await rdbStore!.execute(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "lisi",
          "age": 20.0,
          "salary": 220.5,
          "blobType": u8,
        };

        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          let rows: Number =
            rdbStore!.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(14800014).assertEqual(e.code)
        }
        rdbStore = undefined;
        await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
        done();
      })

  })
}