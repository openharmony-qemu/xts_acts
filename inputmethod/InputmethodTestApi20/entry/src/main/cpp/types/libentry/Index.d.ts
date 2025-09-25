/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
//inputmethod/inputmethod_attach_options_capi.h
export const testOhAttachOptionsIsShowKeyboardNullPointer: () => number;
export const testOhAttachOptionsGetRequestKeyboardReasonNullPointer: () => number;
//inputmethod/inputmethod_controller_capi.h
export const testOhInputMethodControllerAttachNullPointer: () => number;
export const testOhInputMethodControllerDetachNullPointer: () => number;
//inputmethod/inputmethod_cursor_info_capi.h
export const testOhCursorInfoSetRectNullPointer: () => number;
export const testOhCursorInfoSetRectOk: () => number;
export const testOhCursorInfoGetRectNullPointer: () => number;
export const testOhCursorInfoGetRectOk: () => number;
//inputmethod/inputmethod_inputmethod_proxy_capi.h
export const testOhInputMethodProxyShowKeyboardNullPointer: () => number;
export const testOhInputMethodProxyShowKeyboardDetached: () => number;
export const testOhInputMethodProxyShowTextInputNullPointer: () => number;
export const testOhInputMethodProxyShowTextInputDetached: () => number;
export const testOhInputMethodProxyHideKeyboardNullPointer: () => number;
export const testOhInputMethodProxyHideKeyboardDetached: () => number;
export const testOhInputMethodProxyNotifySelectionChangeNullPointer: () => number;
export const testOhInputMethodProxyNotifySelectionChangeDetached: () => number;
export const testOhInputMethodProxyNotifySelectionChangeParamCheckError: () => number;
export const testOhInputMethodProxyNotifyConfigurationChangeNullPointer: () => number;
export const testOhInputMethodProxyNotifyConfigurationChangeDetached: () => number;
export const testOhInputMethodProxyNotifyConfigurationChangeParamCheckError: () => number;
export const testOhInputMethodProxyNotifyCursorUpdateNullPointer: () => number;
export const testOhInputMethodProxyNotifyCursorUpdateDetached: () => number;
export const testOhInputMethodProxyNotifyCursorUpdateParamCheckError: () => number;
export const testOhInputMethodProxySendPrivateCommandNullPointer: () => number;
export const testOhInputMethodProxySendPrivateCommandDetached: () => number;
export const testOhInputMethodProxySendPrivateCommandParamCheckError: () => number;
//inputmethod/inputmethod_private_command_capi.h
export const testOhPrivateCommandSetKeyNullPointer: () => number;
export const testOhPrivateCommandSetKeyOk: () => number;
export const testOhPrivateCommandSetBoolValueNullPointer: () => number;
export const testOhPrivateCommandSetIntValueNullPointer: () => number;
export const testOhPrivateCommandSetStrValueNullPointer: () => number;
export const testOhPrivateCommandGetKeyNullPointer: () => number;
export const testOhPrivateCommandGetKeyOk: () => number;
export const testOHPrivateCommandGetValueTypeNullPointer: () => number;
export const testOHPrivateCommandGetValueTypeOk: () => number;
export const testOhPrivateCommandGetBoolValueNullPointer: () => number;
export const testOhPrivateCommandGetBoolValueOk: () => number;
export const testOhPrivateCommandGetBoolValueQueryFailed: () => number;
export const testOhPrivateCommandGetIntValueNullPointer: () => number;
export const testOhPrivateCommandGetIntValueOk: () => number;
export const testOhPrivateCommandGetIntValueQueryFailed: () => number;
export const testOhPrivateCommandGetStrValueNullPointer: () => number;
export const testOhPrivateCommandGetStrValueOk: () => number;
export const testOhPrivateCommandGetStrValueQueryFailed: () => number;
//inputmethod/inputmethod_text_avoid_info_capi.h
export const testOhTextAvoidInfoSetPositionYNullPointer: () => number;
export const testOhTextAvoidInfoSetPositionYOk: () => number;
export const testOhTextAvoidInfoSetHeightNullPointer: () => number;
export const testOhTextAvoidInfoSetHeightOk: () => number;
export const testOhTextAvoidInfoGetPositionYNullPointer: () => number;
export const testOhTextAvoidInfoGetPositionYOk: () => number;
export const testOhTextAvoidInfoGetHeightNullPointer: () => number;
export const testOhTextAvoidInfoGetHeightOk: () => number;
//inputmethod/inputmethod_text_config_capi.h
export const testOhTextConfigSetInputTypeNullPointer: () => number;
export const testOhTextConfigSetInputTypeOk: () => number;
export const testOhTextConfigSetEnterKeyTypeNullPointer: () => number;
export const testOhTextConfigSetEnterKeyTypeOk: () => number;
export const testOhTextConfigSetPreviewTextSupportNullPointer: () => number;
export const testOhTextConfigSetPreviewTextSupportOk: () => number;
export const testOhTextConfigSetSelectionNullPointer: () => number;
export const testOhTextConfigSetSelectionOk: () => number;
export const testOhTextConfigSetWindowIdNullPointer: () => number;
export const testOhTextConfigSetWindowIdOk: () => number;
export const testOhTextConfigSetPlaceholderNullPointer: () => number;
export const testOhTextConfigSetPlaceholderOk: () => number;
export const testOhTextConfigSetAbilityNameNullPointer: () => number;
export const testOhTextConfigSetAbilityNameOk: () => number;
export const testOhTextConfigGetInputTypeNullPointer: () => number;
export const testOhTextConfigGetInputTypeOk: () => number;
export const testOhTextConfigGetEnterKeyTypeNullPointer: () => number;
export const testOhTextConfigGetEnterKeyTypeOk: () => number;
export const testOhTextConfigIsPreviewTextSupportedNullPointer: () => number;
export const testOhTextConfigIsPreviewTextSupportedOk: () => number;
export const testOhTextConfigGetCursorInfoNullPointer: () => number;
export const testOhTextConfigGetCursorInfoOk: () => number;
export const testOhTextConfigGetTextAvoidInfoNullPointer: () => number;
export const testOhTextConfigGetTextAvoidInfoOk: () => number;
export const testOhTextConfigGetSelectionNullPointer: () => number;
export const testOhTextConfigGetSelectionOk: () => number;
export const testOhTextConfigGetWindowIdNullPointer: () => number;
export const testOhTextConfigGetWindowIdOk: () => number;
export const testOhTextConfigGetPlaceholderNullPointer: () => number;
export const testOhTextConfigGetPlaceholderOk: () => number;
export const testOhTextConfigGetPlaceholderParamCheckError: () => number;
export const testOhTextConfigGetAbilityNameNullPointer: () => number;
export const testOhTextConfigGetAbilityNameOk: () => number;
export const testOhTextConfigGetAbilityNameParamCheckError: () => number;
//inputmethod/inputmethod_text_editor_proxy_capi.h
export const testOhTextEditorProxySetGetTextConfigFuncNullPointer: () => number;
export const testOhTextEditorProxySetGetTextConfigFuncOk: () => number;
export const testOhTextEditorProxySetInsertTextFuncNullPointer: () => number;
export const testOhTextEditorProxySetInsertTextFuncOk: () => number;
export const testOhTextEditorProxySetDeleteForwardFuncNullPointer: () => number;
export const testOhTextEditorProxySetDeleteForwardFuncOk: () => number;
export const testOhTextEditorProxySetDeleteBackwardFuncNullPointer: () => number;
export const testOhTextEditorProxySetDeleteBackwardFuncOk: () => number;
export const testOhTextEditorProxySetSendKeyboardStatusFuncNullPointer: () => number;
export const testOhTextEditorProxySetSendKeyboardStatusFuncOk: () => number;
export const testOhTextEditorProxySetSendEnterKeyFuncNullPointer: () => number;
export const testOhTextEditorProxySetSendEnterKeyFuncOk: () => number;
export const testOhTextEditorProxySetMoveCursorFuncNullPointer: () => number;
export const testOhTextEditorProxySetMoveCursorFuncOk: () => number;
export const testOhTextEditorProxySetHandleSetSelectionFuncNullPointer: () => number;
export const testOhTextEditorProxySetHandleSetSelectionFuncOk: () => number;
export const testOhTextEditorProxySetHandleExtendActionFuncNullPointer: () => number;
export const testOhTextEditorProxySetHandleExtendActionFuncOk: () => number;
export const testOhTextEditorProxySetGetLeftTextOfCursorFuncNullPointer: () => number;
export const testOhTextEditorProxySetGetLeftTextOfCursorFuncOk: () => number;
export const testOhTextEditorProxySetGetRightTextOfCursorFuncNullPointer: () => number;
export const testOhTextEditorProxySetGetRightTextOfCursorFuncOk: () => number;
export const testOhTextEditorProxySetGetTextIndexAtCursorFuncNullPointer: () => number;
export const testOhTextEditorProxySetGetTextIndexAtCursorFuncOk: () => number;
export const testOhTextEditorProxySetReceivePrivateCommandFuncNullPointer: () => number;
export const testOhTextEditorProxySetReceivePrivateCommandFuncOk: () => number;
export const testOhTextEditorProxySetSetPreviewTextFuncNullPointer: () => number;
export const testOhTextEditorProxySetSetPreviewTextFuncOk: () => number;
export const testOhTextEditorProxySetFinishTextPreviewFuncNullPointer: () => number;
export const testOhTextEditorProxySetFinishTextPreviewFuncOk: () => number;
export const testOhTextEditorProxyGetGetTextConfigFuncNullPointer: () => number;
export const testOhTextEditorProxyGetGetTextConfigFuncOk: () => number;
export const testOhTextEditorProxyGetInsertTextFuncNullPointer: () => number;
export const testOhTextEditorProxyGetInsertTextFuncOk: () => number;
export const testOhTextEditorProxyGetDeleteForwardFuncNullPointer: () => number;
export const testOhTextEditorProxyGetDeleteForwardFuncOk: () => number;









