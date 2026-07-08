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

class MyClass {
  value: number = 10;
}

class UserInfo {
  name: string = "";
  age: number = 0;
}

let wlGet_2500: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function getWorkerTask2500(): string {
  wlGet_2500.set("worker_value");
  return wlGet_2500.get();
}

let wlGet_2600: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
function getWorkerTask2600(value: number): number {
  wlGet_2600.set(value);
  return wlGet_2600.get();
}

let initCountGet2700: AtomicInt = new AtomicInt(0);
let wlGet_2700: WorkerLocal<number> = new WorkerLocal<number>(() => {
  initCountGet2700.fetchAdd(1);
  return initCountGet2700.load();
});
function getWorkerTask2700(): number {
  return wlGet_2700.get();
}

let wlGet_2900: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function getWorkerTask2900(): boolean {
  let v1: string = wlGet_2900.get();
  wlGet_2900.set("modified");
  let v2: string = wlGet_2900.get();
  return v1 === "init" && v2 === "modified";
}

let wlGet_3400: WorkerLocal<string> = new WorkerLocal<string>(() => "init_3400");
let counterGet_3400: AtomicInt = new AtomicInt(0);
function getWorkerTask3400(): string {
  wlGet_3400.set("worker_3400");
  counterGet_3400.fetchAdd(1);
  return wlGet_3400.get();
}

let wlGet_2800: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function getWorkerTask2800(): string {
  return wlGet_2800.get();
}

let wlGet_4000: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
function getEAWorkerTask4000(): number {
  return wlGet_4000.get();
}

let wlGet_4100: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function getEAWorkerTask4100(): string {
  wlGet_4100.set("ea_modified");
  return wlGet_4100.get();
}

let wlGet_4200: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function getEAWorkerTask4200(): string {
  wlGet_4200.set("ea_outer");
  let v1: string = wlGet_4200.get();
  wlGet_4200.set("ea_inner");
  let v2: string = wlGet_4200.get();
  return v1 + "|" + v2;
}

