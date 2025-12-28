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
import dataRdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const TABLE = 'distributedTables';
const TAG = "[RdbErrorCode14800050]"
let bigdata = 'a'.repeat(100)
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + bigdata
  + ' text,' + '"邮箱：abc#$123@abc.com" long,' + '"@#$%^&*" text,' + '" " text,' + '年龄 long,' + '"null" text,'
  + 'data text,' + 'data1 text,' + 'data2 long, ' + 'data3 double,' + 'data4 blob,' + '"1" INTEGER)';
const STORE_CONFIG: dataRdb.StoreConfig = {
  name: 'Resultset50.db',
  securityLevel: dataRdb.SecurityLevel.S1
};
let context: common.UIAbilityContext;
const COLOUNM_NAMES = ["id", "data1", "data2", "data3", "data4"];
let rdbStore: dataRdb.RdbStore | undefined | null;
let resultSet: dataRdb.ResultSet | null = null;

//插入数据
async function createTest() {
  console.info(TAG + 'createTest data start');
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: dataRdb.ValuesBucket = {
      'data1': 'hello',
      'data2': 10 as long,
      'data3': 1.0,
      'data4': u8,
      '"1"': 123 as long,
      'data': 'data',
      '年龄': 13 as long,
      '" "': 'kong',
      '"@#$%^&*"': 'special',
      '"邮箱：abc#$123@abc.com"': 'abc#$123@abc.com',
      '"null"': 'null'
    };
    await rdbStore!.insert('test', valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: dataRdb.ValuesBucket = {
      'data1': '2',
      'data2': -5 as long,
      'data3': 2.5,
      'data4': u8,
    };
    await rdbStore!.insert('test', valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: dataRdb.ValuesBucket = {
      'data1': 'hello world',
      'data2': 3 as long,
      'data3': 1.8,
      'data4': u8,
    };
    await rdbStore!.insert('test', valueBucket);
  }
  console.info(TAG + 'createTest data end');
}

export default function RdbErrorCode14800050() {

  describe("RdbErrorCode14800050", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      rdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
    })

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(() => {
      console.info(TAG + 'afterEach');
    })

    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
      let rdbStore: dataRdb.RdbStore;
      await dataRdb.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0080
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0080 start *************');
        let predicates = new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore!.query(predicates);

        let storeObserver = () => {
          console.info(`storeObserver`);
        }
        try {
          // TestCode
          if (rdbStore != undefined) {
            rdbStore!.emit('storeObserver');
          }
        } catch (e: Error) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }
        resultSet.close();
        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0080 end *************');
      })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0090
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8500
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0090 start *************');
        await createTest();
        let predicates = new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore!.query(predicates);

        let storeObserver = () => {
          console.info(`storeObserver`);
        }

        try {
          //TestCode
          if (rdbStore != undefined) {
            rdbStore!.on('storeObserver', false, storeObserver);
          }
        } catch (e: Error) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }

        resultSet.close();

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0090tr end *************');
      })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8600
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0100 start *************');
        await createTest();
        let predicates = new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore!.query(predicates);

        let storeObserver = () => {
          console.info(`storeObserver`);
        }

        try {
          //TestCode
          if (rdbStore != undefined) {
            rdbStore!.on('storeObserver', false, storeObserver);
          }
        } catch (e: Error) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }

        try {
          //TestCode
          if (rdbStore != undefined) {
            rdbStore!.off('storeObserver', false, storeObserver);
          }
        } catch (e: Error) {
          if (e.code != 801) {
            expect(e.code).assertEqual(14800050);
          }
        }

        resultSet.close();

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0100 end *************');
      })


  })
}