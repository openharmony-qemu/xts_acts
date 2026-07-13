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
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

const TAG = "[RELATIONAL_STORE_TEST >>>>>> ]";
let rdbStore : relationalStore.RdbStore | undefined = undefined;
let context:common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 real," + "data4 blob)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQueryByStep.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
const u8 = new Uint8Array([1, 2, 3]);
const valuesBucket1: relationalStore.ValuesBucket = {
  'data1': 'zhangsan',
  'data2': 18 as long,
  'data3': 25000.0,
  'data4': u8,
};
function checkResultSetForNormalGet(resultSet : relationalStore.ResultSet){
  let count = 0;
  let rowCount = resultSet.rowCount;
  console.info(TAG + 'rowCount=' + rowCount);
  try {
    while(resultSet.goToNextRow()) {
      count++;
      if(count === 1) {
        console.info(TAG + 'count1=' + count)
        let index = resultSet.getColumnIndex("id");
        expect(index).assertEqual(0);
        let id = resultSet.getLong(index);
        expect(id).assertEqual(1);
        index = resultSet.getColumnIndex("data1");
        let data1 = resultSet.getString(index);
        expect(data1).assertEqual('zhangsan');
        index = resultSet.getColumnIndex("data2");
        let data2 = resultSet.getLong(index);
        expect(data2).assertEqual(18);
        index = resultSet.getColumnIndex("data3");
        let data3 = resultSet.getDouble(index);
        expect(data3).assertEqual(25000.0);
        index = resultSet.getColumnIndex("data4");
        let data4 = resultSet.getBlob(index);
        expect(data4[0]).assertEqual(1);
        expect(data4[1]).assertEqual(2);
        expect(data4[2]).assertEqual(3);
      }
      if(count === 2) {
        console.info(TAG + 'count2=' + count);
        let index = resultSet.getColumnIndex("id");
        expect(index).assertEqual(0);
        let id = resultSet.getLong(index);
        expect(id).assertEqual(2);
        index = resultSet.getColumnIndex("data1");
        let data1 = resultSet.getString(index);
        expect(data1).assertEqual('lisi');
        index = resultSet.getColumnIndex("data2");
        let data2 = resultSet.getLong(index);
        expect(data2).assertEqual(20);
        index = resultSet.getColumnIndex("data3");
        let data3 = resultSet.getDouble(index);
        expect(data3).assertEqual(20000.0);
        index = resultSet.getColumnIndex("data4");
        let data4 = resultSet.getBlob(index);
        expect(data4[0]).assertEqual(1);
        expect(data4[1]).assertEqual(2);
        expect(data4[2]).assertEqual(3);
      }
      if(count === 3) {
        expect().assertFail();
        console.info(TAG + 'count3=' + count);
      }
    }
  } catch(e) {
    const err = e as BusinessError;
    console.error(TAG + `checkResultSetForNormalGet failed message:${err.message} code:${err.code}`);
    expect().assertFail();
  }
}

