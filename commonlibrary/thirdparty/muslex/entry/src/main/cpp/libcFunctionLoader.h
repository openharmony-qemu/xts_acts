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

    using FdeltChkFunc = long int (*)(long int);
    using ExplicitBzeroChkFunc = void (*)(void*, size_t, size_t);
    using AcosfFiniteFunc = float (*)(float);
    using AsprintfChkFunc = int (*)(char**, int, const char*, ...);
    using VasprintfChkFunc = int (*)(char**, int, const char*, va_list);
    using Atan2FiniteFunc = double (*)(double, double);
    using CmsgNxthdrFunc = struct cmsghdr* (*)(struct msghdr*, struct cmsghdr*);
    using Exp2FiniteFunc = double (*)(double);
    using IsinffFunc = int (*)(float);
    using ExpFiniteFunc = double (*)(double);
    using FiniteFunc = int (*)(double);
    using FinitefFunc = int (*)(float);
    using FprintfChkFunc = int (*)(FILE*, int, const char*, ...);
    using GetauxvalFunc = unsigned long (*)(unsigned long);
    using IsinfFunc = int (*)(double);
    using Exp2fFiniteFunc = float (*)(float);
    using IsnanfFunc = int (*)(float);
    using IsnanFunc = int (*)(double);
    using DFXSetCrashLogConfigFunc = int (*)(uint8_t, uint32_t);
    using Fcntl64Func = int (*)(int, int, ...);
    using FedisableexceptFunc = int (*)(int);
    using FeenableexceptFunc = int (*)(int);
    using FegetexceptFunc = int (*)(void);
    using GetaddrinfoCustomFunc = int (*)(const char*, const char*, const struct addrinfo*, struct addrinfo**);
    using HilogBaseIsLoggableFunc = bool (*)(unsigned int, const char*, int);
    using HilogBasePrintFunc = int (*)(int, int, unsigned int, const char*, const char*, ...);
    using GwpAsanCollectFunc = size_t (*)(uint64_t, uintptr_t*, size_t, size_t);
    using FfrtGetStackFn = size_t (*)(size_t*, size_t);
    using GwpAsanRegisterFfrtFunc = void (*)(FfrtGetStackFn);
    FdeltChkFunc GetFdeltChk() const { return LazyLoad(fdeltChk_, "__fdelt_chk"); }
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
    IsinffFunc GetIsinff() const { return LazyLoad(isinff_, "__isinff"); }
    ExpFiniteFunc GetExpFinite() const { return LazyLoad(expFinite_, "__exp_finite"); }
    FiniteFunc GetFinite() const { return LazyLoad(finite_, "__finite"); }
    FinitefFunc GetFinitef() const { return LazyLoad(finitef_, "__finitef"); }
    FprintfChkFunc GetFprintfChk() const { return LazyLoad(fprintfChk_, "__fprintf_chk"); }
    GetauxvalFunc GetGetauxval() const { return LazyLoad(getauxval_, "__getauxval"); }
    IsinfFunc GetIsinf() const { return LazyLoad(isinf_, "__isinf"); }
    Exp2fFiniteFunc GetExp2fFinite() const { return LazyLoad(exp2fFinite_, "exp2f_finite"); }
    IsnanfFunc GetIsnanf() const { return LazyLoad(isnanf_, "__isnanf"); }
    IsnanFunc GetIsnan() const { return LazyLoad(isnan_, "__isnan"); }
    DFXSetCrashLogConfigFunc GetDFXSetCrashLogConfig() const
    {
        return LazyLoad(dfxSetCrashLogConfig_, "DFX_SetCrashLogConfig");
    }
    Fcntl64Func GetFcntl64() const { return LazyLoad(fcntl64_, "fcntl64"); }
    FedisableexceptFunc GetFedisableexcept() const
    {
        return LazyLoad(fedisableexcept_, "fedisableexcept");
    }
    FeenableexceptFunc GetFeenableexcept() const
    {
        return LazyLoad(feenableexcept_, "feenableexcept");
    }
    FegetexceptFunc GetFegetexcept() const { return LazyLoad(fegetexcept_, "fegetexcept"); }
    GetaddrinfoCustomFunc GetGetaddrinfoCustom() const
    {
        return LazyLoad(getaddrinfoCustom_, "getaddrinfo_custom");
    }
    HilogBaseIsLoggableFunc GetHilogBaseIsLoggable() const
    {
        return LazyLoad(hilogBaseIsLoggable_, "HiLogBaseIsLoggable");
    }
    HilogBasePrintFunc GetHilogBasePrint() const
    {
        return LazyLoad(hilogBasePrint_, "HiLogBasePrint");
    }
    GwpAsanCollectFunc GetGwpAsanCollect() const
    {
        return LazyLoad(gwpAsanCollect_, "libc_gwp_asan_collect_allocations_by_time_range");
    }
    GwpAsanRegisterFfrtFunc GetGwpAsanRegisterFfrt() const
    {
        return LazyLoad(gwpAsanRegisterFfrt_, "libc_gwp_asan_register_ffrt_stack_func");
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

    mutable FdeltChkFunc fdeltChk_ = nullptr;
    mutable ExplicitBzeroChkFunc explicitBzeroChk_ = nullptr;
    mutable AcosfFiniteFunc acosfFinite_ = nullptr;
    mutable AsprintfChkFunc asprintfChk_ = nullptr;
    mutable VasprintfChkFunc vasprintfChk_ = nullptr;
    mutable Atan2FiniteFunc atan2Finite_ = nullptr;
    mutable CmsgNxthdrFunc cmsgNxthdr_ = nullptr;
    mutable Exp2FiniteFunc exp2Finite_ = nullptr;
    mutable IsinffFunc isinff_ = nullptr;
    mutable ExpFiniteFunc expFinite_ = nullptr;
    mutable FiniteFunc finite_ = nullptr;
    mutable FinitefFunc finitef_ = nullptr;
    mutable FprintfChkFunc fprintfChk_ = nullptr;
    mutable GetauxvalFunc getauxval_ = nullptr;
    mutable IsinfFunc isinf_ = nullptr;
    mutable Exp2fFiniteFunc exp2fFinite_ = nullptr;
    mutable IsnanfFunc isnanf_ = nullptr;
    mutable IsnanFunc isnan_ = nullptr;
    mutable DFXSetCrashLogConfigFunc dfxSetCrashLogConfig_ = nullptr;
    mutable Fcntl64Func fcntl64_ = nullptr;
    mutable FedisableexceptFunc fedisableexcept_ = nullptr;
    mutable FeenableexceptFunc feenableexcept_ = nullptr;
    mutable FegetexceptFunc fegetexcept_ = nullptr;
    mutable GetaddrinfoCustomFunc getaddrinfoCustom_ = nullptr;
    mutable HilogBaseIsLoggableFunc hilogBaseIsLoggable_ = nullptr;
    mutable HilogBasePrintFunc hilogBasePrint_ = nullptr;
    mutable GwpAsanCollectFunc gwpAsanCollect_ = nullptr;
    mutable GwpAsanRegisterFfrtFunc gwpAsanRegisterFfrt_ = nullptr;
};
#endif // LIBC_FUNCTION_LOADER_H
