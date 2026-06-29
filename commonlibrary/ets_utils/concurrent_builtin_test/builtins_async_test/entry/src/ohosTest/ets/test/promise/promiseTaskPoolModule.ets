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

@Concurrent
export async function taskPoolPromiseFunc(x: number): Promise<number> {
  return await new Promise<number>((resolve: Function) => {
    resolve(x);
  }).then((v: number): number => {
    return v * 2;
  });
}

@Concurrent
export async function taskPoolAsyncPromise(x: number): Promise<number> {
  const result: number = await new Promise<number>((resolve: Function) => {
    resolve(x);
  });
  return result + 10;
}

@Concurrent
export async function taskPoolPromiseChain(a: number, b: number): Promise<number> {
  return await Promise.resolve<number>(a)
    .then((v: number): number => {
      return v + b;
    })
    .then((v: number): number => {
      return v * 2;
    });
}

@Concurrent
export async function taskPoolAsyncChain(x: number): Promise<string> {
  const step1: number = await Promise.resolve<number>(x)
    .then((v: number): number => {
      return v * 2;
    });
  const step2: string = await Promise.resolve<number>(step1)
    .then((v: number): string => {
      return 'result-' + v.toString();
    });
  return step2;
}