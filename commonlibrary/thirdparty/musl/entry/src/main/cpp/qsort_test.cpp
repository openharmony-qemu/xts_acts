/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <string>
#include <pthread.h>
#include <sys/wait.h>
#include <unistd.h>

#define QSORT_NO_ERR 0
#define QSORT_FAIL (-1)
#define QSORT_ELEM_TWO 2
#define QSORT_ELEM_THREE 3
#define QSORT_ELEM_FOUR 4
#define QSORT_ELEM_FIVE 5
#define QSORT_ELEM_SEVEN 7
#define QSORT_ELEM_THIRTEEN 13
#define QSORT_ELEM_TEN 10
#define QSORT_ELEM_TWENTY 20
#define QSORT_ELEM_HUNDRED 100
#define QSORT_ELEM_THOUSAND 1000
#define QSORT_SCALE_10K 10000
#define QSORT_SCALE_50K 50000
#define QSORT_SCALE_100K 100000
#define QSORT_RAND_MOD 20
#define QSORT_RAND_SEED_A 42
#define QSORT_RAND_SEED_B 123
#define QSORT_SWAP_COUNT 5
#define QSORT_PAD_256 252
#define QSORT_PAD_257 253
#define QSORT_TOOTH_MIN 2
#define QSORT_SUM_MAX 8
#define QSORT_SUM_MIN 3
#define QSORT_ARR_VAL_1 1
#define QSORT_ARR_VAL_2 2
#define QSORT_ARR_VAL_5 5
#define QSORT_ARR_VAL_42 42
#define QSORT_RAND_MULTIPLIER 1103515245u
#define QSORT_RAND_INCREMENT 12345u
#define QSORT_RAND_DIVISOR 65536
#define QSORT_RAND_MODULUS 32768

static const int LEONARDO[] = {
    1, 1, 3, 5, 9, 15, 25, 41, 67, 109, 177, 287, 465, 753,
    1219, 1973, 3193, 5167, 8361, 13529, 21891, 35421
};
static const int LEO_COUNT = static_cast<int>(sizeof(LEONARDO) / sizeof(LEONARDO[0]));

static int QsortCmpInt(const void *a, const void *b)
{
    return *static_cast<const int *>(a) - *static_cast<const int *>(b);
}

static int QsortCmpChar(const void *a, const void *b)
{
    return *static_cast<const char *>(a) - *static_cast<const char *>(b);
}

static int QsortCmpLong(const void *a, const void *b)
{
    const long *la = static_cast<const long *>(a);
    const long *lb = static_cast<const long *>(b);
    return static_cast<int>((*la > *lb) - (*la < *lb));
}

static int QsortCmpDouble(const void *a, const void *b)
{
    const double *da = static_cast<const double *>(a);
    const double *db = static_cast<const double *>(b);
    return static_cast<int>((*da > *db) - (*da < *db));
}

static int QsortCmpUint64(const void *a, const void *b)
{
    const uint64_t *ua = static_cast<const uint64_t *>(a);
    const uint64_t *ub = static_cast<const uint64_t *>(b);
    return *ua < *ub ? -1 : (*ua != *ub ? 1 : 0);
}

static int QsortCmpShort(const void *a, const void *b)
{
    return *static_cast<const short *>(a) - *static_cast<const short *>(b);
}

static int QsortCmpStr(const void *a, const void *b)
{
    return strcmp(*static_cast<const char *const *>(a), *static_cast<const char *const *>(b));
}

struct QsortItem {
    int val;
    char pad[12];
};

struct QsortItem256 {
    int val;
    char pad[QSORT_PAD_256];
};

struct QsortItem257 {
    int val;
    char pad[QSORT_PAD_257];
};

static int QsortCmpStruct(const void *a, const void *b)
{
    const QsortItem *sa = static_cast<const QsortItem *>(a);
    const QsortItem *sb = static_cast<const QsortItem *>(b);
    return sa->val - sb->val;
}

static int QsortCmpItem256(const void *a, const void *b)
{
    const QsortItem256 *sa = static_cast<const QsortItem256 *>(a);
    const QsortItem256 *sb = static_cast<const QsortItem256 *>(b);
    return sa->val - sb->val;
}

