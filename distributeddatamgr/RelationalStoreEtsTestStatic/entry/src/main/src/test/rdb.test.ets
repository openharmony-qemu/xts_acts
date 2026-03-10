   // RdbErrorCode14800014.test.ets
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
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        console.info(TAG + "deleteRdbStore success");
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        console.info(TAG + "getRdbStore success");
        let txId :long;
        try {
          txId = await rdbStore!.beginTrans();
          console.info(TAG +`beginTrans successful`+txId);
          expect(txId).assertEqual(1);
          await rdbStore!.close();
          await rdbStore!.commit(txId);
          await rdbStore!.commit(txId);
          console.error(TAG + "RdbcommittxId14800014_001 success");
          expect(true).assertFail();
        } catch (err) {
          console.error(TAG + "RdbcommittxId14800014_001 failed. " + err);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbcommittxId14800014_001 end *************");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        console.info(TAG + "deleteRdbStore1 success");
        done();
      });

    /**
     * @tc.name   RdbrollbacktxId14800014_001
     * @tc.number RdbrollbacktxId14800014_001
     * @tc.desc   uerySharingResource test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RdbrollbacktxId14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* RdbrollbacktxId14800014_001 start *************");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        console.info(TAG + "deleteRdbStore success");
        rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
        console.info(TAG + "getRdbStore success");
        let txId :long;
        try {
          txId = await rdbStore!.beginTrans();
          console.info(TAG +`beginTrans successful`+txId);
          expect(txId).assertEqual(1);
          await rdbStore!.close();
          await rdbStore!.rollback(txId);
          console.error(TAG + "RdbrollbacktxId14800014_001 success");
          expect(true).assertFail();
        } catch (err) {
          console.error(TAG + "RdbrollbacktxId14800014_001 failed. " + err);
          expect(14800014).assertEqual(err.code);
        }
        console.log(TAG + "************* RdbrollbacktxId14800014_001 end *************");
        await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
        console.info(TAG + "deleteRdbStore1 success");
        done();
      });

    /**
     * @tc.name       RdbBatchInsert14800014_callback_001
     * @tc.number     RdbBatchInsert14800014_callback_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbBatchInsert14800014_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_callback_001 start *************');
        await rdbStore!.close();
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("test", vbs, (err, rowId) => {
            if (err) {
              console.error(TAG +`Insert is failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(14800014);
              done();
            }else{
              console.info(TAG +`Insert is successful, rowId = ${rowId}`);
              expect(true).assertFail();
              done();
            }
          });
        }
        hilog.info(domain, TAG, '%{public}s', '************* RdbBatchInsert14800014_callback_001 end *************');
      })

    /**
     * @tc.name       RdbUpdate14800014_callback_001
     * @tc.number     RdbUpdate14800014_callback_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbUpdate14800014_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_callback_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        rdbStore!.update(valueBucket3, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err, rows) => {
          if (err) {
            console.error(TAG +`Updated failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
            done();
          }
          console.info(TAG +`Updated row count: ${rows}`);
          done();
        });

        hilog.info(domain, TAG, '%{public}s', '************* RdbUpdate14800014_callback_001 end *************');
      })

    /**
     * @tc.name       RdbDelete14800014_callback_001
     * @tc.number     RdbDelete14800014_callback_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbDelete14800014_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_callback_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        rdbStore!.delete(predicates, (err, rows) => {
          if (err) {
            console.error(TAG +`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
            done();
          }else{
            console.info(TAG +`delete succsee: ${rows}`);
            done();
          }
        })
        hilog.info(domain, TAG, '%{public}s', '************* RdbDelete14800014_callback_001 end *************');
      })

    /**
     * @tc.name       RdbQuery14800014_callback_001
     * @tc.number     RdbQuery14800014_callback_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuery14800014_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_callback_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        rdbStore!.query(predicates, ["data1"], (err, resultSet) => {
          if (err) {
            console.error(TAG +`Query failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
            done();
          }else{
            console.info(TAG +`query succsee: ${resultSet}`);
            done();
          }
        })
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuery14800014_callback_001 end *************');
      })

    /**
     * @tc.name       RdbQuerySql14800014_callback_001
     * @tc.number     RdbQuerySql14800014_callback_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('RdbQuerySql14800014_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySql14800014_callback_001 start *************');
        let num = await rdbStore!.insert("test", valueBucket0);
        let predicates = new relationalStore.RdbPredicates("test");
        predicates.equalTo("data1", "hello");
        await rdbStore!.close();
        rdbStore!.querySql("SELECT * FROM test where data1 = ?", ['hello'], (err, resultSet) => {
          if (err) {
            console.error(TAG +`Query failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
            done();
          }else{
            console.info(TAG +`query succsee: ${resultSet}`);
            done();
          }
        })
        hilog.info(domain, TAG, '%{public}s', '************* RdbQuerySql14800014_001 end *************');
      })

    /**
     * @tc.name       Rdbrekey14800014_001
     * @tc.number     Rdbrekey14800014_001
     * @tc.desc       Transaction getLong
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('Rdbrekey14800014_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, '%{public}s', '************* Rdbrekey14800014_001 start *************');
        try{
          let cryptoParam2: relationalStore.CryptoParam = {
            encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
            iterationCount: 1000,
            encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
            hmacAlgo: relationalStore.HmacAlgo.SHA256,
            kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256,
            cryptoPageSize: 1024
          };
          await rdbStore!.close();
          await rdbStore!.rekey(cryptoParam2);
        } catch (err) {
          console.error(TAG + "Rdbrekey14800014_001 failed. " + err);
          expect(14800014).assertEqual(err.code);
        }
        done()
        hilog.info(domain, TAG, '%{public}s', '************* Rdbrekey14800014_001 end *************');
      })

    // rdbStoreResultNullEtsTest.test.ets
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
     * @tc.name   testRdbGetColumnTypeSync14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5600
     * @tc.desc   getColumnTypeSync errcode is 14800033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync14800033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSync14800033 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1": null,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800033 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
          expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800033  failed " + err.code + err.message);
          expect(14800033).assertEqual(err.code);
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSync14800033 end *************");
      });

    /**
     * @tc.name   testRdbGetColumnTypeSync14800027
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5700
     * @tc.desc   getColumnTypeSync errcode is 14800027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbGetColumnTypeSync14800027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testRdbGetColumnTypeSync14800027 start *************");
        try {
          const valueBucket: data_relationalStore.ValuesBucket = {
            "data1": null,
            "data2": null,
            "data3": null,
            "data4": null,
            "data5": null,
            "data6": null,
            "data7": null,
            "data8": null
          };
          let row = await (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
          console.log(tag + "row is " + row);
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800027 insert failed " + err);
          expect().assertFail();
        }
        try {
          let resultSet = await rdbStore!.querySql("SELECT * FROM test");
          resultSet!.goToFirstRow();
          let type = data_relationalStore.ColumnType.NULL;
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("id"));
          expect(type).assertEqual(data_relationalStore.ColumnType.INTEGER);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data1"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data2"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data3"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data4"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data5"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data6"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data7"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          type = resultSet!.getColumnTypeSync(resultSet!.getColumnIndex("data8"));
          expect(type).assertEqual(data_relationalStore.ColumnType.NULL);
          resultSet?.close();
          done();
        } catch (err) {
          console.error(tag + "testRdbGetColumnTypeSync14800027  failed " + err.code + err.message);
          expect(14800027).assertEqual(err.code);
          done();
        }
        done();
        console.log(tag + "************* testRdbGetColumnTypeSync14800027 end *************");
      });

    /**
     * @tc.name   RelationalRdbStorequery_callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5800
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStorequery_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + '************* RelationalRdbStorequery_callback start *************');
      let predicates = new data_relationalStore.RdbPredicates("test");
      predicates.equalTo("data1", "zhangsan");
      let resultSet: data_relationalStore.ResultSet | undefined;
      rdbStore!.query(predicates, ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8"], (err, resultSet) => {
        if (err) {
          console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
          expect(true).assertFail();
        }else{
          console.info(tag +`query succsee: ${resultSet}`);
          expect(resultSet!==undefined).assertTrue();
          console.info(domain, tag  +`ResultSet column names: ${resultSet!.columnNames}`);
          expect(resultSet!.columnNames.length > 0).assertTrue();
          console.info(domain, tag  +`ResultSet column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount == 8).assertTrue();
          console.info(domain, tag  +`ResultSet rowIndex:${resultSet!.rowIndex}`);
          expect(resultSet!.rowIndex == -1).assertTrue();
          console.info(domain, tag  +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
          expect(resultSet!.isAtFirstRow).assertEqual(false);
          console.info(domain, tag  +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
          expect(resultSet!.isAtLastRow).assertEqual(true);
          console.info(domain, tag  +`ResultSet isEnded:${resultSet!.isEnded}`);
          expect(resultSet!.isEnded).assertEqual(true);
          console.info(domain, tag  +`ResultSet isStarted: ${resultSet!.isStarted}`);
          expect(resultSet!.isStarted).assertEqual(false);
          console.info(domain, tag  +`ResultSet isClosed: ${resultSet!.isClosed}`);
          expect(resultSet!.isClosed).assertEqual(false);
          console.info(domain, tag  +`ResultSet rowCount:${resultSet!.rowCount}`);
          expect(resultSet!.rowCount == 0).assertTrue();
        }
      })
      console.info(domain, tag  + '************* RelationalRdbStorequery_callback end *************');
    })

    /**
     * @tc.name   RelationalRdbStorequerysql_callback
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_5900
     * @tc.desc   the test of query
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalRdbStorequerysql_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async ()  => {
      console.info(domain, tag + '************* RelationalRdbStorequerysql_callback start *************');
      let resultSet: data_relationalStore.ResultSet | undefined;
      rdbStore!.querySql("SELECT * FROM test where data1 = ?", ['hello'], (err, resultSet) => {
        if (err) {
          console.error(tag +`Query failed, code is ${err.code}, message is ${err.message}`);
          expect(true).assertFail();
        }else{
          console.info(tag +`query succsee: ${resultSet}`);
          expect(resultSet!==undefined).assertTrue();
          console.info(domain, tag  +`ResultSet column names: ${resultSet!.columnNames}`);
          expect(resultSet!.columnNames.length > 0).assertTrue();
          console.info(domain, tag  +`ResultSet column count: ${resultSet!.columnCount}`);
          expect(resultSet!.columnCount == 9).assertTrue();
          console.info(domain, tag  +`ResultSet rowIndex:${resultSet!.rowIndex}`);
          expect(resultSet!.rowIndex == -1).assertTrue();
          console.info(domain, tag  +`ResultSet isAtFirstRow: ${resultSet!.isAtFirstRow}`);
          expect(resultSet!.isAtFirstRow).assertEqual(false);
          console.info(domain, tag  +`ResultSet isAtLastRow: ${resultSet!.isAtLastRow}`);
          expect(resultSet!.isAtLastRow).assertEqual(true);
          console.info(domain, tag  +`ResultSet isEnded:${resultSet!.isEnded}`);
          expect(resultSet!.isEnded).assertEqual(true);
          console.info(domain, tag  +`ResultSet isStarted: ${resultSet!.isStarted}`);
          expect(resultSet!.isStarted).assertEqual(false);
          console.info(domain, tag  +`ResultSet isClosed: ${resultSet!.isClosed}`);
          expect(resultSet!.isClosed).assertEqual(false);
          console.info(domain, tag  +`ResultSet rowCount:${resultSet!.rowCount}`);
          expect(resultSet!.rowCount == 0).assertTrue();
        }
      })
      console.info(domain, tag  + '************* RelationalRdbStorequerysql_callback end *************');
    })

    /**
     * @tc.name   testbeginTransaction14800033
     * @tc.number SUB_DistributedData_RelationalStore_SDK_rdbStoreResultNullEtsTest_6000
     * @tc.desc   beginTrans normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testbeginTransaction14800033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(tag + "************* testbeginTransaction14800033 start *************");
        if (rdbStore!= undefined) {
          let txId :long;
          try{
            rdbStore!.beginTransaction();
            console.info(tag +`beginTransaction successful`);
          }catch (e) {
            console.error(tag + `beginTrans failed. code is ${e.code}, message is ${e.message}`);
            expect(14800033).assertEqual(e.code);
          }
        }
        done()
        console.log(tag + "************* testbeginTransaction14800033 end *************");
      });
      
    // RdbErrorCode14800033.test.ets
    /**
     * @tc.name testRdbInsert14800033_callback_001
     * @tc.number testRdbInsert14800033_callback_001
     * @tc.desc testRdbInsert14800033_callback_001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbInsert14800033_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbInsert14800033_callback_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        if (rdbStore!= undefined) {
          rdbStore!.insert("employee1", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK,
            (err, rowId) => {
              if (err) {
                console.error(tag +`Insert is failed, code is ${err.code}, message is ${err.message}`);
                expect(14800033).assertEqual(err.code);
                done();
              }else{
                console.info(tag +`Insert is successful, rowId = ${rowId}`);
                expect(true).assertFail();
                done();
              }
            });
        }

        console.info(TAG + "************* testRdbInsert14800033_callback_001 end *************");
      })

    /**
     * @tc.name testRdbBatchInsert14800033_callback_001
     * @tc.number testRdbBatchInsert14800033_callback_001
     * @tc.desc testRdbBatchInsert14800033_callback_001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbBatchInsert14800033_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbBatchInsert14800033_callback_001 start *************");
        let values: Array<relationalStore.ValuesBucket> = new Array<relationalStore.ValuesBucket>();
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        values.push(valueBucket)
        if (rdbStore!= undefined) {
          rdbStore!.batchInsert("employee1", values, (err, rowId) => {
            if (err) {
              console.error(TAG +`Insert is failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(14800033);
              done();
            }else{
              console.info(TAG +`Insert is successful, rowId = ${rowId}`);
              done();
            }
          });
        }

        console.info(TAG + "************* testRdbBatchInsert14800033_callback_001 end *************");
      })

    /**
     * @tc.name testRdbUpdate14800033_callback_001
     * @tc.number testRdbUpdate14800033_callback_001
     * @tc.desc update success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbUpdate14800033_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbUpdate14800033_callback_001 start *************");
        const valueBucket: relationalStore.ValuesBucket = {
          "id": "abc",
          "name": "Jim",
          "age": 30 as long,
          "salary": 2000.1
        }
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        rdbStore!.update(valueBucket, predicates, relationalStore.ConflictResolution.ON_CONFLICT_ROLLBACK, (err, rows) => {
          if (err) {
            console.error(TAG +`Updated failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800033);
            done();
          }
          console.info(TAG +`Updated row count: ${rows}`);
          done();
        });

        console.info(TAG + "************* testRdbUpdate14800033_callback_001 end *************");
      })

    /**
     * @tc.name testRdbDelete14800033_callback_001
     * @tc.number testRdbDelete14800033_callback_001
     * @tc.desc delete success callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbDelete14800033_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* testRdbDelete14800033_callback_001 start *************");
        let predicates = new relationalStore.RdbPredicates("employee1");
        predicates.equalTo("name", "Jim");
        rdbStore!.delete(predicates, (err, rows) => {
          if (err) {
            console.error(TAG +`delete failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(14800033);
            done();
          }else{
            console.info(TAG +`delete succsee: ${rows}`);
            done();
          }
        })
        console.info(TAG + "************* testRdbDelete14800033_callback_001 end *************");
      })

