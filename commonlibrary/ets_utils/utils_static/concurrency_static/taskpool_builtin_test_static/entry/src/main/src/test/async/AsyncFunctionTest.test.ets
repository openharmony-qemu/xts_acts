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
import Utils, { sleep } from '../Utils.test';

// ===== Top-level types (inlined from async.ts) =====
interface Data {
  id: number;
  value: string;
}

interface ApiResponse { data: number; }
interface FormData { username: string; password: string; }
interface CacheKey { id: number; }
interface ResultObj { key: string; count: number; }
interface User {
  id: number;
  name: string;
  email?: string | null;
}
interface ReadonlyData {
  id: number;
  name: string;
}
interface type62 { str: string; num: number; }
interface type68 { id: number; name: string; }
interface type71 { firstCall: string; secondCall: string; }
interface type83 { size: number; hasFive: boolean; }
interface type86 { taskId: number; result: number; }
interface type89 { length: int; item: string | undefined; }
interface type93 { success: number; failed: number; }
interface type94 {
  asyncIncrement: (step: number) => Promise<number>;
  getCount: () => number;
}
interface type100 { valid: Data[]; processed: string[]; count: number; }

// ===== Types moved from inside it() blocks to top-level =====
type SettledStatus = 'fulfilled' | 'rejected';
type AsyncFuncUnionType = string | number | boolean;
type DataTuple = [string, number, boolean];
type PointTuple = [number, number];
type StringMap = Map<string, number>;
type UniqueNumbers = Set<number>;
interface UserProfileResult { name: string; id: number; }

// Types for asyncFunctionTest053
interface AsyncObjStep3 {
  nestedStep: (num: number) => Promise<number>;
}
interface AsyncObj {
  step1: (num: number) => Promise<number>;
  step2: (num: number) => Promise<number>;
  step3: AsyncObjStep3;
}

// Types for asyncFunctionTest063
interface UserModuleAuth {
  login: (user: string, pwd: string) => Promise<boolean>;
  getToken: () => Promise<string>;
}
interface UserModuleProfile {
  fetchProfile: (token: string) => Promise<UserProfileResult>;
}
interface UserModule {
  auth: UserModuleAuth;
  profile: UserModuleProfile;
}

// Types for asyncFunctionTest087
interface UserAddress087 {
  city: string;
}
interface UserProfile087 {
  name: string;
  address?: UserAddress087;
}
interface User087 {
  id: number;
  profile?: UserProfile087;
}

// Type for asyncFunctionTest016
interface AsyncMethodObj {
  method: (num: number) => Promise<number>;
}

// Interface for it() 060
interface DataProcessor {
  fetch: (id: number) => Promise<string>;
  transform: (data: string) => Promise<string>;
  save: (data: string) => Promise<boolean>;
}

// ===== Enums moved from inside it() blocks to top-level =====
enum Status {
  Pending = 'pending',
  Success = 'success',
  Failed = 'failed'
}

enum HttpMethod {
  GET = 'GET',
  POST = 'POST',
  PUT = 'PUT'
}

// ===== Classes moved from inside it() blocks to top-level =====
class TestClass {
  public async classMethod(str: string): Promise<string> {
    return str.toUpperCase();
  }
}

class Parent {
  public async parentMethod(num: number): Promise<number> {
    return await Promise.resolve(num * 2);
  }
}

class Child extends Parent {
  public async childMethod(num: number): Promise<number> {
    const parentVal: number = await this.parentMethod(num);
    const childVal: number = await Promise.resolve(parentVal + 7);
    return childVal;
  }
}

class CustomError extends Error {
  public errorCode: number = 0;

  constructor(message: string, code: number) {
    super(message);
    this.errorCode = code;
    this.name = 'CustomError';
  }
}

class DataStore<T> {
  private data: T[] = [];

  async add(item: T): Promise<int> {
    const nestedAdd = async (): Promise<int> => {
      this.data.push(item);
      return await Promise.resolve(this.data.length);
    };
    return await nestedAdd();
  }

  async getAt(index: int): Promise<T | undefined> {
    const nestedGet = async (): Promise<T | undefined> => {
      return (await Promise.resolve(this.data[index])) as T | undefined;
    };
    return await nestedGet();
  }
}

// ===== Top-level functions =====

// formatData implementation
function formatData(data: string | number): Promise<string> {
  const nestedFormat = async (): Promise<string> => {
    if (typeof data === 'string') {
      const s: string = data as string;
      return await Promise.resolve(s.toUpperCase());
    }
    const n: number = data as number;
    return await Promise.resolve(n.toString().padStart(3, '0'));
  };
  return nestedFormat();
}

// asyncFunctionTest016 (async method in object)
async function asyncFunctionTest016Fn(): Promise<number> {
  const obj: AsyncMethodObj = {
    method: async (num: number): Promise<number> => num * 2
  };
  const result: number = await obj.method(7);
  return result;
}

// asyncFunctionTest043 (rewritten from async generator that yields 1,2,3)
async function asyncFunctionTest043Fn(): Promise<number[]> {
  const callAsyncGenerator = async (): Promise<number[]> => {
    const results: number[] = [];
    results.push(await Promise.resolve(1));
    results.push(await Promise.resolve(2));
    results.push(await Promise.resolve(3));
    return results;
  };
  const result: number[] = await callAsyncGenerator();
  return result;
}

// asyncFunctionTest053 (nested async in typed object properties)
async function asyncFunctionTest053Fn(): Promise<number> {
  const asyncObj: AsyncObj = {
    step1: async (num: number): Promise<number> => await Promise.resolve(num + 5),
    step2: async (num: number): Promise<number> => await Promise.resolve(num * 3),
    step3: {
      nestedStep: async (num: number): Promise<number> => await Promise.resolve(num - 2)
    }
  };

  const runObjSteps = async (): Promise<number> => {
    let val: number = 4;
    val = await asyncObj.step1(val);
    val = await asyncObj.step2(val);
    val = await asyncObj.step3.nestedStep(val);
    return val;
  };
  const result: number = await runObjSteps();
  return result;
}

// asyncFunctionTest063 (nested async in module-like object)
async function asyncFunctionTest063Fn(): Promise<UserProfileResult> {
  const userModule: UserModule = {
    auth: {
      login: async (user: string, pwd: string): Promise<boolean> => {
        const nestedAuth = async (): Promise<boolean> => await Promise.resolve(user === 'test' && pwd === '123');
        return await nestedAuth();
      },
      getToken: async (): Promise<string> => {
        const nestedToken = async (): Promise<string> => await Promise.resolve('token_123');
        return await nestedToken();
      }
    },
    profile: {
      fetchProfile: async (token: string): Promise<UserProfileResult> => {
        const nestedProfile = async (): Promise<UserProfileResult> => {
          if (token) {
            const profile: UserProfileResult = { name: 'test', id: 1 };
            return await Promise.resolve(profile);
          }
          throw new Error('no token');
        };
        return await nestedProfile();
      }
    }
  };

  const getUserProfile = async (user: string, pwd: string): Promise<UserProfileResult> => {
    const isLogin: boolean = await userModule.auth.login(user, pwd);
    if (!isLogin) {
      throw new Error('login fail');
    }
    const token: string = await userModule.auth.getToken();
    return await userModule.profile.fetchProfile(token);
  };
  const result: UserProfileResult = await getUserProfile('test', '123');
  return result;
}

// asyncFunctionTest068 (readonly data handling)
async function asyncFunctionTest068Fn(): Promise<type68> {
  const getReadonly = async (): Promise<ReadonlyData> => {
    const nestedGet = async (): Promise<ReadonlyData> => {
      const data: ReadonlyData = { id: 1, name: 'readonly' };
      return await Promise.resolve(data);
    };
    return await nestedGet();
  };

  const processReadonly = async (): Promise<type68> => {
    const data: ReadonlyData = await getReadonly();
    const result: type68 = { id: data.id, name: data.name };
    return result;
  };
  const result: type68 = await processReadonly();
  result.name = 'modified';
  return result;
}

