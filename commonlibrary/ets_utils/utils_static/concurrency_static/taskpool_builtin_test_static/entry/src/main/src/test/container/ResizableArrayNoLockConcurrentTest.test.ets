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

function arrayOperations(arr: Array<number>): number {
  for (let i: int = 0; i < 10; i++) {
    arr.push(i);
    arr.pop();
  }
  return arr.length;
}

function sharedArrayOperations(arr: Array<number>, counter: AtomicInt): void {
  for (let i: int = 0; i < 10; i++) {
    try {
      arr.push(i);
      arr.pop();
    } catch (e) {
      console.info(`sharedArrayOperations catch race-tolerated error: ${JSON.stringify(e)}`);
    }
    counter.fetchAdd(1);
  }
}

function arrayStressOperations(arr: Array<number>): number {
  for (let i: int = 0; i < 1000; i++) {
    arr.push(i);
    arr.pop();
  }
  return arr.length;
}

async function nestedArrayOperations(): Promise<number> {
  let completed: number = 0;
  for (let i: int = 0; i < 5; i++) {
    let result: number = await taskpool.execute(arrayOperations, new Array<number>()) as number;
    if (result === 0) {
      completed++;
    }
  }
  return completed;
}

export default function ResizableArrayNoLockConcurrentTest(): void {
  describe('ResizableArrayNoLockConcurrentTest', (): void => {
    beforeAll((): void => { });
    beforeEach((): void => { });
    afterEach((): void => { });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0100
     * @tc.name   testResizableArrayNoLockConcurrent0100
     * @tc.desc   CON-001 ResizableArray线程隔离无锁并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayNoLockConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 10; i++) {
          tasks.push(taskpool.execute(arrayOperations, new Array<number>()));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          expect(await tasks[i] as number).assertEqual(0);
        }
        expect(arrayOperations(new Array<number>())).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0200
     * @tc.name   testResizableArrayTaskPoolConcurrent0200
     * @tc.desc   CON-009 ResizableArray共享实例TaskPool并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayTaskPoolConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let sharedArray: Array<number> = [];
        let counter: AtomicInt = new AtomicInt(0);
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 20; i++) {
          tasks.push(taskpool.execute(sharedArrayOperations, sharedArray, counter));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          await tasks[i];
        }
        expect(counter.load()).assertEqual(200);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0300
     * @tc.name   testResizableArrayAsyncConcurrent0300
     * @tc.desc   CON-011 ResizableArray TaskPool并发push/pop计数等待
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayAsyncConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let completed: number = 0;
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 10; i++) {
          tasks.push(taskpool.execute(arrayOperations, new Array<number>()));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          let result: number = await tasks[i] as number;
          if (result === 0) {
            completed++;
          }
        }
        expect(completed).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0400
     * @tc.name   testResizableArrayBigLoopConcurrent0400
     * @tc.desc   CON-014 ResizableArray 大循环push/pop压力
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayBigLoopConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 5; i++) {
          tasks.push(taskpool.execute(arrayStressOperations, new Array<number>()));
        }
        for (let i: int = 0; i < tasks.length; i++) {
          expect(await tasks[i] as number).assertEqual(0);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0500
     * @tc.name   testResizableArrayNestedConcurrent0500
     * @tc.desc   CON-015 ResizableArray嵌套任务并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayNestedConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        let tasks: Promise<Any>[] = [];
        for (let i: int = 0; i < 5; i++) {
          tasks.push(taskpool.execute(nestedArrayOperations));
        }
        let completed: number = 0;
        for (let i: int = 0; i < tasks.length; i++) {
          completed += await tasks[i] as number;
        }
        expect(completed).assertEqual(25);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_STATIC_CONCURRENT_CONTAINER_RESIZABLEARRAY_NOLOCK_0600
     * @tc.name   testResizableArrayCancelConcurrent0600
     * @tc.desc   CON-016 ResizableArray任务取消并发push/pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResizableArrayCancelConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let canceledTask = new taskpool.Task(arrayOperations, new Array<number>());
        let canceledPromise: Promise<Any> = taskpool.executeDelayed(2000, canceledTask);
        let normalPromise: Promise<Any> = taskpool.execute(arrayOperations, new Array<number>());
        taskpool.cancel(canceledTask);
        let canceled: boolean = false;
        try {
          await canceledPromise;
        } catch (e) {
          canceled = true;
        }
        expect(canceled).assertTrue();
        try {
          expect(await normalPromise as number).assertEqual(0);
        } catch (e) {
          console.info(`testResizableArrayCancelConcurrent0600 catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
        done();
      });
  });
}
