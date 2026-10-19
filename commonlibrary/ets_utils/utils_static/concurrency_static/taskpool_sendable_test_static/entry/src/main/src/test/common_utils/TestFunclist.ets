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

import { StrCat, A, B, printStrArgs, printArgs, asyncSleep } from './ExportFunclist'
import { SendableClass, SimpleSendable, SendableClassTest } from '../sendable/Sendable'

export async function currentFun(): Promise<void> {
  await new Promise<void>((resolve, reject): void => {
    setTimeout((): void => { resolve(undefined) }, 500);
  });
  await new Promise<void>((resolve, reject): void => {
    setTimeout((): void => { resolve(undefined) }, 500);
  });
}

export function transferArrayBuffer(arg1: Array<number>): string {
  arg1[0] = 100;
  arg1[1] = 200;
  arg1[2] = 300;
  arg1[3] = 400;
  return "success";
}

export function transferAtomics(arg1: Int32Array): string {
  console.info("wait begin::");
  // 1) 就绪信号：worker 即将进入 wait，置 arg1[1]=1 并 notify，供主线程轮询确认后唤醒
  Atomics.store(arg1, 1, 1);
  Atomics.notify(arg1, 1);
  // 2) 业务等待：超时 3000ms；主线程在看到就绪信号后先 store(0,1) 再 notify(0)，
  //    保证唤醒语义不依赖 notify 与入队的先后
  let res: string = Atomics.wait(arg1, 0, 0, 3000);
  return res;
}

export function setCloneListTest(arrayBuffer: Array<number>): Int32Array {
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: Array<number> = [5, 6, 7, 8];
  for (let i: int = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

export function setTransferListTest(arg1: Uint8Array, arg2: Uint8Array): number {
  return arg1.byteLength + arg2.byteLength;
}

export async function testString(args: string): Promise<void> {
  let p: number = await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      const randomNumber: number = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  });
}

export function testTime(): number {
  return Date.now();
}

export async function testNumber(value1: number, value2: number): Promise<number> {
  let result: number = await new Promise<number>((resolve, reject): void => {
    let value: number = value1 + value2;
    resolve(value);
  });
  return result;
}

export async function testTaskPool(): Promise<void> {
  try {
    let task1: taskpool.Task = new taskpool.Task(delaySum, 100.0, 100.0, 500.0);
    let task2: taskpool.Task = new taskpool.Task(delaySum, 200.0, 200.0, 500.0);
    let task3: taskpool.Task = new taskpool.Task(printArgs, 300.0);

    taskpool.execute(task1);
    taskpool.execute(task2);
    taskpool.execute(task3);

    await asyncSleep(50.0);
    for (let i: number = 1; i <= 10; i++) {
      taskpool.cancel(task1);
    }
  }
  catch (e) {
    console.info("taskpool catch error: " + e);
  }
}

export function promiseCase(): Promise<void> {
  let p: Promise<void> = new Promise<void>((resolve): void => {
    setTimeout((): void => {
      resolve(undefined);
    }, 300);
  });
  return p;
}

export function printArgsFunc(Sum: (a: number, b: number) => number, num1: number, num2: number): number {
  let result: number = Sum(num1, num2);
  return result;
}

export function Sum(value1: number, value2: number): number {
  return value1 + value2;
}

export async function asyncSum(value1: number, value2: number): Promise<number> {
  return value1 + value2;
}

export function delaySum(value1: number, value2: number, delay: number): number {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return value1 + value2;
}

export function Add(value1: boolean, value2: boolean): boolean {
  if (value1 && value2)
    return true;
  else
    return false;
}

export function funcStrCat(value1: string, value2: string, value3: string): string {
  return value1 + StrCat(value2, value3);
}

export function arraySum(arg1: Array<number>, arg2: Array<number>): Array<number> {
  let value: Array<number> = [0.0, 0.0];
  value[0] = arg1[0] + arg2[0];
  value[1] = arg1[1] + arg2[1];
  return value;
}

export function objectSum(arg1: A, arg2: B): A {
  let cc: A = arg1;
  cc.a = arg1.a + arg2.a;
  cc.b = arg1.b + arg2.b;
  return cc;
}

export function Multi(value1: number, value2: number): number {
  return value1 * value2;
}

export function AdditionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

export function WaitforRunner(finalString: string): string {
  return finalString;
}

export function errorTest(): void {
  throw new Error("this is an error");
}

export function testCancelDelayed(a: string): string {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  return 'a';
}

export function dependend(params: number): void {
  if (params >= 100) {
    let t: number = Date.now();
    while (Date.now() - t < 1000) {
      continue;
    }
  }
}

