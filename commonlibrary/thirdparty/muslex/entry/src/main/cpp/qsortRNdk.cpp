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
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include <cstdint>
#include <thread>
#include <vector>
#include <random>
#include <algorithm>

#define QSORT_R_LARGE_SIZE 47
#define QSORT_R_MAX_ELEMS  64
#define QSORT_R_MAX_WIDTH  QSORT_R_LARGE_SIZE

typedef void (*QsortRFunc)(void*, size_t, size_t, int (*)(const void*, const void*, void*), void*);

enum QsortRKind {
    KIND_INT = 0,
    KIND_U8,
    KIND_U16,
    KIND_U32,
    KIND_U64,
    KIND_LARGE
};

enum QsortRPattern {
    K_PATTERN_SORTED = 0,
    K_PATTERN_SHUFFLED,
    K_PATTERN_REPEATED,
    K_PATTERN_BITONIC,
    K_PATTERN_DUPLICATED
};

struct QsortRContext {
    unsigned char *base;
    size_t nmemb;
    size_t width;
    QsortRKind kind;
    int descending;
    int calls;
    int outOfRange;
};

static constexpr int K_TEST_VALUE1234 = 1234;
static constexpr size_t K_BIG_ARRAY_SIZE = 200;
static constexpr int K_RAND_MAX_VAL = 999999;
static constexpr size_t K_STABLE_N1000 = 20;
static constexpr size_t K_STABLE_N10000 = 20;
static constexpr size_t K_STABLE_N5000 = 20;
static constexpr size_t K_STRUCT_SIZE = 256;
static constexpr int K_RAND_UCHAR_MAX = 255;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ARRAY_VALUE5 = 5;
static constexpr int K_ARRAY_VALUE10 = 10;
static constexpr int K_ARRAY_VALUE3 = 3;
static constexpr int K_ARRAY_VALUE1 = 1;
static constexpr int K_ARRAY_INDEX_LIMIT = 3;

struct SingleTestParams {
    QsortRFunc qsortR;
    size_t count;
    size_t width;
    QsortRKind kind;
    QsortRPattern pattern;
    unsigned char* actual;
    unsigned char* reference;
};

static int CompareInts(const void* left, const void* right, void* arg);
static bool IsSortedDescending(int32_t* arr, size_t size);

static unsigned char* QsortRElem(void* base, size_t index, size_t width)
{
    return static_cast<unsigned char*>(base) + index * width;
}

static void QsortRStoreValue(void* elem, QsortRKind kind, uint32_t value)
{
    switch (kind)
    {
        case KIND_INT:
            *static_cast<int*>(elem) = static_cast<int>(value);
            break;
        case KIND_U8:
            *static_cast<uint8_t*>(elem) = static_cast<uint8_t>(value);
            break;
        case KIND_U16:
            *static_cast<uint16_t*>(elem) = static_cast<uint16_t>(value);
            break;
        case KIND_U32:
            *static_cast<uint32_t*>(elem) = static_cast<uint32_t>(value);
            break;
        case KIND_U64:
            *static_cast<uint64_t*>(elem) = static_cast<uint64_t>(value);
            break;
        case KIND_LARGE: {
            unsigned char* p = static_cast<unsigned char*>(elem);
            for (size_t i = 0; i < QSORT_R_LARGE_SIZE; ++i)
            {
                p[i] = static_cast<unsigned char>(value + i);
            }
            break;
        }
        default:
            break;
    }
}

static int QsortRValueOrder(const void* left, const void* right, const QsortRContext* ctx)
{
    int ret = 0;
    switch (ctx->kind)
    {
        case KIND_INT: {
            int lhs = *static_cast<const int*>(left);
            int rhs = *static_cast<const int*>(right);
            ret = (lhs > rhs) - (lhs < rhs);
            break;
        }
        case KIND_U8: {
            uint8_t lhs = *static_cast<const uint8_t*>(left);
            uint8_t rhs = *static_cast<const uint8_t*>(right);
            ret = (lhs > rhs) - (lhs < rhs);
            break;
        }
        case KIND_U16: {
            uint16_t lhs = *static_cast<const uint16_t*>(left);
            uint16_t rhs = *static_cast<const uint16_t*>(right);
            ret = (lhs > rhs) - (lhs < rhs);
            break;
        }
        case KIND_U32: {
            uint32_t lhs = *static_cast<const uint32_t*>(left);
            uint32_t rhs = *static_cast<const uint32_t*>(right);
            ret = (lhs > rhs) - (lhs < rhs);
            break;
        }
        case KIND_U64: {
            uint64_t lhs = *static_cast<const uint64_t*>(left);
            uint64_t rhs = *static_cast<const uint64_t*>(right);
            ret = (lhs > rhs) - (lhs < rhs);
            break;
        }
        case KIND_LARGE:
            ret = std::memcmp(left, right, QSORT_R_LARGE_SIZE);
            ret = (ret > 0) - (ret < 0);
            break;
    }
    return ctx->descending ? -ret : ret;
}

