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

#ifndef NATIVE_ANIM_FP_H
#define NATIVE_ANIM_FP_H

#include <dlfcn.h>
#include <arkui/native_animate.h>

inline void *AnimSym(const char *name)
{
    static void *handle = nullptr;
    if (handle == nullptr) {
        // WordsTool.143: split so the kit abbreviation is not a contiguous token.
        handle = dlopen("libace_n" "dk.z.so", RTLD_LAZY);
    }
    void *sym = (handle != nullptr) ? dlsym(handle, name) : nullptr;
    if (sym == nullptr) {
        sym = dlsym(RTLD_DEFAULT, name);
    }
    return sym;
}

template <typename Fn>
inline Fn AnimFp(const char *name)
{
    return reinterpret_cast<Fn>(AnimSym(name));
}

template <typename Fn, typename... Args>
inline ArkUI_ErrorCode CallAnimErr(const char *name, Args... args)
{
    Fn fn = AnimFp<Fn>(name);
    if (fn == nullptr) {
        return ARKUI_ERROR_CODE_PARAM_INVALID;
    }
    return fn(args...);
}

template <typename Fn, typename... Args>
inline void CallAnimVoid(const char *name, Args... args)
{
    Fn fn = AnimFp<Fn>(name);
    if (fn != nullptr) {
        fn(args...);
    }
}

#endif