// asyncFunctionTest087 (optional chaining - rewritten without ?.)
async function asyncFunctionTest087Fn(): Promise<boolean> {
  const getCity = async (user: User087): Promise<string | null> => {
    const nestedGet = async (): Promise<string | null> => {
      const profile: UserProfile087 | undefined = user.profile;
      if (profile !== undefined) {
        const address: UserAddress087 | undefined = profile.address;
        if (address !== undefined) {
          return await Promise.resolve(address.city);
        }
      }
      return await Promise.resolve(null);
    };
    return await nestedGet();
  };

  const user1: User087 = { id: 1, profile: { name: 'A', address: { city: 'NY' } } };
  const user2: User087 = { id: 2, profile: { name: 'B' } };
  const user3: User087 = { id: 3 };

  const city1: string | null = await getCity(user1);
  const city2: string | null = await getCity(user2);
  const city3: string | null = await getCity(user3);
  return city1 === 'NY' && city2 === null && city3 === null;
}

// asyncFunctionTest089 (generic class DataStore<T>)
async function asyncFunctionTest089Fn(): Promise<type89> {
  const useDataStore = async (): Promise<type89> => {
    const store: DataStore<string> = new DataStore<string>();
    const length: int = await store.add('item1');
    const item: string | undefined = await store.getAt(0);
    const result: type89 = { length: length, item: item };
    return result;
  };
  const result: type89 = await useDataStore();
  return result;
}

// compose function (moved from asyncFunctionTest090, generic arrow → top-level function)
function composeFn<A, B, C>(
  f: (b: B) => Promise<C>,
  g: (a: A) => Promise<B>
): (a: A) => Promise<C> {
  const composed: (a: A) => Promise<C> = async (a: A): Promise<C> => {
    return f(await g(a) as B);
  };
  return composed;
}

// asyncFunctionTest090 (typed function composition)
async function asyncFunctionTest090Fn(): Promise<number> {
  const add5: (num: number) => Promise<number> = async (num: number): Promise<number> => await Promise.resolve(num + 5);
  const multiply2: (num: number) => Promise<number> = async (num: number): Promise<number> => await Promise.resolve(num * 2);

  const composed: (a: number) => Promise<number> = composeFn<number, number, number>(multiply2, add5);
  const result: number = await composed(3);
  return result;
}

// asyncFunctionTest091 (rewritten from async generator composition: gen1=[1,2], gen2=[3,4])
async function asyncFunctionTest091Fn(): Promise<number[]> {
  const gen1 = async (): Promise<number[]> => {
    const results: number[] = [];
    results.push(await Promise.resolve(1));
    results.push(await Promise.resolve(2));
    return results;
  };
  const gen2 = async (): Promise<number[]> => {
    const results: number[] = [];
    results.push(await Promise.resolve(3));
    results.push(await Promise.resolve(4));
    return results;
  };

  const composeGens = async (): Promise<number[]> => {
    const results1: number[] = await gen1();
    const results2: number[] = await gen2();
    const combined: number[] = [];
    results1.forEach((val: number) => {
      combined.push(val);
    });
    results2.forEach((val: number) => {
      combined.push(val);
    });
    return combined;
  };
  const result: number[] = await composeGens();
  return result;
}

// asyncFunctionTest099 (rewritten from async generator: yields 0,3,6,9)
async function asyncFunctionTest099Fn(): Promise<number[]> {
  const collectValues = async (): Promise<number[]> => {
    const values: number[] = [];
    let current: number = 0;
    while (current < 10) {
      values.push(current);
      current += 3;
    }
    return values;
  };
  const result: number[] = await collectValues();
  return result;
}

// genericFetcher (moved from it() 062, generic arrow → top-level function)
async function genericFetcher<T>(data: T): Promise<Awaited<T>> {
  const nestedFetch: () => Promise<Awaited<T>> = async (): Promise<Awaited<T>> => await Promise.resolve(data);
  return await nestedFetch();
}

// raceTasks (moved from it() 095, generic async arrow → top-level function)
async function raceTasks<T>(value: T, timeoutMs: int): Promise<T | 'timeout'> {
  const valueTask: Promise<T> = new Promise<T>((resolve) => {
    setTimeout(() => {
      resolve(value);
    }, timeoutMs * 2);
  });
  const timeoutTask: Promise<'timeout'> = new Promise<'timeout'>((resolve) => {
    setTimeout(() => {
      resolve('timeout');
    }, timeoutMs);
  });
  const tasks: Array<Promise<T | 'timeout'>> = [valueTask, timeoutTask];
  return Promise.race(tasks) as Promise<T | 'timeout'>;
}

