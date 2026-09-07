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

export const createCallsiteInfoStable: () => number;
export const createCallsiteInfoMultiThread: () => number;
export const createCallsiteInfoMultiCtx: () => number;
export const createCallsiteInfoRuntime: () => number;
export const createCallsiteInfoWorker: () => number;
export const deleteCallsiteInfoNormal: () => number;
export const deleteCallsiteInfoStable: () => number;
export const deleteCallsiteInfoMultiThread: () => number;
export const deleteCallsiteInfoMultiCtx: () => number;
export const deleteCallsiteInfoRuntime: () => number;
export const deleteCallsiteInfoWorker: () => number;
export const getPropertyWithCallsiteInfoStable: () => number;
export const getPropertyWithCallsiteInfoMultiThread: () => number;
export const getPropertyWithCallsiteInfoMultiCtx: () => number;
export const getPropertyWithCallsiteInfoRuntime: () => number;
export const getPropertyWithCallsiteInfoWorker: () => number;
export const setPropertyWithCallsiteInfoRetVal: () => number;
export const setPropertyWithCallsiteInfoStable: () => number;
export const setPropertyWithCallsiteInfoMultiThread: () => number;
export const setPropertyWithCallsiteInfoMultiCtx: () => number;
export const setPropertyWithCallsiteInfoRuntime: () => number;
export const setPropertyWithCallsiteInfoWorker: () => number;