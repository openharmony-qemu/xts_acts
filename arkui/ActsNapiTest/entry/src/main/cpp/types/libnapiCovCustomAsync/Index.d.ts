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

export const asyncInitRetVal: () => number;
export const asyncInitStable: () => number;
export const asyncInitMultiThread: () => number;
export const asyncInitRuntime: () => number;
export const asyncInitWorker: () => number;
export const asyncDestroyRetVal: () => number;
export const asyncDestroyStable: () => number;
export const asyncDestroyMultiThread: () => number;
export const asyncDestroyRuntime: () => number;
export const asyncDestroyWorker: () => number;
export const makeCallbackStable: () => number;
export const makeCallbackMultiThread: () => number;
export const makeCallbackRuntime: () => number;
export const makeCallbackWorker: () => number;
export const openCallbackScopeRetVal: () => number;
export const openCallbackScopeStable: () => number;
export const openCallbackScopeMultiThread: () => number;
export const openCallbackScopeMultiCtx: () => number;
export const openCallbackScopeRuntime: () => number;
export const openCallbackScopeWorker: () => number;
export const closeCallbackScopeStable: () => number;
export const closeCallbackScopeMultiThread: () => number;
export const closeCallbackScopeMultiCtx: () => number;
export const closeCallbackScopeRuntime: () => number;
export const closeCallbackScopeWorker: () => number;