
/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import data_relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

let domain: int = 0x0000;
let tag: string = 'testTag';


let rdbStore:data_relationalStore.RdbStore;
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "testljj.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testljj.db"
let dbPath =  "";
let dbPathWal =  "";
let dbPathShm = "";
async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:"+fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.TRUNC);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err:BusinessError) {
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}
const valueBucket0 :data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :data_relationalStore.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
export default function RelationStoreError12Test() {
  describe('RelationStoreError12Test', (): void => {

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      dbPath = context.databaseDir + "/rdb/" + dbName;
      dbPathWal = context.databaseDir + "/rdb/" + dbName + "-wal";
      context.databaseDir + "/rdb/" + dbName + "-shm";
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
    })


    /**
     * @tc.name       : RelationStoreError00Test0029
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_2900
     * @tc.desc       : Transaction getBlob
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 end *************' + res);
          expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0029 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0029 end *************');
      })

    /**
     * @tc.name       : RelationStoreError00Test0030
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3000
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 end *************' + res);
          expect(res == 10).assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0030 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0030 end *************');
      })

    /**
     * @tc.name       : RelationStoreError00Test0031
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3100
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0031 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0031 end *************' + res);
          expect(res == "hello").assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0031 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0031 end *************');
      })
    /**
     * @tc.name       : RelationStoreError00Test0032
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3200
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0032 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0032 end *************' + res);
          expect(res == 1).assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0032 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0032 end *************');
      })

    /**
     * @tc.name       : RelationStoreError00Test0033
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3300
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0033 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0033 end *************' + res);
          expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}')
            .assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0033 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0033 end *************');
      })
    /**
     * @tc.name       : RelationStoreError00Test0034
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3400
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    // it('RelationStoreError00Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //     hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0034 start *************');
    //     rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
    //     await rdbStore.execute(DROP_TABLE_TEST);
    //     await rdbStore.execute(CREATE_TABLE_TEST);
    //     let asset: data_relationalStore.Asset = {
    //       name: "name1",
    //       uri: "uri1",
    //       createTime: "createTime1",
    //       modifyTime: "modifyTime1",
    //       size: "size1",
    //       path: "path1",
    //       status: data_relationalStore.AssetStatus.ASSET_NORMAL,
    //     };
    //     const assets = [asset];
    //     const valueBucket: data_relationalStore.ValuesBucket = {
    //       "data1": "hello world 1",
    //       "data2": 3 as long,
    //       "data3": 10.5,
    //       "data4": new Uint8Array([1, 2, 3]),
    //       "data5": asset,
    //       "data6": assets,
    //       "data7": new Float32Array([1.5, 2.5]),
    //       "data8": 100n
    //     };
    //     let num = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
    //     let resultSet = await rdbStore.querySql("");
    //     try {
    //       let res = resultSet.getAssets(-1);
    //       hilog.info(domain, tag, '%{public}s',
    //         '************* RelationStoreError00Test0034 end *************' + res.length);
    //       expect(res.length == 0).assertFail();
    //       await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    //       done();
    //     } catch (err: BusinessError) {
    //       hilog.info(domain, tag, '%{public}s',
    //         '************* RelationStoreError00Test0034 end *************' + err.code + err.message);
    //       expect(err.code == 14800012).assertEqual(true);
    //       await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    //       done();
    //     }
    //     hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0034 end *************');
    //   })

    /**
     * @tc.name       : RelationStoreError00Test0035
     * @tc.number     : SUB_DistributedData_RelationalStore_SDK_Error00Test_3500
     * @tc.desc       : Transaction getLong
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('RelationStoreError00Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0035 start *************');
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.execute(DROP_TABLE_TEST);
        await rdbStore.execute(CREATE_TABLE_TEST);
        let num = await rdbStore.insert("test", valueBucket0);
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getValue(resultSet.getColumnIndex("data6"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0035 end *************' + res);
          expect(res == null).assertFail();
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError00Test0035 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
          await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
          done();
        }
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError00Test0035 end *************');
      })


  })
}

