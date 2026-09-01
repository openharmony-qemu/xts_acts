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

// ========== 入参-参数个数 辅助函数 ==========
function noArgsFunc(): number {
  return 100;
}

function singleArgFunc(arg: number): number {
  return arg * 2.0;
}

function threeArgsFunc(a: number, b: number, c: number): number {
  return a + b + c + 0.0;
}

function fiveArgsFunc(a: number, b: number, c: number, d: number, e: number): number {
  return a + b + c + d + e + 0.0;
}

function tenArgsFunc(a1: number, a2: number, a3: number, a4: number, a5: number,
  a6: number, a7: number, a8: number, a9: number, a10: number): number {
  return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 + 0.0;
}

// ========== 入参-func类型 辅助函数 ==========
function normalFunc(x: number): number {
  return x + 1.0;
}

async function asyncFunc(x: number): Promise<number> {
  try {
    await Utils.msSleep(100);
  } catch (error) {
    expect().assertFail();
  }
  return x + 10.0;
}

function voidFunc(x: number): void {}

function objectFunc(): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["name"] = 100;
  return obj;
}

function arrayFunc(): number[] {
  return [1, 2, 3, 4, 5];
}

function promiseFunc(): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void) => {
    setTimeout(() => { resolve("success"); }, 500);
  });
}

// ========== 入参-args类型 辅助函数 ==========
function numFunc(n: number): number {
  return n * 2.0;
}

function maxFunc(n: number): number {
  return n + 0.0;
}

function minFunc(n: number): number {
  return n + 0.0;
}

function nanFunc(n: number): boolean {
  return Number.isNaN(n);
}

function infFunc(n: number): boolean {
  return n > 0 && !Number.isFinite(n);
}

function negFunc(n: number): number {
  return Math.abs(n) + 0.0;
}

function strFunc(s: string): string {
  return "hello " + s;
}

function emptyStrFunc(s: string): boolean {
  return s === "";
}

function spaceStrFunc(s: string): number {
  return s.length;
}

function unicodeStrFunc(s: string): number {
  return s.length;
}

function emojiStrFunc(s: string): boolean {
  return s.length > 0;
}

function longStrFunc(s: string): number {
  return s.length;
}

function boolFunc(b: boolean): string {
  return b ? "yes" : "no";
}

function objFunc(obj: Record<string, number>): number {
  let val: number = obj["value"] as number;
  return val + 0.0;
}

function emptyObjFunc(obj: Record<string, number>): boolean {
  let keys: string[] = Object.keys(obj);
  return keys.length === 0;
}

function arrFunc(arr: number[]): number {
  let sum: number = 0.0;
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum;
}

function emptyArrFunc(arr: number[]): boolean {
  return arr.length === 0;
}

function nullArgFunc(n: Object | null): boolean {
  return n === null;
}

function undefArgFunc(n: Any): boolean {
  return n === undefined;
}

function mixedFunc(a: number, b: string, c: boolean): string {
  return a + "-" + b + "-" + c;
}

// ========== 返回值测试 辅助函数 ==========
function returnFunc(): number {
  return 42.0;
}

function thenFunc(): number {
  return 100.0;
}

function awaitFunc(): string {
  return "await result";
}

function returnNull(): Object | null {
  return null;
}

function returnUndefined(): void {}

function returnZero(): number {
  return 0;
}

function returnFalse(): boolean {
  return false;
}

function returnNumber(): number {
  return 123.0;
}

function returnString(): string {
  return "test";
}

function returnMax(): number {
  return Number.MAX_VALUE;
}

function returnMin(): number {
  return Number.MIN_VALUE;
}

function returnBigArr(): number[] {
  let arr: number[] = [];
  for (let i = 0; i < 100; i++) {
    arr.push(i);
  }
  return arr;
}

// ========== 错误处理 辅助函数 ==========
function throwFunc(): number {
  throw new Error("task error");
}

function rejectFunc(): number {
  throw new Error("reject test");
}

async function asyncThrowFunc(): Promise<number> {
  try {
    await Utils.msSleep(100);
  } catch (error) {
    expect().assertFail();
  }
  throw new Error("async error");
}

function standardErrorFunc(): void {
  throw new Error("standard error message");
}

function catchFunc(): void {
  throw new Error("catch test");
}

function finallyFunc(): void {
  throw new Error("finally test");
}

function uncaughtFunc(): void {
  throw new Error("uncaught");
}

// ========== 异步并发 辅助函数 ==========
function taskFunc(n: number): number {
  return n * 10.0;
}

function simpleTask(n: number): number {
  return n + 0.0;
}

