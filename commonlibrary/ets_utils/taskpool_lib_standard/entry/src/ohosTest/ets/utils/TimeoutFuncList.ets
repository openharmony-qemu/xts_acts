/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { taskpool } from '@kit.ArkTS';
import { asyncSleep } from '../test/exportFunclist';
import { SendableClassTest } from '../test/sendable';

@Concurrent
export function timeoutDemo (time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return time;
}
@Concurrent
export async function demoSenddata(time: number) {
  let start = Date.now();
  let count = 1;
  while (Date.now() - start < time) {
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
}

@Concurrent
export function taskFunc(task: taskpool.Task) {
  return task;
}

@Concurrent
export function taskError(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}

@Concurrent
export function sendableFuncWithTime(func : Function, time: number) : number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let num : number = func();
  return num;
}

@Concurrent
export function sendableClassWithTime(classT : SendableClassTest, time: number) : number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let num = classT.foo();
  num += classT.func();
  return num;
}

@Concurrent
export function setTransferListTestWithTime(arg1: Uint8Array, arg2: Uint8Array, time: number): number {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return arg1.byteLength + arg2.byteLength;
}

@Concurrent
export function setCloneListTestWithTime(arrayBuffer: Array<number>, time: number): Int32Array {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  let view: Int32Array = new Int32Array(arrayBuffer);
  let arr: number[] = [5, 6, 7, 8];
  for (let i: number = 0; i < arr.length; i++) {
    view[i] = arr[i];
  }
  return view;
}