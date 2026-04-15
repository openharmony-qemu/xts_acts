/*
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

#include <csignal>
#include "functionalext.h"

namespace {
constexpr int K_EXPECTED_SIG_RT_MAX = 64;
} // namespace

/*
 * @tc.name      : LibcCurrentSigrtmax0100
 * @tc.desc      : Verify that the number of available signals can be obtained
 * @tc.level     : Level 0
 */
void LibcCurrentSigrtmax0100(void)
{
    int result = __libc_current_sigrtmax();
    EXPECT_EQ("LibcCurrentSigrtmax0100", result, K_EXPECTED_SIG_RT_MAX);
}

static int LibcCurrentSigrtmaxTestWithArgs(int argc, char* argv[])
{
    LibcCurrentSigrtmax0100();

    return T_STATUS;
}

int LibcCurrentSigrtmaxTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return LibcCurrentSigrtmaxTestWithArgs(1, libcArgvStub);
}
