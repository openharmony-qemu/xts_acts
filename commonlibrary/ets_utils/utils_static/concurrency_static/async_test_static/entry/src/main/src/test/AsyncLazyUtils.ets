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

export async function addNum(a: number): Promise<number> {
  return a + 5;
}


export const sampleData: number = 1;

export let sharedData: number = 0;


export function incrementSharedData(): number {
  sharedData++;
  return sharedData;
}

export function addNumbers(a: number, b: number): number {
  return a + b;
}

export const sampleMessage: string = 'hello';


export interface Config {
  delayTime: number;
  message: string;
}

export const config: Config = {
  delayTime: 1000,
  message: 'hello'
};



export function nativeFunction(): string {
  return 'result';
}


export interface NativeData {
  message: string;
}

export const nativeData: NativeData = {
  message: 'this is from nativeModule data'
};


export let args: number = 42;

export async function taskFunction(a: number): Promise<number> {
  const asyncLock = AsyncLock.request('taskLock');
  await asyncLock.lockAsync(async (): Promise<void> => {
    await new Promise<void>((resolveInner): void => {
      setTimeout((): void => resolveInner(undefined), 100);
    });
    a = a + 1;
  });
  return a;
}
