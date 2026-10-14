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

import { AsyncLockTest, AsyncLockTest1 } from './SendableTest';

// ========== printArgs functions for TaskPoolErrorSuccessTest ==========

export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

export function printArgs3(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  throw new Error('Expected failure for callback-path validation');
  return args;
}

export function printArgs4(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  throw new Error('Expected failure for callback-path validation');
  return args;
}

export function printArgs7(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

export function printArgs8(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

export async function printArgs9(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  await new Promise<void>((resolve): void => {
    setTimeout((): void => {
      resolve(undefined);
    }, 100);
  });
  return args;
}

// ========== asyncLock functions ==========

export async function asyncLock(a: AsyncLockTest): Promise<void> {
  await a.setCount(10)
}

export async function asyncLock1(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10);
  throw new Error('asyncLock1 failure');
}

export async function asyncLock2(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10);
  throw new Error('asyncLock2 failure');
}

export async function asyncLock3(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10);
  throw new Error('asyncLock3 failure');
}
