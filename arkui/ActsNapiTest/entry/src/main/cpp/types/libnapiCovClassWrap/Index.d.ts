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

export const defineClassStable: () => number;
export const defineClassMultiThread: () => number;
export const defineClassMultiCtx: () => number;
export const defineClassRuntime: () => number;
export const defineClassWorker: () => number;
export const newInstanceStable: () => number;
export const newInstanceMultiThread: () => number;
export const newInstanceMultiCtx: () => number;
export const newInstanceRuntime: () => number;
export const newInstanceWorker: () => number;
export const getNewTargetAbnormal: () => number;
export const getNewTargetStable: () => number;
export const getNewTargetMultiThread: () => number;
export const getNewTargetMultiCtx: () => number;
export const getNewTargetRuntime: () => number;
export const getNewTargetWorker: () => number;
export const wrapStable: () => number;
export const wrapMultiThread: () => number;
export const wrapMultiCtx: () => number;
export const wrapWorker: () => number;
export const unwrapStable: () => number;
export const unwrapMultiThread: () => number;
export const unwrapMultiCtx: () => number;
export const unwrapWorker: () => number;
export const removeWrapStable: () => number;
export const removeWrapMultiThread: () => number;
export const removeWrapMultiCtx: () => number;
export const removeWrapRuntime: () => number;
export const removeWrapWorker: () => number;
export const wrapEnhanceStable: () => number;
export const wrapEnhanceMultiThread: () => number;
export const wrapEnhanceMultiCtx: () => number;
export const wrapEnhanceRuntime: () => number;
export const wrapEnhanceWorker: () => number;