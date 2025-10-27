/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base'
import { StrCat, A, B, printStrArgs, printArgs, multiplyFunc } from './exportFunclist'
import HashMap from '@ohos.util.HashMap';
// import { errorManager } from '@kit.AbilityKit';
import { SendableClass, SimpleSendable, SendableClassTest } from './sendable';

// import { MeasureText } from '@kit.ArkUI';

export async function currentFun(): Promise<void> {

  await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1);
    }, 500);
  });
  await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1);
    }, 500);
  });
}

export function transferArrayBuffer(arg1: Array<number>): string {

  arg1[0] = 100;
  arg1[1] = 200;
  arg1[2] = 300;
  arg1[3] = 400;
  return 'success';
}

export function transferAtomics(arg1: Int32Array): string {

  console.info('wait begin::');
  let res = Atomics.wait(arg1, 0, 0, 3000);
  return res;
}

export function setCloneListTest(arrayBuffer: number[]): Int32Array {

  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [5, 6, 7, 8];
  for (let i = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

export function setTransferListTest(arg1: Uint8Array, arg2: Uint8Array): number {

  return arg1.byteLength + arg2.byteLength;
}

export async function testString(args: string): Promise<number> {

  let p: number = await new Promise<number>((resolve) => {
    setTimeout(() => {
      const randomNumber: number = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  })
  return p;
}

export function testTime(): number {
  ;
  return Date.now();
}

export async function testNumber(value1: number, value2: number): Promise<number> {

  let result: number = await new Promise<number>((resolve) => {
    let value = value1 + value2;
    resolve(value);
  })
  return result;
}

export function testTaskPool(): void {
  try {
    let task1: taskpool.Task = new taskpool.Task(delaySum, 100, 100, 500);
    let task2: taskpool.Task = new taskpool.Task(delaySum, 200, 200, 500);
    let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

    taskpool.execute(task1)
    taskpool.execute(task2)
    taskpool.execute(task3)

    let start: number = new Date().getTime();
    while (new Date().getTime() - start < 1000) {
      continue;
    }
    for (let i: number = 1; i <= 10; i++) {
      taskpool.cancel(task1);
    }
  } catch (e) {
    console.info('taskpool catch error: ' + e);
  }
}

export function promiseCase(): number {
  let p: number = await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, 100);
  })
  return p
}

export function Sum(value1: number, value2: number): number {

  return value1 + value2;
}

export function printArgsFunc(sum: (a: number, b: number) => number, num1: number, num2: number): number {

  let result: number = sum(num1, num2)
  return result;
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

  if (value1 && value2) {
    return true;
  } else {
    return false;
  }
}

export function funcStrCat(value1: string, value2: string, value3: string): string {

  return value1 + StrCat(value2, value3);
}

export function arraySum(arg1: Array<number>, arg2: Array<number>): Array<number> {

  let value: number[] = [];
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

export function errorTest(): never {

  throw new Error('this is an error');
}

export function testCancelDelayed(a: string): string {

  let t = Date.now()
  while ((Date.now() - t) < 1000) {
    continue;
  }
  return 'a';
}

export function dependend(params: number): void {

  if (params >= 100) {
    let t = Date.now();
    while ((Date.now() - t) < 1000) {
      continue;
    }
  }
}

export function hashMapTest(args: number): HashMap<string, number> {

  let hashMap1: HashMap<string, number> = new HashMap<string, number>();
  hashMap1.set('a', 123);
  return hashMap1;
}

export function delay(): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, 100);
  });
}

export function delaySync(): void {
  let t = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
}

export async function randomTest(): Promise<number> {

  let t = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
  let p: number = await new Promise<number>((resolve) => { //return ???
    setTimeout(() => {
      const randomNumber = Math.floor(Math.random() * 100);
      resolve(randomNumber);
    }, 200);
  })
  return p;
}

export async function outerTaskFunc(params: string): Promise<string> {

  let t1 = Date.now();
  while ((Date.now() - t1) < 100) {
    continue
  }
  let val = '';
  if (params == '001') {
    let innerTask = new taskpool.Task(printStrArgs, params)
    val += await taskpool.execute(innerTask)
  } else if (params == '002') {
    val += await taskpool.execute(printStrArgs, params);
  }

  let t2 = Date.now();
  while ((Date.now() - t2) < 100) {
    continue
  }
  return 'outerTaskRes-' + val;
}

export function isConcurrentTest1(): void {

}

export function isConcurrentTest2(): void {
}

export async function sequenceRunnerTest(): Promise<string> {

  let finalString = '';
  let t: taskpool.Task[] = [];
  for (let i = 0; i < 100; i++) {
    t[i] = new taskpool.Task(printArgs, i);
  }

  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner('runner16');
  for (let i = 0; i < 20; i++) {
    if (i % 2 == 1) {
      const result = await runner.execute(t[i]);
      finalString += result + ',';
    }
  }
  return finalString;
}

export async function sequenceRunnerPriorityTest(): Promise<string> {

  let finalString = '';
  let t: taskpool.Task[] = [];
  for (let i = 0; i < 100; i++) {
    t[i] = new taskpool.Task(printArgs, i);
  }

  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner('runner17');
  for (let i = 0; i < 20; i++) {
    if (i % 2 == 1) {
      const result = await runner.execute(t[i]);
      finalString += result + ',';
    }
  }
  return finalString;
}

export class CancelAndExecuteDelayed {
  public task: taskpool.Task;
  public res: number = 0;
  public i: number = 0;
  public isTerminate: boolean = false;

  constructor(num: number) {
    this.task = new taskpool.Task(printArgs, num);
  }

  postRequest(): void {
    try {
      taskpool.cancel(this.task);
    } catch (e) {
    }

    taskpool.executeDelayed(1000, this.task).then((value: NullishType) => { //line:361
      this.i++;
      this.res += value as number;
      this.isTerminate = true;
    }).catch((e: Error) => {
    })
  }
}

export function dealHashMapTest(hashMap: HashMap<string, number>): HashMap<string, number> {

  hashMap.set('a', 123);
  return hashMap;
}

export function noUseConcurrentTest(arg: string): string {
  return arg;
}

export function sendDataTest(args: number): void {

  let res: number = args * 10;
  taskpool.Task.sendData(res);
}

export function sendableClassTestFunc(class1: SendableClass, class2: SendableClass): number {

  let num1 = class1.GetNum();
  let num2 = class2.GetNum();
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
  let ret = a + c;
  return 'result: ' + b + ' ' + ret;
}

export interface testWithArray_value {
  num: number;
  str: string;
}

export function testWithArray(args: testWithArray_value): string {
  return 'result:' + JSON.stringify(args.num) + ',' + JSON.stringify(args.str);
}

export function sendableFuncTest(func: () => number): number {
  let num: number = func();
  return num;
}

export function sendableClassTest(classT: SendableClassTest): number {
  let num = classT.foo();
  num += classT.func();
  return num;
}


export async function promiseTest(value: number): Promise<number> {
  await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1);
    }, 200);
  });

  return multiplyFunc(value);
}

