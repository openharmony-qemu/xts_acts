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
#include "../ActsDeqpgles310007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006099,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006100,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006101,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006102,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006103,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006104,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006105,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006106,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006107,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006108,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006109,
        "KHR-GL43.shaders.loops.for_const",
        "ant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006110,
        "KHR-GL43.shaders.loops.for_consta",
        "nt_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006111,
        "KHR-GL43.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006112,
        "KHR-GL43.shaders.loops.for_constant_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006113,
        "KHR-GL43.shaders.loops.for_constant_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006114,
        "KHR-GL43.shaders.loops.for_constant_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006115,
        "KHR-GL43.shaders.loops.for_constant_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006116,
        "KHR-GL43.shaders.loops.for_constant_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006117,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006118,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006119,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006120,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006121,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006122,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006123,
        "KHR-GL43.shaders.loops.for_consta",
        "nt_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006124,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006125,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006126,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006127,
        "KHR-GL43.shaders.loops.for_constant_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006128,
        "KHR-GL43.shaders.loops.for_constant_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006129,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006130,
        "KHR-GL43.shaders.loops.for_constant_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006131,
        "KHR-GL43.shaders.loops.for_constant_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006132,
        "KHR-GL43.shaders.loops.for_constant_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006133,
        "KHR-GL43.shaders.loops.for_consta",
        "nt_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006134,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006135,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006136,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006137,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006138,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006139,
        "KHR-GL43.shaders.loops.for_constant_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006140,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006141,
        "KHR-GL43.shaders.loops.for_consta",
        "nt_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006142,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006143,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006144,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006145,
        "KHR-GL43.shaders.loops.for_constant_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006146,
        "KHR-GL43.shaders.loops.for_constant_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006147,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006148,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006149,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006150,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006151,
        "KHR-GL43.shaders.loops.for_cons",
        "tant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006152,
        "KHR-GL43.shaders.loops.for_const",
        "ant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006153,
        "KHR-GL43.shaders.loops.for_con",
        "stant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006154,
        "KHR-GL43.shaders.loops.for_cons",
        "tant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006155,
        "KHR-GL43.shaders.loops.for_constan",
        "t_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006156,
        "KHR-GL43.shaders.loops.for_constant",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006157,
        "KHR-GL43.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006158,
        "KHR-GL43.shaders.loops.for_constant_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006159,
        "KHR-GL43.shaders.loops.for_constant_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006160,
        "KHR-GL43.shaders.loops.for_constant_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006161,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006162,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006163,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006164,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006165,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006166,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006167,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006168,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006169,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006170,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006171,
        "KHR-GL43.shaders.loops.for_unif",
        "orm_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006172,
        "KHR-GL43.shaders.loops.for_unifo",
        "rm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006173,
        "KHR-GL43.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006174,
        "KHR-GL43.shaders.loops.for_uniform_iterations.i",
        "nfinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006175,
        "KHR-GL43.shaders.loops.for_uniform_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006176,
        "KHR-GL43.shaders.loops.for_uniform_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006177,
        "KHR-GL43.shaders.loops.for_uniform_iterati",
        "ons.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006178,
        "KHR-GL43.shaders.loops.for_uniform_iteratio",
        "ns.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006179,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006180,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006181,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006182,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006183,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006184,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006185,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006186,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006187,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006188,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006189,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006190,
        "KHR-GL43.shaders.loops.for_uniform_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006191,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006192,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006193,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006194,
        "KHR-GL43.shaders.loops.for_uniform_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006195,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006196,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006197,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006198,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006199,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006200,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006201,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006202,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006203,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006204,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006205,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006206,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006207,
        "KHR-GL43.shaders.loops.for_uniform_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006208,
        "KHR-GL43.shaders.loops.for_uniform_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006209,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006210,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006211,
        "KHR-GL43.shaders.loops.for_unifor",
        "m_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006212,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006213,
        "KHR-GL43.shaders.loops.for_uni",
        "form_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006214,
        "KHR-GL43.shaders.loops.for_unif",
        "orm_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006215,
        "KHR-GL43.shaders.loops.for_un",
        "iform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006216,
        "KHR-GL43.shaders.loops.for_uni",
        "form_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006217,
        "KHR-GL43.shaders.loops.for_uniform",
        "_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006218,
        "KHR-GL43.shaders.loops.for_uniform_",
        "iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006219,
        "KHR-GL43.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006220,
        "KHR-GL43.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006221,
        "KHR-GL43.shaders.loops.for_uniform_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006222,
        "KHR-GL43.shaders.loops.for_uniform_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006223,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006224,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006225,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006226,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006227,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006228,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006229,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006230,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006231,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006232,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006233,
        "KHR-GL43.shaders.loops.for_dyna",
        "mic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006234,
        "KHR-GL43.shaders.loops.for_dynam",
        "ic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006235,
        "KHR-GL43.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006236,
        "KHR-GL43.shaders.loops.for_dynamic_iterations.i",
        "nfinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006237,
        "KHR-GL43.shaders.loops.for_dynamic_iterations",
        ".infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006238,
        "KHR-GL43.shaders.loops.for_dynamic_iterations.",
        "infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006239,
        "KHR-GL43.shaders.loops.for_dynamic_iterati",
        "ons.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006240,
        "KHR-GL43.shaders.loops.for_dynamic_iteratio",
        "ns.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006241,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006242,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006243,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006244,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006245,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006246,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006247,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006248,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006249,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006250,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006251,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006252,
        "KHR-GL43.shaders.loops.for_dynamic_ite",
        "rations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006253,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006254,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006255,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006256,
        "KHR-GL43.shaders.loops.for_dynamic_ite",
        "rations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006257,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006258,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006259,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006260,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006261,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006262,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006263,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006264,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006265,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006266,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006267,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006268,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006269,
        "KHR-GL43.shaders.loops.for_dynamic_i",
        "terations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006270,
        "KHR-GL43.shaders.loops.for_dynamic_it",
        "erations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006271,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006272,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006273,
        "KHR-GL43.shaders.loops.for_dynami",
        "c_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006274,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006275,
        "KHR-GL43.shaders.loops.for_dyn",
        "amic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006276,
        "KHR-GL43.shaders.loops.for_dyna",
        "mic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006277,
        "KHR-GL43.shaders.loops.for_dy",
        "namic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006278,
        "KHR-GL43.shaders.loops.for_dyn",
        "amic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006279,
        "KHR-GL43.shaders.loops.for_dynamic",
        "_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006280,
        "KHR-GL43.shaders.loops.for_dynamic_",
        "iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006281,
        "KHR-GL43.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006282,
        "KHR-GL43.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006283,
        "KHR-GL43.shaders.loops.for_dynamic_ite",
        "rations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006284,
        "KHR-GL43.shaders.loops.for_dynamic_iter",
        "ations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006285,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006286,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006287,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006288,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006289,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006290,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006291,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006292,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006293,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006294,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006295,
        "KHR-GL43.shaders.loops.while_cons",
        "tant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006296,
        "KHR-GL43.shaders.loops.while_const",
        "ant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006297,
        "KHR-GL43.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006298,
        "KHR-GL43.shaders.loops.while_constant_iterations",
        ".infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006299,
        "KHR-GL43.shaders.loops.while_constant_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006300,
        "KHR-GL43.shaders.loops.while_constant_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006301,
        "KHR-GL43.shaders.loops.while_constant_itera",
        "tions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006302,
        "KHR-GL43.shaders.loops.while_constant_iterat",
        "ions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006303,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006304,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006305,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006306,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006307,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006308,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006309,
        "KHR-GL43.shaders.loops.while_const",
        "ant_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006310,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006311,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006312,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006313,
        "KHR-GL43.shaders.loops.while_constant_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006314,
        "KHR-GL43.shaders.loops.while_constant_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006315,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006316,
        "KHR-GL43.shaders.loops.while_constant_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006317,
        "KHR-GL43.shaders.loops.while_constant_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006318,
        "KHR-GL43.shaders.loops.while_constant_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006319,
        "KHR-GL43.shaders.loops.while_const",
        "ant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006320,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006321,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006322,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006323,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006324,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006325,
        "KHR-GL43.shaders.loops.while_constant",
        "_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006326,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006327,
        "KHR-GL43.shaders.loops.while_const",
        "ant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006328,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006329,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006330,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006331,
        "KHR-GL43.shaders.loops.while_constant_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006332,
        "KHR-GL43.shaders.loops.while_constant_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006333,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006334,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006335,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006336,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006337,
        "KHR-GL43.shaders.loops.while_con",
        "stant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006338,
        "KHR-GL43.shaders.loops.while_cons",
        "tant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006339,
        "KHR-GL43.shaders.loops.while_co",
        "nstant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006340,
        "KHR-GL43.shaders.loops.while_con",
        "stant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006341,
        "KHR-GL43.shaders.loops.while_consta",
        "nt_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006342,
        "KHR-GL43.shaders.loops.while_constan",
        "t_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006343,
        "KHR-GL43.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006344,
        "KHR-GL43.shaders.loops.while_constant_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006345,
        "KHR-GL43.shaders.loops.while_constant_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006346,
        "KHR-GL43.shaders.loops.while_constant_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006347,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006348,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006349,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006350,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006351,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006352,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006353,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006354,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006355,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006356,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006357,
        "KHR-GL43.shaders.loops.while_uni",
        "form_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006358,
        "KHR-GL43.shaders.loops.while_unif",
        "orm_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006359,
        "KHR-GL43.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006360,
        "KHR-GL43.shaders.loops.while_uniform_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006361,
        "KHR-GL43.shaders.loops.while_uniform_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006362,
        "KHR-GL43.shaders.loops.while_uniform_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006363,
        "KHR-GL43.shaders.loops.while_uniform_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006364,
        "KHR-GL43.shaders.loops.while_uniform_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006365,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006366,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006367,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006368,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006369,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006370,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006371,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006372,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006373,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006374,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006375,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006376,
        "KHR-GL43.shaders.loops.while_uniform_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006377,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006378,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006379,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006380,
        "KHR-GL43.shaders.loops.while_uniform_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006381,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006382,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006383,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006384,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006385,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006386,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006387,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006388,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006389,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006390,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006391,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006392,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006393,
        "KHR-GL43.shaders.loops.while_uniform_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006394,
        "KHR-GL43.shaders.loops.while_uniform_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006395,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006396,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006397,
        "KHR-GL43.shaders.loops.while_unifo",
        "rm_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006398,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006399,
        "KHR-GL43.shaders.loops.while_un",
        "iform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006400,
        "KHR-GL43.shaders.loops.while_uni",
        "form_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006401,
        "KHR-GL43.shaders.loops.while_u",
        "niform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006402,
        "KHR-GL43.shaders.loops.while_un",
        "iform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006403,
        "KHR-GL43.shaders.loops.while_unifor",
        "m_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006404,
        "KHR-GL43.shaders.loops.while_uniform",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006405,
        "KHR-GL43.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006406,
        "KHR-GL43.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006407,
        "KHR-GL43.shaders.loops.while_uniform_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006408,
        "KHR-GL43.shaders.loops.while_uniform_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006409,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006410,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006411,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006412,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006413,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006414,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006415,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006416,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006417,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006418,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006419,
        "KHR-GL43.shaders.loops.while_dyn",
        "amic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006420,
        "KHR-GL43.shaders.loops.while_dyna",
        "mic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006421,
        "KHR-GL43.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006422,
        "KHR-GL43.shaders.loops.while_dynamic_iterations.",
        "infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006423,
        "KHR-GL43.shaders.loops.while_dynamic_iteration",
        "s.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006424,
        "KHR-GL43.shaders.loops.while_dynamic_iterations",
        ".infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006425,
        "KHR-GL43.shaders.loops.while_dynamic_iterat",
        "ions.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006426,
        "KHR-GL43.shaders.loops.while_dynamic_iterati",
        "ons.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006427,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006428,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006429,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006430,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006431,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006432,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006433,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.no_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006434,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.no_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006435,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006436,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006437,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006438,
        "KHR-GL43.shaders.loops.while_dynamic_it",
        "erations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006439,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006440,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006441,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006442,
        "KHR-GL43.shaders.loops.while_dynamic_it",
        "erations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006443,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006444,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006445,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006446,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006447,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006448,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006449,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006450,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006451,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006452,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006453,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006454,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006455,
        "KHR-GL43.shaders.loops.while_dynamic_",
        "iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006456,
        "KHR-GL43.shaders.loops.while_dynamic_i",
        "terations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006457,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006458,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006459,
        "KHR-GL43.shaders.loops.while_dynam",
        "ic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006460,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006461,
        "KHR-GL43.shaders.loops.while_dy",
        "namic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006462,
        "KHR-GL43.shaders.loops.while_dyn",
        "amic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006463,
        "KHR-GL43.shaders.loops.while_d",
        "ynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006464,
        "KHR-GL43.shaders.loops.while_dy",
        "namic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006465,
        "KHR-GL43.shaders.loops.while_dynami",
        "c_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006466,
        "KHR-GL43.shaders.loops.while_dynamic",
        "_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006467,
        "KHR-GL43.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006468,
        "KHR-GL43.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006469,
        "KHR-GL43.shaders.loops.while_dynamic_it",
        "erations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006470,
        "KHR-GL43.shaders.loops.while_dynamic_ite",
        "rations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006471,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006472,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006473,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006474,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006475,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006476,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006477,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006478,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006479,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006480,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006481,
        "KHR-GL43.shaders.loops.do_while_co",
        "nstant_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006482,
        "KHR-GL43.shaders.loops.do_while_con",
        "stant_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006483,
        "KHR-GL43.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006484,
        "KHR-GL43.shaders.loops.do_while_constant_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006485,
        "KHR-GL43.shaders.loops.do_while_constant_iterati",
        "ons.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006486,
        "KHR-GL43.shaders.loops.do_while_constant_iteratio",
        "ns.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006487,
        "KHR-GL43.shaders.loops.do_while_constant_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006488,
        "KHR-GL43.shaders.loops.do_while_constant_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006489,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006490,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006491,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006492,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006493,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006494,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006495,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006496,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006497,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006498,
        "KHR-GL43.shaders.loops.do_while_constant_",
        "iterations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006499,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006500,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006501,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006502,
        "KHR-GL43.shaders.loops.do_while_constant_",
        "iterations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006503,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006504,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006505,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006506,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006507,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006508,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006509,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006510,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006511,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006512,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006513,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006514,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006515,
        "KHR-GL43.shaders.loops.do_while_constan",
        "t_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006516,
        "KHR-GL43.shaders.loops.do_while_constant",
        "_iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006517,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006518,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006519,
        "KHR-GL43.shaders.loops.do_while_cons",
        "tant_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006520,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006521,
        "KHR-GL43.shaders.loops.do_while_c",
        "onstant_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006522,
        "KHR-GL43.shaders.loops.do_while_co",
        "nstant_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006523,
        "KHR-GL43.shaders.loops.do_while_",
        "constant_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006524,
        "KHR-GL43.shaders.loops.do_while_c",
        "onstant_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006525,
        "KHR-GL43.shaders.loops.do_while_const",
        "ant_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006526,
        "KHR-GL43.shaders.loops.do_while_consta",
        "nt_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006527,
        "KHR-GL43.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006528,
        "KHR-GL43.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006529,
        "KHR-GL43.shaders.loops.do_while_constant_",
        "iterations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006530,
        "KHR-GL43.shaders.loops.do_while_constant_i",
        "terations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006531,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006532,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006533,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006534,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006535,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006536,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006537,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006538,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006539,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006540,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006541,
        "KHR-GL43.shaders.loops.do_while_un",
        "iform_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006542,
        "KHR-GL43.shaders.loops.do_while_uni",
        "form_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006543,
        "KHR-GL43.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006544,
        "KHR-GL43.shaders.loops.do_while_uniform_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006545,
        "KHR-GL43.shaders.loops.do_while_uniform_iteratio",
        "ns.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006546,
        "KHR-GL43.shaders.loops.do_while_uniform_iteration",
        "s.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006547,
        "KHR-GL43.shaders.loops.do_while_uniform_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006548,
        "KHR-GL43.shaders.loops.do_while_uniform_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006549,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006550,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006551,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006552,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006553,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006554,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006555,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006556,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006557,
        "KHR-GL43.shaders.loops.do_while_uniform_",
        "iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006558,
        "KHR-GL43.shaders.loops.do_while_uniform_i",
        "terations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006559,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006560,
        "KHR-GL43.shaders.loops.do_while_uniform_",
        "iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006561,
        "KHR-GL43.shaders.loops.do_while_uniform_",
        "iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006562,
        "KHR-GL43.shaders.loops.do_while_uniform_i",
        "terations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006563,
        "KHR-GL43.shaders.loops.do_while_uni",
        "form_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006564,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006565,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006566,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006567,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006568,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006569,
        "KHR-GL43.shaders.loops.do_while_unifor",
        "m_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006570,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006571,
        "KHR-GL43.shaders.loops.do_while_uni",
        "form_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006572,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006573,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006574,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006575,
        "KHR-GL43.shaders.loops.do_while_uniform",
        "_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006576,
        "KHR-GL43.shaders.loops.do_while_uniform_",
        "iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006577,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006578,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006579,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006580,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006581,
        "KHR-GL43.shaders.loops.do_while_u",
        "niform_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006582,
        "KHR-GL43.shaders.loops.do_while_un",
        "iform_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006583,
        "KHR-GL43.shaders.loops.do_while_",
        "uniform_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006584,
        "KHR-GL43.shaders.loops.do_while_u",
        "niform_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006585,
        "KHR-GL43.shaders.loops.do_while_unif",
        "orm_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006586,
        "KHR-GL43.shaders.loops.do_while_unifo",
        "rm_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006587,
        "KHR-GL43.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006588,
        "KHR-GL43.shaders.loops.do_while_uniform_it",
        "erations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006589,
        "KHR-GL43.shaders.loops.do_while_uniform_i",
        "terations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006590,
        "KHR-GL43.shaders.loops.do_while_uniform_it",
        "erations.nested_tricky_dataflow_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006591,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.basic_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006592,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.basic_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006593,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.basic_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006594,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.basic_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006595,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.basic_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006596,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.basic_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006597,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.basic_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006598,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.basic_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006599,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.basic_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006600,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.basic_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006601,
        "KHR-GL43.shaders.loops.do_while_dy",
        "namic_iterations.empty_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006602,
        "KHR-GL43.shaders.loops.do_while_dyn",
        "amic_iterations.empty_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006603,
        "KHR-GL43.shaders.loops.do_while_dynamic_iteratio",
        "ns.infinite_with_unconditional_break_first_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006604,
        "KHR-GL43.shaders.loops.do_while_dynamic_iteration",
        "s.infinite_with_unconditional_break_first_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006605,
        "KHR-GL43.shaders.loops.do_while_dynamic_iteratio",
        "ns.infinite_with_unconditional_break_last_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006606,
        "KHR-GL43.shaders.loops.do_while_dynamic_iteration",
        "s.infinite_with_unconditional_break_last_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006607,
        "KHR-GL43.shaders.loops.do_while_dynamic_iter",
        "ations.infinite_with_conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006608,
        "KHR-GL43.shaders.loops.do_while_dynamic_itera",
        "tions.infinite_with_conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006609,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.single_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006610,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.single_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006611,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.compound_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006612,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.compound_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006613,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.sequence_statement_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006614,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.sequence_statement_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006615,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.single_iteration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006616,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.single_iteration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006617,
        "KHR-GL43.shaders.loops.do_while_dynamic_",
        "iterations.select_iteration_count_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006618,
        "KHR-GL43.shaders.loops.do_while_dynamic_i",
        "terations.select_iteration_count_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006619,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.conditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006620,
        "KHR-GL43.shaders.loops.do_while_dynamic_",
        "iterations.conditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006621,
        "KHR-GL43.shaders.loops.do_while_dynamic_",
        "iterations.unconditional_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006622,
        "KHR-GL43.shaders.loops.do_while_dynamic_i",
        "terations.unconditional_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006623,
        "KHR-GL43.shaders.loops.do_while_dyn",
        "amic_iterations.only_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006624,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.only_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006625,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.double_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006626,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.double_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006627,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.conditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006628,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.conditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006629,
        "KHR-GL43.shaders.loops.do_while_dynami",
        "c_iterations.unconditional_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006630,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.unconditional_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006631,
        "KHR-GL43.shaders.loops.do_while_dyn",
        "amic_iterations.pre_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006632,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.pre_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006633,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.post_increment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006634,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.post_increment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006635,
        "KHR-GL43.shaders.loops.do_while_dynamic",
        "_iterations.mixed_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006636,
        "KHR-GL43.shaders.loops.do_while_dynamic_",
        "iterations.mixed_break_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006637,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.vector_counter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006638,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.vector_counter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006639,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.101_iterations_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006640,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.101_iterations_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006641,
        "KHR-GL43.shaders.loops.do_while_d",
        "ynamic_iterations.sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006642,
        "KHR-GL43.shaders.loops.do_while_dy",
        "namic_iterations.sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006643,
        "KHR-GL43.shaders.loops.do_while_",
        "dynamic_iterations.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006644,
        "KHR-GL43.shaders.loops.do_while_d",
        "ynamic_iterations.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006645,
        "KHR-GL43.shaders.loops.do_while_dyna",
        "mic_iterations.nested_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006646,
        "KHR-GL43.shaders.loops.do_while_dynam",
        "ic_iterations.nested_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006647,
        "KHR-GL43.shaders.loops.do_while_dynamic_i",
        "terations.nested_tricky_dataflow_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006648,
        "KHR-GL43.shaders.loops.do_while_dynamic_it",
        "erations.nested_tricky_dataflow_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006649,
        "KHR-GL43.shaders.loops.do_while_dynamic_i",
        "terations.nested_tricky_dataflow_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310007TestSuite, TestCase_006650,
        "KHR-GL43.shaders.loops.do_while_dynamic_it",
        "erations.nested_tricky_dataflow_2_fragment");
