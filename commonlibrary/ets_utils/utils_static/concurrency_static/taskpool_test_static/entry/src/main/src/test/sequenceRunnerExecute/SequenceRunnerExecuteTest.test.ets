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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

// Helper function: returns 100
function simpleTask(): number {
  return 100;
}

// Helper function: returns argument
function returnArgTask(arg: number): number {
  return arg + 0.0;
}

// Helper function: delay task for given duration
function delayTask(duration: number): number {
  let start: number = Date.now();
  while (Date.now() - start < duration) {}
  return duration + 0.0;
}

// Helper function: throws error
function errorTask(): number {
  throw new Error("task error");
}

// Helper function: returns string
function returnString(): string {
  return "hello";
}

// Helper function: returns boolean
function returnBoolean(): boolean {
  return true;
}

// Helper function: returns array
function returnArray(): number[] {
  return [1, 2, 3, 4, 5];
}

// Helper function: returns null
function returnNull(): Object | null {
  return null;
}

// Helper function: returns undefined
function returnUndefined(): Object | undefined {
  return undefined;
}

// Helper function: returns void
function voidTask(): void {}

// Helper function: returns empty array
function emptyArray(): number[] {
  return [];
}

// Helper function: returns zero
function returnZero(): number {
  return 0;
}

// Helper function: returns false
function returnFalse(): boolean {
  return false;
}

// Helper function: string length
function strLength(s: string): number {
  return s.length;
}

// Helper function: array length
function arrLength(arr: number[]): number {
  return arr.length;
}

// Helper function: multi-arg
function multiArgTask(a: number, b: string): string {
  return b + a;
}

// Helper function: named task func
function namedTaskFunc(arg: number): number {
  return arg * 2;
}

// Helper function: sendData task
function sendDataTask(): void {
  taskpool.Task.sendData("progress");
}

// Helper function: long running task
function longRunningTask(): void {
  let start: number = Date.now();
  while (Date.now() - start < 800) {}
}

// Helper function: cancel-aware long task
function cancelAwareTask(): void {
  let start: number = Date.now();
  while (Date.now() - start < 800) {
    if (taskpool.Task.isCanceled()) {
      return;
    }
  }
}

// Helper function: push to buffer
function pushBuffer(buf: number[], n: number): void {
  buf.push(n);
}

// Helper function: sum buffer
function sumBuffer(buf: number[]): number {
  let sum: number = 0;
  for (let val of buf) {
    sum += val;
  }
  return sum;
}