function computeTask(n: number): number {
  return n * n + 0.0;
}

function longTask(): string {
  let t: number = Date.now();
  while (Date.now() - t < 100) {}
  return "long task done";
}

function accessShared(data: Record<string, number>): number {
  let val: number = data["value"] as number;
  return val * 2.0;
}

async function nestedExecuteFunc(): Promise<number> {
  let innerResult: Any = undefined;
  try {
    innerResult = await taskpool.execute(simpleTask, 10.0);
  } catch (error) {
    expect().assertFail();
  }
  return (innerResult as number) * 2.0;
}

function quickTask(n: number): number {
  return n + 0.0;
}

function emptyObjReturnFunc(): Record<string, number> {
  let obj: Record<string, number> = {};
  return obj;
}

function emptyArrReturnFunc(): number[] {
  let arr: number[] = [];
  return arr;
}

export default function TaskpoolExecuteFuncTest(): void {
  describe('TaskpoolExecuteFuncTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskpoolExecute1Test0100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0100

     * @tc.desc   Verify execute(func) with 0 args parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(noArgsFunc);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0200

     * @tc.desc   Verify execute(func, arg) with 1 args parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(singleArgFunc, 50.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0300

     * @tc.desc   Verify execute(func, a, b, c) with 3 args parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(threeArgsFunc, 1.0, 2.0, 3.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(6.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0400

     * @tc.desc   Verify execute(func, a, b, c, d, e) with 5 args parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(fiveArgsFunc, 1.0, 2.0, 3.0, 4.0, 5.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(15.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0500

     * @tc.desc   Verify execute(func, a1..a10) with 10 args parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(tenArgsFunc, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(55.0);
      done();
    })

    // ==================== 1.2 func参数类型 ====================

    /**
     * @tc.name   TaskpoolExecute1Test0600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0600

     * @tc.desc   Verify execute(normalFunc) with normal named function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(normalFunc, 100.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(101.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0700

     * @tc.desc   Verify execute(arrowFunc) with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let arrowFunc = (x: number): number => x * 2.0;
      let result: Any = undefined;
      try {
        result = await taskpool.execute(arrowFunc, 10.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0800

     * @tc.desc   Verify execute(asyncFunc) with async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(asyncFunc, 5.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(15.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test0900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_0900

     * @tc.desc   Verify execute(voidFunc) with void return function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(voidFunc, 100.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1000

     * @tc.desc   Verify execute(objectFunc) with function returning object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(objectFunc);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(record["name"]).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1100

     * @tc.desc   Verify execute(promiseFunc) with function returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(promiseFunc);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("success");
      done();
    })

    // ==================== 1.3 args参数-number类型 ====================

    /**
     * @tc.name   TaskpoolExecute1Test1200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1200

     * @tc.desc   Verify execute with number type args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(numFunc, 123.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(246.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1300

     * @tc.desc   Verify execute with Number.MAX_VALUE args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(maxFunc, Number.MAX_VALUE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MAX_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1400

     * @tc.desc   Verify execute with Number.MIN_VALUE args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(minFunc, Number.MIN_VALUE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MIN_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1500

     * @tc.desc   Verify execute with NaN args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(nanFunc, NaN);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1600

     * @tc.desc   Verify execute with Infinity and -Infinity args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(infFunc, Infinity);
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 as boolean).assertTrue();
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(infFunc, -Infinity);
      } catch (error) {
        expect().assertFail();
      }
      expect(result2 as boolean).assertFalse();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1700

     * @tc.desc   Verify execute with negative number args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(negFunc, -100.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100.0);
      done();
    })

    // ==================== 1.4 args参数-string类型 ====================

    /**
     * @tc.name   TaskpoolExecute1Test1800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1800

     * @tc.desc   Verify execute with string type args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(strFunc, "world");
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("hello world");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test1900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_1900

     * @tc.desc   Verify execute with empty string args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emptyStrFunc, "");
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2000

     * @tc.desc   Verify execute with whitespace string args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(spaceStrFunc, "   ");
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(3);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2100

     * @tc.desc   Verify execute with Unicode and Chinese string args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(unicodeStrFunc, "测试中文");
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(4);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2200

     * @tc.desc   Verify execute with emoji string args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emojiStrFunc, "😀🎉🚀");
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2300

     * @tc.desc   Verify execute with long string args (10000 chars)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longStr: string = "";
      for (let i = 0; i < 10000; i++) {
        longStr += "a";
      }
      let result: Any = undefined;
      try {
        result = await taskpool.execute(longStrFunc, longStr);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10000);
      done();
    })

    // ==================== 1.5 args参数-boolean/object/array/null/undefined/混合 ====================

    /**
     * @tc.name   TaskpoolExecute1Test2400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2400

     * @tc.desc   Verify execute with boolean true and false args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(boolFunc, true);
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 as string).assertEqual("yes");
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(boolFunc, false);
      } catch (error) {
        expect().assertFail();
      }
      expect(result2 as string).assertEqual("no");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2500

     * @tc.desc   Verify execute with object type args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let inputObj: Record<string, number> = {};
      inputObj["value"] = 25;
      let result: Any = undefined;
      try {
        result = await taskpool.execute(objFunc, inputObj);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(25);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2600

     * @tc.desc   Verify execute with empty object args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let emptyObj: Record<string, number> = {};
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emptyObjFunc, emptyObj);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2700

     * @tc.desc   Verify execute with array type args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let inputArr: number[] = [1, 2, 3, 4, 5];
      let result: Any = undefined;
      try {
        result = await taskpool.execute(arrFunc, inputArr);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(15);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2800

     * @tc.desc   Verify execute with empty array args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let emptyInputArr: number[] = [];
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emptyArrFunc, emptyInputArr);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test2900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_2900

     * @tc.desc   Verify execute with null as args parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(nullArgFunc, null);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3000

     * @tc.desc   Verify execute with undefined as args parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(undefArgFunc, undefined);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3100

     * @tc.desc   Verify execute with mixed type args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(mixedFunc, 100.0, "test", true);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("100-test-true");
      done();
    })

    // ==================== 2. 返回值测试-成功场景 ====================

    /**
     * @tc.name   TaskpoolExecute1Test3200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3200

     * @tc.desc   Verify execute returns Promise and resolves correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let promise = taskpool.execute(returnFunc);
      let result: Any = undefined;
      try {
        result = await promise;
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(42);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3300

     * @tc.desc   Verify execute with then chain callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenResult: number = -1;
      let promise = taskpool.execute(thenFunc);
      try {
        let value = await promise;
        thenResult = value as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(thenResult).assertEqual(100.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3400

     * @tc.desc   Verify execute with await to get result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(awaitFunc);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("await result");
      done();
    })

    // ==================== 2.2 返回值-特殊值 ====================

    /**
     * @tc.name   TaskpoolExecute1Test3500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3500

     * @tc.desc   Verify execute returns null when func returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnNull);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === null).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3600

     * @tc.desc   Verify execute returns undefined when func returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnUndefined);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3700

     * @tc.desc   Verify execute returns empty object when func returns empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emptyObjReturnFunc);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(Object.keys(record).length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3800

     * @tc.desc   Verify execute returns empty array when func returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(emptyArrReturnFunc);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test3900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_3900

     * @tc.desc   Verify execute returns 0 when func returns zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnZero);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4000

     * @tc.desc   Verify execute returns false when func returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnFalse);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertFalse();
      done();
    })

    // ==================== 2.3 返回值-类型验证 ====================

    /**
     * @tc.name   TaskpoolExecute1Test4100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4100

     * @tc.desc   Verify execute return value typeof type check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let numResult: Any = undefined;
      try {
        numResult = await taskpool.execute(returnNumber);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof numResult).assertEqual("number");
      let strResult: Any = undefined;
      try {
        strResult = await taskpool.execute(returnString);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof strResult).assertEqual("string");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4200

     * @tc.desc   Verify execute return array element order and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(arrayFunc);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
      expect(arr.length).assertEqual(5);
      done();
    })

    // ==================== 2.4 返回值-Promise rejected ====================

    /**
     * @tc.name   TaskpoolExecute1Test4300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4300

     * @tc.desc   Verify execute Promise rejected when func throws Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(throwFunc);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4400

     * @tc.desc   Verify execute try/catch captures rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(rejectFunc);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4500

     * @tc.desc   Verify execute async function internal exception propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(asyncThrowFunc);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    // ==================== 2.5 返回值-边界值 ====================

    /**
     * @tc.name   TaskpoolExecute1Test4600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4600

     * @tc.desc   Verify execute returns Number.MAX_VALUE correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnMax);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MAX_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4700

     * @tc.desc   Verify execute returns Number.MIN_VALUE correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnMin);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MIN_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test4800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4800

     * @tc.desc   Verify execute returns large array (100 elements) correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(returnBigArr);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(100);
      done();
    })

    // ==================== 3. 错误处理 ====================

    /**
     * @tc.name   TaskpoolExecute1Test4900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_4900

     * @tc.desc   Verify execute catches standard Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(standardErrorFunc);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5000

     * @tc.desc   Verify try-catch-finally with normal execution, finally executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let errorCaught: boolean = false;
      try {
        let result = await taskpool.execute(noArgsFunc);
        expect(result as number).assertEqual(100);
      } catch (error) {
        errorCaught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(errorCaught).assertFalse();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5100

     * @tc.desc   Verify try-catch-finally with exception, catch and finally both execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let caught: boolean = false;
      try {
        await taskpool.execute(catchFunc);
      } catch (error) {
        caught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(caught).assertTrue();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5200

     * @tc.desc   Verify finally always executes after catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executionOrder: string[] = [];
      try {
        await taskpool.execute(finallyFunc);
      } catch (error) {
        executionOrder.push("catch");
      } finally {
        executionOrder.push("finally");
      }
      expect(executionOrder.length).assertEqual(2);
      expect(executionOrder[0]).assertEqual("catch");
      expect(executionOrder[1]).assertEqual("finally");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5300

     * @tc.desc   Verify uncaught exception can be captured by catch method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(uncaughtFunc);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    // ==================== 4. 异步并发场景 ====================

    /**
     * @tc.name   TaskpoolExecute1Test5400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5400

     * @tc.desc   Verify single execute runs asynchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("long task done");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5500

     * @tc.desc   Verify multiple execute calls run in parallel with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute1Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let p1 = taskpool.execute(taskFunc, 1.0);
      let p2 = taskpool.execute(taskFunc, 2.0);
      let p3 = taskpool.execute(taskFunc, 3.0);
      let p4 = taskpool.execute(taskFunc, 4.0);
      let p5 = taskpool.execute(taskFunc, 5.0);
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3, p4, p5])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(5);
      expect(results[0] as number).assertEqual(10.0);
      expect(results[4] as number).assertEqual(50.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5600

     * @tc.desc   Verify 100 concurrent tasks all complete correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(simpleTask, i + 0.0) as Promise<Object>);
      }
      let results: Any[] = [];
      try {
        results = (await Promise.all(promises)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(100);
      for (let i = 0; i < 100; i++) {
        expect(results[i] as number).assertEqual(i + 0.0);
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5700

     * @tc.desc   Verify nested execute: execute inside another execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: Any = undefined;
      try {
        result = await taskpool.execute(nestedExecuteFunc);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test5800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5800

     * @tc.desc   Verify Timer triggers execute and task completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let timerResult: number = -1;
      setTimeout(async (): Promise<void> => {
        try {
          let value = await taskpool.execute(simpleTask, 42.0);
          timerResult = value as number;
          expect(timerResult).assertEqual(42.0);
          done();
        } catch (error) {
          expect().assertFail();
          done();
        }
      }, 500);
    })

    /**
     * @tc.name   TaskpoolExecute1Test5900

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_5900

     * @tc.desc   Verify execute with then to wait for result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask);
      let taskCompleted: boolean = false;
      let promise = taskpool.execute(task);
      try {
        await promise;
        taskCompleted = true;
      } catch (error) {
        expect().assertFail();
      }
      expect(taskCompleted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6000

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6000

     * @tc.desc   Verify sequential chain execution A->B->C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executionOrder: number[] = [];
      let r1: Any = undefined;
      try {
        let cbExec0: () => number = (): number => {
          try {
            executionOrder.push(1);
            return 1;
          } catch (error) {
            throw error;
          }
        }
        r1 = await taskpool.execute(cbExec0);
      } catch (error) {
        expect().assertFail();
      }
      let r2: Any = undefined;
      try {
        let cbExec1: () => number = (): number => {
          try {
            executionOrder.push(2);
            return 2;
          } catch (error) {
            throw error;
          }
        }
        r2 = await taskpool.execute(cbExec1);
      } catch (error) {
        expect().assertFail();
      }
      let r3: Any = undefined;
      try {
        let cbExec2: () => number = (): number => {
          executionOrder.push(3);
          return 3;
        }
        r3 = await taskpool.execute(cbExec2);
      } catch (error) {
        expect().assertFail();
      }
      expect(executionOrder.length).assertEqual(3);
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);
      expect(executionOrder[2]).assertEqual(3);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6100

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6100

     * @tc.desc   Verify parallel execution then merge results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let p1 = taskpool.execute(computeTask, 1.0);
      let p2 = taskpool.execute(computeTask, 2.0);
      let p3 = taskpool.execute(computeTask, 3.0);
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      let sum: number = 0.0;
      for (let i = 0; i < results.length; i++) {
        sum += results[i] as number;
      }
      expect(sum).assertEqual(14.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6200

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6200

     * @tc.desc   Verify mixed chain: sequential then parallel then sequential
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let r1: Any = undefined;
      try {
        let cbExec3: () => number = (): number => {
          try {
            return 10;
          } catch (error) {
            throw error;
          }
        }
        r1 = await taskpool.execute(cbExec3);
      } catch (error) {
        expect().assertFail();
      }
      let r1Val: number = r1 as number;
      let cbExec4: () => number = (): number => {
        try {
          return r1Val + 5;
        } catch (error) {
          throw error;
        }
      }
      let p1 = taskpool.execute(cbExec4);
      let cbExec5: () => number = (): number => {
        try {
          return r1Val + 10;
        } catch (error) {
          throw error;
        }
      }
      let p2 = taskpool.execute(cbExec5);
      let parallelResults: Any[] = [];
      try {
        parallelResults = (await Promise.all([p1, p2])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      let r3: Any = undefined;
      try {
        let cbExec6: () => number = (): number => {
          try {
            return (parallelResults[0] as number) + (parallelResults[1] as number);
          } catch (error) {
            throw error;
          }
        }
        r3 = await taskpool.execute(cbExec6);
      } catch (error) {
        expect().assertFail();
      }
      expect(r3 as number).assertEqual(35);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6300

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6300

     * @tc.desc   Verify execute(func,...args) executes task and returns result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executed: boolean = false;
      let result: Any = undefined;
      try {
        let cbExec7: () => number = (): number => {
          try {
            executed = true;
            return 1;
          } catch (error) {
            throw error;
          }
        }
        result = await taskpool.execute(cbExec7);
      } catch (error) {
        expect().assertFail();
      }
      expect(executed).assertTrue();
      expect(result as number).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6400

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6400

     * @tc.desc   Verify exception interrupts chain execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executedTasks: number[] = [];
      try {
        let cbExec8: () => number = (): number => {
          executedTasks.push(1);
          return 1;
        }
        await taskpool.execute(cbExec8);
        try {
          let cbExec9: () => number = (): number => {
            throw new Error("interrupt");
          }
          await taskpool.execute(cbExec9);
        } catch (error) {
          throw error;
        }
        try {
          let cbExec10: () => number = (): number => {
            try {
              executedTasks.push(3);
              return 3;
            } catch (error) {
              throw error;
            }
          }
          await taskpool.execute(cbExec10);
        } catch (error) {
          expect().assertFail();
        }
      } catch (error) {
      }
      expect(executedTasks.length).assertEqual(1);
      expect(executedTasks[0]).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6500

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6500

     * @tc.desc   Verify event-driven execute triggers task correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eventTriggered: boolean = false;
      let taskResult: number = -1;
      let triggerEvent = async (): Promise<Object> => {
        eventTriggered = true;
        try {
          let value = await taskpool.execute(simpleTask, 100.0);
          taskResult = value as number;
          return value as Object;
        } catch (error) {
          expect().assertFail();
          return {} as Object;
        }
      };
      try {
        await triggerEvent();
      } catch (error) {
        expect().assertFail();
      }
      expect(eventTriggered).assertTrue();
      expect(taskResult).assertEqual(100.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6600

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6600

     * @tc.desc   Verify multiple events concurrently trigger multiple execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute1Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let p1 = taskpool.execute(simpleTask, 0.0);
      let p2 = taskpool.execute(simpleTask, 10.0);
      let p3 = taskpool.execute(simpleTask, 20.0);
      let p4 = taskpool.execute(simpleTask, 30.0);
      let p5 = taskpool.execute(simpleTask, 40.0);
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3, p4, p5])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(5);
      done();
    })

    // ==================== 5. 综合测试 ====================

    /**
     * @tc.name   TaskpoolExecute1Test6700

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6700

     * @tc.desc   Verify 100 concurrent tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskpoolExecute1Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let promises: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        promises.push(taskpool.execute(quickTask, i + 0.0) as Promise<Object>);
      }
      let results: Any[] = [];
      try {
        results = (await Promise.all(promises)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute1Test6800

     * @tc.number SUB_TASKPOOL_EXECUTE1_TEST_6800

     * @tc.desc   Verify ArkTS-Sta naturally shared memory access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute1Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sharedData: Record<string, number> = {};
      sharedData["value"] = 100;
      let result: Any = undefined;
      try {
        result = await taskpool.execute(accessShared, sharedData);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(200);
      done();
    })
  })
}
