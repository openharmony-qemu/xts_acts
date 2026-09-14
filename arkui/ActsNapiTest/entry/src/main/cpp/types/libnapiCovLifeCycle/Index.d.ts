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

export const openHandleScopeStable: () => number;
export const openHandleScopeMultiThread: () => number;
export const openHandleScopeMultiCtx: () => number;
export const openHandleScopeRuntime: () => number;
export const openHandleScopeWorker: () => number;
export const closeHandleScopeRetVal: () => number;
export const closeHandleScopeStable: () => number;
export const closeHandleScopeMultiThread: () => number;
export const closeHandleScopeMultiCtx: () => number;
export const closeHandleScopeRuntime: () => number;
export const closeHandleScopeWorker: () => number;
export const openEscapableHandleScopeRetVal: () => number;
export const openEscapableHandleScopeStable: () => number;
export const openEscapableHandleScopeMultiThread: () => number;
export const openEscapableHandleScopeMultiCtx: () => number;
export const openEscapableHandleScopeRuntime: () => number;
export const openEscapableHandleScopeWorker: () => number;
export const closeEscapableHandleScopeAbnormal: () => number;
export const closeEscapableHandleScopeRetVal: () => number;
export const closeEscapableHandleScopeStable: () => number;
export const closeEscapableHandleScopeMultiThread: () => number;
export const closeEscapableHandleScopeMultiCtx: () => number;
export const closeEscapableHandleScopeRuntime: () => number;
export const closeEscapableHandleScopeWorker: () => number;
export const escapeHandleRetVal: () => number;
export const escapeHandleStable: () => number;
export const escapeHandleMultiThread: () => number;
export const escapeHandleMultiCtx: () => number;
export const escapeHandleRuntime: () => number;
export const escapeHandleWorker: () => number;
export const createReferenceStable: () => number;
export const createReferenceMultiThread: () => number;
export const createReferenceMultiCtx: () => number;
export const createReferenceRuntime: () => number;
export const createReferenceWorker: () => number;
export const deleteReferenceRetVal: () => number;
export const deleteReferenceStable: () => number;
export const deleteReferenceMultiThread: () => number;
export const deleteReferenceMultiCtx: () => number;
export const deleteReferenceRuntime: () => number;
export const deleteReferenceWorker: () => number;
export const referenceRefAbnormal: () => number;
export const referenceRefRetVal: () => number;
export const referenceRefStable: () => number;
export const referenceRefMultiThread: () => number;
export const referenceRefMultiCtx: () => number;
export const referenceRefRuntime: () => number;
export const referenceRefWorker: () => number;
export const referenceUnrefAbnormal: () => number;
export const referenceUnrefRetVal: () => number;
export const referenceUnrefStable: () => number;
export const referenceUnrefMultiThread: () => number;
export const referenceUnrefMultiCtx: () => number;
export const referenceUnrefRuntime: () => number;
export const referenceUnrefWorker: () => number;
export const getReferenceValueRetVal: () => number;
export const getReferenceValueStable: () => number;
export const getReferenceValueMultiThread: () => number;
export const getReferenceValueMultiCtx: () => number;
export const getReferenceValueRuntime: () => number;
export const getReferenceValueWorker: () => number;
export const addFinalizerMultiThread: () => number;
export const addFinalizerMultiCtx: () => number;
export const addFinalizerRuntime: () => number;
export const addFinalizerWorker: () => number;