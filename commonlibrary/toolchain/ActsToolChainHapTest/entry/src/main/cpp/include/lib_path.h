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

#ifndef LIB_PATH_H
#define LIB_PATH_H

#if defined(__aarch64__) || defined(__arm64__) || defined(_M_ARM64)
#define LIB_ARCH_DIR "arm64"
#elif defined(__arm__) || defined(_M_ARM)
#define LIB_ARCH_DIR "arm"
#elif defined(__x86_64__) || defined(_M_X64)
#define LIB_ARCH_DIR "x86_64"
#else
#define LIB_ARCH_DIR "arm"
#endif

#define LIB_PATH_PREFIX "/data/storage/el1/bundle/libs/" LIB_ARCH_DIR "/"

#endif
