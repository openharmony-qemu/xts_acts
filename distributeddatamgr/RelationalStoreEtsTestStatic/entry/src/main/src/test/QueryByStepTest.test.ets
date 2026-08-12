
'use static';
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

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT, " +
  "age INTEGER, " +
  "score REAL, " +
  "info BLOB" +
  ")";

let valueBucket0: relationalStore.ValuesBucket = {
  "name": "Alice",
  "age": 10 as long,
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

export default function queryByStepTest(): void {
  describe('queryByStepTest', () => {
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

    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context!, config);
      console.info(TAG + "create RelationalStore store success");
      await rdbStore!.executeSql(CREATE_TABLE_TEST, []);
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context!, config);
      rdbStore = null;
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   testQueryByStepPredicates0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_0800
     * @tc.desc   正常查询-无columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0001 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet = await store.queryByStep(predicates);

      expect(resultSet!.rowCount).assertEqual(1);
      expect(resultSet!.goToFirstRow()).assertEqual(true);
      verifyRowData(resultSet, valueBucket0);
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0001 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_0900
     * @tc.desc   正常查询-指定columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0002 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet = await store.queryByStep(predicates, ["name", "age"]);

      expect(resultSet!.columnCount).assertEqual(2);
      expect(resultSet!.rowCount).assertEqual(1);
      expect(resultSet!.goToFirstRow()).assertEqual(true);
      expect(resultSet!.getString(resultSet!.getColumnIndex("name"))).assertEqual("Alice");
      expect(resultSet!.getLong(resultSet!.getColumnIndex("age"))).assertEqual(10 as long);
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0002 end *************');
    })


    /**
     * @tc.name   testQueryByStepPredicates0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1000
     * @tc.desc   正常查询-空columns数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0003 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet = await store.queryByStep(predicates, []);

      expect(resultSet!.rowCount).assertEqual(1);
      expect(resultSet!.goToFirstRow()).assertEqual(true);
      expect(resultSet!.getString(resultSet!.getColumnIndex("name"))).assertEqual("Alice");
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0003 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1100
     * @tc.desc   正常查询-多条件组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0004 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      await store.insert("test", valueBucket0);
      await store.insert("test", valueBucket1);
      await store.insert("test", valueBucket2);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice").greaterThan("age", 5 as long);
      let resultSet = await store.queryByStep(predicates);

      expect(resultSet!.rowCount).assertEqual(1);
      expect(resultSet!.goToFirstRow()).assertEqual(true);
      verifyRowData(resultSet, valueBucket0);
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0004 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1200
     * @tc.desc   正常查询-orderBy排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0005 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      await store.insert("test", valueBucket0);
      await store.insert("test", valueBucket1);
      await store.insert("test", valueBucket2);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.orderByDesc("age");
      let resultSet = await store.queryByStep(predicates);

      expect(resultSet!.rowCount).assertEqual(3);
      expect(resultSet!.goToFirstRow()).assertEqual(true);
      expect(resultSet!.getLong(resultSet!.getColumnIndex("age"))).assertEqual(300 as long);
      expect(resultSet!.goToNextRow()).assertEqual(true);
      expect(resultSet!.getLong(resultSet!.getColumnIndex("age"))).assertEqual(200 as long);
      expect(resultSet!.goToNextRow()).assertEqual(true);
      expect(resultSet!.getLong(resultSet!.getColumnIndex("age"))).assertEqual(10 as long);
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0005 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1300
     * @tc.desc   正常查询-指定columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0006 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet = await store.queryByStep(predicates, ["", "age"]);

      expect(resultSet!.columnCount).assertEqual(1);
      expect(resultSet!.rowCount).assertEqual(1);
      resultSet!.close();
      console.info(TAG + '************* testQueryByStepPredicates0006 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1400
     * @tc.desc   columns为[""]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0007 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore?.queryByStep(predicates, [""]);
        expect(resultSet!.rowCount).assertEqual(-1);
      } catch(e) {
        console.error(TAG + `testQueryByStepPredicates0007 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.info(TAG + '************* testQueryByStepPredicates0007 end *************');
    })

    /**
     * @tc.name   testQueryByStepPredicates0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1500
     * @tc.desc   columns为["aaaaaaaa"]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0008 start *************');
      let store = rdbStore as relationalStore.RdbStore;
      let insertNum = await store.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet : relationalStore.ResultSet | undefined;
      try {
        resultSet = await rdbStore?.queryByStep(predicates,["aaaaaaaa"]);
        console.info(TAG + 'resultSet!.rowCount=' + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(-1);
      } catch(e) {
        console.error(TAG + `testQueryByStepPredicates0008 failed message:${e.message} code:${e.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.info(TAG + '************* testQueryByStepPredicates0008 end *************');
    })


    /**
     * @tc.name   testQueryByStepPredicates0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1600
     * @tc.desc   RdbStore已关闭
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0009 start *************');
      let insertNum = await rdbStore!.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);
      console.info(TAG + 'insertNum=' + insertNum);

      let predicates = new relationalStore.RdbPredicates("test");
      predicates.equalTo("name", "Alice");
      let resultSet : relationalStore.ResultSet | undefined;

      await rdbStore?.close();
      console.info(TAG + '11111111');

      try {
        resultSet = await rdbStore?.queryByStep(predicates,["name"]);
        console.info(TAG + 'resultSet!.rowCount=' + resultSet!.rowCount);
        expect().assertFail();
      } catch(e) {
        console.error(TAG + `testQueryByStepPredicates0009 failed message:${e.message} code:${e.code}`);
        expect(e.code).assertEqual(14800014);
      } finally {
        resultSet?.close();
      }
      console.info(TAG + '************* testQueryByStepPredicates0009 end *************');
    })


    /**
     * @tc.name   testQueryByStepPredicates0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Static_1700
     * @tc.desc   columns为["name"]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testQueryByStepPredicates0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************* testQueryByStepPredicates0010 start *************');
      let insertNum = await rdbStore!.insert("test", valueBucket0);
      expect(insertNum).assertEqual(1);
      console.info(TAG + 'insertNum=' + insertNum);

      let predicates = new relationalStore.RdbPredicates("test111");
      predicates.equalTo("name", "Alice");
      let resultSet : relationalStore.ResultSet | undefined;

      console.info(TAG + '11111111');

      try {
        resultSet = await rdbStore?.queryByStep(predicates,["name"]);
        console.info(TAG + 'resultSet!.rowCount=' + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(-1);
      } catch(e) {
        console.error(TAG + `testQueryByStepPredicates0010 failed message:${e.message} code:${e.code}`);

        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.info(TAG + '************* testQueryByStepPredicates0010 end *************');
    })

  })
}
