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
#include <cstring>
#include <cctype>
#include "test.h"

/**
 * @tc.name      : toupper_0100
 * @tc.desc      : Convert lowercase to uppercase via toupper
 * @tc.level     : Level 0
 */
void Toupper0100(void)
{
    char ch = 'a';
    char result = toupper(ch);
    if (result != 'A') {
        t_error("%s toupper get result is %c but want get value A ", __func__, result);
    }
}

/**
 * @tc.name      : toupper_0200
 * @tc.desc      : Test the result of passing numbers into toupper
 * @tc.level     : Level 1
 */
void Toupper0200(void)
{
    char ch = 2;
    char result = toupper(ch);
    if (result != ch) {
        t_error("%s toupper get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : toupper_0300
 * @tc.desc      : Test the result of passing capital letters into toupper
 * @tc.level     : Level 1
 */
void Toupper0300(void)
{
    char ch = 'A';
    char result = toupper(ch);
    if (result != ch) {
        t_error("%s toupper get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : toupper_0400
 * @tc.desc      : Test the result of passing special characters into toupper
 * @tc.level     : Level 2
 */
void Toupper0400(void)
{
    char ch = '$';
    char result = toupper(ch);
    if (result != ch) {
        t_error("%s toupper get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : toupper_0500
 * @tc.desc      : Test the result of passing whitespace character into toupper
 * @tc.level     : Level 2
 */
void Toupper0500(void)
{
    char ch = ' ';
    char result = toupper(ch);
    if (result != ch) {
        t_error("%s toupper get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : toupper_0600
 * @tc.desc      : Test the result of passing all lowercase characters into toupper
 * @tc.level     : Level 2
 */
void Toupper0600(void)
{
    char str1[] = "helloworld";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = toupper(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "HELLOWORLD";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s toupper get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

/**
 * @tc.name      : toupper_0700
 * @tc.desc      : Test the result of passing all uppercase characters into toupper
 * @tc.level     : Level 2
 */
void Toupper0700(void)
{
    char str1[] = "HELLOWORLD";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = toupper(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "HELLOWORLD";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s toupper get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

/**
 * @tc.name      : toupper_0800
 * @tc.desc      : Test the result of passing Uncertain characters into toupper
 * @tc.level     : Level 2
 */
void Toupper0800(void)
{
    char str1[] = "Hello world!";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = toupper(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "HELLO WORLD!";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s toupper get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

static int ToupperTestImpl(int argc, char *argv[])
{
    Toupper0100();
    Toupper0200();
    Toupper0300();
    Toupper0400();
    Toupper0500();
    Toupper0600();
    Toupper0700();
    Toupper0800();
    return g_tStatus;
}

int ToupperTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return ToupperTestImpl(1, libcArgv);
}
