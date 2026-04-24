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
#include <sys/stat.h>
#include "functionalext.h"

/**
 * @tc.name      : chmod_0100
 * @tc.desc      : Verify the permission to modify the file (the mode parameter is set separately)
 * @tc.level     : Level 0
 */
void chmod_0100(void)
{
    struct stat buf;
    open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, TEST_MODE);
    int result = chmod("/data/storage/el2/base/cache/test.txt",
                       S_IRUSR | S_ISGID | S_ISVTX | S_IWUSR | S_IROTH | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP |
                           S_IXGRP | S_IROTH | S_IWOTH | S_IXOTH);
    stat("/data/storage/el2/base/cache/test.txt", &buf);
    EXPECT_EQ("chmod_0100", result, 0);
    EXPECT_EQ("chmod_0100", buf.st_mode, 34815);
    remove("/data/storage/el2/base/cache/test.txt");
}

/*
 * @tc.name      : chmod_0200
 * @tc.desc      : Verify the permission to modify the file (the overall setting of the mode parameter)
 * @tc.level     : Level 2
 */
void chmod_0200(void)
{

    struct stat buf;
    open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, TEST_MODE);
    int result = chmod("/data/storage/el2/base/cache/test.txt", S_IRWXU | S_IRWXG | S_IRWXO);
    stat("/data/storage/el2/base/cache/test.txt", &buf);
    EXPECT_EQ("chmod_0200", result, 0);
    EXPECT_EQ("chmod_0200", buf.st_mode, 33279);
    remove("/data/storage/el2/base/cache/test.txt");
}

/*
 * @tc.name      : chmod_0300
 * @tc.desc      : Verify that file permissions cannot be modified (parameter invalid)
 * @tc.level     : Level 2
 */
void chmod_0300(void)
{
    int result = chmod("/data/storage/el2/base/cache/AAA.txt",
                       S_ISUID | S_ISGID | S_ISVTX | S_IRUSR | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP | S_IXGRP |
                           S_IROTH | S_IWOTH | S_IXOTH);
    EXPECT_EQ("chmod_0300", result, -1);
}

static int chmodTest_with_args(int argc, char* argv[])
{
    chmod_0100();
    chmod_0200();
    chmod_0300();
    return t_status;
}

int chmodTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, NULL };
    return chmodTest_with_args(1, libcArgv);
}
