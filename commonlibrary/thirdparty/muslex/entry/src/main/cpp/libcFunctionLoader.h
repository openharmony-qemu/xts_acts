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
    using Open2Func = int (*)(const char*, int);
    using QsortRFunc = void (*)(void*, size_t, size_t,
                                int (*)(const void*, const void*, void*), void*);
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
    using Log10FiniteFunc = double (*)(double);
    using Log2fFiniteFunc = float (*)(float);
    using Log2FiniteFunc = double (*)(double);
    using LogFiniteFunc = double (*)(double);
    using IsnanFunc = int (*)(double);
    using MbrlenFunc = size_t (*)(const char*, size_t, mbstate_t*);
    using PrintfChkFunc = int (*)(int, const char*, ...);
    using PthreadKeyCreateFunc = int (*)(pthread_key_t*, void (*)(void*));
    using DFXSetCrashLogConfigFunc = int (*)(uint8_t, uint32_t);
    using LongjmpChkFunc = void (*)(jmp_buf, int);
    using PowfFiniteFunc = float (*)(float, float);
    using PowFiniteFunc = double (*)(double, double);
    using Fcntl64Func = int (*)(int, int, ...);
    using FedisableexceptFunc = int (*)(int);
    using FeenableexceptFunc = int (*)(int);
    using FegetexceptFunc = int (*)(void);
    using MuslVersionFunc = const char* (*)(void);
    using PthreadExtFuncPolicyFunc = int (*)(void);
    using GetaddrinfoCustomFunc = int (*)(const char*, const char*, const struct addrinfo*, struct addrinfo**);
    using HilogBaseIsLoggableFunc = bool (*)(unsigned int, const char*, int);
    using HilogBasePrintFunc = int (*)(int, int, unsigned int, const char*, const char*, ...);
    using GwpAsanCollectFunc = size_t (*)(uint64_t, uintptr_t*, size_t, size_t);
    using FfrtGetStackFn = size_t (*)(size_t*, size_t);
    using GwpAsanRegisterFfrtFunc = void (*)(FfrtGetStackFn);
    using MallocCheckFromPtrFunc = int (*)(void*);
    using MktimeNoenvFunc = time_t (*)(struct tm*);
    using PthreadAttrExtInitFunc = int (*)(pthread_attr_t*);
    using PthreadAttrExtDestroyFunc = int (*)(pthread_attr_t*);
    using PthreadAttrGetaffinityNpFunc = int (*)(pthread_attr_t*, size_t, cpu_set_t*);
    using PthreadAttrSetaffinityNpFunc = int (*)(pthread_attr_t*, size_t, const cpu_set_t*);
    using PthreadAtforkGwpasanFunc = int (*)(void (*)(void), void (*)(void), void (*)(void));
    FdeltChkFunc GetFdeltChk() const { return LazyLoad(fdeltChk_, "__fdelt_chk"); }
    ExplicitBzeroChkFunc GetExplicitBzeroChk() const
    {
        return LazyLoad(explicitBzeroChk_, "__explicit_bzero_chk");
    }
    Open2Func GetOpen2() const { return LazyLoad(open2_, "__open_2"); }
    QsortRFunc GetQsortR() const { return LazyLoad(qsortR_, "qsort_r"); }
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
    Log10FiniteFunc GetLog10Finite() const { return LazyLoad(log10Finite_, "__log10_finite"); }
    IsnanFunc GetIsnan() const { return LazyLoad(isnan_, "__isnan"); }
    MbrlenFunc GetMbrlen() const { return LazyLoad(mbrlen_, "__mbrlen"); }
    PrintfChkFunc GetPrintfChk() const { return LazyLoad(printfChk_, "__printf_chk"); }
    PthreadKeyCreateFunc GetPthreadKeyCreate() const
    {
        return LazyLoad(pthreadKeyCreate_, "__pthread_key_create");
    }
    DFXSetCrashLogConfigFunc GetDFXSetCrashLogConfig() const
    {
        return LazyLoad(dfxSetCrashLogConfig_, "DFX_SetCrashLogConfig");
    }
    Log2fFiniteFunc GetLog2fFinite() const { return LazyLoad(log2fFinite_, "__log2f_finite"); }
    Log2FiniteFunc GetLog2Finite() const { return LazyLoad(log2Finite_, "__log2_finite"); }
    LogFiniteFunc GetLogFinite() const { return LazyLoad(logFinite_, "__log_finite"); }
    LongjmpChkFunc GetLongjmpChk() const { return LazyLoad(longjmpChk_, "__longjmp_chk"); }
    PowfFiniteFunc GetPowfFinite() const { return LazyLoad(powfFinite_, "__powf_finite"); }
    PowFiniteFunc GetPowFinite() const { return LazyLoad(powFinite_, "__pow_finite"); }
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
    MuslVersionFunc GetMuslVersion() const { return LazyLoad(muslVersion_, "get_musl_version"); }
    PthreadExtFuncPolicyFunc GetPthreadExtFuncPolicy() const
    {
        return LazyLoad(pthreadExtFuncPolicy_, "get_pthread_extended_function_policy");
    }
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
    MallocCheckFromPtrFunc GetMallocCheckFromPtr() const
    {
        return LazyLoad(mallocCheckFromPtr_, "malloc_check_from_ptr");
    }
    MktimeNoenvFunc GetMktimeNoenv() const { return LazyLoad(mktimeNoenv_, "mktime_noenv"); }
    PthreadAttrExtInitFunc GetPthreadAttrExtInit() const
    {
        return LazyLoad(pthreadAttrExtInit_, "pthread_attr_extension_init");
    }
    PthreadAttrExtDestroyFunc GetPthreadAttrExtDestroy() const
    {
        return LazyLoad(pthreadAttrExtDestroy_, "pthread_attr_extension_destroy");
    }
    PthreadAttrGetaffinityNpFunc GetPthreadAttrGetaffinityNp() const
    {
        return LazyLoad(pthreadAttrGetaffinityNp_, "pthread_attr_getaffinity_np");
    }
    PthreadAttrSetaffinityNpFunc GetPthreadAttrSetaffinityNp() const
    {
        return LazyLoad(pthreadAttrSetaffinityNp_, "pthread_attr_setaffinity_np");
    }
    PthreadAtforkGwpasanFunc GetPthreadAtforkGwpasan() const
    {
        return LazyLoad(pthreadAtforkGwpasan_, "pthread_atfork_for_gwpasan");
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
    mutable Open2Func open2_ = nullptr;
    mutable QsortRFunc qsortR_ = nullptr;
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
    mutable Log10FiniteFunc log10Finite_ = nullptr;
    mutable IsnanFunc isnan_ = nullptr;
    mutable MbrlenFunc mbrlen_ = nullptr;
    mutable PrintfChkFunc printfChk_ = nullptr;
    mutable PthreadKeyCreateFunc pthreadKeyCreate_ = nullptr;
    mutable DFXSetCrashLogConfigFunc dfxSetCrashLogConfig_ = nullptr;
    mutable Log2fFiniteFunc log2fFinite_ = nullptr;
    mutable Log2FiniteFunc log2Finite_ = nullptr;
    mutable LogFiniteFunc logFinite_ = nullptr;
    mutable LongjmpChkFunc longjmpChk_ = nullptr;
    mutable PowfFiniteFunc powfFinite_ = nullptr;
    mutable PowFiniteFunc powFinite_ = nullptr;
    mutable Fcntl64Func fcntl64_ = nullptr;
    mutable FedisableexceptFunc fedisableexcept_ = nullptr;
    mutable FeenableexceptFunc feenableexcept_ = nullptr;
    mutable FegetexceptFunc fegetexcept_ = nullptr;
    mutable MuslVersionFunc muslVersion_ = nullptr;
    mutable PthreadExtFuncPolicyFunc pthreadExtFuncPolicy_ = nullptr;
    mutable SetPthreadExtFuncPolicyFunc setPthreadExtFuncPolicy_ = nullptr;
    mutable GetaddrinfoCustomFunc getaddrinfoCustom_ = nullptr;
    mutable HilogBaseIsLoggableFunc hilogBaseIsLoggable_ = nullptr;
    mutable HilogBasePrintFunc hilogBasePrint_ = nullptr;
    mutable GwpAsanCollectFunc gwpAsanCollect_ = nullptr;
    mutable GwpAsanRegisterFfrtFunc gwpAsanRegisterFfrt_ = nullptr;
    mutable MallocCheckFromPtrFunc mallocCheckFromPtr_ = nullptr;
    mutable MktimeNoenvFunc mktimeNoenv_ = nullptr;
    mutable PthreadAttrExtInitFunc pthreadAttrExtInit_ = nullptr;
    mutable PthreadAttrExtDestroyFunc pthreadAttrExtDestroy_ = nullptr;
    mutable PthreadAttrGetaffinityNpFunc pthreadAttrGetaffinityNp_ = nullptr;
    mutable PthreadAttrSetaffinityNpFunc pthreadAttrSetaffinityNp_ = nullptr;
    mutable PthreadAtforkGwpasanFunc pthreadAtforkGwpasan_ = nullptr;
};
#endif // LIBC_FUNCTION_LOADER_H
