/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <shadow.h>
#include <cstring>
#include <dlfcn.h>
#include "functionalext.h"
#include "test.h"


#define MAX_NAME 300

/**
 * @tc.name      : getspnam_0100
 * @tc.desc      : Get user database files. Test precondtions: /etc/shadow.
 * @tc.level     : Level 0
 */
void Getspnam0100(void)
{
    struct spwd *spwd = NULL;
    const char *spwdName = "root";

    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam(spwdName);
    EXPECT_PTRNE("getspnam_0100", spwd, NULL);
    if (spwd) {
        EXPECT_EQ("getspnam_0100", strcmp(spwdName, spwd->sp_namp), 0);
    }
}

/**
 * @tc.name      : getspnam_0200
 * @tc.desc      : Buffer size not be able to hold name.(normal: buffer_size > strlen(name)+100)
 * @tc.level     : Level 2
 */
void Getspnam0200(void)
{
    errno = 0;
    struct spwd *spwd = NULL;

    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam("bin");
    EXPECT_PTREQ("getspnam_0200", errno, 0);
    EXPECT_PTREQ("getspnam_0200", spwd, NULL);
}

/**
 * @tc.name      : getspnam_0300
 * @tc.desc      : Test the function of getspnam with invalid input(name).
 * @tc.level     : Level 2
 */
void Getspnam0300(void)
{
    errno = 0;
    struct spwd *spwd;
    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam("bin/");
    EXPECT_PTREQ("getspnam_0300", errno, EINVAL);
    EXPECT_PTREQ("getspnam_0300", spwd, NULL);
}

/**
 * @tc.name      : getspnam_0400
 * @tc.desc      : Test the function of getspnam with invalid input(name).
 * @tc.level     : Level 2
 */
void Getspnam0400(void)
{
    errno = 0;
    struct spwd *spwd;

    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam(".bin");
    EXPECT_PTREQ("getspnam_0400", errno, EINVAL);
    EXPECT_PTREQ("getspnam_0400", spwd, NULL);
}

/**
 * @tc.name      : getspnam_0500
 * @tc.desc      : Test the function of getspnam with invalid input(name).
 * @tc.level     : Level 2
 */
void Getspnam0500(void)
{
    errno = 0;
    struct spwd *spwd;

    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam("");
    EXPECT_PTREQ("getspnam_0500", errno, EINVAL);
    EXPECT_PTREQ("getspnam_0500", spwd, NULL);
}

/**
 * @tc.name      : getspnam_r_0600
 * @tc.desc      : The length of name is greater than the NAME_MAX.
 * @tc.level     : Level 2
 */
void Getspnam0600(void)
{
    errno = 0;
    struct spwd *spwd;

    char name[MAX_NAME] = {0};
    memset(name, 1, MAX_NAME - 1);
    name[MAX_NAME - 1] = '\0';

    typedef struct spwd* (*GetspnamFunc)(const char *name);
    GetspnamFunc getspnam = (GetspnamFunc)dlsym(RTLD_DEFAULT, "getspnam");
    if (!getspnam) {
        return;
    }

    spwd = getspnam(name);
    EXPECT_PTREQ("getspnam_0600", errno, ERANGE);
    EXPECT_PTREQ("getspnam_0600", spwd, NULL);
}

static int GetspnamTestImpl(int argc, char *argv[])
{
    Getspnam0200();
    Getspnam0300();
    Getspnam0400();
    Getspnam0500();
    Getspnam0600();

    return g_tStatus;
}

int GetspnamTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return GetspnamTestImpl(1, libcArgv);
}
