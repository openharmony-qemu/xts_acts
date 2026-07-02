'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium';
import Utils from './Util.test';

let wlDel_2400: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function deleteWorkerTask2400(): string {
  wlDel_2400.set("workerValue");
  wlDel_2400.delete();
  return wlDel_2400.get();
}

let wlDel_2500: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function deleteWorkerTask2500(): string {
  return wlDel_2500.get();
}

let wlDel_2600: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function deleteWorkerTask2600(): string {
  wlDel_2600.set("worker_value");
  wlDel_2600.delete();
  return wlDel_2600.get();
}

let wlDel_2800: WorkerLocal<string> = new WorkerLocal<string>(() => "re_init");
function deleteWorkerTask2800(): string {
  wlDel_2800.set("temp");
  wlDel_2800.delete();
  return wlDel_2800.get();
}

let wlDel_3900: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function deleteEAWorkerTask3900(): string {
  wlDel_3900.set("ea_worker");
  wlDel_3900.delete();
  return wlDel_3900.get();
}

let wlDel_4000: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function deleteEAWorkerTask4000(): string {
  wlDel_4000.set("ea_worker");
  wlDel_4000.delete();
  wlDel_4000.delete();
  wlDel_4000.delete();
  return wlDel_4000.get();
}

let wlDel_4100: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function deleteEAWorkerTask4100(): string {
  for (let i: number = 0; i < 100; i++) {
    wlDel_4100.set("ea_value" + i.toString());
    wlDel_4100.delete();
  }
  return wlDel_4100.get();
}

let wlDel_4200: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function deleteEAWorkerTask4200(): string {
  wlDel_4200.set("ea_v1");
  wlDel_4200.delete();
  wlDel_4200.set("ea_v2");
  wlDel_4200.delete();
  wlDel_4200.set("ea_v3");
  return wlDel_4200.get();
}

let wlDel_4300: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_main_init");
function deleteEAWorkerTask4300(): string {
  wlDel_4300.set("ea_worker_val");
  wlDel_4300.delete();
  return wlDel_4300.get();
}

let wlDel_4400: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_shared_init");
function deleteEAWorkerTask4400(): string {
  wlDel_4400.set("ea_worker_val");
  wlDel_4400.delete();
  return wlDel_4400.get();
}