export function hashMapTest(args: number): Map<string, number> {
  let hashMap1: Map<string, number> = new Map<string, number>();
  hashMap1.set('a', 123);
  return hashMap1;
}

export function delay(): void {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
}

export async function randomTest(): Promise<void> {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  let p = await new Promise<void>((resolve, reject): void => {
    setTimeout((): void => {
      const randomNumber: number = Math.floor(Math.random() * 100);
      resolve(undefined);
    }, 200);
  });
  return p;
}

export async function outerTaskFunc(params: string): Promise<string> {
  await asyncSleep(10.0);
  let val: string = "";
  if (params == "001") {
    let innerTask: taskpool.Task = new taskpool.Task(printStrArgs, params);
    val += await taskpool.execute(innerTask);
  } else if (params == "002") {
    val += await taskpool.execute(printStrArgs, params);
  }

  await asyncSleep(10.0);
  return "outerTaskRes-" + val;
}

export function isConcurrentTest1(): void {
}

export function isConcurrentTest2(): void {
}

export async function sequenceRunnerTest(): Promise<string> {
  let finalString: string = "";
  let t: Array<taskpool.Task> = [];
  for (let i: int = 0; i < 100; i++) {
    t.push(new taskpool.Task(printArgs, i.toDouble()));
  }

  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner16");
  for (let i: int = 0; i < 20; i++) {
    if (i % 2 == 1) {
      finalString += await runner.execute(t[i]) + ',';
    }
  }
  return finalString;
}

export class CancelAndExecuteDelayed {
  private task: taskpool.Task;
  private num: number;
  private requestId: number = 0;
  public res: number = 0;
  public i: number = 0;
  public isTerminate: boolean = false;

  constructor(num: number) {
    this.num = num;
    this.task = new taskpool.Task(printArgs, num);
  }

  async postRequest(): Promise<void> {
    const currentRequestId: number = ++this.requestId;
    this.isTerminate = false;
    try {
      taskpool.cancel(this.task);
    } catch (error) {
      console.info(`CancelAndExecuteDelayed ignored inactive task: ${JSON.stringify(error)}`);
    }

    const nextTask: taskpool.Task = new taskpool.Task(printArgs, this.num);
    this.task = nextTask;
    try {
      const value: Any = await taskpool.executeDelayed(1000, nextTask);
      if (currentRequestId === this.requestId) {
        this.i++;
        this.res += value as number;
        this.isTerminate = true;
      }
    } catch (error) {
      if (currentRequestId === this.requestId) {
        this.isTerminate = true;
        throw error;
      }
    }
  }
}

export async function errorManageTest(): Promise<void> {
  await asyncSleep(10.0);
  try {
    await Promise.reject<string>(new Error("rejError"));
  } catch (error) {
    console.info("errorManageTest caught expected rejection");
  }
}

export function dealHashMapTest(hashMap: Map<string, number>): Map<string, number> {
  hashMap.set('a', 123);
  return hashMap;
}

export function sendDataTest(args: number): void {
  let res: number = args * 10;
  taskpool.Task.sendData(res);
}

export function sendableClassTestFunc(class1: SendableClass, class2: SendableClass): number {
  let num1: number = class1.GetNum();
  let num2: number = class2.GetNum();
  return num1 + num2;
}

export function Int8ArrayTestFunc(array: Int8Array): Int8Array {
  array.set([0, 1, 2]);
  return array;
}

export function SetTestFunc(set: Set<number>): Set<number> {
  set.add(4);
  return set;
}

export function MapTestFunc(map: Map<number, number>): Map<number, number> {
  map.set(5, 6);
  return map;
}

export function simpleSendableClassTestFunc(class1: SimpleSendable, class2: SimpleSendable): number {
  return class1.digit + class2.digit;
}

export function Uint8ClampedArrayTestFunc(array: Uint8ClampedArray): Uint8ClampedArray {
  array.set([0, 1, 2]);
  return array;
}

export function testWithThreeParams(a: number, b: string, c: number): string {
  let ret: number = a + c;
  return "result: " + b + " " + ret;
}

export function testWithArray(args: Array<Object>): string {
  return "result:" + JSON.stringify(args);
}

export function sendableFuncTest(func: () => number): number {
  return func();
}

export function sendableClassTest(classT: SendableClassTest): number {
  let num: number = classT.foo();
  num += classT.func();
  return num;
}

export async function taskErrFunc(time: number): Promise<void> {
  await asyncSleep(time);
  throw new Error("taskErrFunc error");
}
