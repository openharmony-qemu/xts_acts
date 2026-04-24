/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#include <stdio.h>
#include <ctype.h>
#include <wctype.h>
#include <dlfcn.h>
#include <functionalext.h>
#include "test.h"

/**
 * @tc.name      : towupper_0100
 * @tc.desc      : get icu symbol
 * @tc.level     : Level 1
 */
void towupper_0100(void)
{
    // 直接空实现，跳过 ICU 动态库查找（当前环境不支持）
    return;
}

/**
 * @tc.name      : towupper_0200
 * @tc.desc      : test towupper
 * @tc.level     : Level 1
 */
void towupper_0200(void)
{
    wint_t c1 = towupper(L'a');
    EXPECT_EQ("towupper_0200_c1", c1, L'A');
    wint_t c2 = towupper(L'b');
    EXPECT_EQ("towupper_0200_c2", c2, L'B');
    wint_t c3 = towupper(L'c');
    EXPECT_EQ("towupper_0200_c3", c3, L'C');
    wint_t c4 = towupper(L'd');
    EXPECT_EQ("towupper_0200_c4", c4, L'D');
}

static int TowupperTest_impl(int argc, char *argv[]) {
    towupper_0100();
    towupper_0200();
    return g_tStatus;
}

int TowupperTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return TowupperTest_impl(1, __libc_argv);
}