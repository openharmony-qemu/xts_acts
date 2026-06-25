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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@ohos.base';

const TAG = "[RELATIONAL_STORE_TEST >>>>>> ]";
let rdbStore : relationalStore.RdbStore | undefined = undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 real," + "data4 blob)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbQueryByStep.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}


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

export default function RdbQueryByStep() : void {
  describe('rdbQueryByStep', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        expect(rdbStore != undefined).assertTrue();
        await rdbStore?.executeSql(CREATE_TABLE_TEST);
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: relationalStore.ValuesBucket = {
          'data1': 'zhangsan',
          'data2': 18,
          'data3': 25000.0,
          'data4': u8,
        };
        const valueBucket1: relationalStore.ValuesBucket = {
          'data1': 'lisi',
          'data2': 20,
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
    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })
    afterEach(async () => {
      console.info(TAG + 'afterEach');
    })
    afterAll(async () => {
      console.info(TAG + 'afterAll');
      try {
        await rdbStore?.close();
        await relationalStore.deleteRdbStore(context, STORE_CONFIG);
      } catch(error) {
        const err = error as BusinessError;
        console.error(TAG + `afterAll failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_0800
     * @tc.name   queryByStep_001_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_001_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_001_normal_columns start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_001_normal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_001_normal_columns end *************");
    })

      /**
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_0900
       * @tc.name   queryByStep_003_normal_columns
       * @tc.desc   1.The optional parameters columns are not transferred.
       *            2.Set columns to ["data1"].
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it('queryByStep_003_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_003_normal_columns start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + " ------ predicates2: data1------ ");
        resultSet = await rdbStore?.queryByStep(predicates, ["data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(resultSet?.getColumnIndex("data1"));
        console.log(TAG + "predicates2: data1=" + data1);
        expect(data1).assertEqual('zhangsan');
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_003_normal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_003_normal_columns end *************");
    })

      /**
       * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1900
       * @tc.name   queryByStep_004_normal_columns
       * @tc.desc   1.The optional parameters columns are not transferred.
       *            2.Set columns to ["data1"].
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
    it('queryByStep_004_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_004_normal_columns start *************");
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
      console.log(TAG + "************* queryByStep_004_normal_columns end *************");
    })
    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_2100
     * @tc.name   queryByStep_005_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_005_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_005_normal_columns start *************");
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
        console.error(TAG + `predicates4: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_005_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_2000
     * @tc.name   queryByStep_006_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_006_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_006_normal_columns start *************");
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
        console.error(TAG + `predicates5: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_006_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1100
     * @tc.name   queryByStep_007_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_007_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_007_normal_columns start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates6: equalTo=data1, query=data2------ ");
        predicates.equalTo("data1", "zhangsan");
        predicates.greaterThan("data2", 10)
        resultSet = await rdbStore?.queryByStep(predicates, ["data2"]);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(1);
        resultSet?.goToNextRow();
        let data2 = resultSet!.getLong(resultSet!.getColumnIndex("data2"));
        console.log(TAG + "data2=" + data2);
        expect(data2).assertEqual(18);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `predicates6: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_007_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_2200
     * @tc.name   queryByStep_008_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_008_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_008_normal_columns start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        console.log(TAG + "------ predicates7: equalTo=data1, query=data2------ ");
        predicates.equalTo("data1", "zhangsan");
        predicates.greaterThan("data2", 20)
        resultSet = await rdbStore?.queryByStep(predicates, ["data2"]);
        console.log(TAG + "resultSet!.rowCount=" + resultSet!.rowCount);
        expect(resultSet!.rowCount).assertEqual(0);
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `predicates7: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_008_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1000
     * @tc.name   queryByStep_009_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_009_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_009_normal_columns start *************");
      let resultSet: relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates,[]);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch (e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_001_normal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_009_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1200
     * @tc.name   queryByStep_010_normal_columns
     * @tc.desc   1.The optional parameters columns are not transferred.
     *            2.Set columns to ["data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_010_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_010_normal_columns start *************");
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
        console.error(TAG + `predicates6: failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_010_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1400
     * @tc.name   queryByStep_002_normal_columns
     * @tc.desc   1.Set columns to null
     *            2.Set columns to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_002_normal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_002_normal_columns start *************");
      let resultSet : relationalStore.ResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates, null);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_002_normal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }

      try {
        resultSet = await rdbStore?.queryByStep(predicates, undefined);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_002_normal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_002_normal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_1500
     * @tc.name   queryByStep_003_Abnormal_columns
     * @tc.desc   1.Set columns to [null]
     *            2.Set columns to [undefined]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_003_Abnormal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_003_Abnormal_columns start *************");
      let resultSet : relationalStore.ResultSet | undefined = undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates, [null]);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_003_Abnormal_columns failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual("401");
      } finally {
        resultSet?.close();
      }

      try {
        resultSet = await rdbStore?.queryByStep(predicates, [undefined]);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_003_Abnormal_columns failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual("401");
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_003_Abnormal_columns end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_1600
     * @tc.name   queryByStep_004_Abnormal_columns
     * @tc.desc   1.Set columns to [].
     *            2.Set columns to [""].
     *            3.Set columns to ["", "data1"].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_004_Abnormal_columns',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_004_Abnormal_columns start *************");
      let resultSet : relationalStore.ResultSet | undefined;
      let predicates = new relationalStore.RdbPredicates('test');
      try {
        resultSet = await rdbStore?.queryByStep(predicates, []);
        if (resultSet) {
          checkResultSetForNormalGet(resultSet);
        }
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_004_Abnormal_columns failed message:${err.message} code:${err.code}`);
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
        console.error(TAG + `queryByStep_004_Abnormal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }

      try {
        resultSet = await rdbStore?.queryByStep(predicates, ["", "data1"]);
        resultSet?.goToNextRow();
        let data1 = resultSet?.getString(resultSet?.getColumnIndex("data1"));
        expect(data1).assertEqual('zhangsan');
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_004_Abnormal_columns failed message:${err.message} code:${err.code}`);
        expect().assertFail();
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_004_Abnormal_columns end *************");
    })

     /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_1700
     * @tc.name   queryByStep_005_abnormal_predicates
     * @tc.desc   1.Set RdbPredicates to [null]
     *            2.Set RdbPredicates to [undefined]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_005_abnormal_predicates',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_005_abnormal_predicates start *************");
      let resultSet : relationalStore.ResultSet | undefined = undefined;
      try {
        resultSet = await rdbStore?.queryByStep(undefined);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_005_abnormal_predicates failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual("401");
      } finally {
        resultSet?.close();
      }

      try {
        resultSet = await rdbStore?.queryByStep(null);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_005_abnormal_predicates failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual("401");
      } finally {
        resultSet?.close();
      }
      console.log(TAG + "************* queryByStep_005_abnormal_predicates end *************");
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_1300
     * @tc.name   queryByStep_006_abnormal_rdbStoreIsClose
     * @tc.desc   queryByStep predicates mode error test with closed RdbStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('queryByStep_006_abnormal_rdbStoreIsClose',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  () => {
      console.log(TAG + "************* queryByStep_006_abnormal_rdbStoreIsClose start *************");
      let resultSet : relationalStore.ResultSet | undefined = undefined;
      try {
        await rdbStore?.close();
        let predicates = new relationalStore.RdbPredicates('test');
        resultSet = await rdbStore?.queryByStep(predicates);
        expect().assertFail();
      } catch(e) {
        const err = e as BusinessError;
        console.error(TAG + `queryByStep_006_abnormal_rdbStoreIsClose failed message:${err.message} code:${err.code}`);
        expect(e.code).assertEqual("14800014");
      } finally {
        resultSet?.close();
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      }
      console.log(TAG + "************* queryByStep_006_abnormal_rdbStoreIsClose end *************");
    })
    /**
     * @tc.name   relationalstoretestQueryByStepSql_0023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_QueryByStep_Predicates_2300
     * @tc.desc   所有数据类型
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  LEVEL2
     */
    it('relationalstoretestQueryByStepSql_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async  () => {
      console.info(TAG + '************* relationalstoretestQueryByStepSql_0023 start *************');
      let predicates = new data_relationalStore.RdbPredicates('test');
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST, []);
      try{
        let insertNum = await rdbStore.insert("test", valuesBucket1);
        expect(insertNum).assertEqual(1);
        let resultSet = await rdbStore?.queryByStep(predicates);
        console.info(TAG + " resultSet rowCount " + resultSet.rowCount);
        expect(resultSet.rowCount).assertEqual(1);
        console.info(TAG + " resultSet columnNames " + JSON.stringify(resultSet.columnNames));
        expect(resultSet.columnNames[0]).assertEqual("id");
        console.info(TAG + " resultSet columnCount " + JSON.stringify(resultSet.columnCount));
        expect(resultSet.columnCount).assertEqual(10);
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
        console.log(TAG + `relationalstoretestQueryByStepSql_0023 failed,err code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      console.info(TAG + '************* relationalstoretestQueryByStepSql_0023 end *************');
    })
  })
}