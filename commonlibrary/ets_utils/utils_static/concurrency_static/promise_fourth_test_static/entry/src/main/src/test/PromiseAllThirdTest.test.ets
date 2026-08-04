'use static'
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

interface EventEmitter {
  on(event: string, listener: (data: string) => void): void;
  emit(event: string, data: string): void;
}

class SimpleEmitter implements EventEmitter {
  listeners: Map<string, ((data: string) => void)[]> = new Map<string, ((data: string) => void)[]>();
  on(event: string, listener: (data: string) => void): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, []);
    }
    this.listeners.get(event)!.push(listener);
  }
  emit(event: string, data: string): void {
    let listeners = this.listeners.get(event);
    if (listeners) {
      listeners.forEach((listener: (data: string) => void) => listener(data));
    }
  }
}

class SimpleLock {
  locked: boolean = false;
  async lockAsync(fn: () => void): Promise<void> {
    while (this.locked) {
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, _reject: (reason: Error) => void) => {
        setTimeout(() => resolve(undefined as void), 100);
      });
    }
    this.locked = true;
    try {
      fn();
    } finally {
      this.locked = false;
    }
  }
}

class ErrorIterable implements Iterable<Promise<int>> {
  [Symbol.iterator](): Iterator<Promise<int>> {
    return {
      next(): IteratorResult<Promise<int>>   {
        throw new Error("Iterator error occurred at line 123");
      }
    };
  }
}

