/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <sys/xattr.h>
#include "functionalext.h"

/**
 * @tc.name      : Flistxattr0100
 * @tc.desc      : Verify that extended attribute names can be listed (each parameter is valid)
 * @tc.level     : Level 0
 */
void Flistxattr0100(void)
{
    const char *PATH = "/data/storage/el2/base/cache/test.txt";
    char NAME[] = "user.x";
    char VALUE[] = "the past is not dead.";

    int fd = open(PATH, O_CREAT | O_WRONLY, 0667);
    EXPECT_NE("Flistxattr0100", fd, -1);

    fsetxattr(fd, NAME, VALUE, strlen(VALUE), 0);

    ssize_t result = flistxattr(fd, NAME, 0);
    EXPECT_NE("Flistxattr0100", result, -1);

    close(fd);
    remove(PATH);
}

static int FlistxattrTestImpl(int argc, char *argv[])
{
    Flistxattr0100();
    return T_STATUS;
}

int FlistxattrTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return FlistxattrTestImpl(1, libcArgv);
}
