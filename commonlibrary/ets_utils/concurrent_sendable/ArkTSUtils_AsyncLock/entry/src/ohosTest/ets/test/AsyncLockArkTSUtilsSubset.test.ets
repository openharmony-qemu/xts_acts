/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, lang, taskpool } from '@kit.ArkTS';
import { Sleep } from './utils/utils';
import {
  exclusiveTask,
  exclusiveTimeTask,
  loadCase,
  lockExclusiveTask,
  locksTask,
  locksTimeTask,
  sharedTaskTime,
  sharedTimeTask
} from './utils/arkTSUtilsCommon';

export default function AsyncLockArkTSUtilsSubsetTest() {
  describe('AsyncLockArkTSUtilsSubsetTest', () => {

    /**
     * @tc.name   testTaskLocksQueryAll0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0001
     * @tc.desc   The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0001';
      try {
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        expect(states.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQueryAll0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0002
     * @tc.desc   The queryAll operation of AsyncLock does not create an asynchronous lock but performs a query,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAll0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0002';
      try {
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        expect(Array.isArray(states)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQueryAll0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0003
     * @tc.desc   The queryAll operation of AsyncLock creates multiple asynchronous locks,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQueryAll0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQueryAll0003';
      try {
        ArkTSUtils.locks.AsyncLock.request("name1");
        ArkTSUtils.locks.AsyncLock.request("name2");
        ArkTSUtils.locks.AsyncLock.request("name3");
        let states: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        console.info(`${TAG} state.` + JSON.stringify(states));
        expect(states.length).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksConstructor0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0004
     * @tc.desc   The request operation of AsyncLock, which had not been created before,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksConstructor0001';
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        expect(lock instanceof ArkTSUtils.locks.AsyncLock).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQuery0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0005
     * @tc.desc   The request operation of AsyncLock has not been created before, resulting in an error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0001';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQuery0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0006
     * @tc.desc   The query operation of AsyncLock has not been created before, error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQuery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0005';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.query(lockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksRequest0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0007
     * @tc.desc   The request operation of AsyncLock, which had not been created before,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0001';
      try {
        const lockName = "";
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksRequest0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0008
     * @tc.desc   The request operation of AsyncLock has already been created earlier.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0002';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksRequest0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0009
     * @tc.desc   The request operation of AsyncLock has not been created before.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0003';
      try {
        const lockName = "name";
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksRequest0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0010
     * @tc.desc   The request operation of AsyncLock has already been created before.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0004';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
        expect(lock.name).assertEqual(lockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksRequest0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0011
     * @tc.desc   The request operation of AsyncLock had already been created.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksRequest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksRequest0005';
      try {
        const lockName = "name";
        const newLockName = "Name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let lock = ArkTSUtils.locks.AsyncLock.request(newLockName);
        expect(lock.name).assertEqual(newLockName);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQuery0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0012
     * @tc.desc   The request operation of AsyncLock has already been created.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQuery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0002';
      try {
        const lockName = "";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let state = ArkTSUtils.locks.AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQuery0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0013
     * @tc.desc   The query operation of AsyncLock was previously created with the specified name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQuery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0003';
      try {
        const lockName = "name";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        let state = ArkTSUtils.locks.AsyncLock.query(lockName);
        console.info(`${TAG} state:  => ${JSON.stringify(state)}`);
        console.info(`${TAG} state.held:  => ${JSON.stringify(state.held)}`);
        console.info(`${TAG} state.pending:  => ${JSON.stringify(state.pending)}`);
        expect(state && Array.isArray(state.held) && Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testTaskLocksQuery0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0014
     * @tc.desc   The query operation of AsyncLock was previously created with the specified name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskLocksQuery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG: string = 'testTaskLocksQuery0004';
      try {
        const lockName = "name";
        const newLockName = "NAme";
        ArkTSUtils.locks.AsyncLock.request(lockName);
        ArkTSUtils.locks.AsyncLock.query(newLockName);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0015
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0001";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        ArkTSUtils.locks.AsyncLock.query(lock.name);
        lock.lockAsync<void>(() => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: code => ${err.code} message => ${err.message}`);
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0016
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0006";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = null;
        options.timeout = 0;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          result += 'A';
          await Sleep(500);
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        await Sleep(200);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(result).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0017
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0007";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 0;
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        await lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0018
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0008";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        lock.lockAsync(async () => {
          result += 'A'
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0019
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0009";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = {
          aborted: false, reason: 'Aborted'
        };
        options.timeout = 0;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          result += 'A'
          await Sleep(500);
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        await Sleep(200);
        lock.lockAsync(async () => {
          result += 'B';
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(result).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0020
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0010";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: true, reason: 'Aborted'
        };
        options.timeout = 0;
        await lock.lockAsync(async () => {
          result += 'A';
          await Sleep(1500);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0021
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0011";
      try {
        let result = '';
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        options.signal = null;
        options.timeout = 1000;
        await lock.lockAsync(async () => {
          result += 'A';
          await new Promise<void>((resolve) => setTimeout(resolve, 100));
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
        expect(result).assertEqual('A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0022
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0012";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        options.signal = {
          aborted: false, reason: "Aborted"
        };
        options.timeout = 1000;
        lock.lockAsync(async () => {
          await new Promise<void>((resolve) => setTimeout(resolve, 1100));
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        await lock.lockAsync(async () => {
          await new Promise<void>((resolve) => setTimeout(resolve, 1100));
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })


    /**
     * @tc.name   testLockAsync0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0023
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0017";
      try {
        let l1_start = 0;
        let l1_end = 0;
        let l2_start = 0;
        let l2_end = 0;
        let task1: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        let task2: taskpool.Task = new taskpool.Task(sharedTaskTime, TAG);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          l1_start = res[0];
          l1_end = res[1];
          state1 = true;
        })
        await Sleep(100);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          l2_start = res[0];
          l2_end = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0024
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0018";
      try {
        const lockName = 'name';
        let res = false;
        let A = 0;
        let B = 0;
        let task1: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
        let task2: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          A = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          B = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        res = B - A >= 200;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0025
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0019";
      try {
        const lockName = 'name';
        let res = false;
        let A = 0;
        let B = 0;
        let task1: taskpool.Task = new taskpool.Task(exclusiveTimeTask, lockName);
        let task2: taskpool.Task = new taskpool.Task(sharedTimeTask, lockName);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          A = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          B = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        res = B - A >= 500;
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0026
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0020";
      try {
        let res = "";
        let task1: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'A');
        let task2: taskpool.Task = new taskpool.Task(exclusiveTask, TAG, 'B');
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0027
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0021";
      try {
        let l1_start = 0;
        let l1_end = 0;
        let l2_start = 0;
        let l2_end = 0;
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTimeTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let task2: taskpool.Task = new taskpool.Task(locksTimeTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          const res = value as Array<number>;
          l1_start = res[0];
          l1_end = res[1];
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          const res = value as Array<number>;
          l2_start = res[0];
          l2_end = res[1];
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        const res = (l1_start < l2_start) && (l2_start <= l1_end) && (l1_end < l2_end);
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0028
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0022";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let task2: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        await taskpool.execute(task1).then(value => {
          res += (value as string);
        })
        taskpool.execute(task2).then(value => {
          res += (value as string);
        })
        expect(res).assertEqual('A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0029
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0023";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let task2: taskpool.Task = new taskpool.Task(locksTask, lock, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('BA');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testLockAsync0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0030
     * @tc.desc   Test the function of the interface LockAsync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockAsync0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testLockAsync0024";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        let task1: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'A');
        let task2: taskpool.Task = new taskpool.Task(lockExclusiveTask, lock, 'B');
        let state1: boolean = false;
        let state2: boolean = false;
        taskpool.execute(task1).then(value => {
          res += (value as string);
          state1 = true;
        }).catch((err: Error) => {
          console.error(err.message);
          done();
        })
        await Sleep(200);
        taskpool.execute(task2).then(value => {
          res += (value as string);
          state2 = true;
        }).catch((err: Error) => {
          console.error(err.message);
          done();
        })
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockMode0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0031
     * @tc.desc   Test the function of the interface LockAsyncMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockMode0001";
      try {
        let res = '';
        let lock = new ArkTSUtils.locks.AsyncLock;
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A'
          state1 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        await Sleep(200);
        lock.lockAsync(async () => {
          console.log('shared1');
          res += 'B'
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockMode0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0032
     * @tc.desc   Test the function of the interface LockAsyncMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockMode0002";
      try {
        let res = '';
        let lock = ArkTSUtils.locks.AsyncLock.request("exclusive0");
        let state1: boolean = false;
        let state2: boolean = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A'
          await Sleep(500);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
          state1 = true;
        }).catch((err: Error) => {
          console.error(err.message);
          done();
        });
        await Sleep(200);
        lock.lockAsync(async () => {
          console.log('exclusive0');
          res += 'B'
          await Sleep(500);
          state2 = true;
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        while (!(state1 && state2)) {
          await loadCase();
        }
        expect(res).assertEqual('AB');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0033
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0001";
      try {
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        expect(options instanceof ArkTSUtils.locks.AsyncLockOptions).assertTrue();
        expect(options.isAvailable).assertFalse();
        expect(options.signal).assertNull();
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0034
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0002";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = true;
        let res = '';
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'A';
          await new Promise<void>((resolve) => setTimeout(resolve, 100));
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        lock.lockAsync(async () => {
          console.log('shared0');
          res += 'B';
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + res);
        expect(options.isAvailable).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0035
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0003";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.isAvailable = false;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.isAvailable);
        expect(options.isAvailable).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0036
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0004";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = null;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.signal);
        expect(options.signal).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0037
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0005";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = {
          aborted: true, reason: "error"
        };
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + JSON.stringify(options.signal));
        expect(JSON.stringify(options.signal)).assertEqual('{"aborted":true,"reason":"error"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0038
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0006";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.signal = {
          aborted: false, reason: "error"
        };
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + JSON.stringify(options.signal));
        expect(JSON.stringify(options.signal)).assertEqual('{"aborted":false,"reason":"error"}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0039
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0007";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.timeout = 0;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.timeout);
        expect(options.timeout).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockOptions0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0040
     * @tc.desc   Test the function of the interface LockAsyncOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockOptions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockOptions0008";
      try {
        let lock = new ArkTSUtils.locks.AsyncLock();
        let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
        options.timeout = 1000;
        lock.lockAsync(async () => {
          console.log('shared0');
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options);
        console.log(`${TAG} result:` + options.timeout);
        expect(options.timeout).assertEqual(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0041
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0001";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        })
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = true;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0042
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0002";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = held[i].mode == ArkTSUtils.locks.AsyncLockMode.SHARED;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0043
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0003";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = held[i].mode == ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0044
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0004";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let held: ArkTSUtils.locks.AsyncLockInfo[] = state.held;
        let res = false;
        for (let i = 0; i < held.length; i++) {
          if (held[i].name == TAG) {
            res = Number.isFinite(held[i].contextId);
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0045
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0005";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = true;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0046
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0006";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = pending[i].mode == ArkTSUtils.locks.AsyncLockMode.SHARED;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0047
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0007";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = pending[i].mode == ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE;
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockState0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0048
     * @tc.desc   Test the function of the interface LockAsyncState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockState0008";
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request(TAG);
        lock.lockAsync(async () => {
          await Sleep(1000);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        lock.lockAsync(async () => {
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        let state = ArkTSUtils.locks.AsyncLock.query(TAG);
        let pending: ArkTSUtils.locks.AsyncLockInfo[] = state.pending;
        let res = false;
        for (let i = 0; i < pending.length; i++) {
          if (pending[i].name == TAG) {
            res = Number.isFinite(pending[i].contextId);
          }
        }
        expect(res).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })



    /**
     * @tc.name   testAsyncLockParseOptions0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0049
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0001";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":112233445566778899n}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + (numberObj as object)?.["largeNumber"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0050
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0002";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":9007199254740992}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0051
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0003";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_ARK_TS_UTILS_SUBSET_0052
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0004";
      try {
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options);
        console.info(`${TAG} result:` + numberObj);
        expect(ArkTSUtils.isSendable(numberObj)).assertTrue();
        expect(typeof numberObj).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })


  })
}