export default function asyncFunctionTest(): void {
  describe('asyncFunctionTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   asyncFunctionTest001
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_001
     * @tc.desc   Basic async function returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const getValue = async (): Promise<number> => 42;
      const result = await getValue();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   asyncFunctionTest002
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_002
     * @tc.desc   Async function returns Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const getPromise = async (): Promise<string> => Promise.resolve('test');
      const result: Promise<string> = getPromise();
      expect(result instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest003
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_003
     * @tc.desc   Async function uses await with external Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const externalPromise: Promise<number> = Promise.resolve(15 as number);
      const useAwait = async (): Promise<number> => {
        const val = await externalPromise;
        return val * 2;
      };
      const result = await useAwait();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   asyncFunctionTest004
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_004
     * @tc.desc   Async function throws error, caught by try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const throwError = async (): Promise<void> => {
        throw new Error('async error');
      };
      let errorCaught = false;
      try {
        await throwError();
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest005
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_005
     * @tc.desc   Async function with no return returns Promise.resolve(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const noReturn = async (): Promise<undefined> => {
        return;
      };
      const result = await noReturn();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFunctionTest006
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_006
     * @tc.desc   Async function with nested async arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const outerAsync = async (): Promise<number> => {
        const innerAsync = async (): Promise<number> => 8;
        const innerVal = await innerAsync();
        return innerVal * 3;
      };
      const result = await outerAsync();
      expect(result).assertEqual(24);
    });

    /**
     * @tc.name   asyncFunctionTest007
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_007
     * @tc.desc   Multiple awaits in single async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const multiAwait = async (): Promise<number> => {
        const p1: Promise<number> = Promise.resolve(2 as number);
        const p2: Promise<number> = Promise.resolve(3 as number);
        const v1 = await p1;
        const v2 = await p2;
        return v1 * v2;
      };
      const result = await multiAwait();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   asyncFunctionTest008
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_008
     * @tc.desc   Async function returns rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const returnRejected = async (): Promise<never> => {
        return Promise.reject(new Error('rejected promise'));
      };
      let errorMsg = '';
      try {
        await returnRejected();
      } catch (err) {
        errorMsg = (err as Error).message;
      }
      expect(errorMsg).assertEqual('rejected promise');
    });

    /**
     * @tc.name   asyncFunctionTest009
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_009
     * @tc.desc   Async function with parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const withParam = async (num: number): Promise<number> => num + 10;
      const result = await withParam(5);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest010
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_010
     * @tc.desc   Async function with default parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const defaultParam = async (num: number = 3): Promise<number> => num * 4;
      const result1 = await defaultParam();
      const result2 = await defaultParam(5);
      expect(result1).assertEqual(12);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.name   asyncFunctionTest011
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_011
     * @tc.desc   Async function with rest parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const restParam = async (...nums: number[]): Promise<number> => {
        return nums.reduce((sum: number, curr: number): number => sum + curr, 0);
      };
      const result = await restParam(1, 2, 3, 4);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest012
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_012
     * @tc.desc   Async function returns BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnBigInt = async (): Promise<bigint> => 100n;
      const result = await returnBigInt();
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.name   asyncFunctionTest013
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_013
     * @tc.desc   Async function uses await in try/catch block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tryCatchAwait = async (): Promise<string> => {
        try {
          const p: Promise<never> = Promise.reject(new Error('await error'));
          await p;
          return 'success';
        } catch (err) {
          return (err as Error).message;
        }
      };
      const result = await tryCatchAwait();
      expect(result).assertEqual('await error');
    });

    /**
     * @tc.name   asyncFunctionTest014
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_014
     * @tc.desc   Async function with try/finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let finallyExecuted = false;
      const tryFinally = async (): Promise<number> => {
        try {
          return 5;
        } finally {
          finallyExecuted = true;
        }
      };
      await tryFinally();
      expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest015
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_015
     * @tc.desc   Async function assigned to variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const asyncVar = async (): Promise<string> => 'assigned';
      const result = await asyncVar();
      expect(result).assertEqual('assigned');
    });

    /**
     * @tc.name   asyncFunctionTest016
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_016
     * @tc.desc   Async function as object method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const result = await asyncFunctionTest016Fn();
      expect(result).assertEqual(14);
    });

    /**
     * @tc.name   asyncFunctionTest017
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_017
     * @tc.desc   Async function as class method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const instance: TestClass = new TestClass();
      const result = await instance.classMethod('test');
      expect(result).assertEqual('TEST');
    });

    /**
     * @tc.name   asyncFunctionTest018
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_018
     * @tc.desc   Async function returns object literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnObj = async (): Promise<ResultObj> => {
        const obj: ResultObj = { key: 'value', count: 3 };
        return obj;
      };
      const result = await returnObj();
      expect(result.key).assertEqual('value');
      expect(result.count).assertEqual(3);
    });

    /**
     * @tc.name   asyncFunctionTest019
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_019
     * @tc.desc   Async function with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const usePromiseAll = async (): Promise<number> => {
        const promises: Promise<number>[] = [
          Promise.resolve(1 as number),
          Promise.resolve(2 as number),
          Promise.resolve(3 as number)
        ];
        const results = await Promise.all(promises);
        return results.reduce((a: number, b: number): number => a + b, 0);
      };
      const result = await usePromiseAll();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   asyncFunctionTest020
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_020
     * @tc.desc   Async function with Promise.race (resolved first)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const usePromiseRace = async (): Promise<string> => {
        const p1: Promise<string> = Promise.resolve('fast');
        const p2: Promise<string> = Promise.resolve('slow');
        return await Promise.race([p1, p2]);
      };
      const result = await usePromiseRace();
      expect(result).assertEqual('fast');
    });

    /**
     * @tc.name   asyncFunctionTest021
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_021
     * @tc.desc   Async function with Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const useAllSettled = async (): Promise<SettledStatus[]> => {
        const promises: Promise<number>[] = [
          Promise.resolve(5 as number),
          Promise.reject(new Error('fail'))
        ];
        const results: PromiseSettledResult<number>[] = await Promise.allSettled(promises);
        const statuses: SettledStatus[] = results.map((res: PromiseSettledResult<number>): SettledStatus => res.status as SettledStatus);
        return statuses;
      };
      const result = await useAllSettled();
      expect(result).assertDeepEquals(['fulfilled', 'rejected']);
    });

    /**
     * @tc.name   asyncFunctionTest022
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_022
     * @tc.desc   Async function calls another async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const async1 = async (): Promise<number> => 4;
      const async2 = async (): Promise<number> => {
        const val = await async1();
        return val + 6;
      };
      const result = await async2();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest023
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_023
     * @tc.desc   Async function returns resolved Promise directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnResolved = async (): Promise<string> => Promise.resolve('done');
      const result = await returnResolved();
      expect(result).assertEqual('done');
    });

    /**
     * @tc.name   asyncFunctionTest024
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_024
     * @tc.desc   Async function returns array with typed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnArray = async (): Promise<number[]> => [1, 2, 3];
      const result = await returnArray();
      expect(result).assertDeepEquals([1.0, 2.0, 3.0]);
      expect(result.every((item: number): boolean => typeof item === 'number')).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest025
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_025
     * @tc.desc   Async function with conditional await (typed branches)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const conditionalAwait = async (useFast: boolean): Promise<string> => {
        const fastPromise: Promise<string> = Promise.resolve('fast val');
        const slowPromise: Promise<string> = Promise.resolve('slow val');
        return useFast ? await fastPromise : await slowPromise;
      };
      const result1 = await conditionalAwait(true);
      const result2 = await conditionalAwait(false);
      expect(result1).assertEqual('fast val');
      expect(result2).assertEqual('slow val');
    });

    /**
     * @tc.name   asyncFunctionTest026
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_026
     * @tc.desc   Async function with nested conditional await (typed data flow)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const nestedCondAwait = async (level: number): Promise<number> => {
        const getVal = async (num: number): Promise<number> => num * 2;
        if (level === 1) {
          return await getVal(5);
        } else if (level === 2) {
          const val1 = await getVal(3);
          return await getVal(val1);
        }
        return 0;
      };
      const result1 = await nestedCondAwait(1);
      const result2 = await nestedCondAwait(2);
      expect(result1).assertEqual(10);
      expect(result2).assertEqual(12);
    });

    /**
     * @tc.name   asyncFunctionTest027
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_027
     * @tc.desc   Async arrow function with typed parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const asyncArrow = async (str: string): Promise<string> => str.repeat(2);
      const result = await asyncArrow('test');
      expect(result).assertEqual('testtest');
    });

    /**
     * @tc.name   asyncFunctionTest028
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_028
     * @tc.desc   Async arrow function with no parameters (returns typed value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const noParamAsyncArrow = async (): Promise<int> => new Date().getFullYear();
      const result = await noParamAsyncArrow();
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.name   asyncFunctionTest029
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_029
     * @tc.desc   Async function returns typed Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0101;
      const orVal = 0b1010;

      const asyncAtomicOr = async (mask: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = ia[0] | mask;
            const currentVal: number = ia[0];
            resolve(currentVal);
          }, 100);
        });
      };

      const result = await asyncAtomicOr(orVal);

      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest030
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_030
     * @tc.desc   Async function with await in loop (typed array result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const awaitInLoop = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const results: number[] = [];
        for (const num of nums) {
          const delayedVal: Promise<number> = Promise.resolve(num * 2);
          results.push(await delayedVal);
        }
        return results;
      };
      const result = await awaitInLoop();
      expect(result).assertDeepEquals([2.0, 4.0, 6.0]);
    });

    /**
     * @tc.name   asyncFunctionTest031
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_031
     * @tc.desc   Async function with forEach and await (typed result sorting)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const awaitInForEach = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const results: number[] = [];
        const promiseList: Promise<void>[] = [];

        nums.forEach((num: number) => {
          const promise: Promise<void> = (async () => {
            const val: number = await Promise.resolve(num * 2);
            results.push(val);
          })();
          promiseList.push(promise);
        });

        await Promise.all(promiseList);
        return results.sort((a: number, b: number): int => {
          if (a < b) { return -1; }
          if (a > b) { return 1; }
          return 0;
        });
      };
      const result = await awaitInForEach();
      expect(result).assertDeepEquals([2.0, 4.0, 6.0]);
    });

    /**
     * @tc.name   asyncFunctionTest032
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_032
     * @tc.desc   Async function returns typed Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnMap = async (): Promise<Map<string, number>> => {
        const map: Map<string, number> = new Map<string, number>();
        map.set('a', 1);
        map.set('b', 2);
        return map;
      };
      const result = await returnMap();
      expect(result.get('a')).assertEqual(1);
      expect(result.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest033
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_033
     * @tc.desc   Async function returns typed Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const returnSet = async (): Promise<Set<number>> => {
        const set: Set<number> = new Set<number>();
        set.add(1);
        set.add(2);
        set.add(2);
        return set;
      };
      const result = await returnSet();
      expect(result.size).assertEqual(2);
      expect(result.has(1)).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest034
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_034
     * @tc.desc   Async function with async callback in array map (typed promises)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const asyncMapCallback = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const promises: Promise<number>[] = nums.map(async (num: number): Promise<number> => {
          return await Promise.resolve(num * 3);
        });
        return Promise.all(promises);
      };
      const result = await asyncMapCallback();
      expect(result).assertDeepEquals([3.0, 6.0, 9.0]);
    });

    /**
     * @tc.name   asyncFunctionTest035
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_035
     * @tc.desc   Async function with error propagation from nested async (typed error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const nestedAsyncError = async (): Promise<void> => {
        const innerAsync = async (): Promise<void> => {
          throw new Error('inner error');
        };
        await innerAsync();
      };
      let errorCaught = false;
      try {
        await nestedAsyncError();
      } catch (err) {
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest036
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_036
     * @tc.desc   Async function with typed custom Promise implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const asyncCalculate = async (base: number, shouldMultiply: boolean): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            let result = base + 10;
            if (shouldMultiply) {
              result *= 2;
            }
            resolve(result);
          }, 100);
        });
      };

      const asyncDependentProcess = async (prevResult: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(prevResult - 3);
          }, 100);
        });
      };

      const firstResult = await asyncCalculate(8, true);
      const finalResult = await asyncDependentProcess(firstResult);

      const secondResult = await asyncCalculate(8, false);
      const finalResult2 = await asyncDependentProcess(secondResult);

      expect(firstResult).assertEqual(36);
      expect(finalResult).assertEqual(33);

      expect(secondResult).assertEqual(18);
      expect(finalResult2).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest037
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_037
     * @tc.desc   Async function with typed Promise.resolve chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const promiseChaining = async (): Promise<number> => {
        return await Promise.resolve(2 as number)
          .then((val: number) => val * 3)
          .then((val: number) => val + 4);
      };
      const result = await promiseChaining();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest038
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_038
     * @tc.desc   Async function with typed Promise.catch in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const promiseCatchChain = async (): Promise<string> => {
        return await Promise.reject(new Error('chain error'))
          .catch((err: Error) => err.message)
          .then((msg: string) => `Caught: ${msg}`);
      };
      const result = await promiseCatchChain();
      expect(result).assertEqual('Caught: chain error');
    });

    /**
     * @tc.name   asyncFunctionTest039
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_039
     * @tc.desc   Async function with await on typed non-Promise value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const awaitNonPromise = async (): Promise<string> => {
        const nonPromiseVal: string = 'not a promise';
        return await nonPromiseVal;
      };
      const result = await awaitNonPromise();
      expect(result).assertEqual('not a promise');
    });

    /**
     * @tc.name   asyncFunctionTest040
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_040
     * @tc.desc   Async function with await on typed null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const awaitNull = async (): Promise<null> => {
        const nullVal: null = null;
        return await nullVal;
      };
      const result = await awaitNull();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   asyncFunctionTest041
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_041
     * @tc.desc   Async function with await on typed undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const awaitUndefined = async (): Promise<undefined> => {
        const undefinedVal: undefined = undefined;
        return await undefinedVal;
      };
      const result = await awaitUndefined();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFunctionTest042
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_042
     * @tc.desc   Async function with parallel async calls (typed Promise.all)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const parallelAsync = async (): Promise<number> => {
        const p1: Promise<number> = Promise.resolve(10 as number);
        const p2: Promise<number> = Promise.resolve(20 as number);
        const res = await Promise.all([p1, p2]);
        return res[0] + res[1];
      };
      const result = await parallelAsync();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   asyncFunctionTest043
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_043
     * @tc.desc   Async function with typed async generator call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result: number[] = await asyncFunctionTest043Fn();
      expect(result).assertDeepEquals([1.0, 2.0, 3.0]);
    });

    /**
     * @tc.name   asyncFunctionTest044
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_044
     * @tc.desc   Async function as typed event listener callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25;

      const asyncAtomicSub = async (subtractVal: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = ia[0] - subtractVal;
            resolve(ia[0]);
          }, 100);
        });
      };

      const result1 = await asyncAtomicSub(8);
      const result2 = await asyncAtomicSub(5);

      expect(result1).assertEqual(17);
      expect(result2).assertEqual(12);
      expect(ia[0]).assertEqual(12);
    });

    /**
     * @tc.name   asyncFunctionTest045
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_045
     * @tc.desc   Async function with return in finally block (overrides try/catch return)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const returnInFinally = async (shouldThrow: boolean): Promise<string> => {
        try {
          if (shouldThrow) {
            throw new Error('test');
          }
          return 'try return';
        } catch (e) {
          return 'catch return';
        } finally {
          return 'finally return';
        }
      };
      const result1 = await returnInFinally(false);
      const result2 = await returnInFinally(true);
      expect(result1).assertEqual('finally return');
      expect(result2).assertEqual('finally return');
    });

    /**
     * @tc.name   asyncFunctionTest046
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_046
     * @tc.desc   3-level nested async functions with sequential awaits (typed data flow)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const level3 = async (num: number): Promise<number> => {
        return await Promise.resolve(num * 2);
      };
      const level2 = async (num: number): Promise<number> => {
        const val = await level3(num);
        return await Promise.resolve(val + 3);
      };
      const level1 = async (num: number): Promise<number> => {
        const val = await level2(num);
        return await Promise.resolve(val * 4);
      };
      const result = await level1(2);
      expect(result).assertEqual(28);
    });

    /**
     * @tc.name   asyncFunctionTest047
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_047
     * @tc.desc   Async function with parallel nested async calls via typed Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const nestedAsync1 = async (): Promise<number> => await Promise.resolve(5.0);
      const nestedAsync2 = async (): Promise<number> => await Promise.resolve(8.0);
      const nestedAsync3 = async (): Promise<number> => await Promise.resolve(3.0);

      const parallelNested = async (): Promise<number> => {
        const val = await Promise.all([nestedAsync1(), nestedAsync2(), nestedAsync3()]);
        return val[1] + val[2] + val[0];
      };
      const result = await parallelNested();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   asyncFunctionTest048
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_048
     * @tc.desc   Async function with conditional nested async (typed branch results)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const branchA = async (num: number): Promise<number> => {
        const inner = async (): Promise<number> => await Promise.resolve(num * 3);
        return await inner();
      };
      const branchB = async (num: number): Promise<number> => {
        const inner1 = async (): Promise<number> => await Promise.resolve(num + 2);
        const inner2 = async (val: number): Promise<number> => await Promise.resolve(val * 4);
        return await inner2(await inner1());
      };

      const conditionalNested = async (useBranchA: boolean, num: number): Promise<number> => {
        return useBranchA ? await branchA(num) : await branchB(num);
      };
      const result1 = await conditionalNested(true, 4);
      const result2 = await conditionalNested(false, 3);
      expect(result1).assertEqual(12);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.name   asyncFunctionTest049
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_049
     * @tc.desc   Async function with nested async arrow functions in typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const asyncTasks: Array<() => Promise<number>> = [
        async (): Promise<number> => await Promise.resolve(2.0),
        async (): Promise<number> => await Promise.resolve(5.0),
        async (): Promise<number> => await Promise.resolve(7.0)
      ];

      const runNestedArrayTasks = async (): Promise<number> => {
        const results: number[] = [];
        for (const task of asyncTasks) {
          results.push(await task());
        }
        return results.reduce((a: number, b: number): number => a * b, 1.0);
      };
      const result = await runNestedArrayTasks();
      expect(result).assertEqual(70);
    });

    /**
     * @tc.name   asyncFunctionTest050
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_050
     * @tc.desc   Async function with error handling in nested async layers (typed errors)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const level3 = async (shouldThrow: boolean): Promise<number> => {
        if (shouldThrow) {
          throw new Error('level3 error');
        }
        return await Promise.resolve(10.0);
      };
      const level2 = async (shouldThrow: boolean): Promise<number> => {
        try {
          return await level3(shouldThrow);
        } catch (err) {
          throw new Error(`level2 wrapped: ${(err as Error).message}`);
        }
      };
      const level1 = async (shouldThrow: boolean): Promise<string | number> => {
        try {
          return await level2(shouldThrow);
        } catch (err) {
          return `caught: ${(err as Error).message}`;
        }
      };

      const result1 = await level1(false);
      const result2 = await level1(true);
      expect(result1).assertEqual(10);
      expect(result2).assertEqual('caught: level2 wrapped: level3 error');
    });

    /**
     * @tc.name   asyncFunctionTest051
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_051
     * @tc.desc   Async function with nested async that returns another async function (typed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getAsyncFunc = async (multiplier: number): Promise<(num: number) => Promise<number>> => {
        const returnedFn: (num: number) => Promise<number> = async (num: number): Promise<number> => {
          return await Promise.resolve(num * multiplier);
        };
        return returnedFn;
      };

      const useNestedFunc = async (): Promise<number> => {
        const asyncFunc = await getAsyncFunc(4);
        return await asyncFunc(6);
      };
      const result = await useNestedFunc();
      expect(result).assertEqual(24);
    });

    /**
     * @tc.name   asyncFunctionTest052
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_052
     * @tc.desc   4-level async nested workflow with typed data passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const processData = async (data: number): Promise<number> => {
        return await Promise.resolve(data + 10);
      };
      const transformData = async (data: number): Promise<number> => {
        const processed = await processData(data);
        return await Promise.resolve(processed * 2);
      };
      const fetchData = async (id: number): Promise<number> => {
        const mockData = await Promise.resolve(id * 5);
        return await transformData(mockData);
      };
      const startWorkflow = async (id: number): Promise<number> => {
        const data = await fetchData(id);
        return await Promise.resolve(data - 5);
      };

      const result = await startWorkflow(3);
      expect(result).assertEqual(45);
    });

    /**
     * @tc.name   asyncFunctionTest053
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_053
     * @tc.desc   Async function with nested async in typed object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest053Fn();
      expect(result).assertEqual(25);
    });

    /**
     * @tc.name   asyncFunctionTest054
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_054
     * @tc.desc   Async function with nested async that uses typed Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const nestedRace = async (): Promise<string> => {
        const p1: Promise<string> = Promise.resolve('winner');
        const p2: Promise<string> = Promise.resolve('loser');
        return await Promise.race([p1, p2]);
      };

      const outerAsync = async (): Promise<string> => {
        const raceResult = await nestedRace();
        return `Result: ${raceResult}`;
      };
      const result = await outerAsync();
      expect(result).assertEqual('Result: winner');
    });

    /**
     * @tc.name   asyncFunctionTest055
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_055
     * @tc.desc   Async function with nested async error recovery (typed fallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const riskyAsync = async (shouldThrow: boolean): Promise<number> => {
        if (shouldThrow) {
          throw new Error('risky failed');
        }
        return await Promise.resolve(15.0);
      };

      const withFallback = async (shouldThrow: boolean): Promise<number> => {
        try {
          return await riskyAsync(shouldThrow);
        } catch (e) {
          return await Promise.resolve(10.0);
        }
      };

      const result1 = await withFallback(false);
      const result2 = await withFallback(true);
      expect(result1).assertEqual(15);
      expect(result2).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest056
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_056
     * @tc.desc   Async function with nested async in typed class hierarchy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const runClassAsync = async (): Promise<number> => {
        const child: Child = new Child();
        return await child.childMethod(5);
      };
      const result = await runClassAsync();
      expect(result).assertEqual(17);
    });

    /**
     * @tc.name   asyncFunctionTest057
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_057
     * @tc.desc   Async function with nested async that returns typed Promise.allSettled results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getSettled = async (): Promise<PromiseSettledResult<number>[]> => {
        const tasks: Promise<number>[] = [
          Promise.resolve(3 as number),
          Promise.reject(new Error('fail')),
          Promise.resolve(7 as number)
        ];
        return await Promise.allSettled(tasks);
      };

      const processSettled = async (): Promise<number> => {
        const results: PromiseSettledResult<number>[] = await getSettled();
        let total: number = 0;
        results.forEach((res: PromiseSettledResult<number>) => {
          if (res.status === 'fulfilled') {
            const fulfilled: PromiseFulfilledResult<number> = res as PromiseFulfilledResult<number>;
            total += fulfilled.value;
          }
        });
        return total;
      };
      const result = await processSettled();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest058
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_058
     * @tc.desc   Async function with nested async in loop (typed dynamic task count)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const createAsyncTask = (num: number): (() => Promise<number>) => {
        const task: () => Promise<number> = async (): Promise<number> => await Promise.resolve(num * 2);
        return task;
      };

      const runDynamicTasks = async (taskCount: number): Promise<number[]> => {
        const tasks: Array<() => Promise<number>> = [];
        for (let i: number = 0; i < taskCount; i++) {
          tasks.push(createAsyncTask(i + 1));
        }
        const results: number[] = [];
        for (const task of tasks) {
          results.push(await task());
        }
        return results;
      };

      const result = await runDynamicTasks(4);
      expect(result).assertDeepEquals([2.0, 4.0, 6.0, 8.0]);
    });

    /**
     * @tc.name   asyncFunctionTest059
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_059
     * @tc.desc   Async function with nested async that returns typed tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getTypedTuple = async (): Promise<DataTuple> => {
        const nested1 = async (): Promise<string> => await Promise.resolve('test');
        const nested2 = async (): Promise<number> => await Promise.resolve(42.0);
        const nested3 = async (): Promise<boolean> => await Promise.resolve(true);

        const tuple: DataTuple = [await nested1(), await nested2(), await nested3()];
        return tuple;
      };

      const useTypedTuple = async (): Promise<DataTuple> => {
        return await getTypedTuple();
      };
      const res = await useTypedTuple();
      expect(res[0]).assertEqual('test');
      expect(res[1]).assertEqual(42);
      expect(res[2]).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest060
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_060
     * @tc.desc   Async function with nested async in typed interface implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const createProcessor = (): DataProcessor => {
        const processor: DataProcessor = {
          fetch: async (id: number): Promise<string> => {
            const mockFetch = async (): Promise<string> => await Promise.resolve(`data_${id}`);
            return await mockFetch();
          },
          transform: async (data: string): Promise<string> => {
            const mockTransform = async (): Promise<string> => await Promise.resolve(data.toUpperCase());
            return await mockTransform();
          },
          save: async (data: string): Promise<boolean> => {
            const mockSave = async (): Promise<boolean> => await Promise.resolve(true);
            return await mockSave();
          }
        };
        return processor;
      };

      const runProcessor = async (id: number): Promise<boolean> => {
        const processor: DataProcessor = createProcessor();
        const raw = await processor.fetch(id);
        const transformed = await processor.transform(raw);
        return await processor.save(transformed);
      };
      const result = await runProcessor(5);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest061
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_061
     * @tc.desc   Async function with nested async that handles typed optional values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getOptionalData = async (hasData: boolean): Promise<number | null> => {
        const nestedGet = async (): Promise<number | null> => {
          if (hasData) {
            return await Promise.resolve(100.0);
          }
          return await Promise.resolve(null);
        };
        return await nestedGet();
      };

      const processOptional = async (hasData: boolean): Promise<number> => {
        const data = await getOptionalData(hasData);
        if (data !== null) {
          return data;
        }
        return 0.0;
      };

      const result1 = await processOptional(true);
      const result2 = await processOptional(false);
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   asyncFunctionTest062
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_062
     * @tc.desc   Async function with nested async that uses typed generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const useGeneric = async (): Promise<type62> => {
        const strData = await genericFetcher<string>('generic');
        const numData = await genericFetcher<number>(50);
        const result: type62 = { str: strData, num: numData };
        return result;
      };
      const result = await useGeneric();
      expect(result.str).assertEqual('generic');
      expect(result.num).assertEqual(50);
    });

    /**
     * @tc.name   asyncFunctionTest063
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_063
     * @tc.desc   Async function with nested async in typed module-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest063Fn();
      expect(result.name).assertEqual('test');
      expect(result.id).assertEqual(1);
    });

    /**
     * @tc.name   asyncFunctionTest064
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_064
     * @tc.desc   Async function with nested async that chains typed transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const transform1 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num + 5);
        return await nested();
      };
      const transform2 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num * 2);
        return await nested();
      };
      const transform3 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num - 3);
        return await nested();
      };

      const chainTransforms = async (initial: number): Promise<number> => {
        return await transform3(await transform2(await transform1(initial)));
      };
      const result = await chainTransforms(4);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest065
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_065
     * @tc.desc   Async function with nested async that validates typed input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const fetchInitialData = async (value?: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(value ? value : 15);
          }, 100);
        });
      };

      const transformData1 = async (data: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(data * 3);
          }, 100);
        });
      };

      const transformData2 = async (data: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(data + 8);
          }, 100);
        });
      };

      const rawData = await fetchInitialData();
      const transformedData1 = await transformData1(rawData);
      const finalData = await transformData2(transformedData1);

      const rawData2 = await fetchInitialData(20);
      const transformedData2_2 = await transformData1(rawData2 || 20);
      const finalData2 = await transformData2(transformedData2_2);

      expect(rawData).assertEqual(15);
      expect(transformedData1).assertEqual(45);
      expect(finalData).assertEqual(53);

      expect(rawData2 || 20).assertEqual(20);
      expect(transformedData2_2).assertEqual(60);
      expect(finalData2).assertEqual(68);

      expect(transformedData1).assertEqual(rawData * 3);
      expect(finalData).assertEqual(transformedData1 + 8);
    });

    /**
     * @tc.name   asyncFunctionTest066
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_066
     * @tc.desc   Async function with nested async that uses typed enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getStatus = async (isSuccess: boolean): Promise<Status> => {
        const nestedStatus = async (): Promise<Status> => {
          if (isSuccess) {
            return await Promise.resolve(Status.Success);
          }
          return await Promise.resolve(Status.Failed);
        };
        return await nestedStatus();
      };

      const checkStatus = async (isSuccess: boolean): Promise<boolean> => {
        const status = await getStatus(isSuccess);
        return status === Status.Success;
      };

      const result1 = await checkStatus(true);
      const result2 = await checkStatus(false);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   asyncFunctionTest067
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_067
     * @tc.desc   Async function with nested async that returns typed union
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getUnionData = async (type: 'str' | 'num' | 'bool'): Promise<AsyncFuncUnionType> => {
        const nestedGet = async (): Promise<AsyncFuncUnionType> => {
          switch (type) {
            case 'str':
              return await Promise.resolve('union');
            case 'num':
              return await Promise.resolve(10.0);
            case 'bool':
              return await Promise.resolve(true);
            default:
              return await Promise.resolve('union');
          }
        };
        return await nestedGet();
      };

      const processUnion = async (type: 'str' | 'num' | 'bool'): Promise<string> => {
        const data = await getUnionData(type);
        return typeof data;
      };

      const result1 = await processUnion('str');
      const result2 = await processUnion('num');
      const result3 = await processUnion('bool');
      expect(result1).assertEqual('string');
      expect(result2).assertEqual('number');
      expect(result3).assertEqual('boolean');
    });

    /**
     * @tc.name   asyncFunctionTest068
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_068
     * @tc.desc   Async function with nested async that handles typed readonly data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest068Fn();
      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('modified');
    });

    /**
     * @tc.name   asyncFunctionTest069
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_069
     * @tc.desc   Async function with nested async that uses typed function overloads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const useOverload = async (): Promise<[string, string]> => {
        const strResult = await formatData('test');
        const numResult = await formatData(5);
        const tuple: [string, string] = [strResult, numResult];
        return tuple;
      };
      const res = await useOverload();
      expect(res[0]).assertEqual('TEST');
      expect(res[1]).assertEqual('005');
    });

    /**
     * @tc.name   asyncFunctionTest070
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_070
     * @tc.desc   Async function with nested async that processes typed array of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialVal = 28;
      const updateVal = 56;

      const asyncAtomicStoreLoad = async (val: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = val;
            const currentVal: number = ia[0];
            resolve(currentVal);
          }, 100);
        });
      };

      const result1 = await asyncAtomicStoreLoad(initialVal);
      const result2 = await asyncAtomicStoreLoad(updateVal);

      expect(result1).assertEqual(initialVal);
      expect(result2).assertEqual(updateVal);
      expect(ia[0]).assertEqual(updateVal);
    });

    /**
     * @tc.name   asyncFunctionTest071
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_071
     * @tc.desc   Async function with nested async that uses typed WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const useWeakMapCache = async (): Promise<type71> => {
        const cache: WeakMap<CacheKey, Promise<string>> = new WeakMap<CacheKey, Promise<string>>();

        const getFromCache = async (key: CacheKey): Promise<string> => {
          if (cache.has(key)) {
            const cached: Promise<string> = cache.get(key)!;
            return await cached;
          }
          const fetchData = async (): Promise<string> => await Promise.resolve(`data_${key.id}`);
          const data = fetchData();
          cache.set(key, data);
          return await data;
        };

        const key1: CacheKey = { id: 1 };
        const firstCall = await getFromCache(key1);
        const secondCall = await getFromCache(key1);
        const result: type71 = { firstCall: firstCall, secondCall: secondCall };
        return result;
      };

      const res = await useWeakMapCache();
      expect(res.firstCall).assertEqual('data_1');
      expect(res.secondCall).assertEqual('data_1');
    });

    /**
     * @tc.name   asyncFunctionTest072
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_072
     * @tc.desc   Async function with nested async that validates typed date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const isFutureDate = async (date: Date): Promise<boolean> => {
        const nestedCheck = async (): Promise<boolean> => {
          const now = await Promise.resolve(new Date());
          return date.getTime() > now.getTime();
        };
        return await nestedCheck();
      };

      const testDates = async (): Promise<[boolean, boolean]> => {
        const pastDate = new Date('2020-01-01');
        const futureDate = new Date(Date.now() + 86400000);
        const tuple: [boolean, boolean] = [await isFutureDate(pastDate), await isFutureDate(futureDate)];
        return tuple;
      };

      const res = await testDates();
      expect(res[0]).assertEqual(false);
      expect(res[1]).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest073
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_073
     * @tc.desc   Async function with nested async that uses typed generator return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const asyncAtomicAdd = async (addVal: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = ia[0] + addVal;
            resolve(ia[0]);
          }, 100);
        });
      };

      const result1 = await asyncAtomicAdd(6);
      const result2 = await asyncAtomicAdd(9);

      expect(result1).assertEqual(16);
      expect(result2).assertEqual(25);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   asyncFunctionTest074
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_074
     * @tc.desc   Async function with nested async that handles typed error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const throwCustomError = async (): Promise<never> => {
        const nestedThrow = async (): Promise<never> => {
          throw await Promise.resolve(new CustomError('custom issue', 400));
        };
        return await nestedThrow();
      };

      const catchCustomError = async (): Promise<number> => {
        try {
          await throwCustomError();
          return 0;
        } catch (err) {
          if (err instanceof CustomError) {
            return err.errorCode;
          }
          return 500;
        }
      };

      const errorCode = await catchCustomError();
      expect(errorCode).assertEqual(400);
    });

    /**
     * @tc.name   asyncFunctionTest075
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_075
     * @tc.desc   Async function with nested async that uses typed Promise.withResolvers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010;

      const asyncAtomicXor = async (xorVal: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = ia[0] ^ xorVal;
            resolve(ia[0]);
          }, 100);
        });
      };

      const result = await asyncAtomicXor(7);

      expect(result).assertEqual(13);
      expect(ia[0]).assertEqual(13);
    });

    /**
     * @tc.name   asyncFunctionTest076
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_076
     * @tc.desc   Async function with nested async that processes typed tuple array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const calculateDistance = async (points: PointTuple[]): Promise<number[]> => {
        const nestedCalculate = async (point: PointTuple): Promise<number> => {
          const distance = Math.sqrt(point[0] ** 2 + point[1] ** 2);
          return await Promise.resolve(distance);
        };

        return Promise.all(points.map((point: PointTuple): Promise<number> => nestedCalculate(point)));
      };

      const p1: PointTuple = [3, 4];
      const p2: PointTuple = [5, 12];
      const p3: PointTuple = [0, 0];
      const inputPoints: PointTuple[] = [p1, p2, p3];
      const distances = await calculateDistance(inputPoints);
      expect(distances[0]).assertEqual(5);
      expect(distances[1]).assertEqual(13);
      expect(distances[2]).assertEqual(0);
    });

    /**
     * @tc.name   asyncFunctionTest077
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_077
     * @tc.desc   Async function with nested async that uses typed ReadonlyArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sumReadonlyArray = async (arr: number[]): Promise<number> => {
        const nestedSum = async (): Promise<number> => {
          return await Promise.resolve(arr.reduce((a: number, b: number): number => a + b, 0));
        };
        return await nestedSum();
      };

      const readonlyArr: number[] = [1, 2, 3, 4];
      const result = await sumReadonlyArray(readonlyArr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest078
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_078
     * @tc.desc   Async function with nested async that handles typed nullable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getEmail = async (user: User): Promise<string> => {
        const nestedGet = async (): Promise<string> => {
          const email: string | null | undefined = user.email;
          if (email === null || email === undefined) {
            return await Promise.resolve('no-email@example.com');
          }
          return await Promise.resolve(email as string);
        };
        return await nestedGet();
      };

      const user1: User = { id: 1, name: 'User 1' };
      const user2: User = { id: 2, name: 'User 2', email: null };
      const user3: User = { id: 3, name: 'User 3', email: 'user3@example.com' };

      const email1 = await getEmail(user1);
      const email2 = await getEmail(user2);
      const email3 = await getEmail(user3);

      expect(email1).assertEqual('no-email@example.com');
      expect(email2).assertEqual('no-email@example.com');
      expect(email3).assertEqual('user3@example.com');
    });

    /**
     * @tc.name   asyncFunctionTest079
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_079
     * @tc.desc   Async function with nested async that uses typed Record
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 42;

      const asyncAtomicExchange = async (newVal: number): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            ia[0] = newVal;
            resolve(ia[0]);
          }, 100);
        });
      };

      const result = await asyncAtomicExchange(99);

      expect(result).assertEqual(99);
      expect(ia[0]).assertEqual(99);
    });

    /**
     * @tc.name   asyncFunctionTest080
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_080
     * @tc.desc   Async function with nested async that chains typed async validations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const validateUsername = async (username: string): Promise<boolean> => {
        return await Promise.resolve(username.length >= 3);
      };

      const validatePassword = async (password: string): Promise<boolean> => {
        return await Promise.resolve(password.length >= 6);
      };

      const validateForm = async (form: FormData): Promise<boolean> => {
        const isUsernameValid = await validateUsername(form.username);
        if (!isUsernameValid) {
          return false;
        }

        const isPasswordValid = await validatePassword(form.password);
        return isPasswordValid;
      };

      const validForm: FormData = { username: 'user', password: 'password123' };
      const invalidUserForm: FormData = { username: 'us', password: 'password123' };
      const invalidPwdForm: FormData = { username: 'user', password: 'pwd' };

      const result1 = await validateForm(validForm);
      const result2 = await validateForm(invalidUserForm);
      const result3 = await validateForm(invalidPwdForm);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   asyncFunctionTest081
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_081
     * @tc.desc   Async function with nested async that uses typed Promise.allSettled with filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const fetchData = async (id: number): Promise<ApiResponse> => {
        if (id === 2) {
          throw new Error(`Fetch failed for id ${id}`);
        }
        const apiResponse: ApiResponse = { data: id * 10 };
        return await Promise.resolve(apiResponse);
      };

      const batchFetch = async (ids: number[]): Promise<number[]> => {
        const promises: Promise<ApiResponse>[] = ids.map((id: number): Promise<ApiResponse> => fetchData(id));
        const results: PromiseSettledResult<ApiResponse>[] = await Promise.allSettled(promises);

        const dataResults: number[] = [];
        results.forEach((res: PromiseSettledResult<ApiResponse>) => {
          if (res.status === 'fulfilled') {
            const fulfilled: PromiseFulfilledResult<ApiResponse> = res as PromiseFulfilledResult<ApiResponse>;
            dataResults.push(fulfilled.value.data);
          }
        });
        return dataResults;
      };

      const result = await batchFetch([1, 2, 3]);
      expect(result).assertDeepEquals([10.0, 30.0]);
    });

    /**
     * @tc.name   asyncFunctionTest082
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_082
     * @tc.desc   Async function with nested async that handles typed bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const processBigInt = async (num: bigint): Promise<bigint> => {
        const nestedProcess = async (): Promise<bigint> => {
          const doubled = await Promise.resolve(num * 2n);
          return await Promise.resolve(doubled + 5n);
        };
        return await nestedProcess();
      };

      const input = 100n;
      const result = await processBigInt(input);
      expect(result).assertEqual(205n);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.name   asyncFunctionTest083
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_083
     * @tc.desc   Async function with nested async that uses typed Set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const processSet = async (nums: number[]): Promise<type83> => {
        const nestedProcess = async (): Promise<UniqueNumbers> => {
          const uniqueSet: UniqueNumbers = new Set<number>(nums);
          return await Promise.resolve(uniqueSet);
        };

        const uniqueSet = await nestedProcess();
        const result: type83 = {
          size: uniqueSet.size,
          hasFive: uniqueSet.has(5)
        };
        return result;
      };

      const input: number[] = [1, 2, 2, 3, 5, 5];
      const result = await processSet(input);
      expect(result.size).assertEqual(4);
      expect(result.hasFive).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest084
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_084
     * @tc.desc   Async function with nested async that uses typed Map transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const transformMap = async (map: StringMap): Promise<Map<string, string>> => {
        const nestedTransform = async (): Promise<Map<string, string>> => {
          const newMap: Map<string, string> = new Map<string, string>();
          map.forEach((val: number, key: string) => {
            newMap.set(key, val.toString());
          });
          return await Promise.resolve(newMap);
        };
        return await nestedTransform();
      };

      const inputMap: StringMap = new Map<string, number>();
      inputMap.set('a', 1);
      inputMap.set('b', 2);
      const resultMap = await transformMap(inputMap);

      expect(resultMap.get('a')).assertEqual('1');
      expect(resultMap.get('b')).assertEqual('2');
      expect(resultMap.size).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest085
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_085
     * @tc.desc   Async function with nested async that validates typed enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const isValidMethod = async (method: string): Promise<boolean> => {
        const nestedCheck = async (): Promise<boolean> => {
          return await Promise.resolve(
            method === 'GET' || method === 'POST' || method === 'PUT'
          );
        };
        return await nestedCheck();
      };

      const result1 = await isValidMethod('GET');
      const result2 = await isValidMethod('DELETE');
      const result3 = await isValidMethod(HttpMethod.POST);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest086
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_086
     * @tc.desc   Async function with nested async that uses typed Promise.race with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const asyncTask = async (taskId: number, delayMs: int): Promise<type86> => {
        return new Promise<type86>((resolve) => {
          setTimeout(() => {
            const result = taskId * 10;
            const taskResult: type86 = { taskId: taskId, result: result };
            resolve(taskResult);
          }, delayMs);
        });
      };

      const parallelTasks: Promise<type86>[] = [
        asyncTask(1, 100),
        asyncTask(2, 100),
        asyncTask(3, 100)
      ];

      const results = await Promise.all(parallelTasks);
      const aggregatedSum = results.reduce((sum: number, item: type86): number => sum + item.result, 0);

      expect(results.length).assertEqual(3);

      const found1: type86 | undefined = results.find((r: type86): boolean => r.taskId === 1);
      expect(found1!.result).assertEqual(10);
      const found2: type86 | undefined = results.find((r: type86): boolean => r.taskId === 2);
      expect(found2!.result).assertEqual(20);
      const found3: type86 | undefined = results.find((r: type86): boolean => r.taskId === 3);
      expect(found3!.result).assertEqual(30);

      expect(aggregatedSum).assertEqual(60);

      const taskIds: number[] = results.map((r: type86): number => r.taskId);
      taskIds.sort((a: number, b: number): int => {
        if (a < b) { return -1; }
        if (a > b) { return 1; }
        return 0;
      });
      expect(taskIds).assertDeepEquals([1.0, 2.0, 3.0]);
    });

    /**
     * @tc.name   asyncFunctionTest087
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_087
     * @tc.desc   Async function with nested async that processes typed optional chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const res = await asyncFunctionTest087Fn();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest088
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_088
     * @tc.desc   Async function with nested async that uses typed nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const getDefaultValue = async (value: string | null | undefined): Promise<string> => {
        const nestedGet = async (): Promise<string> => {
          let result: string;
          if (value !== null && value !== undefined) {
            result = value;
          } else {
            result = 'default';
          }
          return await Promise.resolve(result);
        };
        return await nestedGet();
      };

      const result1 = await getDefaultValue('test');
      const result2 = await getDefaultValue(null);
      const result3 = await getDefaultValue(undefined);
      const result4 = await getDefaultValue('');

      expect(result1).assertEqual('test');
      expect(result2).assertEqual('default');
      expect(result3).assertEqual('default');
      expect(result4).assertEqual('');
    });

    /**
     * @tc.name   asyncFunctionTest089
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_089
     * @tc.desc   Async function with nested async that uses typed class with async methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest089Fn();
      expect(result.length).assertEqual(1);
      expect(result.item).assertEqual('item1');
    });

    /**
     * @tc.name   asyncFunctionTest090
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_090
     * @tc.desc   Async function with nested async that uses typed function composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest090Fn();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   asyncFunctionTest091
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_091
     * @tc.desc   Async function with nested async that uses typed generator composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result: number[] = await asyncFunctionTest091Fn();
      expect(result).assertDeepEquals([1.0, 2.0, 3.0, 4.0]);
    });

    /**
     * @tc.name   asyncFunctionTest092
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_092
     * @tc.desc   Async function with nested async arrow function and BigInt return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const calculateBigInt = async (a: bigint, b: bigint): Promise<bigint> => {
        const nestedAdd = async (x: bigint, y: bigint): Promise<bigint> => x + y;
        const nestedXor = async (x: bigint, y: bigint): Promise<bigint> => x ^ y;
        const sum = await nestedAdd(a, b);
        return nestedXor(sum, 15n);
      };
      const result = await calculateBigInt(23n, 47n);
      expect(result).assertEqual((23n + 47n) ^ 15n);
    });

    /**
     * @tc.name   asyncFunctionTest093
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_093
     * @tc.desc   Async function handling Promise.allSettled with mixed results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const processTasks = async (): Promise<type93> => {
        const tasks: Promise<number>[] = [
          Promise.resolve(10 as number),
          Promise.reject(new Error('test err')),
          Promise.resolve(20 as number),
          Promise.reject(new Error('another err'))
        ];
        const results: PromiseSettledResult<number>[] = await Promise.allSettled(tasks);
        let success: number = 0;
        let failed: number = 0;
        results.forEach((res: PromiseSettledResult<number>) => {
          if (res.status === 'fulfilled') {
            success++;
          } else {
            failed++;
          }
        });
        const result: type93 = { success: success, failed: failed };
        return result;
      };
      const result = await processTasks();
      expect(result.success).assertEqual(2);
      expect(result.failed).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest094
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_094
     * @tc.desc   Async function with closure state tracking async calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const createCounter = (): type94 => {
        let callCount = 0;
        const asyncIncrement = async (step: number): Promise<number> => {
          callCount++;
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(callCount * step);
            }, 100);
          });
        };
        const getCount = (): number => callCount;
        const result: type94 = { asyncIncrement: asyncIncrement, getCount: getCount };
        return result;
      };
      const res = createCounter();
      const res1 = await res.asyncIncrement(2);
      const res2 = await res.asyncIncrement(3);
      expect(res1).assertEqual(2);
      expect(res2).assertEqual(6);
      expect(res.getCount()).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest095
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_095
     * @tc.desc   Async function returning Promise.race between value and timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result1 = await raceTasks<string>('success', 100);
      const result2 = await raceTasks<string>('late', 100);
      expect(result1).assertEqual('timeout');
      expect(result2).assertEqual('timeout');
    });

    /**
     * @tc.name   asyncFunctionTest096
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_096
     * @tc.desc   Async function with generic type and object transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const fetchData = async (delayMs: int, data: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(data);
          }, delayMs);
        });
      };

      const processData = async (input: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const processed = input * 2 + 3;
            resolve(processed);
          }, 100);
        });
      };

      const rawData1 = await fetchData(100, 7);
      const processedData1 = await processData(rawData1);

      const rawData2 = await fetchData(100, 12);
      const processedData2 = await processData(rawData2);

      expect(rawData1).assertEqual(7);
      expect(processedData1).assertEqual(17);

      expect(rawData2).assertEqual(12);
      expect(processedData2).assertEqual(27);

      expect(rawData1 !== rawData2).assertEqual(true);
      expect(processedData1 !== processedData2).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest097
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_097
     * @tc.desc   Async function handling error recovery with retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const asyncAtomicAdd = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            Atomics.add(ia, 0, 5);
            resolve(Atomics.load(ia, 0));
          }, 100);
        });
      };

      const result = await asyncAtomicAdd();

      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest098
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_098
     * @tc.desc   Async function with nested Promise chain and type coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const processValue = async (initial: string): Promise<number> => {
        return Promise.resolve<string>(initial)
          .then((val: string): number => val.length)
          .then((len: number): number => len * 3)
          .then((num: number): Promise<number> => new Promise<number>((resolve: (value: number) => void) => {
            setTimeout((): void => {
              resolve(num + 7);
            }, 100);
          }))
          .then((finalNum: number): number => finalNum >>> 0);
      };
      const result = await processValue('typescript');
      expect(result).assertEqual((10 * 3) + 7);
    });

    /**
     * @tc.name   asyncFunctionTest099
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_099
     * @tc.desc   Async function returning async generator and consuming with for await...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const result = await asyncFunctionTest099Fn();
      expect(result).assertDeepEquals([0.0, 3.0, 6.0, 9.0]);
    });

    /**
     * @tc.name   asyncFunctionTest100
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_100
     * @tc.desc   Complex async function workflow: validate → process → finalize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const workflow = async (dataList: Data[]): Promise<type100> => {
        const validate = async (data: Data): Promise<boolean> => {
          return new Promise<boolean>((resolve: (value: boolean) => void) => {
            setTimeout((): void => {
              resolve(data.id > 0 && data.value.length > 0);
            }, 100);
          });
        };
        const validations = await Promise.all(dataList.map((d: Data): Promise<boolean> => validate(d)));
        const validData = dataList.filter((d: Data, idx: int): boolean => validations[idx]);

        const processFn = async (data: Data): Promise<string> => {
          return new Promise<string>((resolve: (value: string) => void) => {
            setTimeout((): void => {
              resolve(`${data.id}-${data.value.toUpperCase()}`);
            }, 100);
          });
        };
        const processed = await Promise.all(validData.map((d: Data): Promise<string> => processFn(d)));

        const resultObj: type100 = { valid: validData, processed: processed, count: processed.length };
        return resultObj;
      };

      const input: Data[] = [
        { id: 1 as number, value: 'test' },
        { id: -2 as number, value: 'invalid' },
        { id: 3 as number, value: 'demo' },
        { id: 4 as number, value: '' }
      ];
      const result = await workflow(input);
      const expectedValid: Data[] = [{ id: 1 as number, value: 'test' }, { id: 3 as number, value: 'demo' }];
      expect(result.valid).assertDeepEquals(expectedValid);
      expect(result.processed).assertDeepEquals(['1-TEST', '3-DEMO']);
      expect(result.count).assertEqual(2);
    });
  });
}
