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

function testAtomicIntFetchAdd(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

function testAtomicIntFetchSub(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.fetchSub(1);
    taskCounter.fetchAdd(1);
  }
}

function testAtomicIntStore(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    counter.store(i);
    taskCounter.fetchAdd(1);
  }
}

function testAtomicIntLoad(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    counter.load();
    taskCounter.fetchAdd(1);
  }
}

function testAtomicIntStress(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 100; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

function testAtomicIntBigLoop(counter: AtomicInt, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10000; i++) {
    counter.fetchAdd(1);
    taskCounter.fetchAdd(1);
  }
}

export default function AtomicIntConcurrentTest(): void {
  describe('AtomicIntConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_0100
     * @tc.name   testAtomicIntFetchAddConcurrent0100
     * @tc.desc   CON-055 AtomicInt多线程并发fetchAdd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntFetchAddConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 10;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntFetchAdd, counter, taskCounter));
      }
      testAtomicIntFetchAdd(counter, taskCounter);
      try {
        await Promise.all(tasks);
        expect(counter.load()).assertEqual(totalTasks * 10 + 10);
      } catch (e) {
        console.info(`testAtomicIntFetchAddConcurrent0100 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_0200
     * @tc.name   testAtomicIntFetchSubConcurrent0200
     * @tc.desc   CON-056 AtomicInt多线程并发fetchSub
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntFetchSubConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(110);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 10;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntFetchSub, counter, taskCounter));
      }
      testAtomicIntFetchSub(counter, taskCounter);
      try {
        await Promise.all(tasks);
        expect(counter.load()).assertEqual(0);
      } catch (e) {
        console.info(`testAtomicIntFetchSubConcurrent0200 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_0300
     * @tc.name   testAtomicIntLoadStoreConcurrent0300
     * @tc.desc   CON-057 AtomicInt多线程并发load/store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntLoadStoreConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 5;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntStore, counter, taskCounter));
      }
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntLoad, counter, taskCounter));
      }
      try {
        await Promise.all(tasks);
        expect(taskCounter.load()).assertEqual(totalTasks * 10 * 2);
      } catch (e) {
        console.info(`testAtomicIntLoadStoreConcurrent0300 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_0400
     * @tc.name   testAtomicIntStressConcurrent0400
     * @tc.desc   CON-061 AtomicInt 100线程并发fetchAdd压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntStressConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntStress, counter, taskCounter));
      }
      try {
        await Promise.all(tasks);
        expect(counter.load()).assertEqual(totalTasks * 100);
      } catch (e) {
        console.info(`testAtomicIntStressConcurrent0400 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ATOMIC_INT_0500
     * @tc.name   testAtomicIntBigLoopConcurrent0500
     * @tc.desc   CON-062 AtomicInt大循环fetchAdd压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtomicIntBigLoopConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskCounter: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 10;
      let tasks: Promise<Any>[] = [];
      for (let i: number = 0; i < totalTasks; i++) {
        tasks.push(taskpool.execute(testAtomicIntBigLoop, counter, taskCounter));
      }
      testAtomicIntBigLoop(counter, taskCounter);
      try {
        await Promise.all(tasks);
        expect(counter.load()).assertEqual(totalTasks * 10000 + 10000);
      } catch (e) {
        console.info(`testAtomicIntBigLoopConcurrent0500 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
