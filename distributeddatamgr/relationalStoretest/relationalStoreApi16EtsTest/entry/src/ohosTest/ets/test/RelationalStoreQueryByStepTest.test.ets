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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[rdb_querbyystep_JSKITS_TEST]";
let rdbStore: relationalStore.RdbStore | undefined | null = undefined;
let context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
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
const u8 = new Uint8Array([1, 2, 3]);
const valuesBucket1: relationalStore.ValuesBucket = {
  nil: null,
  age: 18,
  name: "hangman",
  score: 100.5,
  info: u8,
  blobFloat: new Float32Array([1.125, 0.1875]),
  bigValue: BigInt('15822401018187971961171'),
  data1: asset1,
  data2: [asset1, asset2],
};
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
let valueBucket0: relationalStore.ValuesBucket = {
  "name": "Alice",
  "age": 10 ,
  "score": 1.0,
  "info": new Uint8Array([1, 2, 3])
};
let valueBucket1: relationalStore.ValuesBucket = {
  "name": "Bob",
  "age": 200 ,
  "score": 100000.5,
  "info": new Uint8Array([3, 4, 5])
};
let valueBucket2: relationalStore.ValuesBucket = {
  "name": "Charlie",
  "age": 300 ,
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
export default function queryByStepTest() {
  describe('queryByStepTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
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
     * @tc.name   rdbtestQueryByStepSql001
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0100
     * @tc.desc   空数据
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql001 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = 'Alice'");
      expect(resultSet.rowCount).assertEqual(0);
      expect(resultSet.goToFirstRow()).assertEqual(false);
      resultSet.close();
      console.info(TAG + '************* rdbtestQueryByStepSql001 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql002
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0200
     * @tc.desc   第一个参数为空
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql002 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let resultSet = await store.queryByStep("");
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.info(TAG + '************* rdbtestQueryByStepSql002 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql003
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0300
     * @tc.desc   第一个参数为undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql003 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let resultSet = await store.queryByStep(undefined);
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.info(TAG + '************* rdbtestQueryByStepSql003 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql004
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0400
     * @tc.desc   第一个参数为null
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql004 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let resultSet = await store.queryByStep(null);
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.info(TAG + '************* rdbtestQueryByStepSql004 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql005
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0500
     * @tc.desc   RdbStore已关闭
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql005 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        store.close();
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = 'Alice'");
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("14800014");
      }
      console.info(TAG + '************* rdbtestQueryByStepSql005 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql006
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0600
     * @tc.desc   bindArgs数组
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql006 start *************');
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
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql006 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql007
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0700
     * @tc.desc   空bindArgs数组
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql007 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",[]);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql007 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql008
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0800
     * @tc.desc   空bindArgs数组[""]
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql008 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",[""]);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql008 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql009
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_0900
     * @tc.desc   bindArgs数组为null
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql009 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",null);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql009 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql010
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1000
     * @tc.desc   bindArgs数组为undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql010 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",undefined);
        expect(resultSet.rowCount).assertEqual(0);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql010 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql011
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1100
     * @tc.desc   bindArgs数组超了
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql011 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE name = ?",["Alice",'Bob']);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(-1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql011 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql012
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1200
     * @tc.desc   超2M
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql012 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket2m);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test where age = ?",[122341465656]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql012 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql013
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1300
     * @tc.desc   所有数据类型
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql013 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valuesBucket1);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test where name = ?",["hangman"]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        console.info(TAG + " resultSet columnNames " + resultSet.columnNames);
        console.info(TAG + " resultSet columnCount " + resultSet.columnCount);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        console.info(TAG + " resultSet rowIndex " + resultSet.rowIndex);
        console.info(TAG + " resultSet isAtFirstRow " + resultSet.isAtFirstRow);
        console.info(TAG + " resultSet isAtLastRow " + resultSet.isAtLastRow);
        console.info(TAG + " resultSet isEnded " + resultSet.isEnded);
        console.info(TAG + " resultSet isStarted " + resultSet.isStarted);
        console.info(TAG + " resultSet isClosed " + resultSet.isClosed);
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
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql013 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql014
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1400
     * @tc.desc   两个条件
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql014 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep("SELECT * FROM test WHERE age > ? and name = ?",[0,"Alice"]);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        resultSet.close()
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* rdbtestQueryByStepSql014 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql015
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1500
     * @tc.desc   sql注入
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql015 start *************');
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
      console.info(TAG + '************* rdbtestQueryByStepSql015 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql016
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1600
     * @tc.desc   sql注入
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql016 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      try{
        let insertNum = await store.insert("test", valueBucket0);
        expect(insertNum).assertEqual(1);
        let resultSet = await store.queryByStep(null,null);
      }catch (e) {
        console.log(TAG + `testQueryByStepSql failed,err code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual("401");
      }
      console.info(TAG + '************* rdbtestQueryByStepSql016 end *************');
    })
    /**
     * @tc.name   rdbtestQueryByStepSql017
     * @tc.number SUB_DistributedData_RelationalStore_rdbtestQueryByStepSql_1700
     * @tc.desc  return value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('rdbtestQueryByStepSql017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* rdbtestQueryByStepSql017 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);
      let resultSet = await store.queryByStep("SELECT * FROM test", []);
      expect(resultSet.rowCount).assertEqual(1);
      expect(resultSet.goToFirstRow()).assertEqual(true);
      expect(resultSet.getString(resultSet.getColumnIndex("name"))).assertEqual("Alice");
      resultSet.close();
      console.info(TAG + '************* rdbtestQueryByStepSql017 end *************');
    }) 
  });
} 