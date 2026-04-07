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

// decode across buffer boundary
#include <cerrno>
#include <clocale>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <unistd.h>
#include "libc_test_shim.h"
#define A(st, c)                                  \
    do {                                          \
        if (!(c))                                 \
            LibcTestError(&(st), #c " failed\n"); \
    } while (0)

void TSetutf8(void)
{
    if (!setlocale(LC_ALL, "C.UTF-8")) {
        if (!setlocale(LC_ALL, "en_US.UTF-8")) {
            (void)setlocale(LC_ALL, "UTF-8");
        }
    }
}

int FgetwcBufferingTest()
{
    int status = SUCCESS_CODE;

    TSetutf8();

    int p[2];
    A(status, pipe(p) == 0);
    A(status, write(p[1], "x\340\240", 3) == 3);
    A(status, dup2(p[0], 0) == 0);
    wint_t wc;
    wc = fgetwc(stdin);
    A(status, wc == 'x');
    A(status, write(p[1], "\200", 1) == 1);
    close(p[1]);

    wc = fgetwc(stdin);
    if (wc != 0x800) {
        LibcTestError(&status, "wanted 0x800, got 0x%x\n", static_cast<unsigned>(wc));
    }

    errno = 0;
    wc = fgetwc(stdin);
    if (wc != WEOF) {
        LibcTestError(&status, "wanted WEOF, got 0x%x\n", static_cast<unsigned>(wc));
    }
    if (errno != 0) {
        LibcTestError(&status, "wanted errno==0, got %d (%s)\n", errno, strerror(errno));
    }
    A(status, feof(stdin) != 0);
    A(status, ferror(stdin) == 0);
    return status;
}
