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
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007221,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007222,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007223,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007224,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007225,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007226,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007227,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007228,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007229,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007230,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007231,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007232,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007233,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007234,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007235,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007236,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007237,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007238,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007239,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007240,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007241,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007242,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007243,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007244,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007245,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007246,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007247,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007248,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007249,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007250,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007251,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007252,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007253,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007254,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007255,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007256,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007257,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007258,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007259,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007260,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007261,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007262,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007263,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007264,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007265,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007266,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007267,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007268,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007269,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007270,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007271,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007272,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007273,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007274,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007275,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007276,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007277,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007278,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007279,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007280,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007281,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007282,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007283,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007284,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007285,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007286,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007287,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007288,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007289,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007290,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007291,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007292,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007293,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007294,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007295,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007296,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007297,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007298,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007299,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007300,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007301,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007302,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007303,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007304,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007305,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007306,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007307,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007308,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007309,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007310,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007311,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007312,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007313,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007314,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007315,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007316,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007317,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007318,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007319,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007320,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007321,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007322,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007323,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007324,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007325,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007326,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007327,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007328,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007329,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007330,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007331,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007332,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007333,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007334,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.shared.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007335,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.shared.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007336,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007337,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007338,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007339,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007340,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007341,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007342,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007343,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007344,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007345,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007346,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007347,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007348,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007349,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007350,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007351,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007352,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007353,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007354,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007355,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007356,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007357,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007358,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007359,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007360,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007361,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007362,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007363,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007364,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007365,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007366,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007367,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007368,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007369,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007370,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007371,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007372,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007373,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007374,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007375,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007376,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007377,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007378,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007379,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007380,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007381,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007382,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007383,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007384,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007385,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007386,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007387,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007388,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007389,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007390,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007391,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007392,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007393,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007394,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007395,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007396,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007397,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007398,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007399,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007400,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007401,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007402,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007403,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007404,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007405,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007406,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007407,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007408,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007409,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007410,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007411,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007412,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007413,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007414,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007415,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007416,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007417,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007418,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007419,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007420,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007421,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007422,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007423,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007424,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007425,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007426,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007427,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007428,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007429,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007430,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007431,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007432,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007433,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007434,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007435,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007436,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007437,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007438,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007439,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007440,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007441,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007442,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007443,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007444,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007445,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007446,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007447,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007448,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007449,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007450,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007451,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007452,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007453,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007454,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007455,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.packed.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007456,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.packed.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007457,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007458,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007459,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007460,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007461,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007462,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007463,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007464,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007465,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007466,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007467,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007468,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007469,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007470,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007471,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007472,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007473,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007474,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007475,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007476,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007477,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007478,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007479,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007480,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007481,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007482,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007483,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007484,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007485,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007486,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007487,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007488,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007489,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007490,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007491,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007492,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007493,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007494,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007495,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007496,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007497,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007498,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007499,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007500,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007501,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007502,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007503,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007504,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007505,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007506,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007507,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007508,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007509,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007510,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007511,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007512,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007513,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007514,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007515,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007516,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007517,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007518,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007519,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007520,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007521,
        "KHR-GL33.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007522,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007523,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007524,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007525,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007526,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007527,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007528,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007529,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007530,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007531,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007532,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007533,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007534,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007535,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007536,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007537,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007538,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007539,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007540,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007541,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007542,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007543,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007544,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007545,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007546,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007547,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007548,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007549,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007550,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007551,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007552,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007553,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007554,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007555,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007556,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007557,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007558,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007559,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007560,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007561,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007562,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007563,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007564,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007565,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007566,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007567,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007568,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007569,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007570,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007571,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007572,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007573,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007574,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007575,
        "KHR-GL33.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007576,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_type.std140.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007577,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_basic_type.std140.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007578,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007579,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007580,
        "KHR-GL33.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007581,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007582,
        "KHR-GL33.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007583,
        "KHR-GL33.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007584,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007585,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007586,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007587,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007588,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007589,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007590,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007591,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007592,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007593,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007594,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007595,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007596,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007597,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007598,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007599,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007600,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007601,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007602,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007603,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007604,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007605,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007606,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007607,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007608,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007609,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007610,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007611,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007612,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007613,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007614,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007615,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007616,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007617,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007618,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007619,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007620,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007621,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007622,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007623,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007624,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007625,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007626,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.shared.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007627,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007628,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007629,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007630,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007631,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007632,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007633,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007634,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007635,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007636,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007637,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007638,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007639,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007640,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007641,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007642,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007643,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007644,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007645,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007646,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007647,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007648,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007649,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007650,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007651,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007652,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007653,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007654,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007655,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007656,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007657,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007658,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007659,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007660,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007661,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007662,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007663,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007664,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007665,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007666,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007667,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007668,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007669,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.packed.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007670,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007671,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007672,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007673,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007674,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007675,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007676,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007677,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007678,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007679,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007680,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007681,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007682,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007683,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007684,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007685,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007686,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007687,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007688,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007689,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007690,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat3");
