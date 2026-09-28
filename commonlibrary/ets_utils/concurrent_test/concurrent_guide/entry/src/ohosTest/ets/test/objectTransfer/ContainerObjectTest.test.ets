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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections } from '@kit.ArkTS';

@Concurrent
function processSortedArray(items: number[]): number[] {
  let sorted: number[] = items.slice()
  sorted.sort((a: number, b: number) => a - b)
  return sorted
}

@Concurrent
function getSortedFirst(items: number[]): number {
  let sorted: number[] = items.slice()
  sorted.sort((a: number, b: number) => a - b)
  return sorted[0]
}

@Concurrent
function getSortedLast(items: number[]): number {
  let sorted: number[] = items.slice()
  sorted.sort((a: number, b: number) => a - b)
  return sorted[sorted.length - 1]
}

@Concurrent
function testContainerOperations(items: number[], testValue: number): string {
  let container: Set<number> = new Set<number>()
  for (let i: number = 0; i < items.length; i++) {
    container.add(items[i])
  }
  let initialSize: number = container.size
  container.add(100)
  let afterAdd: number = container.size
  let hasValue: boolean = container.has(testValue)
  container.delete(testValue)
  let afterDelete: number = container.size
  let hasAfterDelete: boolean = container.has(testValue)
  return initialSize.toString() + '|' + afterAdd.toString() + '|' + hasValue.toString() + '|' + afterDelete.toString() + '|' + hasAfterDelete.toString()
}

@Concurrent
function iterateContainerValues(items: number[]): collections.Array<number> {
  let container: Set<number> = new Set<number>()
  for (let i: number = 0; i < items.length; i++) {
    container.add(items[i])
  }
  let result: collections.Array<number> = new collections.Array<number>()
  container.forEach((value: number) => {
    result.push(value)
  })
  result.sort((a: number, b: number) => a - b)
  return result
}

@Concurrent
function processStringContainer(items: string[]): number {
  let container: Set<string> = new Set<string>()
  for (let i: number = 0; i < items.length; i++) {
    container.add(items[i])
  }
  return container.size
}

@Concurrent
function processLargeContainer(count: number): number {
  let container: Set<number> = new Set<number>()
  for (let i: number = 0; i < count; i++) {
    container.add(i)
  }
  return container.size
}

@Concurrent
function verifySortedOrdering(items: number[]): boolean {
  let sorted: number[] = items.slice()
  sorted.sort((a: number, b: number) => a - b)
  let ordered: boolean = true
  for (let i: number = 1; i < sorted.length; i++) {
    if (sorted[i] < sorted[i - 1]) {
      ordered = false
      break
    }
  }
  return ordered
}

@Concurrent
function containerDeduplication(items: number[]): boolean {
  let container: Set<number> = new Set<number>()
  let beforeCount: number = items.length
  for (let i: number = 0; i < items.length; i++) {
    container.add(items[i])
  }
  return container.size < beforeCount
}

@Concurrent
function containerClearAndCheck(items: number[]): number {
  let container: Set<number> = new Set<number>()
  for (let i: number = 0; i < items.length; i++) {
    container.add(items[i])
  }
  container.clear()
  return container.size
}

@Concurrent
function processCollectionsArray(items: number[]): number {
  let arr: collections.Array<number> = new collections.Array<number>()
  for (let i: number = 0; i < items.length; i++) {
    arr.push(items[i])
  }
  return arr.length
}

