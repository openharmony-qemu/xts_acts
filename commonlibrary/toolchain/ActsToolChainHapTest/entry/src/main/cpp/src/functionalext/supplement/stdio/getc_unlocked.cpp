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

#include <cstdio>
#include "functionalext.h"

const int SIZE = 97;

/**
 * @tc.name      : getc_unlocked_0100
 * @tc.desc      : The parameter is valid, and the specified character can be obtained.
 * @tc.level     : Level 0
 */
void GetcUnlocked0100(void)
{
    const char *ptr = "/data/storage/el2/base/cache/getc_unlockedtest.txt";
    FILE *fptr = fopen(ptr, "wr+");
    EXPECT_TRUE("getc_unlocked_0100", fptr != nullptr);
    const char *wstr = "a";
    fwrite(wstr, sizeof(char), strlen(wstr), fptr);
    fseek(fptr, 0, SEEK_SET);
    int ret = getc_unlocked(fptr);
    EXPECT_EQ("getc_unlocked_0100", ret, SIZE);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : getc_unlocked_0200
 * @tc.desc      : The parameter f is invalid, and the specified character cannot be obtained.
 * @tc.level     : Level 2
 */
void GetcUnlocked0200(void)
{
    const char *ptr = "/data/storage/el2/base/cache/getc_unlockedtest.txt";
    FILE *fptr = fopen(ptr, "wr+");
    EXPECT_TRUE("getc_unlocked_0200", fptr != nullptr);
    fclose(fptr);
    fptr = fopen(ptr, "r");
    EXPECT_TRUE("getc_unlocked_0200", fptr != nullptr);
    int ret = getc_unlocked(fptr);
    EXPECT_EQ("getc_unlocked_0200", ret, EOF);
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

static int GetcUnlockedTestImpl(int argc, char *argv[])
{
    GetcUnlocked0100();
    GetcUnlocked0200();
    return g_tStatus;
}

int GetcUnlockedTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return GetcUnlockedTestImpl(1, libcArgv);
}
