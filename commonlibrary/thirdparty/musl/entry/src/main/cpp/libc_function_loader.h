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
#include <cstdio>
#include <clocale>

class LibcFunctionLoader {
public:
    static LibcFunctionLoader& GetInstance()
    {
        static LibcFunctionLoader instance;
        return instance;
    }

    using WcstofLFunc = float (*)(const wchar_t*, wchar_t**, locale_t);
    using FdeltChkFunc = long int (*)(long int);
    using ExplicitBzeroChkFunc = void (*)(void*, size_t, size_t);
    using WcstoldLFunc = long double (*)(const wchar_t*, wchar_t**, locale_t);
    using Open2Func = int (*)(const char*, int);
    using QsortRFunc = void (*)(void*, size_t, size_t, int (*)(const void*, const void*, void*), void*);

    WcstofLFunc GetWcstofL() const { return wcstofL_; }
    FdeltChkFunc GetFdeltChk() const { return fdeltChk_; }
    ExplicitBzeroChkFunc GetExplicitBzeroChk() const { return explicitBzeroChk_; }
    WcstoldLFunc GetWcstoldL() const { return wcstoldL_; }
    Open2Func GetOpen2() const { return open2_; }
    QsortRFunc GetQsortR() const { return qsortR_; }

private:
    LibcFunctionLoader()
        : wcstofL_(nullptr),
          fdeltChk_(nullptr),
          explicitBzeroChk_(nullptr),
          wcstoldL_(nullptr),
          open2_(nullptr),
          qsortR_(nullptr) {
        auto loadSymbol = [](const char* name) -> void* {
            dlerror();
            void* sym = dlsym(RTLD_DEFAULT, name);
            const char* err = dlerror();
            if (err != nullptr) {
                fprintf(stderr, "dlsym error for %s: %s\n", name, err);
            }
            return sym;
        };

        wcstofL_ = reinterpret_cast<WcstofLFunc>(loadSymbol("wcstof_l"));
        fdeltChk_ = reinterpret_cast<FdeltChkFunc>(loadSymbol("__fdelt_chk"));
        explicitBzeroChk_ = reinterpret_cast<ExplicitBzeroChkFunc>(loadSymbol("__explicit_bzero_chk"));
        wcstoldL_ = reinterpret_cast<WcstoldLFunc>(loadSymbol("wcstold_l"));
        open2_ = reinterpret_cast<Open2Func>(loadSymbol("__open_2"));
        qsortR_ = reinterpret_cast<QsortRFunc>(loadSymbol("qsort_r"));
    }

    ~LibcFunctionLoader() = default;

    LibcFunctionLoader(const LibcFunctionLoader&) = delete;
    LibcFunctionLoader& operator=(const LibcFunctionLoader&) = delete;

    WcstofLFunc wcstofL_;
    FdeltChkFunc fdeltChk_;
    ExplicitBzeroChkFunc explicitBzeroChk_;
    WcstoldLFunc wcstoldL_;
    Open2Func open2_;
    QsortRFunc qsortR_;
};

#endif // LIBC_FUNCTION_LOADER_H