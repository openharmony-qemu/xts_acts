/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
export class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name}.`);
  }
}


function taskTest001(): number {

  return 0;
}

function funcRetNumber(): number {

  return 0;
}

function funcRetString(args: number): string {

  console.info("testTaskpoolExecute005: " + args);
  args = args + 1;
  return "This is string";
}

function funcRetBool(args1: string, args2: boolean): boolean {

  console.info("testTaskpool: " + args1 + args2);
  if (typeof (args1) != "string" || typeof (args2) != "boolean") {
    return false;
  }
  return true;
}

function funcRetUndef(): undefined {

  return undefined;
}

function funcRetNull(args: boolean): null {

  console.info("testTaskpool: " + args);
  return null;
}

function funcRetBigint(args: bigint): bigint {

  console.info("testTaskpoolExecute009: " + args);
  let res = 231n;
  args = args + res;
  return args;
}

function funcRetDate(args1: string, args2: number, args3: number): Date {

  console.info("testTaskpoolExecute010: " + args1 + args2 + args3);
  let timestamp = Date.parse(args1);
  let dateObj = new Date(timestamp);
  console.info(dateObj.toISOString()); // 输出类似 Date 2023-04-01T00:00:00.000Z
  return dateObj;
}

function funcRetArray(args: Array<int>): Array<int> {

  for (let i = 0; i < args.length; i++) {
    args[i] = args[i] + 1;
  }
  return args;
}

function funcRetMap(args1: Map<string, number>, args2: boolean): Map<string, number> {

  args1.forEach((value, key) => {
    args1.set(key, value * 2);
  });
  if (args2 == false) {
    args2 = true;
  }

  args1.forEach((value, key) => {
    console.info(`Key: ${key}, Value: ${value}`);
  });
  return args1;
}

function funcRetSet(args1: Set<int>, args2: boolean): Set<int> {

  for (let value of args1.values()) {
    value = value + 1;
  }
  if (args2 == false) {
    args2 = true;
  }
  return args1;
}

function funcRetClass(args1: string, args2: Person): Person {

  args2.name = args1;
  console.info("testTaskpoolExecute014: " + args1);
  return args2;
}

function funcRetAB(args1: string, args2: ArrayBuffer): ArrayBuffer {

  console.info("testTaskpoolExecute015: " + args1);
  let dataView = new DataView(args2);
  dataView.setUint32(0, 0x12345678, true);
  let resN = dataView.getUint32(0, true);
  // console.info(`testTaskpoolExecute015 testFunction ${resN.toString(16)}`);
  return args2;
}

function funcRetU8(args1: Uint8Array, args2: boolean): Uint8Array {

  console.info("testTaskpoolExecute016: " + args2);
  args1[5] = 255; // 添加一个新元素
  args1[6] = 100;
  return args1;
}

function funcRetArray2(args: string): Array<int> {

  let resA: Array<int> = new Array<int>(1, 2, 3, 4, 5);
  for (let i = 0; i < resA.length; i++) {
    resA[i] = resA[i] + 1;
  }
  return resA;
}

function printNumber(args: number): number {

  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printString(args: string): string {

  console.info("test execute(taskGroup)001: " + args);
  return args;
}


function printABool(args: boolean): boolean {

  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function printABig(args: bigint): bigint {

  console.info("test execute(taskGroup)001: " + args);
  return args;
}
function mathMore(args: number): number {

  return args % 5;
}

function mathPow(value1: number, value2: number): number {

  return Math.pow(value1, value2);
}

function mathSqrt(value1: number): number {

  return Math.sqrt(value1);
}

function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {

  console.info("testTransfer arg1 byteLength: " + arg1.byteLength);
  console.info("testTransfer arg2 byteLength: " + arg2.byteLength);
  return 100;
}

function stringToNumber(str: string | number): string | number {

  if (typeof (str) == 'number') {
    return str;
  }
  return str === 'a' ? 2 : str === 'b' ? 4 : 0;
}

function testFunc(arrayBuffer: ArrayBuffer): Int32Array {

  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [11, 12, 13, 14];
  for (let i = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}

function concurrentF(num: number): number {

  let res: number = num * 10;
  console.info(`concurrentF: res1 ${res}`);
  taskpool.Task.sendData(res);
  console.info(`concurrentF: res2 ${res}`);
  return num;
}

function spileString(value1: string, value2: string): string {

  let str: string = value1 + value2;
  taskpool.Task.sendData(str);
  return str;
}

function funArray(value1: Array<number>): void {

  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funDate(value1: object): void {

  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function changeT(value1: boolean): void {

  if (value1 == false) {
    value1 = true;
  }
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funcRUndef(value1: undefined | Object): void {

  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function changeN2T(value1: null): void {

  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funcChangeBigint(value1: bigint): void {

  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

export {
  taskTest001,
  funcRetNumber,
  funcRetString,
  funcRetBool,
  funcRetUndef,
  funcRetNull,
  funcRetBigint,
  funcRetDate,
  funcRetArray,
  funcRetMap,
  funcRetSet,
  funcRetClass,
  funcRetAB,
  funcRetU8,
  funcRetArray2,
  printNumber,
  printString,
  printABool,
  printABig,
  mathMore,
  mathPow,
  mathSqrt,
  testTransfer,
  stringToNumber,
  testFunc,
  concurrentF,
  spileString,
  funArray,
  funDate,
  changeT,
  changeN2T,
  funcRUndef,
  funcChangeBigint,
}

function ConstructorTest1(): string {

  let retString: string = 'ConstructorTest1';
  return retString;
}

function ConstructorTest2(): string {

  let retString: string = 'ConstructorTest2';
  return retString;
}

function ConstructorTest3(): string {

  let retString: string = 'ConstructorTest3';
  return retString;
}

function noConcurrent(): number {
  let retNumber: number = 123;
  return retNumber;
}

function Concurrent(): number {

  let retNumber: number = 321;
  return retNumber;
}

function addTaskFunc(args: number): string {

  let errString: string = 'NotNumber';
  if (typeof (args) != 'number') {
    return errString;
  }
  return String(args + 1);
}

function addTaskTask1(args: number): string {

  return String(args) + 1;
}

function testLongTask1(args: number): string {

  return String(args);
}

function testLongTask2(args: string): string {

  return args;
}

function testSequenceRunner(args: string): string {

  return args;
}

function testRunnerNum2Str(args: number): string {

  return String(args);
}

function testRunnerStr2Str(args: string): string {

  return args;
}

export {
  ConstructorTest1,
  ConstructorTest2,
  ConstructorTest3,
  noConcurrent,
  Concurrent,
  addTaskFunc,
  addTaskTask1,
  testLongTask1,
  testLongTask2,
  testSequenceRunner,
  testRunnerNum2Str,
  testRunnerStr2Str,
}
