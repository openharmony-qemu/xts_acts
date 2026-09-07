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

export const createPromiseStable: () => number;
export const createPromiseMultiThread: () => number;
export const createPromiseMultiCtx: () => number;
export const createPromiseRuntime: () => number;
export const createPromiseWorker: () => number;
export const resolveDeferredStable: () => number;
export const resolveDeferredMultiThread: () => number;
export const resolveDeferredMultiCtx: () => number;
export const resolveDeferredRuntime: () => number;
export const resolveDeferredWorker: () => number;
export const rejectDeferredRetVal: () => number;
export const rejectDeferredStable: () => number;
export const rejectDeferredMultiThread: () => number;
export const rejectDeferredMultiCtx: () => number;
export const rejectDeferredRuntime: () => number;
export const rejectDeferredWorker: () => number;
export const isPromiseStable: () => number;
export const isPromiseMultiThread: () => number;
export const isPromiseMultiCtx: () => number;
export const isPromiseRuntime: () => number;
export const isPromiseWorker: () => number;
export const createAsyncWorkAbnormal: () => number;
export const createAsyncWorkRetVal: () => number;
export const createAsyncWorkStable: () => number;
export const createAsyncWorkMultiThread: () => number;
export const createAsyncWorkMultiCtx: () => number;
export const createAsyncWorkRuntime: () => number;
export const createAsyncWorkWorker: () => number;
export const deleteAsyncWorkRetVal: () => number;
export const deleteAsyncWorkStable: () => number;
export const deleteAsyncWorkMultiThread: () => number;
export const deleteAsyncWorkMultiCtx: () => number;
export const deleteAsyncWorkRuntime: () => number;
export const deleteAsyncWorkWorker: () => number;
export const queueAsyncWorkRetVal: () => number;
export const queueAsyncWorkStable: () => number;
export const queueAsyncWorkMultiThread: () => number;
export const queueAsyncWorkMultiCtx: () => number;
export const queueAsyncWorkRuntime: () => number;
export const queueAsyncWorkWorker: () => number;