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

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <libgen.h>
#include "test.h"

#define t(PATH, want)                                                             \
    {                                                                             \
        char tmp[100];                                                            \
        (void)snprintf(tmp, sizeof(tmp), "%s", PATH);                             \
        char* got = dirname(tmp);                                                 \
        if (strcmp(want, got) != 0) {                                             \
            t_error("dirname(\"%s\") got \"%s\" want \"%s\"\n", PATH, got, want); \
        }                                                                         \
    }

int DirnameTest()
{
    if (strcmp(dirname(nullptr), ".") != 0) {
        t_error("dirname(0) returned \"%s\"; expected \".\"\n", dirname(nullptr));
    }
    t("", ".");
    t("/usr/lib", "/usr");
    t("/usr/", "/");
    t("usr", ".");
    t("usr/", ".");
    t("/", "/");
    t("///", "/");
    t(".", ".");
    t("..", ".");
    return T_STATUS;
}
