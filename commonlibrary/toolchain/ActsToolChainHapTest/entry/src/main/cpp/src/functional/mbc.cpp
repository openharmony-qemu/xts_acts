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

#include <clocale>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include <langinfo.h>
#include "test.h"

/*
 * f = function call to test (or any expression)
 * x = expected result
 * m = message to print on failure
 *
 * Always reset mbstate_t st (not st2) before each check, matching original behavior: tests that use
 * st2 rely on st2 carrying conversion state across consecutive mbrtowc/mbsrtowcs calls.
 */
// NOLINTNEXTLINE(G.PRE.10)
#define t(f, x, m)                                                                                  \
    do {                                                                                            \
        int tmp;                                                                                    \
        (void)(memset(&st, 0, sizeof(st)) /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */, \
               (tmp = (f)) == (x) || t_error("%s failed (%s) got %d want %d\n", #f, m, tmp, (x)));  \
    } while (0)
// NOLINTNEXTLINE(G.PRE.10)
#define TCHAR(f, x, m)                                                                                     \
    do {                                                                                                   \
        int tmp;                                                                                           \
        (void)(memset(&st, 0, sizeof(st)) /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */,        \
               (tmp = (f)) == (x) || t_error("%s failed (%s) got 0x%04x want 0x%04x\n", #f, m, tmp, (x))); \
    } while (0)

static void MbcTestMbsrtowcsCases(const char*& cs, mbstate_t& st, wchar_t* wcs)
{
    t(mbsrtowcs(wcs, (cs = "abcdef", &cs), 3, &st), 3, "wrong semantics for wcs buf len");
    t(mbsrtowcs(wcs, (cs = "abcdef", &cs), 8, &st), 6, "wrong semantics for wcs buf len");
    t(mbsrtowcs(nullptr, (cs = "abcdef", &cs), 2, &st), 6, "wrong semantics for nullptr wcs");
}

static void MbcTestUtf8IllegalAndBoundaryCases(mbstate_t& st, wchar_t& wc)
{
    t(mbrtowc(&wc, "\x80", 1, &st), -1, "failed to catch error");
    t(mbrtowc(&wc, "\xc0", 1, &st), -1, "failed to catch illegal initial");
    t(mbrtowc(&wc, "\xc0\x80", 2, &st), -1, "aliasing nul");
    t(mbrtowc(&wc, "\xc0\xaf", 2, &st), -1, "aliasing slash");
    t(mbrtowc(&wc, "\xe0\x80\xaf", 3, &st), -1, "aliasing slash");
    t(mbrtowc(&wc, "\xf0\x80\x80\xaf", 4, &st), -1, "aliasing slash");
    t(mbrtowc(&wc, "\xf8\x80\x80\x80\xaf", 5, &st), -1, "aliasing slash");
    t(mbrtowc(&wc, "\xfc\x80\x80\x80\x80\xaf", 6, &st), -1, "aliasing slash");
    t(mbrtowc(&wc, "\xe0\x82\x80", 3, &st), -1, "aliasing U+0080");
    t(mbrtowc(&wc, "\xe0\x9f\xbf", 3, &st), -1, "aliasing U+07FF");
    t(mbrtowc(&wc, "\xf0\x80\xa0\x80", 4, &st), -1, "aliasing U+0800");
    t(mbrtowc(&wc, "\xf0\x8f\xbf\xbd", 4, &st), -1, "aliasing U+FFFD");
    t(mbrtowc(&wc, "\xed\xa0\x80", 3, &st), -1, "failed to catch surrogate");
    t(mbrtowc(&wc, "\xef\xbf\xbe", 3, &st), 3, "failed to accept U+FFFE");
    t(mbrtowc(&wc, "\xef\xbf\xbf", 3, &st), 3, "failed to accept U+FFFF");
    t(mbrtowc(&wc, "\xf4\x8f\xbf\xbe", 4, &st), 4, "failed to accept U+10FFFE");
    t(mbrtowc(&wc, "\xf4\x8f\xbf\xbf", 4, &st), 4, "failed to accept U+10FFFF");
}

static void MbcTestUtf8ResumeCases(const char*& cs, mbstate_t& st, mbstate_t& st2, wchar_t& wc, wchar_t* wcs)
{
    t(mbrtowc(&wc, "\xc2\x80", 2, &st), 2, "wrong length");
    TCHAR((mbrtowc(&wc, "\xc2\x80", 2, &st), wc), 0x80, "wrong char");
    t(mbrtowc(&wc, "\xe0\xa0\x80", 3, &st), 3, "wrong length");
    TCHAR((mbrtowc(&wc, "\xe0\xa0\x80", 3, &st), wc), 0x800, "wrong char");
    t(mbrtowc(&wc, "\xf0\x90\x80\x80", 4, &st), 4, "wrong length");
    TCHAR((mbrtowc(&wc, "\xf0\x90\x80\x80", 4, &st), wc), 0x10000, "wrong char");
    memset(&st2, 0, sizeof(st2)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    t(mbrtowc(&wc, "\xc2", 1, &st2), -2, "failed to accept initial byte");
    t(mbrtowc(&wc, "\x80", 1, &st2), 1, "failed to resume");
    TCHAR(wc, 0x80, "wrong char");
    memset(&st2, 0, sizeof(st2)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    t(mbrtowc(&wc, "\xc2", 1, &st2), -2, "failed to accept initial byte");
    t(mbsrtowcs(wcs,
                (cs = "\xa0"
                      "abc",
                 &cs),
                32,
                &st2),
      4,
      "failed to resume");
    TCHAR(wcs[0], 0xa0, "wrong char");
    TCHAR(wcs[1], 'a', "wrong char");
    t(!cs, 1, "wrong final position");
}

static int MbcTestImpl(void)
{
    const char* cs;
    mbstate_t st, st2;
    wchar_t wc, wcs[32];

    (void)(setlocale(LC_CTYPE, "en_US.UTF-8") || setlocale(LC_CTYPE, "en_GB.UTF-8") ||
           setlocale(LC_CTYPE, "en.UTF-8") || setlocale(LC_CTYPE, "POSIX.UTF-8") || setlocale(LC_CTYPE, "C.UTF-8") ||
           setlocale(LC_CTYPE, "UTF-8") || setlocale(LC_CTYPE, ""));
    MbcTestMbsrtowcsCases(cs, st, wcs);

    if (strcmp(nl_langinfo(CODESET), "UTF-8")) {
        return t_error("cannot set UTF-8 locale for test (codeset=%s)\n", nl_langinfo(CODESET));
    }
    MbcTestUtf8IllegalAndBoundaryCases(st, wc);
    MbcTestUtf8ResumeCases(cs, st, st2, wc, wcs);
    return T_STATUS;
}

int MbcTest(void)
{
    return MbcTestImpl();
}
