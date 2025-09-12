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

#include "common/Common.h"
#include "mindspore/MindSporeFormatTest.h"

namespace MindSporeTest {
EXTERN_C_START
static void RenderInitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        {"FormatTest_001", nullptr, MindSporeFormatTest::FormatTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_002", nullptr, MindSporeFormatTest::FormatTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_003", nullptr, MindSporeFormatTest::FormatTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_004", nullptr, MindSporeFormatTest::FormatTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_005", nullptr, MindSporeFormatTest::FormatTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_006", nullptr, MindSporeFormatTest::FormatTest_006,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_007", nullptr, MindSporeFormatTest::FormatTest_007,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_008", nullptr, MindSporeFormatTest::FormatTest_008,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_009", nullptr, MindSporeFormatTest::FormatTest_009,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_010", nullptr, MindSporeFormatTest::FormatTest_010,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_011", nullptr, MindSporeFormatTest::FormatTest_011,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_012", nullptr, MindSporeFormatTest::FormatTest_012,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_013", nullptr, MindSporeFormatTest::FormatTest_013,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_014", nullptr, MindSporeFormatTest::FormatTest_014,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_015", nullptr, MindSporeFormatTest::FormatTest_015,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static napi_value RenderInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[100] = {};
    RenderInitPush0(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module mindsporendkModule = {.nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = RenderInit,
    .nm_modname = "mindsporendk",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&mindsporendkModule); }
}