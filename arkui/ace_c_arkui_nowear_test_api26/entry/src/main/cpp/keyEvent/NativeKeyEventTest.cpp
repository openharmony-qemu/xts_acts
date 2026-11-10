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

#include "common/common.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <cstdint>
#include <cstring>

namespace ArkUICapiTest {

static ArkUI_UIInputEvent *CreateKeyEvent()
{
    ArkUI_UIInputEvent *event = nullptr;
    ArkUI_ErrorCode ret = OH_ArkUI_KeyEvent_Create(&event);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR || event == nullptr) {
        return nullptr;
    }
    return event;
}

static napi_value KeyEventFunctionalTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = nullptr;
    ASSERT_EQ(OH_ArkUI_KeyEvent_Create(&event), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(event != nullptr, true);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetType(event, ARKUI_KEY_EVENT_DOWN),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_GetType(event), ARKUI_KEY_EVENT_DOWN);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyCode(event, ARKUI_KEYCODE_ENTER),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_GetKeyCode(event), ARKUI_KEYCODE_ENTER);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyText(event, "enter"),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(strcmp(OH_ArkUI_KeyEvent_GetKeyText(event), "enter") == 0, true);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeySource(event, ARKUI_KEY_SOURCE_TYPE_KEYBOARD),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_GetKeySource(event), ARKUI_KEY_SOURCE_TYPE_KEYBOARD);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetUnicode(event, 0x000D),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_GetUnicode(event), 0x000D);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyIntentionCode(event, ARKUI_KEY_INTENSION_SELECT),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_GetKeyIntensionCode(event), ARKUI_KEY_INTENSION_SELECT);

    bool capsState = true;
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetCapsLockOn(event, false),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_IsCapsLockOn(event, &capsState),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(capsState, false);

    bool numState = false;
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetNumLockOn(event, true),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_IsNumLockOn(event, &numState),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(numState, true);

    bool scrollState = true;
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetScrollLockOn(event, false),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_IsScrollLockOn(event, &scrollState),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(scrollState, false);

    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(event == nullptr, true);
    NAPI_END;
}

static napi_value KeyEventCreateDestroyTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = nullptr;
    ASSERT_EQ(OH_ArkUI_KeyEvent_Create(&event), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(event != nullptr, true);
    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(event == nullptr, true);
    NAPI_END;
}

static napi_value KeyEventCreateDestroyTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ArkUI_KeyEvent_Create(nullptr), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value KeyEventCreateDestroyTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = nullptr;
    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value KeyEventSetPropertiesTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = CreateKeyEvent();
    ASSERT_EQ(event != nullptr, true);

    ASSERT_EQ(OH_ArkUI_KeyEvent_SetType(event, ARKUI_KEY_EVENT_UP),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyCode(event, ARKUI_KEYCODE_A),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyText(event, "a"),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeySource(event, ARKUI_KEY_SOURCE_TYPE_MOUSE),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetDeviceId(event, PARAM_100),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetUnicode(event, 0x0041),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetEventTime(event, PARAM_960000),
        ARKUI_ERROR_CODE_NO_ERROR);
    int32_t pressedKeys[] = {ARKUI_KEYCODE_A, ARKUI_KEYCODE_SHIFT_LEFT};
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetPressedKeys(event, pressedKeys, PARAM_2),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetCapsLockOn(event, true),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyIntentionCode(event, ARKUI_KEY_INTENSION_UP),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetNumLockOn(event, false),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetScrollLockOn(event, true),
        ARKUI_ERROR_CODE_NO_ERROR);

    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value KeyEventSetPropertiesTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetType(nullptr, ARKUI_KEY_EVENT_DOWN),
        ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value KeyEventSetKeyTextTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = CreateKeyEvent();
    ASSERT_EQ(event != nullptr, true);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetKeyText(event, nullptr),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value KeyEventSetPressedKeysTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_UIInputEvent *event = CreateKeyEvent();
    ASSERT_EQ(event != nullptr, true);
    ASSERT_EQ(OH_ArkUI_KeyEvent_SetPressedKeys(event, nullptr, PARAM_0),
        ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(OH_ArkUI_KeyEvent_Destroy(&event), ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

} // namespace ArkUICapiTest
