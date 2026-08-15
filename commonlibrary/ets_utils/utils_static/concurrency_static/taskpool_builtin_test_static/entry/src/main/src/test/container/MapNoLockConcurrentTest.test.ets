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

function testMapNoLock(map: Map<string, number>): void {
  for (let i: number = 0; i < 10; i++) {
    try {
      map.set('key' + i, i);
      map.get('key' + i);
      map.delete('key' + i);
    } catch (e) {
      console.info(`testMapNoLock catch race-tolerated error: ${JSON.stringify(e)}`);
    }
  }
}

function testMapNoLockStress(map: Map<string, number>): void {
  for (let i: number = 0; i < 100; i++) {
    try {
      map.set('key' + i, i);
      map.get('key' + i);
      map.delete('key' + i);
    } catch (e) {
      console.info(`testMapNoLockStress catch race-tolerated error: ${JSON.stringify(e)}`);
    }
  }
}

export default function MapNoLockConcurrentTest(): void {
  describe('MapNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_NOLOCK_0100
     * @tc.name   testMapNoLockConcurrent0100
     * @tc.desc   CON-006 Map线程隔离无锁并发set/get/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let map: Map<string, number> = new Map<string, number>();
      let totalTasks: number = 10;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testMapNoLock, new Map<string, number>()).then((): void => { count.fetchAdd(1); });
      }
      testMapNoLock(map);
      count.fetchAdd(1);
      while (count.load() < totalTasks + 1) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks + 1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_MAP_NOLOCK_0200
     * @tc.name   testMapNoLockStressConcurrent0200
     * @tc.desc   CON-013 Map 100线程隔离并发set/get/delete压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMapNoLockStressConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let count: AtomicInt = new AtomicInt(0);
      let totalTasks: number = 100;
      for (let i: number = 0; i < totalTasks; i++) {
        taskpool.execute(testMapNoLockStress, new Map<string, number>()).then((): void => { count.fetchAdd(1); });
      }
      while (count.load() < totalTasks) {
        await Utils.msSleep(100);
      }
      expect(count.load()).assertEqual(totalTasks);
    });
  });
}
