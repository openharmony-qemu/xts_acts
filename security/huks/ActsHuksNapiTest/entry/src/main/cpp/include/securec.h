/*
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

#ifndef SECUREC_H
#define SECUREC_H

#include <cstring>
#include <algorithm>

// errno codes
#define EOK 0
#define EINVAL 22
#define ERANGE 34

// memcpy_s: 安全内存复制
inline int memcpy_s(void* dest, size_t destMax, const void* src, size_t count)
{
    if (dest == nullptr || src == nullptr) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    std::memcpy(dest, src, count);
    return EOK;
}

// strcpy_s: 安全字符串复制
inline int strcpy_s(char* dest, size_t destMax, const char* src)
{
    if (dest == nullptr || src == nullptr) {
        return EINVAL;
    }
    size_t srcLen = std::strlen(src);
    if (srcLen >= destMax) {
        return ERANGE;
    }
    std::strcpy(dest, src);
    return EOK;
}

// strcat_s: 安全字符串连接
inline int strcat_s(char* dest, size_t destMax, const char* src)
{
    if (dest == nullptr || src == nullptr) {
        return EINVAL;
    }
    size_t destLen = std::strlen(dest);
    size_t srcLen = std::strlen(src);
    if (destLen + srcLen >= destMax) {
        return ERANGE;
    }
    std::strcat(dest, src);
    return EOK;
}

// memset_s: 安全内存清零
inline int memset_s(void* dest, size_t destMax, int c, size_t count)
{
    if (dest == nullptr) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    std::memset(dest, c, count);
    return EOK;
}

#endif // SECUREC_H
