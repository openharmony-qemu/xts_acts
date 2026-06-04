/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005774,
        "KHR-GL43.shaders.declarations.decla",
        "rations.missing_variable_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005775,
        "KHR-GL43.shaders.declarations.declar",
        "ations.missing_variable_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005776,
        "KHR-GL43.shaders.declarations.declara",
        "tions.comma_preceding_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005777,
        "KHR-GL43.shaders.declarations.declarat",
        "ions.comma_preceding_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005778,
        "KHR-GL43.shaders.declarations.declara",
        "tions.comma_following_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005779,
        "KHR-GL43.shaders.declarations.declarat",
        "ions.comma_following_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005780,
        "KHR-GL43.shaders.declarations.declarati",
        "ons.struct_missing_attribute_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005781,
        "KHR-GL43.shaders.declarations.declaratio",
        "ns.struct_missing_attribute_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005782,
        "KHR-GL43.shaders.declarations.declaration",
        "s.struct_comma_preceding_attribute_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005783,
        "KHR-GL43.shaders.declarations.declarations",
        ".struct_comma_preceding_attribute_fragment");
