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

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010764,
        "KHR-GL40.shader_subroutine.",
        "arrayed_subroutine_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010766,
        "KHR-GL40.shader_subroutine.",
        "arrays_of_arrays_of_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010773,
        "KHR-GL40.shader_subroutine.control_flow_and_ret",
        "urned_subroutine_values_used_as_subroutine_input");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010762,
        "KHR-GL40.shader_subroutine.ei",
        "ght_subroutines_four_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010761,
        "KHR-GL40.shader_subroutine.fou",
        "r_subroutines_with_two_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010783,
        "KHR-GL40.shader_subroutine.function_",
        "overloading_forbidden_for_subroutines");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010767,
        "KHR-GL40.shader_subroutine.globals_s",
        "ampling_output_discard_function_calls");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010758,
        "KHR-GL40.shader_su",
        "broutine.min_maxes");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010776,
        "KHR-GL40.shader_subroutine",
        ".missing_subroutine_keyword");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010759,
        "KHR-GL40.shader_sub",
        "routine.name_getters");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010780,
        "KHR-GL40.shader_su",
        "broutine.recursion");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010772,
        "KHR-GL40.shader_subroutine.same_subroutine_and_subr",
        "outine_uniform_but_different_type_used_in_all_stages");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010768,
        "KHR-GL40.shader_subroutine.",
        "ssbo_atomic_image_load_store");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010763,
        "KHR-GL40.shader_subrouti",
        "ne.static_subroutine_call");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010770,
        "KHR-GL40.shader_subroutine.stru",
        "cture_parameters_program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010774,
        "KHR-GL40.shader_subrou",
        "tine.subroutine_errors");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010771,
        "KHR-GL40.shader_subroutin",
        "e.subroutine_uniform_reset");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010775,
        "KHR-GL40.shader_subroutin",
        "e.subroutine_uniform_scope");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010778,
        "KHR-GL40.shader_subroutine.subrout",
        "ine_uniform_wo_matching_subroutines");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010784,
        "KHR-GL40.shader_subroutine.subroutine_unifo",
        "rms_used_for_sampling_atomic_image_functions");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010781,
        "KHR-GL40.shader_subrou",
        "tine.subroutine_wo_body");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010765,
        "KHR-GL40.shader_subroutine.subroutines_3_subrou",
        "tine_types_and_subroutine_uniforms_one_function");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010782,
        "KHR-GL40.shader_subroutine.subroutines_canno",
        "t_be_assigned_float_int_values_or_be_compared");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010777,
        "KHR-GL40.shader_subroutine.subroutin",
        "es_incompatible_with_subroutine_type");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010785,
        "KHR-GL40.shader_subroutine.subroutines_not_allowed_a",
        "s_variables_constructors_and_argument_or_return_types");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010769,
        "KHR-GL40.shader_subroutine.subrou",
        "tines_with_separate_shader_objects");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010779,
        "KHR-GL40.shader_subroutine.two_dupli",
        "cate_functions_one_being_a_subroutine");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010760,
        "KHR-GL40.shader_subroutine.two_sub",
        "routines_single_subroutine_uniform");