export default function BuiltinsWorkerLocalGetTest(): void {
  describe('BuiltinsWorkerLocalGetTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      Utils.syncSleep(50);
    })
    afterAll(async (): Promise<void> => { await Utils.msSleep(100) })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0100
     * @tc.desc   Verify WorkerLocal get() with init function returns init value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init_value");
      let value: string = wl.get();
      expect(value).assertEqual("init_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0200
     * @tc.desc   Verify WorkerLocal get() after set returns set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(100);
      let value: number = wl.get();
      expect(value).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0300
     * @tc.desc   Verify WorkerLocal get() after multiple set returns latest value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(1);
      wl.set(2);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0400
     * @tc.desc   Verify WorkerLocal get() with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
      let value: number = wl.get();
      expect(value).assertEqual(42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0500
     * @tc.desc   Verify WorkerLocal get() with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "hello");
      let value: string = wl.get();
      expect(value).assertEqual("hello");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0600
     * @tc.desc   Verify WorkerLocal get() with boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      expect(wl.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0700
     * @tc.desc   Verify WorkerLocal get() with object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<UserInfo> = new WorkerLocal<UserInfo>(() => {
        let info: UserInfo = new UserInfo();
        info.name = "test";
        info.age = 18;
        return info;
      });
      let value: UserInfo = wl.get();
      expect(value.name).assertEqual("test");
      expect(value.age).assertEqual(18);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0800
     * @tc.desc   Verify WorkerLocal get() with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>(() => {
        let arr: number[] = [1, 2, 3];
        return arr;
      });
      let value: number[] = wl.get();
      expect(value.length).assertEqual(3);
      expect(value[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest0900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_0900
     * @tc.desc   Verify WorkerLocal get() with Map type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number>> = new WorkerLocal<Map<string, number>>(() => {
        let map: Map<string, number> = new Map<string, number>();
        map.set("key1", 1);
        return map;
      });
      let value: Map<string, number> = wl.get();
      expect(value.get("key1")).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1000
     * @tc.desc   Verify WorkerLocal get() with custom class type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<MyClass> = new WorkerLocal<MyClass>(() => new MyClass());
      let value: MyClass = wl.get();
      expect(value.value).assertEqual(10);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1100
     * @tc.desc   Verify WorkerLocal get() with null return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string | null> = new WorkerLocal<string | null>(() => null);
      expect(wl.get()).assertEqual(null);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1200
     * @tc.desc   Verify WorkerLocal get() with undefined return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string | undefined> = new WorkerLocal<string | undefined>(() => undefined);
      expect(wl.get()).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1300
     * @tc.desc   Verify WorkerLocal get() without init throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
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
     * @tc.name   BuiltinsWorkerLocalGetTest1400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1400
     * @tc.desc   Verify WorkerLocal get() after delete without init throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
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
     * @tc.name   BuiltinsWorkerLocalGetTest1500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1500
     * @tc.desc   Verify WorkerLocal get() after delete with init returns init value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.set("modified");
      wl.delete();
      let value: string = wl.get();
      expect(value).assertEqual("init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1600
     * @tc.desc   Verify WorkerLocal get() after delete then set returns new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(100);
      wl.delete();
      wl.set(200);
      expect(wl.get()).assertEqual(200);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1700
     * @tc.desc   Verify WorkerLocal get() error is Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
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
     * @tc.name   BuiltinsWorkerLocalGetTest1800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1800
     * @tc.desc   Verify WorkerLocal get() with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "");
      expect(wl.get()).assertEqual("");
      expect(wl.get().length).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest1900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_1900
     * @tc.desc   Verify WorkerLocal get() with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>(() => {
        let arr: number[] = [];
        return arr;
      });
      expect(wl.get().length).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2000
     * @tc.desc   Verify WorkerLocal get() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2100
     * @tc.desc   Verify WorkerLocal get() with false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => false);
      expect(wl.get()).assertFalse();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2200
     * @tc.desc   Verify WorkerLocal get() with number type and init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
      expect(wl.get()).assertEqual(42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2300
     * @tc.desc   Verify WorkerLocal get() multiple calls return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      let v1: string = wl.get();
      let v2: string = wl.get();
      let v3: string = wl.get();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2400
     * @tc.desc   Verify WorkerLocal get() with Set type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Set<number>> = new WorkerLocal<Set<number>>(() => {
        let set: Set<number> = new Set<number>();
        set.add(1);
        set.add(2);
        set.add(3);
        return set;
      });
      let value: Set<number> = wl.get();
      expect(value.size).assertEqual(3);
      expect(value.has(1)).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2500
     * @tc.desc   Verify WorkerLocal get() - main thread and worker thread independent values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlGet_2500 = new WorkerLocal<string>(() => "init");
      wlGet_2500.set("main_value");
      expect(wlGet_2500.get()).assertEqual("main_value");
      let task: taskpool.Task = new taskpool.Task(getWorkerTask2500);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_value");
      expect(wlGet_2500.get()).assertEqual("main_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2600
     * @tc.desc   Verify WorkerLocal get() - multiple worker threads independent get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlGet_2600 = new WorkerLocal<number>(() => 0);
      let p1 = taskpool.execute(new taskpool.Task(getWorkerTask2600, 1.0));
      let p2 = taskpool.execute(new taskpool.Task(getWorkerTask2600, 2.0));
      let p3 = taskpool.execute(new taskpool.Task(getWorkerTask2600, 3.0));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2700
     * @tc.desc   Verify WorkerLocal get() - worker thread init function independent trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      initCountGet2700 = new AtomicInt(0);
      wlGet_2700 = new WorkerLocal<number>(() => {
        initCountGet2700.fetchAdd(1);
        return initCountGet2700.load();
      });
      let mainValue: number = wlGet_2700.get();
      expect(mainValue).assertEqual(1);
      let task: taskpool.Task = new taskpool.Task(getWorkerTask2700);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2800
     * @tc.desc   Verify WorkerLocal get() - main thread get does not affect worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlGet_2800 = new WorkerLocal<string>(() => "init");
      wlGet_2800.set("main_value");
      expect(wlGet_2800.get()).assertEqual("main_value");
      let task: taskpool.Task = new taskpool.Task(getWorkerTask2800);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("init");
      expect(wlGet_2800.get()).assertEqual("main_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest2900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_2900
     * @tc.desc   Verify WorkerLocal get() - multiple get calls in same thread return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      wlGet_2900 = new WorkerLocal<string>(() => "init");
      let task: taskpool.Task = new taskpool.Task(getWorkerTask2900);
      let result: boolean = await taskpool.execute(task) as boolean;
      expect(result).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3000
     * @tc.desc   Verify WorkerLocal get() with number boundary values MAX_VALUE and MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>(() => Number.MAX_VALUE);
      expect(wl1.get()).assertEqual(Number.MAX_VALUE);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>(() => Number.MIN_VALUE);
      expect(wl2.get()).assertEqual(Number.MIN_VALUE);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3100
     * @tc.desc   Verify WorkerLocal get() with Int32Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Int32Array> = new WorkerLocal<Int32Array>(() => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        return arr;
      });
      let result: Int32Array = wl.get();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3200
     * @tc.desc   Verify WorkerLocal get() AsyncLock protected concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalGetTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      let lock: AsyncLock = new AsyncLock();
      wl.set(0);
      await lock.lockAsync(() => {
        wl.set(100);
        expect(wl.get()).assertEqual(100);
      });
      expect(wl.get()).assertEqual(100);
      await lock.lockAsync(() => {
        wl.set(200);
        expect(wl.get()).assertEqual(200);
      });
      expect(wl.get()).assertEqual(200);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3300
     * @tc.desc   Verify WorkerLocal get() chain combination set-get-delete-get sequence with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(1);
      expect(wl.get()).assertEqual(1);
      wl.set(2);
      expect(wl.get()).assertEqual(2);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
      wl.delete();
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3400
     * @tc.desc   Verify WorkerLocal get() concurrent competition with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalGetTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlGet_3400 = new WorkerLocal<string>(() => "init_3400");
      wlGet_3400.set("main_3400");
      counterGet_3400 = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(getWorkerTask3400));
      let p2 = taskpool.execute(new taskpool.Task(getWorkerTask3400));
      let p3 = taskpool.execute(new taskpool.Task(getWorkerTask3400));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wlGet_3400.get()).assertEqual("main_3400");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3500
     * @tc.desc   Verify WorkerLocal get() stress test with 100 loop set+get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalGetTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      for (let i: number = 0; i < 100; i++) {
        wl.set(i);
        expect(wl.get()).assertEqual(i);
      }
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3600
     * @tc.desc   Verify WorkerLocal get() value persists across async await boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "async_init");
      wl.set("async_value");
      expect(wl.get()).assertEqual("async_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3700
     * @tc.desc   Verify WorkerLocal get() with special number values Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>(() => Infinity);
      expect(wl1.get()).assertEqual(Infinity);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>(() => -Infinity);
      expect(wl2.get()).assertEqual(-Infinity);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3800
     * @tc.desc   Verify WorkerLocal get() typeof check for number string and boolean return types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wlNum: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
      expect(typeof wlNum.get()).assertEqual("number");
      let wlStr: WorkerLocal<string> = new WorkerLocal<string>(() => "hello");
      expect(typeof wlStr.get()).assertEqual("string");
      let wlBool: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      expect(typeof wlBool.get()).assertEqual("boolean");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest3900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_3900
     * @tc.desc   Verify WorkerLocal get() with empty object Record<string, number> type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Record<string, number>> = new WorkerLocal<Record<string, number>>(() => {
        let obj: Record<string, number> = {};
        return obj;
      });
      let value: Record<string, number> = wl.get();
      expect(value["test_key"]).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest4000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_4000
     * @tc.desc   Verify WorkerLocal get() in EAWorker.run returns independent init value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      wlGet_4000 = new WorkerLocal<number>(() => 0);
      wlGet_4000.set(100);
      expect(wlGet_4000.get()).assertEqual(100);
      let eaWorker: EAWorker = new EAWorker("get_4000");
      eaWorker.start();
      let result: number = eaWorker.run<number>(getEAWorkerTask4000).Await();
      expect(result).assertEqual(0);
      expect(wlGet_4000.get()).assertEqual(100);
      eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest4100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_4100
     * @tc.desc   Verify WorkerLocal get() - EAWorker.run set then get thread isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalGetTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      wlGet_4100 = new WorkerLocal<string>(() => "ea_init");
      wlGet_4100.set("main_value");
      expect(wlGet_4100.get()).assertEqual("main_value");
      let eaWorker: EAWorker = new EAWorker("get_4100");
      eaWorker.start();
      let result: string = eaWorker.run<string>(getEAWorkerTask4100).Await();
      expect(result).assertEqual("ea_modified");
      expect(wlGet_4100.get()).assertEqual("main_value");
      eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalGetTest4200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_GET_TEST_4200
     * @tc.desc   Verify WorkerLocal get() - EAWorker.run nested sequential get consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalGetTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      wlGet_4200 = new WorkerLocal<string>(() => "init");
      let eaWorker: EAWorker = new EAWorker("get_4200");
      eaWorker.start();
      let result: string = eaWorker.run<string>(getEAWorkerTask4200).Await();
      expect(result).assertEqual("ea_outer|ea_inner");
      eaWorker.join();
    })
  })
}
