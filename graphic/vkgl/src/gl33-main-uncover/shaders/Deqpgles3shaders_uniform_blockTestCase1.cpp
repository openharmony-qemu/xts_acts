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

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007691,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007692,
        "KHR-GL33.shaders.uniform_block",
        ".single_basic_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007693,
        "KHR-GL33.shaders.uniform_block.sing",
        "le_basic_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007694,
        "KHR-GL33.shaders.uniform_block.single",
        "_basic_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007695,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007696,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007697,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007698,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007699,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007700,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007701,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007702,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007703,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007704,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007705,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007706,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007707,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007708,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007709,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007710,
        "KHR-GL33.shaders.uniform_block.",
        "single_basic_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007711,
        "KHR-GL33.shaders.uniform_block.singl",
        "e_basic_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007712,
        "KHR-GL33.shaders.uniform_block.single_",
        "basic_array.std140.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007713,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_struct.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007714,
        "KHR-GL33.shaders.uniform_block.single_str",
        "uct.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007715,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_struct.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007716,
        "KHR-GL33.shaders.uniform_block.single_str",
        "uct.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007717,
        "KHR-GL33.shaders.uniform_block.sin",
        "gle_struct.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007718,
        "KHR-GL33.shaders.uniform_block.single_str",
        "uct.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007719,
        "KHR-GL33.shaders.uniform_block.single_st",
        "ruct.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007720,
        "KHR-GL33.shaders.uniform_block.single_st",
        "ruct.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007721,
        "KHR-GL33.shaders.uniform_block.single_st",
        "ruct.single_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007722,
        "KHR-GL33.shaders.uniform_block.single",
        "_struct_array.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007723,
        "KHR-GL33.shaders.uniform_block.single_struct",
        "_array.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007724,
        "KHR-GL33.shaders.uniform_block.single",
        "_struct_array.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007725,
        "KHR-GL33.shaders.uniform_block.single_struct",
        "_array.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007726,
        "KHR-GL33.shaders.uniform_block.single",
        "_struct_array.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007727,
        "KHR-GL33.shaders.uniform_block.single_struct",
        "_array.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007728,
        "KHR-GL33.shaders.uniform_block.single_struc",
        "t_array.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007729,
        "KHR-GL33.shaders.uniform_block.single_struc",
        "t_array.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007730,
        "KHR-GL33.shaders.uniform_block.single_struc",
        "t_array.single_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007731,
        "KHR-GL33.shaders.uniform_block.single",
        "_nested_struct.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007732,
        "KHR-GL33.shaders.uniform_block.single_nested_",
        "struct.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007733,
        "KHR-GL33.shaders.uniform_block.single",
        "_nested_struct.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007734,
        "KHR-GL33.shaders.uniform_block.single_nested_",
        "struct.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007735,
        "KHR-GL33.shaders.uniform_block.single",
        "_nested_struct.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007736,
        "KHR-GL33.shaders.uniform_block.single_nested_",
        "struct.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007737,
        "KHR-GL33.shaders.uniform_block.single_neste",
        "d_struct.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007738,
        "KHR-GL33.shaders.uniform_block.single_neste",
        "d_struct.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007739,
        "KHR-GL33.shaders.uniform_block.single_neste",
        "d_struct.single_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007740,
        "KHR-GL33.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007741,
        "KHR-GL33.shaders.uniform_block.single_nested_str",
        "uct_array.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007742,
        "KHR-GL33.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007743,
        "KHR-GL33.shaders.uniform_block.single_nested_str",
        "uct_array.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007744,
        "KHR-GL33.shaders.uniform_block.single_ne",
        "sted_struct_array.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007745,
        "KHR-GL33.shaders.uniform_block.single_nested_str",
        "uct_array.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007746,
        "KHR-GL33.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007747,
        "KHR-GL33.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007748,
        "KHR-GL33.shaders.uniform_block.single_nested_s",
        "truct_array.single_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007749,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007750,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007751,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007752,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007753,
        "KHR-GL33.shaders.uniform_block.in",
        "stance_array_basic_type.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007754,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007755,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007756,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007757,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007758,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007759,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007760,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007761,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007762,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007763,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007764,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007765,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007766,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007767,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007768,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007769,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007770,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007771,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007772,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007773,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007774,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007775,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007776,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007777,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007778,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007779,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007780,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007781,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007782,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007783,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007784,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007785,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007786,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007787,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007788,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007789,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007790,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007791,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.shared.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007792,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007793,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007794,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007795,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007796,
        "KHR-GL33.shaders.uniform_block.in",
        "stance_array_basic_type.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007797,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007798,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007799,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007800,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007801,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007802,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007803,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007804,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007805,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007806,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007807,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007808,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007809,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007810,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007811,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007812,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007813,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007814,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007815,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007816,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007817,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007818,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007819,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007820,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007821,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007822,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007823,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007824,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007825,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007826,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007827,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007828,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007829,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007830,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007831,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007832,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007833,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007834,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.packed.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007835,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007836,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007837,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007838,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007839,
        "KHR-GL33.shaders.uniform_block.in",
        "stance_array_basic_type.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007840,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007841,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007842,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007843,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007844,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007845,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007846,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007847,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007848,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007849,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007850,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007851,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007852,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007853,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007854,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007855,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007856,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007857,
        "KHR-GL33.shaders.uniform_block.ins",
        "tance_array_basic_type.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007858,
        "KHR-GL33.shaders.uniform_block.instance",
        "_array_basic_type.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007859,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007860,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007861,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007862,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007863,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007864,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007865,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007866,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007867,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007868,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007869,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007870,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007871,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007872,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007873,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007874,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007875,
        "KHR-GL33.shaders.uniform_block.inst",
        "ance_array_basic_type.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007876,
        "KHR-GL33.shaders.uniform_block.instance_",
        "array_basic_type.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007877,
        "KHR-GL33.shaders.uniform_block.instance_a",
        "rray_basic_type.std140.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007878,
        "KHR-GL33.shaders.uniform_block.multi_ba",
        "sic_types.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007879,
        "KHR-GL33.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007880,
        "KHR-GL33.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007881,
        "KHR-GL33.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007882,
        "KHR-GL33.shaders.uniform_block.multi_ba",
        "sic_types.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007883,
        "KHR-GL33.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007884,
        "KHR-GL33.shaders.uniform_block.multi_ba",
        "sic_types.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007885,
        "KHR-GL33.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007886,
        "KHR-GL33.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007887,
        "KHR-GL33.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007888,
        "KHR-GL33.shaders.uniform_block.multi_",
        "basic_types.single_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007889,
        "KHR-GL33.shaders.uniform_block.multi_",
        "basic_types.single_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007890,
        "KHR-GL33.shaders.uniform_block.multi_basic_ty",
        "pes.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007891,
        "KHR-GL33.shaders.uniform_block.multi_basic_t",
        "ypes.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007892,
        "KHR-GL33.shaders.uniform_block.multi_",
        "basic_types.single_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007893,
        "KHR-GL33.shaders.uniform_block.multi_basic_ty",
        "pes.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007894,
        "KHR-GL33.shaders.uniform_block.multi_",
        "basic_types.single_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007895,
        "KHR-GL33.shaders.uniform_block.multi_",
        "basic_types.single_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007896,
        "KHR-GL33.shaders.uniform_block.multi_basic_ty",
        "pes.single_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007897,
        "KHR-GL33.shaders.uniform_block.multi_basic_t",
        "ypes.single_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007898,
        "KHR-GL33.shaders.uniform_block.multi_nes",
        "ted_struct.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007899,
        "KHR-GL33.shaders.uniform_block.multi_ne",
        "sted_struct.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007900,
        "KHR-GL33.shaders.uniform_block.multi_nested_str",
        "uct.per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007901,
        "KHR-GL33.shaders.uniform_block.multi_nested_str",
        "uct.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007902,
        "KHR-GL33.shaders.uniform_block.multi_nes",
        "ted_struct.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007903,
        "KHR-GL33.shaders.uniform_block.multi_nested_str",
        "uct.per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007904,
        "KHR-GL33.shaders.uniform_block.multi_nes",
        "ted_struct.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007905,
        "KHR-GL33.shaders.uniform_block.multi_ne",
        "sted_struct.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007906,
        "KHR-GL33.shaders.uniform_block.multi_nested_str",
        "uct.per_block_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007907,
        "KHR-GL33.shaders.uniform_block.multi_nested_str",
        "uct.per_block_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007908,
        "KHR-GL33.shaders.uniform_block.multi_n",
        "ested_struct.single_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007909,
        "KHR-GL33.shaders.uniform_block.multi_n",
        "ested_struct.single_buffer.shared_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007910,
        "KHR-GL33.shaders.uniform_block.multi_nested_st",
        "ruct.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007911,
        "KHR-GL33.shaders.uniform_block.multi_nested_s",
        "truct.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007912,
        "KHR-GL33.shaders.uniform_block.multi_n",
        "ested_struct.single_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007913,
        "KHR-GL33.shaders.uniform_block.multi_nested_st",
        "ruct.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007914,
        "KHR-GL33.shaders.uniform_block.multi_n",
        "ested_struct.single_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007915,
        "KHR-GL33.shaders.uniform_block.multi_n",
        "ested_struct.single_buffer.std140_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007916,
        "KHR-GL33.shaders.uniform_block.multi_nested_st",
        "ruct.single_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007917,
        "KHR-GL33.shaders.uniform_block.multi_nested_s",
        "truct.single_buffer.std140_instance_array_both");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007918,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007919,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007920,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007921,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007922,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007923,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007924,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007925,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007926,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007927,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.scalar_types.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007928,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007929,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007930,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007931,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007932,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007933,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007934,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007935,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007936,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007937,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.vector_types.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007938,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007939,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007940,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007941,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007942,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007943,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007944,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007945,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007946,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007947,
        "KHR-GL33.shaders.uniform_",
        "block.random.basic_types.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007948,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007949,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007950,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007951,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007952,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007953,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007954,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007955,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007956,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007957,
        "KHR-GL33.shaders.uniform_b",
        "lock.random.basic_arrays.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007958,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007959,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007960,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007961,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007962,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007963,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007964,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007965,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007966,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007967,
        "KHR-GL33.shaders.uniform_block",
        ".random.basic_instance_arrays.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007968,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007969,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007970,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007971,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007972,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007973,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007974,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007975,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007976,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007977,
        "KHR-GL33.shaders.uniform_bl",
        "ock.random.nested_structs.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007978,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007979,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007980,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007981,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007982,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007983,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007984,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007985,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007986,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007987,
        "KHR-GL33.shaders.uniform_block",
        ".random.nested_structs_arrays.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007988,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007989,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007990,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007991,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007992,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007993,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007994,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007995,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007996,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007997,
        "KHR-GL33.shaders.uniform_block.rand",
        "om.nested_structs_instance_arrays.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007998,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007999,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008000,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008001,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008002,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008003,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008004,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008005,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008006,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008007,
        "KHR-GL33.shaders.uniform_block.random.",
        "nested_structs_arrays_instance_arrays.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008008,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008009,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008010,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008011,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008012,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008013,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008014,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008015,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008016,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008017,
        "KHR-GL33.shaders.uniform_block",
        ".random.all_per_block_buffers.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008018,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.10");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008019,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.11");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008020,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.12");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008021,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.13");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008022,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.14");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008023,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.15");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008024,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.16");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008025,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.17");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008026,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.18");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008027,
        "KHR-GL33.shaders.uniform_block.",
        "random.all_per_block_buffers.19");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008028,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.0");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008029,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.1");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008030,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.2");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008031,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.3");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008032,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.4");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008033,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.5");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008034,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.6");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008035,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.7");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008036,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.8");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008037,
        "KHR-GL33.shaders.uniform_blo",
        "ck.random.all_shared_buffer.9");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008038,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.10");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008039,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.11");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008040,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.12");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008041,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.13");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008042,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.14");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008043,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.15");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008044,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.16");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008045,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.17");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008046,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.18");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008047,
        "KHR-GL33.shaders.uniform_bloc",
        "k.random.all_shared_buffer.19");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_008048,
        "KHR-GL33.shaders.uniform_",
        "block.common.name_matching");