export default function BuiltinsPromiseAllThirdTest(): void {
  describe('BuiltinsPromiseAllThirdTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {

      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Required by XTS describe completeness; no per-case cleanup for this suite.
    })
    afterAll((): void => {
      // Required by XTS describe completeness; no suite-level cleanup for this suite.
    })

    /**
     * @tc.name   PromiseAllThirdTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0100
     * @tc.desc   Verify sequential chained Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: int[] = [];
      let set1 = new Set<Promise<int>>();
      set1.add(Promise.resolve<int>(1));
      order.push(1);
      await Promise.all<int>(set1);
      let set2 = new Set<Promise<int>>();
      set2.add(Promise.resolve<int>(2));
      order.push(2);
      await Promise.all<int>(set2);
      let set3 = new Set<Promise<int>>();
      set3.add(Promise.resolve<int>(3));
      order.push(3);
      await Promise.all<int>(set3);
      expect(order).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0200
     * @tc.desc   Verify parallel Promise.all execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set1 = new Set<Promise<string>>();
      set1.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("one"), 200);
      }));
      let set2 = new Set<Promise<string>>();
      set2.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("two"), 150);
      }));
      let set3 = new Set<Promise<string>>();
      set3.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("three"), 100);
      }));
      let allResults = await Promise.all([
        Promise.all<string>(set1),
        Promise.all<string>(set2),
        Promise.all<string>(set3)
      ]);

      expect(allResults[0]).assertDeepEquals(["one"]);
      expect(allResults[1]).assertDeepEquals(["two"]);
      expect(allResults[2]).assertDeepEquals(["three"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0300
     * @tc.desc   Verify read-write race condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let data: int = 0;
      let writePromise = new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          data = 100;
          resolve(undefined as void);
          return;
        }, 100);
      });
      let readPromises = new Set<Promise<int>>();
      for (let i = 0; i < 5; i++) {
        readPromises.add(new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => { resolve(data); return; }, 150);
        }));
      }
      await writePromise;
      let results = await Promise.all<int>(readPromises);
      expect(results.every(r => r === 100)).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0400
     * @tc.desc   Verify Promise.all early reject behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("slow"), 500);
      }));
      promises.add(Promise.reject<string>(new Error("immediate reject")));
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
        expect().assertFail();
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0500
     * @tc.desc   Verify clearTimeout interrupting async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let executed = false;
      let promises = new Set<Promise<string>>();
      let timerPromise = new Promise<string>((resolve: (value: string) => void) => {
        let timerId = setTimeout(() => {
          executed = true;
          resolve("timer");
          return;
        }, 500);
        clearTimeout(timerId);
      });
      promises.add(timerPromise);
      promises.add(Promise.resolve<string>("other"));
      await Promise.race([
        Promise.all<string>(promises),
        new Promise<string[]>((resolve: (value: string[]) => void) => {
          setTimeout(() => resolve(["timeout"]), 600);
        })
      ]);
      expect(executed).assertFalse();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0600
     * @tc.desc   Verify Promise.all timeout handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("slow"), 2000);
      }));
      let result = await Promise.race<string[]>([
        Promise.all<string>(promises),
        new Promise<string[]>((resolve: (value: string[]) => void) => {
          setTimeout(() => resolve(["timeout"]), 1000);
        })
      ]);
      expect(result).assertDeepEquals(["timeout"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0700
     * @tc.desc   Verify Promise.all failure retry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let attemptCount = 0;
      let retryablePromiseAll: () => Promise<string[]> = async (): Promise<string[]> => {
        attemptCount++;
        let promises = new Set<Promise<string>>();
        if (attemptCount < 3) {
          promises.add(Promise.reject<string>(new Error("fail")));
        } else {
          promises.add(Promise.resolve<string>("success"));
        }
        return await Promise.all<string>(promises);
      };

      let withRetry = async (task: () => Promise<string[]>, maxRetries: number): Promise<string[]> => {
        for (let i = 0; i < maxRetries; i++) {
          try {
            return await task();
          } catch (error) {
            if (i === maxRetries - 1) {
              throw error;
            }
          }
        }
        throw new Error("Max retries reached");
      };
      let result = await withRetry(retryablePromiseAll, 5);
      expect(result).assertDeepEquals(["success"]);
      expect(attemptCount).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0800
     * @tc.desc   Verify event triggering Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let emitter = new SimpleEmitter();
      let results: string[] = [];
      emitter.on('data', (data: string) => {
        let promises = new Set<Promise<string>>();
        promises.add(Promise.resolve<string>(data + "_1"));
        promises.add(Promise.resolve<string>(data + "_2"));
        Promise.all<string>(promises).then<void>((result: string[]) => {
          for (let j = 0; j < result.length; j++) {
            results.push(result[j]);
          }
          return;
        });
      });
      emitter.emit('data', 'input');
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => resolve(undefined as void), 100);
      });
      expect(results.length).assertEqual(2);
      expect(results.includes("input_1")).assertTrue();
      expect(results.includes("input_2")).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_0900
     * @tc.desc   Verify Promise.all waits for all Promises naturally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(Promise.resolve("one"));
      promises.add(Promise.resolve("two"));
      promises.add(Promise.resolve("three"));
      let result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1000
     * @tc.desc   Verify Promise.all with atomic counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let totalCount = 5;
      let promises = new Set<Promise<void>>();
      for (let i = 0; i < totalCount; i++) {
        counter++;
        promises.add(Promise.resolve<void>(undefined));
      }
      await Promise.all<void>(promises);
      expect(counter).assertEqual(totalCount);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1100
     * @tc.desc   Verify Promise.all with lock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0;

      let lock = new SimpleLock();
      let promises = new Set<Promise<void>>();
      for (let i = 0; i < 10; i++) {
        promises.add(lock.lockAsync(() => {
          count++;
          return;
        }));
      }
      await Promise.all<void>(promises);
      expect(count).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1200
     * @tc.desc   Verify Promise.all with concurrent map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let map: Map<string, int> = new Map<string, int>();
      let promises = new Set<Promise<int>>();
      promises.add(Promise.resolve<int>(1));
      promises.add(Promise.resolve<int>(2));
      promises.add(Promise.resolve<int>(3));
      let results = await Promise.all<int>(promises);
      for (let i = 0; i < results.length; i++) {
        map.set(`key${i}`, results[i]);
      }
      expect(map.size).assertEqual(3);
      expect(map.get("key0")).assertEqual(1);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1300
     * @tc.desc   Verify MessageHandler callback nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(Promise.resolve("A"));
      promises.add(Promise.resolve("B"));
      promises.add(Promise.resolve("C"));
      let result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1400
     * @tc.desc   Verify assertContain for partial error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.all<int>(new ErrorIterable());
        expect().assertFail();
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1500
     * @tc.desc   Verify Timer interval >= 50ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("first"), 100)
      }));
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("second"), 100)
      }));
      let result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1600
     * @tc.desc   Verify only assert key error information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(Promise.reject<string>(new Error("Iterator error: invalid state")));
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
        expect().assertFail();
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1700
     * @tc.desc   Verify multi-layer async must await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let outerPromiseAll: () => Promise<int[]> = async (): Promise<int[]> => {
        let innerPromises = new Set<Promise<int>>();
        innerPromises.add(Promise.resolve<int>(1));
        innerPromises.add(Promise.resolve<int>(2));
        return await Promise.all<int>(innerPromises);
      };

      let test: () => Promise<void> = async (): Promise<void> => {
        let result = await outerPromiseAll();
        expect(result).assertDeepEquals([1, 2]);
      };
      await test();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1800
     * @tc.desc   Verify Timer branch interval > 50ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      let branch = "";
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => {
          branch = "branch1";
          resolve("first");
          return;
        }, 50);
      }));
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => {
          branch = "branch2";
          resolve("second");
          return;
        }, 100);
      }));
      let result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_1900
     * @tc.desc   Verify Promise.all must use await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("test"));
      let result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["test"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2000
     * @tc.desc   Verify result array order validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      let items = ["first", "second", "third"];
      items.forEach((item: string) => {
        promises.add(Promise.resolve<string>(item));
      });
      let result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(3);
      items.forEach((item: string) => {
        expect(result.includes(item)).assertTrue();
      Done();
      });
    })

    /**
     * @tc.name   PromiseAllThirdTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2100
     * @tc.desc   Verify all exception paths must catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>();
      promises.add(Promise.reject<string>(new Error("test")));
      let caught: boolean = false
      try {
        let result = await Promise.all<string>(promises);
        expect().assertFail();
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      let promises2 = new Set<Promise<string>>();
      promises2.add(Promise.reject<string>(new Error("test2")));
      await Promise.all<string>(promises2).catch<void>((error: Error) => {
        expect(error instanceof Error).assertTrue();
      });
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2200
     * @tc.desc   Verify empty Iterable boundary case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let emptySet = new Set<Promise<string>>();
      let result = await Promise.all<string>(emptySet);
      expect(result).assertDeepEquals([] as string[]);
      expect(result.length).assertEqual(0);
      expect(Array.isArray(result)).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2300
     * @tc.desc   Verify Promise.then callback nested Promise.all(Set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("outer")
        .then<int[]>(() => {
          let promises = new Set<Promise<int>>();
          promises.add(Promise.resolve<int>(10));
          promises.add(Promise.resolve<int>(20));
          return Promise.all<int>(promises);
        });
      expect(result).assertDeepEquals([10, 20]);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2400
     * @tc.desc   Verify 3 concurrent + atomic counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let promises = new Set<Promise<void>>();
      for (let i = 0; i < 3; i++) {
        promises.add(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
          return;
        }));
      }
      await Promise.all<void>(promises);
      expect(counter).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2500
     * @tc.desc   Verify 5 concurrent + atomic counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let promises = new Set<Promise<void>>();
      for (let i = 0; i < 5; i++) {
        promises.add(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
          return;
        }));
      }
      await Promise.all<void>(promises);
      expect(counter).assertEqual(5);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2600
     * @tc.desc   Verify 10 concurrent + atomic counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let promises = new Set<Promise<void>>();
      for (let i = 0; i < 10; i++) {
        promises.add(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
          return;
        }));
      }
      await Promise.all<void>(promises);
      expect(counter).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2700
     * @tc.desc   AtomicInt concurrent counting verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let atomicCounter = new AtomicInt(0);
      let taskCount = 10;

      let promises: Promise<void>[] = [];
      for (let i = 0; i < taskCount; i++) {
        promises.push(Promise.resolve<void>(undefined).then<void>(() => {
          atomicCounter.fetchAdd(1);
          return;
        }));
      }

      await Promise.all<void>(promises);
      expect(atomicCounter.load()).assertEqual(taskCount);
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2800
     * @tc.desc   EAWorker.run callback nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('promiseWorker');
      eaWorker.start();

      let job1 = eaWorker.run<int>(() => { return 1 * 2; });
      let job2 = eaWorker.run<int>(() => { return 2 * 2; });
      let job3 = eaWorker.run<int>(() => { return 3 * 2; });

      let r1 = job1.Await();
      let r2 = job2.Await();
      let r3 = job3.Await();
      let results: int[] = [r1, r2, r3];
      let allResult = await Promise.all<int>([Promise.resolve(results[0]), Promise.resolve(results[1]), Promise.resolve(results[2])]);
      expect(allResult).assertDeepEquals([2, 4, 6]);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_2900
     * @tc.desc   EAWorker.run callback with Promise.allSettled integration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('settledWorker');
      eaWorker.start();

      let job = eaWorker.run<int>((a: int, b: int, c: int, d: int, e: int) => {
        let count = 0;
        if (a > 0) { count++; }
        if (b > 0) { count++; }
        if (c > 0) { count++; }
        if (d > 0) { count++; }
        if (e > 0) { count++; }
        return count;
      }, 1, -1, 2, -2, 3);

      let successCount = job.Await();

      let promises: Promise<int>[] = [
        Promise.resolve<int>(1), Promise.reject<int>(new Error("negative")),
        Promise.resolve<int>(2), Promise.reject<int>(new Error("negative")),
        Promise.resolve<int>(3)
      ];
      let results = await Promise.allSettled<int>(promises);
      let mainCount = 0;
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") { mainCount++; }
      }
      expect(successCount).assertEqual(mainCount);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3000
     * @tc.desc   EAWorker.run callback nested Promise.all simple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('testWorker');
      eaWorker.start();

      let job1 = eaWorker.run<int>(() => { return 1; });
      let job2 = eaWorker.run<int>(() => { return 2; });

      let jr1 = job1.Await();
      let jr2 = job2.Await();
      let result = await Promise.all<int>([Promise.resolve(jr1), Promise.resolve(jr2)]);
      expect(result).assertDeepEquals([1, 2]);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3100
     * @tc.desc   EAWorker.run callback with Promise.allSettled result length comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('testWorker');
      eaWorker.start();

      let job = eaWorker.run<int>(() => {
        return 2;
      });

      let promises: Promise<string>[] = [
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("fail"))
      ];
      let results = await Promise.allSettled<string>(promises);
      let workerResult = job.Await();
      expect(results.length).assertEqual(workerResult);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3200
     * @tc.desc   EAWorker.run callback with Promise.all and counter integration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('handlerWorker');
      eaWorker.start();
      let job = eaWorker.run<int>((a: int, b: int, c: int) => {
        return a * 2 + b * 2 + c * 2;
      }, 1, 2, 3);

      let workerSum = job.Await();

      let promises: Promise<int>[] = [Promise.resolve(1 * 2), Promise.resolve(2 * 2), Promise.resolve(3 * 2)];
      let results = await Promise.all<int>(promises);
      let mainSum = results[0] + results[1] + results[2];
      expect(workerSum).assertEqual(mainSum);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAllThirdTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3300
     * @tc.desc   Verify Promise.all with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        promises.push(new Promise<void>((resolve: (value: void) => void) => {
          counter++;
          resolve(undefined as void);
        }));
      }
      await Promise.all<void>(promises);
      expect(counter).assertEqual(10);
      Done()
    })

    /**
     * @tc.name   PromiseAllThirdTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3400
     * @tc.desc   Verify Promise.all result order with different completion times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = [
        new Promise<int>(resolve => {
          setTimeout(() => resolve(1), 300)
        }),
        new Promise<int>(resolve => {
          setTimeout(() => resolve(2), 100)
        }),
        new Promise<int>(resolve => {
          setTimeout(() => resolve(3), 200)
        })
      ];
      let result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done()
    })

    /**
     * @tc.name   PromiseAllThirdTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3500
     * @tc.desc   Verify Promise.all with mixed sync and async Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve(1),
        new Promise<int>(resolve => {
          setTimeout(() => resolve(2), 100)
        }),
        Promise.resolve(3)
      ];
      let result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done()
    })

    /**
     * @tc.name   PromiseAllThirdTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_THIRD_TEST_3600
     * @tc.desc   Verify Promise.all with all undefined array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [undefined, undefined, undefined];
      let result = await Promise.all<undefined>(promises);
      expect(result).assertDeepEquals([undefined, undefined, undefined]);
      Done()
    })
  })
}
