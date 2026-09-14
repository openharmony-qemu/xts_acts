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

class NestedObject {
  public value: number = 0;
  public next?: NestedObject;
}

async function level10(depth: int): Promise<number> {
  try {
    if (depth === 0) {
      return 1.0;
    }
    const result: number = await level10(depth - 1);
    return result + 1;
  } catch (e) {
    console.info(`asyncBoundaryTest level10 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function createNested(depth: int): Promise<NestedObject> {
  try {
    if (depth === 0) {
      const obj: NestedObject = new NestedObject();
      obj.value = depth;
      return obj;
    }
    const nested = await createNested(depth - 1);
    const obj: NestedObject = new NestedObject();
    obj.value = depth;
    obj.next = nested;
    return obj;
  } catch (e) {
    console.info(`asyncBoundaryTest createNested catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function deepError(depth: int): Promise<number> {
  try {
    if (depth === 5) {
      throw new Error(`Error at depth ${depth}`);
    }
    return await deepError(depth - 1);
  } catch (e) {
    console.info(`asyncBoundaryTest deepError catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function recursiveChain(depth: int): Promise<number> {
  try {
    if (depth === 0) {
      return 0.0;
    }
    const prev = await Promise.resolve(depth);
    return prev + await recursiveChain(depth - 1);
  } catch (e) {
    console.info(`asyncBoundaryTest recursiveChain catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

export default function asyncBoundaryTest(): void {
  describe('asyncBoundaryTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   asyncBoundaryTest001
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0001
     * @tc.desc   Test deep async nesting (10 levels)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const result = await level10(10);
        expect(result).assertEqual(11);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest002
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0002
     * @tc.desc   Test async function with very large array processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const largeArray = async (): Promise<number[]> => {
        const arr: number[] = [];
        for (let i: int = 0; i < 10000; i++) {
          arr.push(i);
        }
        return arr;
      };

      try {
        const result = await largeArray();
        expect(result.length).assertEqual(10000);
        expect(result[0]).assertEqual(0);
        expect(result[9999]).assertEqual(9999);
      } catch (e) {
        console.info(`asyncBoundaryTest002 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest003
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0003
     * @tc.desc   Test async function with concurrent promise execution (100 concurrent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const concurrent = async (): Promise<int[]> => {
        const promises: Promise<int>[] = [];
        for (let i: int = 0; i < 100; i++) {
          promises.push(Promise.resolve(i));
        }
        try {
          return await Promise.all(promises);
        } catch (e) {
          console.info(`asyncBoundaryTest003 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await concurrent();
        expect(result.length).assertEqual(100);
      } catch (e) {
        console.info(`asyncBoundaryTest003 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest004
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0004
     * @tc.desc   Test async function with multiple sequential awaits (50 awaits)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const manyAwaits = async (): Promise<number> => {
        try {
          let sum: number = 0;
          for (let i: int = 0; i < 50; i++) {
            const val: number = await Promise.resolve(i);
            sum += val;
          }
          return sum;
        } catch (e) {
          console.info(`asyncBoundaryTest004 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await manyAwaits();
        expect(result).assertEqual(1225); // 0+1+2+...+49 = 1225
      } catch (e) {
        console.info(`asyncBoundaryTest004 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest005
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0005
     * @tc.desc   Test async function error at deep nesting level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caught: boolean = false;
      try {
        await deepError(10);
      } catch (e) {
        caught = true;
      }

      expect(caught).assertTrue();
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest006
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0006
     * @tc.desc   Test async function with rapid re-execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: int = 0;
      const rapidCall = async (): Promise<int> => {
        counter++;
        try {
          await Promise.resolve();
          return counter;
        } catch (e) {
          console.info(`asyncBoundaryTest006 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const results = await Promise.all([
          rapidCall(),
          rapidCall(),
          rapidCall(),
          rapidCall(),
          rapidCall()
        ]);

        expect(results.length).assertEqual(5);
        expect(results).assertDeepEquals([5, 5, 5, 5, 5]);
      } catch (e) {
        console.info(`asyncBoundaryTest006 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest007
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0007
     * @tc.desc   Test async function with very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const longString = async (): Promise<string> => {
        return 'a'.repeat(10000);
      };

      try {
        const result = await longString();
        expect(result.length).assertEqual(10000);
      } catch (e) {
        console.info(`asyncBoundaryTest007 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest008
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0008
     * @tc.desc   Test async function with deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const result = await createNested(20);
        let current: NestedObject | undefined = result;
        let count: int = 0;

        while (current) {
          count++;
          current = current?.next;
        }

        expect(count).assertEqual(21);
      } catch (e) {
        console.info(`asyncBoundaryTest008 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest009
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0009
     * @tc.desc   Test async function with mixed error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // ArkTS 只允许抛出 Error 类型
      const throwString = async (): Promise<never> => {
        throw new Error('string error');
      };

      const throwNumber = async (): Promise<never> => {
        throw new Error('123');
      };

      const throwObject = async (): Promise<never> => {
        throw new Error('object error');
      };

      let errorsCaught: int = 0;

      try {
        await throwString();
      } catch (e) {
        errorsCaught++;
      }

      try {
        await throwNumber();
      } catch (e) {
        errorsCaught++;
      }

      try {
        await throwObject();
      } catch (e) {
        errorsCaught++;
      }

      expect(errorsCaught).assertEqual(3);
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest010
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0010
     * @tc.desc   Test async function with cyclic promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const chainPromise = async (count: number): Promise<int> => {
        let val: int = 0;
        try {
          for (let i: int = 0; i < count; i++) {
            val = await Promise.resolve(val + 1);
          }
          return val;
        } catch (e) {
          console.info(`asyncBoundaryTest010 chainPromise catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await chainPromise(100);
        expect(result).assertEqual(100);
      } catch (e) {
        console.info(`asyncBoundaryTest010 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest012
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0012
     * @tc.desc   Test async function with promise rejection in Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const mixedPromises = async (): Promise<Array<int|never>> => {
        const promises = [
          Promise.resolve(1),
          Promise.reject(new Error('failure')),
          Promise.resolve(3)
        ];

        try {
          return await Promise.all(promises);
        } catch (err) {
          return [0];
        }
      };

      try {
        const result = await mixedPromises();
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(0);
      } catch (e) {
        console.info(`asyncBoundaryTest012 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest013
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0013
     * @tc.desc   Test async function memory cleanup with many promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const memoryTest = async (): Promise<int[]> => {
        const promises: Promise<int>[] = [];
        for (let i: int = 0; i < 100; i++) {
          promises.push(Promise.resolve(i));
        }
        try {
          return await Promise.all(promises);
        } catch (e) {
          console.info(`asyncBoundaryTest013 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await memoryTest();
        expect(result.length).assertEqual(100);
        expect(result[0]).assertEqual(0);
        expect(result[99]).assertEqual(99);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest014
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0014
     * @tc.desc   Test async function with recursive Promise chains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const result = await recursiveChain(50);
        expect(result).assertEqual(1275); // 50+49+...+1 = 1275
      } catch (e) {
        console.info(`asyncBoundaryTest014 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest016
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0016
     * @tc.desc   Test async function with interleaved await and sync operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const interleaved = async (): Promise<number[]> => {
        const results: number[] = [];

        for (let i: int = 0; i < 10; i++) {
          results.push(i); // sync
          try {
            const val = await Promise.resolve(i * 2);
            results.push(val); // async
          } catch (err) {
            expect(err).assertFail();
          }
        }

        return results;
      };

      try {
        const result = await interleaved();
        expect(result.length).assertEqual(20);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[18]).assertEqual(9);
        expect(result[19]).assertEqual(18);
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest017
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0017
     * @tc.desc   Test async function with immediate resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncBoundaryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const immediate = async (): Promise<int> => {
        try {
          const val: int = await Promise.resolve(42);
          return val;
        } catch (e) {
          console.info(`asyncBoundaryTest017 immediate catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const result = await immediate();
        expect(result).assertEqual(42);
      } catch (e) {
        console.info(`asyncBoundaryTest017 catch error: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncBoundaryTest018
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_0018
     * @tc.desc   Test async function with multiple return paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const multiReturn = async (condition: number): Promise<string> => {
        try {
          if (condition === 1) {
            return 'one';
          } else if (condition === 2) {
            return await Promise.resolve('two');
          } else {
            try {
              const val = await Promise.resolve('three');
              return val;
            } catch (err) {
              expect(err).assertFail();
              return '';
            }
          }
        } catch (e) {
          console.info(`asyncBoundaryTest018 catch error: ${JSON.stringify(e)}`);
          throw e;
        }
      };

      try {
        const r1 = await multiReturn(1);
        const r2 = await multiReturn(2);
        const r3 = await multiReturn(3);

        expect(r1).assertEqual('one');
        expect(r2).assertEqual('two');
        expect(r3).assertEqual('three');
      } catch (err) {
        expect(err).assertFail();
      }
      done();
    });
  });
}