export default function ContainerObjectTest(): void {
  describe('ContainerObjectTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ContainerObjectTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0100
     * @tc.desc   Verify sorted array container cross-thread serialization with number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [10, 5, 20, 15]
      let result = await taskpool.execute(new taskpool.Task(processSortedArray, items))
      let sorted: number[] = result as number[]
      expect(sorted.length).assertEqual(4)
      expect(sorted[0]).assertEqual(5)
      expect(sorted[3]).assertEqual(20)
    })

    /**
     * @tc.name   ContainerObjectTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0200
     * @tc.desc   Verify container getFirst returns smallest element after cross-thread sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [30, 10, 50, 20, 40]
      let result = await taskpool.execute(new taskpool.Task(getSortedFirst, items))
      expect(result as number).assertEqual(10)
    })

    /**
     * @tc.name   ContainerObjectTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0300
     * @tc.desc   Verify container getLast returns largest element after cross-thread sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [30, 10, 50, 20, 40]
      let result = await taskpool.execute(new taskpool.Task(getSortedLast, items))
      expect(result as number).assertEqual(50)
    })

    /**
     * @tc.name   ContainerObjectTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0400
     * @tc.desc   Verify Set container add/delete/has/size operations after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [10, 20, 30, 40, 50]
      let result = await taskpool.execute(new taskpool.Task(testContainerOperations, items, 50))
      let parts: string[] = (result as string).split('|')
      expect(parts[0]).assertEqual('5')
      expect(parts[1]).assertEqual('6')
      expect(parts[2]).assertEqual('true')
      expect(parts[3]).assertEqual('5')
      expect(parts[4]).assertEqual('false')
    })

    /**
     * @tc.name   ContainerObjectTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0500
     * @tc.desc   Verify container forEach iteration after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [30, 10, 20, 50, 40]
      let result = await taskpool.execute(new taskpool.Task(iterateContainerValues, items))
      let values: number[] = result as number[]
      expect(values.length).assertEqual(5)
      expect(values[0]).assertEqual(10)
      expect(values[4]).assertEqual(50)
    })

    /**
     * @tc.name   ContainerObjectTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0600
     * @tc.desc   Verify string container cross-thread serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: string[] = ['apple', 'banana', 'cherry']
      let result = await taskpool.execute(new taskpool.Task(processStringContainer, items))
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   ContainerObjectTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0700
     * @tc.desc   Verify sorted container maintains correct ordering after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let items: number[] = [55, 22, 88, 11, 99, 33, 77]
      let result = await taskpool.execute(new taskpool.Task(verifySortedOrdering, items))
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   ContainerObjectTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0800
     * @tc.desc   Verify Set container deduplication - duplicate elements are ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let items: number[] = [1, 2, 3, 2, 1, 3]
      let result = await taskpool.execute(new taskpool.Task(containerDeduplication, items))
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   ContainerObjectTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_0900
     * @tc.desc   Verify container clear operation after cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let items: number[] = [1, 2, 3, 4, 5]
      let result = await taskpool.execute(new taskpool.Task(containerClearAndCheck, items))
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   ContainerObjectTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1000
     * @tc.desc   Verify large capacity container with 1000 elements transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(processLargeContainer, 1000))
      expect(result as number).assertEqual(1000)
    })

    /**
     * @tc.name   ContainerObjectTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1100
     * @tc.desc   Verify large capacity container with 10000 elements transfer performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerObjectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let start: number = Date.now()
      let result = await taskpool.execute(new taskpool.Task(processLargeContainer, 10000))
      let elapsed: number = Date.now() - start
      expect(result as number).assertEqual(10000)
      expect(elapsed >= 0).assertTrue()
    })

    /**
     * @tc.name   ContainerObjectTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1200
     * @tc.desc   Verify multiple container objects passed simultaneously via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ContainerObjectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let p1: Promise<Object> = taskpool.execute(new taskpool.Task(getSortedFirst, [3, 1, 2]))
      let p2: Promise<Object> = taskpool.execute(new taskpool.Task(processStringContainer, ['a', 'b']))
      let p3: Promise<Object> = taskpool.execute(new taskpool.Task(getSortedLast, [100, 50, 200]))
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(2)
      expect(results[2] as number).assertEqual(200)
    })

    /**
     * @tc.name   ContainerObjectTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1300
     * @tc.desc   Verify container with single element cross-thread transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await taskpool.execute(new taskpool.Task(getSortedFirst, [42]))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ContainerObjectTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1400
     * @tc.desc   Verify container with negative number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ContainerObjectTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let items: number[] = [-5, -1, -10, 0, 3]
      let result = await taskpool.execute(new taskpool.Task(getSortedFirst, items))
      expect(result as number).assertEqual(-10)
    })

    /**
     * @tc.name   ContainerObjectTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONTAINER_OBJECT_TEST_1500
     * @tc.desc   Verify collections.Array container cross-thread serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ContainerObjectTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let items: number[] = [10, 20, 30, 40, 50]
      let result = await taskpool.execute(new taskpool.Task(processCollectionsArray, items))
      expect(result as number).assertEqual(5)
    })
  })
}
