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
 * @tc.name      : tolower_0100
 * @tc.desc      : Convert uppercase to lowercase by tolower
 * @tc.level     : Level 0
 */
void Tolower0100(void)
{
    char ch = 'A';
    char result = tolower(ch);
    if (result != 'a') {
        t_error("%s tolower get result is %c but want get value a ", __func__, result);
    }
}

/**
 * @tc.name      : tolower_0200
 * @tc.desc      : Test the result obtained by passing a number to tolower
 * @tc.level     : Level 1
 */
void Tolower0200(void)
{
    char ch = 2;
    char result = tolower(ch);
    if (result != ch) {
        t_error("%s tolower get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : tolower_0300
 * @tc.desc      : Test the result of passing lowercase letters to tolower
 * @tc.level     : Level 1
 */
void Tolower0300(void)
{
    char ch = 'a';
    char result = tolower(ch);
    if (result != ch) {
        t_error("%s tolower get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : tolower_0400
 * @tc.desc      : Test the result of passing special characters into tolower
 * @tc.level     : Level 2
 */
void Tolower0400(void)
{
    char ch = '$';
    char result = tolower(ch);
    if (result != ch) {
        t_error("%s tolower get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : tolower_0500
 * @tc.desc      : Test the result of passing whitespace character into tolower
 * @tc.level     : Level 2
 */
void Tolower0500(void)
{
    char ch = ' ';
    char result = tolower(ch);
    if (result != ch) {
        t_error("%s tolower get result is %c but want get value %c ", __func__, result, ch);
    }
}

/**
 * @tc.name      : tolower_0600
 * @tc.desc      : Test the result of passing all lowercase characters into tolower
 * @tc.level     : Level 2
 */
void Tolower0600(void)
{
    char str1[] = "helloworld";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = tolower(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "helloworld";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s tolower get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

/**
 * @tc.name      : tolower_0700
 * @tc.desc      : Test the result of passing all uppercase characters into tolower
 * @tc.level     : Level 2
 */
void Tolower0700(void)
{
    char str1[] = "HELLOWORLD";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = tolower(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "helloworld";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s tolower get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

/**
 * @tc.name      : tolower_0800
 * @tc.desc      : Test the result of passing Uncertain characters into tolower
 * @tc.level     : Level 2
 */
void Tolower0800(void)
{
    char str1[] = "Hello world!";
    size_t sizeStr = sizeof(str1);
    char str2[sizeStr];
    int i;
    for (i = 0; str1[i]; i++) {
        str2[i] = tolower(str1[i]);
    }
    str2[i] = '\0';
    char wantStr[] = "hello world!";
    int result = strcmp(wantStr, str2);
    if (result != 0) {
        t_error("%s tolower get str2 is %s but want get value %s ", __func__, str2, wantStr);
    }
}

static int TolowerTestImpl(int argc, char *argv[])
{
    g_tStatus = 0;
    Tolower0100();
    Tolower0200();
    Tolower0300();
    Tolower0400();
    Tolower0500();
    Tolower0600();
    Tolower0700();
    Tolower0800();
    return g_tStatus;
}

int TolowerTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return TolowerTestImpl(1, libcArgv);
}
