/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstdlib>
#include <cstring>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : Realpath0100
 * @tc.desc      : Verify realpath process success
 * @tc.level     : Level 0
 */
void Realpath0100(void)
{
#if defined(PATH_MAX) && (PATH_MAX > 0)
    char actualPath[PATH_MAX];
#else
    char actualPath[4096];
#endif
    char* ret = realpath("/system/bin/../etc", actualPath);
    EXPECT_STREQ("Realpath0100", ret, "/system/etc");
    EXPECT_STREQ("Realpath0100", actualPath, "/system/etc");
}

/**
 * @tc.name      : Realpath0200
 * @tc.desc      : Verify realpath process success fail bacaus PATH is error
 * @tc.level     : Level 2
 */
void Realpath0200(void)
{
#if defined(PATH_MAX) && (PATH_MAX > 0)
    char buf[PATH_MAX] = { 0 };
#else
    char buf[4096] = { 0 };
#endif
    char* ret = realpath("/system/bin/../mypth", buf);
    EXPECT_PTREQ("Realpath0200", ret, nullptr);
    memset(buf, 0, sizeof(buf));
    ret = realpath("/system/bin/../etc", buf);
    EXPECT_STREQ("Realpath0200", ret, "/system/etc");
}

static int RealpathTestImpl(int argc, char* argv[])
{
    Realpath0100();
    Realpath0200();
    return T_STATUS;
}

int RealpathTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return RealpathTestImpl(1, libcArgvStub);
}
