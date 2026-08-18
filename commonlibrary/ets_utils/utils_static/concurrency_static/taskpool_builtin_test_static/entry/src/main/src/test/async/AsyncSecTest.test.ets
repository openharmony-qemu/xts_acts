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
class ApiConfig {
  verbose: boolean = false;
}

class ApiResponse {
  code: number = 0;
}
class UserProfile {
  name: string = '';
  roleId: number = 0;
}

class DetailedUser {
  name: string = '';
  roleId: number = 0;
  permissions: string[] = [];
}


class CapturedArgs {
  id: number = 0;
  config: ApiConfig | null = null;
}
class UserSession {
  userId: number = 0;
  data: string = '';
}

class SearchState {
  lastRequestId: number = 0;
  displayValue: string = '';
}


class BankAccount {
  balance: number = 100;
  isLocked: boolean = false;
}
class AsyncTaskManager {
  isProcessing: boolean = false;
  executionCount: number = 0;

  async doWork(): Promise<string> {
    if (this.isProcessing) {
      return 'Ignored';
    }

    this.isProcessing = true;

    try {
      await sleep(500);
      this.executionCount++;
      this.isProcessing = false;
      return 'Completed';
    } catch (e) {
      console.info(`AsyncSecTest doWork catch error: ${JSON.stringify(e)}`);
      this.isProcessing = false;
      throw e;
    }
  }
}
class DatabaseError extends Error {
  errorCode: number = 0;
  constructor(msg: string, code: number) {
    super(msg);
    this.errorCode = code;
  }
}
class NetworkError extends Error {
  statusCode: number = 0;
  url: string = '';

  constructor(message: string, code: number, url: string) {
    super(message);
    this.name = 'NetworkError';
    this.statusCode = code;
    this.url = url;
  }
}
class ServiceError extends Error {
  errorCode: string = '';
  retryable: boolean = false;

  constructor(msg: string, code: string, canRetry: boolean) {
    super(msg);
    this.name = 'ServiceError';
    this.errorCode = code;
    this.retryable = canRetry;
  }
}
class UserData {
  id: number = 1;
}


class dbConnection {
  isOpen: boolean = false;

  open(): void {
    this.isOpen = true;
  }

  close(): void {
    this.isOpen = false;
  }
}
class SystemLock {
  isLocked: boolean = false;
}
class AppConfig {
  theme: string = 'light';
  retries: number = 0;
}

class StateManager {
  isLoading: boolean = false;
}

class FileStorage {
  storedFiles: string[] = [];

