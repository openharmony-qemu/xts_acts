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

function taskTest001(): number {
  //console.info("test Task001: no args");
  return 0;
}

function funcRetNumber(): number {
  //console.info("funcRetNumber: " + args);
  return 0;
}

function funcRetString(args: number): string {
  console.info("testTaskpoolExecute005: " + args);
  args += 1;
  return "This is string";
}

function funcRetBool(args1: string, args2: Object): boolean {
  console.info("testTaskpool: " + args1 + args2);
  if (typeof (args1) != "string" || typeof (args2) != "boolean") {
    return false;
  }
  return true;
}

function funcRetUndef(): undefined {
  return;
}

function funcRetNull(args: boolean = false): null {
  console.info("testTaskpool: " + args);
  return null;
}

function funcRetBigint(args: bigint): bigint {
  console.info("testTaskpoolExecute009: " + args);
  let res: bigint = 231n;
  args += res;
  return args;
}

function funcRetDate(args1: string, args2: number, args3: number): Date {
  console.info("testTaskpoolExecute010: " + args1 + args2 + args3);
  let timestamp: number = Date.parse(args1);
  let dateObj: Date = new Date(args1);
  console.info(dateObj.toISOString()); // 输出类似 Date 2023-04-01T00:00:00.000Z
  return dateObj;
}

function funcRetArray(args: Array<number>): Array<number> {
  for (let i: int = 0; i < args.length; i++) {
    args[i] += 1;
  }
  return args;
}

function funcRetMap(args1: Map<string, number>, args2: boolean): Map<string, number> {
  args1.forEach((value: number, key: string): void => {
    args1.set(key, value * 2);
  });
  if (args2 == false) {
    args2 = true;
  }
  args1.forEach((value: number, key: string): void => {
    console.info(`testTaskpoolTask011 test funcRetMap ${key} :  ${value}`);
  });
  return args1;
}

function funcRetSet(args1: Set<number>, args2: boolean): Set<number> {
  args1.forEach((value: number): void => {
    value += 1;
  });
  if (args2 == false) {
    args2 = true;
  }
  return args1;
}

function funcRetClass(args1: string, args2: Object): Object {
  console.info("testTaskpoolExecute014: " + args1);
  return args2;
}

function funcRetAB(args1: string, args2: ArrayBuffer): ArrayBuffer {
  console.info("testTaskpoolExecute015: " + args1);
  let dataView: DataView = new DataView(args2);
  dataView.setUint32(0, 0x12345678, true);
  let resN: number = dataView.getUint32(0, true);
  console.info(`testTaskpoolExecute015 testFunction ${resN.toString(16)}`);
  return args2;
}

function funcRetU8(args1: Uint8Array, args2: boolean): Uint8Array {
  console.info("testTaskpoolExecute016: " + args2);
  args1[5] = 255; // 添加一个新元素
  args1[6] = 100;
  return args1;
}

function funcRetArray2(args: string): Array<number> {
  let resA: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  for (let i: int = 0; i < resA.length; i++) {
    resA[i] += 1;
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

function printABig(args: number): number {
  console.info("test execute(taskGroup)001: " + args);
  return args;
}

function mathMore(args: number): number {
  return (args % 5).toDouble();
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
  return 100.0;
}

function stringToNumber(str: string | number): number {
  if (typeof (str) == 'number') {
    return str as number;
  }
  let s: string = str as string;
  return s === 'a' ? 2 : s === 'b' ? 4 : 0;
}

function testFunc(buf: ArrayBuffer): number {
  let view: Int8Array = new Int8Array(buf);
  let arr: int[] = [11, 12, 13, 14];
  let n: int = Math.min(view.length, arr.length).toInt();
  for (let i: int = 0; i < n; i++) {
    view[i] = arr[i];
  }
  // 返回标量，避免 TypedArray 跨线程返回类型不稳定
  return 11.0;
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

function funArray(value1: number[]): void {
  console.info(`taskpool: data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function funDate(value1: Object): void {
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

function funcRUndef(value1?: undefined): void {
  console.info(`taskpool: changed data is: ${JSON.stringify(value1)} `);
  taskpool.Task.sendData(value1);
}

function changeN2T(value1?: null): void {
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
  funcRUndef,
  changeN2T,
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

function Concurrent(): number {
  let retNumber: number = 321.0;
  return retNumber;
}

function addTaskTask1(args: string | number): string {
  return args.toString() + '1';
}

function testLongTask1(args: number): string {
  return args.toString();
}

function testLongTask2(args: string): string {
  return args;
}

function testSequenceRunner(args: string): string {
  return args;
}

function testRunnerNum2Str(args: number): string {
  return args.toString();
}

function testRunnerStr2Str(args: string): string {
  return args;
}

export {
  ConstructorTest1,
  ConstructorTest2,
  ConstructorTest3,
  Concurrent,
  addTaskTask1,
  testLongTask1,
  testLongTask2,
  testSequenceRunner,
  testRunnerNum2Str,
  testRunnerStr2Str,
}
