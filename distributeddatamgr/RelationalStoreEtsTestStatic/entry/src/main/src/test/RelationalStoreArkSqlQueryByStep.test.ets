'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

const TAG = "[rdb_querbyystep_JSKITS_TEST]";
let rdbStore: relationalStore.RdbStore | undefined | null = undefined;
let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const config: relationalStore.StoreConfig = {
  name: "queryByStepTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  encrypt:true,
};
let num = 'a'.repeat(1024 * 1024 * 3);
const valueBucket2m: relationalStore.ValuesBucket = {
  'name': num,
  'age': 122341465656,
};
const asset1: relationalStore.Asset = {
  name: 'hangman',
  uri: '//path/example',
  path: '//path/example',
  createTime: 'createTime1',
  modifyTime: 'modifyTime1',
  size: 'size1',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
};
const asset2: relationalStore.Asset = {
  name: 'hangman2',
  uri: '//path/example',
  path: '//path/example',
  createTime: 'createTime1',
  modifyTime: 'modifyTime1',
  size: 'size1',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "nil TEXT, " +
  "name TEXT NOT NULL, " +
  "age INTEGER, " +
  "score REAL, " +
  "info BLOB, " +
  "blobFloat floatvector(128), " +
  "bigValue UNLIMITED INT, " +
  "data1 ASSET, " +
  "data2 ASSETS)";
const u8 = new Uint8Array([1, 2, 3]);
const valuesBucket1: relationalStore.ValuesBucket = {
  "nil": null,
  "age": 18 as long,
  "name": "hangman",
  "score": 100.5,
  "info": u8,
  "blobFloat": new Float32Array([1.125, 0.1875]),
  "bigValue": BigInt('15822401018187971961171'),
  "data1": asset1,
  "data2": [asset1, asset2] as relationalStore.Assets,
};

let valueBucket0: relationalStore.ValuesBucket = {
  "name": "Alice",
  "age": 10 as long ,
  "score": 1.0,
  "info": new Uint8Array([1, 2, 3])
};
let valueBucket1: relationalStore.ValuesBucket = {
  "name": "Bob",
  "age": 200 as long,
  "score": 100000.5,
  "info": new Uint8Array([3, 4, 5])
};
let valueBucket2: relationalStore.ValuesBucket = {
  "name": "Charlie",
  "age": 300 as long,
  "score": 100000.9,
  "info": new Uint8Array(0)
};
function verifyRowData(resultSet: relationalStore.ResultSet, expected: relationalStore.ValuesBucket): void {
  let nameColIdx = resultSet.getColumnIndex("name");
  let ageColIdx = resultSet.getColumnIndex("age");
  let scoreColIdx = resultSet.getColumnIndex("score");
  let infoColIdx = resultSet.getColumnIndex("info");
  console.info(TAG + " nameColIdx is " + nameColIdx);
  console.info(TAG + " ageColIdx is " + ageColIdx);
  console.info(TAG + " scoreColIdx is " + scoreColIdx);
  console.info(TAG + " infoColIdx is " + infoColIdx);
  let expectedName = expected["name"] as string;
  let expectedAge = expected["age"] ;
  let expectedScore = expected["score"] as number;
  console.info(TAG + " expectedName is " + expectedName);
  console.info(TAG + " expectedAge is " + expectedAge);
  console.info(TAG + " expectedScore is " + expectedScore);
  expect(resultSet.getString(nameColIdx)).assertEqual(expectedName);
  expect(resultSet.getLong(ageColIdx)).assertEqual(expectedAge);
  expect(resultSet.getDouble(scoreColIdx)).assertEqual(expectedScore);
  let blob = resultSet.getBlob(infoColIdx);
  console.info(TAG + " blob is " + blob);
  let expectedBlob = expected["info"] as Uint8Array;
  if (blob !== null && expectedBlob !== null) {
    for (let i = 0; i < expectedBlob.length; i++) {
      expect(blob[i]).assertEqual(expectedBlob[i]);
    }
  }
}
export default function RelationalStoreArkSqlQueryByStepTest(): void {
  describe('RelationalStoreArkSqlQueryByStepTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      let cmd = "aa start -a EntryAbility -b com.example.relationalstore";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, config);
      console.info(TAG + "create RelationalStore store success");
      let store = rdbStore as relationalStore.RdbStore;
      await store.executeSql(CREATE_TABLE_TEST, []);
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context!, config);
      rdbStore = null;
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
    })
    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   RdbArkTestQueryByStepSql0001
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0100
     * @tc.desc   空数据
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql001 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = 'Alice'");
        expect(resultSet.rowCount).assertEqual(0);
        expect(resultSet.goToFirstRow()).assertEqual(false);
        resultSet.close();
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0003 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql001 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0002
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0200
     * @tc.desc   第一个参数为空
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql002 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let resultSet = await store.queryByStep("");
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql002 failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql002 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0003
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0300
     * @tc.desc   RdbStore已关闭
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0003 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        store.close();
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = 'Alice'");
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0003 failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800014);
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0003 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0004
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0400
     * @tc.desc   bindArgs数组
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0004 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",["Alice"]);
        expect(resultSet.rowCount).assertEqual(1);
        expect(resultSet.goToFirstRow()).assertEqual(true);
        verifyRowData(resultSet, valueBucket0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0004 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0004 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0005
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0500
     * @tc.desc   空bindArgs数组
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0005 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",[]);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0005 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0005 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0006
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0600
     * @tc.desc   空bindArgs数组[""]
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0006 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",[""]);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0006 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0006 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0007
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0700
     * @tc.desc   bindArgs数组为undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0007 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",undefined);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0007 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0007 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0008
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0800
     * @tc.desc   bindArgs数组超了
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0008 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",["Alice",'Bob']);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(-1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0008 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0008 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0009
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_0900
     * @tc.desc   超2M
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0009 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket2m);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test where age = ?",[122341465656]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0009 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0009 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0010
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_1000
     * @tc.desc   所有数据类型
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0010 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valuesBucket1);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test where name = ?",["hangman"]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        console.info(TAG + " resultSet columnNames " + JSON.stringify(resultSet.columnNames));
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.info(TAG + " resultSet columnCount " + JSON.stringify(resultSet.columnCount));
        expect(resultSet.columnCount).assertEqual(10);
        console.info(TAG + " resultSet rowIndex " + resultSet.rowIndex);
        expect(resultSet.rowIndex).assertEqual(-1);
        console.info(TAG + " resultSet isAtFirstRow " + resultSet.isAtFirstRow);
        expect(resultSet.isAtFirstRow).assertEqual(false);
        console.info(TAG + " resultSet isAtLastRow " + resultSet.isAtLastRow);
        expect(resultSet.isAtLastRow).assertEqual(false);
        console.info(TAG + " resultSet isEnded " + resultSet.isEnded);
        expect(resultSet.isEnded).assertEqual(false);
        console.info(TAG + " resultSet isStarted " + resultSet.isStarted);
        expect(resultSet.isStarted).assertEqual(false);
        console.info(TAG + " resultSet isClosed " + resultSet.isClosed);
        expect(resultSet.isClosed).assertEqual(false);
        let data1 = resultSet?.goToNextRow();
        expect(data1).assertEqual(true);
        console.info(TAG + " resultSet rowIndex1 " + resultSet.rowIndex);
        console.info(TAG + " resultSet isAtFirstRow1 " + resultSet.isAtFirstRow);
        console.info(TAG + " resultSet isAtLastRow1 " + resultSet.isAtLastRow);
        console.info(TAG + " resultSet isEnded1 " + resultSet.isEnded);
        console.info(TAG + " resultSet isStarted1 " + resultSet.isStarted);
        console.info(TAG + " resultSet isClosed1 " + resultSet.isClosed);
        resultSet?.goToNextRow();
        console.info(TAG + " resultSet isEnded2 " + resultSet.isEnded);
        resultSet.close()
        console.info(TAG + " resultSet isClosed3 " + resultSet.isClosed);
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0010 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0010 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0011
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_1100
     * @tc.desc   两个条件
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0011 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE age > ? and name = ?",[0 as long,"Alice"]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `RdbArkTestQueryByStepSql0011 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0011 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0012
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_1200
     * @tc.desc   sql注入
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0012 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let insertNum1 = await store.insert("test", valueBucket1);
        expect(insertNum1).assertEqual(2);
        let insertNum2 = await store.insert("test", valueBucket2);
        expect(insertNum2).assertEqual(3);
        let name = 'Alice\' OR \'1\' = \'1';
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",[name]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepSql0012 end *************');
    })
    /**
     * @tc.name   RdbArkTestQueryByStepSql0013
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_1300
     * @tc.desc  return value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepSql0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* RdbArkTestQueryByStepSql0013 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);
      let resultSet = await store.queryByStep("SELECT * FROM test", []);
      expect(resultSet.rowCount).assertEqual(1);
      expect(resultSet.goToFirstRow()).assertEqual(true);
      expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
      resultSet.close();
      console.info(TAG + '************* RdbArkTestQueryByStepSql0013 end *************');
    })
  });
}