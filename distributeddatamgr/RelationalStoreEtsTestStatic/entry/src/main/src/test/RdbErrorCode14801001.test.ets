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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import data_relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'distributedTables';
const TAG = "[rdbErrorCode14801001]"

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore1001.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG1: data_relationalStore.StoreConfig = {
  name: "rdbstore10011.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext;
let rdbStore: data_relationalStore.RdbStore | undefined | null;

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
  expect(ret).assertEqual(count);
  resultSet.close();
}

async function updateCheck(store: data_relationalStore.RdbStore, tableName: string) {
  let u8 = new Uint8Array([4, 5, 6]);
  const valueBucket: data_relationalStore.ValuesBucket = {
    "name": "lisi",
    "age": 20.0,
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
    "age": 18.0,
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
  expect(count).assertEqual(ret);
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

export default function rdbErrorCode14801001() {

  describe("rdbErrorCode14801001", (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      try{
        let attachStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        console.info(TAG + 'beforeEach context databasedir: ' + context.databaseDir);
        console.info(TAG + 'beforeEach STORE_CONFIG1 success');
        await attachStore.executeSql(CREATE_TABLE_TEST1);
      }catch (e: Error) {
        console.info(TAG + 'beforeEach STORE_CONFIG1 error:');
      }
    })

    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');

    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name   testRdbStoreAttach0015
     * @tc.number SUB_Distributed_Data_RelationalStore_SDK_AttachAPITest_0010
     * @tc.desc   non encrypted database attach non encrypted database
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testRdbStoreAttach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
    //   console.log(TAG + "************* testRdbStoreAttach0015 start *************");
    //   let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    //   await store.execute(CREATE_TABLE_TEST);
    //   await attachInsert(store, "test");
    //   try {
    //     let num = await store.attach(context, STORE_CONFIG1, "attachDB");
    //     expect(1).assertEqual(num);
    //   } catch (e: Error) {
    //     console.log("testRdbStoreAttach0015 : failed, err: code=" + e.code + " message=" + e.message);
    //     expect(14801001).assertEqual(e.code);
    //     done();
    //   }
    //   await attachCheck(store);
    //   expect(0).assertEqual(await store.detach("attachDB"))
    //   console.log(TAG + "************* testRdbStoreAttach0015 end *************");
    //   done();
    // })
  })
}