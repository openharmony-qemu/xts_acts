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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005662,
        "KHR-GL40.shaders.arrays.",
        "constructor.float3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005663,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.float3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005664,
        "KHR-GL40.shaders.arrays.",
        "constructor.float4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005665,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.float4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005666,
        "KHR-GL40.shaders.arrays",
        ".constructor.int3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005667,
        "KHR-GL40.shaders.arrays.",
        "constructor.int3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005668,
        "KHR-GL40.shaders.arrays",
        ".constructor.int4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005669,
        "KHR-GL40.shaders.arrays.",
        "constructor.int4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005670,
        "KHR-GL40.shaders.arrays.",
        "constructor.bool3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005671,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.bool3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005672,
        "KHR-GL40.shaders.arrays.",
        "constructor.bool4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005673,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.bool4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005674,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.struct3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005675,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.struct3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005676,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.struct4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005677,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.struct4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005678,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005679,
        "KHR-GL40.shaders.arrays.con",
        "structor.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005680,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005681,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005682,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005683,
        "KHR-GL40.shaders.arrays.con",
        "structor.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005684,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005685,
        "KHR-GL40.shaders.arrays.con",
        "structor.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005686,
        "KHR-GL40.shaders.arrays.c",
        "onstructor.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005687,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005688,
        "KHR-GL40.shaders.arrays.co",
        "nstructor.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005689,
        "KHR-GL40.shaders.arrays.con",
        "structor.bool_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005690,
        "KHR-GL40.shaders.arra",
        "ys.return.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005691,
        "KHR-GL40.shaders.array",
        "s.return.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005692,
        "KHR-GL40.shaders.arr",
        "ays.return.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005693,
        "KHR-GL40.shaders.arra",
        "ys.return.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005694,
        "KHR-GL40.shaders.arra",
        "ys.return.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005695,
        "KHR-GL40.shaders.array",
        "s.return.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005696,
        "KHR-GL40.shaders.arrays.",
        "return.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005697,
        "KHR-GL40.shaders.arrays.r",
        "eturn.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005698,
        "KHR-GL40.shaders.array",
        "s.return.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005699,
        "KHR-GL40.shaders.arrays",
        ".return.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005700,
        "KHR-GL40.shaders.arrays",
        ".return.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005701,
        "KHR-GL40.shaders.arrays.",
        "return.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005702,
        "KHR-GL40.shaders.arrays",
        ".return.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005703,
        "KHR-GL40.shaders.arrays.",
        "return.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005704,
        "KHR-GL40.shaders.arrays.",
        "return.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005705,
        "KHR-GL40.shaders.arrays.r",
        "eturn.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005706,
        "KHR-GL40.shaders.arrays",
        ".return.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005707,
        "KHR-GL40.shaders.arrays.",
        "return.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005708,
        "KHR-GL40.shaders.arrays",
        ".return.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005709,
        "KHR-GL40.shaders.arrays.",
        "return.bool_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005710,
        "KHR-GL40.shaders.arrays.unn",
        "amed_parameter.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005711,
        "KHR-GL40.shaders.arrays.unna",
        "med_parameter.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005712,
        "KHR-GL40.shaders.arrays.un",
        "named_parameter.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005713,
        "KHR-GL40.shaders.arrays.unn",
        "amed_parameter.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005714,
        "KHR-GL40.shaders.arrays.un",
        "named_parameter.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005715,
        "KHR-GL40.shaders.arrays.unn",
        "amed_parameter.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005716,
        "KHR-GL40.shaders.arrays.unn",
        "amed_parameter.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005717,
        "KHR-GL40.shaders.arrays.unna",
        "med_parameter.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005718,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005719,
        "KHR-GL40.shaders.arrays.unname",
        "d_parameter.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005720,
        "KHR-GL40.shaders.arrays.unna",
        "med_parameter.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005721,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005722,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005723,
        "KHR-GL40.shaders.arrays.unname",
        "d_parameter.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005724,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005725,
        "KHR-GL40.shaders.arrays.unname",
        "d_parameter.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005726,
        "KHR-GL40.shaders.arrays.unna",
        "med_parameter.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005727,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005728,
        "KHR-GL40.shaders.arrays.unnam",
        "ed_parameter.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005729,
        "KHR-GL40.shaders.arrays.unname",
        "d_parameter.bool_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005730,
        "KHR-GL40.shaders.arrays.declara",
        "tion.implicit_size_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005731,
        "KHR-GL40.shaders.arrays.declarat",
        "ion.implicit_size_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005732,
        "KHR-GL40.shaders.arrays.declar",
        "ation.implicit_size_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005733,
        "KHR-GL40.shaders.arrays.declara",
        "tion.implicit_size_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005734,
        "KHR-GL40.shaders.arrays.declar",
        "ation.implicit_size_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005735,
        "KHR-GL40.shaders.arrays.declara",
        "tion.implicit_size_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005736,
        "KHR-GL40.shaders.arrays.declara",
        "tion.implicit_size_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005737,
        "KHR-GL40.shaders.arrays.declarat",
        "ion.implicit_size_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005738,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005739,
        "KHR-GL40.shaders.arrays.declaratio",
        "n.implicit_size_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005740,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005741,
        "KHR-GL40.shaders.arrays.declaratio",
        "n.implicit_size_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005742,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_bool_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005743,
        "KHR-GL40.shaders.arrays.declaratio",
        "n.implicit_size_bool_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005744,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005745,
        "KHR-GL40.shaders.arrays.declaratio",
        "n.implicit_size_float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005746,
        "KHR-GL40.shaders.arrays.declarat",
        "ion.implicit_size_int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005747,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005748,
        "KHR-GL40.shaders.arrays.declarati",
        "on.implicit_size_bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005749,
        "KHR-GL40.shaders.arrays.declaratio",
        "n.implicit_size_bool_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005750,
        "KHR-GL40.shaders.arrays.declaration.",
        "constant_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005751,
        "KHR-GL40.shaders.arrays.declaration.c",
        "onstant_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005752,
        "KHR-GL40.shaders.arrays.declaration.c",
        "onstant_expression_array_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005753,
        "KHR-GL40.shaders.arrays.declaration.co",
        "nstant_expression_array_access_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005754,
        "KHR-GL40.shaders.arrays.declaration.d",
        "ynamic_expression_array_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005755,
        "KHR-GL40.shaders.arrays.declaration.dy",
        "namic_expression_array_access_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005756,
        "KHR-GL40.shaders.arra",
        "ys.length.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005757,
        "KHR-GL40.shaders.array",
        "s.length.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005758,
        "KHR-GL40.shaders.arr",
        "ays.length.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005759,
        "KHR-GL40.shaders.arra",
        "ys.length.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005760,
        "KHR-GL40.shaders.arra",
        "ys.length.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005761,
        "KHR-GL40.shaders.array",
        "s.length.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005762,
        "KHR-GL40.shaders.array",
        "s.length.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005763,
        "KHR-GL40.shaders.arrays",
        ".length.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005764,
        "KHR-GL40.shaders.arrays.invalid",
        ".multidimensional_array1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005765,
        "KHR-GL40.shaders.arrays.invalid.",
        "multidimensional_array1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005766,
        "KHR-GL40.shaders.arrays.invalid",
        ".multidimensional_array2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005767,
        "KHR-GL40.shaders.arrays.invalid.",
        "multidimensional_array2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005768,
        "KHR-GL40.shaders.arrays.invalid.dy",
        "namic_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005769,
        "KHR-GL40.shaders.arrays.invalid.dyn",
        "amic_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005770,
        "KHR-GL40.shaders.arrays.inval",
        "id.constructor_c-style1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005771,
        "KHR-GL40.shaders.arrays.invali",
        "d.constructor_c-style1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005772,
        "KHR-GL40.shaders.arrays.inval",
        "id.constructor_c-style2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005773,
        "KHR-GL40.shaders.arrays.invali",
        "d.constructor_c-style2_fragment");