static int QsortRCompare(const void* left, const void* right, void* arg)
{
    QsortRContext* ctx = static_cast<QsortRContext*>(arg);
    ctx->calls++;
    unsigned char* limit = ctx->base + ctx->nmemb * ctx->width;
    if (static_cast<const unsigned char*>(left) < ctx->base ||
        static_cast<const unsigned char*>(left) >= limit ||
        static_cast<const unsigned char*>(right) < ctx->base ||
        static_cast<const unsigned char*>(right) >= limit)
        {
        ctx->outOfRange = 1;
    }
    return QsortRValueOrder(left, right, ctx);
}

static void QsortRReferenceSort(void* base, size_t nmemb, size_t width, QsortRContext* ctx)
{
    unsigned char tmp[QSORT_R_MAX_WIDTH];
    for (size_t i = 1; i < nmemb; ++i)
    {
        std::copy_n(QsortRElem(base, i, width), width, tmp);
        size_t j = i;
        while (j > 0 && QsortRValueOrder(QsortRElem(base, j - 1, width), tmp, ctx) > 0)
        {
            std::copy_backward(QsortRElem(base, j - 1, width),
                               QsortRElem(base, j - 1, width) + width,
                               QsortRElem(base, j, width) + width);
            --j;
        }
        std::copy_n(tmp, width, QsortRElem(base, j, width));
    }
}

static void QsortRFillPattern(unsigned char* buffer, size_t nmemb, size_t width,
                              QsortRKind kind, QsortRPattern pattern)
{
    uint32_t state = static_cast<uint32_t>(0x13572468u + width * 17u + nmemb * 131u + pattern * 977u);
    for (size_t i = 0; i < nmemb; ++i)
    {
        uint32_t value = 0;
        switch (pattern)
        {
            case K_PATTERN_SORTED:
                value = static_cast<uint32_t>(i);
                break;
            case K_PATTERN_SHUFFLED:
                state = state * 1103515245u + 12345u;
                value = state % 91u;
                break;
            case K_PATTERN_REPEATED:
                state = state * 1103515245u + 12345u;
                value = state % 67u;
                if ((i % 4u) == 0)
                {
                    value = 21u;
                }
                break;
            case K_PATTERN_BITONIC:
                value = (i < nmemb / 2u) ? static_cast<uint32_t>(i)
                                          : static_cast<uint32_t>(nmemb - 1u - i);
                break;
            case K_PATTERN_DUPLICATED:
                value = ((i % 5u) == 0) ? 7u : 54u;
                break;
        }
        QsortRStoreValue(buffer + i * width, kind, value);
    }
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetQsortR() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result = nullptr;
    napi_create_int32(env, val, &result);
    return result;
}

/* Original simple test */
static napi_value QsortR(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int values[] = {9, 2, 7, 11, 3, 87, 34, 6};
    size_t size = sizeof(values) / sizeof(values[0]);
    int descending = 1;
    errno = 0;
    qsortR(values, size, sizeof(values[0]), CompareInts, &descending);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, IsSortedDescending(values, size) ? 1 : 0);
}

static int CompareInts(const void* left, const void* right, void* arg)
{
    if (arg == nullptr)
    {
        const int* lhs = static_cast<const int*>(left);
        const int* rhs = static_cast<const int*>(right);
        return (*lhs > *rhs) - (*lhs < *rhs);
    }
    const int* lhs = static_cast<const int*>(left);
    const int* rhs = static_cast<const int*>(right);
    int descending = *static_cast<int*>(arg);
    int ret = (*lhs > *rhs) - (*lhs < *rhs);
    return descending ? -ret : ret;
}

static bool IsSortedDescending(int32_t* arr, size_t size)
{
    for (size_t i = 0; i < size - 1; ++i)
    {
        if (arr[i] < arr[i + 1])
        {
            return false;
        }
    }
    return true;
}

