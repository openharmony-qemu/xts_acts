/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

export const add: (a: number, b: number) => number;
export const napiCreateFunction:() => object;

export const nativeMultiply: (a: number, b: number) => number;
export const callArkTS: (func: (a: number, b: number) => number) => number;

export const getAddFunc: () => (a: number, b: number) => number;

// 创建和调用返回类型
export interface CreateAndCallResult {
  func: (x: number) => number;
  result: number;
}
export const createAndCallInOneFunc: () => CreateAndCallResult;

export const callChain:(func: (a: number, b: number) => number) => number;

export const runScriptPath:(abcDefaultFunc: () => string)=> boolean;
export const callGetter:()=>boolean;
export const callSetter:()=>boolean;
export const napiDefineClass:() => object;
export const createPromiseResolve:() => Promise<string>;