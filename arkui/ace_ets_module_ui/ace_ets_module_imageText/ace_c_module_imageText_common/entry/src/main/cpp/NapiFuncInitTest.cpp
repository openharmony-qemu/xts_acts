/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "TextCommon/TextCommonEnumTest.cpp"
#include "TextArea/TextAreaEnumTest.cpp"
#include "TextArea/TextAreaGradientTest.cpp"
#include "TextInput/TextInputEnumTest.cpp"
#include "TextInput/TextInputGradientTest.cpp"
#include "Richeditor/RichEditorPunctuationOverflowTest.cpp"
#include "Richeditor/RichEditorScrollToVisibleTest.cpp"
#include "TextCommon/TextPunctuationOverflowTest.cpp"
#include "TextInput/TextInputPunctuationOverflowTest.cpp"
#include "TextArea/TextAreaPunctuationOverflowTest.cpp"
#include "TextCommon/TextTailIndentsTest.cpp"
#include "TextCommon/ParagraphStyleTailIndentsTest.cpp"
#include "StyledString/LinearGradientTest.cpp"
#include "StyledString/RadialGradientTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TextEnumTest_001", nullptr, TextEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_002", nullptr, TextEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_003", nullptr, TextEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_004", nullptr, TextEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_005", nullptr, TextEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_006", nullptr, TextEnumTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_007", nullptr, TextEnumTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_008", nullptr, TextEnumTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_009", nullptr, TextEnumTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_010", nullptr, TextEnumTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_011", nullptr, TextEnumTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_012", nullptr, TextEnumTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_013", nullptr, TextEnumTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_014", nullptr, TextEnumTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_015", nullptr, TextEnumTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_016", nullptr, TextEnumTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_017", nullptr, TextEnumTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_018", nullptr, TextEnumTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_019", nullptr, TextEnumTest_019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_020", nullptr, TextEnumTest_020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_021", nullptr, TextEnumTest_021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_022", nullptr, TextEnumTest_022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_023", nullptr, TextEnumTest_023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_024", nullptr, TextEnumTest_024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_025", nullptr, TextEnumTest_025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_026", nullptr, TextEnumTest_026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_027", nullptr, TextEnumTest_027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_028", nullptr, TextEnumTest_028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_029", nullptr, TextEnumTest_029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_030", nullptr, TextEnumTest_030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_031", nullptr, TextEnumTest_031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_032", nullptr, TextEnumTest_032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_033", nullptr, TextEnumTest_033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextEnumTest_034", nullptr, TextEnumTest_034, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextAreaEnumTest_001", nullptr, TextAreaEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_002", nullptr, TextAreaEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_003", nullptr, TextAreaEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_004", nullptr, TextAreaEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_005", nullptr, TextAreaEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaEnumTest_006", nullptr, TextAreaEnumTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextAreaGradientTest_001", nullptr, TextAreaGradientTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaGradientTest_002", nullptr, TextAreaGradientTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextInputEnumTest_001", nullptr, TextInputEnumTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_002", nullptr, TextInputEnumTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_003", nullptr, TextInputEnumTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_004", nullptr, TextInputEnumTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputEnumTest_005", nullptr, TextInputEnumTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextInputGradientTest_001", nullptr, TextInputGradientTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputGradientTest_002", nullptr, TextInputGradientTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"RichEditorPunctuationOverflowTest_001", nullptr, RichEditorPunctuationOverflowTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorPunctuationOverflowTest_002", nullptr, RichEditorPunctuationOverflowTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorPunctuationOverflowTest_003", nullptr, RichEditorPunctuationOverflowTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorPunctuationOverflowTest_004", nullptr, RichEditorPunctuationOverflowTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorPunctuationOverflowTest_005", nullptr, RichEditorPunctuationOverflowTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"RichEditorScrollToVisibleTest_001", nullptr, RichEditorScrollToVisibleTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorScrollToVisibleTest_002", nullptr, RichEditorScrollToVisibleTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorScrollToVisibleTest_003", nullptr, RichEditorScrollToVisibleTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorScrollToVisibleTest_004", nullptr, RichEditorScrollToVisibleTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RichEditorScrollToVisibleTest_005", nullptr, RichEditorScrollToVisibleTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextPunctuationOverflowTest_001", nullptr, TextPunctuationOverflowTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextPunctuationOverflowTest_002", nullptr, TextPunctuationOverflowTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextPunctuationOverflowTest_003", nullptr, TextPunctuationOverflowTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextPunctuationOverflowTest_004", nullptr, TextPunctuationOverflowTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextPunctuationOverflowTest_005", nullptr, TextPunctuationOverflowTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextInputPunctuationOverflowTest_001", nullptr, TextInputPunctuationOverflowTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputPunctuationOverflowTest_002", nullptr, TextInputPunctuationOverflowTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputPunctuationOverflowTest_003", nullptr, TextInputPunctuationOverflowTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputPunctuationOverflowTest_004", nullptr, TextInputPunctuationOverflowTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextInputPunctuationOverflowTest_005", nullptr, TextInputPunctuationOverflowTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextAreaPunctuationOverflowTest_001", nullptr, TextAreaPunctuationOverflowTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaPunctuationOverflowTest_002", nullptr, TextAreaPunctuationOverflowTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaPunctuationOverflowTest_003", nullptr, TextAreaPunctuationOverflowTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaPunctuationOverflowTest_004", nullptr, TextAreaPunctuationOverflowTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextAreaPunctuationOverflowTest_005", nullptr, TextAreaPunctuationOverflowTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"TextTailIndentsTest_001", nullptr, TextTailIndentsTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextTailIndentsTest_002", nullptr, TextTailIndentsTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextTailIndentsTest_003", nullptr, TextTailIndentsTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextTailIndentsTest_004", nullptr, TextTailIndentsTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextTailIndentsTest_005", nullptr, TextTailIndentsTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"ParagraphStyleTailIndentsTest_001", nullptr, ParagraphStyleTailIndentsTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_002", nullptr, ParagraphStyleTailIndentsTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_003", nullptr, ParagraphStyleTailIndentsTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_004", nullptr, ParagraphStyleTailIndentsTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_005", nullptr, ParagraphStyleTailIndentsTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_006", nullptr, ParagraphStyleTailIndentsTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ParagraphStyleTailIndentsTest_007", nullptr, ParagraphStyleTailIndentsTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"LinearGradientTest_001", nullptr, LinearGradientTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_002", nullptr, LinearGradientTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_003", nullptr, LinearGradientTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_004", nullptr, LinearGradientTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_005", nullptr, LinearGradientTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_006", nullptr, LinearGradientTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_007", nullptr, LinearGradientTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_008", nullptr, LinearGradientTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_009", nullptr, LinearGradientTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_010", nullptr, LinearGradientTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_011", nullptr, LinearGradientTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_012", nullptr, LinearGradientTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_013", nullptr, LinearGradientTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_014", nullptr, LinearGradientTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_015", nullptr, LinearGradientTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_016", nullptr, LinearGradientTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_017", nullptr, LinearGradientTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_018", nullptr, LinearGradientTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_019", nullptr, LinearGradientTest_019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_020", nullptr, LinearGradientTest_020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_021", nullptr, LinearGradientTest_021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_022", nullptr, LinearGradientTest_022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_023", nullptr, LinearGradientTest_023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_024", nullptr, LinearGradientTest_024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_025", nullptr, LinearGradientTest_025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_026", nullptr, LinearGradientTest_026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_027", nullptr, LinearGradientTest_027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_028", nullptr, LinearGradientTest_028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"LinearGradientTest_029", nullptr, LinearGradientTest_029, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"RadialGradientTest_001", nullptr, RadialGradientTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_002", nullptr, RadialGradientTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_003", nullptr, RadialGradientTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_004", nullptr, RadialGradientTest_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_005", nullptr, RadialGradientTest_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_006", nullptr, RadialGradientTest_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_007", nullptr, RadialGradientTest_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_008", nullptr, RadialGradientTest_008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_009", nullptr, RadialGradientTest_009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_010", nullptr, RadialGradientTest_010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_011", nullptr, RadialGradientTest_011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_012", nullptr, RadialGradientTest_012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_013", nullptr, RadialGradientTest_013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_014", nullptr, RadialGradientTest_014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_015", nullptr, RadialGradientTest_015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_016", nullptr, RadialGradientTest_016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_017", nullptr, RadialGradientTest_017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_018", nullptr, RadialGradientTest_018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_019", nullptr, RadialGradientTest_019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_020", nullptr, RadialGradientTest_020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_021", nullptr, RadialGradientTest_021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_022", nullptr, RadialGradientTest_022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_023", nullptr, RadialGradientTest_023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_024", nullptr, RadialGradientTest_024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_025", nullptr, RadialGradientTest_025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_026", nullptr, RadialGradientTest_026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_027", nullptr, RadialGradientTest_027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_028", nullptr, RadialGradientTest_028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_029", nullptr, RadialGradientTest_029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_030", nullptr, RadialGradientTest_030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_031", nullptr, RadialGradientTest_031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_032", nullptr, RadialGradientTest_032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RadialGradientTest_033", nullptr, RadialGradientTest_033, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module nativefuncModule = {.nm_version = 1,
                                       .nm_flags = 0,
                                       .nm_filename = nullptr,
                                       .nm_register_func = Init,
                                       .nm_modname = "nativefunc",
                                       .nm_priv = ((void *)0),
                                       .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativefuncModule); }
} // namespace ArkUICapiTest