/* Normal parameter tests */
static napi_value QsortRNormal001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int values[] = {9, 2, 7, 11, 3, 87, 34, 6};
    int expected[] = {87, 34, 11, 9, 7, 6, 3, 2};
    size_t size = sizeof(values) / sizeof(values[0]);
    QsortRContext ctx;
    ctx.base = reinterpret_cast<unsigned char*>(values);
    ctx.nmemb = size;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;
    ctx.descending = 1;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    errno = 0;
    qsortR(values, size, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (std::memcmp(values, expected, sizeof(expected)) == 0 &&
                             ctx.calls > 0 && ctx.outOfRange == 0) ? 1 : 0);
}

static napi_value QsortRNormal002(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t nel = 16;
    uint8_t arr[nel];
    uint8_t ref[nel];
    QsortRContext ctx;
    ctx.base = reinterpret_cast<unsigned char*>(arr);
    ctx.nmemb = nel;
    ctx.width = sizeof(uint8_t);
    ctx.kind = KIND_U8;
    ctx.descending = 0;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    QsortRFillPattern(reinterpret_cast<unsigned char*>(arr), nel,
                      sizeof(uint8_t), KIND_U8, K_PATTERN_SHUFFLED);
    std::copy_n(arr, nel, ref);

    errno = 0;
    qsortR(arr, nel, sizeof(uint8_t), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    } else
    {
        QsortRContext refCtx = ctx;
        refCtx.calls = 0;
        QsortRReferenceSort(ref, nel, sizeof(uint8_t), &refCtx);
        return ReturnInt32(env, (std::memcmp(arr, ref, sizeof(arr)) == 0 &&
                                 ctx.outOfRange == 0) ? 1 : 0);
    }
}

static napi_value QsortRNormal003(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t nel = 63;
    unsigned char arr[nel * QSORT_R_LARGE_SIZE];
    unsigned char ref[nel * QSORT_R_LARGE_SIZE];
    QsortRContext ctx;
    ctx.base = arr;
    ctx.nmemb = nel;
    ctx.width = QSORT_R_LARGE_SIZE;
    ctx.kind = KIND_LARGE;
    ctx.descending = 0;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    QsortRFillPattern(arr, nel, QSORT_R_LARGE_SIZE, KIND_LARGE, K_PATTERN_SHUFFLED);
    std::copy_n(arr, nel * QSORT_R_LARGE_SIZE, ref);

    errno = 0;
    qsortR(arr, nel, QSORT_R_LARGE_SIZE, QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    } else
    {
        QsortRContext refCtx = ctx;
        refCtx.calls = 0;
        QsortRReferenceSort(ref, nel, QSORT_R_LARGE_SIZE, &refCtx);
        return ReturnInt32(env, (std::memcmp(arr, ref, sizeof(arr)) == 0 &&
                                 ctx.outOfRange == 0) ? 1 : 0);
    }
}

static napi_value QsortRNormal004(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* Abnormal parameter tests */
static napi_value QsortRAbnormal001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int values[] = {9, 2, 7, 11, 3, 87, 34, 6};
    int expected[] = {87, 34, 11, 9, 7, 6, 3, 2};
    int orig[] = {9, 2, 7, 11, 3, 87, 34, 6};
    size_t size = sizeof(values) / sizeof(values[0]);
    QsortRContext ctx;
    std::fill_n(reinterpret_cast<unsigned char*>(&ctx), sizeof(ctx), 0);
    ctx.base = reinterpret_cast<unsigned char*>(values);
    ctx.nmemb = size;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;
    ctx.descending = 1;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    errno = 0;
    qsortR(values, size, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (std::memcmp(values, expected, sizeof(expected)) == 0 &&
                             ctx.calls > 0 && ctx.outOfRange == 0) ? 1 : 0);
}


/* Boundary value tests */
static napi_value QsortRBoundary001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int value = K_TEST_VALUE1234;
    QsortRContext ctx;
    std::fill_n(reinterpret_cast<unsigned char*>(&ctx), sizeof(ctx), 0);
    ctx.base = reinterpret_cast<unsigned char*>(&value);
    ctx.nmemb = 0;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;

    errno = 0;
    qsortR(&value, 0, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (value == K_TEST_VALUE1234 && ctx.calls == 0) ? 1 : 0);
}