export default function RelationalStoreArkPredicatesQueryByStepTest(): void {
  describe('RelationalStoreArkPredicatesQueryByStepTest', (): void => {
    beforeAll(async ():Promise<void> => {
      console.info(TAG + 'beforeAll')
      try {
        let cmd = "aa start -a EntryAbility -b com.example.relationalstore";
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
          cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd)
        await Utils.msSleep(5000)
        context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
        expect(rdbStore != undefined).assertTrue();
        await rdbStore?.executeSql(CREATE_TABLE_TEST);
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'zhangsan',
          'data2': 18 as long,
          'data3': 25000.0,
          'data4': u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          'data1': 'lisi',
          'data2': 20 as long,
          'data3': 20000.0,
          'data4': u8,
        };
        await rdbStore?.insert('test', valueBucket);
        await rdbStore?.insert('test', valueBucket1);
      } catch(error) {
        const err = error as BusinessError;
        console.error(TAG + `beforeEach failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })
    beforeEach(async ():Promise<void> => {
      console.info(TAG + 'beforeEach');
    })
    afterEach(async ():Promise<void> => {
      console.info(TAG + 'afterEach');
    })
    afterAll(async ():Promise<void> => {
      console.info(TAG + 'afterAll');
      try {
        await rdbStore?.close();
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
      } catch(error) {
        const err = error as BusinessError;
        console.error(TAG + `afterAll failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0001
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0100
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0001 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0001 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0001 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0002
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0200
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0002',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0002 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + " ------ predicates2: data1------ ");
        resultSet = await rdbStore?.queryByStep(predicates, ["data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet!.getString(resultSet!.getColumnIndex("data1"));
        console.log(TAG + "predicates2: data1=" + data1);
        expect(data1).assertEqual('zhangsan');
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0002 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0002 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0003
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0300
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0003',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0003 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates3: equalTo: data1-zhangsan------ ");
        predicates.equalTo("data1", "zhangsan");
        resultSet = await rdbStore?.queryByStep(predicates);
        expect(resultSet!.rowCount).assertEqual(1);
        resultSet?.goToNextRow();
        let data1 = resultSet!.getString(resultSet!.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');

      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `predicates3: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0003 end *************");
    })
    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0004
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0400
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0004',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0004 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates4: equalTo: data1-zhangsan------ ");
        predicates.equalTo("data1", "zhangsan");
        resultSet = await rdbStore?.queryByStep(predicates, ["data1"]);
        expect(resultSet!.rowCount).assertEqual(1);
        resultSet?.goToNextRow();
        let data1 = resultSet!.getString(resultSet!.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');

      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0004: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0004 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0005
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0500
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0005',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0005 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates5: equalTo=data1, query=data2------ ");
        predicates.equalTo("data1", "zhangsan");
        resultSet = await rdbStore?.queryByStep(predicates, ["data2"]);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(1);
        resultSet?.goToNextRow();
        let data2 = resultSet!.getLong(resultSet!.getColumnIndex("data2"));
        expect(data2).assertEqual(18);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0005: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0005 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0006
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0600
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0006',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0006 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ RdbArkTestQueryByStepPredicates0006: equalTo=data1, query=data2------ ");
        predicates.equalTo("data1", "zhangsan");
        predicates.greaterThan("data2", 10 as long)
        resultSet = await rdbStore?.queryByStep(predicates, ["data2"]);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(1);
        resultSet?.goToNextRow();
        let data2 = resultSet!.getLong(resultSet!.getColumnIndex("data2"));
        console.log(TAG + "data2=" + data2);
        expect(data2).assertEqual(18);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0006: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0006 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0007
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0700
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0007',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0007 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates7: equalTo=data1, query=data2------ ");
        predicates.equalTo("data1", "zhangsan");
        predicates.greaterThan("data2", 20 as long)
        resultSet = await rdbStore?.queryByStep(predicates, ["data2"]);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(0);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0007: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0007 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0008
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0800
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0008',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0008 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates,[]);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0008 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0008 end *************");
    })

    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0009
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0900
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0009',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0009 start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        predicates.orderByDesc("data2");
        resultSet = await rdbStore?.queryByStep(predicates);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(2);
        resultSet?.goToNextRow();
        let data2 = resultSet!.getLong(resultSet!.getColumnIndex("data2"));
        console.log(TAG + "data2=" + data2);
        expect(data2).assertEqual(20);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0009: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0009 end *************");
    })
    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0010
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepSql_1000
     * @tc.desc   1.Set columns to [].
     *            2.Set columns to [""].
     *            3.Set columns to ["", "data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0010',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0010 start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates, []);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0010 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      try {
        resultSet = await rdbStore?.queryByStep(predicates, [""]);
        console.error(TAG + `004-2: resultSet.rowCount=`  + resultSet?.rowCount);
        expect(resultSet?.rowCount).assertEqual(-1);
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0010 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }

      try {
        resultSet = await rdbStore?.queryByStep(predicates, ["", "data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet!.getString(resultSet!.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0010 failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0010 end *************");
    })
    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0011
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_0110
     * @tc.desc   queryByStep predicates mode error test with closed RdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0011',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  ():Promise<void> => {
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0011 start *************");
      let resultSet : relationalStore.ResultSet | undefined = undefined;
      try {
        await rdbStore?.close();
        let predicates = new relationalStore.RdbPredicates('test');
        resultSet = await rdbStore?.queryByStep(predicates);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `RdbArkTestQueryByStepPredicates0011 failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual(14800014);
      } finally {
        resultSet?.close();
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      }
      console.log(TAG + "************* RdbArkTestQueryByStepPredicates0011 end *************");
    })
    /**
     * @tc.name   RdbArkTestQueryByStepPredicates0012
     * @tc.number SUB_DistributedData_RelationalStore_RdbArkTestQueryByStepPredicates_1200
     * @tc.desc   所有数据类型
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('RdbArkTestQueryByStepPredicates0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  ():Promise<void> => {
      console.info(TAG + '************* RdbArkTestQueryByStepPredicates0012 start *************');
      let predicates = new relationalStore.RdbPredicates('test');
      let rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, []);
      try{
        let insertNum = await rdbStore.insert("test", valuesBucket1);
        expect(insertNum).assertEqual(3);
        let resultSet = await rdbStore?.queryByStep(predicates);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(3);
        console.info(TAG + " resultSet columnNames " + JSON.stringify(resultSet.columnNames));
        expect(resultSet.columnNames[0] as string ).assertEqual("id");
        console.info(TAG + " resultSet columnCount " + JSON.stringify(resultSet.columnCount));
        expect(resultSet.columnCount).assertEqual(5);
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
        console.log(TAG + `RdbArkTestQueryByStepPredicates0012 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* RdbArkTestQueryByStepPredicates0012 end *************');
    })
  })
}