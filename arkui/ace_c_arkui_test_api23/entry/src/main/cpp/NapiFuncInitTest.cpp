/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "containerPicker/ContainerPickerCanLoopTest.cpp"
#include "containerPicker/ContainerPickerEnableHapticFeedbackTest.cpp"
#include "containerPicker/ContainerPickerSelectedIndexTest.cpp"
#include "containerPicker/ContainerPickerSelectionIndicatorTest.cpp"
#include "containerPicker/ContainerPickerSubComponentTest.cpp"
#include "MotionPath/MotionPathOptionsTest.cpp"
#include "publicCapacity/AtomicServiceMenuBarSetVisibleTest.cpp"


namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"TestContainerPickerCanLoop001", nullptr,
         TestContainerPickerCanLoop001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop002", nullptr,
         TestContainerPickerCanLoop002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop003", nullptr,
         TestContainerPickerCanLoop003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerCanLoop004", nullptr,
         TestContainerPickerCanLoop004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback001", nullptr,
         TestContainerPickerEnableHapticFeedback001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback002", nullptr,
         TestContainerPickerEnableHapticFeedback002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback003", nullptr,
         TestContainerPickerEnableHapticFeedback003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerEnableHapticFeedback004", nullptr,
         TestContainerPickerEnableHapticFeedback004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex001", nullptr,
         TestContainerPickerSelectedIndex001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex002", nullptr,
         TestContainerPickerSelectedIndex002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex003", nullptr,
         TestContainerPickerSelectedIndex003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectedIndex004", nullptr,
         TestContainerPickerSelectedIndex004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator001", nullptr,
         TestContainerPickerSelectionIndicator001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator002", nullptr,
         TestContainerPickerSelectionIndicator002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator003", nullptr,
         TestContainerPickerSelectionIndicator003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator004", nullptr,
         TestContainerPickerSelectionIndicator004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator005", nullptr,
         TestContainerPickerSelectionIndicator005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator006", nullptr,
         TestContainerPickerSelectionIndicator006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator007", nullptr,
         TestContainerPickerSelectionIndicator007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator008", nullptr,
         TestContainerPickerSelectionIndicator008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator009", nullptr,
         TestContainerPickerSelectionIndicator009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator010", nullptr,
         TestContainerPickerSelectionIndicator010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator011", nullptr,
         TestContainerPickerSelectionIndicator011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator012", nullptr,
         TestContainerPickerSelectionIndicator012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator013", nullptr,
         TestContainerPickerSelectionIndicator013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator014", nullptr,
         TestContainerPickerSelectionIndicator014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator015", nullptr,
         TestContainerPickerSelectionIndicator015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSelectionIndicator016", nullptr,
         TestContainerPickerSelectionIndicator016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent001", nullptr,
         TestContainerPickerSubComponent001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent002", nullptr,
         TestContainerPickerSubComponent002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent003", nullptr,
         TestContainerPickerSubComponent003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestContainerPickerSubComponent004", nullptr,
         TestContainerPickerSubComponent004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testMotionPathOptions001", nullptr, MotionPathOptionsCreate, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions002", nullptr, MotionPathOptionsPath, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions003", nullptr, MotionPathOptionsFrom, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions004", nullptr, MotionPathOptionsTo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions005", nullptr, MotionPathOptionsRotatable, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions006", nullptr, GetMotionPathOptions, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions007", nullptr, GetMotionPathOptionsInvalid, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions008", nullptr, GetPathBufferSizeError, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testMotionPathOptions009", nullptr, MotionPathNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestAtomicServiceMenuBarSetVisible01", nullptr,
         TestAtomicServiceMenuBarSetVisible01, nullptr, nullptr, nullptr, napi_default, nullptr},
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