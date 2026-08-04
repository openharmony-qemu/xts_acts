/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_FILE_H
#define ARKTS_ANI_TEST_NATIVETEST01_FILE_H

#include "AniTestBase.h"

inline ani_size ProbePathLength(ani_env *env, ani_string path)
{
    char probe[PATH_PROBE_SIZE];
    ani_size needed = 0;
    env->String_GetUTF8(path, probe, sizeof(probe), &needed);
    if (needed == 0 || needed > PATH_PROBE_SIZE) {
        return 0;
    }
    return needed;
}

inline bool ReadPathContent(ani_env *env, ani_string path, char *buf, ani_size needed)
{
    ani_size actualLen = 0;
    if (env->String_GetUTF8(path, buf, needed + 1, &actualLen) != ANI_OK) {
        return false;
    }
    return true;
}

inline char *AllocAndReadPath(ani_env *env, ani_string path, ani_size needed)
{
    if (needed == 0 || needed > PATH_PROBE_SIZE) {
        return nullptr;
    }
    char *buf = static_cast<char *>(malloc(needed + 1));
    if (buf != nullptr && ReadPathContent(env, path, buf, needed)) {
        return buf;
    }
    free(buf);
    return nullptr;
}

inline char *ResolvePath(ani_env *env, ani_string path)
{
    ani_size needed = ProbePathLength(env, path);
    if (needed == 0) {
        return nullptr;
    }
    return AllocAndReadPath(env, path, needed);
}

ani_boolean testAniFileCopy([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_string srcPath, ani_string dstPath, ani_long size)
{
    if (srcPath == nullptr || dstPath == nullptr || size <= 0) {
        return ANI_FALSE;
    }
    char *srcBuf = ResolvePath(env, srcPath);
    char *dstBuf = ResolvePath(env, dstPath);
    if (srcBuf == nullptr || dstBuf == nullptr) {
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    int srcFd = open(srcBuf, O_RDONLY);
    if (srcFd < 0) {
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    int dstFd = open(dstBuf, O_WRONLY | O_CREAT | O_TRUNC, FILE_CREATE_PERMISSION);
    if (dstFd < 0) {
        close(srcFd);
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    off_t offset = 0;
    ssize_t ret = sendfile(dstFd, srcFd, &offset, static_cast<size_t>(size));
    close(srcFd);
    close(dstFd);
    free(srcBuf);
    free(dstBuf);
    return (ret == size) ? ANI_TRUE : ANI_FALSE;
}

#endif
