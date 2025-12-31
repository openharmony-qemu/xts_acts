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


import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach } from "../../../hypium/index";
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

let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

let domain: int = 0x0000;
let tag: string = 'testTag';


let rdbStore: data_relationalStore.RdbStore;
const STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "testljj.db",
  securityLevel: data_relationalStore.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 float32Array," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const dbName = "testljj.db"
let dbPath = "";
let dbPathWal = "";
let dbPathShm = "";

async function CreateCorruptDb() {
  try {
    let fileExist = fs.accessSync(dbPath);
    console.info(tag + "fileExist:" + fileExist)
    expect(fileExist).assertTrue();
    fs.truncateSync(dbPathWal, 4)
    fs.truncateSync(dbPathShm, 4)
    let file = fs.openSync(dbPath, fs.OpenMode.READ_ONLY | fs.OpenMode.TRUNC);
    fs.truncateSync(file.fd, 4);
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
  } catch (err) {
    err = err as BusinessError;
    console.info(tag, `CreateCorruptDb err.code ${err.code}, err.message ${err.message}`)
  }
  console.info(tag, `quit create corrupt store`);
}

const valueBucket0: data_relationalStore.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1: data_relationalStore.ValuesBucket = {
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

    beforeEach(async (): Promise<void> => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.insert("test", valueBucket0);
    })

    afterEach(async (): Promise<void> => {
      await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    /**
     * @tc.name       RelationStoreError12Test0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0100
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 end *************' + res);
          expect(res == 10).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0001 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0001 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0200
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0002 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getLong(resultSet.getColumnIndex("data2"));
          hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0002 res *************' + res);
          expect(res == 10).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0002 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0002 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0300
     * @tc.desc       Transaction getDouble
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0003 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0003 end *************' + res);
          expect(res == 1).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0003 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0003 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0400
     * @tc.desc       Transaction getDouble
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0004 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getDouble(resultSet.getColumnIndex("data3"));
          hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0004 res *************' + res);
          expect(res == 1).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0004 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0004 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0500
     * @tc.desc       Transaction getString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0005 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0005 end *************' + res);
          expect(res == "hello").assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0005 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0005 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0600
     * @tc.desc       Transaction getString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0006 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getString(resultSet.getColumnIndex("data1"));
          hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0006 res *************' + res);
          expect(res == "hello").assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0006 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0006 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0007
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0700
     * @tc.desc       Transaction getBlob
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0007 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0007 end *************' + res);
          expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0007 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0007 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0008
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0800
     * @tc.desc       Transaction getBlob
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0008 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getBlob(resultSet.getColumnIndex("data4"));
          hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0008 res *************' + res);
          expect(JSON.stringify(res) == '{"0":1,"1":2,"2":3}').assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0008 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0008 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0009
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_0900
     * @tc.desc       Transaction getAsset
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0009 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0009 end *************' + res);
          expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}')
            .assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0009 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0009 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0010
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_1000
     * @tc.desc       Transaction getAsset
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0010 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getAsset(resultSet.getColumnIndex("data5"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0010 res *************' + res);
          expect(JSON.stringify(res) == '{"size":"","uri":"","name":"","path":"","createTime":"","modifyTime":""}')
            .assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0010 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0010 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0011
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_1100
     * @tc.desc       Transaction getValue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0011 start *************');
        let resultSet = await rdbStore.querySql("");
        try {
          let res = resultSet.getValue(resultSet.getColumnIndex("data6"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0011 end *************' + res);
          expect(res == null).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '************* RelationStoreError12Test0011 end *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0011 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0012
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_1200
     * @tc.desc       Transaction getValue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0012 start *************');
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getValue(resultSet.getColumnIndex("data5"));
          hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0012 res *************' + res);
          expect(res == null).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0012 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0012 end *************');
      })

    /**
     * @tc.name       RelationStoreError12Test0013
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_Error12Test_1300
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RelationStoreError12Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', '************* RelationStoreError12Test0013 start *************');
        let asset: data_relationalStore.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: data_relationalStore.AssetStatus.ASSET_NORMAL,
        };
        const assets = [asset];
        const valueBucket: data_relationalStore.ValuesBucket = {
          "data1": "hello world 1",
          "data2": 3 as long,
          "data3": 10.5,
          "data4": new Uint8Array([1, 2, 3]),
          "data5": asset,
          "data6": assets,
          "data7": new Float32Array([1.5, 2.5]),
          "data8": 100n
        };
        let num = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
        await CreateCorruptDb();
        let resultSet = await rdbStore.querySql("SELECT * FROM test");
        try {
          let res = resultSet.getAssets(resultSet.getColumnIndex("data6"));
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0013 res *************' + res.length);
          expect(res.length == 0).assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, '%{public}s',
            '*************  RelationStoreError12Test0013 err *************' + err.code + err.message);
          expect(err.code == 14800012).assertEqual(true);
        }
        done();
        hilog.info(domain, tag, '%{public}s', '*************  RelationStoreError12Test0013 end *************');
      })
  })
}