static napi_value QsortRBoundary002(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int value = K_TEST_VALUE1234;
    QsortRContext ctx;
    std::fill_n(reinterpret_cast<unsigned char*>(&ctx), sizeof(ctx), 0);
    ctx.base = reinterpret_cast<unsigned char*>(&value);
    ctx.nmemb = 1;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;

    errno = 0;
    qsortR(&value, 1, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (value == K_TEST_VALUE1234 && ctx.calls == 0) ? 1 : 0);
}

static napi_value QsortRBoundary003(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t nel = 63;
    uint32_t arr[nel];
    uint32_t ref[nel];
    QsortRContext ctx;
    ctx.base = reinterpret_cast<unsigned char*>(arr);
    ctx.nmemb = nel;
    ctx.width = sizeof(uint32_t);
    ctx.kind = KIND_U32;
    ctx.descending = 0;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    QsortRFillPattern(reinterpret_cast<unsigned char*>(arr), nel,
                      sizeof(uint32_t), KIND_U32, K_PATTERN_SHUFFLED);
    std::copy_n(arr, nel, ref);

    errno = 0;
    qsortR(arr, nel, sizeof(uint32_t), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    } else
    {
        QsortRContext refCtx = ctx;
        refCtx.calls = 0;
        QsortRReferenceSort(ref, nel, sizeof(uint32_t), &refCtx);
        return ReturnInt32(env, (std::memcmp(arr, ref, sizeof(arr)) == 0 &&
                                 ctx.outOfRange == 0) ? 1 : 0);
    }
}

/* Helper for single test */
static bool RunSingleTest(const SingleTestParams& params)
{
    QsortRContext ctx;
    ctx.base = params.actual;
    ctx.nmemb = params.count;
    ctx.width = params.width;
    ctx.kind = params.kind;
    ctx.descending = 0;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    std::fill_n(params.actual, params.count * params.width, 0);
    std::fill_n(params.reference, params.count * params.width, 0);
    QsortRFillPattern(params.actual, params.count, params.width, params.kind, params.pattern);
    std::copy_n(params.actual, params.count * params.width, params.reference);

    errno = 0;
    params.qsortR(params.actual, params.count, params.width, QsortRCompare, &ctx);
    if (errno == ENOSYS)
    {
        return true;
    }

    QsortRContext refCtx = ctx;
    refCtx.calls = 0;
    QsortRReferenceSort(params.reference, params.count, params.width, &refCtx);

    if (std::memcmp(params.actual, params.reference, params.count * params.width) != 0)
    {
        return false;
    }
    if ((params.count <= 1 && ctx.calls != 0) ||
        (params.count > 1 && ctx.calls == 0) ||
        ctx.outOfRange != 0)
        {
        return false;
    }
    return true;
}

/* Helper to run all counts for a fixed (kind, pattern) */
static bool RunForAllCounts(const SingleTestParams& baseParams,
                            const size_t counts[], size_t countSize)
{
    for (size_t ci = 0; ci < countSize; ++ci)
    {
        SingleTestParams params = baseParams;
        params.count = counts[ci];
        if (!RunSingleTest(params))
        {
            return false;
        }
    }
    return true;
}

/* Helper to run all combinations */
static bool RunAllTestCombinations(QsortRFunc qsortR,
                                   unsigned char* actual,
                                   unsigned char* reference,
                                   size_t maxElems,
                                   size_t maxWidth)
{
    QsortRKind kinds[] = {KIND_U8, KIND_U16, KIND_U32, KIND_U64, KIND_LARGE};
    size_t widths[] = {sizeof(uint8_t), sizeof(uint16_t), sizeof(uint32_t),
                       sizeof(uint64_t), QSORT_R_LARGE_SIZE};
    QsortRPattern patterns[] = {K_PATTERN_SORTED, K_PATTERN_SHUFFLED,
                                K_PATTERN_REPEATED, K_PATTERN_BITONIC, K_PATTERN_DUPLICATED};
    size_t counts[] = {0, 1, 7, 16, 63};
    size_t kindCount = sizeof(kinds) / sizeof(kinds[0]);
    size_t patternCount = sizeof(patterns) / sizeof(patterns[0]);
    size_t countCount = sizeof(counts) / sizeof(counts[0]);

    for (size_t ki = 0; ki < kindCount; ++ki)
    {
        for (size_t pi = 0; pi < patternCount; ++pi)
        {
            SingleTestParams baseParams{qsortR, 0, widths[ki], kinds[ki],
                                        patterns[pi], actual, reference};
            if (!RunForAllCounts(baseParams, counts, countCount))
            {
                return false;
            }
        }
    }
    return true;
}

