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

#include "napi/native_api.h"
#include "libcFunctionLoader.h"
#include <cwchar>
#include <clocale>
#include <cerrno>
#include <cmath>
#include <thread>
#include <string>
#include <algorithm>
#include <sstream>

static constexpr int kStableLoop10000 = 20;
static constexpr int kStableLoop1000 = 20;
static constexpr int kThreadModulo = 3;
static constexpr int kEnosysCheckLoop = 10;
static constexpr size_t kLongStrPrefixLen = 200;
static constexpr int kBufSize32 = 32;
static constexpr int kBufSize64 = 64;
static constexpr int kThreadStartId = 1;
static constexpr int kThreadCount = 3;

static float CallWcstofl(const wchar_t *nptr, wchar_t **endptr, locale_t loc)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<float (*)(const wchar_t*, wchar_t**, locale_t)>(loader.GetWcstofL());
    if (!func) {
        errno = ENOSYS;
        return 0.0f;
    }
    return func(nptr, endptr, loc);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetWcstofL()) {
        return true;
    }
    errno = 0;
    CallWcstofl(L"0", nullptr, nullptr);
    return (errno == ENOSYS);
}

static locale_t OpenCLocale()
{
    return newlocale(LC_ALL_MASK, "C", nullptr);
}

static locale_t OpenFrenchLocale()
{
    const char *names[] = {"fr_FR.utf8", "fr_FR.UTF-8", "fr_FR"};
    for (size_t i = 0; i < sizeof(names) / sizeof(names[0]); ++i) {
        locale_t loc = newlocale(LC_ALL_MASK, names[i], nullptr);
        if (loc) {
            return loc;
        }
    }
    return nullptr;
}

static locale_t OpenCtypeOnlyCLocale()
{
    return newlocale(LC_CTYPE_MASK, "C", nullptr);
}

static bool SameFloat(float a, float b)
{
    if (std::isnan(a) && std::isnan(b)) {
        return true;
    }
    if (std::isinf(a) && std::isinf(b)) {
        return std::signbit(a) == std::signbit(b);
    }
    return a == b && std::signbit(a) == std::signbit(b);
}

static bool CheckWcstofl(const wchar_t *str, locale_t loc)
{
    wchar_t *end = nullptr;
    wchar_t *endRef = nullptr;
    errno = 0;
    float got = CallWcstofl(str, &end, loc);
    int gotErrno = errno;

    errno = 0;
    float ref = std::wcstof(str, &endRef);
    int refErrno = errno;

    if (!SameFloat(got, ref)) {
        return false;
    }
    if (refErrno != 0 && gotErrno != refErrno) {
        return false;
    }
    if (!end || !endRef) {
        return false;
    }
    return end == endRef;
}

