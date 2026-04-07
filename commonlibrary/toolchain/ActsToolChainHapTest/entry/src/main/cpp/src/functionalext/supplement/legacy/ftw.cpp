/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// WARNING: failed to inject status
#include "include/CommonTool.h"
#ifdef _XOPEN_SOURCE
#include <ftw.h>
#include "libc_test_shim.h"
#define t(t) (t*)nullptr;
#define f(t, n)      \
    {                \
        t* y = &x.n; \
    }
#define C(n)           \
    switch (0) {       \
        case 0:        \
            (void)(n); \
        default:       \
            break;     \
    }
static void f()
{
    t(struct FTW) t(struct stat) C(FTW_F) C(FTW_D) C(FTW_DNR) C(FTW_DP) C(FTW_NS) C(FTW_SL) C(FTW_SLN) C(FTW_PHYS)
        C(FTW_MOUNT) C(FTW_DEPTH) C(FTW_CHDIR) C(S_IRWXU) C(S_IRUSR) C(S_IWUSR) C(S_IXUSR) C(S_IRWXG) C(S_IRGRP)
            C(S_IWGRP) C(S_IXGRP) C(S_IRWXO) C(S_IROTH) C(S_IWOTH) C(S_IXOTH) C(S_ISUID) C(S_ISGID) C(S_ISVTX) C(S_IFMT)
                C(S_IFBLK) C(S_IFCHR) C(S_IFIFO) C(S_IFREG) C(S_IFDIR) C(S_IFLNK) C(S_IFSOCK) C(S_ISBLK(0))
                    C(S_ISCHR(0)) C(S_ISDIR(0)) C(S_ISFIFO(0)) C(S_ISREG(0)) C(S_ISLNK(0)) C(S_ISSOCK(0))
    {
        struct FTW x;
        f(int, base) f(int, level)
    }
    {
        struct stat x;
        f(dev_t, st_dev) f(ino_t, st_ino) f(mode_t, st_mode) f(nlink_t, st_nlink) f(uid_t, st_uid) f(gid_t, st_gid)
            f(dev_t, st_rdev) f(off_t, st_size) f(struct timespec, st_atim) f(struct timespec, st_mtim)
                f(struct timespec, st_ctim) f(blksize_t, st_blksize) f(blkcnt_t, st_blocks)
    }
    {
        int (*p)(const char*, int (*)(const char*, const struct stat*, int), int) = ftw;
    }
    {
        int (*p)(const char*, int (*)(const char*, const struct stat*, int, struct FTW*), int, int) = nftw;
    }
}
#endif

int FtwTest()
{
#ifdef _XOPEN_SOURCE
    f();
#endif
    return SUCCESS_CODE;
}
