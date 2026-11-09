/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef JSVM_RUNTIME_INIT_H
#define JSVM_RUNTIME_INIT_H

#include <ark_runtime/jsvm.h>
#include <mutex>

inline bool EnsureJsvmRuntimeInit()
{
    static std::once_flag initFlag;
    static JSVM_Status initStatus = JSVM_GENERIC_FAILURE;
    std::call_once(initFlag, [] {
        JSVM_InitOptions options{};
        initStatus = OH_JSVM_Init(&options);
    });
    return initStatus == JSVM_OK;
}

#endif
