/*
 * Copyright (c) 2026 RKH Corp.
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
import { DataItem } from './TaskpoolSharedData';

@Concurrent
function queryDatabaseTask(offset: number, limit: number): collections.Array<DataItem> {
  let results = new collections.Array<DataItem>()
  for (let i: number = offset; i < offset + limit; i++) {
    let item: DataItem = new DataItem()
    item.id = i
    item.name = 'Item_' + i.toString()
    item.value = i * 2
    results.push(item)
  }
  return results
}

@Concurrent
function loadDataWithNotifyTask(page: number, pageSize: number): collections.Array<DataItem> {
  let items = new collections.Array<DataItem>()
  for (let i: number = 0; i < pageSize; i++) {
    let item: DataItem = new DataItem()
    item.id = page * pageSize + i
    item.name = 'Page' + page.toString() + '_Item' + i.toString()
    item.value = page * 100 + i
    items.push(item)
  }
  taskpool.Task.sendData(page)
  return items
}

@Concurrent
function queryLargeDataTask(totalSize: number): number {
  let arr = new collections.Array<number>()
  for (let i: number = 0; i < totalSize; i++) {
    arr.push(i)
  }
  return arr.length
}

@Concurrent
function queryEmptyDataTask(): collections.Array<DataItem> {
  return new collections.Array<DataItem>()
}

@Concurrent
function queryErrorDataTask(): void {
  throw new Error('Database query failed')
}

@Concurrent
function loadMoreDataTask(currentTotal: number, batchSize: number): collections.Array<DataItem> {
  let newItems = new collections.Array<DataItem>()
  for (let i: number = currentTotal; i < currentTotal + batchSize; i++) {
    let item: DataItem = new DataItem()
    item.id = i
    item.name = 'More_' + i.toString()
    item.value = i * 3
    newItems.push(item)
  }
  return newItems
}

@Concurrent
function simulateScrollLoadTask(pageIndex: number, pageSize: number): collections.Array<DataItem> {
  let items = new collections.Array<DataItem>()
  let startIdx: number = pageIndex * pageSize
  for (let i: number = 0; i < pageSize; i++) {
    let item: DataItem = new DataItem()
    item.id = startIdx + i
    item.name = 'Scroll_' + (startIdx + i).toString()
    item.value = (startIdx + i) * 5
    items.push(item)
  }
  return items
}

@Concurrent
function concurrentPageLoadTask(page: number): collections.Array<DataItem> {
  let items = new collections.Array<DataItem>()
  for (let i: number = 0; i < 10; i++) {
    let item: DataItem = new DataItem()
    item.id = page * 10 + i
    item.name = 'Concurrent_' + page.toString() + '_' + i.toString()
    item.value = page + i
    items.push(item)
  }
  return items
}

export default function TaskpoolWaterflowTest(): void {
  describe('TaskpoolWaterflowTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0100
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0100
     * @tc.desc   Verify TaskPool database query simulation returns correct number of DataItem objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolWaterflowTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(queryDatabaseTask, 0, 20)
      let result = await taskpool.execute(task)
      let items = result as collections.Array<DataItem>
      expect(items.length).assertEqual(20)
      expect(items[0].id).assertEqual(0)
      expect(items[0].name).assertEqual('Item_0')
      expect(items[19].id).assertEqual(19)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0200
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0200
     * @tc.desc   Verify sendData returns page notification from worker thread during data loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolWaterflowTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let receivedPages = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(loadDataWithNotifyTask, 1, 10)
      let dataPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        task.onReceiveData((data: Object): void => {
          receivedPages.push(data as number)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      let items = result as collections.Array<DataItem>
      expect(items.length).assertEqual(10)
      expect(items[0].id).assertEqual(10)
      await dataPromise
      expect(receivedPages.length).assertLargerOrEqual(1)
      expect(receivedPages[0]).assertEqual(1)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0300
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0300
     * @tc.desc   Verify lazy loading simulation with 3 sequential page loads returns correct data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allPages = new collections.Array<collections.Array<DataItem>>()
      for (let i: number = 0; i < 3; i++) {
        let task: taskpool.Task = new taskpool.Task(queryDatabaseTask, i * 10, 10)
        let result = await taskpool.execute(task)
        allPages.push(result as collections.Array<DataItem>)
      }
      expect(allPages.length).assertEqual(3)
      expect(allPages[0].length).assertEqual(10)
      expect(allPages[0][0].id).assertEqual(0)
      expect(allPages[1][0].id).assertEqual(10)
      expect(allPages[2][0].id).assertEqual(20)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0400
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0400
     * @tc.desc   Verify load more on scroll simulation appends new data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let allItems = new collections.Array<DataItem>()

      let initTask: taskpool.Task = new taskpool.Task(loadMoreDataTask, 0, 20)
      let initResult = await taskpool.execute(initTask)
      let initItems = initResult as collections.Array<DataItem>
      for (let i: number = 0; i < initItems.length; i++) {
        allItems.push(initItems[i])
      }
      expect(allItems.length).assertEqual(20)

      let moreTask: taskpool.Task = new taskpool.Task(loadMoreDataTask, allItems.length, 20)
      let moreResult = await taskpool.execute(moreTask)
      let moreItems = moreResult as collections.Array<DataItem>
      for (let i: number = 0; i < moreItems.length; i++) {
        allItems.push(moreItems[i])
      }
      expect(allItems.length).assertEqual(40)
      expect(allItems[20].id).assertEqual(20)
      expect(allItems[39].id).assertEqual(39)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0500
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0500
     * @tc.desc   Verify empty data query returns empty collections.Array with zero length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(queryEmptyDataTask)
      let result = await taskpool.execute(task)
      let items = result as collections.Array<DataItem>
      expect(items.length).assertEqual(0)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0600
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0600
     * @tc.desc   Verify large data query with 5000 items returns correct total count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(queryLargeDataTask, 5000)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5000)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0700
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0700
     * @tc.desc   Verify database query exception is caught by execute promise rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(queryErrorDataTask)
      let caughtError: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0800
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0800
     * @tc.desc   Verify scroll-triggered data loading returns correct page data by index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simulateScrollLoadTask, 5, 10)
      let result = await taskpool.execute(task)
      let items = result as collections.Array<DataItem>
      expect(items.length).assertEqual(10)
      expect(items[0].id).assertEqual(50)
      expect(items[0].name).assertEqual('Scroll_50')
      expect(items[9].id).assertEqual(59)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest0900
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_0900
     * @tc.desc   Verify concurrent page loading with Promise.all loads 5 pages simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(concurrentPageLoadTask, i)
        promises.push(taskpool.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        let items = results[i] as collections.Array<DataItem>
        expect(items.length).assertEqual(10)
        expect(items[0].id).assertEqual(i * 10)
      }
    })

    /**
     * @tc.name   TaskpoolWaterflowTest1000
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_1000
     * @tc.desc   Verify database query with offset pagination returns correct sliced data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(queryDatabaseTask, 50, 15)
      let result = await taskpool.execute(task)
      let items = result as collections.Array<DataItem>
      expect(items.length).assertEqual(15)
      expect(items[0].id).assertEqual(50)
      expect(items[0].value).assertEqual(100)
      expect(items[14].id).assertEqual(64)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest1100
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_1100
     * @tc.desc   Verify multiple sequential load-more operations accumulate data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let totalItems: number = 0
      let allItems = new collections.Array<DataItem>()

      for (let batch: number = 0; batch < 4; batch++) {
        let task: taskpool.Task = new taskpool.Task(loadMoreDataTask, totalItems, 10)
        let result = await taskpool.execute(task)
        let items = result as collections.Array<DataItem>
        for (let i: number = 0; i < items.length; i++) {
          allItems.push(items[i])
        }
        totalItems += items.length
      }

      expect(allItems.length).assertEqual(40)
      expect(allItems[0].id).assertEqual(0)
      expect(allItems[39].id).assertEqual(39)
      expect(allItems[39].value).assertEqual(117)
    })

    /**
     * @tc.name   TaskpoolWaterflowTest1200
     * @tc.number SUB_TASKPOOL_WATERFLOW_TEST_1200
     * @tc.desc   Verify sendData progress notification during multi-page loading scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolWaterflowTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let loadedPages = new collections.Array<number>()

      let task1: taskpool.Task = new taskpool.Task(loadDataWithNotifyTask, 0, 10)
      let task1Promise: Promise<void> = new Promise<void>((resolve: Function) => {
        task1.onReceiveData((data: Object): void => {
          loadedPages.push(data as number)
          resolve()
        })
      })
      await taskpool.execute(task1)
      await task1Promise

      let task2: taskpool.Task = new taskpool.Task(loadDataWithNotifyTask, 1, 10)
      let task2Promise: Promise<void> = new Promise<void>((resolve: Function) => {
        task2.onReceiveData((data: Object): void => {
          loadedPages.push(data as number)
          resolve()
        })
      })
      await taskpool.execute(task2)
      await task2Promise

      expect(loadedPages.length).assertLargerOrEqual(2)
      expect(loadedPages[0]).assertEqual(0)
      expect(loadedPages[1]).assertEqual(1)
    })
  })
}
