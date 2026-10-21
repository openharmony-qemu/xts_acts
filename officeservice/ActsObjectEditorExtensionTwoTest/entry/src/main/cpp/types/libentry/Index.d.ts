/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

export const TestExtensionRegisterOnCreateFunc_Normal: () => number;
export const TestExtensionRegisterOnDestroyFunc_Normal: () => number;
export const TestExtensionRegisterOnObjectAttachFunc_Normal: () => number;
export const TestExtensionUnRegisterOnObjectAttachFunc_Normal: () => number;
export const TestExtensionRegisterOnObjectDetachFunc_Normal: () => number;
export const TestExtensionUnRegisterOnObjectDetachFunc_Normal: () => number;
export const TestExtensionRegisterOnWriteToDataStreamFunc_Normal: () => number;
export const TestExtensionRegisterOnGetSnapshotFunc_Normal: () => number;
export const TestExtensionRegisterOnDoEditFunc_Normal: () => number;
export const TestExtensionRegisterOnGetEditStatusFunc_Normal: () => number;
export const TestExtensionRegisterOnGetCapabilityFunc_Normal: () => number;
export const TestExtensionGetContext_Normal: () => number;
export const TestExtensionGetExtensionInstance_Normal: () => number;
export const TestExtensionGetContentEmbedDocument_Normal: () => number;
export const TestExtensionCallbackToOnUpdate_CallbackNotRegistered: () => number;
export const TestExtensionCallbackToOnError_CallbackNotRegistered: () => number;
export const TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered: () => number;
export const TestExtensionCallbackToOnExtensionStopped_Normal: () => number;
export const TestExtensionCallbackToOnUpdate_CallbackFailed: () => number;
export const TestExtensionCallbackToOnError_CallbackFailed: () => number;
export const TestExtensionCallbackToOnEditingFinished_CallbackFailed: () => number;
export const TestExtensionCallbackToOnExtensionStopped_CallbackFailed: () => number;
