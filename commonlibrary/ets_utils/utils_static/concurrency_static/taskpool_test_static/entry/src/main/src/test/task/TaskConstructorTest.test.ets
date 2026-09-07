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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll} from '../../../../hypium';
import Utils from '../Util.test';

let normalFunc = (): void => {}
let noArgsFunc = (): number => { return 1 }
let oneArgFunc = (n: number): number => { return n * 2 }
let multiArgsFunc = (a: number, b: string, c: boolean): string => { return b + a }
let manyArgsFunc = (a1: number, a2: number, a3: number, a4: number, a5: number, a6: number, a7: number, a8: number, a9: number, a10: number): number => { return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 }
let returnStringFunc = (): string => { return "result" }
let defaultParamFunc = (x: number, y: number): number => { return x + y }
let asyncFunc = async (x: number): Promise<number> => { return x * 2 }
let promiseFunc = (x: number): Promise<number> => { return Promise.resolve(x * 2) }
let numFunc = (n: number): number => { return n * 2 }
let strFunc = (s: string): string => { return s + "!" }
let boolFunc = (b: boolean): string => { return b ? "yes" : "no" }
let arrFunc = (arr: number[]): number => { return arr.length }
let mixedFunc = (n: number, s: string, b: boolean): string => { return s + n }
let emptyStrFunc = (s: string): boolean => { return s === "" }
let zeroFunc = (n: number): boolean => { return n === 0 }
let negFunc = (n: number): number => { return Math.abs(n) }
let longStrFunc = (s: string): number => { return s.length }
let throwFunc = (): number => { throw new Error("always throws") }
let paramFunc = (x: number, y: number): number => { return x + y }
let sharedFunc = (x: number): number => { return x * 2 }

