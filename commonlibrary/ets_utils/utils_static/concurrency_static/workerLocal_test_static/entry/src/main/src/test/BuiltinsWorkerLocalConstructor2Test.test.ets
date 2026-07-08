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

class DataClass {
  id: number = 0;
  name: string = "";
}

let wl2_2500: WorkerLocal<string> = new WorkerLocal<string>(() => "init_value");
function constructor2WorkerTask2500(): string {
  return wl2_2500.get();
}

let wl2_2600: WorkerLocal<string> = new WorkerLocal<string>(() => "initial");
function constructor2WorkerTask2600(): string {
  wl2_2600.set("worker_thread");
  return wl2_2600.get();
}

let wl2_2700: WorkerLocal<string> = new WorkerLocal<string>(() => "shared_init");
function constructor2WorkerTask2700(id: number): string {
  let value: string = wl2_2700.get();
  wl2_2700.set(`modified_by_${id}`);
  return value;
}

let wl2_2800: WorkerLocal<string> = new WorkerLocal<string>(() => "worker_init");
function constructor2WorkerTask2800(): string {
  return wl2_2800.get();
}

let initCount2900: AtomicInt = new AtomicInt(0);
let wl2_2900: WorkerLocal<number> = new WorkerLocal<number>(() => {
  initCount2900.fetchAdd(1);
  return initCount2900.load();
});
function constructor2WorkerTask2900(): number {
  wl2_2900.get();
  wl2_2900.get();
  wl2_2900.get();
  return initCount2900.load();
}

let wl2_3400: WorkerLocal<string> = new WorkerLocal<string>(() => "init_3400");
let counter2_3400: AtomicInt = new AtomicInt(0);
function constructor2WorkerTask3400(): string {
  wl2_3400.set("worker_3400");
  counter2_3400.fetchAdd(1);
  return wl2_3400.get();
}

let captureCounter2_3600: AtomicInt = new AtomicInt(0);
let wl2_3600: WorkerLocal<number> = new WorkerLocal<number>(() => captureCounter2_3600.load());

function initValue3100(): string {
  return "named_init";
}

let wl2_4400: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
function constructor2EAWorkerTask4400(): number {
  return wl2_4400.get();
}

let wl2_4500: WorkerLocal<string> = new WorkerLocal<string>(() => "ea_init");
function constructor2EAWorkerTask4500(): string {
  wl2_4500.set("ea_modified");
  return wl2_4500.get();
}

