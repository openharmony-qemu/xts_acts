/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : sbrk_0100
 * @tc.desc      : Find the current location of the program break
 * @tc.level     : Level 0
 */
void sbrk_0100(void)
{
    errno = 0;
    // 修复：添加 (int*) 强转
    int *p = (int*)sbrk(0);
    if (p == (void *)(-1)) {
        t_error("%s sbrk failed\n", __func__);
    }
    if (errno == ENOMEM) {
        t_error("%s errno is %d\n", __func__, errno);
    }
}

/**
 * @tc.name      : sbrk_0200
 * @tc.desc      : Exception return value test when parameter is 1
 * @tc.level     : Level 2
 */
void sbrk_0200(void)
{
    errno = 0;
    // 修复：添加 (int*) 强转
    int *p = (int*)sbrk(1);
    if (p != (void *)(-1)) {
        t_error("%s sbrk failed\n", __func__);
    }
    if (errno != ENOMEM) {
        t_error("%s errno is %d\n", __func__, errno);
    }
}

static int SbrkTest_impl(int argc, char *argv[]){
    sbrk_0100();
    sbrk_0200();
    return T_STATUS;
}

int SbrkTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return SbrkTest_impl(1, __libc_argv);
}