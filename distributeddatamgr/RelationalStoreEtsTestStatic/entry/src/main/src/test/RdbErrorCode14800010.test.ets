import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TAG = "[RdbErrorCode14800010]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
const CREATE_TABLE_TEST2 = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "dec TEXT)";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";
const DATABASE_BACKUP_NAME = "Backup.db"
const DATABASE_BACKUP_NAME1 = "Backup1.db"

const STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: "rdbstore.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "rdbstore1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore:data_relationalStore.RdbStore | undefined | null;

async function attachBatchInsert(store:data_relationalStore.RdbStore, tableName:string) {
  let u8 = new Uint8Array([1, 2, 3]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "zhangsan",
    "age": 18 as long,
    "salary": 100.5,
    "blobType": u8,
  };
  let valueBucketArray: Array<data_relationalStore.ValuesBucket> = new Array<data_relationalStore.ValuesBucket>();
  for (let i = 0; i < 10; i++) {
    valueBucketArray.push(valueBucket);
  }
  await store.batchInsert(tableName, valueBucketArray);
}

export default function RdbErrorCode1480011() {

  describe("RdbErrorCode1480010", (): void => {
    beforeAll(async(): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });

    /**
     * @tc.name   testRdbStoreAttach00013
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0130
     * @tc.desc   input error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testRdbStoreAttach00013 start *************");
      let store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST);
      await attachBatchInsert(store, "test");
      try {
        await store.attach("/path/errPath/attach.db", "attachDB");
        expect().assertFail();
      } catch(e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', `testRdbStoreAttach00013 + ${e.code} + ${e.message}`);
        expect(14800010).assertEqual(e.code);
      }
      await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      done();
      hilog.info(domain, tag, '%{public}s', "************* testRdbStoreAttach00013 start *************");
    })

    /**
     * @tc.name   testRdbStoreAttach00012
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0120
     * @tc.desc   the alias cannot be empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreAttach00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* testRdbStoreAttach00012 start *************");
      let store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST);
      await attachBatchInsert(store, "test");
      try {
        await store.attach(context!, STORE_CONFIG1, "");
        expect().assertFail();
      } catch(e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', `testRdbStoreAttach00012 + ${e.code} + ${e.message}`);
        expect(14800010).assertEqual(e.code);
      }
      await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      done();
      hilog.info(domain, tag, '%{public}s', "************* testRdbStoreAttach00012 end *************");
    })

    /**
     * @tc.name   RdbBackupRestoreTest_0110
     * @tc.number SUB_DistributedData_RelationalStore_SDK_BackupRestoreJsAPITest_2400
     * @tc.desc   RelationalStore restore function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbBackupRestoreTest_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "************* RdbBackupRestoreTest_0110 start *************");
      let store = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      await store.executeSql(CREATE_TABLE_TEST);
      await attachBatchInsert(store, "test");
      try {
        await store.backup(DATABASE_BACKUP_NAME);
        await store.restore(DATABASE_BACKUP_NAME1);
        expect().assertFail();
      } catch(e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', `RdbBackupRestoreTest_0110 + ${e.code} + ${e.message}`);
        expect(14800010).assertEqual(e.code);
      }
      await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
      done();
      hilog.info(domain, tag, '%{public}s', "************* RdbBackupRestoreTest_0110 start *************");
    })
  })
}