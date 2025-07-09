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

#ifndef ARKTS_ANI_TEST_NAMESPACESUPPORT_H
#define ARKTS_ANI_TEST_NAMESPACESUPPORT_H
#include "Common.h"

inline ani_int Sum([[maybe_unused]] ani_env *env, ani_int a, ani_int b) { return a + b; }

ani_int test_Namespace_FindFunction([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ASSERT_EQ(env->FindNamespace("entry.src.main.src.ets.NameSpaceSupport.ops", &ns), ANI_OK);
    ASSERT_NE(ns, nullptr);

    ani_function fn{};
    ASSERT_EQ(env->Namespace_FindFunction(ns, "int_method", "II:I", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_NAMESPACESUPPORT_H
