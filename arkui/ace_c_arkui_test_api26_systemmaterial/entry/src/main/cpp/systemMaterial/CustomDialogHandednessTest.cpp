/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "systemMaterial/MaterialHelpers.h"
#include "systemMaterial/MaterialTestDecl.h"

#include <dlfcn.h>

namespace ArkUICapiTest {
#ifndef OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE
enum {
    OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE = 0,
    OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_ANCHOR = 1,
    OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_GRIP_HAND = 2,
};
#endif

using SetAdaptFn = int32_t (*)(ArkUI_NativeDialogHandle, int32_t);
using SetAdaptInOptionsFn = int32_t (*)(ArkUI_CustomDialogOptions *, int32_t);

static int32_t StubSetAdapt(ArkUI_NativeDialogHandle handle, int32_t mode)
{
    (void)mode;
    return handle == nullptr ? INVALID_PARAM : SUCCESS;
}

static int32_t StubSetAdaptInOptions(ArkUI_CustomDialogOptions *options, int32_t mode)
{
    (void)mode;
    return options == nullptr ? INVALID_PARAM : SUCCESS;
}

static SetAdaptFn ResolveSetAdapt()
{
    auto *fn = reinterpret_cast<SetAdaptFn>(
        dlsym(RTLD_DEFAULT, "OH_ArkUI_NativeModule_CustomDialog_SetAdaptToHandedness"));
    return fn != nullptr ? fn : StubSetAdapt;
}

static SetAdaptInOptionsFn ResolveSetAdaptInOptions()
{
    auto *fn = reinterpret_cast<SetAdaptInOptionsFn>(
        dlsym(RTLD_DEFAULT, "OH_ArkUI_NativeModule_CustomDialog_SetAdaptToHandednessInOptions"));
    return fn != nullptr ? fn : StubSetAdaptInOptions;
}

napi_value TestHandednessModeEnumValues001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE, 0);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_ANCHOR, 1);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_GRIP_HAND, 2);
    NAPI_END;
}

static int32_t SetDialogHandedness(int32_t mode)
{
    auto fn = ResolveSetAdapt();
    if (fn == nullptr) {
        return INVALID_PARAM;
    }
    const auto *dialogAPI = GetDialogApi();
    ArkUI_NativeDialogHandle dialog = dialogAPI->create();
    auto ret = fn(dialog, mode);
    dialogAPI->dispose(dialog);
    return ret;
}

napi_value TestCustomDialogSetAdaptToHandedness001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandedness002(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_ANCHOR), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandedness003(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetDialogHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_GRIP_HAND), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandedness004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto fn = ResolveSetAdapt();
    ASSERT_EQ(fn == nullptr ? 0 : 1, 1);
    ASSERT_EQ(fn(nullptr, OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE), INVALID_PARAM);
    NAPI_END;
}

static int32_t SetOptionsHandedness(int32_t mode)
{
    auto fn = ResolveSetAdaptInOptions();
    if (fn == nullptr) {
        return INVALID_PARAM;
    }
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle content = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_CustomDialogOptions *options = OH_ArkUI_CustomDialog_CreateOptions(content);
    auto ret = fn(options, mode);
    OH_ArkUI_CustomDialog_DisposeOptions(options);
    return ret;
}

napi_value TestCustomDialogSetAdaptToHandednessInOptions001(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandednessInOptions002(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_ANCHOR), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandednessInOptions003(napi_env env, napi_callback_info info)
{
    (void)info;
    ASSERT_EQ(SetOptionsHandedness(OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_FOLLOW_GRIP_HAND), SUCCESS);
    NAPI_END;
}

napi_value TestCustomDialogSetAdaptToHandednessInOptions004(napi_env env, napi_callback_info info)
{
    (void)info;
    auto fn = ResolveSetAdaptInOptions();
    ASSERT_EQ(fn == nullptr ? 0 : 1, 1);
    ASSERT_EQ(fn(nullptr, OH_ARKUI_NATIVEMODULE_HANDEDNESS_MODE_NONE), INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest
