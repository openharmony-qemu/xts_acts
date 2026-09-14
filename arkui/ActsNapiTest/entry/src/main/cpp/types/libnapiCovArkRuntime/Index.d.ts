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

export const createArkRuntimeAbnormal: () => number;
export const createArkRuntimeRetVal: () => number;
export const createArkRuntimeStable: () => number;
export const createArkRuntimeMultiCtx: () => number;
export const createArkRuntimeWorker: () => number;
export const destroyArkRuntimeAbnormal: () => number;
export const destroyArkRuntimeRetVal: () => number;
export const destroyArkRuntimeStable: () => number;
export const destroyArkRuntimeMultiThread: () => number;
export const destroyArkRuntimeMultiCtx: () => number;
export const destroyArkRuntimeWorker: () => number;
export const runEventLoopAbnormal: () => number;
export const runEventLoopRetVal: () => number;
export const runEventLoopStable: () => number;
export const runEventLoopMultiThread: () => number;
export const runEventLoopMultiCtx: () => number;
export const runEventLoopWorker: () => number;
export const stopEventLoopAbnormal: () => number;
export const stopEventLoopRetVal: () => number;
export const stopEventLoopStable: () => number;
export const stopEventLoopMultiThread: () => number;
export const stopEventLoopMultiCtx: () => number;
export const stopEventLoopRuntime: () => number;
export const stopEventLoopWorker: () => number;