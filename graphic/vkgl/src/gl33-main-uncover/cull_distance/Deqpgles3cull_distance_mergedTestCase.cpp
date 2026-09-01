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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008069,
        "KHR-GL33.cull_d",
        "istance.coverage");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008070,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008071,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008072,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008073,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008074,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008075,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008076,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008077,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_0_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008078,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008079,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008080,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008081,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008082,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008083,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008084,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008085,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_0_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008086,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008087,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008088,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008089,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008090,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008091,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008092,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008093,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_0_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008094,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008095,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008096,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008097,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008098,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008099,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008100,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008101,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_1_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008102,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008103,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008104,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008105,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008106,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008107,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008108,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008109,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_1_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008110,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008111,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008112,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008113,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008114,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008115,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008116,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008117,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_1_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008118,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008119,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008120,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008121,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008122,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008123,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008124,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008125,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_2_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008126,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008127,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008128,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008129,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008130,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008131,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008132,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008133,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_2_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008134,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008135,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008136,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008137,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008138,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008139,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008140,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008141,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_2_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008142,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008143,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008144,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008145,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008146,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008147,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008148,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008149,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_3_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008150,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008151,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008152,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008153,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008154,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008155,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008156,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008157,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_3_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008158,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008159,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008160,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008161,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008162,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008163,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008164,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008165,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_3_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008166,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008167,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008168,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008169,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008170,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008171,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008172,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008173,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_4_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008174,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008175,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008176,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008177,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008178,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008179,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008180,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008181,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_4_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008182,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008183,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008184,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008185,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008186,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008187,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008188,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008189,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_4_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008190,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008191,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008192,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008193,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008194,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008195,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008196,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008197,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_5_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008198,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008199,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008200,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008201,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008202,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008203,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008204,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008205,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_5_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008206,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008207,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008208,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008209,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008210,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008211,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008212,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008213,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_5_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008214,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008215,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008216,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008217,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008218,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008219,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008220,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008221,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_6_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008222,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008223,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008224,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008225,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008226,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008227,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008228,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008229,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_6_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008230,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008231,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008232,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008233,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008234,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008235,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008236,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008237,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_6_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008238,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008239,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008240,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008241,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008242,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008243,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008244,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008245,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_7_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008246,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008247,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008248,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008249,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008250,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008251,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008252,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008253,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_7_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008254,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008255,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008256,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008257,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008258,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008259,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008260,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008261,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_7_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008262,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008263,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008264,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008265,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008266,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008267,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008268,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008269,
        "KHR-GL33.cull_distance.functional_test_i",
        "tem_8_primitive_mode_lines_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008270,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008271,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008272,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008273,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008274,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008275,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008276,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008277,
        "KHR-GL33.cull_distance.functional_test_it",
        "em_8_primitive_mode_points_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008278,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008279,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008280,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008281,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008282,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008283,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008284,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008285,
        "KHR-GL33.cull_distance.functional_test_ite",
        "m_8_primitive_mode_triangles_max_culldist_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008286,
        "KHR-GL33.cull_d",
        "istance.negative");
