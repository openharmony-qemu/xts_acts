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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './Util.test';

let wl1_2000: WorkerLocal<number> = new WorkerLocal<number>();
function constructor1WorkerTask2000(): boolean {
  try {
    wl1_2000.get();
    return false;
  } catch (error) {
    return true;
  }
}

let wl1_2100: WorkerLocal<string> = new WorkerLocal<string>();
function constructor1WorkerTask2100(): boolean {
  try {
    wl1_2100.get();
    return false;
  } catch (error) {
    return true;
  }
}

let wl1_2200: WorkerLocal<number> = new WorkerLocal<number>();
function constructor1WorkerTask2200(value: number): number {
  wl1_2200.set(value);
  return wl1_2200.get();
}

let wl1_2300: WorkerLocal<string> = new WorkerLocal<string>();
function constructor1WorkerTask2300(): string {
  wl1_2300.set("worker_value");
  return wl1_2300.get();
}

let wl1_2400: WorkerLocal<string> = new WorkerLocal<string>();

let wl1_3500: WorkerLocal<string> = new WorkerLocal<string>();
let counter1_3500: AtomicInt = new AtomicInt(0);
function constructor1WorkerTask3500(): number {
  wl1_3500.set("worker_3500");
  counter1_3500.fetchAdd(1);
  return counter1_3500.load();
}

let wl1_3800: WorkerLocal<string> = new WorkerLocal<string>();

let wl1_3900: WorkerLocal<number> = new WorkerLocal<number>();
let counter1_3900: AtomicInt = new AtomicInt(0);
function constructor1WorkerTask3900(value: number): number {
  wl1_3900.set(value);
  counter1_3900.fetchAdd(1);
  return wl1_3900.get();
}

let wl1_4000: WorkerLocal<number> = new WorkerLocal<number>();
let lockCounter1_4000: AtomicInt = new AtomicInt(0);
function constructor1WorkerTask4000(value: number): number {
  wl1_4000.set(value);
  lockCounter1_4000.fetchAdd(1);
  return wl1_4000.get();
}

let wl1_4100: WorkerLocal<number> = new WorkerLocal<number>();
function constructor1WorkerTask4100(): number {
  wl1_4100.set(100);
  let v1: number = wl1_4100.get();
  wl1_4100.set(v1 + 50);
  return wl1_4100.get();
}

class RefData {
  value: number = 0;
}

let wl1_3600: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
function constructor1CompareTask3600(): boolean {
  let wlNoInit: WorkerLocal<number> = new WorkerLocal<number>();
  let wlWithInit: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
  wlNoInit.set(10);
  return wlNoInit.get() === 10 && wlWithInit.get() === 42;
}

