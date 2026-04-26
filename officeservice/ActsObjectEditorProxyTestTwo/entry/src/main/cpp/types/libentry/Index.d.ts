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

import {Context} from '@kit.AbilityKit';

export const TestProxyGetFormatFromInfo_Normal: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_Normal: () => number;
export const TestProxyGetIconFromFormat_Normal: () => number;
export const TestProxyGetContentEmbedInfo_Normal: () => number;
export const TestProxyGetFileNameExtensionsFromFormat_Normal: () => number;
export const initObjectServiceConnect: (ctx: Context) => number;
export const TestExtensionGetContent_Normal: () => number;
export const TestDocumentRead_Normal: () => number;
export const TestExtensionGetEmbedContent_Normal: () => number;
export const TestExtensionGetExtensionInstance_Normal: () => number;
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
export const TestExtensionGetContentEmbedDocument_Normal: () => number;
export const TestExtensionCallbackToOnUpdate_Normal: () => number;
export const TestExtensionCallbackToOnError_Normal: () => number;
export const TestExtensionCallbackToOnEditingFinished_Normal: () => number;
export const TestExtensionCallbackToOnExtensionStopped_Normal: () => number;
export const TestExtensionSetSnapshot_Normal: () => number;
export const TestExtensionContextStartSelfUIAbility_Normal: () => number;
export const TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal: () => number;
export const TestExtensionContextTerminateAbility_Normal: () => number;
export const TestProxyGetSnapshot_NotSupported: () => number;
export const TestProxyGetSnapshot_ExtensionError: () => number;
export const TestProxyGetSnapshot_Normal: () => number;
export const TestProxyStartWork_Error: () => number;
export const TestProxyStartWork_Normal: () => number;
export const TestProxyStopWork_Normal: () => number;
export const TestProxyDoEdit_NotSupported: () => number;
export const TestProxyDoEdit_ExtensionError: () => number;
export const TestProxyDoEdit_Normal: () => number;
export const TestProxyGetEditStatus_ExtensionError: () => number;
export const TestProxyGetEditStatus_Normal: () => number;
export const TestProxyGetCapability_ExtensionError: () => number;
export const TestProxyGetCapability_Normal: () => number;
export const TestProxyMultiExtension_Normal: () => number;
