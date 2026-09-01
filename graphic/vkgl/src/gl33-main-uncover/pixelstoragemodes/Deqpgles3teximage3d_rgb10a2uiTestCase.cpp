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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009672,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb10a2ui.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009673,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb10a2ui.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009674,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009675,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb10a2ui.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009676,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009677,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009678,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb10a2ui.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009679,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009680,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009681,
        "KHR-GL33.pixelstoragemodes.",
        "teximage3d.rgb10a2ui.16_16_4");
