/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "manager/plugin_manager.h"
#include "position/EdgesPositionTest.h"
#include "textContentAlign/TextContentAlignTest.h"
#include "PixelRound/PixelRoundTest.h"
#include "Column/ColumnMatchParentTest.h"
#include "Column/ColumnWrapContentTest.h"
#include "Column/ColumnFixAtiDealSizeTest.h"

namespace ArkUICapiTest
{
    EXTERN_C_START
    static napi_value Init(napi_env env, napi_value exports)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
        if ((env == nullptr) || (exports == nullptr))
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
            return nullptr;
        }

        napi_property_descriptor desc[] = {
            {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createPositionEdgesNativeRoot", nullptr, EdgesPositionTest::CreatePositionEdgesNativeRoot,
             nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdgesIllegal_1", nullptr, EdgesPositionTest::setPositionEdgesIllegal_1, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdgesIllegal_2", nullptr, EdgesPositionTest::setPositionEdgesIllegal_2, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdgesIllegal_3", nullptr, EdgesPositionTest::setPositionEdgesIllegal_3, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top", nullptr, EdgesPositionTest::setPositionEdges_top, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_left", nullptr, EdgesPositionTest::setPositionEdges_left, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_bottom", nullptr, EdgesPositionTest::setPositionEdges_bottom, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_right", nullptr, EdgesPositionTest::setPositionEdges_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_negative", nullptr, EdgesPositionTest::setPositionEdges_top_negative, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_left_negative", nullptr, EdgesPositionTest::setPositionEdges_left_negative, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_bottom_negative", nullptr, EdgesPositionTest::setPositionEdges_bottom_negative, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_right_negative", nullptr, EdgesPositionTest::setPositionEdges_right_negative, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_left", nullptr, EdgesPositionTest::setPositionEdges_top_left, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_right", nullptr, EdgesPositionTest::setPositionEdges_top_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_bottom", nullptr, EdgesPositionTest::setPositionEdges_top_bottom, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_left_bottom", nullptr, EdgesPositionTest::setPositionEdges_left_bottom, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_left_right", nullptr, EdgesPositionTest::setPositionEdges_left_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_bottom_right", nullptr, EdgesPositionTest::setPositionEdges_bottom_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_left_bottom", nullptr, EdgesPositionTest::setPositionEdges_top_left_bottom, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_left_right", nullptr, EdgesPositionTest::setPositionEdges_top_left_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_bottom_right", nullptr, EdgesPositionTest::setPositionEdges_top_bottom_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_left_bottom_right", nullptr, EdgesPositionTest::setPositionEdges_left_bottom_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPositionEdges_top_left_bottom_right", nullptr, EdgesPositionTest::setPositionEdges_top_left_bottom_right, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"getPositionEdges", nullptr, EdgesPositionTest::getPositionEdges, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"reSetPositionEdges", nullptr, EdgesPositionTest::reSetPositionEdges, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"copyPositionEdges", nullptr, EdgesPositionTest::copyPositionEdges, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"textContentAlignTest", nullptr, TextContentAlignTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createPixelRoundNativeRoot", nullptr, PixelRoundTest::CreatePixelRoundNativeRoot, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"setPixelRound", nullptr, PixelRoundTest::SetPixelRound, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"getPixelRound", nullptr, PixelRoundTest::GetPixelRound, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createColumnMatchParentNativeRoot", nullptr, ColumnMatchParentTest::CreateColumnMatchParentNativeRoot, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createColumnWrapContentNativeRoot", nullptr, ColumnWrapContentTest::CreateColumnWrapContentNativeRoot, nullptr, nullptr, nullptr, napi_default, nullptr},
            {"createColumnFixAtiDealSizeNativeRoot", nullptr, ColumnFixAtiDealSizeTest::CreateColumnFixAtiDealSizeNativeRoot, nullptr, nullptr, nullptr, napi_default, nullptr},
        };
        if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok)
        {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
            return nullptr;
        }

        PluginManager::GetInstance()->Export(env, exports);
        return exports;
    }
    EXTERN_C_END

    static napi_module nativerenderModule = {.nm_version = 1,
                                             .nm_flags = 0,
                                             .nm_filename = nullptr,
                                             .nm_register_func = Init,
                                             .nm_modname = "nativerender",
                                             .nm_priv = ((void *)0),
                                             .reserved = {0}};

    extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativerenderModule); }
} // namespace ArkUICapiTest
