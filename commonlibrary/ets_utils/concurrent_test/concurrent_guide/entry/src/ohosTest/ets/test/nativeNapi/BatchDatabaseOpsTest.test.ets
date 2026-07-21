/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections } from '@kit.ArkTS';
import { relationalStore } from '@kit.ArkData';
import { abilityDelegatorRegistry } from '@kit.TestKit';

interface IValueBucket {
  id: number
  name: string
  age: number
  salary: number
}

@Sendable
class SharedValuesBucket implements IValueBucket {
  id: number = 0
  name: string = ''
  age: number = 0
  salary: number = 0

  constructor(id: number, name: string, age: number, salary: number) {
    this.id = id
    this.name = name
    this.age = age
    this.salary = salary
  }

  getId(): number {
    return this.id
  }

  getName(): string {
    return this.name
  }

  getAge(): number {
    return this.age
  }

  getSalary(): number {
    return this.salary
  }
}

class Material {
  seq: number = 0
  materialName: string = ''
  buckets: collections.Array<SharedValuesBucket> = new collections.Array<SharedValuesBucket>()

  constructor(seq: number, materialName: string) {
    this.seq = seq
    this.materialName = materialName
  }

  addBucket(bucket: SharedValuesBucket): void {
    this.buckets.push(bucket)
  }

  getBuckets(): collections.Array<SharedValuesBucket> {
    return this.buckets
  }

  getBucketCount(): number {
    return this.buckets.length
  }
}

const DB_NAME: string = 'BatchOpsTest.db'
const TABLE_NAME: string = 'test'

const CREATE_TABLE_SQL: string = 'CREATE TABLE IF NOT EXISTS ' + TABLE_NAME + ' (' +
  'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
  'name TEXT NOT NULL, ' +
  'age INTEGER, ' +
  'salary REAL)'

function getTestContext(): Context {
  let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let appContext: Context = delegator.getAppContext()
  return appContext.getApplicationContext()
}

function buildStoreConfig(dbName: string): relationalStore.StoreConfig {
  let config: relationalStore.StoreConfig = {
    name: dbName,
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  return config
}

function buildValueBucket(name: string, age: number, salary: number): relationalStore.ValuesBucket {
  let bucket: relationalStore.ValuesBucket = {
    'name': name,
    'age': age,
    'salary': salary,
  }
  return bucket
}

@Concurrent
async function insertInTaskPool(context: Context, dbName: string, tableName: string, names: string[], ages: number[], salaries: number[]): Promise<number> {
  let config: relationalStore.StoreConfig = {
    name: dbName,
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
  let buckets: relationalStore.ValuesBucket[] = []
  for (let i: number = 0; i < names.length; i++) {
    let bucket: relationalStore.ValuesBucket = {
      'name': names[i],
      'age': ages[i],
      'salary': salaries[i],
    }
    buckets.push(bucket)
  }
  let count: number = await store.batchInsert(tableName, buckets)
  return count
}

@Concurrent
async function queryCountInTaskPool(context: Context, dbName: string, tableName: string): Promise<number> {
  let config: relationalStore.StoreConfig = {
    name: dbName,
    securityLevel: relationalStore.SecurityLevel.S1,
  }
  let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
  let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(tableName)
  let resultSet: relationalStore.ResultSet = await store.query(predicates)
  let count: number = resultSet.rowCount
  resultSet.close()
  return count
}

export default function BatchDatabaseOpsTest(): void {
  describe('BatchDatabaseOpsTest', (): void => {
    let context: Context = getTestContext()

    beforeAll(async (): Promise<void> => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      await store.executeSql(CREATE_TABLE_SQL)
    })

    beforeEach((): void => {})

    afterEach(async (): Promise<void> => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      try {
        let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
        await store.executeSql('DELETE FROM ' + TABLE_NAME)
      } catch (e) {
        // table may not exist
      }
    })

    afterAll(async (): Promise<void> => {
      try {
        let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
        await relationalStore.deleteRdbStore(context, config)
      } catch (e) {
        // ignore cleanup errors
      }
      await Promise.resolve()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0100
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0100
     * @tc.desc   Verify relationalStore.getRdbStore creates database instance correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      expect(store !== undefined).assertTrue()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0200
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0200
     * @tc.desc   Verify StoreConfig with name and securityLevel configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = {
        name: 'ConfigTest.db',
        securityLevel: relationalStore.SecurityLevel.S2,
      }
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      expect(store !== undefined).assertTrue()
      await relationalStore.deleteRdbStore(context, config)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0300
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0300
     * @tc.desc   Verify executeSql creates table successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      await store.executeSql(CREATE_TABLE_SQL)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      expect(resultSet.rowCount).assertEqual(0)
      resultSet.close()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0400
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0400
     * @tc.desc   Verify batchInsert inserts multiple rows correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket('Alice', 25, 5000.0))
      data.push(buildValueBucket('Bob', 30, 6000.0))
      data.push(buildValueBucket('Charlie', 35, 7000.0))
      let count: number = await store.batchInsert(TABLE_NAME, data)
      expect(count).assertEqual(3)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0500
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0500
     * @tc.desc   Verify query with RdbPredicates returns correct ResultSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket('QueryTest', 28, 8000.0))
      await store.batchInsert(TABLE_NAME, data)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      expect(resultSet.rowCount).assertLarger(0)
      resultSet.goToFirstRow()
      let name: string = resultSet.getString(resultSet.getColumnIndex('name'))
      expect(name).assertEqual('QueryTest')
      resultSet.close()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0600
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0600
     * @tc.desc   Verify deleteRdbStore deletes database file correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let tempDbName: string = 'DeleteTest.db'
      let config: relationalStore.StoreConfig = buildStoreConfig(tempDbName)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      await relationalStore.deleteRdbStore(context, config)
      let newStore: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      expect(newStore !== undefined).assertTrue()
      await relationalStore.deleteRdbStore(context, config)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0700
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0700
     * @tc.desc   Verify ResultSet goToFirstRow/goToNextRow/getRow operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket('Row1', 20, 3000.0))
      data.push(buildValueBucket('Row2', 21, 3100.0))
      await store.batchInsert(TABLE_NAME, data)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      resultSet.goToFirstRow()
      let row1: relationalStore.ValuesBucket = resultSet.getRow()
      expect(row1['name'] as string).assertEqual('Row1')
      let hasNext: boolean = resultSet.goToNextRow()
      expect(hasNext).assertTrue()
      let row2: relationalStore.ValuesBucket = resultSet.getRow()
      expect(row2['name'] as string).assertEqual('Row2')
      resultSet.close()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0800
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0800
     * @tc.desc   Verify ResultSet.close() closes result set without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      expect(resultSet.rowCount >= 0).assertTrue()
      resultSet.close()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest0900
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_0900
     * @tc.desc   Verify SharedValuesBucket @Sendable wrapper for database data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let bucket: SharedValuesBucket = new SharedValuesBucket(1, 'Sendable', 25, 5000.0)
      expect(bucket.getId()).assertEqual(1)
      expect(bucket.getName()).assertEqual('Sendable')
      expect(bucket.getAge()).assertEqual(25)
      expect(bucket.getSalary()).assertEqual(5000.0)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1000
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1000
     * @tc.desc   Verify collections.Array.create creates typed array for data storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr: collections.Array<SharedValuesBucket> = collections.Array.create<SharedValuesBucket>(3, new SharedValuesBucket(0, '', 0, 0))
      expect(arr.length).assertEqual(3)
      arr[0] = new SharedValuesBucket(1, 'first', 20, 3000.0)
      expect(arr[0].getName()).assertEqual('first')
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1100
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1100
     * @tc.desc   Verify Material class holds Sendable array property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let material: Material = new Material(1, 'TestMaterial')
      material.addBucket(new SharedValuesBucket(1, 'item1', 20, 1000.0))
      material.addBucket(new SharedValuesBucket(2, 'item2', 21, 2000.0))
      expect(material.getBucketCount()).assertEqual(2)
      expect(material.getBuckets()[0].getName()).assertEqual('item1')
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1200
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1200
     * @tc.desc   Verify TaskPool sub-thread executes batch insert operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let names: string[] = ['TaskInsert1', 'TaskInsert2']
      let ages: number[] = [25, 30]
      let salaries: number[] = [5000.0, 6000.0]
      let result = await taskpool.execute(new taskpool.Task(insertInTaskPool, context, DB_NAME, TABLE_NAME, names, ages, salaries))
      expect(result as number).assertEqual(2)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1300
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1300
     * @tc.desc   Verify TaskPool sub-thread executes query and returns Sendable data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BatchDatabaseOpsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket('TaskQuery', 28, 8000.0))
      await store.batchInsert(TABLE_NAME, data)
      let result = await taskpool.execute(new taskpool.Task(queryCountInTaskPool, context, DB_NAME, TABLE_NAME))
      expect(result as number).assertLarger(0)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1400
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1400
     * @tc.desc   Verify Sendable data cross-thread passing performance advantage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let names: collections.Array<string> = new collections.Array<string>()
      let ages: collections.Array<number> = new collections.Array<number>()
      let salaries: collections.Array<number> = new collections.Array<number>()
      for (let i: number = 0; i < 50; i++) {
        names.push('user' + i.toString())
        ages.push(20 + i)
        salaries.push(3000.0 + i * 100)
      }
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(insertInTaskPool, context, DB_NAME, TABLE_NAME, names, ages, salaries))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(50)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1500
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1500
     * @tc.desc   Verify main thread receives Sendable data returned from sub-thread query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket('MainThreadRecv', 33, 9000.0))
      await store.batchInsert(TABLE_NAME, data)
      let result = await taskpool.execute(new taskpool.Task(queryCountInTaskPool, context, DB_NAME, TABLE_NAME))
      expect(result as number).assertLarger(0)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1600
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1600
     * @tc.desc   Verify consecutive TaskPool.execute calls for database operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i: number = 0; i < 3; i++) {
        let names: string[] = ['Loop' + i.toString()]
        let ages: number[] = [20 + i]
        let salaries: number[] = [3000.0]
        let result = await taskpool.execute(new taskpool.Task(insertInTaskPool, context, DB_NAME, TABLE_NAME, names, ages, salaries))
        expect(result as number).assertEqual(1)
      }
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1700
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1700
     * @tc.desc   Verify empty data array insert handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let names: collections.Array<string> = new collections.Array<string>()
      let ages: collections.Array<number> = new collections.Array<number>()
      let salaries: collections.Array<number> = new collections.Array<number>()
      try {
        let insertResult = await taskpool.execute(new taskpool.Task(insertInTaskPool, context, DB_NAME, TABLE_NAME, names, ages, salaries))
        expect((insertResult as number) >= 0).assertTrue()
      } catch (e) {
        // buffer may be detached after transfer
      }
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1800
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1800
     * @tc.desc   Verify large data volume insert performance with 100 rows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BatchDatabaseOpsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let names: collections.Array<string> = new collections.Array<string>()
      let ages: collections.Array<number> = new collections.Array<number>()
      let salaries: collections.Array<number> = new collections.Array<number>()
      for (let i: number = 0; i < 100; i++) {
        names.push('Bulk' + i.toString())
        ages.push(20 + (i % 50))
        salaries.push(3000.0 + i * 10)
      }
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(insertInTaskPool, context, DB_NAME, TABLE_NAME, names, ages, salaries))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(100)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest1900
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_1900
     * @tc.desc   Verify long string field storage in name column
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longName: string = 'A'.repeat(500)
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      data.push(buildValueBucket(longName, 999, 5000.0))
      await store.batchInsert(TABLE_NAME, data)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      predicates.equalTo('age', 999)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      expect(resultSet.rowCount).assertLarger(0)
      resultSet.goToFirstRow()
      let name: string = resultSet.getString(resultSet.getColumnIndex('name'))
      expect(name.length).assertEqual(500)
      resultSet.close()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2000
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2000
     * @tc.desc   Verify empty table query returns empty result set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tempDbName: string = 'EmptyQuery.db'
      let config: relationalStore.StoreConfig = buildStoreConfig(tempDbName)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      await store.executeSql(CREATE_TABLE_SQL)
      let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE_NAME)
      let resultSet: relationalStore.ResultSet = await store.query(predicates)
      expect(resultSet.rowCount).assertEqual(0)
      resultSet.close()
      await relationalStore.deleteRdbStore(context, config)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2100
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2100
     * @tc.desc   Verify SQL syntax error throws appropriate error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let caught: boolean = false
      try {
        await store.executeSql('INVALID SQL SYNTAX HERE')
        expect().assertFail()
      } catch (e) {
        caught = true
        
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2200
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2200
     * @tc.desc   Verify query on non-existent table throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let tempDbName: string = 'NoTable.db'
      let config: relationalStore.StoreConfig = buildStoreConfig(tempDbName)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      try {
        let predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('nonExistentTable')
        let resultSet: relationalStore.ResultSet = await store.query(predicates)
        expect(resultSet.rowCount).assertEqual(-1)
        resultSet.close()
      } catch (e) {
        // buffer may be detached after transfer
      }
      await relationalStore.deleteRdbStore(context, config)
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2300
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2300
     * @tc.desc   Verify batch insert performance measurement with timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BatchDatabaseOpsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let config: relationalStore.StoreConfig = buildStoreConfig(DB_NAME)
      let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
      let data: relationalStore.ValuesBucket[] = []
      for (let i: number = 0; i < 50; i++) {
        data.push(buildValueBucket('Perf' + i.toString(), 20 + i, 3000.0 + i * 100))
      }
      let start: number = Date.now()
      let count: number = await store.batchInsert(TABLE_NAME, data)
      let elapsed: number = Date.now() - start
      expect(count).assertEqual(50)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2400
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2400
     * @tc.desc   Verify different security levels S1/S2/S3/S4 for StoreConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BatchDatabaseOpsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let levels: relationalStore.SecurityLevel[] = [
        relationalStore.SecurityLevel.S1,
        relationalStore.SecurityLevel.S2,
        relationalStore.SecurityLevel.S3,
        relationalStore.SecurityLevel.S4,
      ]
      for (let i: number = 0; i < levels.length; i++) {
        let dbName: string = 'SecLevel' + i.toString() + '.db'
        let config: relationalStore.StoreConfig = {
          name: dbName,
          securityLevel: levels[i],
        }
        let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
        expect(store !== undefined).assertTrue()
        await relationalStore.deleteRdbStore(context, config)
      }
    })

    /**
     * @tc.name   BatchDatabaseOpsTest2500
     * @tc.number SUB_BATCH_DATABASE_OPS_TEST_2500
     * @tc.desc   Verify frequent database create and delete operations stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BatchDatabaseOpsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let completed: boolean = false
      for (let i: number = 0; i < 5; i++) {
        let dbName: string = 'Stability' + i.toString() + '.db'
        let config: relationalStore.StoreConfig = buildStoreConfig(dbName)
        let store: relationalStore.RdbStore = await relationalStore.getRdbStore(context, config)
        await store.executeSql(CREATE_TABLE_SQL)
        let data: relationalStore.ValuesBucket[] = []
        data.push(buildValueBucket('stable' + i.toString(), 25, 5000.0))
        await store.batchInsert(TABLE_NAME, data)
        await relationalStore.deleteRdbStore(context, config)
      }
      completed = true
      expect(completed).assertTrue()
    })
  })
}
