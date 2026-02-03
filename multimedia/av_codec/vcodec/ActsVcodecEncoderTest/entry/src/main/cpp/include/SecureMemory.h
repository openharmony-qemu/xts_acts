/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SECURE_MEMORY_H
#define SECURE_MEMORY_H

#include <cstring>
#include <cstddef>

// 安全的内存拷贝函数
inline int memcpy_s(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == nullptr || src == nullptr) {
        return -1;
    }
    if (destMax < count) {
        return -1;
    }
    if (count == 0) {
        return 0;
    }
    memcpy(dest, src, count);
    return 0;
}

// 安全的内存设置函数
inline int memset_s(void *dest, size_t destMax, int value, size_t count)
{
    if (dest == nullptr) {
        return -1;
    }
    if (destMax < count) {
        return -1;
    }
    if (count == 0) {
        return 0;
    }
    memset(dest, value, count);
    return 0;
}

#endif // SECURE_MEMORY_H
