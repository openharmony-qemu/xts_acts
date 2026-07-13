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

#ifndef LIBC_FUNCTION_LOADER_H
#define LIBC_FUNCTION_LOADER_H

#include <dlfcn.h>
#include <mutex>
#include <clocale>
#include <sys/socket.h>
#include <pthread.h>
#include <cwchar>
#include <sched.h>
#include <csetjmp>
#include <fcntl.h>
#include <cfenv>
#include <netdb.h>
#include <malloc.h>
#include <ctime>
#include <cstdint>

class LibcFunctionLoader {
public:
    static LibcFunctionLoader& GetInstance()
    {
        static LibcFunctionLoader instance;
        return instance;
    }

    using AcosfFiniteFunc = float (*)(float);
    using AsprintfChkFunc = int (*)(char**, int, const char*, ...);
    using VasprintfChkFunc = int (*)(char**, int, const char*, va_list);
    using Atan2FiniteFunc = double (*)(double, double);
    using CmsgNxthdrFunc = struct cmsghdr* (*)(struct msghdr*, struct cmsghdr*);
    using DFXSetCrashLogConfigFunc = int (*)(uint8_t, uint32_t);
    using Exp2fFiniteFunc = float (*)(float);
    using Exp2FiniteFunc = double (*)(double);
    using ExpFiniteFunc = double (*)(double);
    using ExplicitBzeroChkFunc = void (*)(void*, size_t, size_t);
    mutable ExplicitBzeroChkFunc explicitBzeroChk_ = nullptr;

    ExplicitBzeroChkFunc GetExplicitBzeroChk() const
    {
        return LazyLoad(explicitBzeroChk_, "__explicit_bzero_chk");
    }
    AcosfFiniteFunc GetAcosfFinite() const { return LazyLoad(acosfFinite_, "__acosf_finite"); }
    AsprintfChkFunc GetAsprintfChk() const { return LazyLoad(asprintfChk_, "__asprintf_chk"); }
    VasprintfChkFunc GetVasprintfChk() const { return LazyLoad(vasprintfChk_, "__vasprintf_chk"); }
    Atan2FiniteFunc GetAtan2Finite() const { return LazyLoad(atan2Finite_, "__atan2_finite"); }
    CmsgNxthdrFunc GetCmsgNxthdr() const { return LazyLoad(cmsgNxthdr_, "__cmsg_nxthdr"); }
    Exp2FiniteFunc GetExp2Finite() const { return LazyLoad(exp2Finite_, "__exp2_finite"); }
    ExpFiniteFunc GetExpFinite() const { return LazyLoad(expFinite_, "__exp_finite"); }
    Exp2fFiniteFunc GetExp2fFinite() const { return LazyLoad(exp2fFinite_, "exp2f_finite"); }
    DFXSetCrashLogConfigFunc GetDFXSetCrashLogConfig() const
    {
        return LazyLoad(dfxSetCrashLogConfig_, "DFX_SetCrashLogConfig");
    }
private:
    LibcFunctionLoader() = default;
    ~LibcFunctionLoader() = default;

    LibcFunctionLoader(const LibcFunctionLoader&) = delete;
    LibcFunctionLoader& operator=(const LibcFunctionLoader&) = delete;

    template<typename FuncType>
    FuncType LazyLoad(FuncType& ptr, const char* name) const
    {
        if (ptr != nullptr) {
            return ptr;
        }
        std::lock_guard<std::mutex> lock(mutex_);
        if (ptr != nullptr) {
            return ptr;
        }
        dlerror();
        void* sym = dlsym(RTLD_DEFAULT, name);
        dlerror();
        ptr = reinterpret_cast<FuncType>(sym);
        return ptr;
    }

    mutable std::mutex mutex_;

    mutable AcosfFiniteFunc acosfFinite_ = nullptr;
    mutable AsprintfChkFunc asprintfChk_ = nullptr;
    mutable VasprintfChkFunc vasprintfChk_ = nullptr;
    mutable Atan2FiniteFunc atan2Finite_ = nullptr;
    mutable CmsgNxthdrFunc cmsgNxthdr_ = nullptr;
    mutable DFXSetCrashLogConfigFunc dfxSetCrashLogConfig_ = nullptr;
    mutable Exp2FiniteFunc exp2Finite_ = nullptr;
    mutable ExpFiniteFunc expFinite_ = nullptr;
    mutable Exp2fFiniteFunc exp2fFinite_ = nullptr;
};
#endif // LIBC_FUNCTION_LOADER_H
