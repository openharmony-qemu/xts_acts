'use static';
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

import { AssertResult } from '../modal/assertModel';

export type PrimitiveType = int | byte | short | long | float | number | string | undefined | null | boolean | BigInt;
// Closed union for assert/expect/params values. Not ArkTS `any` / `Any`.
export type HypiumValue = PrimitiveType | Date | RegExp | object | (() => void); // | symbol @todo 不支持symbol
export type HookFuncType = (() => void)
  | (() => Promise<void>)
  | ((done: () => void) => void)
  | ((done: () => void) => Promise<void>)
export type ItfnType = (() => void)
  | (() => Promise<void>)
  | ((done: () => void) => void)
  | ((done: () => void) => Promise<void>)
  | ((done: () => void, param2: HypiumValue) => void)
  | ((done: () => void, param2: HypiumValue) => Promise<void>);
export type NumberType = byte | short | int | long | float | double;
export type CustomAssert = (actualValue: HypiumValue, expect: HypiumValue[]) => AssertResult;
