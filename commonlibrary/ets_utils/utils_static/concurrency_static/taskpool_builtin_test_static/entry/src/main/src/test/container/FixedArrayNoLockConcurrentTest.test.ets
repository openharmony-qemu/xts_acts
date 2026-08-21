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

function testFixedArrayIndexRW(arr: FixedArray<number>): void {
  for (let i: int = 0; i < 10; i++) {
    try {
      let idx: int = i % 100;
      arr[idx] = i;
      let val: number = arr[idx];
    } catch (e) {
      console.info(`testFixedArrayIndexRW catch race-tolerated error: ${JSON.stringify(e)}`);
    }
  }
}

export default function FixedArrayNoLockConcurrentTest(): void {
  describe('FixedArrayNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_FIXEDARRAY_NOLOCK_0100
     * @tc.name   testFixedArrayNoLockConcurrent0100
     * @tc.desc   CON-005 FixedArray线程隔离索引并发读写
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFixedArrayNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let count: AtomicInt = new AtomicInt(0);
        let arr: FixedArray<number> = new FixedArray<number>(100);
        let totalTasks: number = 10;
        let tasks: Promise<Any>[] = [];
        for (let i: number = 0; i < totalTasks; i++) {
          tasks.push(taskpool.execute(testFixedArrayIndexRW, new FixedArray<number>(100)));
        }
        testFixedArrayIndexRW(arr);
        count.fetchAdd(1);
        await Promise.all(tasks);
        count.fetchAdd(totalTasks.toInt());
        expect(count.load()).assertEqual(totalTasks + 1);
      } catch (e) {
        console.info(`testFixedArrayNoLockConcurrent0100 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