export default function BuiltinsWorkerLocalDeleteTest(): void {
  describe('BuiltinsWorkerLocalDeleteTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      Utils.syncSleep(50);
    })
    afterAll(async (): Promise<void> => { await Utils.msSleep(100) })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0100
     * @tc.desc   Verify WorkerLocal delete() with init function re-initializes on get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "initValue");
      wl.set("newValue");
      expect(wl.get()).assertEqual("newValue");
      wl.delete();
      expect(wl.get()).assertEqual("initValue");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0200
     * @tc.desc   Verify WorkerLocal delete() without init function throws on get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("value");
      wl.delete();
      let caught: boolean = false;
      try {
        wl.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0300
     * @tc.desc   Verify WorkerLocal delete() then set() then get() works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.set("value1");
      wl.delete();
      wl.set("value2");
      expect(wl.get()).assertEqual("value2");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0400
     * @tc.desc   Verify WorkerLocal multiple delete() calls are idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.set("value");
      wl.delete();
      wl.delete();
      wl.delete();
      expect(wl.get()).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0500
     * @tc.desc   Verify WorkerLocal delete() without prior set() with init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.delete();
      expect(wl.get()).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0600
     * @tc.desc   Verify WorkerLocal delete() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.set("value");
      let result: void = wl.delete();
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0700
     * @tc.desc   Verify WorkerLocal set-get-delete-get sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      expect(wl.get()).assertEqual("init");
      wl.set("value1");
      expect(wl.get()).assertEqual("value1");
      wl.delete();
      expect(wl.get()).assertEqual("init");
      wl.set("value2");
      expect(wl.get()).assertEqual("value2");
      wl.delete();
      expect(wl.get()).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0800
     * @tc.desc   Verify WorkerLocal delete() with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(42);
      wl.delete();
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest0900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_0900
     * @tc.desc   Verify WorkerLocal delete() with boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      wl.set(false);
      wl.delete();
      expect(wl.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1000
     * @tc.desc   Verify WorkerLocal delete() with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>(() => {
        let arr: number[] = [1, 2, 3];
        return arr;
      });
      let customArr: number[] = [10, 20];
      wl.set(customArr);
      wl.delete();
      let result: number[] = wl.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1100
     * @tc.desc   Verify WorkerLocal delete() re-init with call count tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let callCount: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        callCount++;
        return `init_${callCount}`;
      });
      expect(wl.get()).assertEqual("init_1");
      expect(callCount).assertEqual(1);
      wl.delete();
      expect(wl.get()).assertEqual("init_2");
      expect(callCount).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1200
     * @tc.desc   Verify WorkerLocal loop set-delete without memory leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      for (let i: number = 0; i < 100; i++) {
        wl.set("value" + i.toString());
        wl.delete();
      }
      expect(wl.get()).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1300
     * @tc.desc   Verify WorkerLocal delete() with number type and re-init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(100);
      wl.delete();
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1400
     * @tc.desc   Verify WorkerLocal delete() with Map type re-initializes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number>> = new WorkerLocal<Map<string, number>>(() => {
        let map: Map<string, number> = new Map<string, number>();
        map.set("key", 1);
        return map;
      });
      let customMap: Map<string, number> = new Map<string, number>();
      customMap.set("custom", 99);
      wl.set(customMap);
      wl.delete();
      let result: Map<string, number> = wl.get();
      expect(result.get("key")).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest1500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_1500
     * @tc.desc   Verify WorkerLocal delete() with Set type re-initializes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Set<number>> = new WorkerLocal<Set<number>>(() => {
        let set: Set<number> = new Set<number>();
        set.add(1);
        return set;
      });
      let customSet: Set<number> = new Set<number>();
      customSet.add(99);
      wl.set(customSet);
      wl.delete();
      let result: Set<number> = wl.get();
      expect(result.has(1)).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2400
     * @tc.desc   Verify WorkerLocal delete() - worker thread delete does not affect main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlDel_2400 = new WorkerLocal<string>(() => "init");
      wlDel_2400.set("mainValue");
      let task: taskpool.Task = new taskpool.Task(deleteWorkerTask2400);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("init");
      expect(wlDel_2400.get()).assertEqual("mainValue");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2500
     * @tc.desc   Verify WorkerLocal delete() - main thread delete does not affect worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlDel_2500 = new WorkerLocal<string>(() => "init");
      wlDel_2500.set("mainValue");
      wlDel_2500.delete();
      let task: taskpool.Task = new taskpool.Task(deleteWorkerTask2500);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2600
     * @tc.desc   Verify WorkerLocal delete() - multiple worker threads delete independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlDel_2600 = new WorkerLocal<string>(() => "init");
      let p1 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let p2 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let p3 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2700
     * @tc.desc   Verify WorkerLocal delete() - main thread delete then get triggers re-init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "re_init_main");
      wl.set("custom");
      wl.delete();
      expect(wl.get()).assertEqual("re_init_main");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2800
     * @tc.desc   Verify WorkerLocal delete() - delete then re-init in worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalDeleteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlDel_2800 = new WorkerLocal<string>(() => "re_init");
      let task: taskpool.Task = new taskpool.Task(deleteWorkerTask2800);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("re_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest2900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_2900
     * @tc.desc   Verify WorkerLocal delete() with Int32Array type re-initializes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Int32Array> = new WorkerLocal<Int32Array>(() => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        return arr;
      });
      let customArr: Int32Array = new Int32Array([10, 20, 30]);
      wl.set(customArr);
      wl.delete();
      let result: Int32Array = wl.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3000
     * @tc.desc   Verify WorkerLocal delete() AsyncLock protected concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      let lock: AsyncLock = new AsyncLock();
      wl.set(100);
      await lock.lockAsync(() => {
        wl.delete();
        expect(wl.get()).assertEqual(0);
      });
      expect(wl.get()).assertEqual(0);
      await lock.lockAsync(() => {
        wl.set(200);
        expect(wl.get()).assertEqual(200);
        wl.delete();
        expect(wl.get()).assertEqual(0);
      });
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3100
     * @tc.desc   Verify WorkerLocal delete() concurrent competition with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init_3100");
      wl.set("main_3100");
      wlDel_2600 = new WorkerLocal<string>(() => "init_3100");
      let p1 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let p2 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let p3 = taskpool.execute(new taskpool.Task(deleteWorkerTask2600));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wl.get()).assertEqual("main_3100");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3200
     * @tc.desc   Verify WorkerLocal delete() stress test 1000 loop set-delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      for (let i: number = 0; i < 1000; i++) {
        wl.set("value" + i.toString());
        wl.delete();
      }
      expect(wl.get()).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3300
     * @tc.desc   Verify WorkerLocal delete() value persists across async await boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "async_init");
      wl.set("async_value");
      expect(wl.get()).assertEqual("async_value");
      wl.delete();
      expect(wl.get()).assertEqual("async_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3400
     * @tc.desc   Verify WorkerLocal delete-set-delete-set chain sequence with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(1);
      expect(wl.get()).assertEqual(1);
      wl.delete();
      expect(wl.get()).assertEqual(0);
      wl.set(2);
      expect(wl.get()).assertEqual(2);
      wl.delete();
      expect(wl.get()).assertEqual(0);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3500
     * @tc.desc   Verify WorkerLocal delete() without init error is Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(100);
      wl.delete();
      let caught: boolean = false;
      try {
        wl.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3600
     * @tc.desc   Verify WorkerLocal delete() with object type re-initializes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let initCount: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        initCount++;
        return "obj_init_" + initCount.toString();
      });
      let v1: string = wl.get();
      expect(v1).assertEqual("obj_init_1");
      wl.set("modified");
      wl.delete();
      let v2: string = wl.get();
      expect(v2).assertEqual("obj_init_2");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3700
     * @tc.desc   Verify WorkerLocal delete() typeof check for number string boolean return types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wlNum: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
      wlNum.set(100);
      wlNum.delete();
      expect(typeof wlNum.get()).assertEqual("number");
      let wlStr: WorkerLocal<string> = new WorkerLocal<string>(() => "hello");
      wlStr.set("world");
      wlStr.delete();
      expect(typeof wlStr.get()).assertEqual("string");
      let wlBool: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      wlBool.set(false);
      wlBool.delete();
      expect(typeof wlBool.get()).assertEqual("boolean");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3800
     * @tc.desc   Verify WorkerLocal delete() AtomicBoolean state control after delete+get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let flag: AtomicBoolean = new AtomicBoolean(false);
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => {
        flag.store(true);
        return 0;
      });
      expect(wl.get()).assertEqual(0);
      expect(flag.load()).assertTrue();
      flag.store(false);
      wl.set(100);
      wl.delete();
      expect(wl.get()).assertEqual(0);
      expect(flag.load()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest3900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_3900
     * @tc.desc   Verify WorkerLocal delete() in EAWorker.run returns init after delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_3900 = new WorkerLocal<string>(() => "ea_init");
      let eaWorker: EAWorker = new EAWorker("del_ea_3900");
      eaWorker.start();
      let result: string = await eaWorker.run<string>(deleteEAWorkerTask3900);
      expect(result).assertEqual("ea_init");
      await eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4000
     * @tc.desc   Verify WorkerLocal multiple delete() in EAWorker.run is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_4000 = new WorkerLocal<string>(() => "ea_init");
      let eaWorker: EAWorker = new EAWorker("del_ea_4000");
      eaWorker.start();
      let result: string = await eaWorker.run<string>(deleteEAWorkerTask4000);
      expect(result).assertEqual("ea_init");
      await eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4100
     * @tc.desc   Verify WorkerLocal loop set-delete in EAWorker.run returns init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_4100 = new WorkerLocal<string>(() => "ea_init");
      let eaWorker: EAWorker = new EAWorker("del_ea_4100");
      eaWorker.start();
      let result: string = await eaWorker.run<string>(deleteEAWorkerTask4100);
      expect(result).assertEqual("ea_init");
      await eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4200
     * @tc.desc   Verify WorkerLocal delete-then-reset in EAWorker.run returns last set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_4200 = new WorkerLocal<string>(() => "ea_init");
      let eaWorker: EAWorker = new EAWorker("del_ea_4200");
      eaWorker.start();
      let result: string = await eaWorker.run<string>(deleteEAWorkerTask4200);
      expect(result).assertEqual("ea_v3");
      await eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4300
     * @tc.desc   Verify WorkerLocal delete in EAWorker does not affect main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_4300 = new WorkerLocal<string>(() => "ea_main_init");
      wlDel_4300.set("main_value");
      let eaWorker: EAWorker = new EAWorker("del_ea_4300");
      eaWorker.start();
      let result: string = await eaWorker.run<string>(deleteEAWorkerTask4300);
      expect(result).assertEqual("ea_main_init");
      expect(wlDel_4300.get()).assertEqual("main_value");
      await eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4400
     * @tc.desc   Verify WorkerLocal delete in multiple EAWorkers is thread-independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalDeleteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlDel_4400 = new WorkerLocal<string>(() => "ea_shared_init");
      wlDel_4400.set("main_val");
      let ea1: EAWorker = new EAWorker("del_ea_4400_1");
      let ea2: EAWorker = new EAWorker("del_ea_4400_2");
      let ea3: EAWorker = new EAWorker("del_ea_4400_3");
      ea1.start();
      ea2.start();
      ea3.start();
      let p1 = ea1.run<string>(deleteEAWorkerTask4400);
      let p2 = ea2.run<string>(deleteEAWorkerTask4400);
      let p3 = ea3.run<string>(deleteEAWorkerTask4400);
      let results: string[] = await Promise.all([p1, p2, p3]);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual("ea_shared_init");
      expect(results[1]).assertEqual("ea_shared_init");
      expect(results[2]).assertEqual("ea_shared_init");
      expect(wlDel_4400.get()).assertEqual("main_val");
      await ea1.join();
      await ea2.join();
      await ea3.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalDeleteTest4500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_DELETE_TEST_4500
     * @tc.desc   Verify WorkerLocal delete() clears large data and re-initializes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalDeleteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let largeParts: string[] = [];
      for (let i: number = 0; i < 10000; i++) {
        largeParts.push("x");
      }
      let largeData: string = largeParts.join("");
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => largeData);
      wl.set("small");
      wl.delete();
      let result: string = wl.get();
      expect(result.length).assertEqual(10000);
    })
  })
}