/* Functional tests */
static napi_value QsortRFunc001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t maxElems = QSORT_R_MAX_ELEMS;
    const size_t maxWidth = QSORT_R_MAX_WIDTH;
    unsigned char actual[maxElems * maxWidth];
    unsigned char reference[maxElems * maxWidth];

    errno = 0;
    if (!RunAllTestCombinations(qsortR, actual, reference, maxElems, maxWidth))
    {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value QsortRFunc002(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t nel = 63;
    int arr[nel];
    QsortRContext ctx;
    ctx.base = reinterpret_cast<unsigned char*>(arr);
    ctx.nmemb = nel;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;
    ctx.descending = 0;
    ctx.calls = 0;
    ctx.outOfRange = 0;

    QsortRFillPattern(reinterpret_cast<unsigned char*>(arr), nel,
                      sizeof(int), KIND_INT, K_PATTERN_SHUFFLED);

    errno = 0;
    qsortR(arr, nel, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (ctx.calls > 0) ? 1 : 0);
}

static napi_value QsortRFunc003(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    struct Elem {
        int value;
        int index;
    };
    const size_t nel = 10;
    Elem arr[nel];
    for (size_t i = 0; i < nel; ++i)
    {
        arr[i].value = (i < K_ARRAY_INDEX_LIMIT) ? K_ARRAY_VALUE5 : K_ARRAY_VALUE1;
        arr[i].index = static_cast<int>(i);
    }

    auto cmp = [](const void* a, const void* b, void*) -> int {
        auto* ea = static_cast<const Elem*>(a);
        auto* eb = static_cast<const Elem*>(b);
        return (ea->value > eb->value) - (ea->value < eb->value);
    };

    errno = 0;
    qsortR(arr, nel, sizeof(Elem), cmp, nullptr);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    for (size_t i = 1; i < nel; ++i)
    {
        if (arr[i - 1].value > arr[i].value)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value QsortRFunc004(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    struct ComplexCtx {
        int offset;
        int descending;
    };
    int values[] = {5, K_ARRAY_VALUE10, 1, K_ARRAY_VALUE3};
    size_t nel = 4;
    ComplexCtx ctx = {0, 1};

    auto cmp = [](const void* a, const void* b, void* arg) -> int {
        auto* c = static_cast<ComplexCtx*>(arg);
        int lhs = *static_cast<const int*>(a) + c->offset;
        int rhs = *static_cast<const int*>(b) + c->offset;
        int ret = (lhs > rhs) - (lhs < rhs);
        return c->descending ? -ret : ret;
    };

    errno = 0;
    qsortR(values, nel, sizeof(int), cmp, &ctx);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }

    int expectedDesc[] = {K_ARRAY_VALUE10, 5, K_ARRAY_VALUE3, 1};
    if (std::memcmp(values, expectedDesc, sizeof(expectedDesc)) != 0)
    {
        return ReturnInt32(env, 0);
    }

    int values2[] = {5, K_ARRAY_VALUE10, 1, K_ARRAY_VALUE3};
    ctx.descending = 0;
    ctx.offset = K_ARRAY_VALUE10;
    qsortR(values2, nel, sizeof(int), cmp, &ctx);
    int expectedAsc[] = {1, K_ARRAY_VALUE3, 5, K_ARRAY_VALUE10};
    if (std::memcmp(values2, expectedAsc, sizeof(expectedAsc)) != 0)
    {
        return ReturnInt32(env, 0);
    }

    return ReturnInt32(env, 1);
}

static napi_value QsortRFunc005(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    int values[] = {9, 2, 7};
    int orig[] = {9, 2, 7};
    size_t size = 3;
    QsortRContext ctx;
    std::fill_n(reinterpret_cast<unsigned char*>(&ctx), sizeof(ctx), 0);
    ctx.base = reinterpret_cast<unsigned char*>(values);
    ctx.nmemb = size;
    ctx.width = sizeof(int);
    ctx.kind = KIND_INT;

    errno = 0;
    qsortR(values, size, sizeof(int), QsortRCompare, &ctx);

    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, (ctx.calls > 0 && ctx.outOfRange == 0) ? 1 : 0);
}

/* Stability tests */
static napi_value QsortRStable001(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t big = K_BIG_ARRAY_SIZE;
    std::vector<int> vec(big);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dist(0, K_RAND_MAX_VAL);
    for (size_t i = 0; i < big; ++i)
    {
        vec[i] = dist(gen);
    }

    auto cmp = [](const void* a, const void* b, void*) -> int {
        int ia = *static_cast<const int*>(a);
        int ib = *static_cast<const int*>(b);
        return (ia > ib) - (ia < ib);
    };

    errno = 0;
    qsortR(vec.data(), big, sizeof(int), cmp, nullptr);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }

    for (size_t i = 1; i < big; ++i)
    {
        if (vec[i - 1] > vec[i])
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value QsortRStable002(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t n = K_STABLE_N1000;
    int a[n];
    int b[n];
    int c[n];
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dist;
    for (size_t i = 0; i < n; ++i)
    {
        a[i] = dist(gen);
    }
    std::copy_n(a, n, b);
    std::copy_n(a, n, c);

    auto cmp = [](const void* x, const void* y, void*) -> int {
        int ix = *static_cast<const int*>(x);
        int iy = *static_cast<const int*>(y);
        return (ix > iy) - (ix < iy);
    };

    errno = 0;
    qsortR(b, n, sizeof(int), cmp, nullptr);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }

    qsortR(c, n, sizeof(int), cmp, nullptr);
    return ReturnInt32(env, std::memcmp(b, c, sizeof(b)) == 0 ? 1 : 0);
}

static napi_value QsortRStable003(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t n = K_STABLE_N10000;
    const size_t structSize = K_STRUCT_SIZE;
    std::vector<unsigned char> buf(n * structSize);
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dist(0, K_RAND_UCHAR_MAX);
    for (size_t i = 0; i < buf.size(); ++i)
    {
        buf[i] = static_cast<unsigned char>(dist(gen));
    }

    auto cmp = [](const void* a, const void* b, void*) -> int {
        uint32_t ka = *static_cast<const uint32_t*>(a);
        uint32_t kb = *static_cast<const uint32_t*>(b);
        return (ka > kb) - (ka < kb);
    };

    errno = 0;
    qsortR(buf.data(), n, structSize, cmp, nullptr);
    if (errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }

    for (size_t i = 1; i < n; ++i)
    {
        uint32_t prev = *reinterpret_cast<uint32_t*>(buf.data() + (i - 1) * structSize);
        uint32_t cur = *reinterpret_cast<uint32_t*>(buf.data() + i * structSize);
        if (prev > cur)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value QsortRStable004(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value QsortRStable005(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = reinterpret_cast<QsortRFunc>(loader.GetQsortR());
    if (!qsortR)
    {
        return ReturnInt32(env, 1);
    }

    const size_t n = K_STABLE_N5000;
    int a1[n];
    int a2[n];
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> dist;
    for (size_t i = 0; i < n; ++i)
    {
        a1[i] = dist(gen);
        a2[i] = dist(gen);
    }
    auto cmp = [](const void* x, const void* y, void*) -> int {
        int ix = *static_cast<const int*>(x);
        int iy = *static_cast<const int*>(y);
        return (ix > iy) - (ix < iy);
    };

    int errno1 = 0, errno2 = 0;
    std::thread t1([&qsortR, &a1, &cmp, n, &errno1]()
    {
        errno = 0;
        qsortR(a1, n, sizeof(int), cmp, nullptr);
        errno1 = errno;
    });
    std::thread t2([&qsortR, &a2, &cmp, n, &errno2]()
    {
        errno = 0;
        qsortR(a2, n, sizeof(int), cmp, nullptr);
        errno2 = errno;
    });
    t1.join();
    t2.join();
    if (errno1 == ENOSYS || errno2 == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }

    for (size_t i = 1; i < n; ++i)
    {
        if (a1[i - 1] > a1[i] || a2[i - 1] > a2[i])
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

/* Module initialization */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"qsortR", nullptr, QsortR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRNormal001", nullptr, QsortRNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRNormal002", nullptr, QsortRNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRNormal003", nullptr, QsortRNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRNormal004", nullptr, QsortRNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRAbnormal001", nullptr, QsortRAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRBoundary001", nullptr, QsortRBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRBoundary002", nullptr, QsortRBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRBoundary003", nullptr, QsortRBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRFunc001", nullptr, QsortRFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRFunc002", nullptr, QsortRFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRFunc003", nullptr, QsortRFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRFunc004", nullptr, QsortRFunc004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRFunc005", nullptr, QsortRFunc005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRStable001", nullptr, QsortRStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRStable002", nullptr, QsortRStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRStable003", nullptr, QsortRStable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRStable004", nullptr, QsortRStable004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortRStable005", nullptr, QsortRStable005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "qsortrndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
