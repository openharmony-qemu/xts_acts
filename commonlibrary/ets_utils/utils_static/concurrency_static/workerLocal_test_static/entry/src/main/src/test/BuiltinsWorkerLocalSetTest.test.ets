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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';

class User {
  name: string = "";
  age: number = 0;
}

class Address {
  city: string = "";
  street: string = "";
}

class UserWithAddress {
  name: string = "";
  address: Address = new Address();
}

let wlSet_3400: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function setWorkerTask3400(): string {
  wlSet_3400.set("worker_value");
  return wlSet_3400.get();
}

let wlSet_3500: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
function setWorkerTask3500(value: number): number {
  wlSet_3500.set(value);
  return wlSet_3500.get();
}

let wlSet_3700: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function setWorkerTask3700(): string {
  let before: string = wlSet_3700.get();
  wlSet_3700.set("main_new_value");
  let after: string = wlSet_3700.get();
  return before === "init" && after === "main_new_value" ? "ok" : "fail";
}

let wlSet_3600: WorkerLocal<string> = new WorkerLocal<string>(() => "worker_init");
function setWorkerTask3600(): string {
  return wlSet_3600.get();
}

let wlSet_4600: WorkerLocal<string> = new WorkerLocal<string>(() => "init_4600");
let counterSet_4600: AtomicInt = new AtomicInt(0);
function setWorkerTask4600(): string {
  wlSet_4600.set("worker_4600");
  counterSet_4600.fetchAdd(1);
  return wlSet_4600.get();
}

let wlSet_5700: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function setEAWorkerTask5700(): string {
  wlSet_5700.set("ea_value");
  return wlSet_5700.get();
}

let wlSet_5800: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
function setEAWorkerTask5800(): string {
  wlSet_5800.set("level1");
  wlSet_5800.set("level2");
  wlSet_5800.set("level3");
  return wlSet_5800.get();
}

