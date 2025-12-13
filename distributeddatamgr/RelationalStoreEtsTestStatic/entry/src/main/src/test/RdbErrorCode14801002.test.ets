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
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'distributedTables';
const TAG = "[rdbErrorCode14801002]"

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore1002.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext;
let rdbStore: data_relationalStore.RdbStore | undefined | null;

export default function rdbErrorCode14801002() {

  describe("rdbErrorCode14801002", (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    });

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
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
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name   relationalStoreTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* testRdbStoreAttach0001 start *************");
      const STORE_CONFIG: data_relationalStore.StoreConfig = {
        name: "rdbstore002.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
      }
      const STORE_CONFIG1: data_relationalStore.StoreConfig = {
        name: "rdbstore0021.db",
        securityLevel: data_relationalStore.SecurityLevel.S1,
        dataGroupId: "47589"
      }
      const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
        "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
      let store = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await store!.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18 as long,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        await store!.insert("test", valueBucket);
      } catch (e: Error) {
        console.error(TAG + `insert failed, code is ${e.code},message is ${e.message}`);
        expect().assertFail()
      }
      try {
        let num = await store.attach(context, STORE_CONFIG1, "attachDB", 2);
        expect(1 as Int).assertEqual(num);
      } catch (e: Error) {
        console.error(TAG + `deleteRdbStore failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14801002);
      }
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })

  })
}