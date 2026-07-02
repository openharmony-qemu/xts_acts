'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

let runHelperNoArgs = (): number => {
  return 42
}

let runHelperSingleArg = (n: number): number => {
  return n * 2
}

let runHelperMultiArgs = (a: number, b: number, c: number): number => {
  return a + b + c
}

let runHelperTenArgs = (a1: number, a2: number, a3: number, a4: number, a5: number,
  a6: number, a7: number, a8: number, a9: number, a10: number): number => {
  return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
}

let runHelperStringArg = (s: string): string => {
  return 'hello ' + s
}

let runHelperBoolArg = (b: boolean): string => {
  return b ? 'yes' : 'no'
}

let runHelperVoidTask = (): void => {
}

let runHelperComputeTask = (n: number): number => {
  let sum: number = 0
  for (let i = 0; i < n; i++) {
    sum += i
  }
  return sum
}

let runHelperThrowTask = (): number => {
  throw new Error('task error')
}

class RunTestCustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'RunTestCustomError'
  }
}

let runHelperCustomErrorTask = (): number => {
  throw new RunTestCustomError('custom error')
}

let runHelperReturnString = (): string => {
  return 'test'
}

let runHelperReturnBoolean = (): boolean => {
  return true
}

let runHelperReturnFalse = (): boolean => {
  return false
}

let runHelperReturnZero = (): number => {
  return 0
}

