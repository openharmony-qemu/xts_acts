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
#include "../ActsDeqpgles310011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010755,
        "KHR-GL40.clip_control_A",
        "RB.depth_mode_one_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010754,
        "KHR-GL40.clip_control_AR",
        "B.depth_mode_zero_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010752,
        "KHR-GL40.clip_co",
        "ntrol_ARB.errors");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010756,
        "KHR-GL40.clip_contr",
        "ol_ARB.face_culling");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010750,
        "KHR-GL40.clip_co",
        "ntrol_ARB.initial");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010751,
        "KHR-GL40.clip_cont",
        "rol_ARB.modify_get");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010753,
        "KHR-GL40.clip_co",
        "ntrol_ARB.origin");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010757,
        "KHR-GL40.clip_contro",
        "l_ARB.viewport_bounds");
