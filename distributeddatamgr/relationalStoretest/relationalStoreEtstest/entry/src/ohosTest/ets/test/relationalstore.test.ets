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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size,TestType } from '@ohos/hypium'
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { sendableRelationalStore } from '@kit.ArkData';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_EMPLOYEE = "CREATE TABLE IF NOT EXISTS employee (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER)";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";
let num = 'a'.repeat(1024*1024*2);
const valueBucket2m: relationalStore.ValuesBucket = {
  'name': num,
  'age': 122341465656,
};
const valueBucketEqual2m: relationalStore.ValuesBucket = {
  'name': num,
};
const sendableValusBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket2m);
const sendableValusBucket1 = sendableRelationalStore.toSendableValuesBucket(valueBucketEqual2m);
const STORE_CONFIG : relationalStore.StoreConfig= {
  name: "rdbStoreTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let rdbStore:relationalStore.RdbStore;
function sleep(ms:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  })
}
export default function relationalStoreInterfaceTest() {
  describe('relationalStoreInterfaceTest', ()=> {
    beforeAll(async ()=> {
      console.info(TAG + "*************Unit Test Begin*************");
      console.info(TAG + 'beforeAll');

    })

    beforeEach(async ()=> {
      console.info(TAG + 'beforeEach');
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore.executeSql(CREATE_TABLE_EMPLOYEE, null);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    })

    afterEach(async ()=> {
      console.info(TAG + 'afterEach');
      await relationalStore.deleteRdbStore(context,"rdbStoreTest.db")
    })

    afterAll(async ()=> {

      console.info(TAG + 'afterAll');

      console.info(TAG + "*************Unit Test end*************");
    })

    /**
     * @tc.name delete success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0100
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('relationalStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      console.info(TAG + "************* relationalStoreTest001 start *************");
          const record :relationalStore.ValuesBucket = {
            "name": "Jim",
            "age": 30,
          }
          await (rdbStore as relationalStore.RdbStore).insert("employee", record)
          let predicates = await new relationalStore.RdbPredicates("employee");
          predicates.equalTo("age", 30);
          (rdbStore as relationalStore.RdbStore).delete(predicates,async(err, rows) => {
            if (err) {
              console.log(TAG + "delete failed" + err.code + err.message)
              expect(null).assertFail()
              done()
            } else {
              console.log(TAG + "delete successs")
              expect(1).assertEqual(rows)
              done()
            }
          })
      console.info(TAG + "************* relationalStoreTest001 end *************");
    })
    /**
     * @tc.name query success callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0200
     * @tc.desc query success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('relationalStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest002 start *************");
      const record:relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30,
      }

      await (rdbStore as relationalStore.RdbStore).insert("employee", record)
      let predicates = await new relationalStore.RdbPredicates("employee");
      predicates.equalTo("age", 30);
      (rdbStore as relationalStore.RdbStore).query(predicates, async(err, resultSet) => {
        if (err == null) {
          console.info(TAG + "query one record success,resultSet.rowCount is " + resultSet.rowCount)
          expect(1).assertEqual(resultSet.rowCount)
          done()
        }
        else{
          console.log(TAG + "query failed ")
          expect(null).assertFail();
          done()
        }
      })
      console.info(TAG + "************* relationalStoreTest002 end *************");
    })
      /**
       * @tc.name querysql executeSql success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0300
       * @tc.desc querysql executeSql success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest003 start *************");
        const record :relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE where name = 'Jim'", async(err:BusinessError) => {
          if (err == null) {
           // console.info(TAG + "executesql success")
            (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE", async(err:BusinessError, resultSet:relationalStore.ResultSet) => {
              if (err == null) {
                console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
                expect(0).assertEqual(resultSet.rowCount)
                done()
              }
              else{
                console.log(TAG + "querysql failed ")
                expect(null).assertFail();
                done()
              }
            })
          }
          else{
            console.log(TAG + "executesql failed ")
            expect(null).assertFail();
            done()
          }
        })
        console.info(TAG + "************* relationalStoreTest003 end *************");
      })

      /**
       * @tc.name executesql querysql success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0400
       * @tc.desc executesql querysql success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest004 start *************");
        const record :relationalStore.ValuesBucket= {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        (rdbStore as relationalStore.RdbStore).executeSql("DELETE FROM EMPLOYEE  WHERE name = ?",["Jim"], async(err:BusinessError) => {
          if (err == null) {
            //console.info(TAG + "executesql success ")
            (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"], async(err:BusinessError, resultSet:relationalStore.ResultSet) => {
              if (err == null) {
                console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
                expect(0).assertEqual(resultSet.rowCount)
                done()
              }
              else{
                console.log(TAG + "querysql failed ")
                expect(null).assertFail();
                done()
              }
            })
          }
          else{
            console.log(TAG + "executesql failed ")
            expect(null).assertFail();
            done()
          }
        })
        console.info(TAG + "************* relationalStoreTest004 end *************");
      })
      /**
       * @tc.name querySqlSync success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0500
       * @tc.desc querySqlSync success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest005 start *************");
        const record:relationalStore.ValuesBucket = {
          "name": "Jim",
          "age": 30,
        }
        try {
          await (rdbStore as relationalStore.RdbStore).insert("employee", record)
          let resultSet = (rdbStore as relationalStore.RdbStore).querySqlSync("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"])
          console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
          expect(1).assertEqual(resultSet.rowCount)
          done()
        }catch(err){
          console.log(TAG + "querysql failed ")
          expect(null).assertFail();
          done()
        }
        console.info(TAG + "************* relationalStoreTest005 end *************");
      })
      /**
       * @tc.name backup success callback
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0600
       * @tc.desc backup success callback
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */
      it('relationalStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.info(TAG + "************* relationalStoreTest006 start *************");
        const record : relationalStore.ValuesBucket= {
          "name": "Jim",
          "age": 30,
        }
        await (rdbStore as relationalStore.RdbStore).insert("employee", record)
        rdbStore.backup("backdb.db",async(err)=>{
          if (err) {
            console.log(TAG+`Backup failed, code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          }
          else {
            console.log(TAG+ "backup success");
            const STORE_CONFIG1 : relationalStore.StoreConfig= {
              name: "backdb.db",
              securityLevel: relationalStore.SecurityLevel.S1,
            }
            rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);
            console.info(TAG + "create rdb store success")
            let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("SELECT * FROM EMPLOYEE  WHERE name = ?",["Jim"])
            console.info(TAG + "querysql success,resultSet.rowCount is " + resultSet.rowCount)
            expect(1).assertEqual(resultSet.rowCount)
            done()
          }
       })
        console.info(TAG + "************* relationalStoreTest006 end *************");
      })
      /**
       * @tc.name getrows success
       * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0700
       * @tc.desc getrows success
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level 2
       */

      it('relationalStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        console.log(TAG + "************* relationalStoreTest007 start *************");
          const valueBucket1:relationalStore.ValuesBucket = {
            "name": "zhangsan",
            "age": 30,
          }
          const valueBucket2:relationalStore.ValuesBucket = {
            "name": "lisi",
            "age": 30,
          }
          const valueBucket3:relationalStore.ValuesBucket = {
            "name": "zhoubiao",
            "age": 30,
          }
          let valueBuckets = new Array(valueBucket1, valueBucket2, valueBucket3);
          await (rdbStore as relationalStore.RdbStore).batchInsertSync("employee",valueBuckets)
          console.info(TAG + 'batchInsertSync successfully.');
          let predicates = await new relationalStore.RdbPredicates('employee');
          predicates.equalTo("age", 30);
          let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
          console.info(TAG + 'querySync successfully.');
          try {
            let rows:Array<relationalStore.ValuesBucket>
            let maxCount:number = 2
            let position:number = 0
            console.log(TAG + "111111" )
            rows = await (resultSet as relationalStore.ResultSet).getRows(maxCount,position)
            console.log(TAG + "rows" + rows.length + JSON.stringify(rows[0]))
            expect(rows.length).assertEqual(2)
            done()
           }catch (err) {
            console.log(TAG + err +"relationalStoreTest008 failed" + err.code);
            expect().assertFail()
            done();
         }
        console.log(TAG + "************* relationalStoreTest007 end *************");
      })
    /**
     * @tc.name querySync success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0800
     * @tc.desc querySync success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest008 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
        try {
            (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
            let predicates = await new relationalStore.RdbPredicates("employee");
            predicates.equalTo("age", 30);
            let resultSet: relationalStore.ResultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates, ["ID", "NAME", "AGE"]);
            console.log(TAG +"resultSet.rowCount"+resultSet.rowCount);
            expect(resultSet.rowCount).assertEqual(1)
            resultSet.close();
            done()
          } catch (err) {
            console.log(TAG + "Query failed,"+err.code+err.message)
            expect().assertFail()
            done()
          }

      console.info(TAG + "************* relationalStoreTest008 end *************");
    })

    /**
     * @tc.name executesql success
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_0900
     * @tc.desc executesql success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest009 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let data = (rdbStore as relationalStore.RdbStore).executeSync("DELETE FROM EMPLOYEE WHERE name = ?",["Jim"]);
        console.log(TAG + "query success"+ data );
        expect(data).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest009 end *************");
    })
    /**
     * @tc.name relationalStoreTest010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1000
     * @tc.desc querySync success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest010 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let predicates = await new relationalStore.RdbPredicates("employee where age = 30");
        let resultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(resultSet.rowCount).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest010 end *************");
    })
    /**
     * @tc.name relationalStoreTest011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1100
     * @tc.desc query success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest011 start *************");
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": 30,
      };
      try {
        (rdbStore as relationalStore.RdbStore).insertSync("employee", record);
        let predicates = await new relationalStore.RdbPredicates("employee where age = 30");
        let resultSet = await (rdbStore as relationalStore.RdbStore).query(predicates);
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(resultSet.rowCount).assertEqual(1)
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest011 end *************");
    })
    /**
     * @tc.name relationalStoreTest012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2300
     * @tc.desc Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest012 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType("age")
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        expect(String(valueNum)).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest012 end *************");
    })
    /**
     * @tc.name relationalStoreTest013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2400
     * @tc.desc Number.MIN_SAFE_INTEGER*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest013 start *************");
      let valueNum = Number.MIN_SAFE_INTEGER*10;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        console.log(TAG + "str:" + str);
        console.log(TAG + "valueNum:" + valueNum);
        expect(valueNum < Number.MIN_SAFE_INTEGER).assertTrue()
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest013 end *************");
    })
    /**
     * @tc.name relationalStoreTest014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2500
     * @tc.desc Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest014 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        expect(String(valueNum)).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest014 end *************");
    })
    /**
     * @tc.name relationalStoreTest015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2600
     * @tc.desc Number.MAX_SAFE_INTEGER*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest015 start *************");
      let valueNum = Number.MAX_SAFE_INTEGER*10;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        let str = resultSet.getString(resultSet.getColumnIndex("age"))
        console.log(TAG + "str:" + str);
        console.log(TAG + "valueNum:" + valueNum);
        expect(valueNum > Number.MIN_SAFE_INTEGER).assertTrue()
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest015 end *************");
    })
    /**
     * @tc.name relationalStoreTest016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2700
     * @tc.desc getColumnType test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest016 start *************");
      let valueNum = -500;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getLong(resultSet.getColumnIndex("age"))
        expect(valueNum).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest016 end *************");
    })
    /**
     * @tc.name relationalStoreTest017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_Int64JsAPITest_2800
     * @tc.desc getColumnType test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest017 start *************");
      let valueNum = 500;
      const record :relationalStore.ValuesBucket= {
        "name": "Jim",
        "age": valueNum,
      };
      try {
        await (rdbStore as relationalStore.RdbStore).insert("employee", record);
        let resultSet = await (rdbStore as relationalStore.RdbStore).querySql("select * from employee")
        console.log(TAG+"resultSet.rowCount"+resultSet.rowCount)
        expect(true).assertEqual(resultSet.goToFirstRow());
        let res = await resultSet.getColumnType(resultSet.getColumnIndex("age"))
        console.log(TAG + "res:" + res + typeof(res))
        expect(typeof(valueNum)).assertEqual(typeof(res))
        let str = resultSet.getLong(resultSet.getColumnIndex("age"))
        expect(valueNum).assertEqual(str);
        console.log(TAG + "str:" + str);
        done()
      } catch (err) {
        console.log(TAG + "query failed"+ err.code + err.message);
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest017 end *************");
    })
    /**
     * @tc.name relationalStoreTest018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0100
     * @tc.desc errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest018 start *************");
      try {
        rdbStore.setLocale("")
        console.log(TAG + "relationalStoreTest018");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("14800001").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest018 end *************");
    })
    /**
     * @tc.name relationalStoreTest019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0200
     * @tc.desc errcode is 14800014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest019 start *************");
      rdbStore.close();
      try {
        rdbStore.setLocale("zh")
        console.log(TAG + "relationalStoreTest019");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("14800014").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest019 end *************");
    })
    /**
     * @tc.name relationalStoreTest020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0300
     * @tc.desc errcode is 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest020 start *************");
      try {
        rdbStore.setLocale(undefined)
        console.log(TAG + "relationalStoreTest020");
        done()
      } catch (err) {
        console.log(TAG + "err"+ err.code + err.message);
        expect("401").assertEqual(String(err.code))
        done()
      }
      console.info(TAG + "************* relationalStoreTest020 end *************");
    })
    /**
     * @tc.name relationalStoreTest021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0400
     * @tc.desc setLocale para is "zh-CN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest021 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
      'name': '张三',
      'age': 18,
     };
    const valueBucket2: relationalStore.ValuesBucket = {
      'name': '李四',
      'age': 18,
    };
    const valueBucket3: relationalStore.ValuesBucket = {
      'name': '王五',
      'age': 18,
    };
    await rdbStore?.insert('employee', valueBucket1);
    await rdbStore?.insert('employee', valueBucket2);
    await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-CN");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (e) {
        console.error(`message is ${e.message}  code  ${e.code}`);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest021 end *************");
    })
    /**
     * @tc.name relationalStoreTest022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0500
     * @tc.desc errcode is 14800001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest021 start *************");
      try {
        await rdbStore?.setLocale("%zh%");
        console.log(TAG + "relationalStoreTest022")
        expect().assertFail()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message)
        expect("14800001").assertEqual(String(err.code));
        done()
      }
      console.info(TAG + "************* relationalStoreTest022 end *************");
    })
    /**
     * @tc.name relationalStoreTest023
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0600
     * @tc.desc setLocale para is "zh-Hans"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest023 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-Hans");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest023 end *************");
    })
    /**
     * @tc.name relationalStoreTest024
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0700
     * @tc.desc setLocale para is "zh-Hant"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest024 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh-Hant");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest024 end *************");
    })
    /**
     * @tc.name relationalStoreTest025
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0800
     * @tc.desc setLocale para is "zh"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest025 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': '张三',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': '李四',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': '王五',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("zh");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('李四').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('王五').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('张三').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done()
      }
      console.info(TAG + "************* relationalStoreTest025 end *************");
    })
    /**
     * @tc.name relationalStoreTest026
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetLocale_0900
     * @tc.desc setLocale para is "es"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest026 start *************");
      const valueBucket1: relationalStore.ValuesBucket = {
        'name': 'Fulano',
        'age': 18,
      };
      const valueBucket2: relationalStore.ValuesBucket = {
        'name': 'Mengano',
        'age': 18,
      };
      const valueBucket3: relationalStore.ValuesBucket = {
        'name': 'Zutano',
        'age': 18,
      };
      await rdbStore?.insert('employee', valueBucket1);
      await rdbStore?.insert('employee', valueBucket2);
      await rdbStore?.insert('employee', valueBucket3);
      try {
        await rdbStore?.setLocale("es");
        let resultSet = await rdbStore?.querySql("select * from employee order by name collate LOCALES")
        resultSet?.goToNextRow()
        expect('Fulano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('Mengano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.goToNextRow()
        expect('Zutano').assertEqual(resultSet?.getString(resultSet.getColumnIndex("name")));
        resultSet?.close()
        done()
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message)
        expect().assertFail()
        done()
      }
      console.info(TAG + "************* relationalStoreTest026 end *************");
    })
    /**
     * @tc.name relationalStoreTest027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1200
     * @tc.desc insert para greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest027 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket2m);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest027 end *************");
    })

    /**
     * @tc.name relationalStoreTest028
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1300
     * @tc.desc insert para greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest028 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket2m,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest028 end *************");
    })

    /**
     * @tc.name relationalStoreTest029
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1400
     * @tc.desc insertSync para greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest029 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      rdbStore?.insertSync("employee",valueBucket2m,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest029 end *************");
    })

    /**
     * @tc.name relationalStoreTest030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1500
     * @tc.desc insertSync para greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest030 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      rdbStore?.insertSync("employee",sendableValusBucket,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest030 end *************");
    })

    /**
     * @tc.name relationalStoreTest031
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1600
     * @tc.desc insert para greater than 2MB queryLockedRow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest031 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket2m);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.queryLockedRow(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest031 end *************");
    })
    /**
     * @tc.name relationalStoreTest032
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1700
     * @tc.desc insert para greater than 2MB querySync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest032 start *************");
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket2m);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = rdbStore?.querySync(predicates);
      resultSet.goToFirstRow();
      try{
        const age = resultSet?.getLong(resultSet.getColumnIndex("age"))
        console.log(TAG + "age:" + age);
        expect(age == 122341465656).assertTrue();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect().assertFail();
        done();
      }
      console.info(TAG + "************* relationalStoreTest032 end *************");
    })
    /**
     * @tc.name relationalStoreTest033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1800
     * @tc.desc update param greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest033 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
         'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      await rdbStore?.update(valueBucket2m,predicates);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest033 end *************");
    })

    /**
     * @tc.name relationalStoreTest034
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_1900
     * @tc.desc update param greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest034 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      await rdbStore?.update(valueBucket2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest034 end *************");
    })

    /**
     * @tc.name relationalStoreTest035
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2000
     * @tc.desc updateSync param greater than 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest035 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      rdbStore?.updateSync(valueBucket2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest035 end *************");
    })
   /**
     * @tc.name testDataChange001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2100
     * @tc.desc Register callback for dataChange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
   it('testDataChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testDataChange001 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (devices: Array<string>) => {
      console.info(TAG + " dataChange storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);

    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);

    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
    rdbStore2?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
    rdbStore2?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
    rdbStore2?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
    rdbStore2?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
    rdbStore2?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testDataChange001 end *************");
  })

  /**
   * @tc.name testDataChange002
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2200
   * @tc.desc Register callback for dataChange
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testDataChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testDataChange002 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (devices: Array<string>) => {
      console.info(TAG + " dataChange1 storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
    rdbStore?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);

    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver6);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver7);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver8);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver9);
    rdbStore2?.on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver10);
    await rdbStore2.close();
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(500);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(0);
    expect(status7).assertEqual(0);
    expect(status8).assertEqual(0);
    expect(status9).assertEqual(0);
    expect(status10).assertEqual(0);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver1);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver2);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver3);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver4);
    rdbStore?.off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL_DETAILS, storeObserver5);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testDataChange002 end *************");
  })

  /**
   * @tc.name testEvent001
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2300
   * @tc.desc Register callback for event
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testEvent001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testEvent001 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = () => {
      console.info(TAG + " event storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = () => {
      console.info(TAG + " event storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = () => {
      console.info(TAG + " event storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = () => {
      console.info(TAG + " event storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = () => {
      console.info(TAG + " event storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = () => {
      console.info(TAG + " event storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = () => {
      console.info(TAG + " event storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = () => {
      console.info(TAG + " event storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = () => {
      console.info(TAG + " event storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = () => {
      console.info(TAG + " event storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('event', true, storeObserver1);
    rdbStore?.on('event', true, storeObserver2);
    rdbStore?.on('event', true, storeObserver3);
    rdbStore?.on('event', true, storeObserver4);
    rdbStore?.on('event', true, storeObserver5);
    rdbStore2?.on('event', true, storeObserver6);
    rdbStore2?.on('event', true, storeObserver7);
    rdbStore2?.on('event', true, storeObserver8);
    rdbStore2?.on('event', true, storeObserver9);
    rdbStore2?.on('event', true, storeObserver10);
    rdbStore?.emit('event');
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('event', true, storeObserver1);
    rdbStore?.off('event', true, storeObserver2);
    rdbStore?.off('event', true, storeObserver3);
    rdbStore?.off('event', true, storeObserver4);
    rdbStore?.off('event', true, storeObserver5);
    rdbStore2?.off('event',true, storeObserver6);
    rdbStore2?.off('event',true, storeObserver7);
    rdbStore2?.off('event',true, storeObserver8);
    rdbStore2?.off('event',true, storeObserver9);
    rdbStore2?.off('event',true, storeObserver10);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testEvent001 end *************");

  })

  /**
   * @tc.name testEvent002
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2400
   * @tc.desc Register callback for event
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testEvent002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testEvent002 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = () => {
      console.info(TAG + " event1 storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = () => {
      console.info(TAG + " event1 storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = () => {
      console.info(TAG + " event1 storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = () => {
      console.info(TAG + " event1 storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = () => {
      console.info(TAG + " event1 storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = () => {
      console.info(TAG + " event1 storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = () => {
      console.info(TAG + " event1 storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = () => {
      console.info(TAG + " event1 storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = () => {
      console.info(TAG + " event1 storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = () => {
      console.info(TAG + " event1 storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('event', true, storeObserver1);
    rdbStore?.on('event', true, storeObserver2);
    rdbStore?.on('event', true, storeObserver3);
    rdbStore?.on('event', true, storeObserver4);
    rdbStore?.on('event', true, storeObserver5);
    rdbStore2?.on('event', true, storeObserver6);
    rdbStore2?.on('event', true, storeObserver7);
    rdbStore2?.on('event', true, storeObserver8);
    rdbStore2?.on('event', true, storeObserver9);
    rdbStore2?.on('event', true, storeObserver10);
    await rdbStore2.close();
    rdbStore?.emit('event');
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1)
    expect(status3).assertEqual(1)
    expect(status4).assertEqual(1)
    expect(status5).assertEqual(1)
    expect(status6).assertEqual(0);
    expect(status7).assertEqual(0);
    expect(status8).assertEqual(0);
    expect(status9).assertEqual(0);
    expect(status10).assertEqual(0);
    rdbStore?.off('event', true, storeObserver1);
    rdbStore?.off('event', true, storeObserver2);
    rdbStore?.off('event', true, storeObserver3);
    rdbStore?.off('event', true, storeObserver4);
    rdbStore?.off('event', true, storeObserver5);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testEvent002 end *************");

  })

  /**
   * @tc.name testStatistics001
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2500
   * @tc.desc Register callback for statistics
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testStatistics001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testStatistics001 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics storeObserver10 into");
      status10 = 1;
    };

    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('statistics', storeObserver1);
    rdbStore?.on('statistics', storeObserver2);
    rdbStore?.on('statistics', storeObserver3);
    rdbStore?.on('statistics', storeObserver4);
    rdbStore?.on('statistics', storeObserver5);
    rdbStore2?.on('statistics', storeObserver6);
    rdbStore2?.on('statistics', storeObserver7);
    rdbStore2?.on('statistics', storeObserver8);
    rdbStore2?.on('statistics', storeObserver9);
    rdbStore2?.on('statistics', storeObserver10);
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('statistics', storeObserver1);
    rdbStore?.off('statistics', storeObserver2);
    rdbStore?.off('statistics', storeObserver3);
    rdbStore?.off('statistics', storeObserver4);
    rdbStore?.off('statistics', storeObserver5);
    rdbStore2?.off('statistics', storeObserver6);
    rdbStore2?.off('statistics', storeObserver7);
    rdbStore2?.off('statistics', storeObserver8);
    rdbStore2?.off('statistics', storeObserver9);
    rdbStore2?.off('statistics', storeObserver10);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testStatistics001 end *************");
  })

  /**
   * @tc.name testStatistics002
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2600
   * @tc.desc Register callback for statistics
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testStatistics002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testStatistics002 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " statistics1 storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('statistics', storeObserver1);
    rdbStore?.on('statistics', storeObserver2);
    rdbStore?.on('statistics', storeObserver3);
    rdbStore?.on('statistics', storeObserver4);
    rdbStore?.on('statistics', storeObserver5);
    rdbStore2?.on('statistics', storeObserver6);
    rdbStore2?.on('statistics', storeObserver7);
    rdbStore2?.on('statistics', storeObserver8);
    rdbStore2?.on('statistics', storeObserver9);
    rdbStore2?.on('statistics', storeObserver10);
    await rdbStore2.close();
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(0);
    expect(status7).assertEqual(0);
    expect(status8).assertEqual(0);
    expect(status9).assertEqual(0);
    expect(status10).assertEqual(0);
    rdbStore?.off('statistics', storeObserver1);
    rdbStore?.off('statistics', storeObserver2);
    rdbStore?.off('statistics', storeObserver3);
    rdbStore?.off('statistics', storeObserver4);
    rdbStore?.off('statistics', storeObserver5);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testStatistics002 end *************");
  })

  /**
   * @tc.name testSqliteErrorOccurred001
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2700
   * @tc.desc Register callback for sqliteErrorOccurred
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testSqliteErrorOccurred001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testSqliteErrorOccurred001 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('sqliteErrorOccurred', storeObserver1);
    rdbStore?.on('sqliteErrorOccurred', storeObserver2);
    rdbStore?.on('sqliteErrorOccurred', storeObserver3);
    rdbStore?.on('sqliteErrorOccurred', storeObserver4);
    rdbStore?.on('sqliteErrorOccurred', storeObserver5);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver6);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver7);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver8);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver9);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver10);
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    try{
      await rdbStore?.insert("test1", valueBucket);
    }catch(err){
      console.log(TAG + err.code +err.message)
    }
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('sqliteErrorOccurred', storeObserver1);
    rdbStore?.off('sqliteErrorOccurred', storeObserver2);
    rdbStore?.off('sqliteErrorOccurred', storeObserver3);
    rdbStore?.off('sqliteErrorOccurred', storeObserver4);
    rdbStore?.off('sqliteErrorOccurred', storeObserver5);
    rdbStore2?.off('sqliteErrorOccurred',storeObserver6);
    rdbStore2?.off('sqliteErrorOccurred',storeObserver7);
    rdbStore2?.off('sqliteErrorOccurred',storeObserver8);
    rdbStore2?.off('sqliteErrorOccurred',storeObserver9);
    rdbStore2?.off('sqliteErrorOccurred',storeObserver10);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testSqliteErrorOccurred001 end *************");

  })

  /**
   * @tc.name testSqliteErrorOccurred002
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2800
   * @tc.desc Register callback for sqliteErrorOccurred
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testSqliteErrorOccurred002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testSqliteErrorOccurred002 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (exceptionMessage: relationalStore.ExceptionMessage) => {
      console.info(TAG + " sqliteErrorOccurred1 storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('sqliteErrorOccurred', storeObserver1);
    rdbStore?.on('sqliteErrorOccurred', storeObserver2);
    rdbStore?.on('sqliteErrorOccurred', storeObserver3);
    rdbStore?.on('sqliteErrorOccurred', storeObserver4);
    rdbStore?.on('sqliteErrorOccurred', storeObserver5);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver6);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver7);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver8);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver9);
    rdbStore2?.on('sqliteErrorOccurred', storeObserver10);
    await rdbStore2.close();
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    try{
      await rdbStore?.insert("test1", valueBucket);
    }catch(err){
      console.log(TAG + err.code +err.message)
    }

    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(0);
    expect(status7).assertEqual(0);
    expect(status8).assertEqual(0);
    expect(status9).assertEqual(0);
    expect(status10).assertEqual(0);
    rdbStore?.off('sqliteErrorOccurred', storeObserver1);
    rdbStore?.off('sqliteErrorOccurred', storeObserver2);
    rdbStore?.off('sqliteErrorOccurred', storeObserver3);
    rdbStore?.off('sqliteErrorOccurred', storeObserver4);
    rdbStore?.off('sqliteErrorOccurred', storeObserver5);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testSqliteErrorOccurred002 end *************");
  })

  /**
   * @tc.name testPerfStat001
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_2900
   * @tc.desc 1. Register callback for perfStat
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testPerfStat001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testPerfStat001 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('perfStat', storeObserver1);
    rdbStore?.on('perfStat', storeObserver2);
    rdbStore?.on('perfStat', storeObserver3);
    rdbStore?.on('perfStat', storeObserver4);
    rdbStore?.on('perfStat', storeObserver5);
    rdbStore2?.on('perfStat', storeObserver6);
    rdbStore2?.on('perfStat', storeObserver7);
    rdbStore2?.on('perfStat', storeObserver8);
    rdbStore2?.on('perfStat', storeObserver9);
    rdbStore2?.on('perfStat', storeObserver10);
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('perfStat', storeObserver1);
    rdbStore?.off('perfStat', storeObserver2);
    rdbStore?.off('perfStat', storeObserver3);
    rdbStore?.off('perfStat', storeObserver4);
    rdbStore?.off('perfStat', storeObserver5);
    rdbStore2?.off('perfStat', storeObserver6);
    rdbStore2?.off('perfStat', storeObserver7);
    rdbStore2?.off('perfStat', storeObserver8);
    rdbStore2?.off('perfStat', storeObserver9);
    rdbStore2?.off('perfStat', storeObserver10);
    done();
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testPerfStat002 end *************");

  })

  /**
   * @tc.name testPerfStat002
   * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3000
   * @tc.desc Register callback for perfStat
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
  it('testPerfStat002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async  (done:Function) => {
    console.log(TAG + "************* testPerfStat002 start *************");
    let status1 = 0;
    let status2 = 0;
    let status3 = 0;
    let status4 = 0;
    let status5 = 0;
    let status6 = 0;
    let status7 = 0;
    let status8 = 0;
    let status9 = 0;
    let status10 = 0;
    let storeObserver1 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver1 into");
      status1 = 1;
    };
    let storeObserver2 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver2 into");
      status2 = 1;
    };
    let storeObserver3 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver3 into");
      status3 = 1;
    };
    let storeObserver4 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver4 into");
      status4 = 1;
    };
    let storeObserver5 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver5 into");
      status5 = 1;
    };
    let storeObserver6 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver6 into");
      status6 = 1;
    };
    let storeObserver7 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver7 into");
      status7 = 1;
    };
    let storeObserver8 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver8 into");
      status8 = 1;
    };
    let storeObserver9 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver9 into");
      status9 = 1;
    };
    let storeObserver10 = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
      console.info(TAG + " perfStat1 storeObserver10 into");
      status10 = 1;
    };
    let rdbStore2:relationalStore.RdbStore | undefined = await relationalStore.getRdbStore(context, STORE_CONFIG);
    expect(rdbStore2 != undefined).assertTrue();
    try{
    rdbStore?.on('perfStat', storeObserver1);
    rdbStore?.on('perfStat', storeObserver2);
    rdbStore?.on('perfStat', storeObserver3);
    rdbStore?.on('perfStat', storeObserver4);
    rdbStore?.on('perfStat', storeObserver5);
    rdbStore2?.on('perfStat', storeObserver6);
    rdbStore2?.on('perfStat', storeObserver7);
    rdbStore2?.on('perfStat', storeObserver8);
    rdbStore2?.on('perfStat', storeObserver9);
    rdbStore2?.on('perfStat', storeObserver10);
    await rdbStore2.close();
    const valueBucket: relationalStore.ValuesBucket = {
      'name': 'zhangsan',
      'age': 18,
      'salary': 25000,
    };
    await rdbStore?.insert("test", valueBucket);
    await sleep(800);
    expect(status1).assertEqual(1);
    expect(status2).assertEqual(1);
    expect(status3).assertEqual(1);
    expect(status4).assertEqual(1);
    expect(status5).assertEqual(1);
    expect(status6).assertEqual(1);
    expect(status7).assertEqual(1);
    expect(status8).assertEqual(1);
    expect(status9).assertEqual(1);
    expect(status10).assertEqual(1);
    rdbStore?.off('perfStat', storeObserver1);
    rdbStore?.off('perfStat', storeObserver2);
    rdbStore?.off('perfStat', storeObserver3);
    rdbStore?.off('perfStat', storeObserver4);
    rdbStore?.off('perfStat', storeObserver5);
    rdbStore2 = await relationalStore.getRdbStore(context, STORE_CONFIG);
    rdbStore2?.off('perfStat');
    await sleep(800);
    done()
    }catch(err){
      console.log(TAG + "err.code" + err.code + err.message);
      expect(null).assertFail();
      done();
    }
    console.log(TAG + "************* testPerfStat002 end *************");
    })
    /**
     * @tc.name relationalStoreTest036
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3100
     * @tc.desc insert para equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest036 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucketEqual2m);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest036 end *************");
    })

    /**
     * @tc.name relationalStoreTest037
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3200
     * @tc.desc insert para equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest037 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucketEqual2m,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest028 end *************");
    })

    /**
     * @tc.name relationalStoreTest038
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3300
     * @tc.desc insertSync para equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest038 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      rdbStore?.insertSync("employee",valueBucketEqual2m,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest038 end *************");
    })

    /**
     * @tc.name relationalStoreTest039
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3400
     * @tc.desc insertSync para equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest039 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      rdbStore?.insertSync("employee",sendableValusBucket1,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.query(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest039 end *************");
    })

    /**
     * @tc.name relationalStoreTest040
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3500
     * @tc.desc insert para equal 2MB queryLockedRow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest040 start *************");

      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucketEqual2m);
      let predicates = new relationalStore.RdbPredicates("employee")
      resultSet = await rdbStore?.queryLockedRow(predicates);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest040 end *************");
    })
    /**
     * @tc.name relationalStoreTest041
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3600
     * @tc.desc update param equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest041 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      await rdbStore?.update(valueBucketEqual2m,predicates);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest041 end *************");
    })

    /**
     * @tc.name relationalStoreTest042
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3700
     * @tc.desc update param equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest042 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      await rdbStore?.update(valueBucketEqual2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest042 end *************");
    })

    /**
     * @tc.name relationalStoreTest044
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBFGAPITest_3800
     * @tc.desc updateSync param equal 2MB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('relationalStoreTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "************* relationalStoreTest043 start *************");
      const valueBucket:relationalStore.ValuesBucket = {
        'name':'lisi',
      }
      let resultSet:relationalStore.ResultSet|undefined;
      await rdbStore?.insert("employee",valueBucket);
      let predicates = new relationalStore.RdbPredicates("employee")
      predicates.equalTo("name","lisi")
      rdbStore?.updateSync(valueBucketEqual2m,predicates,relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      let predicates1 = new relationalStore.RdbPredicates("employee");
      resultSet = await rdbStore.query(predicates1);
      resultSet.goToFirstRow();
      try{
        const name = resultSet?.getString(resultSet.getColumnIndex("name"))
        console.log(TAG + "name:" + name);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err" + err.code +err.message);
        expect(err.code == 14800012).assertTrue();
        done();
      }
      console.info(TAG + "************* relationalStoreTest043 end *************");
    })
  })
}