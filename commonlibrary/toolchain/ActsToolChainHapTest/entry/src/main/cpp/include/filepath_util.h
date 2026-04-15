/**
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

#ifndef __FUNCTIONALEXT_FILEPATH_UTIL_H__
#define __FUNCTIONALEXT_FILEPATH_UTIL_H__

#include <climits>
#include <cstdlib>
#include <cstring>

#include "test.h"

#define STR_SLASH "/"
#define STR_FILE_TXT "file.Txt"
#define STR_FILE_LINK_TXT "linkfile.Txt"
#define STR_FILE_IN_TXT "file_in.Txt"
#define STR_FILE_OUT_TXT "file_out.Txt"
#define STR_FILE_FROM_TXT "fromfile.Txt"
#define STR_FILE_TO_TXT "tofile.Txt"
#define STR_FILE_SWAP "swapfile"
#define STR_FILE_SYNC_TXT "sync_file_range.Txt"
#define STR_TEST_TXT "test.Txt"
#define STR_STAT_TEST_TXT "stattest.Txt"
#define STR_FREAD_TEST_TXT "Freadtest.Txt"
#define STR_FPUTC_TXT "fputc.Txt"
#define STR_VFSCANF_TXT "vfscanf.Txt"
#define STR_FACCESSAT_TEST_TXT "faccessattest.Txt"
#define STR_FCHOWNAT_TEST_TXT "fchownattest.Txt"
#define STR_WRITE_TEST_TXT "test_write.Txt"

static inline bool CopyCStrIntoBuffer(char* dst, size_t dstSize, size_t offset, const char* src)
{
    for (size_t i = 0;; ++i) {
        if (offset + i >= dstSize) {
            return false;
        }
        dst[offset + i] = src[i];
        if (src[i] == '\0') {
            return true;
        }
    }
}

static inline bool FileAbsolutePath(const char* fileName, char* path, size_t pathSize)
{
    if (!getcwd(path, pathSize)) {
        return false;
    }
    size_t pathLen = strlen(path);
    size_t fileLen = strlen(fileName);
    if (pathLen + 1U + fileLen + 1U > pathSize) {
        return false;
    }
    path[pathLen] = '/';
    return CopyCStrIntoBuffer(path, pathSize, pathLen + 1U, fileName);
}

static inline bool FileAbsoluteDir(char* path, size_t pathSize)
{
    return getcwd(path, pathSize) != nullptr;
}

#endif