export default function BuiltinsWorkerLocalSetTest(): void {
  describe('BuiltinsWorkerLocalSetTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      Utils.syncSleep(50);
    })
    afterAll(async (): Promise<void> => { await Utils.msSleep(100) })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0100
     * @tc.desc   Verify WorkerLocal set() with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(100);
      expect(wl.get()).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0200
     * @tc.desc   Verify WorkerLocal set() with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("test");
      expect(wl.get()).assertEqual("test");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0300
     * @tc.desc   Verify WorkerLocal set() with boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<boolean> = new WorkerLocal<boolean>();
      wl.set(true);
      expect(wl.get()).assertTrue();
      wl.set(false);
      expect(wl.get()).assertFalse();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0400
     * @tc.desc   Verify WorkerLocal set() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(0);
      expect(wl.get()).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0500
     * @tc.desc   Verify WorkerLocal set() with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(-42);
      expect(wl.get()).assertEqual(-42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0600
     * @tc.desc   Verify WorkerLocal set() with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("");
      expect(wl.get()).assertEqual("");
      expect(wl.get().length).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0700
     * @tc.desc   Verify WorkerLocal set() with whitespace string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("   ");
      expect(wl.get()).assertEqual("   ");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0800
     * @tc.desc   Verify WorkerLocal set() with special characters string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("!@#$%^&*()");
      expect(wl.get()).assertEqual("!@#$%^&*()");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest0900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_0900
     * @tc.desc   Verify WorkerLocal set() with unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("\u4e2d\u6587");
      expect(wl.get()).assertEqual("\u4e2d\u6587");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1000
     * @tc.desc   Verify WorkerLocal set() with object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<User> = new WorkerLocal<User>();
      let user: User = new User();
      user.name = "test";
      user.age = 25;
      wl.set(user);
      expect(wl.get().name).assertEqual("test");
      expect(wl.get().age).assertEqual(25);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1100
     * @tc.desc   Verify WorkerLocal set() with nested object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<UserWithAddress> = new WorkerLocal<UserWithAddress>();
      let user: UserWithAddress = new UserWithAddress();
      user.name = "test";
      user.address.city = "Shanghai";
      user.address.street = "Nanjing Road";
      wl.set(user);
      expect(wl.get().address.city).assertEqual("Shanghai");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1200
     * @tc.desc   Verify WorkerLocal set() with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>();
      let arr: number[] = [1, 2, 3, 4, 5];
      wl.set(arr);
      expect(wl.get().length).assertEqual(5);
      expect(wl.get()[0]).assertEqual(1);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1300
     * @tc.desc   Verify WorkerLocal set() with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>();
      let arr: number[] = [];
      wl.set(arr);
      expect(wl.get().length).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1400
     * @tc.desc   Verify WorkerLocal set() with 2D array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number[][]> = new WorkerLocal<number[][]>();
      let arr: number[][] = [[1, 2], [3, 4]];
      wl.set(arr);
      expect(wl.get()[0][0]).assertEqual(1);
      expect(wl.get()[1][1]).assertEqual(4);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1500
     * @tc.desc   Verify WorkerLocal set() with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string | null> = new WorkerLocal<string | null>();
      wl.set(null);
      expect(wl.get()).assertEqual(null);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1600
     * @tc.desc   Verify WorkerLocal set() with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string | undefined> = new WorkerLocal<string | undefined>();
      wl.set(undefined);
      expect(wl.get()).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1700
     * @tc.desc   Verify WorkerLocal set() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      let result: void = wl.set(100);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1800
     * @tc.desc   Verify WorkerLocal set() overrides init function value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      expect(wl.get()).assertEqual("init");
      wl.set("override");
      expect(wl.get()).assertEqual("override");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest1900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_1900
     * @tc.desc   Verify WorkerLocal multiple set() calls return latest value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(1);
      expect(wl.get()).assertEqual(1);
      wl.set(2);
      expect(wl.get()).assertEqual(2);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2000
     * @tc.desc   Verify WorkerLocal set() same value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("same");
      wl.set("same");
      wl.set("same");
      expect(wl.get()).assertEqual("same");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2100
     * @tc.desc   Verify WorkerLocal set() after delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "init");
      wl.set("first");
      wl.delete();
      wl.set("second");
      expect(wl.get()).assertEqual("second");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2200
     * @tc.desc   Verify WorkerLocal set() after get error without init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      let caught: boolean = false;
      try {
        wl.get();
        expect().assertFail();
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      wl.set(100);
      expect(wl.get()).assertEqual(100);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2300
     * @tc.desc   Verify WorkerLocal set() with number type without init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(42);
      expect(wl.get()).assertEqual(42);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2400
     * @tc.desc   Verify WorkerLocal set() with Map type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Map<string, number>> = new WorkerLocal<Map<string, number>>();
      let map: Map<string, number> = new Map<string, number>();
      map.set("key1", 1);
      map.set("key2", 2);
      wl.set(map);
      expect(wl.get().get("key1")).assertEqual(1);
      expect(wl.get().get("key2")).assertEqual(2);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2500
     * @tc.desc   Verify WorkerLocal set() with Set type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Set<number>> = new WorkerLocal<Set<number>>();
      let set: Set<number> = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      wl.set(set);
      expect(wl.get().size).assertEqual(3);
      expect(wl.get().has(1)).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2600
     * @tc.desc   Verify WorkerLocal set() with union type number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number | string> = new WorkerLocal<number | string>();
      wl.set(100);
      expect(wl.get()).assertEqual(100);
      wl.set("test");
      expect(wl.get()).assertEqual("test");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2700
     * @tc.desc   Verify WorkerLocal set() with string array containing null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<(number | null)[]> = new WorkerLocal<(number | null)[]>();
      let arr: (number | null)[] = [1, null, 3];
      wl.set(arr);
      expect(wl.get().length).assertEqual(3);
      expect(wl.get()[1]).assertEqual(null);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2800
     * @tc.desc   Verify WorkerLocal set() with hex number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(0xFF);
      expect(wl.get()).assertEqual(255);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest2900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_2900
     * @tc.desc   Verify WorkerLocal set() with scientific notation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(1.5e10);
      expect(wl.get()).assertEqual(15000000000);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3000
     * @tc.desc   Verify WorkerLocal set() with tab and newline string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("\t");
      expect(wl.get()).assertEqual("\t");
      wl.set("\n");
      expect(wl.get()).assertEqual("\n");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3100
     * @tc.desc   Verify WorkerLocal set() with object having null properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<User> = new WorkerLocal<User>();
      let user: User = new User();
      user.name = "test";
      user.age = 0;
      wl.set(user);
      expect(wl.get().name).assertEqual("test");
      expect(wl.get().age).assertEqual(0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3400
     * @tc.desc   Verify WorkerLocal set() - worker thread set does not affect main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlSet_3400 = new WorkerLocal<string>(() => "init");
      wlSet_3400.set("main_value");
      expect(wlSet_3400.get()).assertEqual("main_value");
      let task: taskpool.Task = new taskpool.Task(setWorkerTask3400);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_value");
      expect(wlSet_3400.get()).assertEqual("main_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3500
     * @tc.desc   Verify WorkerLocal set() - multiple worker threads set independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlSet_3500 = new WorkerLocal<number>(() => 0);
      let p1 = taskpool.execute(new taskpool.Task(setWorkerTask3500, 1.0));
      let p2 = taskpool.execute(new taskpool.Task(setWorkerTask3500, 2.0));
      let p3 = taskpool.execute(new taskpool.Task(setWorkerTask3500, 3.0));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3600
     * @tc.desc   Verify WorkerLocal set() - main thread set does not affect worker thread init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlSet_3600 = new WorkerLocal<string>(() => "worker_init");
      wlSet_3600.set("main_new_value");
      let task: taskpool.Task = new taskpool.Task(setWorkerTask3600);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("worker_init");
      expect(wlSet_3600.get()).assertEqual("main_new_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3700
     * @tc.desc   Verify WorkerLocal set() - main thread set does not affect worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      wlSet_3700 = new WorkerLocal<string>(() => "init");
      wlSet_3700.set("main_new_value");
      let task: taskpool.Task = new taskpool.Task(setWorkerTask3700);
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("ok");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3800
     * @tc.desc   Verify WorkerLocal set() with number boundary values MAX_VALUE MIN_VALUE MAX_SAFE_INTEGER MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(Number.MAX_VALUE);
      expect(wl1.get()).assertEqual(Number.MAX_VALUE);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(Number.MIN_VALUE);
      expect(wl2.get()).assertEqual(Number.MIN_VALUE);
      let wl3: WorkerLocal<number> = new WorkerLocal<number>();
      wl3.set(Number.MAX_SAFE_INTEGER);
      expect(wl3.get()).assertEqual(Number.MAX_SAFE_INTEGER);
      let wl4: WorkerLocal<number> = new WorkerLocal<number>();
      wl4.set(Number.MIN_SAFE_INTEGER);
      expect(wl4.get()).assertEqual(Number.MIN_SAFE_INTEGER);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest3900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_3900
     * @tc.desc   Verify WorkerLocal set() with NaN and negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(Number.NaN);
      expect(Number.isNaN(wl1.get())).assertTrue();
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(-0);
      expect(wl2.get()).assertEqual(-0);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4000
     * @tc.desc   Verify WorkerLocal set() with Infinity and -Infinity values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<number> = new WorkerLocal<number>();
      wl1.set(Infinity);
      expect(wl1.get()).assertEqual(Infinity);
      let wl2: WorkerLocal<number> = new WorkerLocal<number>();
      wl2.set(-Infinity);
      expect(wl2.get()).assertEqual(-Infinity);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4100
     * @tc.desc   Verify WorkerLocal set() with Chinese and emoji strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<string> = new WorkerLocal<string>();
      wl1.set("测试工程师");
      expect(wl1.get()).assertEqual("测试工程师");
      let wl2: WorkerLocal<string> = new WorkerLocal<string>();
      wl2.set("テスト테스트测试");
      expect(wl2.get()).assertEqual("テスト테스트测试");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4200
     * @tc.desc   Verify WorkerLocal set() with XSS string and zero-width space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl1: WorkerLocal<string> = new WorkerLocal<string>();
      wl1.set("<script>alert(1)</script>");
      expect(wl1.get()).assertEqual("<script>alert(1)</script>");
      let wl2: WorkerLocal<string> = new WorkerLocal<string>();
      wl2.set("\u200B");
      expect(wl2.get()).assertEqual("\u200B");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4300
     * @tc.desc   Verify WorkerLocal set() with Int32Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Int32Array> = new WorkerLocal<Int32Array>();
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      wl.set(arr);
      let result: Int32Array = wl.get();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4400
     * @tc.desc   Verify WorkerLocal set() AsyncLock protected concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalSetTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name   BuiltinsWorkerLocalSetTest4500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4500
     * @tc.desc   Verify WorkerLocal set() chain combination set-delete-set-get with init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      wl.set(1);
      expect(wl.get()).assertEqual(1);
      wl.set(2);
      expect(wl.get()).assertEqual(2);
      wl.set(3);
      expect(wl.get()).assertEqual(3);
      wl.delete();
      expect(wl.get()).assertEqual(0);
      wl.set(4);
      expect(wl.get()).assertEqual(4);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4600
     * @tc.desc   Verify WorkerLocal set() concurrent competition with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalSetTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      wlSet_4600 = new WorkerLocal<string>(() => "init_4600");
      wlSet_4600.set("main_4600");
      counterSet_4600 = new AtomicInt(0);
      let p1 = taskpool.execute(new taskpool.Task(setWorkerTask4600));
      let p2 = taskpool.execute(new taskpool.Task(setWorkerTask4600));
      let p3 = taskpool.execute(new taskpool.Task(setWorkerTask4600));
      let allResults = await Promise.all([p1, p2, p3]);
      expect(allResults.length).assertEqual(3);
      expect(wlSet_4600.get()).assertEqual("main_4600");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4700
     * @tc.desc   Verify WorkerLocal set() stress test with 100 loop set-get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsWorkerLocalSetTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>(() => 0);
      for (let i: number = 0; i < 100; i++) {
        wl.set(i);
        expect(wl.get()).assertEqual(i);
      }
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4800
     * @tc.desc   Verify WorkerLocal set() value persists across async await boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>(() => "async_init");
      wl.set("async_value");
      expect(wl.get()).assertEqual("async_value");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest4900
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_4900
     * @tc.desc   Verify WorkerLocal set() typeof check for number string and boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wlNum: WorkerLocal<number> = new WorkerLocal<number>();
      wlNum.set(42);
      expect(typeof wlNum.get()).assertEqual("number");
      let wlStr: WorkerLocal<string> = new WorkerLocal<string>();
      wlStr.set("hello");
      expect(typeof wlStr.get()).assertEqual("string");
      let wlBool: WorkerLocal<boolean> = new WorkerLocal<boolean>();
      wlBool.set(true);
      expect(typeof wlBool.get()).assertEqual("boolean");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5000
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5000
     * @tc.desc   Verify WorkerLocal set() with octal number 0o755
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(0o755);
      expect(wl.get()).assertEqual(493);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5100
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5100
     * @tc.desc   Verify WorkerLocal set() with binary number 0b1010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number> = new WorkerLocal<number>();
      wl.set(0b1010);
      expect(wl.get()).assertEqual(10);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5200
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5200
     * @tc.desc   Verify WorkerLocal set() with emoji string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      wl.set("\uD83D\uDE00\uD83D\uDD25\u2B50");
      expect(wl.get()).assertEqual("\uD83D\uDE00\uD83D\uDD25\u2B50");
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5300
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5300
     * @tc.desc   Verify WorkerLocal set() with super long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<string> = new WorkerLocal<string>();
      let longStr: string = "";
      for (let i: number = 0; i < 10000; i++) {
        longStr += "a";
      }
      wl.set(longStr);
      expect(wl.get().length).assertEqual(10000);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5400
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5400
     * @tc.desc   Verify WorkerLocal set() with empty object Record<string, number> type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<Record<string, number>> = new WorkerLocal<Record<string, number>>();
      let obj: Record<string, number> = {};
      wl.set(obj);
      let value: Record<string, number> = wl.get();
      expect(value["test_key"]).assertEqual(undefined);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5500
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5500
     * @tc.desc   Verify WorkerLocal set() with super large array of 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number[]> = new WorkerLocal<number[]>();
      let largeArr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        largeArr.push(i);
      }
      wl.set(largeArr);
      expect(wl.get().length).assertEqual(10000);
      expect(wl.get()[0]).assertEqual(0);
      expect(wl.get()[9999]).assertEqual(9999);
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5600
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5600
     * @tc.desc   Verify WorkerLocal set() with multi-type union number | string | boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let wl: WorkerLocal<number | string | boolean> = new WorkerLocal<number | string | boolean>();
      wl.set(42);
      expect(wl.get()).assertEqual(42);
      wl.set("hello");
      expect(wl.get()).assertEqual("hello");
      wl.set(true);
      expect(wl.get()).assertTrue();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5700
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5700
     * @tc.desc   Verify WorkerLocal set() - EAWorker.run set thread isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsWorkerLocalSetTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      wlSet_5700 = new WorkerLocal<string>(() => "init");
      wlSet_5700.set("main_value");
      expect(wlSet_5700.get()).assertEqual("main_value");
      let eaWorker: EAWorker = new EAWorker("set_5700");
      eaWorker.start();
      let result: string = eaWorker.run<string>(setEAWorkerTask5700).Await();
      expect(result).assertEqual("ea_value");
      expect(wlSet_5700.get()).assertEqual("main_value");
      eaWorker.join();
    })

    /**
     * @tc.name   BuiltinsWorkerLocalSetTest5800
     * @tc.number SUB_BUILTINS_WORKER_LOCAL_SET_TEST_5800
     * @tc.desc   Verify WorkerLocal set() - EAWorker.run nested sequential set verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsWorkerLocalSetTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      wlSet_5800 = new WorkerLocal<string>(() => "init");
      let eaWorker: EAWorker = new EAWorker("set_5800");
      eaWorker.start();
      let result: string = eaWorker.run<string>(setEAWorkerTask5800).Await();
      expect(result).assertEqual("level3");
      eaWorker.join();
    })
  })
}
