/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

/*
 * Stub for canIUse() from capability API header (syscap; name fixed by SDK).
 * SDK declares it with @library NA (no native .so); runtime may not provide it
 * when loading this test .so. Providing a local implementation allows the
 * shared library to load so NAPI tests can run.
 * Returns true so capability checks pass; individual tests may still fail
 * on devices without the actual capability.
 * Name canIUse kept for capability API compatibility (G.NAM.03).
 *
 * G.NAM.03-CPP waiver: canIUse is the official syscap API symbol from HarmonyOS SDK
 * (syscap_ndk.h). Renaming to CanIUse would break ABI and cause undefined symbol at link.
 */
#include <stdbool.h>

/* G.NAM.03-CPP: name mandated by syscap SDK, do not rename */
bool canIUse(const char* cap)
{
    (void)cap;
    return true;
}
