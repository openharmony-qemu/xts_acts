'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import { GetTime, sleep as Sleep } from './utils/arkTSUtilsCommon';
import {
  exclusiveTimeTask,
  locksTimeTask,
  sharedTaskTime,
  sharedOverlapCheckTask
} from './utils/AsyncLockTaskPoolHelpers';

export default function AsyncLockTaskPoolStaticTest(): void {
  describe('AsyncLockTaskPoolStaticTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Sleep(500);
    })

    /**
     * @tc.name   testTaskLocksQueryAllStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0100
     * @tc.desc   The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query and returns the current AsyncLockState list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAllStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryAllStatic0001';
      try {
        let lockPrefix: string = TAG + Date.now().toString();
        const statesBefore: AsyncLockState[] = AsyncLock.queryAll();
        AsyncLock.request(lockPrefix + "lock1");
        AsyncLock.request(lockPrefix + "lock2");
        const statesAfter: AsyncLockState[] = AsyncLock.queryAll();
        // queryAll itself creates no lock and must list the newly requested locks.
        expect(statesAfter.length - statesBefore.length).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryAllStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0200
     * @tc.desc   The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query and returns the current AsyncLockState list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAllStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryAllStatic0002';
      try {
        let lockName: string = TAG + Date.now().toString() + "_lock";
        let lock: AsyncLock = AsyncLock.request(lockName);
        let res: boolean = false;
        await lock.lockAsync((): void => {
          try {
            let states: AsyncLockState[] = AsyncLock.queryAll();
            for (let i = 0; i < states.length; i++) {
              let held: AsyncLockInfo[] = states[i].held;
              for (let j = 0; j < held.length; j++) {
                if (held[j].name === lockName && held[j].mode === AsyncLockMode.SHARED) {
                  res = true;
                }
              }
            }
          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }
        }, AsyncLockMode.SHARED);
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryAllStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0300
     * @tc.desc   Verify AsyncLock.query returns held and pending arrays for each of three requested named locks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAllStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryAllStatic0003';
      try {
        let lockPrefix: string = TAG + Date.now().toString();
        let name1: string = lockPrefix + "name1";
        let name2: string = lockPrefix + "name2";
        let name3: string = lockPrefix + "name3";
        const statesBefore: AsyncLockState[] = AsyncLock.queryAll();
        AsyncLock.request(name1);
        AsyncLock.request(name2);
        AsyncLock.request(name3);
        let state1: AsyncLockState = AsyncLock.query(name1);
        let state2: AsyncLockState = AsyncLock.query(name2);
        let state3: AsyncLockState = AsyncLock.query(name3);
        expect(state1.held.length).assertEqual(0);
        expect(state1.pending.length).assertEqual(0);
        expect(state2.held.length).assertEqual(0);
        expect(state2.pending.length).assertEqual(0);
        expect(state3.held.length).assertEqual(0);
        expect(state3.pending.length).assertEqual(0);
        let statesAfter: AsyncLockState[] = AsyncLock.queryAll();
        // queryAll must list the three newly requested named locks.
        expect(statesAfter.length - statesBefore.length).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksConstructorStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0400
     * @tc.desc   The request operation of AsyncLock, which had not been created before, creates a new AsyncLock instance successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksConstructorStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksConstructorStatic0001';
      try {
        let lock: AsyncLock = new AsyncLock();
        expect(lock instanceof AsyncLock).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0500
     * @tc.desc   The query operation of AsyncLock has not been created before, resulting in an error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryStatic0001';
      let errorCaught: boolean = false;
      try {
        const lockName: string = "";
        AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${JSON.stringify(error)}`);
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0600
     * @tc.desc   The query operation of AsyncLock has not been created before, error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryStatic0005';
      let errorCaught: boolean = false;
      try {
        const lockName: string = `${TAG}_absent`;
        AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${JSON.stringify(error)}`);
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   testTaskLocksRequestStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0700
     * @tc.desc   The request operation of AsyncLock, which had not been created before, creates a new AsyncLock instance successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequestStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksRequestStatic0001';
      try {
        const lockName: string = "";
        let lock: AsyncLock = AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksRequestStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0800
     * @tc.desc   The request operation of AsyncLock has already been created earlier.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequestStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksRequestStatic0002';
      try {
        const lockName: string = "";
        AsyncLock.request(lockName);
        let lock: AsyncLock = AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksRequestStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_0900
     * @tc.desc   The request operation of AsyncLock has not been created before.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequestStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksRequestStatic0003';
      try {
        const lockName: string = `${TAG}_lock`;
        let lock: AsyncLock = AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksRequestStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1000
     * @tc.desc   The request operation of AsyncLock has already been created before.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequestStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksRequestStatic0004';
      try {
        const lockName: string = `${TAG}_lock`;
        AsyncLock.request(lockName);
        let lock: AsyncLock = AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksRequestStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1100
     * @tc.desc   Verify AsyncLock.request creates and returns another named lock when a different lock already exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequestStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksRequestStatic0005';
      try {
        const lockName: string = `${TAG}_lock`;
        const newLockName: string = `${TAG}_Name`;
        AsyncLock.request(lockName);
        let lock: AsyncLock = AsyncLock.request(newLockName);
        expect(lock.name).assertEqual(newLockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1200
     * @tc.desc   The query operation of AsyncLock returns the state after the named lock is requested.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryStatic0002';
      try {
        const lockName: string = "";
        AsyncLock.request(lockName);
        let state: AsyncLockState = AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state.held.length).assertEqual(0);
        expect(state.pending.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1300
     * @tc.desc   The query operation of AsyncLock was previously created with the specified name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryStatic0003';
      try {
        const lockName: string = `${TAG}_lock`;
        AsyncLock.request(lockName);
        let state: AsyncLockState = AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state.held.length).assertEqual(0);
        expect(state.pending.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testTaskLocksQueryStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1400
     * @tc.desc   Verify AsyncLock.query fails when the queried lock name differs in letter case from the registered name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testTaskLocksQueryStatic0004';
      let errorCaught: boolean = false;
      try {
        const lockName: string = `${TAG}_name`;
        const newLockName: string = `${TAG}_NAme`;
        AsyncLock.request(lockName);
        AsyncLock.query(newLockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1500
     * @tc.desc   Query on an unregistered local AsyncLock name should fail before lockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testLockAsyncStatic0001';
      let errorCaught: boolean = false;
      try {
        const lock: AsyncLock = new AsyncLock();
        // Local AsyncLock is not registered by name; query must fail before lockAsync.
        AsyncLock.query(lock.name);
        await lock.lockAsync((): void => {
        }, AsyncLockMode.SHARED);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        errorCaught = true;
        expect(err instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1700
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0007";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 0;
        let firstStarted: boolean = false;
        let firstTask: Promise<void> = lock.lockAsync<void, void>(async (): Promise<void> => {
          try {
            firstStarted = true;
            await Sleep(1000);

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE, options);
        let waitCount: number = 0;
        while (!firstStarted && waitCount < 20) {
          await Sleep(100);
          waitCount++;
        }
        expect(firstStarted).assertTrue();
        let rejected: boolean = false;
        let errorCaught: boolean = false;
        try {
          await lock.lockAsync<void, void>(async (): Promise<void> => {
            try {
              await Sleep(1000);

            } catch (error) {
              console.info(`gate-la-catch: ${JSON.stringify(error)}`);
              expect(error).assertFail();
            }}, AsyncLockMode.EXCLUSIVE, options);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} expected rejection: ${error}`);
          errorCaught = true;
          expect(error instanceof Error).assertTrue();
          rejected = true;
        }
        expect(errorCaught).assertTrue();
        expect(rejected).assertTrue();
        expect(options.isAvailable).assertTrue();
        await firstTask;
      } catch (error) {
        console.error(`${TAG} failed, error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_1800
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0008";
      try {
        let result: string = '';
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<string> = new AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        let aborted: boolean = false;
        let errorCaught: boolean = false;
        try {
          await lock.lockAsync<void, string>(async (): Promise<void> => {
            try {
              result += 'A';
              await Sleep(1000);

            } catch (error) {
              console.info(`gate-la-catch: ${JSON.stringify(error)}`);
              expect(error).assertFail();
            }}, AsyncLockMode.SHARED, options);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          errorCaught = true;
          expect(err instanceof Error).assertTrue();
          aborted = true;
        }
        expect(errorCaught).assertTrue();
        expect(aborted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2000
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0010";
      try {
        let result: string = '';
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<string> = new AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        let aborted: boolean = false;
        let errorCaught: boolean = false;
        try {
          await lock.lockAsync<void, string>(async (): Promise<void> => {
            try {
              result += 'A';
              await Sleep(1500);

            } catch (error) {
              console.info(`gate-la-catch: ${JSON.stringify(error)}`);
              expect(error).assertFail();
            }}, AsyncLockMode.EXCLUSIVE, options);
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          errorCaught = true;
          expect(err instanceof Error).assertTrue();
          aborted = true;
        }
        expect(errorCaught).assertTrue();
        expect(aborted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2100
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0011";
      try {
        let result: string = '';
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 1000;
        await lock.lockAsync<void, void>(async (): Promise<void> => {
          try {
            result += 'A';
            await Sleep(100);

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE, options);
        expect(result).assertEqual('A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2300
     * @tc.desc   Verify two SHARED lockAsync callbacks can overlap and complete in the expected execution order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testLockAsyncStatic0013';
      try {
        let res: string = '';
        let lock: AsyncLock = new AsyncLock();
        let firstStarted: boolean = false;
        let first: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            firstStarted = true;
            res += 'l1_start-';
            await Sleep(1000);
            res += 'l1_end-';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        let waitCount: number = 0;
        while (!firstStarted && waitCount < 20) {
          await Sleep(100);
          waitCount++;
        }
        expect(firstStarted).assertTrue();
        // Keep a clear launch interval while both shared-lock callbacks still overlap.
        await Sleep(200);
        let second: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            res += 'l2_start-';
            await Sleep(1000);
            res += 'l2_end';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        await first;
        await second;
        expect(res).assertEqual('l1_start-l2_start-l1_end-l2_end');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2400
     * @tc.desc   Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback and validates the callback result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testLockAsyncStatic0014';
      try {
        let res: string = '';
        let lock: AsyncLock = new AsyncLock();
        let firstStarted: boolean = false;
        let first: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            firstStarted = true;
            res += 'l1_start-';
            await Sleep(500);
            res += 'l1_end-';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        let waitCount: number = 0;
        while (!firstStarted && waitCount < 20) {
          await Sleep(100);
          waitCount++;
        }
        expect(firstStarted).assertTrue();
        let second: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            res += 'l2_start-';
            await Sleep(500);
            res += 'l2_end';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        await first;
        await second;
        expect(res).assertEqual('l1_start-l1_end-l2_start-l2_end');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2500
     * @tc.desc   Perform operations exclusively under the acquired locks. The method first acquires the lock, then calls the callback and validates the callback result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = 'testLockAsyncStatic0015';
      try {
        let res: string = '';
        let lock: AsyncLock = new AsyncLock();
        let firstStarted: boolean = false;
        let first: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            firstStarted = true;
            res += 'l1_start-';
            await Sleep(500);
            res += 'l1_end-';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        let waitCount: number = 0;
        while (!firstStarted && waitCount < 20) {
          await Sleep(100);
          waitCount++;
        }
        expect(firstStarted).assertTrue();
        let second: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            res += 'l2_start-';
            await Sleep(500);
            res += 'l2_end';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        await first;
        await second;
        expect(res).assertEqual('l1_start-l1_end-l2_start-l2_end');
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2700
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0017";
      try {
        let firstStart: number = 0;
        let firstEnd: number = 0;
        let secondStart: number = 0;
        let secondEnd: number = 0;
        let firstTask: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        let secondTask: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        const runFirstTask = async (): Promise<void> => {
          try {
            const firstTiming: Array<number> = await taskpool.execute(firstTask) as Array<number>;
            firstStart = firstTiming[0];
            firstEnd = firstTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
        };
        const runSecondTask = async (): Promise<void> => {
          try {
            const secondTiming: Array<number> = await taskpool.execute(secondTask) as Array<number>;
            secondStart = secondTiming[0];
            secondEnd = secondTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
        };
        const firstJob: Promise<void> = runFirstTask();
        // Stagger task submission while preserving the shared-lock overlap window.
        await Sleep(100);
        const secondJob: Promise<void> = runSecondTask();
        await firstJob;
        await secondJob;
        const isOverlapping: boolean = (firstStart <= secondEnd) && (secondStart <= firstEnd);
        const hasValidDurations: boolean = (firstStart < firstEnd) && (secondStart < secondEnd);
        expect(isOverlapping && hasValidDurations).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_2800
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0018";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let firstStart: number = 0;
        let firstEnd: number = 0;
        let secondStart: number = 0;
        let secondEnd: number = 0;
        let firstStarted: boolean = false;
        const first: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            firstStarted = true;
            firstStart = GetTime();
            await Sleep(500);
            firstEnd = GetTime();

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        let waitCount: number = 0;
        while (!firstStarted && waitCount < 20) {
          await Sleep(100);
          waitCount++;
        }
        expect(firstStarted).assertTrue();
        const second: Promise<void> = lock.lockAsync(async (): Promise<void> => {
          try {
            secondStart = GetTime();
            await Sleep(500);
            secondEnd = GetTime();

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        await first;
        await second;
        expect(firstEnd >= firstStart).assertTrue();
        expect(secondEnd >= secondStart).assertTrue();
        expect(secondStart >= firstEnd).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3000
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0020";
      try {
        let firstStart: number = 0;
        let secondStart: number = 0;
        let firstTask: taskpool.Task = new taskpool.Task(exclusiveTimeTask, TAG);
        let secondTask: taskpool.Task = new taskpool.Task(exclusiveTimeTask, TAG);
        let firstCompleted: boolean = false;
        let secondCompleted: boolean = false;
        const runFirstTask = async (): Promise<void> => {
          try {
            const firstTiming: Array<number> = await taskpool.execute(firstTask) as Array<number>;
            firstStart = firstTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          firstCompleted = true;
        };
        const runSecondTask = async (): Promise<void> => {
          try {
            const secondTiming: Array<number> = await taskpool.execute(secondTask) as Array<number>;
            secondStart = secondTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          secondCompleted = true;
        };
        const firstJobPromise: Promise<void> = runFirstTask();
        await Sleep(200);
        const secondJobPromise: Promise<void> = runSecondTask();
        await Promise.all([firstJobPromise, secondJobPromise]);
        expect(firstCompleted && secondCompleted).assertTrue();
        // Each EXCLUSIVE task holds the lock for 500 ms, so the second one must start at least 500 ms later.
        const isExclusive: boolean = secondStart - firstStart >= 500;
        expect(isExclusive).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3100
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0021";
      try {
        let checkTask: taskpool.Task = new taskpool.Task(sharedOverlapCheckTask, TAG);
        let bothObserved: boolean = await taskpool.execute(checkTask) as boolean;
        console.info(`${TAG} shared overlap observed: ${bothObserved}`);
        // SHARED mode must allow the second critical section to run while the first still holds the lock.
        expect(bothObserved).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3200
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0022";
      try {
        let firstStart: number = 0;
        let firstEnd: number = 0;
        let secondStart: number = 0;
        let secondEnd: number = 0;
        let lock: AsyncLock = AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.SHARED);
        let task2: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.EXCLUSIVE);
        let state1: boolean = false;
        let state2: boolean = false;
        const job1 = async (): Promise<void> => {
          try {
            const firstTiming: Array<number> = await taskpool.execute(task1) as Array<number>;
            firstStart = firstTiming[0];
            firstEnd = firstTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state1 = true;
        };
        const job2 = async (): Promise<void> => {
          try {
            const secondTiming: Array<number> = await taskpool.execute(task2) as Array<number>;
            secondStart = secondTiming[0];
            secondEnd = secondTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state2 = true;
        };
        const p1: Promise<void> = job1();
        await Sleep(200);
        const p2: Promise<void> = job2();
        await Promise.all([p1, p2]);
        expect(state1 && state2).assertTrue();
        // The SHARED and EXCLUSIVE critical sections must not overlap, whichever acquires the lock first.
        const isNonOverlapping: boolean = (secondStart >= firstEnd) || (firstStart >= secondEnd);
        const hasValidDurations: boolean = (firstStart < firstEnd) && (secondStart < secondEnd);
        expect(isNonOverlapping && hasValidDurations).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3300
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0023";
      try {
        let firstStart: number = 0;
        let firstEnd: number = 0;
        let secondStart: number = 0;
        let secondEnd: number = 0;
        let lock: AsyncLock = AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.EXCLUSIVE);
        let task2: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.SHARED);
        let state1: boolean = false;
        let state2: boolean = false;
        const job1 = async (): Promise<void> => {
          try {
            const exclusiveTiming: Array<number> = await taskpool.execute(task1) as Array<number>;
            firstStart = exclusiveTiming[0];
            firstEnd = exclusiveTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state1 = true;
        };
        const job2 = async (): Promise<void> => {
          try {
            const sharedTiming: Array<number> = await taskpool.execute(task2) as Array<number>;
            secondStart = sharedTiming[0];
            secondEnd = sharedTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state2 = true;
        };
        const p1: Promise<void> = job1();
        await Sleep(200);
        const p2: Promise<void> = job2();
        await Promise.all([p1, p2]);
        expect(state1 && state2).assertTrue();
        // The EXCLUSIVE and SHARED critical sections must not overlap, whichever acquires the lock first.
        const isNonOverlapping: boolean = (secondStart >= firstEnd) || (firstStart >= secondEnd);
        const hasValidDurations: boolean = (firstStart < firstEnd) && (secondStart < secondEnd);
        expect(isNonOverlapping && hasValidDurations).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLockAsyncStatic0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3400
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsyncStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testLockAsync0024";
      try {
        let firstStart: number = 0;
        let firstEnd: number = 0;
        let secondStart: number = 0;
        let secondEnd: number = 0;
        let lock: AsyncLock = AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.EXCLUSIVE);
        let task2: taskpool.Task = new taskpool.Task(locksTimeTask, lock, AsyncLockMode.EXCLUSIVE);
        let state1: boolean = false;
        let state2: boolean = false;
        const job1 = async (): Promise<void> => {
          try {
            const firstTiming: Array<number> = await taskpool.execute(task1) as Array<number>;
            firstStart = firstTiming[0];
            firstEnd = firstTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state1 = true;
        };
        const job2 = async (): Promise<void> => {
          try {
            const secondTiming: Array<number> = await taskpool.execute(task2) as Array<number>;
            secondStart = secondTiming[0];
            secondEnd = secondTiming[1];
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          state2 = true;
        };
        const p1: Promise<void> = job1();
        await Sleep(200);
        const p2: Promise<void> = job2();
        await Promise.all([p1, p2]);
        expect(state1 && state2).assertTrue();
        // The two EXCLUSIVE critical sections must not overlap, whichever acquires the lock first.
        const isNonOverlapping: boolean = (secondStart >= firstEnd) || (firstStart >= secondEnd);
        const hasValidDurations: boolean = (firstStart < firstEnd) && (secondStart < secondEnd);
        expect(isNonOverlapping && hasValidDurations).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3700
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0001";
      try {
        let options: AsyncLockOptions<string> = new AsyncLockOptions<string>();
        expect(options.isAvailable).assertFalse();
        expect(options.signal).assertNull();
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_3800
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0002";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();
        options.isAvailable = true;
        let res: string = '';
        await lock.lockAsync<void, void>(async (): Promise<void> => {
          console.info('shared0');
          res += 'A';
          try {
            await Sleep(100);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
        }, AsyncLockMode.SHARED, options);
        await lock.lockAsync<void, void>(async (): Promise<void> => {
          try {
            console.info('shared0');
            res += 'B';

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED, options);
        console.info(`${TAG} result:` + res);
        expect(res).assertEqual('AB');
        expect(options.isAvailable).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4000
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0004";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();
        options.signal = null;
        let ran: boolean = false;
        await lock.lockAsync<void, void>(async (): Promise<void> => {
          try {
            ran = true;
            await Sleep(200);

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED, options);
        expect(ran).assertTrue();
        expect(options.signal).assertNull();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4100
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0005";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<string> = new AsyncLockOptions<string>();
        const signal: AbortSignal<string> = {
          aborted: true, reason: "error"
        };
        options.signal = signal;
        let rejected: boolean = false;
        let errorCaught: boolean = false;
        try {
          await lock.lockAsync<void, string>(async (): Promise<void> => {
            try {
              console.info('shared0');
              await Sleep(1000);

            } catch (error) {
              console.info(`gate-la-catch: ${JSON.stringify(error)}`);
              expect(error).assertFail();
            }}, AsyncLockMode.SHARED, options);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} expected rejection: ${error}`);
          errorCaught = true;
          expect(error instanceof Error).assertTrue();
          rejected = true;
        }
        expect(errorCaught).assertTrue();
        expect(rejected).assertTrue();
        expect(signal.aborted).assertTrue();
        expect(signal.reason).assertEqual('error');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4200
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0006";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<string> = new AsyncLockOptions<string>();
        const signal: AbortSignal<string> = {
          aborted: false, reason: "error"
        };
        options.signal = signal;
        await lock.lockAsync<void, string>(async (): Promise<void> => {
          console.info('shared0');
          try {
            await Sleep(1000);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
        }, AsyncLockMode.SHARED, options);
        console.info(`${TAG} result:` + JSON.stringify(options.signal));
        expect(signal.aborted).assertFalse();
        expect(signal.reason).assertEqual('error');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockOptionsStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4300
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptionsStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockOptions0007";
      try {
        let lock: AsyncLock = new AsyncLock();
        let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();
        options.timeout = 0;
        let ran: boolean = false;
        await lock.lockAsync<void, void>(async (): Promise<void> => {
          try {
            ran = true;
            await Sleep(200);

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED, options);
        expect(ran).assertTrue();
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockStateStatic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4500
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockStateStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockState0001";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let res: boolean = false;
        await lock.lockAsync((): void => {
          try {
            let state: AsyncLockState = AsyncLock.query(TAG);
            let held: AsyncLockInfo[] = state.held;
            for (let i = 0; i < held.length; i++) {
              if (held[i].name === TAG) {
                res = true;
              }
            }

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }});
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockStateStatic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4600
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockStateStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockState0002";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let res: boolean = false;
        await lock.lockAsync((): void => {
          try {
            let state: AsyncLockState = AsyncLock.query(TAG);
            let held: AsyncLockInfo[] = state.held;
            for (let i = 0; i < held.length; i++) {
              if (held[i].name === TAG) {
                res = held[i].mode === AsyncLockMode.SHARED;
              }
            }

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.SHARED);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockStateStatic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_4700
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockStateStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockState0003";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let res: boolean = false;
        await lock.lockAsync((): void => {
          try {
            let state: AsyncLockState = AsyncLock.query(TAG);
            let held: AsyncLockInfo[] = state.held;
            for (let i = 0; i < held.length; i++) {
              if (held[i].name === TAG) {
                res = held[i].mode === AsyncLockMode.EXCLUSIVE;
              }
            }

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockStateStatic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_5000
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockStateStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockState0006";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let secondTask: Promise<void> = Promise.resolve(undefined);
        let res: boolean = false;
        await lock.lockAsync(async (): Promise<void> => {
          try {
            secondTask = lock.lockAsync((): void => {
            }, AsyncLockMode.SHARED);
            let state: AsyncLockState = AsyncLock.query(TAG);
            let pending: AsyncLockInfo[] = state.pending;
            for (let i = 0; i < pending.length; i++) {
              if (pending[i].name === TAG) {
                res = pending[i].mode === AsyncLockMode.SHARED;
              }
            }

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        await secondTask;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockStateStatic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_5100
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockStateStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TAG: string = "testAsyncLockState0007";
      try {
        let lock: AsyncLock = AsyncLock.request(TAG);
        let secondTask: Promise<void> = Promise.resolve(undefined);
        let res: boolean = false;
        await lock.lockAsync(async (): Promise<void> => {
          try {
            secondTask = lock.lockAsync((): void => {
            }, AsyncLockMode.EXCLUSIVE);
            let state: AsyncLockState = AsyncLock.query(TAG);
            let pending: AsyncLockInfo[] = state.pending;
            for (let i = 0; i < pending.length; i++) {
              if (pending[i].name === TAG) {
                res = pending[i].mode === AsyncLockMode.EXCLUSIVE;
              }
            }

          } catch (error) {
            console.info(`gate-la-catch: ${JSON.stringify(error)}`);
            expect(error).assertFail();
          }}, AsyncLockMode.EXCLUSIVE);
        await secondTask;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockQueryPropertyValidationStatic001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ARKTSUTILS_5300
     * @tc.desc   Test AsyncLock.query property validation for held and pending arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncLockQueryPropertyValidationStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testAsyncLockQueryPropertyValidationStatic001';
        try {
          const lockName: string = `${TAG}_lock`;
          let lock: AsyncLock = AsyncLock.request(lockName);
          expect(lock.name).assertEqual(lockName);

          let state: AsyncLockState = AsyncLock.query(lockName);
          expect(state.held.length).assertEqual(0);
          expect(state.pending.length).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done();
      })

  })
}
