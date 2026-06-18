/**
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
#include "ani/ani.h"
#include <array>
#include <iostream>

static ani_int add([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int arg1, ani_int arg2)
{
    return arg1 + arg2;
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    ani_status status = vm->GetEnv(ANI_VERSION_1, &env);
    if (ANI_OK != status) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return status;
    }
    ani_class cls{};
    status = env->FindClass(clsName, &cls);
    if (ANI_OK != status) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return status;
    }
    const char *testSignature = "ii:i";
    std::array methods = {
        ani_native_function{"add", testSignature, reinterpret_cast<void *>(add)},
    };

    status = env->Class_BindNativeMethods(cls, methods.data(), methods.size());
    if (ANI_OK != status) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return status;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "entry.src.main.ets.pages.Index.Calc");
    *result = ANI_VERSION_1;
    return ANI_OK;
}

extern "C" {
void OHMain()
{
    std::cout << "testTag : Run Native Main" << std::endl;
}
}
