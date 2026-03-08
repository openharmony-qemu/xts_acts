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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let bucket1000: relationalStore.ValuesBucket = {};
for(let i = 0 ; i < 1001; i++) {
    bucket1000["test" + i] = i as long;
}

export default function RdbStoreSqlInfoEnumTestEts() {

    describe("RdbStoreSqlInfoEnumTestEts", (): void => {
//==============================================
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
        });
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
        });
        afterEach(async () => {
            console.info(TAG + 'afterEach');
        });
        afterAll(async () => {
            console.info(TAG + 'afterAll');
        });


        /**
         * @tc.number testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ROLLBACK
         * @tc.name testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ROLLBACK
         * @tc.desc Verifies that an error is thrown when the ConflictResolution is not empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ROLLBACK", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ROLLBACK start *************");
            try {
                const asset:relationalStore.Asset = {
                name: "name4",
                uri: "uri4",
                createTime: "createTime4",
                modifyTime: "modifyTime4",
                size: "size4",
                path: "path4",
                };
                const assets = [asset];
                const bucket: relationalStore.ValuesBucket = {
                "data1": "hello world",
                "data2": 3 as long,
                "data3": 10.5,
                "data4": new Uint8Array([1, 2, 3]),
                "data5": asset,
                "data6": assets,
                "data7": new Float32Array([1.5, 2.5]),
                "data8": 100n
                };

                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "tableName",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK
                );
                expect(info.sql).assertEqual("INSERT OR ROLLBACK INTO tableName(data1,data2,data3,data4,data5,data6,data7,data8) VALUES (?,?,?,?,?,?,?,?)");
                expect(info.args[0]).assertEqual("hello world");
                expect(info.args[1]).assertEqual(3);
                expect(info.args[2]).assertEqual(10.5);
                expect(info.args[3]!="").assertTrue();
                expect(info.args[4]!="").assertTrue();
                expect(info.args[5]!="").assertTrue();
                expect(info.args[6]!="").assertTrue();
                expect(info.args[7]!="").assertTrue();
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionON_CONFLICT_ROLLBACK end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ABORT
         * @tc.name testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ABORT
         * @tc.desc Verifies that an error is thrown when the ConflictResolution is not empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ABORT", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_ABORT start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "tableName",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "tableName",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_ABORT
                );
                expect(info.sql).assertEqual("INSERT OR ABORT INTO tableName(age,desc,name,sex) VALUES (?,?,?,?)");
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionON_CONFLICT_ABORT end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_FAIL
         * @tc.name testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_FAIL
         * @tc.desc Verifies that an error is thrown when the ConflictResolution is not empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_FAIL", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_FAIL start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "tableName",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "tableName",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_FAIL
                );
                expect(info.sql).assertEqual("INSERT OR FAIL INTO tableName(age,desc,name,sex) VALUES (?,?,?,?)");
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionON_CONFLICT_FAIL end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfonull001
         * @tc.name testGetInsertSqlInfoConflictResolutionIsON_CONFLICT_FAIL
         * @tc.desc first param is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfonull001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfonull001 start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "tableName",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_FAIL
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                console.log(TAG +"catch err: failed, err: code=" + e.code + " message=" + e.message);
                expect(14800001).assertEqual(e.code);
                console.log(TAG + "************* testGetInsertSqlInfonull001 end *************");
                done();
            }
        });


//==============================================function getUpdateSqlInfo(predicates: RdbPredicates, values: ValuesBucket, conflict?: Configuration):SqlInfo;==============================================
        /**
         * @tc.number testGetUpdateSqlInfoON_CONFLICT_ROLLBACK
         * @tc.name testGetUpdateSqlInfoON_CONFLICT_ROLLBACK
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoON_CONFLICT_ROLLBACK", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ROLLBACK start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK
                );
                expect(info.sql).assertEqual("UPDATE OR ROLLBACK users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ROLLBACK end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ROLLBACK end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetUpdateSqlInfoON_CONFLICT_ABORT
         * @tc.name testGetUpdateSqlInfoON_CONFLICT_ABORT
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoON_CONFLICT_ABORT", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ABORT start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_ABORT
                );
                expect(info.sql).assertEqual("UPDATE OR ABORT users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ABORT end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_ABORT end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetUpdateSqlInfoON_CONFLICT_FAIL
         * @tc.name testGetUpdateSqlInfoON_CONFLICT_FAIL
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoON_CONFLICT_FAIL", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_FAIL start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_FAIL
                );
                expect(info.sql).assertEqual("UPDATE OR FAIL users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_FAIL end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_FAIL end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetUpdateSqlInfoON_CONFLICT_IGNORE
         * @tc.name testGetUpdateSqlInfoON_CONFLICT_IGNORE
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoON_CONFLICT_IGNORE", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_IGNORE start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_IGNORE
                );
                expect(info.sql).assertEqual("UPDATE OR IGNORE users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_IGNORE end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_IGNORE end *************");
                done();
            }
        });
		
		/**
         * @tc.number testGetUpdateSqlInfoON_CONFLICT_REPLACE
         * @tc.name testGetUpdateSqlInfoON_CONFLICT_REPLACE
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoON_CONFLICT_REPLACE", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_REPLACE start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_REPLACE
                );
                expect(info.sql).assertEqual("UPDATE OR REPLACE users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_REPLACE end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoON_CONFLICT_REPLACE end *************");
                done();
            }
        });

    /**
     * @tc.name   testsqueryWithoutRowCount001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_4000
     * @tc.desc   testTransqueryWithoutRowCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testsqueryWithoutRowCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testsqueryWithoutRowCount001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello world");

        if (rdbStore!= undefined) {
          let resultSet: data_relationalStore.LiteResultSet | undefined;
          resultSet = await rdbStore!.queryWithoutRowCount(predicates, ["data1"]);
          expect(resultSet!==undefined).assertTrue();
          resultSet!.close()
        }
        done()
        console.log(tag + "************* testsqueryWithoutRowCount001 end *************");
      });

    /**
     * @tc.name   testquerySqlWithoutRowCountreturn001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5500
     * @tc.desc   querySqlWithoutRowCount sec param is not kong
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testquerySqlWithoutRowCountreturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testquerySqlWithoutRowCountreturn001 start *************");
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "data1": "hello world"
        };
        let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket1);
        console.log(tag + "row is " + row);
        try{
          if (rdbStore!= undefined) {
            let resultSet: data_relationalStore.LiteResultSet | undefined;
            resultSet = await rdbStore!.querySqlWithoutRowCount("SELECT * FROM test where data1 = ?", ['hello world']);
            expect(resultSet!==undefined).assertTrue();
            resultSet!.close()
          }
        } catch (e) {
          console.error(tag + `testquerySqlWithoutRowCountreturn001 failed. code is ${e.code}, message is ${e.message}`);
          expect(true).assertFail();
        }
        done()
        console.log(tag + "************* testquerySqlWithoutRowCountreturn001 end *************");
      });

          /**
     * @tc.name   RdbgoTo14800014_001
     * @tc.number RdbgoTo14800014_001
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbgoTo14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* RdbgoTo14800014_001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "data1": "hello",
      };
      await rdbStore!.insert("test", valueBucket);
      let resultSet = await rdbStore!.querySql("SELECT * FROM test");
      let count = resultSet!.rowCount;
      expect(true).assertEqual(resultSet!.goToRow(count - 1)!);
      resultSet!.close();
      await rdbStore!.close();
      try {
        resultSet!.goTo(1);
        console.error(TAG + "RdbgoTo14800014_001 success");
      } catch (err) {
        console.error(TAG + "RdbgoTo14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbgoTo14800014_001 end *************");
      done();
    });

  /**
   * @tc.name   RdbgoToRow14800014_001
   * @tc.number RdbgoToRow14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('RdbgoToRow14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* RdbgoToRow14800014_001 start *************");
      const valueBucket: relationalStore.ValuesBucket = {
        "data1": "hello",
      };
      await rdbStore!.insert("test", valueBucket);
      let resultSet = await rdbStore!.querySql("SELECT * FROM test");
      let count = resultSet!.rowCount;
      expect(true).assertEqual(resultSet!.goToRow(count - 1)!);
      resultSet!.close();
      await rdbStore!.close();
      try {
        resultSet!.goToRow(1);
        console.error(TAG + "RdbgoToRow14800014_001 success");
      } catch (err) {
        console.error(TAG + "RdbgoToRow14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbgoToRow14800014_001 end *************");
      done();
    });

  /**
   * @tc.name   RdbbeginTransaction14800014_001
   * @tc.number RdbbeginTransaction14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('RdbbeginTransaction14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* RdbbeginTransaction14800014_001 start *************");
      await rdbStore!.close();
      try {
        rdbStore!.beginTransaction();
        console.error(TAG + "RdbbeginTransaction14800014_001 success");
        expect(true).assertFail();
      } catch (err) {
        console.error(TAG + "RdbbeginTransaction14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbbeginTransaction14800014_001 end *************");
      done();
    });

  /**
   * @tc.name   RdbbeginTrans14800014_001
   * @tc.number RdbbeginTrans14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('RdbbeginTrans14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* RdbbeginTrans14800014_001 start *************");
      await rdbStore!.close();
      try {
        rdbStore!.beginTrans();
        console.error(TAG + "RdbbeginTrans14800014_001 success");
      } catch (err) {
        console.error(TAG + "RdbbeginTrans14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbbeginTrans14800014_001 end *************");
      done();
    });


  /**
   * @tc.name   Rdbcommit14800014_001
   * @tc.number Rdbcommit14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('Rdbcommit14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* Rdbcommit14800014_001 start *************");
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.commit();
        await transaction.commit();
        console.error(TAG + "Rdbcommit14800014_001 success");
        expect(true).assertFail();
      } catch (err) {
        console.error(TAG + "Rdbcommit14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* Rdbcommit14800014_001 end *************");
      done();
    });

  /**
   * @tc.name   Rdbrollback14800014_001
   * @tc.number Rdbrollback14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('Rdbrollback14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* Rdbrollback14800014_001 start *************");
      try {
        const transaction = await rdbStore!.createTransaction();
        await transaction.rollback();
        await transaction.rollback();
        console.error(TAG + "Rdbrollback14800014_001 success");
        expect(true).assertFail();
      } catch (err) {
        console.error(TAG + "Rdbrollback14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* Rdbrollback14800014_001 end *************");
      done();
    });

  /**
   * @tc.name   RdbcommittxId14800014_001
   * @tc.number RdbcommittxId14800014_001
   * @tc.desc   uerySharingResource test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('RdbcommittxId14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void) => {
      console.log(TAG + "************* RdbcommittxId14800014_001 start *************");
      let txId :long;
      try {
        txId = await rdbStore!.beginTrans();
        console.info(TAG +`beginTrans successful`+txId);
        await rdbStore!.commit(txId);
        await rdbStore!.commit(txId);
        console.error(TAG + "RdbcommittxId14800014_001 success");
        expect(true).assertFail();
      } catch (err) {
        console.error(TAG + "RdbcommittxId14800014_001 failed. " + err);
        expect(14800014).assertEqual(err.code);
      }
      console.log(TAG + "************* RdbcommittxId14800014_001 end *************");
      done();
    });
    
//==============================================end==============================================
    })
}