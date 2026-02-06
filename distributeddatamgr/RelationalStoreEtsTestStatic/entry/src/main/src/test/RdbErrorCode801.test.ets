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
import data_relationalStore from '@ohos.data.relationalStore'
import { abilityAccessCtrl, Context, PermissionRequestResult, common } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识

const TABLE = 'distributedTables';
const TAG = "[RdbErrorCode801]"

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore801.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1: data_relationalStore.StoreConfig = {
  name: "rdbStore801.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  persist:false,
}
let context: common.UIAbilityContext | undefined;
let rdbStore: data_relationalStore.RdbStore | undefined | null;

export default function RdbErrorCode801() {
  describe("RdbErrorCode801", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      await rdbStore!.executeSql(CREATE_TABLE_TEST1);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000.0,
        "data4": u8
      }
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).cleanDirtyData('test_table', 100);
            console.info(TAG + 'clean dirty data succeeded');
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600 end-----")
      })


    /**
     * @tc.name   errcode022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_11900
     * @tc.desc   rdbStore.cloudSync errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('errcode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
    //   console.info(TAG + "************* errcode022 start *************");
    //   try {
    //     rdbStore!.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
    //       (progressDetail: data_relationalStore.ProgressDetails) => {
    //         console.info(`progress: ${progressDetail}`);
    //       })
    //     console.log(TAG + "errcode022 error");
    //     expect(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST == 6).assertTrue();
    //     done();
    //   } catch (err) {
    //     console.log(TAG + "err.code" + err.code + "err.message" + err.message);
    //     expect(801).assertEqual(err.code);
    //     done();
    //   }
    //   console.info(TAG + "************* errcode022 end *************");
    // })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400
     * @tc.desc   Test cloudSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async () => {
    //     console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400 start-----")
    //     rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    //     const tables = ["table1", "table2"];
    //
    //     if (rdbStore != undefined) {
    //       (rdbStore as data_relationalStore.RdbStore).cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
    //         tables,
    //         (progressDetail: data_relationalStore.ProgressDetails) => {
    //           console.info(TAG + `progress: ${progressDetail}`);
    //         }).then(() => {
    //         console.info(TAG + 'Cloud sync succeeded');
    //       }).catch((err: Error) => {
    //         console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
    //         expect(err.code).assertEqual('801');
    //       });
    //     }
    //     ;
    //     console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400 end-----")
    //   })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_emit_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_emit_ErrTest_0100
     * @tc.desc   Test emit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_emit_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0100 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).emit('storeObserver');
            console.info(TAG + 'emit success.');
          } catch (err) {
            console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0100 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0200
     * @tc.desc   Test getModifyTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let PRIKey = ["test_key1", "test_key2"];
        let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
          "data TEXT, " +
          "recycled BOOLEAN, " +
          "recycledTime INTEGER, " +
          "num TEXT PRIMARY KEY)";
        await rdbStore!.executeSql(sql_text);
        try {
          try {
            let PRIKey: Array<data_relationalStore.PRIKeyType> = ["test_key1", "test_key2"];
            await rdbStore!.getModifyTime("cloud_text", "num", PRIKey);
          } catch (err) {
            console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            if (err.code == 801) {
              expect(err.code).assertEqual('801');
            }
          }
        } catch (err) {
          console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual('801');
        }
        done();
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200
     * @tc.desc   Test obtainDistributedTableName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceId: string | undefined = undefined;

        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices = dmInstance.getAvailableDeviceListSync();
          deviceId = devices[0].networkId;
        } catch (err) {
          let code = err.code;
          let message = err.message
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        if (rdbStore != undefined && deviceId != undefined) {
          (rdbStore as data_relationalStore.RdbStore).obtainDistributedTableName(deviceId, "EMPLOYEE")
            .then((tableName: string) => {
              console.info(TAG + `ObtainDistributedTableName successfully, tableName= ${tableName}`);
              // expect(tableName).assertEqual(tableName);
            })
            .catch((err: Error) => {
              console.error(TAG + 'Failed to obtainDistributedTableName.Code: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual('801')
            })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0100
     * @tc.desc   Test off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0100 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).offDataChange(
              data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              storeObserver);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0100 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0200
     * @tc.desc   Test off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0200 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).offDataChange(
              data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0200 end-----")
      })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0400
     * @tc.desc   Test off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0400 start-----")
        let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        let storeObserver = () => {
          console.info(TAG + `storeObserver`);
        }
        try {
          if (rdbStore1 != undefined) {
            (rdbStore1 as data_relationalStore.RdbStore).off('storeObserver', false, storeObserver);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0400 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0600
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0600
     * @tc.desc   Test off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0600 start-----")
        let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        let progressDetail = (progressDetail: data_relationalStore.ProgressDetails) => {
          console.info(TAG + `progress: ${progressDetail}`);
        }
        try {
          if (rdbStore1 != undefined) {
            (rdbStore1 as data_relationalStore.RdbStore).offAutoSyncProgress(progressDetail);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0600 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_off_ErrTest_0800
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0800
     * @tc.desc   Test off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0800 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).offStatistics();
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0800 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0600
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0600
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0600 start-----")
        let progressDetail = (progressDetail: data_relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
        }
        let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        try {
          if (rdbStore1 != undefined) {
            (rdbStore1 as data_relationalStore.RdbStore).onAutoSyncProgress(progressDetail);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual(801)
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0600 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0100
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0100 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).onDataChange(
              data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              storeObserver);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0100 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0200
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0200 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(`device= ${devices[i]} data changed`);
            }
          }
        }
        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).onDataChange(
              data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              storeObserver);
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0200 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0800
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0800
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0800 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        let sqlExecutionInfo = (sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
          console.info(`sql: ${sqlExecutionInfo.sql[0]}`);
          console.info(`totalTime: ${sqlExecutionInfo.totalTime}`);
          console.info(`waitTime: ${sqlExecutionInfo.waitTime}`);
          console.info(`prepareTime: ${sqlExecutionInfo.prepareTime}`);
          console.info(`executeTime: ${sqlExecutionInfo.executeTime}`);
        }

        try {
          if (rdbStore != undefined) {
            (rdbStore as data_relationalStore.RdbStore).onStatistics(sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0800 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_on_ErrTest_0300
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0300
     * @tc.desc   Test on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0300 start-----")
        let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        let storeObserver = () => {
          console.info(TAG + `storeObserver`);
        }
        try {
          if (rdbStore1 != undefined) {
            (rdbStore1 as data_relationalStore.RdbStore).on('storeObserver', false, storeObserver);
            console.info(TAG + 'on success.')
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0300 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200
     * @tc.desc   Test remoteQuery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceId: string | undefined = undefined;

        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices = dmInstance.getAvailableDeviceListSync();
          if (deviceId != undefined) {
            deviceId = devices[0].networkId;
          }
        } catch (err) {
          let code = err.code;
          let message = err.message;
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        let predicates = new data_relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0 as Long);
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
        if (rdbStore != undefined && deviceId != undefined) {
          (rdbStore as data_relationalStore.RdbStore).remoteQuery(deviceId, "EMPLOYEE", predicates,
            ["ID", "NAME", "AGE", "SALARY", "CODES"]).then((resultSet: data_relationalStore.ResultSet) => {
            console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          }).catch((err: Error) => {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801')
          })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200 end-----")
      })

    /**
     * @tc.name   testMemoryDbNotSupport0400
     * @tc.number testMemoryDbNotSupport0400
     * @tc.desc   testMemoryDbNotSupport0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryDbNotSupport0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await (rdbStore1 as data_relationalStore.RdbStore).setDistributedTables(["test"]);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("setDistributedTables catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })

    /**
     * @tc.name   testMemoryDbNotSupport0500
     * @tc.number testMemoryDbNotSupport0500
     * @tc.desc   testMemoryDbNotSupport0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryDbNotSupport0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let rdbStore1 = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
      await rdbStore1!.executeSql(CREATE_TABLE_TEST);
      await rdbStore1!.executeSql(CREATE_TABLE_TEST1);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      try {
        await (rdbStore1 as data_relationalStore.RdbStore).sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH,
          predicates);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log("sync catch err: failed, err: code=" + err.code + " message=" + err.message)
        expect(err.code).assertEqual(801);
        done();
      }
    })

    /**
     * @tc.name   errcode011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10900
     * @tc.desc   transaction.execute errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode011 start *************");
      const record: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30.0,
      };
      (rdbStore as data_relationalStore.RdbStore).insert("employee", record)
      let predicates = new data_relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30.0);
      try {
        let transaction: data_relationalStore.Transaction;
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction()
        await transaction.execute("DELETE FROM EMPLOYEE WHERE age = ?", ["30"])
        await transaction.commit()
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue();
        resultSet.close();
        done();
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode011 end *************");
    })
    /**
     * @tc.name   errcode010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_10800
     * @tc.desc   transaction.executeSync errcode is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode010 start *************");
      const record: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30.0,
      };
      (rdbStore as data_relationalStore.RdbStore).insert("employee", record)
      let predicates = new data_relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30.0);
      try {
        let transaction: data_relationalStore.Transaction;
        transaction = await (rdbStore as data_relationalStore.RdbStore).createTransaction()
        transaction.executeSync("DELETE FROM EMPLOYEE WHERE age = ?", ["30"])
        await transaction.commit()
        let resultSet = await (rdbStore as data_relationalStore.RdbStore).query(predicates);
        console.log(TAG + "resultSet.rowCount" + resultSet.rowCount);
        expect(resultSet.rowCount == 0).assertTrue()
        resultSet.close();
        done()
      } catch (err) {
        console.log(TAG + "err.code" + err.code + "err.message" + err.message)
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode010 end *************");
    })

  })
}