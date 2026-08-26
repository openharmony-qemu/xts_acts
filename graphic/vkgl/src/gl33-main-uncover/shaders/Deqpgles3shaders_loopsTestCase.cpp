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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006099,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006100,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006101,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006102,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006103,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006104,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006105,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006106,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006107,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006108,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006109,
        "KHR-GL33.shaders.loops.for_const",
        "ant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006110,
        "KHR-GL33.shaders.loops.for_consta",
        "nt_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006111,
        "KHR-GL33.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006112,
        "KHR-GL33.shaders.loops.for_constant_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006113,
        "KHR-GL33.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006114,
        "KHR-GL33.shaders.loops.for_constant_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006115,
        "KHR-GL33.shaders.loops.for_constant_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006116,
        "KHR-GL33.shaders.loops.for_constant_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006117,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006118,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006119,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006120,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006121,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006122,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006123,
        "KHR-GL33.shaders.loops.for_consta",
        "nt_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006124,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006125,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006126,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006127,
        "KHR-GL33.shaders.loops.for_constant_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006128,
        "KHR-GL33.shaders.loops.for_constant_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006129,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006130,
        "KHR-GL33.shaders.loops.for_constant_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006131,
        "KHR-GL33.shaders.loops.for_constant_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006132,
        "KHR-GL33.shaders.loops.for_constant_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006133,
        "KHR-GL33.shaders.loops.for_consta",
        "nt_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006134,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006135,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006136,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006137,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006138,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006139,
        "KHR-GL33.shaders.loops.for_constant_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006140,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006141,
        "KHR-GL33.shaders.loops.for_consta",
        "nt_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006142,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006143,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006144,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006145,
        "KHR-GL33.shaders.loops.for_constant_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006146,
        "KHR-GL33.shaders.loops.for_constant_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006147,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006148,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006149,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006150,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006151,
        "KHR-GL33.shaders.loops.for_cons",
        "tant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006152,
        "KHR-GL33.shaders.loops.for_const",
        "ant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006153,
        "KHR-GL33.shaders.loops.for_con",
        "stant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006154,
        "KHR-GL33.shaders.loops.for_cons",
        "tant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006155,
        "KHR-GL33.shaders.loops.for_constan",
        "t_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006156,
        "KHR-GL33.shaders.loops.for_constant",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006157,
        "KHR-GL33.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006158,
        "KHR-GL33.shaders.loops.for_constant_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006159,
        "KHR-GL33.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006160,
        "KHR-GL33.shaders.loops.for_constant_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006161,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006162,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006163,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006164,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006165,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006166,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006167,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006168,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006169,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006170,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006171,
        "KHR-GL33.shaders.loops.for_unif",
        "orm_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006172,
        "KHR-GL33.shaders.loops.for_unifo",
        "rm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006173,
        "KHR-GL33.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006174,
        "KHR-GL33.shaders.loops.for_uniform_iterations.i",
        "nfinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006175,
        "KHR-GL33.shaders.loops.for_uniform_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006176,
        "KHR-GL33.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006177,
        "KHR-GL33.shaders.loops.for_uniform_iterati",
        "ons.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006178,
        "KHR-GL33.shaders.loops.for_uniform_iteratio",
        "ns.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006179,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006180,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006181,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006182,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006183,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006184,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006185,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006186,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006187,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006188,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006189,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006190,
        "KHR-GL33.shaders.loops.for_uniform_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006191,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006192,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006193,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006194,
        "KHR-GL33.shaders.loops.for_uniform_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006195,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006196,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006197,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006198,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006199,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006200,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006201,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006202,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006203,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006204,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006205,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006206,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006207,
        "KHR-GL33.shaders.loops.for_uniform_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006208,
        "KHR-GL33.shaders.loops.for_uniform_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006209,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006210,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006211,
        "KHR-GL33.shaders.loops.for_unifor",
        "m_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006212,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006213,
        "KHR-GL33.shaders.loops.for_uni",
        "form_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006214,
        "KHR-GL33.shaders.loops.for_unif",
        "orm_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006215,
        "KHR-GL33.shaders.loops.for_un",
        "iform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006216,
        "KHR-GL33.shaders.loops.for_uni",
        "form_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006217,
        "KHR-GL33.shaders.loops.for_uniform",
        "_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006218,
        "KHR-GL33.shaders.loops.for_uniform_",
        "iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006219,
        "KHR-GL33.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006220,
        "KHR-GL33.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006221,
        "KHR-GL33.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006222,
        "KHR-GL33.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006223,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006224,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006225,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006226,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006227,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006228,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006229,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006230,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006231,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006232,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006233,
        "KHR-GL33.shaders.loops.for_dyna",
        "mic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006234,
        "KHR-GL33.shaders.loops.for_dynam",
        "ic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006235,
        "KHR-GL33.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006236,
        "KHR-GL33.shaders.loops.for_dynamic_iterations.i",
        "nfinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006237,
        "KHR-GL33.shaders.loops.for_dynamic_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006238,
        "KHR-GL33.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006239,
        "KHR-GL33.shaders.loops.for_dynamic_iterati",
        "ons.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006240,
        "KHR-GL33.shaders.loops.for_dynamic_iteratio",
        "ns.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006241,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006242,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006243,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006244,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006245,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006246,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006247,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006248,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006249,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006250,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006251,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006252,
        "KHR-GL33.shaders.loops.for_dynamic_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006253,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006254,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006255,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006256,
        "KHR-GL33.shaders.loops.for_dynamic_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006257,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006258,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006259,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006260,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006261,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006262,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006263,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006264,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006265,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006266,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006267,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006268,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006269,
        "KHR-GL33.shaders.loops.for_dynamic_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006270,
        "KHR-GL33.shaders.loops.for_dynamic_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006271,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006272,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006273,
        "KHR-GL33.shaders.loops.for_dynami",
        "c_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006274,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006275,
        "KHR-GL33.shaders.loops.for_dyn",
        "amic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006276,
        "KHR-GL33.shaders.loops.for_dyna",
        "mic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006277,
        "KHR-GL33.shaders.loops.for_dy",
        "namic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006278,
        "KHR-GL33.shaders.loops.for_dyn",
        "amic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006279,
        "KHR-GL33.shaders.loops.for_dynamic",
        "_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006280,
        "KHR-GL33.shaders.loops.for_dynamic_",
        "iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006281,
        "KHR-GL33.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006282,
        "KHR-GL33.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006283,
        "KHR-GL33.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006284,
        "KHR-GL33.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006285,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006286,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006287,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006288,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006289,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006290,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006291,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006292,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006293,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006294,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006295,
        "KHR-GL33.shaders.loops.while_cons",
        "tant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006296,
        "KHR-GL33.shaders.loops.while_const",
        "ant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006297,
        "KHR-GL33.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006298,
        "KHR-GL33.shaders.loops.while_constant_iterations",
        ".infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006299,
        "KHR-GL33.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006300,
        "KHR-GL33.shaders.loops.while_constant_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006301,
        "KHR-GL33.shaders.loops.while_constant_itera",
        "tions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006302,
        "KHR-GL33.shaders.loops.while_constant_iterat",
        "ions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006303,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006304,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006305,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006306,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006307,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006308,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006309,
        "KHR-GL33.shaders.loops.while_const",
        "ant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006310,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006311,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006312,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006313,
        "KHR-GL33.shaders.loops.while_constant_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006314,
        "KHR-GL33.shaders.loops.while_constant_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006315,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006316,
        "KHR-GL33.shaders.loops.while_constant_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006317,
        "KHR-GL33.shaders.loops.while_constant_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006318,
        "KHR-GL33.shaders.loops.while_constant_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006319,
        "KHR-GL33.shaders.loops.while_const",
        "ant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006320,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006321,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006322,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006323,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006324,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006325,
        "KHR-GL33.shaders.loops.while_constant",
        "_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006326,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006327,
        "KHR-GL33.shaders.loops.while_const",
        "ant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006328,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006329,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006330,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006331,
        "KHR-GL33.shaders.loops.while_constant_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006332,
        "KHR-GL33.shaders.loops.while_constant_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006333,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006334,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006335,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006336,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006337,
        "KHR-GL33.shaders.loops.while_con",
        "stant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006338,
        "KHR-GL33.shaders.loops.while_cons",
        "tant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006339,
        "KHR-GL33.shaders.loops.while_co",
        "nstant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006340,
        "KHR-GL33.shaders.loops.while_con",
        "stant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006341,
        "KHR-GL33.shaders.loops.while_consta",
        "nt_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006342,
        "KHR-GL33.shaders.loops.while_constan",
        "t_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006343,
        "KHR-GL33.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006344,
        "KHR-GL33.shaders.loops.while_constant_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006345,
        "KHR-GL33.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006346,
        "KHR-GL33.shaders.loops.while_constant_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006347,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006348,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006349,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006350,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006351,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006352,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006353,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006354,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006355,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006356,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006357,
        "KHR-GL33.shaders.loops.while_uni",
        "form_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006358,
        "KHR-GL33.shaders.loops.while_unif",
        "orm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006359,
        "KHR-GL33.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006360,
        "KHR-GL33.shaders.loops.while_uniform_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006361,
        "KHR-GL33.shaders.loops.while_uniform_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006362,
        "KHR-GL33.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006363,
        "KHR-GL33.shaders.loops.while_uniform_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006364,
        "KHR-GL33.shaders.loops.while_uniform_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006365,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006366,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006367,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006368,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006369,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006370,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006371,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006372,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006373,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006374,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006375,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006376,
        "KHR-GL33.shaders.loops.while_uniform_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006377,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006378,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006379,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006380,
        "KHR-GL33.shaders.loops.while_uniform_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006381,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006382,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006383,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006384,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006385,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006386,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006387,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006388,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006389,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006390,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006391,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006392,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006393,
        "KHR-GL33.shaders.loops.while_uniform_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006394,
        "KHR-GL33.shaders.loops.while_uniform_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006395,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006396,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006397,
        "KHR-GL33.shaders.loops.while_unifo",
        "rm_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006398,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006399,
        "KHR-GL33.shaders.loops.while_un",
        "iform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006400,
        "KHR-GL33.shaders.loops.while_uni",
        "form_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006401,
        "KHR-GL33.shaders.loops.while_u",
        "niform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006402,
        "KHR-GL33.shaders.loops.while_un",
        "iform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006403,
        "KHR-GL33.shaders.loops.while_unifor",
        "m_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006404,
        "KHR-GL33.shaders.loops.while_uniform",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006405,
        "KHR-GL33.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006406,
        "KHR-GL33.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006407,
        "KHR-GL33.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006408,
        "KHR-GL33.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006409,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006410,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006411,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006412,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006413,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006414,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006415,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006416,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006417,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006418,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006419,
        "KHR-GL33.shaders.loops.while_dyn",
        "amic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006420,
        "KHR-GL33.shaders.loops.while_dyna",
        "mic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006421,
        "KHR-GL33.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006422,
        "KHR-GL33.shaders.loops.while_dynamic_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006423,
        "KHR-GL33.shaders.loops.while_dynamic_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006424,
        "KHR-GL33.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006425,
        "KHR-GL33.shaders.loops.while_dynamic_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006426,
        "KHR-GL33.shaders.loops.while_dynamic_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006427,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006428,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006429,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006430,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006431,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006432,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006433,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006434,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006435,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006436,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006437,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006438,
        "KHR-GL33.shaders.loops.while_dynamic_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006439,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006440,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006441,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006442,
        "KHR-GL33.shaders.loops.while_dynamic_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006443,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006444,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006445,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006446,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006447,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006448,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006449,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006450,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006451,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006452,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006453,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006454,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006455,
        "KHR-GL33.shaders.loops.while_dynamic_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006456,
        "KHR-GL33.shaders.loops.while_dynamic_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006457,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006458,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006459,
        "KHR-GL33.shaders.loops.while_dynam",
        "ic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006460,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006461,
        "KHR-GL33.shaders.loops.while_dy",
        "namic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006462,
        "KHR-GL33.shaders.loops.while_dyn",
        "amic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006463,
        "KHR-GL33.shaders.loops.while_d",
        "ynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006464,
        "KHR-GL33.shaders.loops.while_dy",
        "namic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006465,
        "KHR-GL33.shaders.loops.while_dynami",
        "c_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006466,
        "KHR-GL33.shaders.loops.while_dynamic",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006467,
        "KHR-GL33.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006468,
        "KHR-GL33.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006469,
        "KHR-GL33.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006470,
        "KHR-GL33.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006471,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006472,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006473,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006474,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006475,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006476,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006477,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006478,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006479,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006480,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006481,
        "KHR-GL33.shaders.loops.do_while_co",
        "nstant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006482,
        "KHR-GL33.shaders.loops.do_while_con",
        "stant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006483,
        "KHR-GL33.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006484,
        "KHR-GL33.shaders.loops.do_while_constant_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006485,
        "KHR-GL33.shaders.loops.do_while_constant_iterati",
        "ons.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006486,
        "KHR-GL33.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006487,
        "KHR-GL33.shaders.loops.do_while_constant_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006488,
        "KHR-GL33.shaders.loops.do_while_constant_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006489,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006490,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006491,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006492,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006493,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006494,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006495,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006496,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006497,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006498,
        "KHR-GL33.shaders.loops.do_while_constant_",
        "iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006499,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006500,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006501,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006502,
        "KHR-GL33.shaders.loops.do_while_constant_",
        "iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006503,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006504,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006505,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006506,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006507,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006508,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006509,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006510,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006511,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006512,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006513,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006514,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006515,
        "KHR-GL33.shaders.loops.do_while_constan",
        "t_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006516,
        "KHR-GL33.shaders.loops.do_while_constant",
        "_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006517,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006518,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006519,
        "KHR-GL33.shaders.loops.do_while_cons",
        "tant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006520,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006521,
        "KHR-GL33.shaders.loops.do_while_c",
        "onstant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006522,
        "KHR-GL33.shaders.loops.do_while_co",
        "nstant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006523,
        "KHR-GL33.shaders.loops.do_while_",
        "constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006524,
        "KHR-GL33.shaders.loops.do_while_c",
        "onstant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006525,
        "KHR-GL33.shaders.loops.do_while_const",
        "ant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006526,
        "KHR-GL33.shaders.loops.do_while_consta",
        "nt_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006527,
        "KHR-GL33.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006528,
        "KHR-GL33.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006529,
        "KHR-GL33.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006530,
        "KHR-GL33.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006531,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006532,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006533,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006534,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006535,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006536,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006537,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006538,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006539,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006540,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006541,
        "KHR-GL33.shaders.loops.do_while_un",
        "iform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006542,
        "KHR-GL33.shaders.loops.do_while_uni",
        "form_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006543,
        "KHR-GL33.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006544,
        "KHR-GL33.shaders.loops.do_while_uniform_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006545,
        "KHR-GL33.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006546,
        "KHR-GL33.shaders.loops.do_while_uniform_iteration",
        "s.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006547,
        "KHR-GL33.shaders.loops.do_while_uniform_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006548,
        "KHR-GL33.shaders.loops.do_while_uniform_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006549,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006550,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006551,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006552,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006553,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006554,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006555,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006556,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006557,
        "KHR-GL33.shaders.loops.do_while_uniform_",
        "iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006558,
        "KHR-GL33.shaders.loops.do_while_uniform_i",
        "terations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006559,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006560,
        "KHR-GL33.shaders.loops.do_while_uniform_",
        "iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006561,
        "KHR-GL33.shaders.loops.do_while_uniform_",
        "iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006562,
        "KHR-GL33.shaders.loops.do_while_uniform_i",
        "terations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006563,
        "KHR-GL33.shaders.loops.do_while_uni",
        "form_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006564,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006565,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006566,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006567,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006568,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006569,
        "KHR-GL33.shaders.loops.do_while_unifor",
        "m_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006570,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006571,
        "KHR-GL33.shaders.loops.do_while_uni",
        "form_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006572,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006573,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006574,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006575,
        "KHR-GL33.shaders.loops.do_while_uniform",
        "_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006576,
        "KHR-GL33.shaders.loops.do_while_uniform_",
        "iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006577,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006578,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006579,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006580,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006581,
        "KHR-GL33.shaders.loops.do_while_u",
        "niform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006582,
        "KHR-GL33.shaders.loops.do_while_un",
        "iform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006583,
        "KHR-GL33.shaders.loops.do_while_",
        "uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006584,
        "KHR-GL33.shaders.loops.do_while_u",
        "niform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006585,
        "KHR-GL33.shaders.loops.do_while_unif",
        "orm_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006586,
        "KHR-GL33.shaders.loops.do_while_unifo",
        "rm_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006587,
        "KHR-GL33.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006588,
        "KHR-GL33.shaders.loops.do_while_uniform_it",
        "erations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006589,
        "KHR-GL33.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006590,
        "KHR-GL33.shaders.loops.do_while_uniform_it",
        "erations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006591,
        "KHR-GL33.shaders.loops.do_while_dyna",
        "mic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006592,
        "KHR-GL33.shaders.loops.do_while_dynam",
