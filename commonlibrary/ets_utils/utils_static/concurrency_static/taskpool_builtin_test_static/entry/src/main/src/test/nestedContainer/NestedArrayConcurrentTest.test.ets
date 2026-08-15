'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Utils.test';

function testNestedArrayOuter(arr: Array<Array<number>>, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      let inner: Array<number> = new Array<number>();
      inner.push(i);
      arr.push(inner);
      arr.pop();
    } catch (e) {
      console.info(`testNestedArrayOuter catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    taskCounter.fetchAdd(1);
  }
}

function testNestedArrayInner(arr: Array<Array<number>>, taskCounter: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    try {
      let idx: int = i % arr.length;
      let inner: Array<number> = arr[idx];
      inner.push(i);
      inner.pop();
    } catch (e) {
      console.info(`testNestedArrayInner catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    taskCounter.fetchAdd(1);
  }
}

function testNestedArrayMutex(arr: Array<Array<number>>, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      let inner: Array<number> = new Array<number>();
      inner.push(i);
      arr.push(inner);
      arr.pop();
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

function testNestedArrayStress(arr: Array<Array<number>>, taskCounter: AtomicInt): void {
  for (let i: int = 0; i < 50; i++) {
    try {
      let idx: int = i % arr.length;
      let inner: Array<number> = arr[idx];
      inner.push(i);
      inner.pop();
    } catch (e) {
      console.info(`testNestedArrayStress catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    taskCounter.fetchAdd(1);
  }
}

export default function NestedArrayConcurrentTest(): void {
  describe('NestedArrayConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_ARRAY_0100
     * @tc.name   testNestedArrayOuterConcurrent0100
     * @tc.desc   CON-048 Array of Array无锁竞态并发外层push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedArrayOuterConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let arr: Array<Array<number>> = new Array<Array<number>>();
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedArrayOuter, arr, taskCounter).then((): void => { });
        }
        testNestedArrayOuter(arr, taskCounter);
        while (taskCounter.load() < totalTasks * 10 + 10) {
          await Utils.msSleep(100);
        }
        expect(taskCounter.load()).assertEqual(totalTasks * 10 + 10);
      } catch (e) {
        console.info(`testNestedArrayOuterConcurrent0100 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_ARRAY_0200
     * @tc.name   testNestedArrayInnerConcurrent0200
     * @tc.desc   CON-049 Array of Array无锁竞态并发内层push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedArrayInnerConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let arr: Array<Array<number>> = new Array<Array<number>>();
        for (let i: number = 0; i < 10; i++) {
          arr.push(new Array<number>());
        }
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedArrayInner, arr, taskCounter).then((): void => { });
        }
        testNestedArrayInner(arr, taskCounter);
        while (taskCounter.load() < totalTasks * 10 + 10) {
          await Utils.msSleep(100);
        }
        expect(taskCounter.load()).assertEqual(totalTasks * 10 + 10);
      } catch (e) {
        console.info(`testNestedArrayInnerConcurrent0200 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_ARRAY_0300
     * @tc.name   testNestedArrayMutexConcurrent0300
     * @tc.desc   CON-050 Array of Array Mutex保护并发操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedArrayMutexConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let arr: Array<Array<number>> = new Array<Array<number>>();
        let mutex: Mutex = new Mutex();
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedArrayMutex, arr, mutex, taskCounter).then((): void => { });
        }
        testNestedArrayMutex(arr, mutex, taskCounter);
        while (taskCounter.load() < totalTasks * 10 + 10) {
          await Utils.msSleep(100);
        }
        expect(arr.length).assertEqual(0);
      } catch (e) {
        console.info(`testNestedArrayMutexConcurrent0300 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_ARRAY_0400
     * @tc.name   testNestedArrayStressConcurrent0400
     * @tc.desc   CON-054 Array of Array 50线程并发嵌套操作压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedArrayStressConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let arr: Array<Array<number>> = new Array<Array<number>>();
        for (let i: number = 0; i < 50; i++) {
          arr.push(new Array<number>());
        }
        let totalTasks: number = 50;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedArrayStress, arr, taskCounter).then((): void => { }, (err: Error): void => { expect(err).assertFail(); });
        }
        while (taskCounter.load() < totalTasks * 50) {
          await Utils.msSleep(100);
        }
        expect(taskCounter.load()).assertEqual(totalTasks * 50);
      } catch (e) {
        console.info(`testNestedArrayStressConcurrent0400 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
