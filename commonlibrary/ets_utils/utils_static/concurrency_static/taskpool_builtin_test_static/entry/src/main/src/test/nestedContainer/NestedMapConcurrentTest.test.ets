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

function testNestedMapOuter(map: Map<string, Map<string, number>>, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      let inner: Map<string, number> = new Map<string, number>();
      inner.set('key', i);
      map.set('outerKey' + i, inner);
      map.get('outerKey' + i);
      map.delete('outerKey' + i);
    } catch (e) {
      console.info(`testNestedMapOuter catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    taskCounter.fetchAdd(1);
  }
}

function testNestedMapInner(map: Map<string, Map<string, number>>, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      let idx: number = i % 10;
      let inner: Map<string, number> | undefined = map.get('key' + idx);
      if (inner !== undefined && inner !== null) {
        inner.set('innerKey' + i, i);
        inner.get('innerKey' + i);
        inner.delete('innerKey' + i);
      }
    } catch (e) {
      console.info(`testNestedMapInner catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    taskCounter.fetchAdd(1);
  }
}

function testNestedMapMutex(map: Map<string, Map<string, number>>, mutex: Mutex, taskCounter: AtomicInt): void {
  for (let i: number = 0; i < 10; i++) {
    mutex.lock();
    try {
      let inner: Map<string, number> = new Map<string, number>();
      inner.set('key', i);
      map.set('outerKey' + i, inner);
      map.delete('outerKey' + i);
    } finally {
      mutex.unlock();
    }
    taskCounter.fetchAdd(1);
  }
}

export default function NestedMapConcurrentTest(): void {
  describe('NestedMapConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_MAP_0100
     * @tc.name   testNestedMapOuterConcurrent0100
     * @tc.desc   CON-051 Map of Map无锁竞态并发外层set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedMapOuterConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskCounter: AtomicInt = new AtomicInt(0);
      let map: Map<string, Map<string, number>> = new Map<string, Map<string, number>>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testNestedMapOuter, map, taskCounter).then((): void => { });
      }
      testNestedMapOuter(map, taskCounter);
      while (taskCounter.load() < totalTasks * 10 + 10) {
        try {
          await Utils.msSleep(100);
        } catch (err) {
          expect(err).assertFail();
        }
      }
      expect(taskCounter.load()).assertEqual(totalTasks * 10 + 10);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_MAP_0200
     * @tc.name   testNestedMapInnerConcurrent0200
     * @tc.desc   CON-052 Map of Map无锁竞态并发内层set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedMapInnerConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let map: Map<string, Map<string, number>> = new Map<string, Map<string, number>>();
        for (let i: number = 0; i < 10; i++) {
          map.set('key' + i, new Map<string, number>());
        }
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedMapInner, map, taskCounter).then((): void => { });
        }
        testNestedMapInner(map, taskCounter);
        while (taskCounter.load() < totalTasks * 10 + 10) {
          await Utils.msSleep(100);
        }
        expect(taskCounter.load()).assertEqual(totalTasks * 10 + 10);
      } catch (e) {
        console.info(`testNestedMapInnerConcurrent0200 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_NESTED_MAP_0300
     * @tc.name   testNestedMapMutexConcurrent0300
     * @tc.desc   CON-053 Map of Map Mutex保护并发操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedMapMutexConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskCounter: AtomicInt = new AtomicInt(0);
        let map: Map<string, Map<string, number>> = new Map<string, Map<string, number>>();
        let mutex: Mutex = new Mutex();
        let totalTasks: number = 10;
        for (let i: number = 0; i < totalTasks; i++) {
          taskpool.execute(testNestedMapMutex, map, mutex, taskCounter).then((): void => { });
        }
        testNestedMapMutex(map, mutex, taskCounter);
        while (taskCounter.load() < totalTasks * 10 + 10) {
          await Utils.msSleep(100);
        }
        expect(map.size).assertEqual(0);
      } catch (e) {
        console.info(`testNestedMapMutexConcurrent0300 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
