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

function mapSetOperations(map: containers.ConcurrentHashMap<string, number>, id: int): number {
  let completed: number = 0;
  for (let i: int = 0; i < 10; i++) {
    let key: string = 'task_' + id + '_' + i;
    map.set(key, i);
    completed++;
  }
  return completed;
}

function mapDeleteOperations(map: containers.ConcurrentHashMap<string, number>, id: int): number {
  let completed: number = 0;
  for (let i: int = 0; i < 10; i++) {
    let key: string = 'task_' + id + '_' + i;
    map.delete(key);
    completed++;
  }
  return completed;
}

function mapStressOperations(map: containers.ConcurrentHashMap<string, number>, id: int): number {
  let completed: number = 0;
  for (let i: int = 0; i < 100; i++) {
    let key: string = 'stress_' + id + '_' + i;
    map.set(key, i);
    map.delete(key);
    completed++;
  }
  return completed;
}

function iterateMap(map: containers.ConcurrentHashMap<string, number>): number {
  let count: number = 0;
  for (let key of map.keys()) {
    if (map.get(key) !== undefined) {
      count++;
    }
  }
  return count;
}

function modifyMap(map: containers.ConcurrentHashMap<string, number>): number {
  for (let i: int = 0; i < 10; i++) {
    map.set('newKey' + i, i);
    map.delete('key' + i);
  }
  return 10;
}

export default function ConcurrentHashMapConcurrentTest(): void {
  describe('ConcurrentHashMapConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_CONCURRENTHASHMAP_0100
     * @tc.name   testConcurrentHashMapConcurrent0100
      * @tc.desc   CON-017 ConcurrentHashMap分阶段并发set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentHashMapConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let seed = new Map<string, number>();
          for (let i: number = 0; i < 100; i++) {
            seed.set('base_' + i, i);
          }
          let map = new containers.ConcurrentHashMap<string, number>(seed);
          let setTasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            setTasks.push(taskpool.execute(mapSetOperations, map, i));
          }
          for (let i: int = 0; i < setTasks.length; i++) {
            expect(await setTasks[i] as number).assertEqual(10);
          }
          for (let taskId: int = 0; taskId < 10; taskId++) {
            for (let value: int = 0; value < 10; value++) {
              expect(map.get('task_' + taskId + '_' + value)).assertEqual(value);
            }
          }
          let deleteTasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            deleteTasks.push(taskpool.execute(mapDeleteOperations, map, i));
          }
          for (let i: int = 0; i < deleteTasks.length; i++) {
            expect(await deleteTasks[i] as number).assertEqual(10);
          }
          expect(map.size).assertEqual(100);
          expect(map.has('task_0_0')).assertFalse();
          expect(map.has('task_9_9')).assertFalse();
          expect(map.get('base_0')).assertEqual(0.0);
          expect(map.get('base_99')).assertEqual(99.0);
        } catch (e) {
          console.info(`testConcurrentHashMapConcurrent0100 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_CONCURRENTHASHMAP_0200
     * @tc.name   testConcurrentHashMapIterateConcurrent0200
     * @tc.desc   CON-018 ConcurrentHashMap遍历中并发set/delete（弱一致性）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentHashMapIterateConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let map = new containers.ConcurrentHashMap<string, number>();
        for (let i: int = 0; i < 100; i++) {
          map.set('key' + i, i);
        }
        let iteratePromise: Promise<Any> = taskpool.execute(iterateMap, map);
        let modifyPromise: Promise<Any> = taskpool.execute(modifyMap, map);
        try {
          let iterated: number = await iteratePromise as number;
          await modifyPromise;
          expect(iterated >= 90 && iterated <= 110).assertTrue();
          expect(map.size).assertEqual(100);
        } catch (err) {
          expect(err).assertFail();
        }
        for (let i: int = 0; i < 10; i++) {
          expect(map.has('key' + i)).assertFalse();
          expect(map.get('newKey' + i)).assertEqual(i);
        }
      done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_THREADSAFE_CONCURRENTHASHMAP_0300
     * @tc.name   testConcurrentHashMapStressConcurrent0300
     * @tc.desc   CON-028 ConcurrentHashMap 10任务并发执行100次set/delete压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentHashMapStressConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let seed = new Map<string, number>();
          for (let i: number = 0; i < 2000; i++) {
            seed.set('seed_' + i, i);
          }
          let map = new containers.ConcurrentHashMap<string, number>(seed);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(mapStressOperations, map, i));
          }
          for (let i: int = 0; i < tasks.length; i++) {
            expect(await tasks[i] as number).assertEqual(100);
          }
          let residualKeys: string[] = [];
          for (let key of map.keys()) {
            if (key.startsWith('stress_')) {
              residualKeys.push(key);
            }
          }
          let residual: int = residualKeys.length;
          for (let key of residualKeys) {
            map.delete(key);
          }
          expect(residual >= 0 && residual <= 10).assertTrue();
          expect(map.size >= 2000 && map.size <= 2010).assertTrue();
          expect(map.get('seed_0')).assertEqual(0.0);
          expect(map.get('seed_1999')).assertEqual(1999.0);
        } catch (e) {
          console.info(`testConcurrentHashMapStressConcurrent0300 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      done();
      });
  });
}
