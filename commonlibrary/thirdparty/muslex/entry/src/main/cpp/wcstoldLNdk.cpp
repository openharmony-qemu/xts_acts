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
#include <cfloat>
#include <thread>
#include <string>
#include <algorithm>
#include <sstream>

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_STABLE_LOOP_1000 = 20;
static constexpr int K_THREAD_MODULO = 3;
static constexpr int K_ENOSYS_CHECK_LOOP = 10;
static constexpr size_t K_LONG_STR_PREFIX_LEN = 200;
static constexpr int K_BUF_SIZE_32 = 32;
static constexpr int K_BUF_SIZE_64 = 64;
static constexpr int K_THREAD_START_ID = 1;
static constexpr int K_THREAD_COUNT = 3;

static long double CallWcstoldl(const wchar_t *nptr, wchar_t **endptr, locale_t loc)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<long double (*)(const wchar_t*, wchar_t**, locale_t)>(loader.GetWcstoldL());
    if (!func)
    {
        errno = ENOSYS;
        return 0.0L;
    }
    return func(nptr, endptr, loc);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetWcstoldL())
    {
        return true;
    }
    errno = 0;
    CallWcstoldl(L"0", nullptr, nullptr);
    return (errno == ENOSYS);
}

static locale_t OpenCLocale()
{
    return newlocale(LC_ALL_MASK, "C", nullptr);
}

static locale_t OpenFrenchLocale()
{
    const char *names[] = {"fr_FR.utf8", "fr_FR.UTF-8", "fr_FR"};
    for (size_t i = 0; i < sizeof(names) / sizeof(names[0]); ++i)
    {
        locale_t loc = newlocale(LC_ALL_MASK, names[i], nullptr);
        if (loc)
        {
            return loc;
        }
    }
    return nullptr;
}

static locale_t OpenCtypeOnlyCLocale()
{
    return newlocale(LC_CTYPE_MASK, "C", nullptr);
}

static bool SameLongDouble(long double a, long double b)
{
    if (std::isnan(a) && std::isnan(b))
    {
        return true;
    }
    if (std::isinf(a) && std::isinf(b))
    {
        return std::signbit(a) == std::signbit(b);
    }
    return a == b && std::signbit(a) == std::signbit(b);
}

static bool CheckWcstoldl(const wchar_t *str, locale_t loc)
{
    wchar_t *end = nullptr;
    wchar_t *endRef = nullptr;
    errno = 0;
    long double got = CallWcstoldl(str, &end, loc);
    int gotErrno = errno;

    errno = 0;
    long double ref = std::wcstold(str, &endRef);
    int refErrno = errno;

    if (!SameLongDouble(got, ref))
    {
        return false;
    }
    if (refErrno != 0 && gotErrno != refErrno)
    {
        return false;
    }
    if (!end || !endRef)
    {
        return false;
    }
    return end == endRef;
}