export default function BuiltinsEAWorkerRunTest(): void {
  describe('BuiltinsEAWorkerRunTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0100
     * @tc.desc   Verify EAWorker.run() with no args returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runNoArgs')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperNoArgs).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0200
     * @tc.desc   Verify EAWorker.run() with single number arg returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runSingleArg')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperSingleArg, 21.0).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0300
     * @tc.desc   Verify EAWorker.run() with multiple args returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runMultiArgs')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperMultiArgs, 10.0, 20.0, 30.0).Await()
      expect(result).assertEqual(60)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0400
     * @tc.desc   Verify EAWorker.run() with 10 args returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runTenArgs')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperTenArgs, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0).Await()
      expect(result).assertEqual(55)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0500
     * @tc.desc   Verify EAWorker.run() with arrow function task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runArrow')
      eaWorker.start()
      let result: number = eaWorker.run<number>((x: number): number => x * 2, 21.0).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0600
     * @tc.desc   Verify EAWorker.run() with void return task executes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let voidExecuted: boolean = false
      let eaWorker = new EAWorker('runVoid')
      eaWorker.start()
      eaWorker.run<void>((): void => { voidExecuted = true }).Await()
      expect(voidExecuted).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0700
     * @tc.desc   Verify EAWorker.run() with string arg returns correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runStringArg')
      eaWorker.start()
      let result: string = eaWorker.run<string>(runHelperStringArg, 'world').Await()
      expect(result).assertEqual('hello world')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0800
     * @tc.desc   Verify EAWorker.run() with boolean arg true returns correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runBoolArg')
      eaWorker.start()
      let result: string = eaWorker.run<string>(runHelperBoolArg, true).Await()
      expect(result).assertEqual('yes')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_0900
     * @tc.desc   Verify EAWorker.run() returns string type correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runReturnStr')
      eaWorker.start()
      let result: string = eaWorker.run<string>(runHelperReturnString).Await()
      expect(typeof result).assertEqual('string')
      expect(result).assertEqual('test')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1000
     * @tc.desc   Verify EAWorker.run() returns boolean true correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runReturnBool')
      eaWorker.start()
      let result: boolean = eaWorker.run<boolean>(runHelperReturnBoolean).Await()
      expect(result).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1100
     * @tc.desc   Verify EAWorker.run() returns boolean false correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runReturnFalse')
      eaWorker.start()
      let result: boolean = eaWorker.run<boolean>(runHelperReturnFalse).Await()
      expect(result).assertFalse()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1200
     * @tc.desc   Verify EAWorker.run() returns number 0 correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runReturnZero')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperReturnZero).Await()
      expect(result).assertEqual(0)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1300
     * @tc.desc   Verify EAWorker.run() returns typeof number correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runTypeof')
      eaWorker.start()
      let resultNum: number = eaWorker.run<number>((): number => 123).Await()
      expect(typeof resultNum).assertEqual('number')
      let resultStr: string = eaWorker.run<string>((): string => 'test').Await()
      expect(typeof resultStr).assertEqual('string')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1400
     * @tc.desc   Verify EAWorker.run() task throws Error and is caught correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runThrow')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.run<number>(runHelperThrowTask).Await()
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1500
     * @tc.desc   Verify EAWorker.run() task throws custom Error and is caught correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsEAWorkerRunTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runCustomErr')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.run<number>(runHelperCustomErrorTask).Await()
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1600
     * @tc.desc   Verify EAWorker.run() without start throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runNoStart')
      let caught: boolean = false
      try {
        eaWorker.run<number>(runHelperNoArgs).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.start()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1700
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1700
     * @tc.desc   Verify EAWorker.run() with compute task returns correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runCompute')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperComputeTask, 100.0).Await()
      expect(result).assertEqual(4950)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1800
     * @tc.desc   Verify EAWorker.run() sequential tasks execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runSeq')
      eaWorker.start()
      let results: number[] = []
      let r1: number = eaWorker.run<number>((): number => 1).Await()
      results.push(r1)
      let r2: number = eaWorker.run<number>((): number => 2).Await()
      results.push(r2)
      let r3: number = eaWorker.run<number>((): number => 3).Await()
      results.push(r3)
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_1900
     * @tc.desc   Verify EAWorker.run() concurrent 3 tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runConc3')
      eaWorker.start()
      let p1: Job<number> = eaWorker.run<number>((): number => 10)
      let p2: Job<number> = eaWorker.run<number>((): number => 20)
      let p3: Job<number> = eaWorker.run<number>((): number => 30)
      let results: number[] = [p1.Await(), p2.Await(), p3.Await()]
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(10)
      expect(results[1]).assertEqual(20)
      expect(results[2]).assertEqual(30)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2000
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2000
     * @tc.desc   Verify EAWorker.run() concurrent 5 tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runConc5')
      eaWorker.start()
      let jobs: Job<number>[] = []
      for (let i = 0; i < 5; i++) {
        let idx: number = i
        jobs.push(eaWorker.run<number>((): number => idx * 10))
      }
      let results: number[] = []
      for (let i = 0; i < jobs.length; i++) {
        results.push(jobs[i].Await())
      }
      expect(results.length).assertEqual(5)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2100
     * @tc.desc   Verify EAWorker.run() concurrent 10 tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runConc10')
      eaWorker.start()
      let jobs: Job<number>[] = []
      for (let i = 0; i < 10; i++) {
        let idx: number = i
        jobs.push(eaWorker.run<number>((): number => idx))
      }
      let results: number[] = []
      for (let i = 0; i < jobs.length; i++) {
        results.push(jobs[i].Await())
      }
      expect(results.length).assertEqual(10)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2200
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2200
     * @tc.desc   Verify EAWorker.run() with local variable in task callback returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runNested')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        let innerResult: number = 100
        return innerResult
      }).Await()
      expect(result).assertEqual(100)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2300
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2300
     * @tc.desc   Verify EAWorker.run() with needInterop=true returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runInterop', true)
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 99).Await()
      expect(result).assertEqual(99)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2400
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2400
     * @tc.desc   Verify EAWorker.run() performance measurement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runPerf')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2500
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2500
     * @tc.desc   Verify EAWorker.run() with try-catch-finally handles error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runTryCatch')
      eaWorker.start()
      let finallyExecuted: boolean = false
      try {
        eaWorker.run<number>(runHelperThrowTask).Await()
      } catch (e) {
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2600
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2600
     * @tc.desc   Verify EAWorker.run() with boolean arg false returns correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runBoolFalse')
      eaWorker.start()
      let result: string = eaWorker.run<string>(runHelperBoolArg, false).Await()
      expect(result).assertEqual('no')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2700
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2700
     * @tc.desc   Verify EAWorker.run() batch 50 sequential tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsEAWorkerRunTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let eaWorker = new EAWorker('runBatch50')
      eaWorker.start()
      let results: number[] = []
      for (let i = 0; i < 50; i++) {
        let idx: number = i
        let result: number = eaWorker.run<number>((): number => idx).Await()
        results.push(result)
      }
      expect(results.length).assertEqual(50)
      expect(results[0]).assertEqual(0)
      expect(results[49]).assertEqual(49)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2800
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2800
     * @tc.desc   Verify EAWorker.run() with multiple workers run tasks concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let workers: EAWorker[] = []
      let jobs: Job<number>[] = []
      for (let i = 0; i < 3; i++) {
        let worker = new EAWorker(`multiW_${i}`)
        worker.start()
        workers.push(worker)
        let idx: number = i
        jobs.push(worker.run<number>((): number => idx * 100))
      }
      let results: number[] = []
      for (let i = 0; i < jobs.length; i++) {
        results.push(jobs[i].Await())
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(0)
      expect(results[1]).assertEqual(100)
      expect(results[2]).assertEqual(200)
      for (let i = 0; i < workers.length; i++) {
        workers[i].join().Await()
      }
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest2900
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_2900
     * @tc.desc   Verify EAWorker.run() returns Promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runPromise')
      eaWorker.start()
      let job: Job<number> = eaWorker.run<number>((): number => 42)
      let result: number = job.Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3000
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3000
     * @tc.desc   Verify EAWorker.run() with negative number arg returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runNegArg')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperSingleArg, -5.0).Await()
      expect(result).assertEqual(-10)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3100
     * @tc.desc   Verify EAWorker.run() with float number arg returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runFloatArg')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperSingleArg, 3.5).Await()
      expect(result).assertEqual(7)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3200
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3200
     * @tc.desc   Verify EAWorker.run() with empty string arg returns correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runEmptyStr')
      eaWorker.start()
      let result: string = eaWorker.run<string>(runHelperStringArg, '').Await()
      expect(result).assertEqual('hello ')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3300
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3300
     * @tc.desc   Verify EAWorker.run() error in task does not kill worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runErrContinue')
      eaWorker.start()
      try {
        eaWorker.run<number>(runHelperThrowTask).Await()
      } catch (e) {
        // Expected error
      }
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3400
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3400
     * @tc.desc   Verify EAWorker.run() with setUncaughtExceptionHandler handles errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handlerCalled: boolean = false
      let eaWorker = new EAWorker('runHandler')
      eaWorker.setUncaughtExceptionHandler((error: Error): void => {
        handlerCalled = true
      })
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => 42).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3500
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3500
     * @tc.desc   Verify EAWorker.run() with named function task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runNamed')
      eaWorker.start()
      let result: number = eaWorker.run<number>(runHelperSingleArg, 15.0).Await()
      expect(result).assertEqual(30)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3600
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3600
     * @tc.desc   Verify EAWorker.run() with async function task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runAsync')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        return 42
      }).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3700
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3700
     * @tc.desc   Verify EAWorker.run() with task returning number array returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runArray')
      eaWorker.start()
      let result: number[] = eaWorker.run<number[]>((): number[] => [1, 2, 3, 4, 5]).Await()
      expect(result.length).assertEqual(5)
      expect(result[0]).assertEqual(1)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3800
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3800
     * @tc.desc   Verify EAWorker.run() with task returning empty array returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runEmptyArr')
      eaWorker.start()
      let result: number[] = eaWorker.run<number[]>((): number[] => []).Await()
      expect(result.length).assertEqual(0)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest3900
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_3900
     * @tc.desc   Verify EAWorker.run() with null as task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runNullTask')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.run<number>(null as Object as ()=>number).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4000
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4000
     * @tc.desc   Verify EAWorker.run() with undefined as task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runUndefTask')
      eaWorker.start()
      let caught: boolean = false
      try {
        eaWorker.run<number>(undefined as Object as ()=>number).Await()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4100
     * @tc.desc   Verify EAWorker.run() with array arg passes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runArrArg')
      eaWorker.start()
      let arr: number[] = [10, 20, 30]
      let result: number = eaWorker.run<number>((a: number[]): number => a.length, arr).Await()
      expect(result).assertEqual(3)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4200
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4200
     * @tc.desc   Verify EAWorker.run() creates nested EAWorker inside task callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runOuter')
      eaWorker.start()
      let nestedCreated: boolean = false
      let result: number = eaWorker.run<number>((): number => {
        let nestedWorker = new EAWorker('runNested')
        nestedWorker.start()
        nestedCreated = true
        return 42
      }).Await()
      expect(result).assertEqual(42)
      expect(nestedCreated).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4300
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4300
     * @tc.desc   Verify EAWorker.run() task returning null returns null correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runNull')
      eaWorker.start()
      let result: Object | null = eaWorker.run<Object | null>((): Object | null => {
        return null
      }).Await()
      expect(result === null).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4400
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4400
     * @tc.desc   Verify EAWorker.run() task returning undefined returns undefined correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runUndef')
      eaWorker.start()
      let result: Object | undefined = eaWorker.run<Object | undefined>((): Object | undefined => {
        return undefined
      }).Await()
      expect(result === undefined).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4500
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4500
     * @tc.desc   Verify EAWorker.run() with object type arg passes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runObjArg')
      eaWorker.start()
      let objName: string = 'test'
      let result: string = eaWorker.run<string>((name: string): string => {
        return name
      }, objName).Await()
      expect(result).assertEqual('test')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4600
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4600
     * @tc.desc   Verify EAWorker.run() with null as args parameter passes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runNullArg')
      eaWorker.start()
      let result: boolean = eaWorker.run<boolean>((n: number | null): boolean => {
        return n === null
      }, null).Await()
      expect(result).assertTrue()
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4700
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4700
     * @tc.desc   Verify EAWorker.run() with anonymous function expression returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsEAWorkerRunTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('runAnon')
      eaWorker.start()
      let result: number = eaWorker.run<number>((): number => {
        return 42
      }).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4800
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4800
     * @tc.desc   Verify EAWorker.run() with task returning object returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runObjReturn')
      eaWorker.start()
      let result: Object = eaWorker.run<Object>((): Object => {
        let obj: Record<string, Object> = {}
        obj['result'] = 42
        obj['status'] = 'success'
        return obj as Object
      }).Await()
      let obj = result as Record<string, Object>
      expect(obj['result']).assertEqual(42)
      expect(obj['status']).assertEqual('success')
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest4900
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_4900
     * @tc.desc   Verify EAWorker.run() with task returning empty object returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsEAWorkerRunTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = new EAWorker('runEmptyObj')
      eaWorker.start()
      let result: Object = eaWorker.run<Object>((): Object => {
        return {} as Object
      }).Await()
      let keys: string[] = Object.keys(result)
      expect(keys.length).assertEqual(0)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest5000
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_5000
     * @tc.desc   Verify EAWorker.run() with shared object as arg passes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedCounter: number = 0
      let eaWorker = new EAWorker('runShared')
      eaWorker.start()
      let result: number = eaWorker.run<number>((counter: number): number => {
        return counter + 1
      }, sharedCounter).Await()
      expect(result).assertEqual(1)
      eaWorker.join().Await()
    })

    /**
     * @tc.name   BuiltinsEAWorkerRunTest5100
     * @tc.number SUB_BUILTINS_EAWORKER_RUN_TEST_5100
     * @tc.desc   Verify EAWorker.run() nested run call inside task callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsEAWorkerRunTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eaWorker = new EAWorker('runNestedRun')
      eaWorker.start()
      let innerResult: number = 0
      let result: number = eaWorker.run<number>((): number => {
        let innerJob: Job<number> = eaWorker.run<number>((): number => 100)
        return 42
      }).Await()
      expect(result).assertEqual(42)
      eaWorker.join().Await()
    })
  })
}
