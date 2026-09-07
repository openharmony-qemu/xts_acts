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

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008287,
        "KHR-GL33.texture_",
        "swizzle.api_errors");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008345,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008346,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008347,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008348,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008349,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008350,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008351,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008352,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008353,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_0_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008435,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008436,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008437,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008438,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008439,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008440,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008441,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008442,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008443,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_10_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008444,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008445,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008446,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008447,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008448,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008449,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008450,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008451,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008452,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_11_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008453,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008454,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008455,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008456,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008457,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008458,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008459,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008460,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008461,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_12_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008462,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008463,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008464,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008465,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008466,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008467,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008468,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008469,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008470,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_13_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008471,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008472,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008473,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008474,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008475,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008476,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008477,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008478,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008479,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_14_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008480,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008481,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008482,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008483,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008484,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008485,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008486,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008487,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008488,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_15_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008489,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008490,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008491,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008492,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008493,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008494,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008495,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008496,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008497,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_16_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008498,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008499,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008500,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008501,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008502,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008503,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008504,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008505,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008506,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_17_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008507,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008508,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008509,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008510,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008511,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008512,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008513,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008514,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008515,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_18_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008516,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008517,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008518,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008519,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008520,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008521,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008522,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008523,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008524,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_19_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008354,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008355,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008356,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008357,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008358,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008359,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008360,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008361,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008362,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_1_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008525,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008526,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008527,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008528,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008529,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008530,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008531,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008532,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008533,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_20_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008534,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008535,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008536,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008537,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008538,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008539,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008540,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008541,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008542,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_21_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008543,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008544,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008545,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008546,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008547,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008548,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008549,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008550,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008551,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_22_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008552,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008553,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008554,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008555,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008556,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008557,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008558,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008559,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008560,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_23_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008561,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008562,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008563,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008564,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008565,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008566,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008567,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008568,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008569,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_24_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008570,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008571,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008572,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008573,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008574,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008575,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008576,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008577,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008578,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_25_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008579,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008580,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008581,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008582,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008583,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008584,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008585,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008586,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008587,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_26_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008588,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008589,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008590,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008591,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008592,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008593,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008594,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008595,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008596,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_27_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008597,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008598,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008599,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008600,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008601,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008602,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008603,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008604,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008605,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_28_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008606,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008607,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008608,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008609,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008610,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008611,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008612,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008613,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008614,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_29_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008363,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008364,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008365,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008366,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008367,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008368,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008369,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008370,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008371,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_2_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008615,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008616,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008617,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008618,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008619,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008620,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008621,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008622,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008623,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_30_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008624,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008625,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008626,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008627,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008628,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008629,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008630,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008631,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008632,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_31_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008633,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008634,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008635,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008636,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008637,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008638,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008639,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008640,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008641,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_32_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008642,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008643,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008644,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008645,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008646,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008647,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008648,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008649,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008650,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_33_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008651,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008652,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008653,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008654,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008655,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008656,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008657,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008658,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008659,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_34_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008660,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008661,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008662,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008663,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008664,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008665,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008666,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008667,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008668,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_35_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008669,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008670,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008671,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008672,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008673,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008674,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008675,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008676,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008677,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_36_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008678,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008679,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008680,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008681,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008682,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008683,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008684,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008685,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008686,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_37_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008687,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008688,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008689,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008690,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008691,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008692,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008693,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008694,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008695,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_38_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008696,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008697,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008698,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008699,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008700,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008701,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008702,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008703,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008704,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_39_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008372,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008373,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008374,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008375,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008376,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008377,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008378,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008379,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008380,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_3_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008705,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008706,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008707,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008708,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008709,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008710,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008711,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008712,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008713,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_40_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008714,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008715,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008716,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008717,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008718,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008719,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008720,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008721,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008722,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_41_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008723,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008724,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008725,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008726,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008727,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008728,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008729,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008730,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008731,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_42_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008732,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008733,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008734,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008735,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008736,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008737,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008738,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008739,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008740,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_43_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008741,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008742,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008743,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008744,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008745,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008746,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008747,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008748,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008749,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_44_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008750,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008751,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008752,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008753,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008754,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008755,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008756,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008757,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008758,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_45_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008759,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008760,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008761,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008762,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008763,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008764,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008765,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008766,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008767,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_46_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008768,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008769,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008770,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008771,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008772,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008773,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008774,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008775,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008776,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_47_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008777,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008778,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008779,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008780,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008781,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008782,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008783,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008784,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008785,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_48_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008786,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008787,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008788,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008789,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008790,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008791,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008792,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008793,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008794,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_49_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008381,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008382,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008383,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008384,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008385,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008386,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008387,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008388,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008389,
        "KHR-GL33.texture_swizzle.funct",
        "ional_format_idx_4_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008795,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008796,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008797,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008798,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008799,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008800,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008801,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008802,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008803,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_50_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008804,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008805,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008806,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008807,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008808,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008809,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008810,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008811,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008812,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_51_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008813,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008814,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008815,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008816,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008817,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008818,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008819,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008820,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008821,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_52_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008822,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008823,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008824,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008825,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008826,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008827,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008828,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008829,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008830,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_53_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008831,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008832,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008833,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008834,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008835,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008836,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008837,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008838,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008839,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_54_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008840,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008841,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008842,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008843,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008844,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008845,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008846,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008847,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008848,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_55_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008849,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008850,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008851,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008852,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008853,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008854,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008855,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008856,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008857,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_56_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008858,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008859,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008860,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008861,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008862,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008863,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008864,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008865,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008866,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_57_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008867,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008868,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008869,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008870,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008871,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008872,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_5");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008873,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_6");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008874,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_7");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008875,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_58_target_idx_8");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008876,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_0");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008877,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_1");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008878,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_2");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008879,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_3");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008880,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_4");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008881,
        "KHR-GL33.texture_swizzle.functi",
        "onal_format_idx_59_target_idx_5");
