/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
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
 
export const testFdsanSetErrorLevelWarnAlways: () => boolean;
export const testFdsanSetErrorLevelWarnOnce: () => boolean;
export const testFdsanSetErrorLevelFatal: () => boolean;
export const testFdsanSetErrorLevelDisabled: () => boolean;
export const testFdsanSetErrorLevelInvalidEnum: () => boolean;
export const testFdsanCreateOwnerTagNormal: () => boolean;
export const testFdsanCreateOwnerTagZero: () => boolean;
export const testFdsanCreateOwnerTagInvalidType: () => boolean;
export const testFdsanGetOwnerTagWithTagSet: () => boolean;
export const testFdsanGetOwnerTagNoTagSet: () => boolean;
export const testFdsanGetOwnerTagInvalidFd: () => boolean;
export const testFdsanGetTagTypeAndValue: () => boolean;
export const testFdsanExchangeOwnerTagZeroToNew: () => boolean;
export const testFdsanExchangeOwnerTagOldToNew: () => boolean;
export const testFdsanExchangeOwnerTagMismatch: () => boolean;
export const testFdsanExchangeOwnerTagInvalidFd: () => boolean;
export const testFdsanCloseWithTagMatch: () => boolean;
export const testFdsanCloseWithTagMismatch: () => boolean;
export const testFdsanCloseWithTagFdAlreadyClosed: () => boolean;
export const testFdsanCloseWithTagInvalidFd: () => boolean;
export const testFdsanSetErrorLevelNegativeOrOverRange: () => boolean;
export const testFdsanCreateOwnerTagTypeOutOfRange: () => boolean;
export const testFdsanExchangeOwnerTagFdMinusOne: () => boolean;
export const testFdsanCloseWithTagFdMinusOne: () => boolean;
export const testFdsanGetOwnerTagFdMinusOne: () => boolean;
export const testFdsanGetTagTypeTagZero: () => boolean;
export const testFdsanGetTagValueTagAllOne: () => boolean;
export const testFdsanComTransferFdOwnership: () => boolean;
export const testFdsanComMoveSemanticsRaii: () => boolean;
export const testFdsanComNestedErrorLevelFatal: () => boolean;
export const testFdsanComMultiThreadMixedOperation: () => boolean;
export const testFdsanDoubleCloseSameThread: () => boolean;
export const testFdsanDoubleCloseCrossThread: () => boolean;
export const testFdsanUseAfterClose: () => boolean;
export const testFdsanLevelWarnOnce: () => boolean;
export const testFdsanLevelWarnAlways: () => boolean;
export const testFdsanLevelFatal: () => boolean;
export const testFdsanLevelDisabled: () => boolean;
export const testFdsanStdlibFopenFclose: () => boolean;
export const testFdsanStdlibFdopen: () => boolean;
export const testFdsanSignalSafety: () => boolean;
