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

export interface EnumValues {
  qosBackground: number;
  qosUtility: number;
  eventModeDefault: number;
  priorityImmediate: number;
}

export interface ModuleRegisterResult {
  registerCalled: boolean;
}

export interface FatalExceptionResult {
  createStringStatus: number;
  fatalStatus: number;
}

export interface CriticalScopeStatus {
  openStatus: number;
  getBufferStatus: number;
  closeStatus: number;
  length: number;
  contentMatched: boolean;
}

export interface ExternalStringResult {
  utf16Status: number;
  readUtf16Status: number;
  utf16Matched: boolean;
  asciiStatus: number;
  readAsciiStatus: number;
  asciiMatched: boolean;
}

export interface StrongSendableReferenceResult {
  createArrayStatus: number;
  createRefStatus: number;
  getRefStatus: number;
  isSendableStatus: number;
  isSendable: boolean;
  deleteRefStatus: number;
}

export interface ThrowBusinessErrorResult {
  throwStatus: number;
  pendingStatus: number;
  pendingAfterThrow: boolean;
  clearStatus: number;
  pendingAfterClearStatus: number;
  pendingAfterClear: boolean;
}

export const testEnumValues: () => EnumValues;
export const testModuleRegister: () => ModuleRegisterResult;
export const testFatalExceptionInvalidArg: () => FatalExceptionResult;
export const testCriticalScopeOpenClose: () => CriticalScopeStatus;
export const testExternalString: () => ExternalStringResult;
export const testStrongSendableReference: () => StrongSendableReferenceResult;
export const testThrowBusinessError: () => ThrowBusinessErrorResult;
