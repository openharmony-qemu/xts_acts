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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { sleep } from './Utils.test';
import { args, taskFunction } from './AsyncLazyUtils';

export default function AsyncNestingTest(): void {
  describe('AsyncNestingTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach((): void => {
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await sleep(500);
    });

    /**
     * @tc.name   testAsyncNestingTestStatic0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ASYNCNESTING_0200
     * @tc.desc   Verify three sequential Promise-based delays update the imported initial value to 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncNestingTestStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testAsyncNestingTestStatic0200';
        console.info(`${caseName}, test start`);
        let sharedVariable: number = args;
        await new Promise<void>((resolve): void => {
          console.log(`${sharedVariable}`);
          setTimeout((): void => {
            sharedVariable = 1;
            resolve(undefined);
          }, 100);
        });
        await new Promise<void>((resolve): void => {
          console.log(`${sharedVariable}`);
          setTimeout((): void => {
            sharedVariable = 2;
            resolve(undefined);
          }, 100);
        });
        await new Promise<void>((resolve): void => {
          console.log(`${sharedVariable}`);
          setTimeout((): void => {
            sharedVariable = 3;
            resolve(undefined);
          }, 100);
        });
        console.log(`${sharedVariable}`);
        expect(sharedVariable).assertEqual(3);
        console.info(`${caseName}, test end`);
      } catch (error) {
        console.error("testAsyncNestingTestStatic0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testAsyncNestingTestStatic0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ASYNCNESTING_0300
     * @tc.desc   async lazy import async three nest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncNestingTestStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testAsyncNestingTestStatic0300';
        console.info(`${caseName}, test start`);
        let sharedVariable: number = args;
        const firstLayer: () => Promise<number> = async (): Promise<number> => {
          console.log(`${sharedVariable}`);
          try {
            await sleep(100);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          sharedVariable = 1;
          return sharedVariable;
        };
        const secondLayer: () => Promise<number> = async (): Promise<number> => {
          try {
            const resultFromFirst: number = await firstLayer();
            console.log(`${resultFromFirst}`);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          try {
            await sleep(100);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          sharedVariable = 2;
          return sharedVariable;
        };
        const thirdLayer: () => Promise<number> = async (): Promise<number> => {
          try {
            const resultFromSecond: number = await secondLayer();
            console.log(`${resultFromSecond}`);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          try {
            await sleep(100);
          } catch (error) {
            console.info(`gate-catch: ${JSON.stringify(error)}`);
            expect().assertFail();
          }
          sharedVariable = 3;
          return sharedVariable;
        };
        try {
          await thirdLayer();
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.log(`${sharedVariable}`);
        expect(sharedVariable).assertEqual(3);
        console.info(`${caseName}, test end`);
      } catch (error) {
        console.error("testAsyncNestingTestStatic0300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testAsyncNestingTestStatic0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ASYNCNESTING_0400
     * @tc.desc   Verify three sequential Promise-based delays update the shared value from one to three.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncNestingTestStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testAsyncNestingTestStatic0400';
      try {
        console.info(`${caseName}, test start`);
        let sharedVariable: number = args;
        await new Promise<void>((resolve): void => {
          setTimeout((): void => {
            console.log('one async start');
            sharedVariable = 1;
            setTimeout((): void => {
              console.log('two async start');
              sharedVariable = 2;
              setTimeout((): void => {
                console.log('three async start');
                sharedVariable = 3;
                resolve(undefined);
              }, 150);
            }, 100);
          }, 50);
        });
        expect(sharedVariable).assertEqual(3);
        console.info(`${caseName}, test end`);
      } catch (error) {
        console.error(`${caseName} failed`);
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testAsyncNestingTestStatic0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ASYNCNESTING_0500
     * @tc.desc   Verify a TaskPool result remains correct after a Promise-based delay and equals args plus one.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncNestingTestStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testAsyncNestingTestStatic0500';
      try {
        console.info(`${caseName}, test start`);
        const task: taskpool.Task = new taskpool.Task(taskFunction, args);
        const result: number = await taskpool.execute(task) as number;
        console.log(`${result}`);
        try {
          await sleep(100);
          console.log('async end');
          const delayedResult: number = result;
          expect(delayedResult).assertEqual(args + 1);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(result).assertEqual(args + 1);
        console.info(`${caseName}, test end`);
      } catch (error) {
        console.error(`${caseName} failed`);
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name   testAsyncNestingTestStatic0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_ASYNCNESTING_0600
     * @tc.desc   Verify an AsyncLock callback containing a delayed Promise increments the imported value before a subsequent timer completes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncNestingTestStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const caseName: string = 'testAsyncNestingTestStatic0600';
        console.info(`${caseName}, test start`);
        let sharedVariable: number = args;
        const asyncLock: AsyncLock = AsyncLock.request(caseName);
        const protectedAsyncOperation: () => Promise<number> = async (): Promise<number> => {
          await asyncLock.lockAsync(async (): Promise<void> => {
            try {
              await sleep(100);
              sharedVariable++;
              console.log('sharedVariable is:', sharedVariable);

            } catch (error) {
              console.info(`gate-la-catch: ${JSON.stringify(error)}`);
              expect(error).assertFail();
            }});
          return sharedVariable;
        };
        let protectedResult: number = 0;
        try {
          protectedResult = await protectedAsyncOperation();
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.log('Promise then start');
        try {
          await sleep(500);
          console.log('setTimeout', protectedResult);
        } catch (error) {
          console.info(`gate-catch: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        expect(sharedVariable).assertEqual(43);
        console.info(`${caseName}, test end`);
      } catch (error) {
        console.error("testAsyncNestingTestStatic0600 failed");
        expect(false).assertFail();
      }
      done();
    });

  });
}
