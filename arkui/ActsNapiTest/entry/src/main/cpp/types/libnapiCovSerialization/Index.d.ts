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

export const serializeRetVal: () => number;
export const serializeStable: () => number;
export const serializeMultiThread: () => number;
export const serializeMultiCtx: () => number;
export const serializeRuntime: () => number;
export const serializeWorker: () => number;
export const deserializeAbnormal: () => number;
export const deserializeRetVal: () => number;
export const deserializeStable: () => number;
export const deserializeMultiThread: () => number;
export const deserializeMultiCtx: () => number;
export const deserializeRuntime: () => number;
export const deserializeWorker: () => number;
export const deleteSerializationDataAbnormal: () => number;
export const deleteSerializationDataRetVal: () => number;
export const deleteSerializationDataStable: () => number;
export const deleteSerializationDataMultiThread: () => number;
export const deleteSerializationDataMultiCtx: () => number;
export const deleteSerializationDataRuntime: () => number;
export const deleteSerializationDataWorker: () => number;