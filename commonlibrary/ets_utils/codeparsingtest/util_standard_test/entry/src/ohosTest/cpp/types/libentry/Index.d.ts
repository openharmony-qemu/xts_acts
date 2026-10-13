/*
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

export const createSubEnv: ()=> boolean;
export const add: (value0: number, value1: number)=> number;
export const saveMainEnv: ()=> boolean;
export const destroyEnv: ()=> boolean;
export const createStrongRefs: (count: number)=> boolean;
export const deleteStrongRefs: (count: number)=> boolean;
export const clearStrongRefs: ()=> boolean;
export const createStrongSendableRefs: (value: object, count: number)=> boolean;
export const clearStrongSendableRefs: ()=> boolean;
export const createNapiRefs: (count: number, refcount: number)=> boolean;
export const refNapiRefs: (count: number)=> boolean;
export const unrefNapiRefs: (count: number)=> boolean;
export const deleteNapiRefs: (count: number)=> boolean;
export const clearNapiRefs: ()=> boolean;
export const wrapObjects: (objects: Array<object>)=> boolean;
export const removeWraps: (objects: Array<object>)=> boolean;
export const clearWrapRefs: ()=> boolean;
export const createPromises: (count: number)=> Array<Promise<object>>;
export const settlePromises: ()=> boolean;
export const clearDeferreds: ()=> boolean;
export const createThreadsafeFunctions: (callback: () => void, count: number)=> boolean;
export const acquireThreadsafeFunctions: ()=> boolean;
export const releaseThreadsafeFunctions: ()=> boolean;
export const getCApiHandleCount: ()=> number;
export const getSubRuntimeHandleCount: ()=> number;
