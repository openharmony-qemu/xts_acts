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

#include <wchar.h>
#include <locale.h>
#include "functionalext.h"

const int FAILED = -1;

/**
 * @tc.name      : Fputws0100
 * @tc.desc      : Each parameter is valid and can output a wide character string to a file stream.
 * @tc.level     : Level 0
 */
void Fputws0100(void)
{
    char str[100] = {0};
    const char *PTR = "/data/storage/el2/base/cache/fputwstest.txt";
    FILE *fptr = fopen(PTR, "w+");
    EXPECT_TRUE("Fputws0100", fptr != nullptr);
    setlocale(LC_ALL, "en_US.utf8");
    int ret = fputws(L"this is the test", fptr);
    EXPECT_TRUE("Fputws0100", ret >= 0);
    fseek(fptr, 0, SEEK_SET);
    int rsize = fread(str, sizeof(char), 100, fptr);
    EXPECT_EQ("Fputws0100", rsize, ret);
    fclose(fptr);
    remove(PTR);
    fptr = nullptr;
    PTR = nullptr;
}

/**
 * @tc.name      : Fputws0200
 * @tc.desc      : The f parameter is invalid, a wide string cannot be output to a file stream.
 * @tc.level     : Level 2
 */
void Fputws0200(void)
{
    const char *PTR = "/data/storage/el2/base/cache/fputwstest.txt";
    FILE *fptr = fopen(PTR, "w+");
    EXPECT_TRUE("Fputws0200", fptr != nullptr);
    fclose(fptr);
    fptr = fopen(PTR, "r");
    EXPECT_TRUE("Fputws0200", fptr != nullptr);
    int ret = fputws(L"this is the test", fptr);
    EXPECT_EQ("Fputws0200", ret, FAILED);
    fclose(fptr);
    remove(PTR);
    fptr = nullptr;
    PTR = nullptr;
}

static int FputwsTestImpl(int argc, char *argv[])
{
    Fputws0100();
    Fputws0200();
    return g_tStatus;
}

int FputwsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FputwsTestImpl(1, libcArgv);
}