static int QsortCmpItem257(const void *a, const void *b)
{
    const QsortItem257 *sa = static_cast<const QsortItem257 *>(a);
    const QsortItem257 *sb = static_cast<const QsortItem257 *>(b);
    return sa->val - sb->val;
}

static uint32_t g_qsortRandState = 0;

static void QsortSrand(uint32_t seed)
{
    g_qsortRandState = seed;
}

static int QsortRand()
{
    g_qsortRandState = g_qsortRandState * QSORT_RAND_MULTIPLIER + QSORT_RAND_INCREMENT;
    return static_cast<int>((g_qsortRandState / QSORT_RAND_DIVISOR) % QSORT_RAND_MODULUS);
}

static int QsortVerifyAsc(const int *arr, int len, int start)
{
    for (int i = 0; i < len; i++) {
        if (arr[i] != start + i) {
            return QSORT_FAIL;
        }
    }
    return QSORT_NO_ERR;
}

static napi_value QsortMakeResult(napi_env env, int ret)
{
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value QsortNormalInt(napi_env env, napi_callback_info)
{
    int arr[] = {879045, 394, 99405644, 33434, 232323, 4334, 5454,
                 343, 45545, 454, 324, 22, 34344, 233, 45345, 343,
                 848405, 3434, 3434344, 3535, 93994, 2230404, 4334};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(int), QsortCmpInt);
    for (int i = 1; i < len; i++) {
        if (arr[i - 1] > arr[i]) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortNormalString(napi_env env, napi_callback_info)
{
    const char *arr[] = {"Bob", "Alice", "John", "Ceres", "Helga", "Drepper",
                         "Emeralda", "Zoran", "Momo", "Frank", "Pema", "Xavier"};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(const char *), QsortCmpStr);
    for (int i = 1; i < len; i++) {
        if (strcmp(arr[i - 1], arr[i]) > 0) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortNormalChar(napi_env env, napi_callback_info)
{
    char p[] = "987654321";
    qsort(p, sizeof(p) - 1, 1, QsortCmpChar);
    if (memcmp(p, "123456789", sizeof(p)) != 0) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortNormalDouble(napi_env env, napi_callback_info)
{
    double arr[] = {9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(double), QsortCmpDouble);
    for (int i = 0; i < len; i++) {
        if (arr[i] != static_cast<double>(i + 1)) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortNormalUint64(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_THOUSAND + QSORT_ELEM_TWENTY + QSORT_ELEM_FOUR;
    uint64_t *arr = static_cast<uint64_t *>(malloc(n * sizeof(uint64_t)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    uint64_t *sorted = static_cast<uint64_t *>(malloc(n * sizeof(uint64_t)));
    if (sorted == nullptr) {
        free(arr);
        return QsortMakeResult(env, QSORT_FAIL);
    }
    uint64_t r = 0;
    QsortSrand(QSORT_RAND_SEED_A);
    for (int i = 0; i < n; i++) {
        r += static_cast<uint64_t>(QsortRand() % QSORT_RAND_MOD);
        arr[i] = r;
    }
    for (int i = 0; i < n; i++) {
        sorted[i] = arr[i];
    }
    for (int i = n - 1; i > 0; i--) {
        int j = QsortRand() % (i + 1);
        uint64_t tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
    qsort(arr, n, sizeof(uint64_t), QsortCmpUint64);
    int ret = (memcmp(arr, sorted, n * sizeof(uint64_t)) == 0) ? QSORT_NO_ERR : QSORT_FAIL;
    free(arr);
    free(sorted);
    return QsortMakeResult(env, ret);
}

static napi_value QsortNormalLong(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_HUNDRED + QSORT_ELEM_TEN - QSORT_ELEM_FIVE;
    long *arr = static_cast<long *>(malloc(n * sizeof(long)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = n - i;
    }
    qsort(arr, n, sizeof(long), QsortCmpLong);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i] != i + 1) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortNormalStruct(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_TWENTY;
    QsortItem *arr = static_cast<QsortItem *>(malloc(n * sizeof(QsortItem)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i].val = n - i;
    }
    qsort(arr, n, sizeof(QsortItem), QsortCmpStruct);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i].val != i + 1) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortBoundaryEmpty(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_42};
    qsort(arr, 0, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, arr[0] == QSORT_ARR_VAL_42 ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortBoundarySingle(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_42};
    qsort(arr, 1, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, arr[0] == QSORT_ARR_VAL_42 ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortBoundaryTwoSorted(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_1, QSORT_ARR_VAL_2};
    qsort(arr, QSORT_ELEM_TWO, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, (arr[0] == QSORT_ARR_VAL_1 && arr[1] == QSORT_ARR_VAL_2)
        ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortBoundaryTwoReverse(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_2, QSORT_ARR_VAL_1};
    qsort(arr, QSORT_ELEM_TWO, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, (arr[0] == QSORT_ARR_VAL_1 && arr[1] == QSORT_ARR_VAL_2)
        ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortBoundaryTwoEqual(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_1, QSORT_ARR_VAL_1};
    qsort(arr, QSORT_ELEM_TWO, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, (arr[0] == QSORT_ARR_VAL_1 && arr[1] == QSORT_ARR_VAL_1)
        ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortBoundaryWidthOne(napi_env env, napi_callback_info)
{
    char arr[] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, 1, QsortCmpChar);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < len; i++) {
        if (arr[i] != static_cast<char>(i + 1)) {
            ret = QSORT_FAIL;
            break;
        }
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortBoundaryWidthZero(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_1, QSORT_ARR_VAL_2, QSORT_ELEM_THREE, QSORT_ELEM_FOUR, QSORT_ARR_VAL_5};
    qsort(arr, QSORT_ARR_VAL_5, 0, QsortCmpInt);
    return QsortMakeResult(env, arr[0] == QSORT_ARR_VAL_1 ? QSORT_NO_ERR : QSORT_FAIL);
}

static napi_value QsortPatternSorted(napi_env env, napi_callback_info)
{
    const int n = 255;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = i;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 0);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternReverse(napi_env env, napi_callback_info)
{
    const int n = 255;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = n - i;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 1);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternAllDup(napi_env env, napi_callback_info)
{
    int arr[] = {QSORT_ARR_VAL_5, QSORT_ARR_VAL_5, QSORT_ARR_VAL_5, QSORT_ARR_VAL_5,
                 QSORT_ARR_VAL_5, QSORT_ARR_VAL_5, QSORT_ARR_VAL_5, QSORT_ARR_VAL_5,
                 QSORT_ARR_VAL_5, QSORT_ARR_VAL_5};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(int), QsortCmpInt);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < len; i++) {
        if (arr[i] != QSORT_ARR_VAL_5) {
            ret = QSORT_FAIL;
            break;
        }
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternPartialDup(napi_env env, napi_callback_info)
{
    int arr[] = {5, 2, 2, 5, 5, 2, 5, 2, 5, 2};
    int expected[] = {2, 2, 2, 2, 2, 5, 5, 5, 5, 5};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(int), QsortCmpInt);
    int ret = (memcmp(arr, expected, sizeof(arr)) == 0) ? QSORT_NO_ERR : QSORT_FAIL;
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternSawtooth(napi_env env, napi_callback_info)
{
    const int n = 109;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    int tooth = n / QSORT_ELEM_FOUR;
    if (tooth < QSORT_TOOTH_MIN) {
        tooth = QSORT_TOOTH_MIN;
    }
    for (int i = 0; i < n; i++) {
        int group = i / tooth;
        int pos = i % tooth;
        int startVal = group * tooth;
        int endVal = (startVal + tooth > n) ? n : startVal + tooth;
        arr[i] = startVal + (endVal - startVal - 1 - pos);
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 0);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternCyclic(napi_env env, napi_callback_info)
{
    const int n = 109;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    int shift = n / QSORT_ELEM_THREE;
    for (int i = 0; i < n; i++) {
        arr[i] = (i + shift) % n;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 0);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternNearSorted(napi_env env, napi_callback_info)
{
    const int n = 255;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = i;
    }
    for (int k = 0; k < QSORT_SWAP_COUNT; k++) {
        int idx1 = (k * QSORT_ELEM_SEVEN) % n;
        int idx2 = (k * QSORT_ELEM_THIRTEEN + QSORT_ARR_VAL_5) % n;
        int tmp = arr[idx1];
        arr[idx1] = arr[idx2];
        arr[idx2] = tmp;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 0);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortPatternBitonic(napi_env env, napi_callback_info)
{
    int arr[] = {1, 3, 5, 7, 6, 4, 2, 0};
    int len = static_cast<int>(sizeof(arr) / sizeof(arr[0]));
    qsort(arr, len, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, QsortVerifyAsc(arr, len, 0));
}

static int QsortRunLeoTest(int reverse)
{
    for (int j = 0; j < LEO_COUNT; j++) {
        int len = LEONARDO[j];
        int *arr = static_cast<int *>(malloc(len * sizeof(int)));
        if (arr == nullptr) {
            return QSORT_FAIL;
        }
        for (int i = 0; i < len; i++) {
            arr[i] = reverse ? (len - i) : i;
        }
        qsort(arr, len, sizeof(int), QsortCmpInt);
        for (int i = 0; i < len; i++) {
            int want = reverse ? (i + 1) : i;
            if (arr[i] != want) {
                free(arr);
                return QSORT_FAIL;
            }
        }
        free(arr);
    }
    return QSORT_NO_ERR;
}

static napi_value QsortCveLeoReverse(napi_env env, napi_callback_info)
{
    return QsortMakeResult(env, QsortRunLeoTest(1));
}

static napi_value QsortCveLeoSorted(napi_env env, napi_callback_info)
{
    return QsortMakeResult(env, QsortRunLeoTest(0));
}

static napi_value QsortCvePow2Minus1(napi_env env, napi_callback_info)
{
    int sizes[] = {3, 7, 15, 31, 63, 127, 255, 511, 1023, 2047, 4095, 8191};
    int numSizes = static_cast<int>(sizeof(sizes) / sizeof(sizes[0]));
    for (int j = 0; j < numSizes; j++) {
        int len = sizes[j];
        int *arr = static_cast<int *>(malloc(len * sizeof(int)));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(int), QsortCmpInt);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortCveLeoBoundary(napi_env env, napi_callback_info)
{
    int bounds[] = {
        7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 23, 24, 25, 26, 27,
        39, 40, 41, 42, 43, 65, 66, 67, 68, 69, 107, 108, 109, 110, 111
    };
    int numBounds = static_cast<int>(sizeof(bounds) / sizeof(bounds[0]));
    for (int j = 0; j < numBounds; j++) {
        int len = bounds[j];
        int *arr = static_cast<int *>(malloc(len * sizeof(int)));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(int), QsortCmpInt);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortCveLeoSum(napi_env env, napi_callback_info)
{
    int total = 0;
    int sumSizes[QSORT_SUM_MAX];
    int numSums = 0;
    for (int j = 0; j < LEO_COUNT && numSums < QSORT_SUM_MAX; j++) {
        total += LEONARDO[j];
        if (total >= QSORT_SUM_MIN) {
            sumSizes[numSums] = total;
            numSums++;
        }
    }
    for (int j = 0; j < numSums; j++) {
        int len = sumSizes[j];
        int *arr = static_cast<int *>(malloc(len * sizeof(int)));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(int), QsortCmpInt);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortCveLeoChar(napi_env env, napi_callback_info)
{
    int leoSizes[] = {1, 3, 5, 9, 15, 25, 41, 67, 109};
    int numSizes = static_cast<int>(sizeof(leoSizes) / sizeof(leoSizes[0]));
    for (int j = 0; j < numSizes; j++) {
        int len = leoSizes[j];
        char *arr = static_cast<char *>(malloc(len));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = static_cast<char>(len - i);
        }
        qsort(arr, len, 1, QsortCmpChar);
        for (int i = 0; i < len; i++) {
            if (arr[i] != static_cast<char>(i + 1)) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortCveLeoLong(napi_env env, napi_callback_info)
{
    int leoSizes[] = {1, 3, 5, 9, 15, 25, 41, 67, 109, 177, 287, 465, 753,
                      1219, 1973, 3193, 5167, 8361};
    int numSizes = static_cast<int>(sizeof(leoSizes) / sizeof(leoSizes[0]));
    for (int j = 0; j < numSizes; j++) {
        int len = leoSizes[j];
        long *arr = static_cast<long *>(malloc(len * sizeof(long)));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(long), QsortCmpLong);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortCveLeoDouble(napi_env env, napi_callback_info)
{
    int leoSizes[] = {1, 3, 5, 9, 15, 25, 41, 67, 109, 177, 287, 465, 753, 1219, 1973};
    int numSizes = static_cast<int>(sizeof(leoSizes) / sizeof(leoSizes[0]));
    for (int j = 0; j < numSizes; j++) {
        int len = leoSizes[j];
        double *arr = static_cast<double *>(malloc(len * sizeof(double)));
        if (arr == nullptr) {
            return QsortMakeResult(env, QSORT_FAIL);
        }
        for (int i = 0; i < len; i++) {
            arr[i] = static_cast<double>(len - i);
        }
        qsort(arr, len, sizeof(double), QsortCmpDouble);
        for (int i = 0; i < len; i++) {
            if (arr[i] != static_cast<double>(i + 1)) {
                free(arr);
                return QsortMakeResult(env, QSORT_FAIL);
            }
        }
        free(arr);
    }
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortScale10K(napi_env env, napi_callback_info)
{
    const int n = QSORT_SCALE_10K;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = n - i;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 1);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortScale50K(napi_env env, napi_callback_info)
{
    const int n = QSORT_SCALE_50K;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = n - i;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 1);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortScale100K(napi_env env, napi_callback_info)
{
    const int n = QSORT_SCALE_100K;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = n - i;
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QsortVerifyAsc(arr, n, 1);
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortScale10KRand(napi_env env, napi_callback_info)
{
    const int n = QSORT_SCALE_10K;
    int *arr = static_cast<int *>(malloc(n * sizeof(int)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    QsortSrand(QSORT_RAND_SEED_B);
    for (int i = 0; i < n; i++) {
        arr[i] = QsortRand();
    }
    qsort(arr, n, sizeof(int), QsortCmpInt);
    int ret = QSORT_NO_ERR;
    for (int i = 1; i < n; i++) {
        if (arr[i - 1] > arr[i]) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

struct QsortThreadArg {
    int *arr;
    int len;
};

static void *QsortThreadFn(void *arg)
{
    QsortThreadArg *targ = static_cast<QsortThreadArg *>(arg);
    qsort(targ->arr, targ->len, sizeof(int), QsortCmpInt);
    return nullptr;
}

static napi_value QsortConcurrent2(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_THOUSAND;
    int arr1[QSORT_ELEM_THOUSAND];
    int arr2[QSORT_ELEM_THOUSAND];
    for (int i = 0; i < n; i++) {
        arr1[i] = n - i;
        arr2[i] = n - i;
    }
    QsortThreadArg arg1 = {arr1, n};
    QsortThreadArg arg2 = {arr2, n};
    pthread_t t1;
    pthread_t t2;
    pthread_create(&t1, nullptr, QsortThreadFn, &arg1);
    pthread_create(&t2, nullptr, QsortThreadFn, &arg2);
    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);
    int ret = QsortVerifyAsc(arr1, n, 1);
    if (ret == QSORT_NO_ERR) {
        ret = QsortVerifyAsc(arr2, n, 1);
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortConcurrent4(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_THOUSAND;
    int arr[QSORT_ELEM_FOUR][QSORT_ELEM_THOUSAND];
    for (int k = 0; k < QSORT_ELEM_FOUR; k++) {
        for (int i = 0; i < n; i++) {
            arr[k][i] = n - i;
        }
    }
    QsortThreadArg args[QSORT_ELEM_FOUR];
    pthread_t threads[QSORT_ELEM_FOUR];
    for (int k = 0; k < QSORT_ELEM_FOUR; k++) {
        args[k].arr = arr[k];
        args[k].len = n;
        pthread_create(&threads[k], nullptr, QsortThreadFn, &args[k]);
    }
    for (int k = 0; k < QSORT_ELEM_FOUR; k++) {
        pthread_join(threads[k], nullptr);
    }
    int ret = QSORT_NO_ERR;
    for (int k = 0; k < QSORT_ELEM_FOUR && ret == QSORT_NO_ERR; k++) {
        ret = QsortVerifyAsc(arr[k], n, 1);
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortAbnormalNullBase(napi_env env, napi_callback_info)
{
    qsort(nullptr, 0, sizeof(int), QsortCmpInt);
    return QsortMakeResult(env, QSORT_NO_ERR);
}

static napi_value QsortWidthChar(napi_env env, napi_callback_info)
{
    int leoSizes[] = {1, 3, 5, 9, 15, 25, 41, 67, 109};
    int numSizes = static_cast<int>(sizeof(leoSizes) / sizeof(leoSizes[0]));
    int ret = QSORT_NO_ERR;
    for (int j = 0; j < numSizes; j++) {
        int len = leoSizes[j];
        char *arr = static_cast<char *>(malloc(len));
        if (arr == nullptr) {
            ret = QSORT_FAIL;
            break;
        }
        for (int i = 0; i < len; i++) {
            arr[i] = static_cast<char>(len - i);
        }
        qsort(arr, len, 1, QsortCmpChar);
        for (int i = 0; i < len; i++) {
            if (arr[i] != static_cast<char>(i + 1)) {
                ret = QSORT_FAIL;
                break;
            }
        }
        free(arr);
        if (ret != QSORT_NO_ERR) {
            break;
        }
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidthShort(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_HUNDRED;
    short *arr = static_cast<short *>(malloc(n * sizeof(short)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i] = static_cast<short>(n - i);
    }
    qsort(arr, n, sizeof(short), QsortCmpShort);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i] != static_cast<short>(i + 1)) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidthInt(napi_env env, napi_callback_info)
{
    int ret = QSORT_NO_ERR;
    for (int j = 0; j < LEO_COUNT; j++) {
        int len = LEONARDO[j];
        int *arr = static_cast<int *>(malloc(len * sizeof(int)));
        if (arr == nullptr) {
            ret = QSORT_FAIL;
            break;
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(int), QsortCmpInt);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                ret = QSORT_FAIL;
                break;
            }
        }
        free(arr);
        if (ret != QSORT_NO_ERR) {
            break;
        }
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidthLong(napi_env env, napi_callback_info)
{
    int leoSizes[] = {1, 3, 5, 9, 15, 25, 41, 67, 109, 177, 287, 465, 753,
                      1219, 1973, 3193, 5167, 8361};
    int numSizes = static_cast<int>(sizeof(leoSizes) / sizeof(leoSizes[0]));
    int ret = QSORT_NO_ERR;
    for (int j = 0; j < numSizes; j++) {
        int len = leoSizes[j];
        long *arr = static_cast<long *>(malloc(len * sizeof(long)));
        if (arr == nullptr) {
            ret = QSORT_FAIL;
            break;
        }
        for (int i = 0; i < len; i++) {
            arr[i] = len - i;
        }
        qsort(arr, len, sizeof(long), QsortCmpLong);
        for (int i = 0; i < len; i++) {
            if (arr[i] != i + 1) {
                ret = QSORT_FAIL;
                break;
            }
        }
        free(arr);
        if (ret != QSORT_NO_ERR) {
            break;
        }
    }
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidthStruct(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_HUNDRED;
    QsortItem *arr = static_cast<QsortItem *>(malloc(n * sizeof(QsortItem)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i].val = n - i;
    }
    qsort(arr, n, sizeof(QsortItem), QsortCmpStruct);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i].val != i + 1) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidth256(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_TWENTY;
    QsortItem256 *arr = static_cast<QsortItem256 *>(malloc(n * sizeof(QsortItem256)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i].val = n - i;
        for (int j = 0; j < QSORT_PAD_256; j++) {
            arr[i].pad[j] = 0;
        }
    }
    qsort(arr, n, sizeof(QsortItem256), QsortCmpItem256);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i].val != i + 1) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortWidth257(napi_env env, napi_callback_info)
{
    const int n = QSORT_ELEM_TWENTY;
    QsortItem257 *arr = static_cast<QsortItem257 *>(malloc(n * sizeof(QsortItem257)));
    if (arr == nullptr) {
        return QsortMakeResult(env, QSORT_FAIL);
    }
    for (int i = 0; i < n; i++) {
        arr[i].val = n - i;
        for (int j = 0; j < QSORT_PAD_257; j++) {
            arr[i].pad[j] = 0;
        }
    }
    qsort(arr, n, sizeof(QsortItem257), QsortCmpItem257);
    int ret = QSORT_NO_ERR;
    for (int i = 0; i < n; i++) {
        if (arr[i].val != i + 1) {
            ret = QSORT_FAIL;
            break;
        }
    }
    free(arr);
    return QsortMakeResult(env, ret);
}

static napi_value QsortAbnormalNullCmp(napi_env env, napi_callback_info)
{
    pid_t pid = fork();
    if (pid == 0) {
        int arr[] = {QSORT_ELEM_THREE, QSORT_ARR_VAL_1, QSORT_ELEM_TWO};
        qsort(arr, QSORT_ELEM_THREE, sizeof(int), nullptr);
        _exit(0);
    } else if (pid > 0) {
        int status;
        waitpid(pid, &status, 0);
        return QsortMakeResult(env, QSORT_NO_ERR);
    }
    return QsortMakeResult(env, QSORT_FAIL);
}

EXTERN_C_START
static void QsortRegisterBasicTests(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"qsortNormalInt", nullptr, QsortNormalInt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalString", nullptr, QsortNormalString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalChar", nullptr, QsortNormalChar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalDouble", nullptr, QsortNormalDouble, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalUint64", nullptr, QsortNormalUint64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalLong", nullptr, QsortNormalLong, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortNormalStruct", nullptr, QsortNormalStruct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryEmpty", nullptr, QsortBoundaryEmpty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundarySingle", nullptr, QsortBoundarySingle, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryTwoSorted", nullptr, QsortBoundaryTwoSorted, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryTwoReverse", nullptr, QsortBoundaryTwoReverse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryTwoEqual", nullptr, QsortBoundaryTwoEqual, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryWidthOne", nullptr, QsortBoundaryWidthOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortBoundaryWidthZero", nullptr, QsortBoundaryWidthZero, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternSorted", nullptr, QsortPatternSorted, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternReverse", nullptr, QsortPatternReverse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternAllDup", nullptr, QsortPatternAllDup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternPartialDup", nullptr, QsortPatternPartialDup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternSawtooth", nullptr, QsortPatternSawtooth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternCyclic", nullptr, QsortPatternCyclic, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternNearSorted", nullptr, QsortPatternNearSorted, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortPatternBitonic", nullptr, QsortPatternBitonic, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void QsortRegisterAdvancedTests(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"qsortCveLeoReverse", nullptr, QsortCveLeoReverse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoSorted", nullptr, QsortCveLeoSorted, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCvePow2Minus1", nullptr, QsortCvePow2Minus1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoBoundary", nullptr, QsortCveLeoBoundary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoSum", nullptr, QsortCveLeoSum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoChar", nullptr, QsortCveLeoChar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoLong", nullptr, QsortCveLeoLong, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortCveLeoDouble", nullptr, QsortCveLeoDouble, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortScale10K", nullptr, QsortScale10K, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortScale50K", nullptr, QsortScale50K, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortScale100K", nullptr, QsortScale100K, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortScale10KRand", nullptr, QsortScale10KRand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortConcurrent2", nullptr, QsortConcurrent2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortConcurrent4", nullptr, QsortConcurrent4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortAbnormalNullBase", nullptr, QsortAbnormalNullBase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidthChar", nullptr, QsortWidthChar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidthShort", nullptr, QsortWidthShort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidthInt", nullptr, QsortWidthInt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidthLong", nullptr, QsortWidthLong, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidthStruct", nullptr, QsortWidthStruct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidth256", nullptr, QsortWidth256, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortWidth257", nullptr, QsortWidth257, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsortAbnormalNullCmp", nullptr, QsortAbnormalNullCmp, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static napi_value QsortInit(napi_env env, napi_value exports)
{
    QsortRegisterBasicTests(env, exports);
    QsortRegisterAdvancedTests(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module qsortModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = QsortInit,
    .nm_modname = "qsorttest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterQsortModule(void)
{
    napi_module_register(&qsortModule);
}
