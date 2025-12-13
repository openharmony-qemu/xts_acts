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
const TAG = "[rdbErrorCode14800051]"

const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore51.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let context: common.UIAbilityContext;
let rdbStore: data_relationalStore.RdbStore | undefined | null;

export default function rdbErrorCode14800051() {

  describe("rdbErrorCode14800051", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
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
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30.0,
        "salary": 2000.0,
        "data4": u8
      }
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })

    /**
     * @tc.name   setDistributedTablesTest001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0400
     * @tc.desc   delete success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setDistributedTablesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + "************* setDistributedTablesTest001 start *************");
      try {
        console.info(TAG + "************* setDistributedTablesTest001 start *************1111111111111");
        await rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD)
      } catch (e: Error) {
        console.error(TAG + `setDistributedTables failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
      }
      console.info(TAG + "************* setDistributedTablesTest001 end *************");
    })

  })
}