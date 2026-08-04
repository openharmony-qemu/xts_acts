'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

export async function taskPoolPromiseFunc(x: int): Promise<int> {
  return await new Promise<int>((resolve: (value: int) => void) => {
    resolve(x);
  }).then((v: int): int => {
    return v * 2;
  });
}

export async function taskPoolAsyncPromise(x: int): Promise<int> {
  const result: int = await new Promise<int>((resolve: (value: int) => void) => {
    resolve(x);
  });
  return result + 10;
}

export async function taskPoolPromiseChain(a: int, b: int): Promise<int> {
  return await Promise.resolve<int>(a)
    .then((v: int): int => {
      return v + b;
    })
    .then((v: int): int => {
      return v * 2;
    });
}

export async function taskPoolAsyncChain(x: int): Promise<string> {
  const step1: int = await Promise.resolve<int>(x)
    .then((v: int): int => {
      return v * 2;
    });
  const step2: string = await Promise.resolve<int>(step1)
    .then((v: int): string => {
      return 'result-' + v.toString();
    });
  return step2;
}
