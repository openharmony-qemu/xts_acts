/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog';
import {
  currentFun,
  transferArrayBuffer,
  transferAtomics,
  setCloneListTest,
  setTransferListTest,
  testString,
  testTime,
  testNumber,
  testTaskPool,
  promiseCase,
  asyncSum,
  printArgsFunc,
  Sum,
  delaySum,
  Add,
  funcStrCat,
  arraySum,
  objectSum,
  Multi,
  AdditionDelay,
  WaitforRunner,
  errorTest,
  testCancelDelayed,
  dependend,
  hashMapTest,
  delay,
  randomTest,
  outerTaskFunc,
  isConcurrentTest1,
  isConcurrentTest2,
  sequenceRunnerTest,
  sequenceRunnerPriorityTest,
  CancelAndExecuteDelayed,
  dealHashMapTest,
  noUseConcurrentTest,
  sendDataTest,
  sendableClassTestFunc,
  Int8ArrayTestFunc,
  SetTestFunc,
  MapTestFunc,
  simpleSendableClassTestFunc,
  Uint8ClampedArrayTestFunc,
  testWithThreeParams,
  testWithArray,
  sendableFuncTest,
  sendableClassTest,
  promiseTest,
  testWithArray_value
} from '../utils/testFunclist'
import { A, B, StrCat, printArgs, printStrArgs, fun } from '../utils/exportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest } from '../utils/sendable';
import HashMap from '@ohos.util.HashMap';

async function waitWithPromiseCase(): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, 100);
  });
}

