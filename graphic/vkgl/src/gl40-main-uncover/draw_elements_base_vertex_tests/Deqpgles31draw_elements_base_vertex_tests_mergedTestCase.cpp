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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009884,
        "KHR-GL40.draw_elements_base_v",
        "ertex_tests.AEP_shader_stages");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009882,
        "KHR-GL40.draw_elements_base_ve",
        "rtex_tests.basevertex_behavior1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009883,
        "KHR-GL40.draw_elements_base_ve",
        "rtex_tests.basevertex_behavior2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009888,
        "KHR-GL40.draw_elements_base_ver",
        "tex_tests.invalid_count_argument");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009889,
        "KHR-GL40.draw_elements_base_vertex_",
        "tests.invalid_instancecount_argument");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009890,
        "KHR-GL40.draw_elements_base_ver",
        "tex_tests.invalid_mode_argument");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009891,
        "KHR-GL40.draw_elements_base_verte",
        "x_tests.invalid_primcount_argument");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009892,
        "KHR-GL40.draw_elements_base_vertex",
        "_tests.invalid_start_end_arguments");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009893,
        "KHR-GL40.draw_elements_base_ver",
        "tex_tests.invalid_type_argument");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009886,
        "KHR-GL40.draw_elements_b",
        "ase_vertex_tests.overflow");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009885,
        "KHR-GL40.draw_elements_ba",
        "se_vertex_tests.underflow");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009887,
        "KHR-GL40.draw_elements_base_",
        "vertex_tests.valid_active_tf");