static bool CheckWcstoflNoEnd(const wchar_t *str, locale_t loc)
{
    errno = 0;
    float got = CallWcstofl(str, nullptr, loc);
    int gotErrno = errno;

    errno = 0;
    float ref = std::wcstof(str, nullptr);
    int refErrno = errno;

    if (!SameFloat(got, ref)) {
        return false;
    }
    if (refErrno != 0 && gotErrno != refErrno) {
        return false;
    }
    return true;
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ----- Original simple test ----- */
static napi_value Wcstofl(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    wchar_t *end = nullptr;
    errno = 0;
    float val = CallWcstofl(L"123.45xyz", &end, loc);
    int e = errno;
    freelocale(loc);

    if (e == ENOSYS) {
        if (val == 0.0f && end == nullptr) {
            return ReturnInt32(env, 0);
        }
        return ReturnInt32(env, 0);
    } else {
        if (val == 123.45f && end && *end == L'x') {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

/* ---------- Normal parameter tests ---------- */
static napi_value WcstoflNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"123.45xyz", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"  -123.45rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoflNoEnd(L"456.75", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"+inf", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"0X1.BC70A3D70A3D7P+6rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"nan(payload)rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal007(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"0X1.8P+2tail", nullptr);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflNormal008(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCtypeOnlyCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"42.5tail", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Abnormal parameter tests ---------- */
static napi_value WcstoflAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    wchar_t *end = nullptr;
    errno = 0;
    float val = CallWcstofl(L"123.45", &end, nullptr);
    int e = errno;
    if (e == ENOSYS) {
        if (val == 0.0f && end == nullptr) {
            return ReturnInt32(env, 0);
        }
        return ReturnInt32(env, 0);
    } else {
        if (val == 123.45f && end && *end == L'\0') {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

static napi_value WcstoflAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"xxx123.45", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Boundary value tests ---------- */
static napi_value WcstoflBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    wchar_t *end = nullptr;
    errno = 0;
    float val = CallWcstofl(L"", &end, loc);
    int e = errno;
    freelocale(loc);
    if (e == ENOSYS) {
        if (val == 0.0f && end == nullptr) {
            return ReturnInt32(env, 0);
        }
        return ReturnInt32(env, 0);
    } else {
        if (val == 0.0f && end && *end == L'\0') {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

static napi_value WcstoflBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"-", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"1.401298464324817e-45", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflBoundary004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"3.4028234663852886e+38", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflBoundary005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"1.18973e+4932", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflBoundary006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L".5", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoflBoundary007(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstofl(L"0X1.FFFFFFFFFFFFFP+127", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Functional tests ---------- */
static napi_value WcstoflFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    const wchar_t* strs[] = {
        L"123.45",
        L"0X1.BC70A3D70A3D7P+6",
        L"+inf",
        L"nan"
    };
    for (auto s : strs) {
        if (!CheckWcstofl(s, loc)) {
            freelocale(loc);
            return ReturnInt32(env, 0);
        }
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoflFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t frLoc = OpenFrenchLocale();
    if (!frLoc) {
        return ReturnInt32(env, 1);
    }
    wchar_t* end = nullptr;
    errno = 0;
    float val = CallWcstofl(L"123,45", &end, frLoc);
    freelocale(frLoc);
    if (val > 123.44f && val < 123.46f && end && *end == L'\0') {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoflFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t frLoc = OpenFrenchLocale();
    if (!frLoc) {
        return ReturnInt32(env, 1);
    }
    wchar_t* end = nullptr;
    errno = 0;
    float val = CallWcstofl(L"0X1.BC70A3D70A3D7P+6", &end, frLoc);
    freelocale(frLoc);
    if (val > 111.0f && val < 112.0f && end && *end == L'\0') {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoflFunc004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    errno = 0;
    CallWcstofl(L"1e+50", nullptr, loc);
    if (errno != ERANGE) {
        pass = false;
    }
    errno = 0;
    CallWcstofl(L"1e-50", nullptr, loc);
    if (errno != ERANGE) {
        pass = false;
    }
    freelocale(loc);
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value WcstoflFunc005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    const wchar_t* str = L" +456.78e-2tail";
    wchar_t* end = nullptr;
    errno = 0;
    float val = CallWcstofl(str, &end, loc);
    int e = errno;
    freelocale(loc);
    if (e == ENOSYS) {
        return ReturnInt32(env, 0);
    }
    if (val > 4.5f && val < 4.6f && end && *end == L't') {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value WcstoflFunc006(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    wchar_t* end;
    float nz = CallWcstofl(L"-0.0", &end, loc);
    if (errno == ENOSYS) {
        freelocale(loc);
        return ReturnInt32(env, 0);
    }
    if (!std::signbit(nz)) {
        pass = false;
    }
    float pz = CallWcstofl(L"+0.0", &end, loc);
    if (std::signbit(pz)) {
        pass = false;
    }
    freelocale(loc);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Stability tests ---------- */
static napi_value WcstoflStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    for (int i = 0; i < kStableLoop10000; ++i) {
        wchar_t buf[kBufSize32];
        std::wostringstream oss;
        oss << i << L".123";
        std::wstring str = oss.str();
        std::copy_n(str.c_str(), std::min(str.length() + 1, static_cast<size_t>(kBufSize32)), buf);
        CallWcstofl(buf, nullptr, loc);
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoflStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    auto worker = [loc](int id) {
        wchar_t buf[kBufSize64];
        std::wostringstream oss;
        oss << id << L".456e" << (id % kThreadModulo);
        std::wstring str = oss.str();
        std::copy_n(str.c_str(), std::min(str.length() + 1, static_cast<size_t>(kBufSize64)), buf);
        CallWcstofl(buf, nullptr, loc);
    };
    std::vector<std::thread> threads;
    for (int id = kThreadStartId; id < kThreadStartId + kThreadCount; ++id) {
        threads.emplace_back(worker, id);
    }
    for (auto& t : threads) {
        t.join();
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoflStable003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::wstring longStr(kLongStrPrefixLen, L'X');
    longStr += L"123.45";
    locale_t loc = OpenCLocale();
    if (!loc) {
        return ReturnInt32(env, 0);
    }
    wchar_t* end = nullptr;
    errno = 0;
    float val = CallWcstofl(longStr.c_str(), &end, loc);
    freelocale(loc);
    if (val == 0.0f && end == longStr.c_str()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value WcstoflStable004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    for (int i = 0; i < kStableLoop1000; ++i) {
        locale_t loc = newlocale(LC_ALL_MASK, "C", nullptr);
        if (!loc) {
            return ReturnInt32(env, 0);
        }
        wchar_t* end;
        CallWcstofl(L"1.23", &end, loc);
        freelocale(loc);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoflStable005(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int enosysCount = 0;
    for (int i = 0; i < kEnosysCheckLoop; ++i) {
        errno = 0;
        CallWcstofl(L"123", nullptr, nullptr);
        if (errno == ENOSYS) {
            enosysCount++;
        }
    }
    if (enosysCount == kEnosysCheckLoop) {
        return ReturnInt32(env, 0);
    }
    if (enosysCount == 0) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"wcstofl", nullptr, Wcstofl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal001", nullptr, WcstoflNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal002", nullptr, WcstoflNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal003", nullptr, WcstoflNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal004", nullptr, WcstoflNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal005", nullptr, WcstoflNormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal006", nullptr, WcstoflNormal006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal007", nullptr, WcstoflNormal007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflNormal008", nullptr, WcstoflNormal008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflAbnormal001", nullptr, WcstoflAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflAbnormal002", nullptr, WcstoflAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary001", nullptr, WcstoflBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary002", nullptr, WcstoflBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary003", nullptr, WcstoflBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary004", nullptr, WcstoflBoundary004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary005", nullptr, WcstoflBoundary005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary006", nullptr, WcstoflBoundary006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflBoundary007", nullptr, WcstoflBoundary007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc001", nullptr, WcstoflFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc002", nullptr, WcstoflFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc003", nullptr, WcstoflFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc004", nullptr, WcstoflFunc004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc005", nullptr, WcstoflFunc005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflFunc006", nullptr, WcstoflFunc006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflStable001", nullptr, WcstoflStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflStable002", nullptr, WcstoflStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflStable003", nullptr, WcstoflStable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflStable004", nullptr, WcstoflStable004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoflStable005", nullptr, WcstoflStable005, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "wcstoflndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
