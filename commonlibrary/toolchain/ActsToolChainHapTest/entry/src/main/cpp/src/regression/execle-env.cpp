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

// commit 2b2aff37aced66e4a50a38a14607a9b1dc0ee001 2013-10-03
// execle should pass env properly
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "test.h"

/**
 * @note This test verifies that execle() properly passes environment variables.
 *       On HarmonyOS, /bin/sh is not available and exec family functions may be
 *       restricted. This test checks for platform support and skips if unavailable.
 */
int execle_envTest(void)
{
    // First check if we can even access a shell
    const char* shell_paths[] = { "/bin/sh",
                                  "/system/bin/sh", // Android/HarmonyOS location
                                  "/bin/bash",
                                  nullptr };

    const char* shell_path = nullptr;
    for (int i = 0; shell_paths[i] != nullptr; i++) {
        if (access(shell_paths[i], F_OK | X_OK) == 0) {
            shell_path = shell_paths[i];
            break;
        }
    }

    if (shell_path == nullptr) {
        printf("execle_envTest: No shell found on this platform.\n");
        printf("execle_envTest: Skipping execle environment variable test.\n");
        return 0; // Skip test gracefully
    }

    printf("execle_envTest: Found shell at %s\n", shell_path);

    char* env[] = { "VAR=abc", "PATH=/usr/bin:/bin", 0 };

    execle(shell_path, "sh", "-c", "[ \"$VAR\" = abc ] || { echo 'env is not passed'; exit 1; }", nullptr, env);

    // If execle returns, it failed
    int saved_errno = errno;
    t_error("execle failed: %s (errno=%d)\n", strerror(saved_errno), saved_errno);
    return 1;
}