export default function TaskPoolLibTest() {
  describe('TaskPoolLibTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number    : TaskPoolTestClass001
     * @tc.name      : Async Function use taskpool and worker
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let input: number = 0;
        const expected: number = 1;
        testTaskPool();
        input = 1;
        expect(input).assertEqual(expected);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_002
     * @tc.name      : TaskPoolTestClass002
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result = await taskpool.execute(Sum, 10.0, 20.0);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_003
     * @tc.name      : TaskPoolTestClass003
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const result: NullishType = await taskpool.execute(Add, true, true);
        if (result) {
          expect(result as boolean).assertEqual(true);
        } else {
          expect(false).assertFail();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_004
     * @tc.name      : TaskPoolTestClass004
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(StrCat, 'abc', 'def');
        expect(result as string).assertEqual('abcdef');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_005
     * @tc.name      : TaskPoolTestClass005
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(StrCat, 'abc', 'def');
        expect(result as string).assertEqual('abcdef');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_006
     * @tc.name      : TaskPoolTestClass006
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(funcStrCat, 'abc', 'def', 'hello');
        expect(result as string).assertEqual('abcdefhello');
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_007
    //  * @tc.name      : TaskPoolTestClass007
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let result: NullishType = await taskpool.execute(arraySum, new Array<number>(1, 2), new Array<number>(3, 4));
    //     if (result && result.length >= 2) {
    //       expect((result as number[])[0]).assertEqual(4);
    //       expect((result as number[])[1]).assertEqual(6);
    //     } else {
    //       expect(false).assertFail();
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_008
     * @tc.name      : TaskPoolTestClass008
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let aa: A = new A();
        aa.a = 1;
        aa.b = 2;
        let bb: B = new B();
        bb.a = 3;
        bb.b = 4;
        let result: NullishType = await taskpool.execute(objectSum, aa, bb);
        expect(string((result as A).a)).assertEqual('4');
        expect(string((result as A).b)).assertEqual('6');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_010
     * @tc.name      : TaskPoolTestClass010
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(Sum, 10.0, 20.0, 30.0);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_011
     * @tc.name      : TaskPoolTestClass011
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result1: NullishType = await taskpool.execute(Sum, 10.0, 20.0);
        let result2: NullishType = await taskpool.execute(Sum, 30.0, 40.0);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(70);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_012
     * @tc.name      : TaskPoolTestClass012
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result1: NullishType = await taskpool.execute(Sum, 10.0, 20.0);
        let result2: NullishType = await taskpool.execute(Sum, 10.0, 20.0);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_013
     * @tc.name      : TaskPoolTestClass013
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result1: NullishType = await taskpool.execute(Sum, 10.0, 20.0);
        let result2: NullishType = await taskpool.execute(Multi, 10.0, 20.0);
        let result3: NullishType = await taskpool.execute(Sum, 10.0, 30.0);
        let result4: NullishType = await taskpool.execute(Multi, 20.0, 20.0);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(200);
        expect(result3 as number).assertEqual(40);
        expect(result4 as number).assertEqual(400);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_014
     * @tc.name      : TaskPoolTestClass014
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result: NullishType = await taskpool.execute(task);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_015
     * @tc.name      : TaskPoolTestClass015
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Add, true, true);
        let result: NullishType = await taskpool.execute(task);
        expect(result as boolean).assertEqual(true);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_016
     * @tc.name      : TaskPoolTestClass016
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(StrCat, 'abc', 'def');
        let result: NullishType = await taskpool.execute(task);
        expect(result as string).assertEqual('abcdef');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_017
     * @tc.name      : TaskPoolTestClass017
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(funcStrCat, 'abc', 'def', 'hello');
        let result: NullishType = await taskpool.execute(task);
        expect(result as string).assertEqual('abcdefhello');
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_018
    //  * @tc.name      : TaskPoolTestClass018
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let task: taskpool.Task = new taskpool.Task(arraySum, [1.0, 2.0], [3.0, 4.0]);
    //     let result: NullishType = await taskpool.execute(task);
    //     if (result && result.length >=2 ) {
    //       expect((result as number[])[0]).assertEqual(4.0);
    //       expect((result as number[])[1]).assertEqual(6.0);
    //     } else {
    //       expect(false).assertFail();
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_019
     * @tc.name      : TaskPoolTestClass019
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let aa: A = new A();
        aa.a = 1;
        aa.b = 2;
        let bb: B = new B();
        bb.a = 3;
        bb.b = 4;
        let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
        let result: NullishType = await taskpool.execute(task);
        expect(string((result as A).a)).assertEqual('4');
        expect(string((result as A).b)).assertEqual('6');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_021
     * @tc.name      : TaskPoolTestClass021
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0, 30.0);
        let result: NullishType = await taskpool.execute(task);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_022
     * @tc.name      : TaskPoolTestClass022
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: NullishType = await taskpool.execute(task);
        let result2: NullishType = await taskpool.execute(task);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_023
     * @tc.name      : TaskPoolTestClass023
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let task2: taskpool.Task = new taskpool.Task(Sum, 30.0, 40.0);
        let result1: NullishType = await taskpool.execute(task1);
        let result2: NullishType = await taskpool.execute(task2);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(70);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_024
     * @tc.name      : TaskPoolTestClass024
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let task2: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: NullishType = await taskpool.execute(task1);
        let result2: NullishType = await taskpool.execute(task2);
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_025
     * @tc.name      : TaskPoolTestClass025
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: NullishType = await taskpool.execute(task1);
        let task2: taskpool.Task = new taskpool.Task(Multi, 10.0, 20.0);
        let result2: NullishType = await taskpool.execute(task2);
        let task3: taskpool.Task = new taskpool.Task(Sum, 10.0, 30.0);
        let result3: NullishType = await taskpool.execute(task3);
        let task4: taskpool.Task = new taskpool.Task(Multi, 20.0, 20.0);
        let result4: NullishType = await taskpool.execute(task4);
        expect(result1 as number).assertEqual(30.0);
        expect(result2 as number).assertEqual(200.0);
        expect(result3 as number).assertEqual(40.0);
        expect(result4 as number).assertEqual(400.0);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_026
     * @tc.name      : TaskPoolTestClass026
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: number = 0;
        let isTerminate: boolean = false;
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);

        taskpool.execute(task).then((ret: number): void => {
          result = ret;
          isTerminate = true;
        });

        while (!isTerminate) {
          await waitWithPromiseCase();
        }

        expect(result as number).assertEqual(30);
        done();
      });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_027
     * @tc.name      : TaskPoolTestClass027
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Add, true, true)
        let result: boolean = false;
        let isTerminate: boolean = false;
        taskpool.execute(task).then((ret: boolean): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as boolean).assertEqual(true);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_028
     * @tc.name      : TaskPoolTestClass028
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(StrCat, 'abc', 'def')
        let result: string = '';
        let isTerminate: boolean = false;
        taskpool.execute(task).then((ret: string): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as string).assertEqual('abcdef');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_029
     * @tc.name      : TaskPoolTestClass029
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(funcStrCat, 'abc', 'def', 'hello');
        let result: string = '';
        let isTerminate: boolean = false;
        taskpool.execute(task).then((ret: string): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as string).assertEqual('abcdefhello');
        done();
      })

    //
    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_030
    //  * @tc.name      : TaskPoolTestClass030
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    // async (done: () => void): Promise<void> => {
    //   let task: taskpool.Task = new taskpool.Task(arraySum, [1, 2], [3, 4]);
    //   let isTerminate: boolean = false;
    //   let result: Array<number> = new Array<number>();
    //   taskpool.execute(task).then((ret: Array<number>): void => {
    //     result = ret;
    //     isTerminate = true;
    //   })
    //
    //   while (!isTerminate) {
    //     await waitWithPromiseCase();
    //   }
    //   expect(result[0]).assertEqual(4);
    //   expect(result[1]).assertEqual(6);
    // done();
    // })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_031
     * @tc.name      : TaskPoolTestClass031
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let aa: A = new A();
        aa.a = 1;
        aa.b = 2;
        let bb: B = new B();
        bb.a = 3;
        bb.b = 4;
        let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
        let result: A = aa;
        let isTerminate: boolean = false;
        taskpool.execute(task).then((ret: A): void => {
          result = ret as A;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(string((result as A).a)).assertEqual('4');
        expect(string((result as A).b)).assertEqual('6');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_033
     * @tc.name      : TaskPoolTestClass033
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0, 30.0);
        let result: number = 0;
        let isTerminate: boolean = false;
        taskpool.execute(task).then((ret: number): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_034
     * @tc.name      : TaskPoolTestClass034
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let result1: number = 0;
        taskpool.execute(task1).then((ret1: number): void => {
          result1 = ret1;
          isTerminate1 = true;
        })

        let task2: taskpool.Task = new taskpool.Task(Sum, 30.0, 40.0);
        let result2: number = 0;
        taskpool.execute(task2).then((ret2: number): void => {
          result2 = ret2;
          isTerminate2 = true;
        })

        while (!isTerminate1 || !isTerminate2) {
          await waitWithPromiseCase();
        }
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(70);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_035
     * @tc.name      : TaskPoolTestClass035
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number = 0;
        let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        taskpool.execute(task1).then((ret1: number): void => {
          result1 = ret1;
          isTerminate1 = true;
        })

        let task2: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        let result2: number = 0;
        taskpool.execute(task2).then((ret2: number): void => {
          result2 = ret2;
          isTerminate2 = true;
        })

        while (!isTerminate1 || !isTerminate2) {
          await waitWithPromiseCase();
        }
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(30);
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_036
    //  * @tc.name      : TaskPoolTestClass036
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    // async (done: () => void): Promise<void> => {
    //   let isTerminate1: boolean = false;
    //   let isTerminate2: boolean = false;
    //   let result1: number = 0;
    //   let result2: number = 0;
    //   let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
    //   taskpool.execute(task).then((ret1: number): void => {
    //     result1 = ret1;
    //     isTerminate1 = true;
    //   })
    //   taskpool.execute(task).then((ret2: number): void => {
    //     result2 = ret2;
    //     isTerminate2 = true;
    //   })
    //
    //   while (!isTerminate1 || !isTerminate2) {
    //     await waitWithPromiseCase();
    //   }
    //   expect(result1 as number).assertEqual(30);
    //   expect(result2 as number).assertEqual(30);
    // })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_037
    //  * @tc.name      : TaskPoolTestClass037
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    // async (done: () => void): Promise<void> => {
    //   let isTerminate1: boolean = false;
    //   let isTerminate2: boolean = false;
    //   let isTerminate3: boolean = false;
    //   let isTerminate4: boolean = false;
    //   let result1: number = 0;
    //   let result2: number = 0;
    //   let result3: number = 0;
    //   let result4: number = 0;
    //
    //   let task1: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
    //   taskpool.execute(task1).then((ret1: number): void => {
    //     result1 = ret1;
    //     isTerminate1 = true;
    //   })
    //   let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20.0);
    //   taskpool.execute(task2).then((ret2: number): void => {
    //     result2 = ret2;
    //     isTerminate2 = true;
    //   })
    //   let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30.0);
    //   taskpool.execute(task3).then((ret3: number): void => {
    //     result3 = ret3;
    //     isTerminate3 = true;
    //   })
    //   let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20.0);
    //   taskpool.execute(task4).then((ret4: number): void => {
    //     result4 = ret4;
    //     isTerminate4 = true;
    //   })
    //
    //   while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
    //     await waitWithPromiseCase();
    //   }
    //
    //   expect(result1 as number).assertEqual(30);
    //   expect(result2 as number).assertEqual(200.0);
    //   expect(result3 as number).assertEqual(40);
    //   expect(result4 as number).assertEqual(400.0);
    // })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_038
     * @tc.name      : TaskPoolTestClass038
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let result: number = 0;
        taskpool.execute(Sum, 10.0, 20.0).then((ret: number): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_039
     * @tc.name      : TaskPoolTestClass039
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let result: boolean = false;
        taskpool.execute(Add, true, true).then((ret: boolean): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as boolean).assertEqual(true);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_040
     * @tc.name      : TaskPoolTestClass040
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let result: string = '';
        taskpool.execute(StrCat, 'abc', 'def').then((ret: string): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as string).assertEqual('abcdef');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_041
     * @tc.name      : TaskPoolTestClass041
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let result: string = '';
        taskpool.execute(funcStrCat, 'abc', 'def', 'hello').then((ret: string): void => {
          result = ret;
          isTerminate = true;
        })

        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as string).assertEqual('abcdefhello');
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_042
    //  * @tc.name      : TaskPoolTestClass042
    //  * @tc.desc
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let isTerminate: boolean = false;
    //     let result: Array<number> = new Array<number>(10);
    //     taskpool.execute(arraySum, new Array<number>(1, 2), new Array<number>(3, 4))
    //       .then((ret: Array<number>): void => {
    //         result = ret;
    //         isTerminate = true;
    //       }).catch((e:Error)=>{
    //       isTerminate = true;
    //       console.info('======================TaskPoolTestClass042',e.message)
    //     })
    //
    //     while (!isTerminate) {
    //       await waitWithPromiseCase();
    //     }
    //     expect(result[0]).assertEqual(4);
    //     expect(result[1]).assertEqual(6);
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_043
     * @tc.name      : TaskPoolTestClass043
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let aa: A = new A();
        aa.a = 1;
        aa.b = 2;
        let bb: B = new B();
        bb.a = 3;
        bb.b = 4;
        let isTerminate: boolean = false;
        let result: A = aa;
        taskpool.execute(objectSum, aa, bb).then((ret: A): void => {
          result = ret as A;
          isTerminate = true;
        })
        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(string((result as A).a)).assertEqual('4');
        expect(string((result as A).b)).assertEqual('6');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_045
     * @tc.name      : TaskPoolTestClass045
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let result: number = 0;
        taskpool.execute(Sum, 10.0, 20.0, 30).then((ret: number): void => {
          result = ret;
          isTerminate = true;
        })
        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_046
     * @tc.name      : TaskPoolTestClass046
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        taskpool.execute(Sum, 10.0, 20.0).then((ret1: number): void => {
          result1 = ret1;
          isTerminate1 = true;
        })
        taskpool.execute(Sum, 30.0, 40.0).then((ret2: number): void => {
          result2 = ret2;
          isTerminate2 = true;
        })
        while (!isTerminate1 || !isTerminate2) {
          await waitWithPromiseCase();
        }
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(70);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_047
     * @tc.name      : TaskPoolTestClass047
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let result1: number = 0;
        let result2: number = 0;
        taskpool.execute(Sum, 10.0, 20.0).then((ret1: number): void => {
          result1 = ret1;
          isTerminate1 = true;
        })
        taskpool.execute(Sum, 10.0, 20.0).then((ret2: number): void => {
          result2 = ret2;
          isTerminate2 = true;
        })
        while (!isTerminate1 || !isTerminate2) {
          await waitWithPromiseCase();
        }
        expect(result1 as number).assertEqual(30);
        expect(result2 as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_048
     * @tc.name      : TaskPoolTestClass048
     * @tc.desc
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let isTerminate4: boolean = false;
        let result1: number = 0.0;
        let result2: number = 0.0;
        let result3: number = 0.0;
        let result4: number = 0.0;

        taskpool.execute(Sum, 10.0, 20.0).then((ret1: number): void => {
          result1 = ret1;
          isTerminate1 = true;
        })
        taskpool.execute(Multi, 10.0, 20.0).then((ret2: number): void => {
          result2 = ret2;
          isTerminate2 = true;
        })
        taskpool.execute(Sum, 10.0, 30.0).then((ret3: number): void => {
          result3 = ret3;
          isTerminate3 = true;
        })
        taskpool.execute(Multi, 20.0, 20.0).then((ret4: number): void => {
          result4 = ret4;
          isTerminate4 = true;
        })
        while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
          await waitWithPromiseCase();
        }

        expect(result1 as number).assertEqual(30.0);
        expect(result2 as number).assertEqual(200.0);
        expect(result3 as number).assertEqual(40.0);
        expect(result4 as number).assertEqual(400.0);
        done();
      })
    //
    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0050
    //  * @tc.name      : TaskPoolTestClass050
    //  * @tc.desc      : SequenceRunner for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let finalString: string = '';
    //     let task1: taskpool.Task =
    //       new taskpool.Task(AdditionDelay, 500.0); //taskpool.Task()参数1的接口的返回值是void时，编译器行为异常
    //     let task2: taskpool.Task =
    //       new taskpool.Task(AdditionDelay, 300.0); //taskpool.Task()参数1的接口的返回值是void时，编译器行为异常
    //     let task3: taskpool.Task =
    //       new taskpool.Task(AdditionDelay, 100.0); //taskpool.Task()参数1的接口的返回值是void时，编译器行为异常
    //     let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
    //
    //     let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //     runner.execute(task1).then((): void => {
    //       finalString += 'a';
    //     });
    //     runner.execute(task2).then((): void => {
    //       finalString += 'b';
    //     });
    //     runner.execute(task3).then((): void => {
    //       finalString += 'c';
    //     });
    //
    //     await runner.execute(task4);
    //     expect(finalString).assertEqual('abc');
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0051
     * @tc.name      : TaskPoolTestClass051
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
        task1.addDependency(task2);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        try {
          runner.execute(task1).then((): void => {
            finalString += 'a';
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner dependent task not allowed.');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0052
     * @tc.name      : TaskPoolTestClass052
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;

        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        taskpool.execute(task1).then((): void => {
          finalString += 'a';
          isTerminate1 = true;
        })
        taskpool.execute(task2).then((): void => {
          finalString += 'b';
          isTerminate2 = true;
        })
        taskpool.execute(task3).then((): void => {
          finalString += 'c';
          isTerminate3 = true;
        })
        while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
          await waitWithPromiseCase();
        }
        expect(finalString).assertEqual('cba');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0053
     * @tc.name      : TaskPoolTestClass053
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;

        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        task1.removeDependency(task2);
        task2.removeDependency(task3);
        taskpool.execute(task1).then((): void => {
          finalString += 'a';
          isTerminate1 = true;
        })
        taskpool.execute(task2).then((): void => {
          finalString += 'b';
          isTerminate2 = true;
        })
        taskpool.execute(task3).then((): void => {
          finalString += 'c';
          isTerminate3 = true;
        })
        while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
          await waitWithPromiseCase();
        }
        expect(finalString.charAt(2).toString()).assertEqual('c');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0054
     * @tc.name      : TaskPoolTestClass054
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 300.0)
        let task4: taskpool.Task = new taskpool.Task(delaySum, 20, 20, 100.0)
        let task5: taskpool.Task = new taskpool.Task(delaySum, 40, 40, 200.0)
        let task6: taskpool.Task = new taskpool.Task(delaySum, 60, 60, 300.0)

        try {
          task1.addDependency(task2);
          task2.addDependency(task3);
          task3.addDependency(task4);
          task4.addDependency(task5);
          task5.addDependency(task6);
          task6.addDependency(task1);
          task1.addDependency(task3);
          task1.addDependency(task5);
          task3.addDependency(task6);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: There is a circular dependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0055
     * @tc.name      : TaskPoolTestClass055
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 300.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        taskpool.execute(task1).then((): void => {
          console.info('task1 success');
        })
        taskpool.execute(task2).then((): void => {
          console.info('task2 success');
        })
        taskpool.execute(task3).then((): void => {
          console.info('task3 success');
        })

        try {
          task2.removeDependency(task3);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: executedTask cannot removeDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0056
     * @tc.name      : TaskPoolTestClass056
     * @tc.desc      : executeDelayed for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(WaitforRunner, 'a');
        let task2: taskpool.Task = new taskpool.Task(WaitforRunner, 'b');
        let task3: taskpool.Task = new taskpool.Task(WaitforRunner, 'c');

        taskpool.executeDelayed(500, task1).then((): void => {
          finalString += 'a';
          isTerminate1 = true;
        });
        taskpool.executeDelayed(300, task2).then((): void => {
          finalString += 'b';
          isTerminate2 = true;
        });
        taskpool.executeDelayed(100, task3).then((): void => {
          finalString += 'c';
          isTerminate3 = true;
        });
        while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
          await waitWithPromiseCase();
        }

        expect(finalString).assertEqual('cba');
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0057
    //  * @tc.name      : TaskPoolTestClass057
    //  * @tc.desc      : duration for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let totalDuration: number = 0;
    //     let cpuDuration: number = 0;
    //     let ioDuration: number = 0;
    //     let result: number = 101;
    //
    //     let task: taskpool.Task = new taskpool.Task(testString, 'hello');
    //     let temp: NullishType = await taskpool.execute(task);
    //     result = temp as number
    //     hilog.info(0x0000, 'TaskPoolTestClass057', '%{public}s', '[cf]task.result:' + result);
    //     expect(result < 100.0).assertTrue();
    //     totalDuration = task.totalDuration;
    //     cpuDuration = task.cpuDuration;
    //     ioDuration = task.ioDuration;
    //     hilog.info(0x0000, 'TaskPoolTestClass057', '%{public}s', '[cf]task.totalDuration:' + totalDuration);
    //     expect(totalDuration != 0).assertTrue();
    //     hilog.info(0x0000, 'TaskPoolTestClass057', '%{public}s', '[cf]task.cpuDuration:' + cpuDuration);
    //     expect(cpuDuration != -1).assertTrue();
    //     hilog.info(0x0000, 'TaskPoolTestClass057', '%{public}s', '[cf]task.ioDuration:' + ioDuration);
    //     expect(ioDuration != 0).assertTrue();
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0058
     * @tc.name      : TaskPoolTestClass058
     * @tc.desc      : concurrentFunc for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(printArgsFunc, Sum, 10.0, 20.0);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass059
     * @tc.name      : Async Function about priority task
     * @tc.desc      : Execute priority tasks
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {

        let allCount = 100; // 100: test number
        let taskArray: Array<taskpool.Task> = new Array<taskpool.Task>();
        let begin: number = Date.now();
        let highTime: number = 0;
        let mediumTime: number = 0;
        let lowTime: number = 0;

        for (let i: number = 0; i < allCount; i++) {
          let task1: taskpool.Task = new taskpool.Task(testTime);
          taskArray.push(task1);
          let task2: taskpool.Task = new taskpool.Task(testTime);
          taskArray.push(task2);
          let task3: taskpool.Task = new taskpool.Task(testTime);
          taskArray.push(task3);
        }

        for (let i: number = 0; i < allCount; i += 3) {
          let res1: NullishType = await taskpool.execute(taskArray[i], taskpool.Priority.HIGH);
          lowTime += (res1 as number - begin);
          let res2: NullishType = await taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW);
          mediumTime += (res2 as number - begin);
          let res3: NullishType = await taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM);
          highTime += (res3 as number - begin);
        }

        expect(lowTime > mediumTime && mediumTime > highTime);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass060
     * @tc.name      : Async function execute task
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: NullishType = await taskpool.execute(asyncSum, 10.0, 20.0);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass061
     * @tc.name      : Async function execute task
     * @tc.desc      : Execute async function task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(testNumber, 10.0, 20.0);
        let result: NullishType = await taskpool.execute(task);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass062
     * @tc.name      : Async function execute taskGroup
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: Array<number> = new Array<number>();
        let isTerminate: boolean = false;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);
        taskpool.execute(taskGroup).then((ret: Array<number>): void => {
          result = ret;
          isTerminate = true;
        });
        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass063
     * @tc.name      : Async function execute taskGroup
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: Array<number> = new Array<number>();
        let isTerminate: boolean = false;
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        taskGroup.addTask(task3);
        taskpool.execute(taskGroup).then((ret: Array<number>): void => {
          result = ret;
          isTerminate = true;
        });
        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result[0]).assertEqual(100.0);
        expect(result[1]).assertEqual(200.0);
        expect(result[2]).assertEqual(300.0);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass064
     * @tc.name      : SetTransferList for task
     * @tc.desc      : Set transfer list for the task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: number = 0;
        let isTerminate: boolean = false;
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);

        let task: taskpool.Task = new taskpool.Task(setTransferListTest, view, view1);
        // task.setTransferList([view.buffer as ArrayBuffer, view1.buffer as ArrayBuffer]);
        taskpool.execute(task).then((ret: NullishType): void => {
          result = ret as number;
          isTerminate = true;
        });
        while (!isTerminate) {
          await waitWithPromiseCase();
        }
        expect(result as number).assertEqual(24);
        done();
      })

    // /**
    //  * @tc.number    : TaskPoolTestClass065
    //  * @tc.name      : Async Function GetTaskPoolInfo
    //  * @tc.desc      : Get the taskPoolInfo
    //  * @tc.size      : MEDIUM
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    // async (done: () => void): Promise<void> => {
    //   let highCount: number = 0;
    //   let mediumCount: number = 0;
    //   let lowCount: number = 0;
    //   let allCount: number = 100;
    //   for (let i: number = 0; i < allCount; i++) {
    //     let task1: taskpool.Task = new taskpool.Task(currentFun);
    //     let task2: taskpool.Task = new taskpool.Task(currentFun);
    //     let task3: taskpool.Task = new taskpool.Task(currentFun);
    //     taskpool.execute(task1, taskpool.Priority.LOW).then((): void => {
    //       lowCount++;
    //     }).catch((e: Error): void => {
    //       console.error('low task error: ' + e);
    //     })
    //     taskpool.execute(task2, taskpool.Priority.MEDIUM).then((): void => {
    //       mediumCount++;
    //     }).catch((e: Error): void => {
    //       console.error('medium task error: ' + e);
    //     })
    //     taskpool.execute(task3, taskpool.Priority.HIGH).then((): void => {
    //       highCount++;
    //     }).catch((e: Error): void => {
    //       console.error('high task error: ' + e);
    //     })
    //   }
    //
    //   let start: number = new Date().getTime();
    //   while (new Date().getTime() - start < 1000.0) {
    //     continue;
    //   }
    //
    //   let taskpoolInfo = taskpool.getTaskPoolInfo();
    //   let tid: number = 0;
    //   let taskIds: Array<number> = new Array<number>();
    //   let priority: number = 0;
    //   let taskId: number = 0;
    //   let state: number = 0;
    //   let duration: number = 0;
    //
    //   for (let threadInfo of taskpoolInfo.threadInfos) {
    //     tid += threadInfo.tid;
    //     if (threadInfo.taskIds != null && threadInfo.taskIds != undefined) {
    //       taskIds.length += threadInfo?.taskIds?.length ?? 0; //line:1161
    //       taskIds.length += threadInfo?.taskIds?.length ?? 0;
    //     }
    //     if (threadInfo.priority != null && threadInfo.priority != undefined) {
    //       //priority += threadInfo.priority;//line:1165 TypeError: Bad operand type: multiple types left in the normalized union type (Priority|undefined). Unions are not allowed in binary expressions except equality.
    //     }
    //   }
    //
    //   for (let taskInfo of taskpoolInfo.taskInfos) {
    //     taskId += Number(taskInfo.taskId);
    //     state += taskInfo.state;
    //     if (taskInfo.duration != null && taskInfo.duration != undefined) {
    //       duration += taskInfo.duration ?? 0;
    //     }
    //   }
    //   console.info('task duration is: ' + duration);
    //   expect(tid != 0).assertTrue();
    //   expect(taskIds.length != -1).assertTrue();
    //   expect(priority != -1).assertTrue();
    //   expect(taskId != 0).assertTrue();
    //   expect(state != 0).assertTrue();
    // })

    /**
     * @tc.number    : TaskPoolTestClass066
     * @tc.name      : exeute task at taskpool thread
     * @tc.desc      : exeute task at taskpool thread
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let outerTask1 = new taskpool.Task(outerTaskFunc, '001')
        let res1: NullishType = await taskpool.execute(outerTask1);
        expect(res1 as string).assertEqual('outerTaskRes-001');

        let outerTask2 = new taskpool.Task(outerTaskFunc, '002')
        let res2: NullishType = await taskpool.execute(outerTask2);
        expect(res2 as string).assertEqual('outerTaskRes-002');

        let res3: NullishType = await taskpool.execute(outerTaskFunc, '001');
        expect(res3 as string).assertEqual('outerTaskRes-001');

        let res4: NullishType = await taskpool.execute(outerTaskFunc, '002');
        expect(res4 as string).assertEqual('outerTaskRes-002');
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass067
     * @tc.name      : ArrayBuffer with taskpool
     * @tc.desc      : transfer ArrayBuffer with taskpool
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let sab: ArrayBuffer = new ArrayBuffer(20);
        let int32 = new Uint32Array(sab);
        let task: taskpool.Task = new taskpool.Task(transferArrayBuffer, int32);
        taskpool.execute(task).then((): void => {
          let result = int32[0] + int32[1] + int32[2] + int32[3];
          expect(result as number).assertEqual(1000.0);
        });
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass068
     * @tc.name      : ArrayBuffer and Atomics  with taskpool
     * @tc.desc      : transfer ArrayBuffer and Atomics with taskpool
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let sab: ArrayBuffer = new ArrayBuffer(20);
        let int32 = new Int32Array(sab);

        let task: taskpool.Task = new taskpool.Task(transferAtomics, int32);
        taskpool.execute(task).then((res: string): void => {
          expect(res).assertEqual('ok');
        });

        let t = Date.now()
        while ((Date.now() - t) < 1000.0) {
          continue;
        }
        Atomics.notify(int32, 0);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0070
     * @tc.name      : TaskPoolTestClass070
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let taskname: string = 'taskName';
        let task: taskpool.Task = new taskpool.Task(taskname, Sum, 10.0, 20.0);
        let name: string = task.name;
        expect(name).assertEqual('taskName');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0071
     * @tc.name      : TaskPoolTestClass071
     * @tc.desc      : add name of taskGroup for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let taskGroupName: string = 'groupName';
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
        taskGroup.addTask(printArgs, 10.0);
        taskGroup.addTask(printArgs, 20.0);
        taskGroup.addTask(printArgs, 30.0);

        taskpool.execute(taskGroup).then((res: number[]): void => {
          expect(res[0]).assertEqual(10);
          expect(res[1]).assertEqual(20);
          expect(res[2]).assertEqual(30);
        });
        let name: string = taskGroup.name;
        expect(name).assertEqual('groupName');
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass072
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel tasks that have not been executed
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        let task1: taskpool.Task = new taskpool.Task(delaySum, 1, 1, 1000.0);
        let task2: taskpool.Task = new taskpool.Task(delaySum, 2, 2, 1000.0);
        let task3: taskpool.Task = new taskpool.Task(delaySum, 3, 3, 1000.0);
        let task4: taskpool.Task = new taskpool.Task(delaySum, 4, 4, 1000.0);

        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.execute(task4);

        let t = Date.now()
        while ((Date.now() - t) < 500.0) {
          continue;
        }
        try {
          taskpool.cancel(task4);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: task is not executed or has been executed')
          flag = true
        }
        expect(flag).assertTrue()
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass073
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the task in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
          let task4: taskpool.Task = new taskpool.Task(printArgs, 400.0);
          let task5: taskpool.Task = new taskpool.Task(printArgs, 500.0);
          let task6: taskpool.Task = new taskpool.Task(printArgs, 600.0);
          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);
          taskpool.execute(task4);
          taskpool.execute(task5);
          taskpool.execute(task6);

          taskpool.execute(task1);
          taskpool.cancel(task1);
        } catch (e: Error) {
          expect(e)
            .assertEqual('taskpool:: task is not executed or has been executed');
        }
        expect(taskpool.Task.isCanceled() == false);
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass074
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the executed task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);

          let start: number = new Date().getTime();
          while (new Date().getTime() - start < 1000.0) {
            continue;
          }

          taskpool.cancel(task1);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: task is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass075
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel nonexistent task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

          taskpool.execute(task1);
          taskpool.execute(task2);

          taskpool.cancel(task3);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: task is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass076
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Canceling unexecuted tasks multiple times
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);

          let start: number = new Date().getTime();
          while (new Date().getTime() - start < 1000.0) {
            continue;
          }

          taskpool.cancel(task3);
          taskpool.cancel(task3);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: task is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass077
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel all tasks in sequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);
          let task4: taskpool.Task = new taskpool.Task(printArgs, 400.0);
          let task5: taskpool.Task = new taskpool.Task(printArgs, 500.0);
          let task6: taskpool.Task = new taskpool.Task(printArgs, 600.0);

          taskpool.execute(task1);
          taskpool.execute(task2);
          taskpool.execute(task3);
          taskpool.execute(task4);
          taskpool.execute(task5);
          taskpool.execute(task6);

          let start: number = new Date().getTime();
          while (new Date().getTime() - start < 100.0) {
            continue;
          }

          taskpool.cancel(task6);
          taskpool.cancel(task5);
          taskpool.cancel(task4);
          taskpool.cancel(task3);
          taskpool.cancel(task2);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: task is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass078
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the taskGroup in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let i: number = 10;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(AdditionDelay, 10.0);
        taskGroup1.addTask(AdditionDelay, 20.0);
        taskGroup1.addTask(AdditionDelay, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        taskpool.execute(taskGroup1).then((): void => {
          ++i;
        });
        taskpool.execute(taskGroup2);

        try{
          taskpool.cancel(taskGroup1);
        }catch(e:Error){
          console.info('TaskPoolTestClass078 cancel error')
        }
        expect(i).assertEqual(10)
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass079
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the taskGroup that have not been executed
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let i: number = 10;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(AdditionDelay, 10.0);
        taskGroup1.addTask(AdditionDelay, 20.0);
        taskGroup1.addTask(AdditionDelay, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        taskpool.execute(taskGroup1);
        taskpool.execute(taskGroup2).then((): void => {
          ++i;
        });

        taskpool.cancel(taskGroup2);
        expect(i).assertEqual(10)
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass080
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the non-existent taskGroup
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskpool.cancel(taskGroup);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: taskGroup is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : TaskPoolTestClass081
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the executed taskGroup
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate: boolean = false;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(printArgs, 10.0);
        taskGroup1.addTask(printArgs, 20.0);
        taskGroup1.addTask(printArgs, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);

        taskpool.execute(taskGroup1).then((): void => {
          isTerminate = true;
        });
        taskpool.execute(taskGroup2);

        while (!isTerminate) {
          await waitWithPromiseCase();
          ;
        }

        try {
          taskpool.cancel(taskGroup1);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: taskGroup is not executed or has been executed');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0082
     * @tc.name      : TaskPoolTestClass082
     * @tc.desc      : add setclonelist of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let arr: Array<number> = new Array<number>(1, 2, 3, 4);
        let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
        let arrayInt: Int32Array = new Int32Array(arrayBuffer);
        for (let i: number = 0; i < arr.length; i++) {
          arrayInt[i] = arr[i];
        }
        let task: taskpool.Task = new taskpool.Task(setCloneListTest, arrayInt);
        // task.setCloneList([arrayBuffer]);
        taskpool.execute(task).then((): void => {
          expect(arrayInt[0]).assertEqual(1);
        })
        done()
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0083
     * @tc.name      : TaskPoolTestClass083
     * @tc.desc      : taskGroup cannot add groupTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup2.addTask(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add groupTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0084
     * @tc.name      : TaskPoolTestClass084
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.execute(task);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0085
     * @tc.name      : TaskPoolTestClass085
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.executeDelayed(100, task);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0086
     * @tc.name      : TaskPoolTestClass086
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0087
     * @tc.name      : TaskPoolTestClass087
     * @tc.desc      : dependent task not allowed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          task1.addDependency(task2);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: dependent task not allowed.');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0088
     * @tc.name      : TaskPoolTestClass088
     * @tc.desc      : taskgroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task1);
          taskpool.execute(taskGroup).then((res: number[]): void => {
            expect(res[0]).assertEqual(100.0);
          });
          taskGroup.addTask(task2);
          taskpool.execute(taskGroup).then((res: number[]): void => {
            expect(res[1]).assertEqual(200.0);
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: executed taskGroup cannot addTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0089
     * @tc.name      : TaskPoolTestClass089
     * @tc.desc      : SequenceRunner cannot execute groupTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task).then((): void => {
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner cannot execute groupTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0090
     * @tc.name      : TaskPoolTestClass090
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.execute(task);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task).then((): void => {
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner cannot execute seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0091
     * @tc.name      : TaskPoolTestClass091
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.executeDelayed(100, task);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task).then((): void => {
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner cannot execute seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0092
     * @tc.name      : TaskPoolTestClass092
     * @tc.desc      : dependent task not allowed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          task1.addDependency(task2);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((): void => {
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner dependent task not allowed.');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0093
     * @tc.name      : TaskPoolTestClass093
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner1.execute(task).then((): void => {
          });
          let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner2.execute(task).then((): void => {
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner cannot execute seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0094
     * @tc.name      : TaskPoolTestClass094
     * @tc.desc      : groupTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          task.addDependency(task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0095
     * @tc.name      : TaskPoolTestClass095
     * @tc.desc      : groupTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          task1.addDependency(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot be relied on');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0096
     * @tc.name      : TaskPoolTestClass096
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.execute(task2);
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot be relied on');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0097
     * @tc.name      : TaskPoolTestClass097
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.executeDelayed(100, task2);
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot be relied on');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0098
     * @tc.name      : TaskPoolTestClass098
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.execute(task1);
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0099
     * @tc.name      : TaskPoolTestClass099
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.executeDelayed(100, task1);
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0100
     * @tc.name      : TaskPoolTestClass100
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task2).then((): void => {
          });
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot be relied on');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0101
     * @tc.name      : TaskPoolTestClass101
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((): void => {
          });
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0102
     * @tc.name      : TaskPoolTestClass102
     * @tc.desc      : groupTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          task1.addDependency(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot be relied on');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0103
     * @tc.name      : TaskPoolTestClass103
     * @tc.desc      : groupTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          let task1: taskpool.Task = new taskpool.Task(printArgs, 200.0);
          task.addDependency(task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0104
     * @tc.name      : TaskPoolTestClass104
     * @tc.desc      : seqRunnerTask cannot execute outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((): void => {
          });
          taskpool.execute(task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask cannot execute outside');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0105
     * @tc.name      : TaskPoolTestClass105
     * @tc.desc      : groupTask cannot execute outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          taskpool.execute(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot execute outside');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0106
     * @tc.name      : TaskPoolTestClass106
     * @tc.desc      : seqRunnerTask cannot executeDelayed outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          runner.execute(task1).then((): void => {
          });
          taskpool.executeDelayed(100, task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask cannot executeDelayed outside');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0107
     * @tc.name      : TaskPoolTestClass107
     * @tc.desc      : groupTask cannot executeDelayed outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup1.addTask(task);
          taskpool.executeDelayed(100, task)
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: groupTask cannot executeDelayed outside');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0108
     * @tc.name      : TaskPoolTestClass108
     * @tc.desc      : cancel the executeDelay task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let result: number = 0;
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        taskpool.executeDelayed(1000, task).then((ret: number): void => {
          result = ret;
        })
        let t = Date.now()
        while ((Date.now() - t) < 500.0) {
          continue;
        }
        taskpool.cancel(task)
        expect(result).assertEqual(0);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0109
     * @tc.name      : TaskPoolTestClass109
     * @tc.desc      : executedTask with dependency cannot executeDelayed again
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
        task1.addDependency(task2);
        taskpool.execute(task1).then((): void => {
        })
        taskpool.execute(task2).then((): void => {
        })
        try {
          taskpool.execute(task1)
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: executedTask with dependency cannot execute again');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0110
     * @tc.name      : TaskPoolTestClass110
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task('taskName', Sum, 10.0, 20.0);
        try {
          task.name = 'taskName1';
        } catch (e: Error) {
          expect(e.message).assertEqual('TypeError: Cannot set property when setter is undefined');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0111
     * @tc.name      : TaskPoolTestClass111
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task('taskName', Sum, 10.0, 20.0);
        expect(task.name).assertEqual('taskName');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0112
     * @tc.name      : TaskPoolTestClass112
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0);
        let name: string = task.name;
        expect(name).assertEqual('Sum');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0113
     * @tc.name      : TaskPoolTestClass113
     * @tc.desc      : get name from taskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(Sum, 10.0, 20.0)
        taskpool.execute(task).then((): void => {
          console.info('task1 success');
        })
        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 500.0) {
          continue;
        }
        let taskpoolInfo = taskpool.getTaskPoolInfo();
        let name = '';
        for (let taskInfo of taskpoolInfo.taskInfos) {
          name = taskInfo.name;
        }
        expect(name != '').assertTrue();
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0114
     * @tc.name      : TaskPoolTestClass114
     * @tc.desc      : get name from taskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task('taskName', Sum, 10.0, 20.0)
        taskpool.execute(task).then((): void => {
          console.info('task1 success');
        })
        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 500.0) {
          continue;
        }
        let taskpoolInfo = taskpool.getTaskPoolInfo();
        let name = '';
        for (let taskInfo of taskpoolInfo.taskInfos) {
          name = taskInfo.name;
        }
        expect(name != '').assertTrue();
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0115
    //  * @tc.name      : TaskPoolTestClass115
    //  * @tc.desc      : Register a callback of onEnqueued
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let isTerminate1: boolean = false;
    //     let task: taskpool.Task = new taskpool.Task(printArgs, 1);
    //     let onEnqueuedStr = '';
    //     task.onEnqueued((): void => {
    //       onEnqueuedStr = 'onEnqueued';
    //     })
    //
    //     let onStartExecutionStr = '';
    //     task.onStartExecution((): void => {
    //       onStartExecutionStr = 'onStartExecution';
    //     })
    //
    //     let onExecutionSucceededStr = '';
    //     task.onExecutionSucceeded((): void => {
    //       onExecutionSucceededStr = 'onExecutionSucceeded';
    //     })
    //
    //     taskpool.execute(task).then((): void => {
    //       isTerminate1 = true;
    //     });
    //     while (!isTerminate1) {
    //       await waitWithPromiseCase();
    //     }
    //     expect(onEnqueuedStr).assertEqual('onEnqueued');
    //     expect(onStartExecutionStr).assertEqual('onStartExecution');
    //     expect(onExecutionSucceededStr).assertEqual('onExecutionSucceeded');
    //     done();
    //   })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0116
    //  * @tc.name      : TaskPoolTestClass116
    //  * @tc.desc      : handle cancel task error
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let isTerminate1: boolean = false;
    //     let isTerminate2: boolean = false;
    //     let task1: taskpool.Task = new taskpool.Task(testCancelDelayed);
    //     let task2: taskpool.Task = new taskpool.Task(testCancelDelayed);
    //     try {
    //       taskpool.cancel(task1);
    //     } catch (e: Error) {
    //       expect(e.message)
    //         .assertEqual('taskpool:: task is not executed or has been executed');
    //     }
    //     try {
    //       taskpool.execute(task2)
    //     } catch (e: Error) {
    //       isTerminate1 = true;
    //       expect(e.message)
    //         .assertEqual('taskpool:: task is not executed or has been executed');
    //     }
    //
    //     taskpool.cancel(task2);
    //     while (!isTerminate1) {
    //       await waitWithPromiseCase();
    //     }
    //
    //     taskpool.execute(task2).then((): void => {
    //        isTerminate2 = true;
    //     })
    //     while (!isTerminate2) {
    //       await waitWithPromiseCase();
    //     }
    //     try {
    //       taskpool.cancel(task2);
    //     } catch (e: Error) {
    //       expect(e.message)
    //         .assertEqual('taskpool:: task is not executed or has been executed');
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0117
     * @tc.name      : TaskPoolTestClass117
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let task: taskpool.Task = new taskpool.Task(printArgs)
        taskpool.executeDelayed(1000, task).then((): void => {
        }).catch((e: Error): void => {
          isTerminate1 = true;
          expect(e.message).assertEqual('taskpool:: task has been canceled');
        })
        taskpool.cancel(task);
        while (!isTerminate1) {
          await waitWithPromiseCase();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0118
     * @tc.name      : TaskPoolTestClass118
     * @tc.desc      : Register a callback of onExecutionFailed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let task: taskpool.Task = new taskpool.Task(hashMapTest, 1.0);
        task.onExecutionFailed((e: Error): void => {
          expect(e.message)
            .assertEqual('ClassCastError: std.core.Int cannot be cast to std.core.Double');
        })

        taskpool.execute(task).then((res: HashMap<string, number>): void => {
        }).catch((e: Error): void => {
          expect(e.message)
            .assertEqual('ClassCastError: std.core.Int cannot be cast to std.core.Double');
        })
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0119
     * @tc.name      : TaskPoolTestClass119
     * @tc.desc      : Register a callback of onEnqueued after execute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let task: taskpool.Task = new taskpool.Task(printArgs, 1.0);

        taskpool.execute(task).then((): void => {
          isTerminate1 = true;
        });

        let onEnqueuedStr = '';
        try {
          task.onEnqueued((): void => {
            onEnqueuedStr = 'onEnqueued';
          })
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: The executed task does not support the registration of listeners.');
        }
        done();

      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0120
     * @tc.name      : TaskPoolTestClass120
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(delay);
        expect(task.totalDuration < 5).assertTrue();
        expect(task.cpuDuration < 5).assertTrue();
        expect(task.ioDuration < 5).assertTrue();
        let terminate: boolean = false;
        taskpool.execute(task).then((): void => {
          terminate = true;
          expect(task.totalDuration > 0).assertTrue();
          expect(task.ioDuration).assertEqual(0);
          expect(task.totalDuration).assertEqual(task.cpuDuration);
        })

        let exeution: boolean = false;
        while (!terminate) {
          if (!exeution) {
            expect(task.totalDuration < 5).assertTrue();
            expect(task.ioDuration < 5).assertTrue();
            exeution = true;
          }
          await waitWithPromiseCase();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0121
     * @tc.name      : TaskPoolTestClass121
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        task1.addDependency(task2);
        let runner = new taskpool.SequenceRunner();
        try {
          runner.execute(task1).then((): void => {
            finalString += 'a';
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner dependent task not allowed.');
          expect(task1.totalDuration < 5).assertTrue();
          expect(task1.cpuDuration < 5).assertTrue();
          expect(task1.ioDuration < 5).assertTrue();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0122
     * @tc.name      : TaskPoolTestClass122
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
        taskpool.execute(task);
        let start = new Date().getTime();
        while (new Date().getTime() - start < 100.0) {
          continue;
        }
        taskpool.cancel(task);
        expect(task.totalDuration < 5).assertTrue();
        expect(task.cpuDuration < 5).assertTrue();
        expect(task.ioDuration < 5).assertTrue();
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0123
    //  * @tc.name      : TaskPoolTestClass123
    //  * @tc.desc      : duration for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let task: taskpool.Task = new taskpool.Task(randomTest, 100.0);
    //     expect(task.totalDuration < 5).assertTrue();
    //     expect(task.cpuDuration < 5).assertTrue();
    //     expect(task.ioDuration < 5).assertTrue();
    //     let terminate: boolean = false;
    //     taskpool.execute(task).then((): void => {
    //       terminate = true;
    //       expect(task.totalDuration > 0).assertTrue();
    //       expect(task.ioDuration > 0).assertTrue();
    //       expect(task.cpuDuration > 0).assertTrue();
    //       expect(task.totalDuration == task.ioDuration + task.cpuDuration).assertTrue();
    //     })
    //
    //     let exeution: boolean = false;
    //     while (!terminate) {
    //       if (!exeution) {
    //         expect(task.totalDuration < 5).assertTrue();
    //         expect(task.ioDuration < 5).assertTrue();
    //         exeution = true;
    //       }
    //       await waitWithPromiseCase();
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0124
     * @tc.name      : TaskPoolTestClass124
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        task1.addDependency(task2);
        let runner = new taskpool.SequenceRunner();
        try {
          runner.execute(task1).then((): void => {
            finalString += 'a';
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner dependent task not allowed.');
          expect(task1.totalDuration < 5).assertTrue();
          expect(task1.cpuDuration < 5).assertTrue();
          expect(task1.ioDuration < 5).assertTrue();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0125
     * @tc.name      : TaskPoolTestClass125
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
        taskpool.execute(task);
        let start = new Date().getTime();
        while (new Date().getTime() - start < 100.0) {
          continue;
        }
        taskpool.cancel(task);
        expect(task.totalDuration < 5).assertTrue();
        expect(task.cpuDuration < 5).assertTrue();
        expect(task.ioDuration < 5).assertTrue();
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0126
    //  * @tc.name      : TaskPoolTestClass126
    //  * @tc.desc      : duration for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let task1: taskpool.Task = new taskpool.Task(delay, 100.0);
    //     let task2: taskpool.Task = new taskpool.Task(delay, 200.0);
    //     let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
    //     taskGroup.addTask(task1);
    //     taskGroup.addTask(task2);
    //     expect(task1.totalDuration < 5).assertTrue();
    //     expect(task1.cpuDuration < 5).assertTrue();
    //     expect(task1.ioDuration < 5).assertTrue();
    //
    //     let terminate: boolean = false;
    //     taskpool.execute(taskGroup).then((res: Promise<number>): void => {
    //       terminate = true;
    //       expect(task1.totalDuration > 0).assertTrue();
    //       expect(task1.ioDuration).assertEqual(0);
    //       expect(task1.totalDuration).assertEqual(task1.cpuDuration);
    //     });
    //
    //     let exeution: boolean = false;
    //     while (!terminate) {
    //       if (!exeution) {
    //         expect(task1.totalDuration < 5).assertTrue();
    //         expect(task1.ioDuration < 5).assertTrue();
    //         exeution = true;
    //       }
    //       await waitWithPromiseCase();
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0127
     * @tc.name      : TaskPoolTestClass127
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200.0);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        try {
          taskGroup.addTask(task1);
          taskpool.execute(taskGroup).then((res: number[]): void => {
            expect(res[0]).assertEqual(100.0);
          });
          taskGroup.addTask(task2);
          taskpool.execute(taskGroup).then((res: number[]): void => {
            expect(res[1]).assertEqual(200.0);
          });
        } catch (e: Error) {
          expect(e.message).assertEqual('BusinessError: Parameter error. The input parameters are invalid, ' +
            'taskpool:: executed taskGroup cannot addTask');
          expect(task1.totalDuration < 5).assertTrue();
          expect(task1.cpuDuration < 5).assertTrue();
          expect(task1.ioDuration < 5).assertTrue();
        }
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0128
    //  * @tc.name      : TaskPoolTestClass128
    //  * @tc.desc      : duration for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let task: taskpool.Task = new taskpool.Task(randomTest, 100.0);
    //     let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
    //     taskGroup.addTask(task);
    //     expect(task.totalDuration < 5).assertTrue();
    //     expect(task.cpuDuration < 5).assertTrue();
    //     expect(task.ioDuration < 5).assertTrue();
    //     let terminate: boolean = false;
    //     taskpool.execute(taskGroup).then((): void => {
    //       terminate = true;
    //       expect(task.totalDuration > 0).assertTrue();
    //       expect(task.ioDuration > 0).assertTrue();
    //       expect(task.cpuDuration > 0).assertTrue();
    //       expect(task.totalDuration == task.ioDuration + task.cpuDuration).assertTrue();
    //     })
    //
    //     let exeution: boolean = false;
    //     while (!terminate) {
    //       if (!exeution) {
    //         expect(task.totalDuration < 5).assertTrue();
    //         expect(task.ioDuration < 5).assertTrue();
    //         exeution = true;
    //       }
    //       await waitWithPromiseCase();
    //     }
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0129
     * @tc.name      : TaskPoolTestClass129
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

        expect(task1.totalDuration >= 0).assertTrue();
        expect(task1.cpuDuration >= 0).assertTrue();
        expect(task1.ioDuration >= 0).assertTrue();

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        await runner.execute(task1).then((): void => {
          finalString += 'a';
        });
        await runner.execute(task2).then((): void => {
          finalString += 'b';
        });
        await runner.execute(task3).then((): void => {
          finalString += 'c';
        });

        expect(task1.totalDuration >= 0).assertTrue();
        expect(task1.cpuDuration >= 0).assertTrue();
        expect(task1.ioDuration >= 0).assertTrue();

        await runner.execute(task4);
        expect(finalString).assertEqual('abc');
        expect(task1.totalDuration > 0).assertTrue();
        expect(task1.ioDuration).assertEqual(0);
        expect(task1.totalDuration).assertEqual(task1.cpuDuration);
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0130
    //  * @tc.name      : TaskPoolTestClass130
    //  * @tc.desc      : duration for taskpool
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let finalString: string = '';
    //     let task1: taskpool.Task = new taskpool.Task(randomTest, 500.0);
    //     let task2: taskpool.Task = new taskpool.Task(randomTest, 300.0);
    //     let task3: taskpool.Task = new taskpool.Task(randomTest, 100.0);
    //     let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
    //
    //     expect(task1.totalDuration >= 0).assertTrue();
    //     expect(task1.cpuDuration >= 0).assertTrue();
    //     expect(task1.ioDuration >= 0).assertTrue();
    //
    //     let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //     runner.execute(task1).then((): void => {
    //       finalString += 'a';
    //     });
    //     runner.execute(task2).then((): void => {
    //       finalString += 'b';
    //     });
    //     runner.execute(task3).then((): void => {
    //       finalString += 'c';
    //     });
    //
    //     expect(task1.totalDuration >= 0).assertTrue();
    //     expect(task1.cpuDuration >= 0).assertTrue();
    //     expect(task1.ioDuration >= 0).assertTrue();
    //
    //     await runner.execute(task4);
    //     expect(finalString).assertEqual('abc');
    //     expect(task1.ioDuration >= 0).assertTrue();
    //     expect(task1.cpuDuration >= 0).assertTrue();
    //     expect(task1.totalDuration == task1.ioDuration + task1.cpuDuration).assertTrue();
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0131
     * @tc.name      : TaskPoolTestClass131
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        expect(task.totalDuration < 5).assertTrue();
        expect(task.cpuDuration < 5).assertTrue();
        expect(task.ioDuration < 5).assertTrue();
        try {
          runner.execute(task).then((ret: number): void => {
          });
          taskGroup.addTask(task);

        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add seqRunnerTask or executedTask');
          expect(task.totalDuration < 5).assertTrue();
          expect(task.cpuDuration < 5).assertTrue();
          expect(task.ioDuration < 5).assertTrue();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0132
     * @tc.name      : TaskPoolTestClass132
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let finalString: string = '';
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
        taskpool.executeDelayed(500, task1, taskpool.Priority.HIGH).then((): void => {
          finalString += 'a';
          isTerminate1 = true;
        });
        taskpool.executeDelayed(1000, task1, taskpool.Priority.MEDIUM).then((): void => {
          finalString += 'b';
          isTerminate2 = true;
        });
        taskpool.executeDelayed(1500, task1, taskpool.Priority.LOW).then((): void => {
          finalString += 'c';
          isTerminate3 = true;
        });
        while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
          await waitWithPromiseCase();
        }
        expect(finalString).assertEqual('abc');
        done();
      })

    // /**
    //  * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0133
    //  * @tc.name      : TaskPoolTestClass133
    //  * @tc.desc      : handle cancel task error
    //  * @tc.size      : MediumTest
    //  * @tc.type      : Function
    //  * @tc.level     : Level 0
    //  */
    // it('TaskPoolTestClass133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     let isTerminate1: boolean = false;
    //     let isTerminate2: boolean = false;
    //     let isTerminate3: boolean = false;
    //     let isTerminate4: boolean = false;
    //     let finalString: string = '';
    //     let task1: taskpool.Task = new taskpool.Task(dependend, 1);
    //     let task2: taskpool.Task = new taskpool.Task(dependend, 2);
    //     let task3: taskpool.Task = new taskpool.Task(dependend, 3);
    //     let task4: taskpool.Task = new taskpool.Task(dependend, 4);
    //     task4.addDependency(task1, task2, task3);
    //     taskpool.execute(task1).then((): void => {
    //       finalString += 'a';
    //       isTerminate1 = true;
    //     });
    //     taskpool.execute(task2).then((): void => {
    //       finalString += 'b';
    //       isTerminate2 = true;
    //     });
    //     taskpool.execute(task3).then((): void => {
    //       finalString += 'c';
    //       isTerminate3 = true;
    //     });
    //     taskpool.execute(task4).then((): void => {
    //       finalString += 'd';
    //       isTerminate4 = true;
    //     });
    //     while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
    //       await waitWithPromiseCase();
    //     }
    //     expect(finalString.charAt(3)).assertEqual('d');
    //     done();
    //   })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0134
     * @tc.name      : TaskPoolTestClass134
     * @tc.desc      : execute long task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10.0, 20.0);
        let result: NullishType = await taskpool.execute(task);
        taskpool.terminateTask(task);
        expect(result as number).assertEqual(30);
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0135
     * @tc.name      : TaskPoolTestClass135
     * @tc.desc      : the long task can only be executed once
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10.0, 20.0);
        let result: NullishType = await taskpool.execute(task);
        taskpool.terminateTask(task);
        try {
          taskpool.execute(task)
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: The long task can only be executed once');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0136
     * @tc.name      : TaskPoolTestClass136
     * @tc.desc      : task group does not support the long task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10.0, 20.0);
        let group = new taskpool.TaskGroup();
        try {
          group.addTask(task)
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: The interface does not support the long task');
        }
        done();
      })


    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0138
     * @tc.name      : TaskPoolTestClass138
     * @tc.desc      : taskpool support isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isFinish: boolean = false;
        let isDoneFlag: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);

        taskpool.execute(task1).then((): void => {
          isFinish = true;
        });
        while (!isFinish) {
          await waitWithPromiseCase();
          ;
        }
        if (!task1.isDone()) {
          taskpool.cancel(task1);
          isDoneFlag = true;
        }
        expect(string(isDoneFlag)).assertEqual('false');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0139
     * @tc.name      : TaskPoolTestClass139
     * @tc.desc      : taskpool support isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isDoneFlag: boolean = false;
        let task1: taskpool.Task = new taskpool.Task(testCancelDelayed);
        taskpool.execute(task1);
        let t = Date.now()
        while ((Date.now() - t) < 1000.0) {
          continue;
        }
        taskpool.execute(task1);
        taskpool.execute(task1);
        if (!task1.isDone()) {
          taskpool.cancel(task1);
          isDoneFlag = true;
        }
        expect(string(isDoneFlag)).assertEqual('true');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0140
     * @tc.name      : TaskPoolTestClass140
     * @tc.desc      : taskpool error test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task: taskpool.Task = new taskpool.Task(errorTest)
        taskpool.execute(task).then((res: NullishType): void => {
          console.info('errTest res ' + res)
        }).catch((e: Error): void => {
          expect(e.message).assertContain('this is an error');
        })
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0141
     * @tc.name      : TaskPoolTestClass141
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let finalString: string = '';
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;

        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        taskpool.execute(task1, taskpool.Priority.IDLE).then((): void => {
          finalString += 'a';
          isTerminate1 = true;
        })
        taskpool.execute(task2, taskpool.Priority.IDLE).then((): void => {
          finalString += 'b';
          isTerminate2 = true;
        })
        taskpool.execute(task3).then((): void => {
          finalString += 'c';
          isTerminate3 = true;
        })
        while (!isTerminate3) {
          await waitWithPromiseCase();
        }
        expect(finalString.charAt(0).toString()).assertEqual('c');
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0142
     * @tc.name      : TaskPoolTestClass142
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 300.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 500.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        taskpool.execute(task1, taskpool.Priority.IDLE);
        taskpool.execute(task2, taskpool.Priority.IDLE);
        taskpool.execute(task3, taskpool.Priority.IDLE);
        taskpool.cancel(task1);
        try {
          task1.removeDependency(task2);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: executedTask cannot removeDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0143
     * @tc.name      : TaskPoolTestClass143
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(delaySum, 10.0, 20.0, 100.0)
        let task2: taskpool.Task = new taskpool.Task(delaySum, 30.0, 40.0, 200.0)
        let task3: taskpool.Task = new taskpool.Task(delaySum, 50.0, 60.0, 300.0)
        task1.addDependency(task2);
        task2.addDependency(task3);
        taskpool.execute(task1, taskpool.Priority.IDLE).then((): void => {
          console.info('task1 success');
        })
        taskpool.execute(task2, taskpool.Priority.IDLE).then((): void => {
          console.info('task2 success');
        })
        taskpool.execute(task3, taskpool.Priority.IDLE).then((): void => {
          console.info('task3 success');
        })

        try {
          task2.removeDependency(task3);
        } catch (e: Error) {
          expect(e.message)
            .assertEqual('taskpool:: executedTask cannot removeDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0144
     * @tc.name      : TaskPoolTestClass144
     * @tc.desc      : executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          taskpool.executeDelayed(100, task1, taskpool.Priority.IDLE);
          task1.addDependency(task2);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask or executedTask cannot addDependency');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0145
     * @tc.name      : TaskPoolTestClass145
     * @tc.desc      : Cancel the executeDelayed for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let isTerminate1: boolean = false;
        let task: taskpool.Task = new taskpool.Task(printArgs)
        taskpool.executeDelayed(1000, task, taskpool.Priority.IDLE).then((): void => {
        }).catch((e: Error): void => {
          isTerminate1 = true;
          expect(e.message).assertEqual('taskpool:: task has been canceled');
        })
        taskpool.cancel(task);
        while (!isTerminate1) {
          await waitWithPromiseCase();
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0146
     * @tc.name      : TaskPoolTestClass146
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
          runner.execute(task);
          taskpool.executeDelayed(100, task, taskpool.Priority.IDLE);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: seqRunnerTask cannot executeDelayed outside');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0147
     * @tc.name      : TaskPoolTestClass147
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        task1.addDependency(task2);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
        try {
          runner.execute(task1);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: sequenceRunner dependent task not allowed.');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0148
     * @tc.name      : TaskPoolTestClass148
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let task: taskpool.Task = new taskpool.Task(printArgs, 100.0);
          let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
          runner.execute(task);
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          taskGroup.addTask(task);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: taskGroup cannot add seqRunnerTask or executedTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0149
     * @tc.name      : TaskPoolTestClass149
     * @tc.desc      : taskGroup cannot addTask
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(printArgs, 40.0);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 50.0);
        try {
          taskGroup.addTask(printArgs, 10.0);
          taskGroup.addTask(printArgs, 20.0);
          taskGroup.addTask(printArgs, 30.0);
          taskpool.execute(taskGroup, taskpool.Priority.IDLE);
          taskGroup.addTask(task1);
          taskGroup.addTask(task2);
          taskpool.execute(taskGroup, taskpool.Priority.IDLE);
        } catch (e: Error) {
          expect(e.message).assertEqual('taskpool:: executed taskGroup cannot addTask');
        }
        done();
      })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0150
     * @tc.name      : TaskPoolTestClass150
     * @tc.desc      : Cancel the taskGroup in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let i: number = 10;
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(AdditionDelay, 10.0);
        taskGroup1.addTask(AdditionDelay, 20.0);
        taskGroup1.addTask(AdditionDelay, 30.0);

        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100.0);
        let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200.0);
        let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300.0);
        taskGroup2.addTask(task1);
        taskGroup2.addTask(task2);
        taskGroup2.addTask(task3);
        taskpool.execute(taskGroup1, taskpool.Priority.IDLE).then((): void => {
          ++i;
        });
        taskpool.execute(taskGroup2, taskpool.Priority.IDLE);

        taskpool.cancel(taskGroup1);
        expect(i).assertEqual(10)
        done();
      })