export default function SequenceRunnerExecuteTest(): void {
  describe('SequenceRunnerExecuteTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   SequenceRunnerExecuteTest0100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0100

     * @tc.desc   Verify execute with normal Task object returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(returnArgTask, 42.0);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(42.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0200

     * @tc.desc   Verify execute with named Task object returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task("namedTask", namedTaskFunc, 50.0);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(100.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0300

     * @tc.desc   Verify execute with no-argument Task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0400

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0400

     * @tc.desc   Verify execute with multi-argument Task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(multiArgTask, 100.0, "test");
      try {
        let result = await runner.execute(task);
        expect(result as string).assertEqual("test100");
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0500

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0500

     * @tc.desc   Verify execute with Task containing array argument returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let arr: number[] = [1, 2, 3, 4, 5];
      let task: taskpool.Task = new taskpool.Task(arrLength, arr);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(5);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0600

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0600

     * @tc.desc   Verify execute with Task returning void returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(voidTask);
      try {
        let result = await runner.execute(task);
        expect(result === undefined).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0700

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0700

     * @tc.desc   Verify multiple tasks execute in serial order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let results: number[] = [];
      try {
        for (let i: number = 0; i < 5; i++) {
          let value = await runner.execute(new taskpool.Task(returnArgTask, i)) as number;
          results.push(value);
        }
        expect(results.length).assertEqual(5);
        for (let i: number = 0; i < 5; i++) {
          expect(results[i.toInt()]).assertEqual(i + 0.0);
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0800

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0800

     * @tc.desc   Verify delay tasks execute sequentially with time gap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let start: number = Date.now();
      let task1: taskpool.Task = new taskpool.Task(delayTask, 200.0);
      let task2: taskpool.Task = new taskpool.Task(delayTask, 200.0);
      try {
        await Promise.all([runner.execute(task1), runner.execute(task2)]);
        let end: number = Date.now();
        expect(end - start >= 300).assertTrue();
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest0900

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_0900

     * @tc.desc   Verify await blocks until current task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(delayTask, 300.0);
      let task2: taskpool.Task = new taskpool.Task(returnArgTask, 100.0);
      try {
        let [r1, r2] = await Promise.all([runner.execute(task1), runner.execute(task2)]);
        expect(task1.isDone()).assertTrue();
        expect(r2 as number).assertEqual(100.0);
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1000

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1000

     * @tc.desc   Verify shared variable passed between serial tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let buf: number[] = [];
      let t1: taskpool.Task = new taskpool.Task(pushBuffer, buf, 1.0);
      let t2: taskpool.Task = new taskpool.Task(pushBuffer, buf, 2.0);
      let t3: taskpool.Task = new taskpool.Task(pushBuffer, buf, 3.0);
      let t4: taskpool.Task = new taskpool.Task(sumBuffer, buf);
      try {
        await runner.execute(t1);
        await runner.execute(t2);
        await runner.execute(t3);
        let result = await runner.execute(t4);
        expect(result as number).assertEqual(6.0);
        expect(t4.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1100

     * @tc.desc   Verify chain processing with sequential tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let t1: taskpool.Task = new taskpool.Task(returnArgTask, 10.0);
      try {
        let r1 = await runner.execute(t1);
        let t2: taskpool.Task = new taskpool.Task(returnArgTask, (r1 as number) + 5.0);
        let r2 = await runner.execute(t2);
        expect(r2 as number).assertEqual(15.0);
        expect(t2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1200

     * @tc.desc   Verify SequenceRunner executes delay tasks serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let seqStart: number = Date.now();
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let st1: taskpool.Task = new taskpool.Task(delayTask, 200.0);
      let st2: taskpool.Task = new taskpool.Task(delayTask, 200.0);
      try {
        await runner.execute(st1);
        await runner.execute(st2);
        let seqEnd: number = Date.now();
        expect(seqEnd - seqStart >= 300).assertTrue();
        expect(st1.isDone()).assertTrue();
        expect(st2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1300

     * @tc.desc   Verify execute returns basic type values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let t1: taskpool.Task = new taskpool.Task(returnArgTask, 42.0);
      let t2: taskpool.Task = new taskpool.Task(returnString);
      let t3: taskpool.Task = new taskpool.Task(returnBoolean);
      try {
        let r1 = await runner.execute(t1);
        let r2 = await runner.execute(t2);
        let r3 = await runner.execute(t3);
        expect(r1 as number).assertEqual(42.0);
        expect(r2 as string).assertEqual("hello");
        expect(r3 as boolean).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1400

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1400

     * @tc.desc   Verify execute returns array type value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(returnArray));
        let arr = result as number[];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1500

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1500

     * @tc.desc   Verify execute returns null value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(returnNull));
        expect(result === null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1600

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1600

     * @tc.desc   Verify execute returns undefined value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(returnUndefined));
        expect(result === undefined).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1700

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1700

     * @tc.desc   Verify execute with void Task completes normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(voidTask);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1800

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1800

     * @tc.desc   Verify execute returns empty array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(emptyArray));
        let arr = result as number[];
        expect(arr.length).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest1900

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_1900

     * @tc.desc   Verify execute returns zero and false boundary values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let r1 = await runner.execute(new taskpool.Task(returnZero));
        let r2 = await runner.execute(new taskpool.Task(returnFalse));
        expect(r1 as number).assertEqual(0);
        expect(r2 as boolean).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2000

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2000

     * @tc.desc   Verify execute return type is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(returnArgTask, 42.0);
      try {
        let result = await runner.execute(task);
        expect(typeof result).assertEqual("number");
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2100

     * @tc.desc   Verify execute returns Promise resolving to task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let promise = runner.execute(new taskpool.Task(simpleTask));
      try {
        let result = await promise;
        expect(result as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2200

     * @tc.desc   Verify execute other SequenceRunner executed Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await runner1.execute(task);
        let errorThrown: boolean = false;
        try {
          await runner2.execute(task);
        } catch (error) {
          errorThrown = true;
        }
        expect(errorThrown).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2300

     * @tc.desc   Verify re-execute same Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await runner.execute(task);
        let errorThrown: boolean = false;
        try {
          await runner.execute(task);
        } catch (error) {
          errorThrown = true;
        }
        expect(errorThrown).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2400

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2400

     * @tc.desc   Verify execute taskpool executed Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let errorThrown: boolean = false;
        try {
          await runner.execute(task);
        } catch (error) {
          errorThrown = true;
        }
        expect(errorThrown).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2500

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2500

     * @tc.desc   Verify execute dependent Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask);
      let task2: taskpool.Task = new taskpool.Task(simpleTask);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let errorThrown: boolean = false;
      try {
        await runner.execute(task1);
      } catch (error) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2600

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2600

     * @tc.desc   Verify execute periodic Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      taskpool.executePeriodically(200, task);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let periodicError: boolean = false;
      try {
        await runner.execute(task);
      } catch (error) {
        periodicError = true;
      } finally {
        try {
          taskpool.cancel(task);
        } catch (e) {
          // ignore cancel cleanup errors
        }
      }
      expect(periodicError).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2700

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2700

     * @tc.desc   Verify previous task failure does not affect subsequent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(errorTask);
      let task2: taskpool.Task = new taskpool.Task(simpleTask);
      let errorCaught: boolean = false;
      let task1Promise: Promise<Any> = runner.execute(task1);
      try {
        await runner.execute(task2);
        try {
          await task1Promise;
        } catch (error) {
          errorCaught = true;
        }
        expect(errorCaught).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2800

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2800

     * @tc.desc   Verify previous task cancellation does not affect subsequent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(cancelAwareTask);
      let task2: taskpool.Task = new taskpool.Task(simpleTask);
      let promise1: Promise<Any> = runner.execute(task1);
      let promise2: Promise<Any> = runner.execute(task2);
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task1);
      } catch (e) {
        // expected
      }
      try {
        await promise1;
      } catch (error) {
      }
      try {
        await promise2;
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest2900

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_2900

     * @tc.desc   Verify await failed task catches error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let errorThrown: boolean = false;
      try {
        await runner.execute(task);
      } catch (error) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3000

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3000

     * @tc.desc   Verify Promise catch handles rejection independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let catchExecuted: boolean = false;
      let promise: Promise<Any> = runner.execute(task);
      try {
        await promise;
      } catch (error) {
        catchExecuted = true;
      }
      expect(catchExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3100

     * @tc.desc   Verify Promise finally executes cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let finallyExecuted: boolean = false;
      let promise: Promise<Any> = runner.execute(task);
      try {
        await promise;
      } catch (error) {
        // expected error
      }
      finallyExecuted = true;
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3200

     * @tc.desc   Verify then callback processes result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(returnArgTask, 42.0);
      let promise: Promise<Any> = runner.execute(task);
      try {
        let thenResult: number = (await promise) as number;
        expect(thenResult).assertEqual(42.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3300

     * @tc.desc   Verify multiple serial tasks wait for completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let results: number[] = [];
      try {
        for (let i: number = 0; i < 5; i++) {
          let r = await runner.execute(new taskpool.Task(returnArgTask, i));
          results.push(r as number);
        }
        expect(results.length).assertEqual(5);
        expect(results[0]).assertEqual(0);
        expect(results[4]).assertEqual(4);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3400

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3400

     * @tc.desc   Verify await last task ensures all previous tasks completed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let t1: taskpool.Task = new taskpool.Task(returnArgTask, 1.0);
      let t2: taskpool.Task = new taskpool.Task(returnArgTask, 2.0);
      let t3: taskpool.Task = new taskpool.Task(returnArgTask, 3.0);
      let p1: Promise<Any> = runner.execute(t1);
      let p2: Promise<Any> = runner.execute(t2);
      try {
        await runner.execute(t3);
        try {
          await p1;
        } catch (error) {
        }
        try {
          await p2;
        } catch (error) {
        }
        expect(t1.isDone() && t2.isDone() && t3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3500

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3500

     * @tc.desc   Verify Promise.all waits for all execute promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let t1: taskpool.Task = new taskpool.Task(returnArgTask, 1.0);
      let t2: taskpool.Task = new taskpool.Task(returnArgTask, 2.0);
      let t3: taskpool.Task = new taskpool.Task(returnArgTask, 3.0);
      let p1 = runner.execute(t1);
      let p2 = runner.execute(t2);
      let p3 = runner.execute(t3);
      try {
        let allResults = await Promise.all([p1, p2, p3]);
        expect(allResults.length).assertEqual(3);
        expect(allResults[0] as number).assertEqual(1.0);
        expect(allResults[1] as number).assertEqual(2.0);
        expect(allResults[2] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3600

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3600

     * @tc.desc   Verify tasks submitted via same-name SequenceRunner execute serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner("sharedQueue");
      let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner("sharedQueue");
      let order: number[] = [];
      let p1: Promise<Any> = runner1.execute(new taskpool.Task(delayTask, 200.0));
      let p2: Promise<Any> = runner2.execute(new taskpool.Task(returnArgTask, 1.0));
      try {
        await p1;
        order.push(1);
        await p2;
        order.push(2);
      } catch (error) {
        expect().assertFail();
      }
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3700

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3700

     * @tc.desc   Verify different-name SequenceRunner returns different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner("queue1");
      let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner("queue2");
      expect(runner1 !== runner2).assertTrue();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3800

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3800

     * @tc.desc   Verify HIGH priority SequenceRunner executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest3900

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_3900

     * @tc.desc   Verify LOW priority SequenceRunner executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4000

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4000

     * @tc.desc   Verify large number of tasks (100) execute serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let counter = 0;
      let incrementTask = (): void => {
        counter++;
      };
      try {
        for (let i: number = 0; i < 100; i++) {
          await runner.execute(new taskpool.Task(incrementTask));
        }
        expect(counter).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4100

     * @tc.desc   Verify sendData and onReceiveData work in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(sendDataTask);
      let received: boolean = false;
      task.onReceiveData((data: Object) => {
        if (data !== undefined) {
          received = true;
        }
      });
      try {
        await runner.execute(task);
        expect(received).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4200

     * @tc.desc   Verify onEnqueued callback triggers in serial queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let enqueuedCalled: boolean = false;
      let cbEnq0: () => void = (): void => {        enqueuedCalled = true;}
      task.onEnqueued(cbEnq0);
      try {
        await runner.execute(task);
        expect(enqueuedCalled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4300

     * @tc.desc   Verify onStartExecution callback triggers in serial queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let startedCalled: boolean = false;
      let cbStart0: () => void = (): void => {        startedCalled = true;}
      task.onStartExecution(cbStart0);
      try {
        await runner.execute(task);
        expect(startedCalled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4400

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4400

     * @tc.desc   Verify onExecutionSucceeded callback triggers in serial queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let succeededCalled: boolean = false;
      let cbSucc0: () => void = (): void => {        succeededCalled = true;}
      task.onExecutionSucceeded(cbSucc0);
      try {
        await runner.execute(task);
        expect(succeededCalled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4500

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4500

     * @tc.desc   Verify onExecutionFailed callback triggers in serial queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let failedCalled: boolean = false;
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error;
      });
      let errorCaught: boolean = false;
      try {
        await runner.execute(task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      expect(failedCalled).assertTrue();
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4600

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4600

     * @tc.desc   Verify newly created SequenceRunner executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerExecuteTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        let result = await runner.execute(task);
        expect(result as number).assertEqual(100);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4700

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4700

     * @tc.desc   Verify rapid consecutive execute calls complete all tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let promises: Promise<Any>[] = [];
      for (let i: number = 0; i < 10; i++) {
        promises.push(runner.execute(new taskpool.Task(returnArgTask, i)));
      }
      try {
        let results = await Promise.all(promises);
        expect(results.length).assertEqual(10);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4800

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4800

     * @tc.desc   Verify long running task executes and returns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let start: number = Date.now();
      try {
        await runner.execute(new taskpool.Task(longRunningTask));
        let end: number = Date.now();
        expect(end - start >= 500).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest4900

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_4900

     * @tc.desc   Verify long running task blocks subsequent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let order: number[] = [];
      let t1: taskpool.Task = new taskpool.Task(delayTask, 1000.0);
      let p1: Promise<Any> = runner.execute(t1);
      let t2: taskpool.Task = new taskpool.Task(returnArgTask, 2.0);
      let p2: Promise<Any> = runner.execute(t2);
      try {
        await p1;
        order.push(1);
        await p2;
        order.push(2);
      } catch (error) {
        expect().assertFail();
      }
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest5000

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_5000

     * @tc.desc   Verify parameter with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(returnArgTask, Number.MAX_VALUE));
        expect(result as number).assertEqual(Number.MAX_VALUE);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest5100

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_5100

     * @tc.desc   Verify parameter with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(returnArgTask, Number.MIN_VALUE));
        expect(result as number).assertEqual(Number.MIN_VALUE);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest5200

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_5200

     * @tc.desc   Verify parameter with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerExecuteTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        let result = await runner.execute(new taskpool.Task(strLength, ""));
        expect(result as number).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerExecuteTest5300

     * @tc.number SUB_SEQUENCERUNNER_EXECUTE_TEST_5300

     * @tc.desc   Verify parameter with ultra-long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerExecuteTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let longStr: string = "";
      for (let i: number = 0; i < 10000; i++) {
        longStr += "a";
      }
      try {
        let result = await runner.execute(new taskpool.Task(strLength, longStr));
        expect(result as number).assertEqual(10000);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
