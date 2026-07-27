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

import { Core } from './core';
import { AnyType, HookFuncType, ItfnType } from './module/types/common';
import { AssertMatcher } from './module/service/ExpectService';

const getCore = (): Core => {
  const core = Core.getInstance();
  if (core === null) {
    throw new Error('[hypium] core not initialized');
  }
  return core;
};

const hypiumDescribe: (desc: string, func: () => void) => void = (desc: string, func: () => void): void => {
  return getCore().describe(desc, func);
};

const hypiumIt: (desc: string, filter: number, func: ItfnType, timeout?: number, tag?: string) => void = (desc: string, filter: number, func: ItfnType, timeout?: number, tag?: string): void => {
  return getCore().it(desc, filter, func, timeout, tag);
};
const hypiumBeforeItSpecified: (itDescs: string | string[], func: HookFuncType) => void = (itDescs: string | string[], func: HookFuncType): void => {
  return getCore().beforeItSpecified(itDescs, func);
};

const hypiumAfterItSpecified: (itDescs: string | string[], func: HookFuncType) => void = (itDescs: string | string[], func: HookFuncType): void => {
  return getCore().afterItSpecified(itDescs, func);
};
const hypiumBeforeEach: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().beforeEach(func);
};
const hypiumBeforeEachIt: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().beforeEachIt(func);
};
const hypiumAfterEach: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().afterEach(func);
};
const hypiumAfterEachIt: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().afterEachIt(func);
};
const hypiumBeforeAll: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().beforeAll(func);
};
const hypiumAfterAll: (func: HookFuncType) => void = (func: HookFuncType): void => {
  return getCore().afterAll(func);
};
const hypiumExpect: (actualValue?: AnyType) => AssertMatcher = (actualValue?: AnyType): AssertMatcher => {
  const expect = getCore().expect;
  if (expect !== null) {
    return expect(actualValue);
  }
  throw new Error('[hypium] expect() used before initialization');
};

const hypiumXdescribe: (desc: string, func: () => void) => void = (desc: string, func: () => void): void => {
  return getCore().xdescribe(desc, func, '');
};
const hypiumXdescribeReason: (reason: string) => (desc: string, func: () => void) => void = (reason: string): (desc: string, func: () => void) => void => {
  return (desc: string, func: () => void): void => {
    return getCore().xdescribe(desc, func, reason);
  };
};
const hypiumXit: (desc: string, filter: number, func: ItfnType) => void = (desc: string, filter: number, func: ItfnType): void => {
  return getCore().xit(desc, filter, func, '');
};
const hypiumXitReason: (reason: string) => (desc: string, filter: number, func: (() => void) | (() => Promise<void>)) => void = (reason: string): (desc: string, filter: number, func: (() => void) | (() => Promise<void>)) => void => {
  return (desc: string, filter: number, func: (() => void) | (() => Promise<void>)): void => {
    return getCore().xit(desc, filter, func, reason);
  };
};

export {
  hypiumDescribe,
  hypiumIt,
  hypiumBeforeAll,
  hypiumBeforeEach,
  hypiumBeforeEachIt,
  hypiumAfterEach,
  hypiumAfterEachIt,
  hypiumAfterAll,
  hypiumExpect,
  hypiumBeforeItSpecified,
  hypiumAfterItSpecified,
  hypiumXdescribe,
  hypiumXit,
  hypiumXdescribeReason,
  hypiumXitReason,
};
