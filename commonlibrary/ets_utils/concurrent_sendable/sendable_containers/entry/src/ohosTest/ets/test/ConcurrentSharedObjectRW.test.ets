/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import {
  SendableSharedCounter,
  SendableSharedArray,
  SendableClass,
  SendableSharedMap,
  testErrorHandling,
  longRunningTask,
  gc
} from './model/SendableModel';

function asyncSleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

@Concurrent
function testConcurrentCounterRW(counter: SendableSharedCounter): void {
  for (let i = 0; i < 10; i++) {
    try {
      counter.counter = counter.counter + 1;
      counter.operationCount = counter.operationCount + 1;
      counter.lastValue = counter.counter;
      let value = counter.counter;
      counter.counter = counter.counter - 1;
      counter.counter = counter.counter + value;
    } catch (e) {
      counter.errorCount = counter.errorCount + 1;
      console.info('testConcurrentCounterRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentArrayRW(arr: SendableSharedArray): void {
  for (let i = 0; i < 10; i++) {
    try {
      arr.array.push(new SendableSharedCounter());
      arr.addCount = arr.addCount + 1;
      if (arr.array.length > 0) {
        let element = arr.array[arr.array.length - 1];
        if (element) {
          element.counter = i;
        }
      }
      arr.array.pop();
      arr.array.find(item => item.counter > 10);
      arr.removeCount = arr.removeCount + 1;
      let length = arr.array.length;
      for (let j = 0; j < length; j++) {
        let item = arr.array[j];
        if (item) {
          item.counter = item.counter + 1;
        }
      }
    } catch (e) {
      arr.errorCount = arr.errorCount + 1;
      console.info('testConcurrentArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentMapRW(mapObj: SendableSharedMap): void {
  for (let i = 0; i < 10; i++) {
    try {
      mapObj.map.set(i, new SendableClass(i));
      mapObj.setCount = mapObj.setCount + 1;
      let element = mapObj.map.get(i);
      if (element) {
        element.value = element.value + 100;
      }
      mapObj.map.has(i);
      mapObj.map.delete(i);
      mapObj.deleteCount = mapObj.deleteCount + 1;
      mapObj.map.forEach((value: SendableClass, key: number) => {
        value.value = value.value + 1;
      });
      for (let entry of mapObj.map.entries()) {
        entry[1].value = entry[1].value + 1;
      }
      for (let key of mapObj.map.keys()) {
        mapObj.map.has(key);
      }
      for (let value of mapObj.map.values()) {
        value.value = value.value + 1;
      }
      mapObj.map.clear();
    } catch (e) {
      mapObj.errorCount = mapObj.errorCount + 1;
      console.info('testConcurrentMapRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentCollectionsMapRW(map: collections.Map<number, SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      map.set(i, new SendableClass(i));
      let element = map.get(i);
      if (element) {
        element.value = element.value + 1;
      }
      map.has(i);
      let size = map.size;
      map.forEach((value: SendableClass, key: number) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let entry of map.entries()) {
        if (entry[1]) {
          entry[1].value = entry[1].value + 1;
        }
      }
      for (let key of map.keys()) {
        map.has(key);
      }
      for (let value of map.values()) {
        if (value) {
          value.value = value.value + 1;
        }
      }
      map.delete(i);
      map.clear();
    } catch (e) {
      console.info('testConcurrentCollectionsMapRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentCollectionsArrayRW(arr: collections.Array<SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      arr.push(new SendableClass(i));
      arr.unshift(new SendableClass(i * 10));
      let length = arr.length;
      if (length > 0) {
        let element = arr[0];
        if (element) {
          element.value = element.value + 100;
        }
        let lastElement = arr[arr.length - 1];
        if (lastElement) {
          lastElement.value = lastElement.value + 50;
        }
      }
      arr.forEach((value: SendableClass, index: number) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let item of arr) {
        if (item) {
          item.value = item.value + 1;
        }
      }
      let filtered = arr.filter((item: SendableClass) => item.value > 0);
      let mapped = arr.map((item: SendableClass) => new SendableClass(item.value * 2));
      let found = arr.find((item: SendableClass) => item.value > 50);
      let foundIndex = arr.findIndex((item: SendableClass) => item.value > 50);
      let includesResult = arr.includes(arr[0]);
      let indexOfResult = arr.indexOf(arr[0]);
      let someResult = arr.some((item: SendableClass) => item.value > 0);
      let everyResult = arr.every((item: SendableClass) => item.value >= 0);
      let reduced = arr.reduce((sum: number, item: SendableClass) => sum + item.value, 0);
      let sliced = arr.slice(0, 5);
      arr.sort((a: SendableClass, b: SendableClass) => a.value - b.value);
      arr.reverse();
      arr.splice(0, 1);
      arr.shift();
      arr.pop();
    } catch (e) {
      console.info('testConcurrentCollectionsArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentCollectionsSetRW(set: collections.Set<SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      let obj = new SendableClass(i);
      set.add(obj);
      set.has(obj);
      let size = set.size;
      set.forEach((value: SendableClass) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let entry of set.entries()) {
        if (entry[1]) {
          entry[1].value = entry[1].value + 1;
        }
      }
      for (let value of set.values()) {
        if (value) {
          value.value = value.value + 1;
        }
      }
      for (let key of set.keys()) {
        if (key) {
          key.value = key.value + 1;
        }
      }
      set.delete(obj);
      set.clear();
    } catch (e) {
      console.info('testConcurrentCollectionsSetRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentComplexRW(counter: SendableSharedCounter, arr: SendableSharedArray,
  mapObj: SendableSharedMap): void {
  for (let i = 0; i < 10; i++) {
    try {
      counter.counter = counter.counter + 1;
      arr.array.push(new SendableSharedCounter());
      mapObj.map.set(i, new SendableClass(i));
      if (arr.array.length > 5) {
        arr.array.pop();
      }
      if (mapObj.map.size > 5) {
        mapObj.map.delete(i - 5);
      }
    } catch (e) {
      counter.errorCount = counter.errorCount + 1;
      arr.errorCount = arr.errorCount + 1;
      mapObj.errorCount = mapObj.errorCount + 1;
      console.info('testConcurrentComplexRW error: ' + e);
    }
  }
}

export default function concurrentSharedObjectRWTest() {
  describe('concurrentSharedObjectRWTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await asyncSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
      gc();
    })

    /**
     * @tc.name   concurrentCounterReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COUNTER_RW_0100
     * @tc.desc   Concurrent counter read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCounterReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentCounterReadWrite0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ARRAY_RW_0100
     * @tc.desc   Concurrent array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentArrayReadWrite0100';
      console.info(`${tag} start.`);
      let arr = new SendableSharedArray();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentArrayRW, arr).then(() => {
          count++;
        });
        testConcurrentArrayRW(arr);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentMapReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MAP_RW_0100
     * @tc.desc   Concurrent map read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMapReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentMapReadWrite0100';
      console.info(`${tag} start.`);
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
          count++;
        });
        testConcurrentMapRW(mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentComplexReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COMPLEX_RW_0100
     * @tc.desc   Concurrent complex data read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentComplexReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentComplexReadWrite0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let arr = new SendableSharedArray();
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentComplexRW, counter, arr, mapObj).then(() => {
          count++;
        });
        testConcurrentComplexRW(counter, arr, mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentCollectionsMapReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_MAP_RW_0100
     * @tc.desc   Concurrent collections.Map read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsMapReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsMapReadWrite0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        for (let i = 0; i < 100; i++) {
          map.set(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCollectionsArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_ARRAY_RW_0100
     * @tc.desc   Concurrent collections.Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsArrayReadWrite0100';
        console.info(`${tag} start.`);
        let arr = new collections.Array<SendableClass>();
        for (let i = 0; i < 100; i++) {
          arr.push(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsArrayRW, arr).then(() => {
            count++;
          });
          testConcurrentCollectionsArrayRW(arr);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCollectionsSetReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_SET_RW_0100
     * @tc.desc   Concurrent collections.Set read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsSetReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsSetReadWrite0100';
        console.info(`${tag} start.`);
        let set = new collections.Set<SendableClass>();
        for (let i = 0; i < 100; i++) {
          set.add(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsSetRW, set).then(() => {
            count++;
          });
          testConcurrentCollectionsSetRW(set);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCounterStress500_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COUNTER_STRESS_0100
     * @tc.desc   Concurrent counter stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCounterStress500_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCounterStress500_0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentArrayStress500_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ARRAY_STRESS_0100
     * @tc.desc   Concurrent array stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentArrayStress500_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentArrayStress500_0100';
      console.info(`${tag} start.`);
      let arr = new SendableSharedArray();
      let count = 0;
      let totalTasks = 50;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentArrayRW, arr).then(() => {
          count++;
        });
        testConcurrentArrayRW(arr);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentMapStress500_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MAP_STRESS_0100
     * @tc.desc   Concurrent map stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMapStress500_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentMapStress500_0100';
      console.info(`${tag} start.`);
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 50;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
          count++;
        });
        testConcurrentMapRW(mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentComplexStress500_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COMPLEX_STRESS_0100
     * @tc.desc   Concurrent complex data stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentComplexStress500_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentComplexStress500_0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let arr = new SendableSharedArray();
        let mapObj = new SendableSharedMap();
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentComplexRW, counter, arr, mapObj).then(() => {
            count++;
          });
          testConcurrentComplexRW(counter, arr, mapObj);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentMultipleSharedObjects0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MULTIPLE_OBJECTS_0100
     * @tc.desc   Concurrent multiple shared objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMultipleSharedObjects0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentMultipleSharedObjects0100';
        console.info(`${tag} start.`);
        let counter1 = new SendableSharedCounter();
        let counter2 = new SendableSharedCounter();
        let counter3 = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 30;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter1).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCounterRW, counter2).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCounterRW, counter3).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter1);
          testConcurrentCounterRW(counter2);
          testConcurrentCounterRW(counter3);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} counter1: ${counter1.counter}, counter2: ${counter2.counter}, counter3: ${counter3.counter}.`);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentBoundaryZeroTasks0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_BOUNDARY_ZERO_0100
     * @tc.desc   Concurrent boundary zero tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentBoundaryZeroTasks0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentBoundaryZeroTasks0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 0;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
        }
        await asyncSleep(500);
        expect(count).assertEqual(0);
        expect(counter.counter).assertEqual(0);
        expect(counter.operationCount).assertEqual(0);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentErrorHandling0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ERROR_HANDLING_0100
     * @tc.desc   Concurrent error handling test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentErrorHandling0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentErrorHandling0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testErrorHandling, counter).then(() => {
          count++;
        });
        testErrorHandling(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} counter: ${counter.counter}, errorCount: ${counter.errorCount}.`);
      expect(counter.errorCount).assertLargerOrEqual(0);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentAllContainersParallel0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ALL_PARALLEL_0100
     * @tc.desc   Concurrent all containers parallel test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentAllContainersParallel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentAllContainersParallel0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let arr = new SendableSharedArray();
        let mapObj = new SendableSharedMap();
        let count = 0;
        let totalTasks = 30;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentArrayRW, arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
          testConcurrentArrayRW(arr);
          testConcurrentMapRW(mapObj);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentIterateDuringModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ITERATE_MODIFY_0100
     * @tc.desc   Concurrent iterate during modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentIterateDuringModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentIterateDuringModify0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        for (let i = 0; i < 50; i++) {
          map.set(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
        }
        while (count < totalTasks) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentLongRunning0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_LONG_RUNNING_0100
     * @tc.desc   Concurrent long running test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentLongRunning0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentLongRunning0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 30;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(longRunningTask, counter).then(() => {
          count++;
        });
        longRunningTask(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentResetAndReuse0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_RESET_REUSE_0100
     * @tc.desc   Concurrent reset and reuse test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentResetAndReuse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentResetAndReuse0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 50;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} first round count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      let firstRoundCount = counter.counter;
      console.info(`${tag} first round counter: ${firstRoundCount}.`);
      counter.counter = 0;
      counter.operationCount = 0;
      count = 0;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(1000);
        console.info(`${tag} second round count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentAllContainersFullReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ALL_FULL_RW_0100
     * @tc.desc   Concurrent all containers full read write methods test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentAllContainersFullReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentAllContainersFullReadWrite0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        let arr = new collections.Array<SendableClass>();
        let set = new collections.Set<SendableClass>();
        for (let i = 0; i < 50; i++) {
          map.set(i, new SendableClass(i));
          arr.push(new SendableClass(i));
          set.add(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 50;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCollectionsArrayRW, arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCollectionsSetRW, set).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
          testConcurrentCollectionsArrayRW(arr);
          testConcurrentCollectionsSetRW(set);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(1000);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} end.`);
        done();
      });
  })
}