export default function TaskConstructorTest(): void {
  describe('TaskConstructorTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskConstructorTest0100
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify Task constructor with required func parameter executes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(normalFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0200
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify Task constructor with function and no args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(noArgsFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0300
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify Task constructor with one arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(oneArgFunc, 10.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0400
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify Task constructor with multiple args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiArgsFunc, 100.0, "test", true);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertContain("test");
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0500
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify Task constructor with many args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(manyArgsFunc, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(55);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0600
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify Task constructor with normal arrow function executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let normalArrowFunc = (x: number): number => { return x * 2 }
      let task: taskpool.Task = new taskpool.Task(normalArrowFunc, 5.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0700
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify Task constructor with async function executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(asyncFunc, 5.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0800
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify Task constructor with function returning string executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnStringFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskConstructorTest0900
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify Task constructor with two number args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(defaultParamFunc, 5.0, 10.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(15);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1000
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify Task constructor with number arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(numFunc, 123.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(246);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1100
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify Task constructor with string arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(strFunc, "hello");
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("hello!");
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1200
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify Task constructor with boolean arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(boolFunc, true);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("yes");
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1300
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify Task constructor with array arg executes and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(arrFunc, [1.0, 2.0, 3.0, 4.0, 5.0]);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(5);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1400
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify Task constructor with null arg value executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nullArgFunc = (x: Object | null): boolean => { return x === null }
      let task: taskpool.Task = new taskpool.Task(nullArgFunc, null);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1500
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify Task constructor with undefined arg value executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let undefArgFunc = (x: Any): boolean => { return x === undefined }
      let task: taskpool.Task = new taskpool.Task(undefArgFunc, undefined);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1600
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify Task constructor with mixed type args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(mixedFunc, 100.0, "test", false);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result === 'string').assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1700
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify Task constructor with empty string arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(emptyStrFunc, "");
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1800
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify Task constructor with zero value arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(zeroFunc, 0.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest1900
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify Task constructor with negative number arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(negFunc, -100.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2000
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify Task constructor with MAX_VALUE arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let maxFunc = (n: number): boolean => { return n === Number.MAX_VALUE }
      let task: taskpool.Task = new taskpool.Task(maxFunc, Number.MAX_VALUE);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2100
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify Task constructor with MIN_VALUE arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let minFunc = (n: number): boolean => { return n === Number.MIN_VALUE }
      let task: taskpool.Task = new taskpool.Task(minFunc, Number.MIN_VALUE);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2200
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify Task constructor with long string arg executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longStr = "aaaaaaaaaa";
      let task: taskpool.Task = new taskpool.Task(longStrFunc, longStr);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2300
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2300
     * @tc.desc   Verify Task constructor with args executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(paramFunc, 10.0, 20.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2400
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2400
     * @tc.desc   Verify Task.totalDuration initial value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(normalFunc);
      expect(task.totalDuration).assertEqual(0);
    })

    /**
     * @tc.name   TaskConstructorTest2500
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2500
     * @tc.desc   Verify Task.ioDuration initial value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(normalFunc);
      expect(task.ioDuration).assertEqual(0);
    })

    /**
     * @tc.name   TaskConstructorTest2600
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2600
     * @tc.desc   Verify Task.cpuDuration initial value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(normalFunc);
      expect(task.cpuDuration).assertEqual(0);
    })

    /**
     * @tc.name   TaskConstructorTest2700
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2700
     * @tc.desc   Verify Task.name without name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(normalFunc);
      expect(task.name.length > 0).assertTrue();
    })

    /**
     * @tc.name   TaskConstructorTest2800
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2800
     * @tc.desc   Verify Task.arguments stores passed args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(oneArgFunc, 100.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      expect((task.arguments as Object[]).length).assertEqual(1);
      expect((task.arguments as Object[])[0] as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskConstructorTest2900
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_2900
     * @tc.desc   Verify creating multiple different Task objects all execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let func1 = (): void => {}
      let func2 = (x: number): number => { return x }
      let func3 = (s: string): string => { return s }
      let task1: taskpool.Task = new taskpool.Task(func1);
      let task2: taskpool.Task = new taskpool.Task(func2, 10.0);
      let task3: taskpool.Task = new taskpool.Task(func3, "hello");
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      let result3: Any = undefined;
      try {
        result3 = await taskpool.execute(task3);
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 === undefined).assertTrue();
      expect(result2 as number).assertEqual(10);
      expect(result3 as string).assertEqual("hello");
      done();
    })

    /**
     * @tc.name   TaskConstructorTest3000
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3000
     * @tc.desc   Verify creating multiple Task objects with same function all execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(sharedFunc, 1.0);
      let task2: taskpool.Task = new taskpool.Task(sharedFunc, 2.0);
      let task3: taskpool.Task = new taskpool.Task(sharedFunc, 3.0);
      try {
        let result1 = await taskpool.execute(task1);
        let result2 = await taskpool.execute(task2);
        let result3 = await taskpool.execute(task3);
        expect(result1 as number).assertEqual(2);
        expect(result2 as number).assertEqual(4);
        expect(result3 as number).assertEqual(6);
        expect(task1.taskId !== task2.taskId).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskConstructorTest3100
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3100
     * @tc.desc   Verify Task constructor with throw function throws error on execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(throwFunc);
      try {
        let result = await taskpool.execute(task);
        expect().assertFail();
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskConstructorTest3200
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3200
     * @tc.desc   Verify Task constructor with Promise-returning function executes and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(promiseFunc, 10.0);
      try {
        let result = await taskpool.execute(task);
        expect(result as number).assertEqual(20);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskConstructorTest3300
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3300
     * @tc.desc   Verify multiple Tasks sharing same function definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tasks: taskpool.Task[] = [
        new taskpool.Task(sharedFunc, 1.0),
        new taskpool.Task(sharedFunc, 2.0),
        new taskpool.Task(sharedFunc, 3.0)
      ];
      expect(tasks.length).assertEqual(3);
      for (let i = 0; i < tasks.length; i++) {
        expect(tasks[i].taskId > 0).assertTrue();
      }
    })

    /**
     * @tc.name   TaskConstructorTest3400
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3400
     * @tc.desc   Verify creating 10 Tasks in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let loopFunc = (x: number): number => { return x }
      let tasks: taskpool.Task[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(loopFunc, i));
      }
      expect(tasks.length).assertEqual(10);
      for (let i = 0; i < tasks.length; i++) {
        expect(tasks[i].taskId > 0).assertTrue();
      }
    })

    /**
     * @tc.name   TaskConstructorTest3500
     * @tc.number SUB_TASK_CONSTRUCTOR_TEST_3500
     * @tc.desc   Verify async function Task executes successfully after creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskConstructorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let asyncTestFunc = async (): Promise<void> => {}
      let task: taskpool.Task = new taskpool.Task(asyncTestFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      expect(task.taskId > 0).assertTrue();
      done();
    })



  })
}