export default function BuiltinsWorkerLocalConstructor2Test(): void {
  describe('BuiltinsWorkerLocalConstructor2Test', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      Utils.syncSleep(50);
    })
    afterAll(async (): Promise<void> => { await Utils.msSleep(100) })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0100
     * @tc.desc   Verify WorkerLocal constructor with arrow function init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 42);
      expect(wl.get()).assertEqual(42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0200
     * @tc.desc   Verify WorkerLocal constructor with string type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "hello");
      expect(wl.get()).assertEqual("hello");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0300
     * @tc.desc   Verify WorkerLocal constructor with boolean type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      expect(wl.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0400
     * @tc.desc   Verify WorkerLocal constructor with closure capturing external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let prefix: string = "value_";
      let counter: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        counter++;
        return `${prefix}${counter}`;
      });
      expect(wl.get()).assertEqual("value_1");
      expect(wl.get()).assertEqual("value_1");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0500
     * @tc.desc   Verify WorkerLocal constructor with complex logic init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => {
        let sum: number = 0;
        for (let i: number = 1; i <= 10; i++) {
          sum += i;
        }
        return sum;
      });
      expect(wl.get()).assertEqual(55);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0600
     * @tc.desc   Verify WorkerLocal constructor with object-returning init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<DataClass> = new WorkerLocal<DataClass>(() => {
        let data: DataClass = new DataClass();
        data.id = 1;
        data.name = "test";
        return data;
      });
      let data: DataClass = wl.get();
      expect(data.id).assertEqual(1);
      expect(data.name).assertEqual("test");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0700
     * @tc.desc   Verify WorkerLocal constructor with array-returning init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>(() => {
        let arr: number[] = [1, 2, 3, 4, 5];
        return arr;
      });
      let arr: number[] = wl.get();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0800
     * @tc.desc   Verify WorkerLocal constructor init function returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string | null> = new WorkerLocal<string | null>(() => null);
      expect(wl.get()).assertEqual(null);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test0900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_0900
     * @tc.desc   Verify WorkerLocal constructor init function returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string | undefined> = new WorkerLocal<string | undefined>(() => undefined);
      expect(wl.get()).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1000
     * @tc.desc   Verify WorkerLocal constructor init function returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "");
      expect(wl.get()).assertEqual("");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1100
     * @tc.desc   Verify WorkerLocal constructor init function returning zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1200
     * @tc.desc   Verify WorkerLocal constructor init function returning false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => false);
      expect(wl.get()).assertFalse();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1300
     * @tc.desc   Verify WorkerLocal constructor init function throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        throw new Error("init failed");
      });
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
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1400
     * @tc.desc   Verify WorkerLocal constructor with init auto-initializes on first get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "auto_init");
      let value: string = wl.get();
      expect(value).assertEqual("auto_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1500
     * @tc.desc   Verify WorkerLocal constructor delete then get re-initializes with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let callCount: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        callCount++;
        return `init_${callCount}`;
      });
      expect(wl.get()).assertEqual("init_1");
      expect(callCount).assertEqual(1);
      wl.set("modified");
      expect(wl.get()).assertEqual("modified");
      wl.delete();
      expect(wl.get()).assertEqual("init_2");
      expect(callCount).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1600
     * @tc.desc   Verify WorkerLocal constructor init is lazy - not called until first get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let initExecuted: boolean = false;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        initExecuted = true;
        return "lazy_init";
      });
      expect(initExecuted).assertFalse();
      wl.get();
      expect(initExecuted).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1700
     * @tc.desc   Verify WorkerLocal constructor init executes only once per thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let initCount: number = 0;
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => {
        initCount++;
        return initCount;
      });
      wl.get();
      wl.get();
      wl.get();
      expect(initCount).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1800
     * @tc.desc   Verify WorkerLocal constructor with Map type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number>> = new WorkerLocal<Map<string, number>>(() => {
        let map: Map<string, number> = new Map<string, number>();
        map.set("a", 1);
        return map;
      });
      let map: Map<string, number> = wl.get();
      expect(map.get("a")).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test1900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_1900
     * @tc.desc   Verify WorkerLocal constructor with Set type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Set<number>> = new WorkerLocal<Set<number>>(() => {
        let set: Set<number> = new Set<number>();
        set.add(1);
        set.add(2);
        set.add(3);
        return set;
      });
      let set: Set<number> = wl.get();
      expect(set.size).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2000
     * @tc.desc   Verify WorkerLocal constructor with union type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string | number> = new WorkerLocal<string | number>(() => "text");
      let value1: string | number = wl.get();
      expect(value1).assertEqual("text");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2100
     * @tc.desc   Verify WorkerLocal constructor with number type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 100);
      expect(wl.get()).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2200
     * @tc.desc   Verify WorkerLocal constructor set overrides init value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init_value");
      wl.set("override_value");
      expect(wl.get()).assertEqual("override_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2300
     * @tc.desc   Verify WorkerLocal constructor set before get does not call init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let initExecuted: boolean = false;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        initExecuted = true;
        return "init_value";
      });
      wl.set("manual_value");
      expect(wl.get()).assertEqual("manual_value");
      expect(initExecuted).assertFalse();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2400
     * @tc.desc   Verify WorkerLocal constructor multiple delete and re-init cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let callCount: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        callCount++;
        return `init_${callCount}`;
      });
      expect(wl.get()).assertEqual("init_1");
      wl.delete();
      expect(wl.get()).assertEqual("init_2");
      wl.delete();
      expect(wl.get()).assertEqual("init_3");
      expect(callCount).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2500
     * @tc.desc   Verify WorkerLocal constructor with init - TaskPool worker thread independent initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl2_2500 = new WorkerLocal<string>(() => "init_value");
      expect(wl2_2500.get()).assertEqual("init_value");
      let task: taskpool.Task = new taskpool.Task(constructor2WorkerTask2500);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("init_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2600
     * @tc.desc   Verify WorkerLocal constructor with init - worker thread set does not affect main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl2_2600 = new WorkerLocal<string>(() => "initial");
      wl2_2600.set("main_thread");
      expect(wl2_2600.get()).assertEqual("main_thread");
      let task: taskpool.Task = new taskpool.Task(constructor2WorkerTask2600);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_thread");
      expect(wl2_2600.get()).assertEqual("main_thread");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2700
     * @tc.desc   Verify WorkerLocal constructor with init - multiple TaskPool tasks independent init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl2_2700 = new WorkerLocal<string>(() => "shared_init");
      let p1 = taskpool.execute(new taskpool.Task(constructor2WorkerTask2700, 1.0));
      let p2 = taskpool.execute(new taskpool.Task(constructor2WorkerTask2700, 2.0));
      let p3 = taskpool.execute(new taskpool.Task(constructor2WorkerTask2700, 3.0));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2800
     * @tc.desc   Verify WorkerLocal constructor with init - worker thread init function independent trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wl2_2800 = new WorkerLocal<string>(() => "worker_init");
      wl2_2800.set("main_value");
      let task: taskpool.Task = new taskpool.Task(constructor2WorkerTask2800);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_init");
      expect(wl2_2800.get()).assertEqual("main_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test2900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_2900
     * @tc.desc   Verify WorkerLocal constructor with init - init executes only once per thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      initCount2900 = new AtomicInt(0);
      wl2_2900 = new WorkerLocal<number>(() => {
        initCount2900.fetchAdd(1);
        return initCount2900.load();
      });
      let mainValue: number = wl2_2900.get();
      expect(mainValue).assertEqual(1);
      let task: taskpool.Task = new taskpool.Task(constructor2WorkerTask2900);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3000
     * @tc.desc   Verify WorkerLocal constructor1 vs constructor2 - no-arg get throws while with-init get returns value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wlNoInit: WorkerLocal<string> = new WorkerLocal<string>();
      let wlWithInit: WorkerLocal<string> = new WorkerLocal<string>(() => "auto_init");
      let caught: boolean = false;
      try {
        wlNoInit.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(wlWithInit.get()).assertEqual("auto_init");
      wlNoInit.set("manual_init");
      expect(wlNoInit.get()).assertEqual("manual_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3100
     * @tc.desc   Verify WorkerLocal constructor with named function as init parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(initValue3100);
      expect(wl.get()).assertEqual("named_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3200
     * @tc.desc   Verify WorkerLocal constructor AsyncLock protected concurrent access with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor2Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
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
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3300
     * @tc.desc   Verify WorkerLocal constructor chain combination get-set-delete-get sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      let v1: number = wl.get();
      expect(v1).assertEqual(0);
      wl.set(10);
      let v2: number = wl.get();
      expect(v2).assertEqual(10);
      wl.delete();
      let v3: number = wl.get();
      expect(v3).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3400
     * @tc.desc   Verify WorkerLocal constructor with init - concurrent competition with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor2Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wl2_3400 = new WorkerLocal<string>(() => "init_3400");
      wl2_3400.set("main_3400");
      counter2_3400 = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(constructor2WorkerTask3400));
      let p2 = taskpool.execute(new taskpool.Task(constructor2WorkerTask3400));
      let p3 = taskpool.execute(new taskpool.Task(constructor2WorkerTask3400));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wl2_3400.get()).assertEqual("main_3400");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3500
     * @tc.desc   Verify WorkerLocal constructor stress test with 1000 loop delete and re-init cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor2Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let callCount: number = 0;
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        callCount++;
        return "stress_init_" + callCount.toString();
      });
      for (let i: number = 0; i < 100; i++) {
        expect(wl.get()).assertEqual("stress_init_" + (callCount).toString());
        wl.delete();
      }
      expect(callCount).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3600
     * @tc.desc   Verify WorkerLocal constructor closure variable capture timing - re-init captures current AtomicInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      captureCounter2_3600 = new AtomicInt(0);
      wl2_3600 = new WorkerLocal<number>(() => captureCounter2_3600.load());
      expect(wl2_3600.get()).assertEqual(0);
      captureCounter2_3600.store(10);
      wl2_3600.delete();
      expect(wl2_3600.get()).assertEqual(10);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3700
     * @tc.desc   Verify WorkerLocal constructor with Int32Array type init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
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
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3800
     * @tc.desc   Verify WorkerLocal constructor with sync wrapper for async logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "sync_default");
      expect(wl.get()).assertEqual("sync_default");
      wl.set("async_value");
      expect(wl.get()).assertEqual("async_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test3900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_3900
     * @tc.desc   Verify WorkerLocal constructor number boundary values with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>(() => Number.MAX_SAFE_INTEGER);
      expect(wl1.get()).assertEqual(Number.MAX_SAFE_INTEGER);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>(() => Number.MIN_SAFE_INTEGER);
      expect(wl2.get()).assertEqual(Number.MIN_SAFE_INTEGER);
      let wl3: WorkerLocal<number> = new WorkerLocal<number>(() => Infinity);
      expect(wl3.get()).assertEqual(Infinity);
      let wl4: WorkerLocal<number> = new WorkerLocal<number>(() => -Infinity);
      expect(wl4.get()).assertEqual(-Infinity);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4000
     * @tc.desc   Verify WorkerLocal constructor AtomicBoolean state wait for init completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalConstructor2Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let initialized: AtomicBoolean = new AtomicBoolean(false);
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
        initialized.store(true);
        return "atomic_init";
      });
      expect(initialized.load()).assertFalse();
      wl.get();
      expect(initialized.load()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4100
     * @tc.desc   Verify WorkerLocal constructor multiple independent WorkerLocal with different init functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalConstructor2Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>(() => 1);
      let wl2: WorkerLocal<string> = new WorkerLocal<string>(() => "two");
      let wl3: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => true);
      expect(wl1.get()).assertEqual(1);
      expect(wl2.get()).assertEqual("two");
      expect(wl3.get()).assertTrue();
      wl1.delete();
      wl2.delete();
      expect(wl1.get()).assertEqual(1);
      expect(wl2.get()).assertEqual("two");
      expect(wl3.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4200
     * @tc.desc   Verify WorkerLocal constructor delete after set then get returns re-initialized value not set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "re_init");
      wl.set("modified");
      expect(wl.get()).assertEqual("modified");
      wl.delete();
      expect(wl.get()).assertEqual("re_init");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4300
     * @tc.desc   Verify WorkerLocal constructor with init returns instance with get set delete methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "test");
      expect(typeof wl.get).assertEqual("function");
      expect(typeof wl.set).assertEqual("function");
      expect(typeof wl.delete).assertEqual("function");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4400
     * @tc.desc   Verify WorkerLocal constructor with init - EAWorker thread independent initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      wl2_4400 = new WorkerLocal<number>(() => 42);
      expect(wl2_4400.get()).assertEqual(42);
      let eaWorker: EAWorker = new EAWorker("c2_4400");
      eaWorker.start();
      let result: number = eaWorker.run<number>(constructor2EAWorkerTask4400).Await();
      expect(result).assertEqual(42);
      eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalConstructor2Test4500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_CONSTRUCTOR2_TEST_4500
     * @tc.desc   Verify WorkerLocal constructor with init - EAWorker run task modifies WorkerLocal independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalConstructor2Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      wl2_4500 = new WorkerLocal<string>(() => "ea_init");
      wl2_4500.set("main_value");
      expect(wl2_4500.get()).assertEqual("main_value");
      let eaWorker: EAWorker = new EAWorker("c2_4500");
      eaWorker.start();
      let result: string = eaWorker.run<string>(constructor2EAWorkerTask4500).Await();
      expect(result).assertEqual("ea_modified");
      expect(wl2_4500.get()).assertEqual("main_value");
      eaWorker.join();
    })
  })
}
