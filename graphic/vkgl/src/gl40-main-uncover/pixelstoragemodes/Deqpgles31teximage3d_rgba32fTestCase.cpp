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
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009642,
        "KHR-GL40.pixelstoragemode",
        "s.teximage3d.rgba32f.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009643,
        "KHR-GL40.pixelstoragemode",
        "s.teximage3d.rgba32f.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009644,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009645,
        "KHR-GL40.pixelstoragemode",
        "s.teximage3d.rgba32f.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009646,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009647,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009648,
        "KHR-GL40.pixelstoragemode",
        "s.teximage3d.rgba32f.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009649,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009650,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009651,
        "KHR-GL40.pixelstoragemodes",
        ".teximage3d.rgba32f.16_16_4");