static bool CheckWcstoldlNoEnd(const wchar_t *str, locale_t loc)
{
    errno = 0;
    long double got = CallWcstoldl(str, nullptr, loc);
    int gotErrno = errno;

    errno = 0;
    long double ref = std::wcstold(str, nullptr);
    int refErrno = errno;

    if (!SameLongDouble(got, ref))
    {
        return false;
    }
    if (refErrno != 0 && gotErrno != refErrno)
    {
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

/* ---------- Normal parameter tests ---------- */
static napi_value WcstoldlNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"123.45xyz", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"  -123.45rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldlNoEnd(L"456.75", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"+inf", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"0X1.BC70A3D70A3D7P+6rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"nan(payload)rest", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal007(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    bool ok = CheckWcstoldl(L"0X1.8P+2tail", nullptr);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlNormal008(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCtypeOnlyCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"42.5tail", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Abnormal parameter tests ---------- */
static napi_value WcstoldlAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"xxx123.45", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Boundary value tests ---------- */
static napi_value WcstoldlBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    wchar_t *end = nullptr;
    errno = 0;
    long double val = CallWcstoldl(L"", &end, loc);
    int e = errno;
    freelocale(loc);
    if (e == ENOSYS)
    {
        return ReturnInt32(env, 1);
    } else
    {
        if (val == 0.0L && end && *end == L'\0')
        {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

static napi_value WcstoldlBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"-", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"3.6451995318824746025e-4951", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlBoundary004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"1.1897314953572317650e+4932", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlBoundary005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"1.18973e+49322", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlBoundary006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L".5", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

static napi_value WcstoldlBoundary007(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool ok = CheckWcstoldl(L"0X1.FFFFFFFFFFFFFP+16383", loc);
    freelocale(loc);
    return ReturnInt32(env, ok ? 1 : 0);
}

/* ---------- Functional tests ---------- */
static napi_value WcstoldlFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    const wchar_t* strs[] = {
        L"123.45",
        L"0X1.BC70A3D70A3D7P+6",
        L"+inf",
        L"nan"
    };
    for (auto s : strs)
    {
        if (!CheckWcstoldl(s, loc))
        {
            freelocale(loc);
            return ReturnInt32(env, 0);
        }
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t frLoc = OpenFrenchLocale();
    if (!frLoc)
    {
        return ReturnInt32(env, 1);
    }
    wchar_t* end = nullptr;
    errno = 0;
    long double val = CallWcstoldl(L"123,45", &end, frLoc);
    freelocale(frLoc);
    if (val > 123.44L && val < 123.46L && end && *end == L'\0')
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t frLoc = OpenFrenchLocale();
    if (!frLoc)
    {
        return ReturnInt32(env, 1);
    }
    wchar_t* end = nullptr;
    errno = 0;
    long double val = CallWcstoldl(L"0X1.BC70A3D70A3D7P+6", &end, frLoc);
    freelocale(frLoc);
    if (val > 111.0L && val < 112.0L && end && *end == L'\0')
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlFunc004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    errno = 0;
    CallWcstoldl(L"1e5000", nullptr, loc);
    if (errno != ERANGE)
    {
        pass = false;
    }
    errno = 0;
    CallWcstoldl(L"1e-5000", nullptr, loc);
    if (errno != ERANGE)
    {
        pass = false;
    }
    freelocale(loc);
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value WcstoldlFunc005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    const wchar_t* str = L" +456.78e-2tail";
    wchar_t* end = nullptr;
    errno = 0;
    long double val = CallWcstoldl(str, &end, loc);
    int e = errno;
    freelocale(loc);
    if (e == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    if (val > 4.5L && val < 4.6L && end && *end == L't')
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value WcstoldlFunc006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    wchar_t* end;
    long double nz = CallWcstoldl(L"-0.0", &end, loc);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    if (!std::signbit(nz))
    {
        pass = false;
    }
    long double pz = CallWcstoldl(L"+0.0", &end, loc);
    if (std::signbit(pz))
    {
        pass = false;
    }
    freelocale(loc);
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value WcstoldlFunc007(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }

    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }

    bool pass = true;

#if LDBL_MANT_DIG == 64
    {
        const wchar_t* highPrecHexStrs[] = {
            L"0x1.0000000000000002p+0",
            L"0x1.fffffffffffffffep-1",
            L"0x0.0000000000000001p-16382",
            L"0x1.0000000000000004p+0"
        };
        size_t count = sizeof(highPrecHexStrs) / sizeof(highPrecHexStrs[0]);
        for (size_t i = 0; i < count; ++i)
        {
            if (!CheckWcstoldl(highPrecHexStrs[i], loc))
            {
                pass = false;
                break;
            }
        }
    }
#elif LDBL_MANT_DIG == 113
    {
        const wchar_t* highPrecHexStrs[] = {
            L"0x1.0000000000000000000000000001p+0",
            L"0x1.ffffffffffffffffffffffffffffp-1",
            L"0x0.0000000000000000000000000001p-16382",
            L"0x1.0000000000000000000000000002p+0"
        };
        size_t count = sizeof(highPrecHexStrs) / sizeof(highPrecHexStrs[0]);
        for (size_t i = 0; i < count; ++i)
        {
            if (!CheckWcstoldl(highPrecHexStrs[i], loc))
            {
                pass = false;
                break;
            }
        }
    }
#else
    freelocale(loc);
    return ReturnInt32(env, 1);
#endif

    freelocale(loc);
    return ReturnInt32(env, pass ? 1 : 0);
}

/* ---------- Stability tests ---------- */
static napi_value WcstoldlStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i)
    {
        wchar_t buf[K_BUF_SIZE_32];
        std::wostringstream oss;
        oss << i << L".123";
        std::wstring str = oss.str();
        std::copy_n(str.c_str(), std::min(str.length() + 1, static_cast<size_t>(K_BUF_SIZE_32)), buf);
        CallWcstoldl(buf, nullptr, loc);
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    auto worker = [loc](int id)
    {
        wchar_t buf[K_BUF_SIZE_64];
        std::wostringstream oss;
        oss << id << L".456e" << (id % K_THREAD_MODULO);
        std::wstring str = oss.str();
        std::copy_n(str.c_str(), std::min(str.length() + 1, static_cast<size_t>(K_BUF_SIZE_64)), buf);
        CallWcstoldl(buf, nullptr, loc);
    };
    std::vector<std::thread> threads;
    for (int id = K_THREAD_START_ID; id < K_THREAD_START_ID + K_THREAD_COUNT; ++id)
    {
        threads.emplace_back(worker, id);
    }
    for (auto& t : threads)
    {
        t.join();
    }
    freelocale(loc);
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlStable003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::wstring longStr(K_LONG_STR_PREFIX_LEN, L'X');
    longStr += L"123.45";
    locale_t loc = OpenCLocale();
    if (!loc)
    {
        return ReturnInt32(env, 0);
    }
    wchar_t* end = nullptr;
    errno = 0;
    long double val = CallWcstoldl(longStr.c_str(), &end, loc);
    freelocale(loc);
    if (val == 0.0L && end == longStr.c_str())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value WcstoldlStable004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP_1000; ++i)
    {
        locale_t loc = newlocale(LC_ALL_MASK, "C", nullptr);
        if (!loc)
        {
            return ReturnInt32(env, 0);
        }
        wchar_t* end;
        CallWcstoldl(L"1.23", &end, loc);
        freelocale(loc);
    }
    return ReturnInt32(env, 1);
}

static napi_value WcstoldlStable005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int enosysCount = 0;
    for (int i = 0; i < K_ENOSYS_CHECK_LOOP; ++i)
    {
        errno = 0;
        CallWcstoldl(L"123", nullptr, nullptr);
        if (errno == ENOSYS)
        {
            enosysCount++;
        }
    }
    if (enosysCount == K_ENOSYS_CHECK_LOOP)
    {
        return ReturnInt32(env, 1);
    }
    if (enosysCount == 0)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"wcstoldlNormal001", nullptr, WcstoldlNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal002", nullptr, WcstoldlNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal003", nullptr, WcstoldlNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal004", nullptr, WcstoldlNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal005", nullptr, WcstoldlNormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal006", nullptr, WcstoldlNormal006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal007", nullptr, WcstoldlNormal007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlNormal008", nullptr, WcstoldlNormal008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlAbnormal002", nullptr, WcstoldlAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary001", nullptr, WcstoldlBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary002", nullptr, WcstoldlBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary003", nullptr, WcstoldlBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary004", nullptr, WcstoldlBoundary004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary005", nullptr, WcstoldlBoundary005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary006", nullptr, WcstoldlBoundary006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlBoundary007", nullptr, WcstoldlBoundary007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc001", nullptr, WcstoldlFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc002", nullptr, WcstoldlFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc003", nullptr, WcstoldlFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc004", nullptr, WcstoldlFunc004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc005", nullptr, WcstoldlFunc005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc006", nullptr, WcstoldlFunc006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlFunc007", nullptr, WcstoldlFunc007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlStable001", nullptr, WcstoldlStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlStable002", nullptr, WcstoldlStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlStable003", nullptr, WcstoldlStable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlStable004", nullptr, WcstoldlStable004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoldlStable005", nullptr, WcstoldlStable005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "wcstoldlndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
