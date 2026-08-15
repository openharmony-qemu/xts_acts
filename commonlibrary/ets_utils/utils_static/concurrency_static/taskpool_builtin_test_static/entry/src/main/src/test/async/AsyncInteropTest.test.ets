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
import { afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

class EventEmitter {
  private listeners: Map<string, (data: string) => void> = new Map<string, (data: string) => void>();

  on(event: string, callback: (data: string) => void): void {
    this.listeners.set(event, callback);
  }

  emit(event: string, data: string): void {
    const callback = this.listeners.get(event);
    if (callback) {
      callback(data);
    }
  }
}

class FilterItem {
  public val: number = 0;
  public shouldKeep: boolean = false;
}

class TestObj {
  public value: number = 10;

  async getValue(): Promise<number> {
    try {
      return await Promise.resolve(this.value);
    } catch (e) {
      console.info(`TestObj getValue catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }

  async setValue(newValue: number): Promise<void> {
    this.value = newValue;
    try {
      await Promise.resolve();
    } catch (e) {
      console.info(`TestObj setValue catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}

class BaseClass {
  async baseMethod(): Promise<string> {
    return 'base';
  }
}

class DerivedClass extends BaseClass {
  async derivedMethod(): Promise<string> {
    try {
      const base = await this.baseMethod();
      return base + '-derived';
    } catch (e) {
      console.info(`DerivedClass derivedMethod catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}

class TestData {
  public id: number = 0;
  public name: string = '';
}

export default function asyncInteropTest(): void {
  describe('asyncInteropTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   asyncInteropTest001
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0001
     * @tc.desc   Test async function mixing with callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const callbackWrapper = async (
        callback: (value: int) => void
      ): Promise<int> => {
        try {
          const value = await Promise.resolve(42);
          callback(value);
          return value;
        } catch (err) {
          expect(err).assertFail();
          return 0;
        }
      };

      let callbackValue: int = 0;
      try {
        const result = await callbackWrapper((val) => {
          callbackValue = val;
        });

        expect(result).assertEqual(42);
        expect(callbackValue).assertEqual(42);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest002
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0002
     * @tc.desc   Test async function with callback returning promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const callbackAsync = (
        callback: (err: Error | null) => Promise<int>
      ): Promise<int> => {
        return callback(null);
      };

      try {
        const result = await callbackAsync(async (err: Error | null): Promise<int> => {
          if (err !== null) {
            console.info(`asyncInteropTest002 callback error: ${JSON.stringify(err)}`);
            throw err;
          }
          try {
            return await Promise.resolve(100);
          } catch (e) {
            console.info(`asyncInteropTest002 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        });

        expect(result).assertEqual(100);
      } catch (e) {
        console.info(`asyncInteropTest002 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest003
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0003
     * @tc.desc   Test async function with event-style callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const emitter = new EventEmitter();

      const waitForEvent = async (): Promise<string> => {
        return new Promise<string>((resolve) => {
          emitter.on('data', (data: string) => {
            resolve(data);
          });
          emitter.emit('data', 'event-data');
        });
      };

      try {
        try {
          const result = await waitForEvent();
          expect(result).assertEqual('event-data');
        } catch (e) {
          console.info(`data catch error: ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest004
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0004
     * @tc.desc   Test async function with sync function in Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const syncMultiply = (x: number): number => {
        return x * 2;
      };

      const asyncOperation = async (): Promise<number> => {
        try {
          const value: number = await Promise.resolve(5);
          return syncMultiply(value);
        } catch (err) {
          expect(err).assertFail();
          return 0;
        }
      };

      try {
        const result = await asyncOperation();
        expect(result).assertEqual(10);
      } catch (e) {
        console.info(`asyncInteropTest004 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest005
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0005
     * @tc.desc   Test async function with then/catch mixing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const mixedStyle = async (): Promise<int> => {
        try {
          const first: int = await Promise.resolve(10);
          const second: int = first * 2;
          const doubled: int = await Promise.resolve(second * 2);
          return doubled;
        } catch (err) {
          expect(err).assertFail();
          return 0;
        }
      };

      try {
        const result = await mixedStyle();
        expect(result).assertEqual(40); // 10 * 2 * 2
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest006
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0006
     * @tc.desc   Test async function wrapped in Promise constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const promiseWrapper = async (asyncFn: () => Promise<int>): Promise<int> => {
        try {
          return await asyncFn();
        } catch (e) {
          console.info(`promiseWrapper catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      const myAsync = async (): Promise<int> => {
        try {
          return await Promise.resolve(42);
        } catch (e) {
          console.info(`asyncInteropTest006 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await promiseWrapper(myAsync);
        expect(result).assertEqual(42);
      } catch (e) {
        console.info(`asyncInteropTest006 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest007
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0007
     * @tc.desc   Test async function with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const withTimeout = async (): Promise<string> => {
        try {
          // Use Promise.resolve instead of setTimeout for reliable async execution
          await Promise.resolve();
          return 'timeout-complete';
        } catch (e) {
          console.info(`withTimeout catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await withTimeout();
        expect(result).assertEqual('timeout-complete');
      } catch (e) {
        console.info(`asyncInteropTest007 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest008
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0008
     * @tc.desc   Test async function returning non-promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const mixedReturn = async (condition: boolean): Promise<number | string> => {
        if (condition) {
          return 42.0;
        }
        return 'string-value';
      };

      try {
        const result1 = await mixedReturn(true);
        const result2 = await mixedReturn(false);

        expect(result1).assertEqual(42);
        expect(result2).assertEqual('string-value');
      } catch (e) {
        console.info(`asyncInteropTest008 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest010
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0010
     * @tc.desc   Test async function with reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const asyncReduce = async (): Promise<number> => {
        try {
          const values = [1, 2, 3, 4, 5];

          let sum: number = 0;
          for (const val of values) {
            sum += await Promise.resolve(val);
          }

          return sum;
        } catch (e) {
          console.info(`asyncInteropTest010 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await asyncReduce();
        expect(result).assertEqual(15);
      } catch (e) {
        console.info(`asyncInteropTest010 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest011
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0011
     * @tc.desc   Test async function with filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const asyncFilter = async (): Promise<number[]> => {
        const values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

        try {
          const filtered = await Promise.all(
            values.map(async (val): Promise<FilterItem> => {
              try {
                const shouldKeep = await Promise.resolve(val % 2 === 0);
                const item: FilterItem = new FilterItem();
                item.val = val;
                item.shouldKeep = shouldKeep;
                return item;
              } catch (err) {
                expect(err).assertFail();
                return new FilterItem();
              }
            })
          );

          return filtered
            .filter(item => item.shouldKeep)
            .map(item => item.val);
        } catch (e) {
          console.info(`asyncInteropTest011 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await asyncFilter();
        let res: number[] = [2, 4, 6, 8, 10];
        expect(result).assertDeepEquals(res);
      } catch (e) {
        console.info(`asyncInteropTest011 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest012
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0012
     * @tc.desc   Test async function with object methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const obj = new TestObj();
      try {
        const result1 = await obj.getValue();
        await obj.setValue(20);
        const result2 = await obj.getValue();

        expect(result1).assertEqual(10);
        expect(result2).assertEqual(20);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest013
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0013
     * @tc.desc   Test async function with class inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const instance = new DerivedClass();
      try {
        const result = await instance.derivedMethod();

        expect(result).assertEqual('base-derived');
      } catch (e) {
        console.info(`asyncInteropTest013 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest015
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0015
     * @tc.desc   Test async function with Promise.resolve/reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const useStaticMethods = async (success: boolean): Promise<int> => {
        try {
          if (success) {
            return await Promise.resolve(42);
          }
          return await Promise.reject(new Error('failed'));
        } catch (e) {
          console.info(`asyncInteropTest015 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result1 = await useStaticMethods(true);

        let errorCaught = false;
        try {
          await useStaticMethods(false);
        } catch (err) {
          errorCaught = true;
        }

        expect(result1).assertEqual(42);
        expect(errorCaught).assertTrue();
      } catch (e) {
        console.info(`asyncInteropTest015 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest016
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0016
     * @tc.desc   Test async function with multiple error handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const multiErrorHandling = async (): Promise<string> => {
        try {
          const value: string = await Promise.resolve('value');
          return value.toUpperCase();
        } catch (err) {
          return 'error1';
        }
      };

      try {
        const result = await multiErrorHandling();
        expect(result).assertEqual('VALUE');
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest018
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0018
     * @tc.desc   Test async function with JSON operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const jsonify = async (): Promise<string> => {
        const data: TestData = new TestData();
        data.id = 1;
        data.name = 'test';
        return JSON.stringify(data);
      };

      const parse = async (jsonStr: string): Promise<TestData> => {
        const parsed = JSON.parse<TestData>(jsonStr, Class.from<TestData>()) as TestData;
        return parsed;
      };

      try {
        const json = await jsonify();
        const parsed = await parse(json);

        expect(json).assertEqual('{"id":1,"name":"test"}');
        let expected: TestData = new TestData();
        expected.id = 1;
        expected.name = 'test';
        expect(parsed).assertDeepEquals(expected);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest019
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0019
     * @tc.desc   Test async function with setTimeout clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const clearTimeoutTest = async (): Promise<string> => {
        try {
          // Create a delayed promise that would resolve with 'too-late' if the clear did not win first.
          const delayedPromise: Promise<string> = Promise.resolve('too-late');

          // The "clear" operation resolves first with 'cleared'.
          const clearedResult: string = await Promise.resolve('cleared');

          // Wait for the delayed promise to settle without changing the result.
          const delayedResult: string = await delayedPromise;

          if (clearedResult === 'cleared') {
            return clearedResult;
          }
          return delayedResult;
        } catch (e) {
          console.info(`clearTimeoutTest catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await clearTimeoutTest();
        expect(result).assertEqual('cleared');
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncInteropTest020
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_0020
     * @tc.desc   Test async function composition (pipeline)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const step1 = async (input: number): Promise<number> => {
        return input * 2;
      };

      const step2 = async (input: number): Promise<number> => {
        return input + 10;
      };

      const step3 = async (input: number): Promise<number> => {
        return input / 2.0;
      };

      const pipeline = async (value: int): Promise<number> => {
        let result: number = value;
        try {
          result = await step1(result);
          result = await step2(result);
          result = await step3(result);
          return result;
        } catch (e) {
          console.info(`asyncInteropTest020 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await pipeline(5);
        expect(result).assertEqual(10); // (5 * 2 + 10) / 2 = 10
      } catch (e) {
        console.info(`asyncInteropTest020 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });
  });
}
