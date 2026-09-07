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

export const setInstanceDataAbnormal: () => number;
export const setInstanceDataRetVal: () => number;
export const setInstanceDataStable: () => number;
export const setInstanceDataMultiThread: () => number;
export const setInstanceDataMultiCtx: () => number;
export const setInstanceDataRuntime: () => number;
export const setInstanceDataWorker: () => number;
export const getInstanceDataAbnormal: () => number;
export const getInstanceDataRetVal: () => number;
export const getInstanceDataStable: () => number;
export const getInstanceDataMultiThread: () => number;
export const getInstanceDataMultiCtx: () => number;
export const getInstanceDataRuntime: () => number;
export const getInstanceDataWorker: () => number;
export const addEnvCleanupHookStable: () => number;
export const addEnvCleanupHookMultiThread: () => number;
export const addEnvCleanupHookMultiCtx: () => number;
export const addEnvCleanupHookRuntime: () => number;
export const addEnvCleanupHookWorker: () => number;
export const removeEnvCleanupHookRetVal: () => number;
export const removeEnvCleanupHookStable: () => number;
export const removeEnvCleanupHookMultiThread: () => number;
export const removeEnvCleanupHookMultiCtx: () => number;
export const removeEnvCleanupHookRuntime: () => number;
export const removeEnvCleanupHookWorker: () => number;
export const addAsyncCleanupHookStable: () => number;
export const addAsyncCleanupHookMultiThread: () => number;
export const addAsyncCleanupHookMultiCtx: () => number;
export const addAsyncCleanupHookRuntime: () => number;
export const addAsyncCleanupHookWorker: () => number;
export const removeAsyncCleanupHookRetVal: () => number;
export const removeAsyncCleanupHookStable: () => number;
export const removeAsyncCleanupHookMultiThread: () => number;
export const removeAsyncCleanupHookMultiCtx: () => number;
export const removeAsyncCleanupHookRuntime: () => number;
export const removeAsyncCleanupHookWorker: () => number;