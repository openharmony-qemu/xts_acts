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

export const createFunctionAbnormal: () => number;
export const createFunctionRetVal: () => number;
export const createFunctionStable: () => number;
export const createFunctionMultiThread: () => number;
export const createFunctionMultiCtx: () => number;
export const createFunctionRuntime: () => number;
export const createFunctionWorker: () => number;
export const callFunctionRetVal: () => number;
export const callFunctionStable: () => number;
export const callFunctionMultiThread: () => number;
export const callFunctionMultiCtx: () => number;
export const callFunctionWorker: () => number;
export const getCbInfoStable: () => number;
export const getCbInfoMultiThread: () => number;
export const getCbInfoMultiCtx: () => number;
export const getCbInfoRuntime: () => number;
export const getCbInfoWorker: () => number;
export const getUvEventLoopStable: () => number;
export const getUvEventLoopMultiCtx: () => number;
export const getUvEventLoopWorker: () => number;
export const getVersionAbnormal: () => number;
export const getVersionStable: () => number;
export const getVersionMultiThread: () => number;
export const getVersionMultiCtx: () => number;
export const getVersionRuntime: () => number;
export const getVersionWorker: () => number;
export const nodeApiGetModuleFileNameStable: () => number;
export const nodeApiGetModuleFileNameMultiThread: () => number;
export const nodeApiGetModuleFileNameMultiCtx: () => number;
export const nodeApiGetModuleFileNameRuntime: () => number;
export const nodeApiGetModuleFileNameWorker: () => number;
export const strictEqualsStable: () => number;
export const strictEqualsMultiThread: () => number;
export const strictEqualsMultiCtx: () => number;
export const strictEqualsRuntime: () => number;
export const strictEqualsWorker: () => number;