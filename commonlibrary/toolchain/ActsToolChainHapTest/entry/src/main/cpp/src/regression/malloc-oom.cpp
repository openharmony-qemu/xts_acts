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

// malloc should set errno on oom
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"

int malloc_oomTest()
{
    int status = SUCCESS_CODE;
#define t_status status

    if (t_memfill() < 0)
        LibcTestError(&status, "memfill failed\n");

    errno = 0;
    if (malloc(50000))
        LibcTestError(&status, "malloc was successful\n");
    if (errno != ENOMEM)
        LibcTestError(&status, "expected ENOMEM, got %s\n", strerror(errno));

    _Exit(t_status);
    return status;
#undef t_status
}
