/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { ArkTSUtils , MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { sleep } from '../testability/pages/Utils';
import {
  printArgs1,
  test,
  taskFunctionAddTest1010,
  taskFunctionAddTest1000,
} from '../testability/pages/TaskpoolUtilsAsynclockSameAddUtils';

export default function AsynclockSameAddTest() {
  describe('AsynclockSameAddTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   AsynclockSameAddTest0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0001
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done:Function) => {
        const caseName = 'AsynclockSameAddTest0100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise  = lock1.lockAsync(async () => {
            try {
              throw new Error('Error occurred in asynchronous operation');
            } catch (error) {
              count++;
              console.error('Caught an exception:', error.message);
            }
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise);
        }
        await Promise.all(promises);
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`)
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0002
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest0300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        while(count != 10){
          await sleep(300);
        }
        await Promise.all(promises);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0003
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest0500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let count = 0;
        const promises: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
            await new Promise<void>((_, reject) => {
              setTimeout(() => {
                reject();
                count++;
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        await Promise.all(promises);
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0004
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest0700';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        await sleep(300);
        console.log('Success execution count:' + count);
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0005
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest0800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            await new Promise<void>((resolve, reject) => {
              setTimeout(() => {
                try {
                  count++;
                  throw new Error('Simulated asynchronous operation error');
                } catch (e) {
                  errorCount++;
                  reject(e);
                }
              }, 200);
            });
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        while(errorCount != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0006
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1000';
        console.info(`${caseName} test start`);
        let task: taskpool.Task = new taskpool.Task(taskFunctionAddTest1010,1);
        task.onReceiveData(taskFunctionAddTest1000);
        let count = 0;
        for (let i = 0; i < 3; i++) {
          taskpool.execute(task).then((result) => {
            console.log(`${result}`);
            count++;
          }).catch((err: Error) => {
            console.error(err.message);
            Done();
          });
        }
        while(count != 3){
          await sleep(300);
        }
        expect(count).assertEqual(3);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0007
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 = lock1.lockAsync(async () => {
             lock2.lockAsync(async () => {
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  try {
                    count++;
                    const error = new Error('Simulated asynchronous operation error');
                    console.error('Caught an exception:', error.message);
                    throw error;
                  } catch (e) {
                    errorCount++;
                    reject(e);
                  }
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest1300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0008
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        while(count != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0009
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
             lock2.lockAsync(async () => {
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0010
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onEnqueuedcount = 0;
        task.onEnqueued(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter exclusive lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  onEnqueuedcount++;
                  resolve();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            console.log('Exit exclusive lock lock2');
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          console.log('Exit exclusive lock lock1');
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        while(onEnqueuedcount != 1){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(onEnqueuedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest1700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0011
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter exclusive lock lock1');
             lock2.lockAsync(async () => {
              console.log('Enter exclusive lock lock2');
              await new Promise<void>((resolve, reject) => {
                setTimeout(() => {
                  count++;
                  reject();
                }, 200);
              });
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest1900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0012
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest1900';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
        }
        console.log('Success execution count:' + count);
        while(count != 1){
          await sleep(300);
        }
        expect(count).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest2000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0013
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2000';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let errorCount = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            console.log('Enter exclusive lock lock1');
            lock2.lockAsync(async () => {
              console.log('Enter shared lock lock2');
              try {
                count++;
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                errorCount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        expect(errorCount).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest2200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0014
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let onStartExecutioncount = 0;
        task.onStartExecution(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              try {
                const error = new Error('Simulated asynchronous operation error');
                console.error('Caught an exception:', error.message);
                throw error;
              } catch (e) {
                onStartExecutioncount++;
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.log('onExecute');
          count++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        while (onStartExecutioncount != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        expect(onStartExecutioncount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest2300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0015
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2300';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest2500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0016
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        let count = 0;
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        await taskpool.execute(task).finally(async () => {
          const promise1: Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                resolve();
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
          try {
            await Promise.all(promises);
          } catch (e) {
            console.log('Caught an error in Promise.all:', JSON.stringify(e));
          }
          await sleep(300);
          console.log('Success execution count:' + count);
          expect(count).assertEqual(1);
          Done();
        })
      });

    /**
     * @tc.name   AsynclockSameAddTest2600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0017
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              new Promise<void>((resolve, reject) => {
                count++;
                reject();
              });
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest2800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0018
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2800';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          WorkThread.terminate();
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest2900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0019
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest2900';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest3100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0020
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3100';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest3200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0021
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3200';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 10) {
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest3400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0022
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
              await taskpool.execute(task).then((result) => {
                count++;
              })
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);

        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest3500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0023
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3500';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest3700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0024
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3700';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
        let count = 0;
        let returnCount = 0;
        task.onExecutionSucceeded(()=>{
          const promise1  = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async () => {
          console.info('taskpool: onExecute')
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        while(returnCount != 42){
          await sleep(300);
        }

        console.log('Success execution count:' + count);
        expect(count).assertEqual(1);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest3800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0025
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest3800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              let WorkThread: worker.ThreadWorker;
              WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
              WorkThread.onexit = () => {
                console.log('onexit');
              }
              WorkThread.postMessage(caseName);
              WorkThread.onmessage = (e: MessageEvents): void => {
                returnCount = e.data;
                count++;
                console.log('e:' + JSON.stringify(e));
                WorkThread.terminate();
                console.info(`${caseName} test end`);
              }
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest4000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0026
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4000';
        console.info(`${caseName} test start`);
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          expect(e.data).assertEqual(42);
          Done();
        }
      });

    /**
     * @tc.name   AsynclockSameAddTest4100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0027
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4100';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              lock3.lockAsync(async () => {
                let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
                await taskpool.execute(task).then((result) => {
                  count++;
                })
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest4300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0028
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4300';
        console.info(`${caseName} test start`);
        let count: number = 0;
        let WorkThread: worker.ThreadWorker;
        WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
        WorkThread.onexit = () => {
          console.log('onexit');
        }
        WorkThread.postMessage(caseName);
        WorkThread.onmessage = (e: MessageEvents): void => {
          count = e.data;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          WorkThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        while (count != 1) {
          await sleep(300);
        }
        expect(count).assertEqual(1);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest4400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0029
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4400';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              lock3.lockAsync(async () => {
                new Promise<void>((resolve, reject) => {
                  count++;
                  resolve();
                });
              }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest4600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0030
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4600';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        for (let i = 0; i < 10; i++) {
          const promise1  = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              lock3.lockAsync(async () => {
                setTimeout( async () => {
                  count++
                },300);
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });

    

    /**
     * @tc.name   AsynclockSameAddTest4800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0031
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4800';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let task: taskpool.Task = new taskpool.Task(test, 1);
        let count = 0;
        let onExecutionFailedcount = 0;
        task.onExecutionFailed(()=>{
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              lock3.lockAsync(async () => {
                setTimeout( async () => {
                  count++
                },300);
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        });
        await taskpool.execute(task).then(async()=>{
        }).catch(()=>{
          onExecutionFailedcount++;
        })
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 1){
          await sleep(300);
        }
        while(onExecutionFailedcount != 1){
          await sleep(300);
        }
        expect(count).assertEqual(1);
        expect(onExecutionFailedcount).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   AsynclockSameAddTest4900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_SAME_ADD_0032
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsynclockSameAddTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'AsynclockSameAddTest4900';
        console.info(`${caseName} test start`);
        let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
        const promises: Promise<void>[] = [];
        let count = 0;
        let returnCount = 0
        for (let i = 0; i < 10; i++) {
          const promise1 : Promise<void> = lock1.lockAsync(async () => {
            lock2.lockAsync(async () => {
              lock3.lockAsync(async () => {
                console.log('Enter worker');
                let WorkThread: worker.ThreadWorker;
                WorkThread = new worker.ThreadWorker('../testability/workers/Worker1');
                WorkThread.onexit = () => {
                  console.log('onexit');
                }
                WorkThread.postMessage(caseName);
                WorkThread.onmessage = (e: MessageEvents): void => {
                  returnCount = e.data;
                  count++;
                  console.log('e:' + JSON.stringify(e));
                  console.info('main2 thread count is  ' + count);
                  WorkThread.terminate();
                  console.log('Success execution count:' + count);
                  console.info(`${caseName} test end`);
                }
                console.log('Exit worker');
              }, ArkTSUtils.locks.AsyncLockMode.SHARED);
            }, ArkTSUtils.locks.AsyncLockMode.SHARED);
          }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
          promises.push(promise1);
        }
        try {
          await Promise.all(promises);
        } catch (e) {
          console.log('Caught an error in Promise.all:', JSON.stringify(e));
        }
        while(count != 10){
          await sleep(300);
        }
        console.log('Success execution count:' + count);
        expect(count).assertEqual(10);
        expect(returnCount).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      });
  })
}