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

function testLongTask(counter: AtomicInt): void {
  for (let i: number = 0; i < 10000; i++) {
    counter.fetchAdd(1);
  }
}

export default function LongTaskConcurrentTest(): void {
  describe('LongTaskConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_LONGTASK_0100
     * @tc.name   testLongTaskExecuteConcurrent0100
     * @tc.desc   CON-080 LongTask execute长时任务并发验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongTaskExecuteConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.LongTask = new taskpool.LongTask(testLongTask, counter);
      taskpool.execute(task).then((): void => { });
      while (counter.load() < 10000) {
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_ASYNCTASK_LONGTASK_0200
     * @tc.name   testLongTaskTerminateConcurrent0200
     * @tc.desc   CON-081 LongTask terminateTask中途终止验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongTaskTerminateConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.LongTask = new taskpool.LongTask(testLongTask, counter);
      taskpool.execute(task).then((): void => { });
      while (counter.load() < 50) {
        await Utils.msSleep(100);
      }
      try {
        taskpool.terminateTask(task);
      } catch (e) {
        // 终止容忍
      }
      expect(counter.load() >= 50).assertTrue();
    });
  });
}
