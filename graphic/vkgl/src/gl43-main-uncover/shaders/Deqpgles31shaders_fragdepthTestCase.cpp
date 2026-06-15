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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005784,
        "KHR-GL43.shaders.fra",
        "gdepth.write.no_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005785,
        "KHR-GL43.shaders.fr",
        "agdepth.write.const");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005786,
        "KHR-GL43.shaders.fra",
        "gdepth.write.uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005787,
        "KHR-GL43.shaders.fra",
        "gdepth.write.dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005788,
        "KHR-GL43.shaders.fragd",
        "epth.write.fragcoord_z");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005789,
        "KHR-GL43.shaders.fragdepth.wr",
        "ite.uniform_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005790,
        "KHR-GL43.shaders.fragdepth.wr",
        "ite.dynamic_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005791,
        "KHR-GL43.shaders.fragdept",
        "h.write.uniform_loop_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005792,
        "KHR-GL43.shaders.fragdept",
        "h.write.write_in_function");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005793,
        "KHR-GL43.shaders.frag",
        "depth.compare.no_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005794,
        "KHR-GL43.shaders.fra",
        "gdepth.compare.const");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005795,
        "KHR-GL43.shaders.frag",
        "depth.compare.uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005796,
        "KHR-GL43.shaders.frag",
        "depth.compare.dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005797,
        "KHR-GL43.shaders.fragde",
        "pth.compare.fragcoord_z");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005798,
        "KHR-GL43.shaders.fragdepth.com",
        "pare.uniform_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005799,
        "KHR-GL43.shaders.fragdepth.com",
        "pare.dynamic_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005800,
        "KHR-GL43.shaders.fragdepth",
        ".compare.uniform_loop_write");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005801,
        "KHR-GL43.shaders.fragdepth",
        ".compare.write_in_function");