  async upload(filename: string): Promise<void> {
    try {
      await sleep(100);
      this.storedFiles.push(filename);
    } catch (e) {
      console.info(`AsyncSecTest upload catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }

  async delete(filename: string): Promise<void> {
    try {
      await sleep(100);
      const index = this.storedFiles.indexOf(filename);
      if (index > -1) {
        this.storedFiles.splice(index, 1);
      }
    } catch (e) {
      console.info(`AsyncSecTest delete catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}
class PaymentError extends Error {
  transactionId: string;
  errorCode: number;

  constructor(msg: string, id: string, code: number) {
    super(msg);
    this.name = 'PaymentError';
    this.transactionId = id;
    this.errorCode = code;
  }
}

class BaseEntity {
  id: number = 0;
  createdAt: number = 0;
}

class UserEntity extends BaseEntity {
  username: string = '';
}

class ProductEntity extends BaseEntity {
  sku: string = '';
}
class ConfigObj {
  mode: string = '';
  active: boolean = false;
}
class UserProfile038 {
  id: number = 0;
  meta: Map<string, string> = new Map<string, string>();
}
class AsyncCalculator {
  multiplier: number = 10;
  baseValue: number = 5;

  async innerCompute(input: number): Promise<number> {
    try {
      await sleep(100);
      return input * this.multiplier;
    } catch (e) {
      console.info(`AsyncSecTest innerCompute catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }

  async calculate(input: int): Promise<number> {
    try {
      const partial: number = this.baseValue + input;
      return await this.innerCompute(partial);
    } catch (e) {
      console.info(`AsyncSecTest calculate catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}

class InputWrapper {
  strVal: string | null | undefined = null;
  numVal: number = 0;
}


class DataItem {
  id: number = 0;
  payload: string = '';
}
class TaskContext {
  isCancelled: boolean = false;
  resultData: string = 'Initial';
}

class ServiceMock {
  callCount: number = 0;
  lastCallTime: number = 0;
}

class CancelError extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'CancelError';
  }
}

class CancelSignal {
  isAborted: boolean = false;

  abort(): void {
    this.isAborted = true;
  }

  check(): void {
    if (this.isAborted) {
      throw new CancelError('Operation_Aborted');
    }
  }
}

class CancelError048 extends Error {
  constructor() { super('Aborted'); }
}

class CancelToken {
  isCancelled: boolean = false;
  cancel(): void { this.isCancelled = true; }
}

class SharedLock {
  isActive: boolean = false;
  acquire(): void { this.isActive = true; }
  release(): void { this.isActive = false; }
}

class ProgressTracker {
  completedCount: number = 0;
}
class ServiceManager {
  state: string = 'IDLE';
  initTimestamp: number = 0;
  operationCount: number = 0;

  async initialize(): Promise<string> {
    if (this.state === 'READY') {
      return 'Already_Ready';
    }

    try {
      await sleep(100);
      this.state = 'READY';
      this.initTimestamp = new Date().getTime();
      this.operationCount++;
      return 'Initialization_Complete';
    } catch (e) {
      console.info(`AsyncSecTest initialize catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}
class UnstableService {
  failureThreshold: number;
  callCount: number = 0;

  constructor(failuresBeforeSuccess: number) {
    this.failureThreshold = failuresBeforeSuccess;
  }

  async request(): Promise<string> {
    this.callCount++;
    try {
      await sleep(100);
      if (this.callCount <= this.failureThreshold) {
        throw new Error('Service_Unavailable_503');
      }
      return 'Success_Data';
    } catch (e) {
      console.info(`AsyncSecTest request catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }
}

class AsyncSecBox<T> {
  value: T;
  constructor(val: T) {
    this.value = val;
  }
}

class Inventory {
  stock: number = 100;
  _isLocked: boolean = false;
  _waitingResolvers: Array<(value: void) => void> = [];

  async lock(): Promise<void> {
    if (!this._isLocked) {
      this._isLocked = true;
      return;
    }
    try {
      await new Promise<void>((resolve) => {
        this._waitingResolvers.push(resolve);
      });
    } catch (e) {
      console.info(`AsyncSecTest lock catch error: ${JSON.stringify(e)}`);
      throw e;
    }
  }

  unlock(): void {
    if (this._waitingResolvers.length > 0) {
      const next = this._waitingResolvers.shift();
      if (next) next(undefined);
    } else {
      this._isLocked = false;
    }
  }
}

// Top-level generic async functions (migrated from local arrow functions in it() blocks)

async function validateAndReturn0023<T>(input: T, shouldFail: boolean): Promise<T> {
  try {
    await sleep(100);
    if (shouldFail) {
      throw new Error(`Validation failed`);
    }
    return input;
  } catch (e) {
    console.info(`AsyncSecTest validateAndReturn0023 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function innerIdentity0034<T>(item: T): Promise<T> {
  try {
    await sleep(100);
    return item;
  } catch (e) {
    console.info(`AsyncSecTest innerIdentity0034 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function middleWrapper0034<T>(item: T): Promise<T> {
  try {
    const result = await innerIdentity0034<T>(item);
    return result as T;
  } catch (e) {
    console.info(`AsyncSecTest middleWrapper0034 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function outerWrapper0034<T>(item: T): Promise<T> {
  try {
    return (await middleWrapper0034<T>(item)) as T;
  } catch (e) {
    console.info(`AsyncSecTest outerWrapper0034 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function returnDirect0035<T>(val: T): Promise<T> {
  return val;
}

async function returnPromise0035<T>(val: T): Promise<T> {
  try {
    return (await Promise.resolve(val)) as T;
  } catch (e) {
    console.info(`AsyncSecTest returnPromise0035 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function returnAwait0035<T>(val: T): Promise<T> {
  try {
    return (await Promise.resolve(val)) as T;
  } catch (e) {
    console.info(`AsyncSecTest returnAwait0035 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function updateTimestamp0036<T extends BaseEntity>(entity: T): Promise<T> {
  try {
    await sleep(100);
    entity.createdAt = 1234567890;
    return entity;
  } catch (e) {
    console.info(`AsyncSecTest updateTimestamp0036 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

async function processEntity0036<T extends BaseEntity>(entity: T): Promise<T> {
  try {
    if (entity.id <= 0) {
      throw new Error('Invalid ID');
    }
    return (await updateTimestamp0036<T>(entity)) as T;
  } catch (e) {
    console.info(`AsyncSecTest processEntity0036 catch error: ${JSON.stringify(e)}`);
    throw e;
  }
}

export default function asyncSecTest(): void {
  describe('asyncSecTest', () => {
    afterEach((): void => { })
    afterAll((): void => { })
    /**
     * @tc.name   asyncSecTest0001
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0001
     * @tc.desc   Verify async dependency call counts and caching mechanism
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let dbCallCount: int = 0;
        const mockDatabaseFetch = async (key: string): Promise<string> => {
          try {
            dbCallCount++;
            return await Promise.resolve(`Value_for_${key}`);
          } catch (e) {
            console.info(`asyncSecTest0001 mockDatabaseFetch catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const cache: Map<string, string> = new Map<string, string>();

        const getDataWithCache = async (key: string): Promise<string> => {
          try {
            if (cache.has(key)) {
              return Promise.resolve(cache.get(key)!);
            }
            const result = await mockDatabaseFetch(key);
            cache.set(key, result);
            return result;
          } catch (e) {
            console.info(`asyncSecTest0001 getDataWithCache catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const val1 = await getDataWithCache('user_1');
        expect(val1).assertEqual('Value_for_user_1');
        expect(dbCallCount).assertEqual(1);

        const val2 = await getDataWithCache('user_1');
        expect(val2).assertEqual('Value_for_user_1');
        expect(dbCallCount).assertEqual(1);

        const val3 = await getDataWithCache('user_2');
        expect(val3).assertEqual('Value_for_user_2');
        expect(dbCallCount).assertEqual(2);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0002
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0002
     * @tc.desc   Verify parameter passthrough correctness and return value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        // Define explicit classes to avoid "Object literals cannot be used as type declarations"
        let capturedArgs: CapturedArgs = new CapturedArgs();

        const externalApi = async (id: number, config: ApiConfig): Promise<ApiResponse> => {
          try {
            capturedArgs.id = id;
            capturedArgs.config = config;

            const response = new ApiResponse();
            response.code = 200;
            return await Promise.resolve(response);
          } catch (e) {
            console.info(`asyncSecTest0002 externalApi catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const businessService = async (userId: number): Promise<string> => {
          try {
            const config = new ApiConfig();
            config.verbose = true;

            const result = await externalApi(userId, config);

            if (result.code === 200) {
              return 'Success';
            } else {
              return 'Failure';
            }
          } catch (e) {
            console.info(`asyncSecTest0002 businessService catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const status = await businessService(12345);

        expect(capturedArgs.id).assertEqual(12345);
        expect(capturedArgs.config !== null).assertTrue();
        if (capturedArgs.config) {
          expect(capturedArgs.config?.verbose).assertEqual(true);
        }

        expect(status).assertEqual('Success');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0003
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0003
     * @tc.desc   Verify multiple async dependencies: Sequential linkage and Concurrent aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const fetchUserProfile = async (id: number): Promise<UserProfile> => {
          try {
            const profile = new UserProfile();
            profile.name = 'Alice';
            profile.roleId = 99;
            return await Promise.resolve(profile);
          } catch (e) {
            console.info(`asyncSecTest0003 fetchUserProfile catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const fetchPermissions = async (roleId: number): Promise<string[]> => {
          try {
            return await Promise.resolve(roleId === 99 ? ['admin', 'write'] : ['read']);
          } catch (e) {
            console.info(`asyncSecTest0003 fetchPermissions catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const fetchSystemStatus = async (): Promise<string> => {
          try {
            return await Promise.resolve('Online');
          } catch (e) {
            console.info(`asyncSecTest0003 fetchSystemStatus catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const getDetailedUser = async (id: number): Promise<DetailedUser> => {
          try {
            const user = await fetchUserProfile(id);
            const perms = await fetchPermissions(user.roleId);

            const detailed = new DetailedUser();
            detailed.name = user.name;
            detailed.roleId = user.roleId;
            detailed.permissions = perms;

            return detailed;
          } catch (e) {
            console.info(`asyncSecTest0003 getDetailedUser catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const detailedUser = await getDetailedUser(1);
        expect(detailedUser.name).assertEqual('Alice');
        expect(detailedUser.permissions.length).assertEqual(2);
        expect(detailedUser.permissions[0]).assertEqual('admin');

        const getDashboardData = async (): Promise<String> => {
          try {
            const results: Array<String|UserProfile> = await Promise.all([
              fetchSystemStatus(),
              fetchUserProfile(1)
            ]);

            const status = results[0] as string;
            const user = results[1] as UserProfile;

            return `System: ${status}, User: ${user.name}`;
          } catch (e) {
            console.info(`asyncSecTest0003 getDashboardData catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const dashboard = await getDashboardData();
        expect(dashboard).assertEqual('System: Online, User: Alice');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0004
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0004
     * @tc.desc   Test Promise.all result order consistency with input order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const fastTask = async (): Promise<string> => {
          try {
            await sleep(100);
            return 'Fast';
          } catch (e) {
            console.info(`asyncSecTest0004 fastTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const slowTask = async (): Promise<string> => {
          try {
            await sleep(500);
            return 'Slow';
          } catch (e) {
            console.info(`asyncSecTest0004 slowTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const mediumTask = async (): Promise<string> => {
          try {
            await sleep(300);
            return 'Medium';
          } catch (e) {
            console.info(`asyncSecTest0004 mediumTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const results = await Promise.all([slowTask(), fastTask(), mediumTask()]);

        expect(results.length).assertEqual(3);

        expect(results[0]).assertEqual('Slow');
        expect(results[1]).assertEqual('Fast');
        expect(results[2]).assertEqual('Medium');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0005
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0005
     * @tc.desc   Test Promise.race returns the fastest result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const WINNER_VAL = 'Winner';
        const LOSER_VAL = 'Loser';

        const pFast = Promise.resolve<string>(WINNER_VAL);
        const pSlow = (async (): Promise<string> => {
          try {
            await sleep(100);
            return LOSER_VAL;
          } catch (e) {
            console.info(`asyncSecTest0005 pSlow catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        })();

        const result = await Promise.race([pSlow, pFast]);

        expect(result).assertEqual(WINNER_VAL);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0006
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0006
     * @tc.desc   Test Promise.allSettled for success/failure classification and error isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const pSuccess1 = Promise.resolve(100);
        const pFail = Promise.reject(Error('Error_Reason'));
        const pSuccess2 = (async (): Promise<number> => {
          try {
            await sleep(200);
            return 200;
          } catch (e) {
            console.info(`asyncSecTest0006 pSuccess2 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        })();

        const results = await Promise.allSettled([pSuccess1, pFail, pSuccess2]);

        expect(results.length).assertEqual(3);

        const res0 = results[0];
        expect(res0.status).assertEqual('fulfilled');
        if (res0.status === 'fulfilled') {
          expect((res0 as PromiseFulfilledResult<Int|Double>).value).assertEqual(100);
        }

        const res1 = results[1];
        expect(res1.status).assertEqual('rejected');
        if (res1.status === 'rejected') {
          expect((res1 as PromiseRejectedResult).reason.toString()).assertEqual('Error: Error_Reason');
        }

        const res2 = results[2];
        expect(res2.status).assertEqual('fulfilled');
        if (res2.status === 'fulfilled') {
          expect((res2 as PromiseFulfilledResult<Int|Double>).value).assertEqual(200);
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0007
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0007
     * @tc.desc   Verify await blocks subsequent code and executes multiple awaits linearly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const logs: string[] = [];

        const doTask = async (name: string, delay: int): Promise<void> => {
          try {
            await sleep(delay);
            logs.push(`Finished_${name}`);
          } catch (e) {
            console.info(`asyncSecTest0007 doTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const processSequence = async (): Promise<void> => {
          try {
            logs.push('Start');

            await doTask('A', 50);

            logs.push('Between_A_and_B');

            await doTask('B', 20);

            logs.push('End');
          } catch (e) {
            console.info(`asyncSecTest0007 processSequence catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await processSequence();

        expect(logs.length).assertEqual(5);
        expect(logs[0]).assertEqual('Start');
        expect(logs[1]).assertEqual('Finished_A');
        expect(logs[2]).assertEqual('Between_A_and_B');
        expect(logs[3]).assertEqual('Finished_B');
        expect(logs[4]).assertEqual('End');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0008
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0008
     * @tc.desc   Verify await on non-Promise values preserves their values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const numResult = await 123;
        const strResult = await 'NonBlocking';
        const boolResult = await true;

        expect(numResult).assertEqual(123);
        expect(strResult).assertEqual('NonBlocking');
        expect(boolResult).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0009
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0009
     * @tc.desc   Verify execution order of nested async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const executionLog: string[] = [];

        // Inner async function
        const innerTask = async (): Promise<void> => {
          try {
            executionLog.push('Inner_Start');
            // Simulate work
            await sleep(100);
            executionLog.push('Inner_End');
          } catch (e) {
            console.info(`asyncSecTest0009 innerTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        // Outer async function calling inner
        const outerTask = async (): Promise<void> => {
          try {
            executionLog.push('Outer_Start');

            // This await ensures Outer pauses until Inner completes fully
            await innerTask();

            executionLog.push('Outer_End');
          } catch (e) {
            console.info(`asyncSecTest0009 outerTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await outerTask();

        // Verify the precise nesting order (Stack-like behavior for execution flow)
        expect(executionLog.length).assertEqual(4);
        expect(executionLog[0]).assertEqual('Outer_Start');
        expect(executionLog[1]).assertEqual('Inner_Start');
        expect(executionLog[2]).assertEqual('Inner_End'); // Must happen before Outer_End
        expect(executionLog[3]).assertEqual('Outer_End');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0010
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0010
     * @tc.desc   Verify 'for...of' loop with await executes strictly sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const inputs: number[] = [1, 2, 3];
        const trace: string[] = [];

        const processItem = async (id: number, delayMs: int): Promise<void> => {
          try {
            trace.push(`Start_${id}`);
            await sleep(delayMs);
            trace.push(`End_${id}`);
          } catch (e) {
            console.info(`asyncSecTest0010 processItem catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const runLoop = async (): Promise<void> => {
          try {
            const delays = [40, 10, 10];

            let index: int = 0;
            for (const id of inputs) {
              await processItem(id, delays[index]);
              index++;
            }
          } catch (e) {
            console.info(`asyncSecTest0010 runLoop catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await runLoop();
        expect(trace.length).assertEqual(6);

        expect(trace[0]).assertEqual('Start_1');
        expect(trace[1]).assertEqual('End_1');

        expect(trace[2]).assertEqual('Start_2');
        expect(trace[3]).assertEqual('End_2');

        expect(trace[4]).assertEqual('Start_3');
        expect(trace[5]).assertEqual('End_3');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0011
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0011
     * @tc.desc   Verify logic correctness under high concurrency (100 parallel tasks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const taskCount: int = 100;
        const tasks: Promise<number>[] = [];

        for (let i: int = 0; i < taskCount; i++) {
          const task = async (index: number): Promise<number> => {
            try {
              await sleep(100);
              return index;
            } catch (e) {
              console.info(`asyncSecTest0011 task catch error: ${JSON.stringify(e)}`);
              throw e;
            }
          };
          tasks.push(task(i));
        }

        const results = await Promise.all(tasks);

        expect(results.length).assertEqual(taskCount);

        let sum: number = 0;
        for (let i: int = 0; i < results.length; i++) {
          sum += results[i];
        }
        expect(sum).assertEqual(4950);

        expect(results[0]).assertEqual(0);
        expect(results[99]).assertEqual(99);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0012
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0012
     * @tc.desc   Verify data isolation between concurrent tasks (Scope containment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const processUser = async (id: number, uniqueData: string, delay: int): Promise<string> => {
          try {
            const session = new UserSession();
            session.userId = id;
            session.data = uniqueData;

            await sleep(delay);

            return session.data;
          } catch (e) {
            console.info(`asyncSecTest0012 processUser catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const taskA = processUser(1, 'Alice', 10);
        const taskB = processUser(2, 'Bob', 50);

        const results = await Promise.all([taskA, taskB]);

        const resultA = results[0];
        const resultB = results[1];

        expect(resultA).assertEqual('Alice');

        expect(resultB).assertEqual('Bob');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0013
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0013
     * @tc.desc   Verify race condition handling: Ensure the latest call overwrites/ignores older results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const state = new SearchState();
        const performSearch = async (reqId: number, result: string, delay: int): Promise<void> => {
          try {
            state.lastRequestId = reqId;

            await sleep(delay);

            if (reqId === state.lastRequestId) {
              state.displayValue = result;
            }
          } catch (e) {
            console.info(`asyncSecTest0013 performSearch catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const p1 = performSearch(101, 'Old_Result', 100);

        await sleep(100);
        const p2 = performSearch(102, 'New_Result', 20);

        await Promise.all([p1, p2]);

        expect(state.displayValue).assertEqual('New_Result');
        expect(state.lastRequestId).assertEqual(102);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0014
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0014
     * @tc.desc   Verify concurrent update correctness using Mutex/Lock pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
       const account = new BankAccount();

        const safeWithdraw = async (amount: number): Promise<boolean> => {
          try {
            while (account.isLocked) {
              await sleep(100);
            }

            account.isLocked = true;

            try {
              const currentBalance = account.balance;

              await sleep(200);

              if (currentBalance >= amount) {
                account.balance = currentBalance - amount;
                return true;
              }
              return false;
            } finally {
              account.isLocked = false;
            }
          } catch (e) {
            console.info(`asyncSecTest0014 safeWithdraw catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const t1 = safeWithdraw(80);
        const t2 = safeWithdraw(30);

        const results = await Promise.all([t1, t2]);

        let successCount: int = 0;
        if (results[0]) successCount++;
        if (results[1]) successCount++;

        expect(successCount).assertEqual(1);

        const validBalances = (account.balance === 20) || (account.balance === 70);
        expect(validBalances).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0015
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0015
     * @tc.desc   Verify re-entrancy control (prevention of overlapping execution)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const manager = new AsyncTaskManager();

        const p1 = manager.doWork();

        await sleep(100);
        const p2 = manager.doWork();

        const results = await Promise.all([p1, p2]);

        expect(results[0]).assertEqual('Completed');
        expect(results[1]).assertEqual('Ignored');

        expect(manager.executionCount).assertEqual(1);

        const p3 = await manager.doWork();
        expect(p3).assertEqual('Completed');
        expect(manager.executionCount).assertEqual(2);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0016
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0016
     * @tc.desc   Verify try/catch captures asynchronous exceptions thrown via await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const asyncFailure = async (): Promise<string> => {
          try {
            await sleep(100);
            throw new Error('Network_Timeout');
          } catch (e) {
            console.info(`asyncSecTest0016 asyncFailure catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        let capturedError: Error | null = null;

        try {
          await asyncFailure();
          expect(true).assertFalse();
        } catch (err) {
          if (err instanceof Error) {
            capturedError = err;
          }
        }

        expect(capturedError !== null).assertTrue();
        if (capturedError) {
          expect(capturedError instanceof Error).assertTrue();
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0017
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0017
     * @tc.desc   Verify try/catch captures synchronous exceptions thrown inside async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const syncFailure = async (): Promise<number> => {
          const x: int = 0;
          if (x === 0) {
            throw new Error('Division_By_Zero');
          }
          return 100.0;
        };

        let capturedError: Error | null = null;

        try {

          await syncFailure();
          expect(true).assertFalse();
        } catch (err) {
          if (err instanceof Error) {
            capturedError = err;
          }
        }

        expect(capturedError !== null).assertTrue();
        if (capturedError) {
          expect(capturedError instanceof Error).assertTrue();
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0018
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0018
     * @tc.desc   Verify exception bubbling from nested async functions to outer try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const innerLevel = async (): Promise<void> => {
          throw new Error('Deep_Inner_Error');
        };

        const middleLevel = async (): Promise<void> => {
          try {
            await innerLevel();
          } catch (e) {
            console.info(`asyncSecTest0018 middleLevel catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const outerLevel = async (): Promise<void> => {
          try {
            await middleLevel();
            expect(true).assertFalse();
          } catch (err) {
            expect(err instanceof Error).assertTrue();
          }
        };

        await outerLevel();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0019
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0019
     * @tc.desc   Verify uncaught exception bubbling and error object accuracy (Type & Properties)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const queryDatabase = async (): Promise<void> => {
          throw new DatabaseError('Connection_Refused', 503);
        };

        const businessService = async (): Promise<void> => {
          try {
            await queryDatabase();
          } catch (e) {
            console.info(`asyncSecTest0019 businessService catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        try {
          await businessService();
          expect(true).assertFalse();
        } catch (err) {
          expect(err !== null).assertTrue();

          expect(err instanceof DatabaseError).assertTrue();

          if (err instanceof DatabaseError) {
            expect(err instanceof Error).assertTrue();
            expect(err.errorCode).assertEqual(503);
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0020
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0020
     * @tc.desc   Verify network-related exception capture and property verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const simulateFetch = async (targetUrl: string): Promise<string> => {
          try {
            await sleep(100);

            throw new NetworkError('Host unreachable', 404, targetUrl);
          } catch (e) {
            console.info(`asyncSecTest0020 simulateFetch catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const apiUrl = 'https://example.com/api/data';

        try {
          await simulateFetch(apiUrl);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof NetworkError).assertTrue();

          if (e instanceof NetworkError) {
            expect(e instanceof Error).assertTrue();
            expect(e.statusCode).assertEqual(404);
            expect(e.url).assertEqual(apiUrl);
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0021
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0021
     * @tc.desc   Verify timeout exception handling using Promise.race simulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        // A task that takes longer than the timeout limit
        const slowTask = async (): Promise<string> => {
          try {
            await sleep(100);
            return 'Success';
          } catch (e) {
            console.info(`asyncSecTest0021 slowTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        // Wrapper to enforce timeout
        const executeWithTimeout = async (timeoutMs: int): Promise<string> => {
          const timeoutPromise = (async (): Promise<string> => {
            try {
              await sleep(timeoutMs);
            } catch (e) {
              console.info(`asyncSecTest0021 timeoutPromise catch error: ${JSON.stringify(e)}`);
              throw e;
            }
            throw new Error('Operation_Timeout');
          })();

          try {
            // Race: returns whichever settles first
            return await Promise.race([slowTask(), timeoutPromise]);
          } catch (e) {
            console.info(`asyncSecTest0021 executeWithTimeout catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        try {
          // Set timeout to 20ms, but task takes 100ms
          await executeWithTimeout(20);
          expect(true).assertFalse();
        } catch (e) {
          // Verify capture of the timeout error
          expect(e instanceof Error).assertTrue();
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0022
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0022
     * @tc.desc   Verify custom error code and message matching logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        // Define structured business error
        const processOrder = async (orderId: number): Promise<void> => {
          if (orderId < 0) {
            throw new ServiceError('Invalid Order ID', 'ERR_INVALID_INPUT', false);
          }
          // Simulate busy server state
          throw new ServiceError('Server Busy', 'ERR_BUSY', true);
        };

        // Test Scenario 1: Non-retryable Error
        try {
          await processOrder(-1);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof ServiceError).assertTrue();
          if (e instanceof ServiceError) {
            expect(e.errorCode).assertEqual('ERR_INVALID_INPUT');
            expect(e.retryable).assertFalse();
          }
        }

        // Test Scenario 2: Retryable Error
        try {
          await processOrder(100);
          expect(true).assertFalse();
        } catch (e) {
          if (e instanceof ServiceError) {
            expect(e.errorCode).assertEqual('ERR_BUSY');
            expect(e.retryable).assertTrue();
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0023
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0023
     * @tc.desc   Verify exception logic consistency in generic async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        // Generic function that validates input and throws error on demand
        // 1. Test with String type
        try {
          await validateAndReturn0023<string>('test_string', true);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }

        // 2. Test with Number type
        try {
          await validateAndReturn0023<number>(12345, true);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }

        // 3. Test with Object Class type
        try {
          const user = new UserData();
          await validateAndReturn0023<UserData>(user, true);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }

        // 4. Verify Success Path works (Control)
        const validRes = await validateAndReturn0023<string>('Success', false);
        expect(validRes).assertEqual('Success');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0024
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0024
     * @tc.desc   Verify 'finally' block execution for resource release regardless of success or failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const conn = new dbConnection();

        const successOperation = async (): Promise<string> => {
          conn.open();
          try {
            await sleep(100);
            return 'Success';
          } catch (e) {
            console.info(`asyncSecTest0024 catch error: ${JSON.stringify(e)}`);
            throw e;
          } finally {
            conn.close();
          }
        };

        const failOperation = async (): Promise<string> => {
          conn.open();
          try {
            await sleep(100);
            throw new Error('Query Failed');
          } catch (e) {
            console.info(`case catch error: ${JSON.stringify(e)}`);
            throw e;
          } finally {
            conn.close();
          }
        };

        await successOperation();
        expect(conn.isOpen).assertFalse();

        let caught: boolean = false;
        try {
          await failOperation();
        } catch (e) {
          caught = true;
        }
        expect(caught).assertTrue();
        expect(conn.isOpen).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0025
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0025
     * @tc.desc   Verify cleanup of Timers/Locks/External resources upon exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const lock = new SystemLock();

        const riskyProcess = async (): Promise<void> => {
          if (lock.isLocked) throw new Error('Already Locked');
          lock.isLocked = true;

          try {
            await sleep(100);
            throw new Error('Process Crashed');
          } catch (e) {
            if (e instanceof Error) {
              throw e;
            } else {
              throw new Error('Unknown error occurred');
            }
          } finally {
            lock.isLocked = false;
          }
        };

        try {
          await riskyProcess();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
          if (e instanceof Error) {
            expect(e instanceof Error).assertTrue();
          }
        }

        expect(lock.isLocked).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0026
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0026
     * @tc.desc   Verify fallback logic (Default Value/Reset State) when async fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const state = new StateManager();

        const fetchConfigSafe = async (): Promise<AppConfig> => {
          state.isLoading = true;
          try {
            await sleep(100);
            throw new Error('Network Error');
          } catch (e) {
            const defaultConfig = new AppConfig();
            defaultConfig.theme = 'default_blue';
            return defaultConfig;
          } finally {

            state.isLoading = false;
          }
        };

        const result = await fetchConfigSafe();

        expect(result.theme).assertEqual('default_blue');
        expect(state.isLoading).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0027
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0027
     * @tc.desc   Verify partial failure handling in batch tasks (Rollback successful tasks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      const storage = new FileStorage();
        const filesToUpload: string[] = ['file_A', 'file_B', 'file_C_FAIL'];
        const uploadedSuccessfully: string[] = [];

        const executeBatchTransaction = async (): Promise<string> => {
          try {
            for (let i: int = 0; i < filesToUpload.length; i++) {
              const file = filesToUpload[i];

              if (file.includes('FAIL')) {
                throw new Error(`Failed to upload ${file}`);
              }

              await storage.upload(file);
              uploadedSuccessfully.push(file);
            }
            return 'Success';
          } catch (e) {
            try {
              for (let i: int = 0; i < uploadedSuccessfully.length; i++) {
                await storage.delete(uploadedSuccessfully[i]);
              }
              return 'Transaction_Rolled_Back';
            } catch (e2) {
              console.info(`asyncSecTest0027 rollback catch error: ${JSON.stringify(e2)}`);
              throw e2;
            }
          }
        };

        const status = await executeBatchTransaction();

        expect(status).assertEqual('Transaction_Rolled_Back');

        expect(storage.storedFiles.length).assertEqual(0);

        expect(uploadedSuccessfully.length).assertEqual(2);
        expect(uploadedSuccessfully[0]).assertEqual('file_A');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0028
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0028
     * @tc.desc   Verify that inner await blocks the outer function's subsequent logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const trace: string[] = [];

        const innerFunction = async (): Promise<void> => {
          try {
            trace.push('Inner_Start');
            await sleep(200);
            trace.push('Inner_End');
          } catch (e) {
            console.info(`asyncSecTest0028 innerFunction catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const outerFunction = async (): Promise<void> => {
          try {
            trace.push('Outer_Start');

            await innerFunction();

            trace.push('Outer_End');
          } catch (e) {
            console.info(`asyncSecTest0028 outerFunction catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await outerFunction();

        expect(trace.length).assertEqual(4);
        expect(trace[0]).assertEqual('Outer_Start');
        expect(trace[1]).assertEqual('Inner_Start');
        expect(trace[2]).assertEqual('Inner_End');
        expect(trace[3]).assertEqual('Outer_End');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0029
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0029
     * @tc.desc   Verify execution order of deep nested async calls (3+ layers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const stackTrace: string[] = [];

        const level3 = async (): Promise<void> => {
          try {
            stackTrace.push('L3_Start');
            await sleep(100);
            stackTrace.push('L3_End');
          } catch (e) {
            console.info(`asyncSecTest0029 level3 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const level2 = async (): Promise<void> => {
          try {
            stackTrace.push('L2_Start');
            await level3();
            stackTrace.push('L2_End');
          } catch (e) {
            console.info(`asyncSecTest0029 level2 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const level1 = async (): Promise<void> => {
          try {
            stackTrace.push('L1_Start');
            await level2();
            stackTrace.push('L1_End');
          } catch (e) {
            console.info(`asyncSecTest0029 level1 catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await level1();

        const expected: string[] = [
          'L1_Start',
          'L2_Start',
          'L3_Start',
          'L3_End',
          'L2_End',
          'L1_End'
        ];

        expect(stackTrace.length).assertEqual(6);
        for (let i: int = 0; i < expected.length; i++) {
          expect(stackTrace[i]).assertEqual(expected[i]);
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0030
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0030
     * @tc.desc   Verify execution order in mixed Nested + Concurrent scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const logs: string[] = [];

        const workerTask = async (name: string, delay: int): Promise<void> => {
          try {
            logs.push(`${name}_Start`);
            await sleep(delay);
            logs.push(`${name}_End`);
          } catch (e) {
            console.info(`asyncSecTest0030 workerTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const middleManager = async (): Promise<void> => {
          try {
            logs.push('Manager_Start');

            await Promise.all([
              workerTask('TaskA', 10),
              workerTask('TaskB', 50)
            ]);

            logs.push('Manager_End');
          } catch (e) {
            console.info(`asyncSecTest0030 middleManager catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const director = async (): Promise<void> => {
          try {
            logs.push('Director_Start');
            await middleManager();
            logs.push('Director_End');
          } catch (e) {
            console.info(`asyncSecTest0030 director catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        await director();

        expect(logs[0]).assertEqual('Director_Start');
        expect(logs[1]).assertEqual('Manager_Start');

        const indexAStart = logs.indexOf('TaskA_Start');
        const indexBStart = logs.indexOf('TaskB_Start');
        const indexAEnd = logs.indexOf('TaskA_End');
        const indexBEnd = logs.indexOf('TaskB_End');

        expect(indexAStart > 1).assertTrue();
        expect(indexBStart > 1).assertTrue();

        expect(indexAStart < indexAEnd).assertTrue();
        expect(indexBStart < indexAEnd).assertTrue();

        expect(indexAEnd < indexBEnd).assertTrue();

        const indexMgrEnd = logs.indexOf('Manager_End');
        expect(indexMgrEnd > indexBEnd).assertTrue();

        expect(logs[logs.length - 1]).assertEqual('Director_End');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0031
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0031
     * @tc.desc   Verify that inner exceptions are captured by outer layers without data loss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const processPayment = async (id: string): Promise<void> => {
          try {
            await sleep(100);
            throw new PaymentError('Insufficient Funds', id, 1001);
          } catch (e) {
            console.info(`asyncSecTest0031 processPayment catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const handleCheckout = async (): Promise<void> => {
          try {
            await processPayment('TX_999');
          } catch (e) {
            console.info(`asyncSecTest0031 handleCheckout catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        try {
          await handleCheckout();
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof PaymentError).assertTrue();

          if (e instanceof PaymentError) {
            expect(e instanceof Error).assertTrue();
            expect(e.transactionId).assertEqual('TX_999');
            expect(e.errorCode).assertEqual(1001);
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0032
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0032
     * @tc.desc   Verify exception bubbling from deep nested calls to top level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const trace: string[] = [];

        const deepFunction = async (): Promise<void> => {
          trace.push('Enter_L3');
          throw new Error('Core_Failure');
        };

        const middleFunction = async (): Promise<void> => {
          try {
            trace.push('Enter_L2');
            await deepFunction();
            trace.push('Exit_L2');
          } catch (e) {
            console.info(`asyncSecTest0032 middleFunction catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const topFunction = async (): Promise<void> => {
          try {
            trace.push('Enter_L1');
            await middleFunction();
            trace.push('Exit_L1');
          } catch (e) {
            console.info(`asyncSecTest0032 topFunction catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        try {
          await topFunction();
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }

        expect(trace.length).assertEqual(3);
        expect(trace[0]).assertEqual('Enter_L1');
        expect(trace[1]).assertEqual('Enter_L2');
        expect(trace[2]).assertEqual('Enter_L3');

        expect(trace.indexOf('Exit_L2')).assertEqual(-1);
        expect(trace.indexOf('Exit_L1')).assertEqual(-1);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0033
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0033
     * @tc.desc   Verify impact of nested branch exception on other branches (Promise.all fail-fast)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {

        const branchSuccess = async (): Promise<string> => {
          try {
            await sleep(500);
            return 'Success';
          } catch (e) {
            console.info(`asyncSecTest0033 branchSuccess catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const branchFail = async (): Promise<string> => {
          try {
            await sleep(100);
            throw new Error('Branch_Failed');
          } catch (e) {
            console.info(`asyncSecTest0033 branchFail catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const parentTask = async (): Promise<string[]> => {
          try {
            return await Promise.all([branchSuccess(), branchFail()]);
          } catch (e) {
            console.info(`asyncSecTest0033 parentTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        try {
          await parentTask();
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
        }

      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0034
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0034
     * @tc.desc   Verify type inference and value propagation in multi-level generic async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const numResult = await outerWrapper0034<number>(12345);
        expect(numResult).assertEqual(12345);

        const strResult = await outerWrapper0034<string>('Generic_Flow');
        expect(strResult).assertEqual('Generic_Flow');

        const boxInput = new AsyncSecBox<number>(99);
        const boxResult = await outerWrapper0034<AsyncSecBox<number>>(boxInput);

        expect(boxResult instanceof AsyncSecBox).assertTrue();
        expect(boxResult.value).assertEqual(99);
        expect(boxResult).assertEqual(boxInput);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0035
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0035
     * @tc.desc   Verify automatic unwrapping of nested Promises (Promise<Promise<T>> -> Promise<T>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const testVal = 'AutoUnwrap';

        const res1 = await returnDirect0035<string>(testVal);
        const res2 = await returnPromise0035<string>(testVal);
        const res3 = await returnAwait0035<string>(testVal);

        expect(res1).assertEqual(testVal);
        expect(res2).assertEqual(testVal);
        expect(res3).assertEqual(testVal);

        expect(typeof res2).assertEqual('string');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0036
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0036
     * @tc.desc   Verify transitivity of generic constraints (T extends Entity) in nested functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const user = new UserEntity();
        user.id = 101;
        user.username = 'Alice';

        const processedUser = await processEntity0036<UserEntity>(user);

        expect(processedUser.id).assertEqual(101);
        expect(processedUser.username).assertEqual('Alice');
        expect(processedUser.createdAt).assertEqual(1234567890);

        const product = new ProductEntity();
        product.id = 202;
        product.sku = 'PROD-X';

        const processedProduct = await processEntity0036<ProductEntity>(product);
        expect(processedProduct.sku).assertEqual('PROD-X');
        expect(processedProduct.createdAt).assertEqual(1234567890);

        const invalidProduct = new ProductEntity();
        invalidProduct.id = 0;

        try {
          await processEntity0036<ProductEntity>(invalidProduct);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
          if (e instanceof Error) {
            expect(e instanceof Error).assertTrue();
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0037
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0037
     * @tc.desc   Verify consistency of parameters passed from outer to inner async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const innerLevel = async (id: number, config: ConfigObj, tags: string[]): Promise<boolean> => {
          if (id !== 1001) return false;

          if (config.mode !== 'strict') return false;
          if (config.active !== true) return false;

          if (tags.length !== 2) return false;
          if (tags[0] !== 'A' || tags[1] !== 'B') return false;

          return true;
        };

        const outerLevel = async (id: number, config: ConfigObj, tags: string[]): Promise<boolean> => {
          try {
            return await innerLevel(id, config, tags);
          } catch (e) {
            console.info(`asyncSecTest0037 outerLevel catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const testConfig = new ConfigObj();
        testConfig.mode = 'strict';
        testConfig.active = true;
        const testTags: string[] = ['A', 'B'];

        const isConsistent = await outerLevel(1001, testConfig, testTags);
        expect(isConsistent).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0038
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0038
     * @tc.desc   Verify structure and type correctness of return values propagated from inner to outer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const createProfile = async (uid: number): Promise<UserProfile038> => {
          try {
            await sleep(100);
            const p = new UserProfile038();
            p.id = uid;
            p.meta.set('role', 'admin');
            p.meta.set('region', 'CN');
            return p;
          } catch (e) {
            console.info(`asyncSecTest0038 createProfile catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const fetchUserProfile = async (uid: number): Promise<UserProfile038> => {
          try {
            return await createProfile(uid);
          } catch (e) {
            console.info(`asyncSecTest0038 fetchUserProfile catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const result = await fetchUserProfile(888);

        expect(result instanceof UserProfile038).assertTrue();
        expect(result.id).assertEqual(888);

        expect(result.meta.size).assertEqual(2);
        expect(result.meta.get('role')).assertEqual('admin');
        expect(result.meta.get('region')).assertEqual('CN');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0039
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0039
     * @tc.desc   Verify 'this' context binding in nested async class methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {

        const calc = new AsyncCalculator();

        calc.multiplier = 2;
        calc.baseValue = 10;

        const result = await calc.calculate(5);

        expect(result).assertEqual(30);

        const calc2 = new AsyncCalculator();
        const result2 = await calc2.calculate(5);
        expect(result2).assertEqual(100);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   asyncSecTest0040
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0040
     * @tc.desc   Verify handling of "illegal" inputs (null/undefined/NaN/Empty) without crashing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const safeProcess = async (input: InputWrapper): Promise<string> => {
          try {
            await sleep(100);

            if (input.strVal === null || input.strVal === undefined) {
              return 'Default_String';
            }

            if (input.strVal?.length === 0) {
              return 'Empty_String_Detected';
            }

            if (Number.isNaN(input.numVal)) {
              return 'Invalid_Number';
            }

            return `Processed_${input.strVal}`;
          } catch (e) {
            console.info(`asyncSecTest0040 safeProcess catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const inputNull = new InputWrapper();
        inputNull.strVal = null;
        const resNull = await safeProcess(inputNull);
        expect(resNull).assertEqual('Default_String');

        const inputUndefined = new InputWrapper();
        inputUndefined.strVal = undefined;
        const resUndefined = await safeProcess(inputUndefined);
        expect(resUndefined).assertEqual('Default_String');

        const inputEmpty = new InputWrapper();
        inputEmpty.strVal = '';
        const resEmpty = await safeProcess(inputEmpty);
        expect(resEmpty).assertEqual('Empty_String_Detected');

        const inputNaN = new InputWrapper();
        inputNaN.strVal = 'Valid';
        inputNaN.numVal = Number.NaN;
        const resNaN = await safeProcess(inputNaN);
        expect(resNaN).assertEqual('Invalid_Number');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0041
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0041
     * @tc.desc   Verify async calculation correctness with extreme numerical values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const asyncCalc = async (a: number, b: number): Promise<number> => {
          try {
            await sleep(100);
            return a + b;
          } catch (e) {
            console.info(`asyncSecTest0041 asyncCalc catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const maxSafe = Number.MAX_SAFE_INTEGER;
        const resMax = await asyncCalc(maxSafe, 0);
        expect(resMax).assertEqual(maxSafe);

        const minSafe = Number.MIN_SAFE_INTEGER;
        const resMin = await asyncCalc(minSafe, 0);
        expect(resMin).assertEqual(minSafe);

        const overflowStart = Math.pow(2, 1024);
        const resInf = await asyncCalc(overflowStart, 0);
        expect(resInf).assertEqual(Infinity);

        const resFloat = await asyncCalc(0.1, 0.2);
        expect(Math.abs(resFloat - 0.3) < 0.0000001).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0042
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0042
     * @tc.desc   Verify stability when parsing/transferring large data structures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {

        const largeList: DataItem[] = [];
        const ITEM_COUNT: int = 5000;

        for (let i: int = 0; i < ITEM_COUNT; i++) {
          const item = new DataItem();
          item.id = i;
          item.payload = `Content_${i}`;
          largeList.push(item);
        }

        const processLargeList = async (list: DataItem[]): Promise<number> => {
          try {
            let checkSum: number = 0;
            for (let i: int = 0; i < list.length; i++) {
              checkSum += list[i].id;
              if (i % 1000 === 0) {
                await sleep(100);
              }
            }
            return checkSum;
          } catch (e) {
            console.info(`asyncSecTest0042 processLargeList catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const resultSum = await processLargeList(largeList);

        const expectedSum: number = (ITEM_COUNT - 1) * ITEM_COUNT / 2.0;

        expect(resultSum).assertEqual(expectedSum);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0043
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0043
     * @tc.desc   Verify compatibility with special characters (symbols, escape chars, unicode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const asyncEcho = async (input: string): Promise<string> => {
          try {
            await sleep(100);
            return input;
          } catch (e) {
            console.info(`asyncSecTest0043 asyncEcho catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const escapeStr = "Line1\nLine2\tTabbed\"Quoted\"\\Backslash";
        const resEscape = await asyncEcho(escapeStr);
        expect(resEscape).assertEqual(escapeStr);

        const symbolStr = "!@#$%^&*()_+{}|:<>?`-=[]';/.,~";
        const resSymbol = await asyncEcho(symbolStr);
        expect(resSymbol).assertEqual(symbolStr);

        const unicodeStr = "Hello 🌍, this is a test 🧪 with Kanji 漢字";
        const resUnicode = await asyncEcho(unicodeStr);

        expect(resUnicode).assertEqual(unicodeStr);
        expect(resUnicode.length > 0).assertTrue();
        expect(resUnicode.includes('🌍')).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0044
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0044
     * @tc.desc   Verify async operation throws timeout error and does not wait indefinitely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const slowTask = async (): Promise<string> => {
          try {
            await sleep(100);
            return 'Finished_Slowly';
          } catch (e) {
            console.info(`asyncSecTest0044 slowTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const executeWithTimeout = async (timeoutMs: int): Promise<string> => {
          const timeoutPromise = (async (): Promise<string> => {
            try {
              await sleep(timeoutMs);
            } catch (e) {
              console.info(`asyncSecTest0044 timeoutPromise catch error: ${JSON.stringify(e)}`);
              throw e;
            }
            throw new Error('Timeout_Occurred');
          })();

          try {
            const result = await Promise.race([slowTask(), timeoutPromise]);
            return result;
          } catch (e) {
            if (e instanceof Error) {
              throw e;
            }
            throw new Error('Unknown Error');
          }
        };

        let timeoutCaught: boolean = false;
        try {
          await executeWithTimeout(20);
          expect().assertFail();
        } catch (e) {
          timeoutCaught = true;
        }
        expect(timeoutCaught).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0045
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0045
     * @tc.desc   Verify subsequent logic cancellation (cooperative cancellation) after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const context = new TaskContext();

        const cancellableTask = async (ctx: TaskContext): Promise<void> => {
          try {
            await sleep(200);

            if (ctx.isCancelled) return;
            await sleep(500);

            if (!ctx.isCancelled) {
              ctx.resultData = 'Modified_By_Task';
            }
          } catch (e) {
            console.info(`asyncSecTest0045 cancellableTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const runWithCancel = async (ctx: TaskContext): Promise<boolean> => {
          const timeoutMs: int = 30;
          const taskPromise = cancellableTask(ctx);
          const timeoutPromise = (async (): Promise<void> => {
            try {
              await sleep(timeoutMs);
              ctx.isCancelled = true;
            } catch (e) {
              console.info(`asyncSecTest0045 timeoutPromise catch error: ${JSON.stringify(e)}`);
              throw e;
            }
            throw new Error('Timeout');
          })();

          let timeoutCaught: boolean = false;
          try {
            await Promise.race([taskPromise, timeoutPromise]);
          } catch (e) {
            timeoutCaught = true;
          }
          try {
            await taskPromise;
          } catch (e) {
            console.info(`asyncSecTest0045 taskPromise catch error: ${JSON.stringify(e)}`);
          }
          return timeoutCaught;
        };

        const timeoutCaught = await runWithCancel(context);
        expect(timeoutCaught).assertTrue();
        expect(context.isCancelled).assertTrue();
        expect(context.resultData).assertEqual('Initial');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0046
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0046
     * @tc.desc   Verify retry mechanism (count and interval) upon failure/timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const service = new ServiceMock();

        const unstableFetch = async (): Promise<string> => {
          try {
            service.callCount++;

            await sleep(100);

            if (service.callCount < 3) {
              throw new Error('Temporary_Failure');
            }
            return 'Success';
          } catch (e) {
            console.info(`asyncSecTest0046 unstableFetch catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const executeWithRetry = async (maxRetries: number, interval: int): Promise<string> => {
          let attempts: int = 0;
          while (attempts < maxRetries) {
            try {
              return await unstableFetch();
            } catch (e) {
              attempts++;
              if (attempts >= maxRetries) {
                if (e instanceof Error) throw e;
                throw new Error('Unknown Error');
              }

              try {
                await sleep(interval);
              } catch (e2) {
                console.info(`asyncSecTest0046 retryWait catch error: ${JSON.stringify(e2)}`);
                throw e2;
              }
            }
          }
          return 'Failed';
        };

        const result = await executeWithRetry(5, 50);

        expect(result).assertEqual('Success');

        expect(service.callCount).assertEqual(3);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0047
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0047
     * @tc.desc   Verify AbortController-like cancellation pattern throwing specific exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const longRunningTask = async (signal: CancelSignal): Promise<string> => {
          try {
            signal.check();

            await sleep(200);

            signal.check();

            return 'Completed';
          } catch (e) {
            console.info(`asyncSecTest0047 longRunningTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const signal = new CancelSignal();

        const taskPromise = longRunningTask(signal);

        await sleep(100);
        signal.abort();

        try {
          await taskPromise;
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof CancelError).assertTrue();

          if (e instanceof CancelError) {
            expect(e instanceof Error).assertTrue();
          }
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0048
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0048
     * @tc.desc   Verify resource cleanup (locks/data) after cancellation using finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const lock = new SharedLock();
        const token = new CancelToken();

        const secureTask = async (): Promise<void> => {
          lock.acquire();
          try {
            await sleep(500);

            if (token.isCancelled) {
              throw new CancelError048();
            }
          } catch (e) {
            console.info(`case catch error: ${JSON.stringify(e)}`);
            throw e;
          } finally {
            lock.release();
          }
        };

        const p = secureTask();

        await sleep(200);
        token.cancel();

        try {
          await p;
        } catch (e) {
          expect(e instanceof CancelError048).assertTrue();
        }

        expect(lock.isActive).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0049
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0049
     * @tc.desc   Verify full cancellation of batch async tasks (Promise.all)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tracker = new ProgressTracker();
        const signal = new CancelSignal();

        const worker = async (id: number, duration: int): Promise<void> => {
          try {
            await sleep(duration);

            if (signal.isAborted) {
              throw new Error(`Worker_${id}_Cancelled`);
            }

            tracker.completedCount++;
          } catch (e) {
            console.info(`asyncSecTest0049 worker catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const tasks = [
          worker(1, 100),
          worker(2, 500),
          worker(3, 500)
        ];

        await sleep(200);
        signal.abort();

        let cancellationCaught: boolean = false;
        try {
          await Promise.all(tasks);
          expect().assertFail();
        } catch (e) {
          cancellationCaught = true;
        }

        expect(cancellationCaught).assertTrue();
        expect(signal.isAborted).assertTrue();
        expect(tracker.completedCount).assertEqual(1);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0050
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0050
     * @tc.desc   Verify result consistency across multiple calls (Pure Async Function)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const calculateAsync = async (base: number, exponent: number): Promise<number> => {
          try {
            await sleep(100);
            return Math.pow(base, exponent);
          } catch (e) {
            console.info(`asyncSecTest0050 calculateAsync catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const baseVal: int = 2;
        const expVal: int = 10;
        const expectedResult: int = 1024;

        const res1 = await calculateAsync(baseVal, expVal);
        const res2 = await calculateAsync(baseVal, expVal);
        const res3 = await calculateAsync(baseVal, expVal);

        expect(res1).assertEqual(expectedResult);
        expect(res1).assertEqual(res2);
        expect(res2).assertEqual(res3);

        const promises: Promise<number>[] = [
          calculateAsync(baseVal, expVal),
          calculateAsync(baseVal, expVal),
          calculateAsync(baseVal, expVal)
        ];

        const concurrentResults = await Promise.all(promises);

        expect(concurrentResults[0]).assertEqual(expectedResult);
        expect(concurrentResults[1]).assertEqual(expectedResult);
        expect(concurrentResults[2]).assertEqual(expectedResult);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0051
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0051
     * @tc.desc   Verify idempotency of repeated async calls (State should settle and remain consistent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const service = new ServiceManager();

        const res1 = await service.initialize();
        expect(res1).assertEqual('Initialization_Complete');
        expect(service.state).assertEqual('READY');
        expect(service.operationCount).assertEqual(1);

        const firstTs = service.initTimestamp;

        const res2 = await service.initialize();
        const res3 = await service.initialize();

        expect(res2).assertEqual('Already_Ready');
        expect(res3).assertEqual('Already_Ready');

        expect(service.operationCount).assertEqual(1);

        expect(service.initTimestamp).assertEqual(firstTs);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0052
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0052
     * @tc.desc   Stress test: 100 light async calls to verify no degradation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncSecTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        const lightTask = async (index: number): Promise<number> => {
          try {
            await sleep(100);
            return index;
          } catch (e) {
            console.info(`asyncSecTest0052 lightTask catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const iterationCount: int = 100;
        const tasks: Promise<number>[] = [];

        for (let i: int = 0; i < iterationCount; i++) {
          tasks.push(lightTask(i));
        }

        const results = await Promise.all(tasks);

        expect(results.length).assertEqual(iterationCount);

        expect(results[0]).assertEqual(0);
        expect(results[iterationCount - 1]).assertEqual(iterationCount - 1);

      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0053
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0053
     * @tc.desc   Verify fault tolerance and retry effectiveness when dependencies are unstable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {

        const executeWithRetry = async (service: UnstableService, maxRetries: number): Promise<string> => {
          let attempts: int = 0;
          let lastError: Error | null = null;

          while (attempts <= maxRetries) {
            try {
              return await service.request();
            } catch (e) {
              attempts++;
              if (e instanceof Error) {
                lastError = e;
              } else {
                lastError = new Error('Unknown Error');
              }

              if (attempts > maxRetries) {
                throw lastError;
              }

              try {
                await sleep(100);
              } catch (e2) {
                console.info(`asyncSecTest0053 retryWait catch error: ${JSON.stringify(e2)}`);
                throw e2;
              }
            }
          }
          return 'Should_Not_Reach_Here';
        };

        const serviceA = new UnstableService(3);
        const resultA = await executeWithRetry(serviceA, 5);

        expect(resultA).assertEqual('Success_Data');
        expect(serviceA.callCount).assertEqual(4);

        const serviceB = new UnstableService(5);

        try {
          await executeWithRetry(serviceB, 3);
          expect(true).assertFalse();
        } catch (e) {
          expect(e instanceof Error).assertTrue();
          if (e instanceof Error) {
            expect(e instanceof Error).assertTrue();
          }
          expect(serviceB.callCount).assertEqual(4);
        }
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   asyncSecTest0054
     * @tc.number SUB_BUILTINS_asyncSec_TEST_0054
     * @tc.desc   Verify data consistency and resource competition control under multi-instance concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncSecTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const globalInventory = new Inventory();
        const PURCHASE_COUNT: int = 50;

        const purchaseItem = async (qty: number): Promise<boolean> => {
          try {
            await globalInventory.lock();

            try {
              const currentStock = globalInventory.stock;

              await sleep(2);

              if (currentStock >= qty) {
                globalInventory.stock = currentStock - qty;
                return true;
              }
              return false;

            } finally {
              globalInventory.unlock();
            }
          } catch (e) {
            console.info(`asyncSecTest0054 purchaseItem catch error: ${JSON.stringify(e)}`);
            throw e;
          }
        };

        const tasks: Promise<boolean>[] = [];
        for (let i: int = 0; i < PURCHASE_COUNT; i++) {
          tasks.push(purchaseItem(1));
        }

        const results = await Promise.all(tasks);

        let successCount: int = 0;
        for (let i: int = 0; i < results.length; i++) {
          if (results[i]) successCount++;
        }

        expect(successCount).assertEqual(PURCHASE_COUNT);

        expect(globalInventory.stock).assertEqual(100 - PURCHASE_COUNT);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
  })
}
