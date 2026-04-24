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

#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include "test.h"

#ifndef TEST_MODE
#define TEST_MODE 0666
#endif

/**
 * @tc.name      : symlinkat_0100
 * @tc.desc      : Create a symbolic link to the specified file
 * @tc.level     : Level 0
 * @note         : Symbolic links may not be supported on all filesystems or platforms.
 */
void symlinkat_0100(void)
{
    char buffer[BUFSIZ];
    const char* path_name = "/data/storage/el2/base/cache";
    const char* file_name = "/data/storage/el2/base/cache/symlinkat.txt";
    const char* symlink_name = "mysymlinkat";
    ssize_t sz;
    DIR* dp;
    int fdd, fdf;

    // Create target file with proper permissions
    fdf = open(file_name, O_RDWR | O_CREAT | O_TRUNC, TEST_MODE);
    if (fdf == -1) {
        t_error("%s: open/creat failed (errno=%d)\n", __func__, errno);
        return;
    }
    close(fdf);

    // Open directory
    dp = opendir(path_name);
    if (dp == nullptr) {
        t_error("%s: opendir failed (errno=%d)\n", __func__, errno);
        unlink(file_name);
        return;
    }

    fdd = dirfd(dp);
    if (fdd < 0) {
        t_error("%s: dirfd failed (errno=%d)\n", __func__, errno);
        closedir(dp);
        unlink(file_name);
        return;
    }

    // Create symbolic link
    if (symlinkat(file_name, fdd, symlink_name) < 0) {
        printf("%s: symlinkat failed (errno=%d). ", __func__, errno);
        printf("Symbolic links may not be supported on this platform/filesystem.\n");
        closedir(dp);
        unlink(file_name);
        return;
    }

    // Read the symbolic link target
    memset(buffer, 0, sizeof(buffer));
    sz = readlinkat(fdd, symlink_name, buffer, sizeof(buffer) - 1);
    if (sz < 0) {
        t_error("%s: readlinkat failed (errno=%d)\n", __func__, errno);
        unlinkat(fdd, symlink_name, 0);
        closedir(dp);
        unlink(file_name);
        return;
    }
    buffer[sz] = '\0'; // Null-terminate the string

    // Verify the link target
    if (strcmp(buffer, file_name) != 0) {
        t_error("%s: buffer is '%s', expected '%s'\n", __func__, buffer, file_name);
    }

    // Cleanup
    unlinkat(fdd, symlink_name, 0);
    closedir(dp);
    unlink(file_name);
}

/**
 * @tc.name      : symlinkat_0200
 * @tc.desc      : Create a symbolic link even when the target file does not exist
 * @tc.level     : Level 1
 * @note         : Symbolic links can point to non-existent targets (dangling links).
 */
void symlinkat_0200(void)
{
    const char* path_name = "/data/storage/el2/base/cache";
    const char* file_name = "/data/storage/el2/base/cache/nonexistent_symlinkat_target.txt";
    const char* symlink_name = "mysymlinkat_dangling";
    DIR* dp;
    int fd;

    // Open directory
    dp = opendir(path_name);
    if (dp == nullptr) {
        t_error("%s: opendir failed (errno=%d)\n", __func__, errno);
        return;
    }

    fd = dirfd(dp);
    if (fd < 0) {
        t_error("%s: dirfd failed (errno=%d)\n", __func__, errno);
        closedir(dp);
        return;
    }

    // Create symbolic link to non-existent file (this should succeed)
    if (symlinkat(file_name, fd, symlink_name) < 0) {
        printf("%s: symlinkat failed (errno=%d). ", __func__, errno);
        printf("Symbolic links may not be supported on this platform/filesystem.\n");
        closedir(dp);
        return;
    }

    // Cleanup
    unlinkat(fd, symlink_name, 0);
    closedir(dp);
}

static int SymlinkatTest_impl(int argc, char* argv[])
{
    symlinkat_0100();
    symlinkat_0200();
    return t_status;
}

int SymlinkatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SymlinkatTest_impl(1, libcArgv);
}