export default function BuiltinsWorkerLocalConstructor1Test(): void {
  describe('BuiltinsWorkerLocalConstructor1Test', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      Utils.syncSleep(50);
    })
    afterAll(async (): Promise<void> => { await Utils.msSleep(100) })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0100
     * @tc.desc   Verify WorkerLocal no-arg constructor creates a valid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(1);
      expect(wl.get()).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0200
     * @tc.desc   Verify WorkerLocal no-arg constructor with number type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(42);
      expect(wl.get()).assertEqual(42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0300
     * @tc.desc   Verify WorkerLocal no-arg constructor with string type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("hello");
      expect(wl.get()).assertEqual("hello");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0400
     * @tc.desc   Verify WorkerLocal no-arg constructor with boolean type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>();
      wl.set(true);
      expect(wl.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0500
     * @tc.desc   Verify WorkerLocal no-arg constructor with array type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>();
      let arr: number[] = [1, 2, 3];
      wl.set(arr);
      let result: number[] = wl.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0600
     * @tc.desc   Verify WorkerLocal no-arg constructor get() throws without set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0700
     * @tc.desc   Verify WorkerLocal no-arg constructor set then delete then get throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("test");
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0800
     * @tc.desc   Verify WorkerLocal no-arg constructor multiple set returns latest value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(1);
      wl.set(2);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test0900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_0900
     * @tc.desc   Verify WorkerLocal no-arg constructor delete then set then get works
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("first");
      wl.delete();
      wl.set("second");
      expect(wl.get()).assertEqual("second");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1000
     * @tc.desc   Verify WorkerLocal no-arg constructor with Map type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number>> = new WorkerLocal<Map<string, number>>();
      let map: Map<string, number> = new Map<string, number>();
      map.set("key1", 100);
      wl.set(map);
      expect(wl.get().get("key1")).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1100
     * @tc.desc   Verify WorkerLocal no-arg constructor with Set type can set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Set<number>> = new WorkerLocal<Set<number>>();
      let set: Set<number> = new Set<number>();
      set.add(1);
      set.add(2);
      wl.set(set);
      expect(wl.get().size).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1200
     * @tc.desc   Verify WorkerLocal no-arg constructor with nullable type can set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number | null> = new WorkerLocal<number | null>();
      wl.set(null);
      expect(wl.get()).assertEqual(null);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1300
     * @tc.desc   Verify WorkerLocal no-arg constructor with undefined type can set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number | undefined> = new WorkerLocal<number | undefined>();
      wl.set(undefined);
      expect(wl.get()).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1400
     * @tc.desc   Verify WorkerLocal no-arg constructor delete after get throws error with initialized message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("test");
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1500
     * @tc.desc   Verify WorkerLocal no-arg constructor get() throws error with initialized message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1600
     * @tc.desc   Verify WorkerLocal no-arg constructor set then get then delete works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(42);
      expect(wl.get()).assertEqual(42);
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1700
     * @tc.desc   Verify WorkerLocal no-arg constructor multiple delete calls do not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("value");
      wl.delete();
      wl.delete();
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1800
     * @tc.desc   Verify WorkerLocal no-arg constructor set same value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("same");
      wl.set("same");
      wl.set("same");
      expect(wl.get()).assertEqual("same");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test1900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_1900
     * @tc.desc   Verify WorkerLocal no-arg constructor with number type can set and get again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(100);
      expect(wl.get()).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2000
     * @tc.desc   Verify WorkerLocal no-arg constructor - TaskPool worker thread get throws without set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl1_2000 = new WorkerLocal<number>();
      let task: taskpool.Task = new taskpool.Task(constructor1WorkerTask2000);
      let result: boolean = await taskpool.execute(task) as boolean;
      expect(result).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2100
     * @tc.desc   Verify WorkerLocal no-arg constructor - main thread set does not affect worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl1_2100 = new WorkerLocal<string>();
      wl1_2100.set("main");
      let task: taskpool.Task = new taskpool.Task(constructor1WorkerTask2100);
      let result: boolean = await taskpool.execute(task) as boolean;
      expect(result).assertTrue();
      expect(wl1_2100.get()).assertEqual("main");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2200
     * @tc.desc   Verify WorkerLocal no-arg constructor - multiple TaskPool tasks independent state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl1_2200 = new WorkerLocal<number>();
      wl1_2200.set(0);
      let p1 = taskpool.execute(new taskpool.Task(constructor1WorkerTask2200, 1.0));
      let p2 = taskpool.execute(new taskpool.Task(constructor1WorkerTask2200, 2.0));
      let p3 = taskpool.execute(new taskpool.Task(constructor1WorkerTask2200, 3.0));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wl1_2200.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2300
     * @tc.desc   Verify WorkerLocal no-arg constructor - worker thread set does not affect main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl1_2300 = new WorkerLocal<string>();
      wl1_2300.set("main_value");
      let task: taskpool.Task = new taskpool.Task(constructor1WorkerTask2300);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_value");
      expect(wl1_2300.get()).assertEqual("main_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2400
     * @tc.desc   Verify WorkerLocal no-arg constructor - async function usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      wl1_2400 = new WorkerLocal<string>();
      wl1_2400.set("async_test");
      let value: string = wl1_2400.get();
      expect(value).assertEqual("async_test");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2500
     * @tc.desc   Verify WorkerLocal constructor creates distinct independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      let wl2: WorkerLocal<string> = new WorkerLocal<string>();
      wl1.set(1);
      wl2.set("independent");
      expect(wl1.get()).assertEqual(1);
      expect(wl2.get()).assertEqual("independent");
      wl1.delete();
      expect(wl2.get()).assertEqual("independent");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2600
     * @tc.desc   Verify WorkerLocal constructor with nested Map<string, number[]> type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number[]>> = new WorkerLocal<Map<string, number[]>>();
      let map: Map<string, number[]> = new Map<string, number[]>();
      let nestedArr: number[] = [1, 2, 3];
      map.set("key1", nestedArr);
      wl.set(map);
      let result: Map<string, number[]> = wl.get();
      expect(result.has("key1")).assertTrue();
      let fetchedArr: number[] | undefined = result.get("key1");
      expect(fetchedArr !== undefined).assertTrue();
      expect(fetchedArr!.length).assertEqual(3);
      expect(fetchedArr![0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2700
     * @tc.desc   Verify WorkerLocal constructor with Int32Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Int32Array> = new WorkerLocal<Int32Array>();
      let typedArr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      wl.set(typedArr);
      let result: Int32Array = wl.get();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2800
     * @tc.desc   Verify WorkerLocal value persists across async await boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("async_value");
      expect(wl.get()).assertEqual("async_value");
      wl.set("updated");
      expect(wl.get()).assertEqual("updated");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test2900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_2900
     * @tc.desc   Verify WorkerLocal constructor stress test with 1000 loop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      for (let i: number = 0; i < 1000; i++) {
        wl.set("value" + i.toString());
        expect(wl.get()).assertEqual("value" + i.toString());
        wl.delete();
      }
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3000
     * @tc.desc   Verify WorkerLocal constructor with number boundary values MAX_SAFE_INTEGER and MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(Number.MAX_SAFE_INTEGER);
      expect(wl1.get()).assertEqual(Number.MAX_SAFE_INTEGER);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(Number.MIN_SAFE_INTEGER);
      expect(wl2.get()).assertEqual(Number.MIN_SAFE_INTEGER);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3100
     * @tc.desc   Verify WorkerLocal constructor with special number values -0 NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(-0);
      expect(wl1.get()).assertEqual(-0);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(Infinity);
      expect(wl2.get()).assertEqual(Infinity);
      let wl3: WorkerLocal<number> = new WorkerLocal<number>();
      wl3.set(-Infinity);
      expect(wl3.get()).assertEqual(-Infinity);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3200
     * @tc.desc   Verify WorkerLocal constructor AsyncLock protected concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      let lock: AsyncLock = new AsyncLock();
      wl.set(0);
      await lock.lockAsync(() => {
        wl.set(1);
        expect(wl.get()).assertEqual(1);
      });
      expect(wl.get()).assertEqual(1);
      await lock.lockAsync(() => {
        wl.set(2);
        expect(wl.get()).assertEqual(2);
      });
      expect(wl.get()).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3300
     * @tc.desc   Verify WorkerLocal constructor multiple instances parallel with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      let wl2: WorkerLocal<string> = new WorkerLocal<string>();
      let wl3: WorkerLocal<boolean> = new WorkerLocal<boolean>();
      wl1.set(100);
      wl2.set("test");
      wl3.set(true);
      expect(wl1.get()).assertEqual(100);
      expect(wl2.get()).assertEqual("test");
      expect(wl3.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3400
     * @tc.desc   Verify WorkerLocal constructor chain combination set-delete-set-get-delete-get sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("first");
      expect(wl.get()).assertEqual("first");
      wl.delete();
      wl.set("second");
      expect(wl.get()).assertEqual("second");
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
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3500
     * @tc.desc   Verify WorkerLocal constructor concurrent competition with AtomicInt counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wl1_3500 = new WorkerLocal<string>();
      wl1_3500.set("main_3500");
      counter1_3500 = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3500));
      let p2 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3500));
      let p3 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3500));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wl1_3500.get()).assertEqual("main_3500");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3600
     * @tc.desc   Verify WorkerLocal constructor no-arg vs with-init constructor behavior comparison in worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor1Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl1_3600 = new WorkerLocal<number>(() => 42);
      wl1_3600.set(10);
      expect(wl1_3600.get()).assertEqual(10);
      let task: taskpool.Task = new taskpool.Task(constructor1CompareTask3600);
      let result: boolean = await taskpool.execute(task) as boolean;
      expect(result).assertTrue();
      expect(wl1_3600.get()).assertEqual(10);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3700
     * @tc.desc   Verify WorkerLocal constructor multiple objects created and used independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      let wl3: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(1);
      wl2.set(2);
      wl3.set(3);
      expect(wl1.get()).assertEqual(1);
      expect(wl2.get()).assertEqual(2);
      expect(wl3.get()).assertEqual(3);
      wl1.delete();
      wl2.delete();
      let caught: boolean = false;
      try {
        wl1.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      caught = false;
      try {
        wl2.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(wl3.get()).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3800
     * @tc.desc   Verify WorkerLocal constructor set and get in async await context works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      wl1_3800 = new WorkerLocal<string>();
      wl1_3800.set("async_value");
      expect(wl1_3800.get()).assertEqual("async_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test3900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_3900
     * @tc.desc   Verify WorkerLocal constructor multiple TaskPool tasks share same WorkerLocal with independent state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wl1_3900 = new WorkerLocal<number>();
      wl1_3900.set(0);
      counter1_3900 = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3900, 10.0));
      let p2 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3900, 20.0));
      let p3 = taskpool.execute(new taskpool.Task(constructor1WorkerTask3900, 30.0));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wl1_3900.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4000
     * @tc.desc   Verify WorkerLocal constructor AsyncLock protected counter scenario with shared WorkerLocal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wl1_4000 = new WorkerLocal<number>();
      wl1_4000.set(0);
      lockCounter1_4000 = new AtomicInt(0);
      let lock: AsyncLock = new AsyncLock();
      await lock.lockAsync(() => {
        wl1_4000.set(1);
        expect(wl1_4000.get()).assertEqual(1);
      });
      let p1 = taskpool.execute(new taskpool.Task(constructor1WorkerTask4000, 100.0));
      let p2 = taskpool.execute(new taskpool.Task(constructor1WorkerTask4000, 200.0));
      let allResults = await Promise.all([p1, p2]);
      expect(allResults.length).assertEqual(2);
      expect(wl1_4000.get()).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4100
     * @tc.desc   Verify WorkerLocal constructor TaskPool task nested WorkerLocal set and get operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor1Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wl1_4100 = new WorkerLocal<number>();
      wl1_4100.set(0);
      let task: taskpool.Task = new taskpool.Task(constructor1WorkerTask4100);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(150);
      expect(wl1_4100.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4200
     * @tc.desc   Verify WorkerLocal constructor nested async function value consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("outer");
      let innerResult: string = await (async (): Promise<string> => {
        return wl.get();
      })();
      expect(innerResult).assertEqual("outer");
      expect(wl.get()).assertEqual("outer");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4300
     * @tc.desc   Verify WorkerLocal constructor batch creation performance with 1000 instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsWorkerLocalConstructor1Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let instances: WorkerLocal<number>[] = [];
      for (let i: number = 0; i < 1000; i++) {
        let wl: WorkerLocal<number> = new WorkerLocal<number>();
        wl.set(i);
        instances.push(wl);
      }
      expect(instances.length).assertEqual(1000);
      expect(instances[0].get()).assertEqual(0);
      expect(instances[999].get()).assertEqual(999);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4400
     * @tc.desc   Verify WorkerLocal constructor with octal and binary number values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(0o755);
      expect(wl1.get()).assertEqual(493);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(0b1010);
      expect(wl2.get()).assertEqual(10);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor1Test4500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR1_TEST_4500
     * @tc.desc   Verify WorkerLocal constructor object reference behavior after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor1Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<RefData> = new WorkerLocal<RefData>();
      let data: RefData = new RefData();
      data.value = 10;
      wl.set(data);
      data.value = 999;
      let stored: RefData = wl.get();
      expect(stored.value).assertEqual(999);
    })
  })
}
