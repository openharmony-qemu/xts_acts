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

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006651,
        "KHR-GL33.shaders.preprocesso",
        "r.basic.correct_phases_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006652,
        "KHR-GL33.shaders.preprocessor",
        ".basic.correct_phases_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006653,
        "KHR-GL33.shaders.preprocessor.",
        "basic.invalid_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006654,
        "KHR-GL33.shaders.preprocessor.b",
        "asic.invalid_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006655,
        "KHR-GL33.shaders.preprocesso",
        "r.basic.null_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006656,
        "KHR-GL33.shaders.preprocessor",
        ".basic.null_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006657,
        "KHR-GL33.shaders.preprocessor.",
        "basic.invalid_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006658,
        "KHR-GL33.shaders.preprocessor.b",
        "asic.invalid_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006659,
        "KHR-GL33.shaders.preprocessor.",
        "basic.missing_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006660,
        "KHR-GL33.shaders.preprocessor.b",
        "asic.missing_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006661,
        "KHR-GL33.shaders.preprocess",
        "or.basic.empty_object_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006662,
        "KHR-GL33.shaders.preprocesso",
        "r.basic.empty_object_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006663,
        "KHR-GL33.shaders.preprocesso",
        "r.basic.empty_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006664,
        "KHR-GL33.shaders.preprocessor",
        ".basic.empty_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006665,
        "KHR-GL33.shaders.preprocessor",
        ".basic.empty_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006666,
        "KHR-GL33.shaders.preprocessor.",
        "basic.empty_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006667,
        "KHR-GL33.shaders.preprocessor",
        ".basic.token_pasting_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006668,
        "KHR-GL33.shaders.preprocessor.",
        "basic.token_pasting_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006669,
        "KHR-GL33.shaders.preprocessor",
        ".basic.token_pasting_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006670,
        "KHR-GL33.shaders.preprocessor.",
        "basic.token_pasting_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006671,
        "KHR-GL33.shaders.preprocessor",
        ".basic.stringification_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006672,
        "KHR-GL33.shaders.preprocessor.",
        "basic.stringification_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006673,
        "KHR-GL33.shaders.preprocessor.definit",
        "ions.define_value_and_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006674,
        "KHR-GL33.shaders.preprocessor.definiti",
        "ons.define_value_and_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006675,
        "KHR-GL33.shaders.preprocessor.definitio",
        "ns.undefine_object_invalid_syntax_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006676,
        "KHR-GL33.shaders.preprocessor.definition",
        "s.undefine_object_invalid_syntax_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006677,
        "KHR-GL33.shaders.preprocessor.def",
        "initions.undefine_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006678,
        "KHR-GL33.shaders.preprocessor.defi",
        "nitions.undefine_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006679,
        "KHR-GL33.shaders.preprocessor.de",
        "finitions.undefine_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006680,
        "KHR-GL33.shaders.preprocessor.def",
        "initions.undefine_version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006681,
        "KHR-GL33.shaders.preprocessor.defin",
        "itions.undefine_core_profile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006682,
        "KHR-GL33.shaders.preprocessor.defini",
        "tions.undefine_core_profile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006683,
        "KHR-GL33.shaders.preprocessor.invalid_d",
        "efinitions.define_non_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006684,
        "KHR-GL33.shaders.preprocessor.invalid_de",
        "finitions.define_non_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006685,
        "KHR-GL33.shaders.preprocessor.invalid_d",
        "efinitions.undef_non_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006686,
        "KHR-GL33.shaders.preprocessor.invalid_de",
        "finitions.undef_non_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006687,
        "KHR-GL33.shaders.preprocessor.invalid_d",
        "efinitions.undef_non_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006688,
        "KHR-GL33.shaders.preprocessor.invalid_de",
        "finitions.undef_non_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006689,
        "KHR-GL33.shaders.preprocessor.object_re",
        "definitions.invalid_object_ident_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006690,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.invalid_object_ident_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006691,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.invalid_object_whitespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006692,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.invalid_object_whitespace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006693,
        "KHR-GL33.shaders.preprocessor.object_",
        "redefinitions.invalid_object_op_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006694,
        "KHR-GL33.shaders.preprocessor.object_r",
        "edefinitions.invalid_object_op_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006695,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.invalid_object_floatval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006696,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.invalid_object_floatval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006697,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.invalid_object_floatval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006698,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.invalid_object_floatval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006699,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.invalid_object_intval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006700,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.invalid_object_intval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006701,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.invalid_object_intval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006702,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.invalid_object_intval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006703,
        "KHR-GL33.shaders.preprocessor.object_",
        "redefinitions.redefine_object_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006704,
        "KHR-GL33.shaders.preprocessor.object_r",
        "edefinitions.redefine_object_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006705,
        "KHR-GL33.shaders.preprocessor.object_re",
        "definitions.redefine_object_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006706,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.redefine_object_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006707,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.redefine_object_undef_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006708,
        "KHR-GL33.shaders.preprocessor.object_redefi",
        "nitions.redefine_object_undef_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006709,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.redefine_object_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006710,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.redefine_object_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006711,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.redefine_object_defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006712,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.redefine_object_defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006713,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.redefine_object_defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006714,
        "KHR-GL33.shaders.preprocessor.object_redef",
        "initions.redefine_object_defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006715,
        "KHR-GL33.shaders.preprocessor.object_red",
        "efinitions.redefine_object_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006716,
        "KHR-GL33.shaders.preprocessor.object_rede",
        "finitions.redefine_object_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006717,
        "KHR-GL33.shaders.preprocessor.object_redefini",
        "tions.redefine_object_multiline_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006718,
        "KHR-GL33.shaders.preprocessor.object_redefinit",
        "ions.redefine_object_multiline_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006719,
        "KHR-GL33.shaders.preprocessor.invalid_r",
        "edefinitions.invalid_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006720,
        "KHR-GL33.shaders.preprocessor.invalid_re",
        "definitions.invalid_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006721,
        "KHR-GL33.shaders.preprocessor.comme",
        "nts.multiline_comment_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006722,
        "KHR-GL33.shaders.preprocessor.commen",
        "ts.multiline_comment_define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006723,
        "KHR-GL33.shaders.preprocessor.",
        "comments.nested_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006724,
        "KHR-GL33.shaders.preprocessor.c",
        "omments.nested_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006725,
        "KHR-GL33.shaders.preprocessor.",
        "comments.invalid_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006726,
        "KHR-GL33.shaders.preprocessor.c",
        "omments.invalid_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006727,
        "KHR-GL33.shaders.preprocessor.comm",
        "ents.unterminated_comment_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006728,
        "KHR-GL33.shaders.preprocessor.comme",
        "nts.unterminated_comment_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006729,
        "KHR-GL33.shaders.preprocessor.comm",
        "ents.unterminated_comment_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006730,
        "KHR-GL33.shaders.preprocessor.comme",
        "nts.unterminated_comment_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006731,
        "KHR-GL33.shaders.preprocessor.function_defin",
        "itions.same_object_and_function_param_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006732,
        "KHR-GL33.shaders.preprocessor.function_defini",
        "tions.same_object_and_function_param_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006733,
        "KHR-GL33.shaders.preprocessor.funct",
        "ion_definitions.complex_func_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006734,
        "KHR-GL33.shaders.preprocessor.functi",
        "on_definitions.complex_func_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006735,
        "KHR-GL33.shaders.preprocessor.function_defini",
        "tions.function_definition_with_comments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006736,
        "KHR-GL33.shaders.preprocessor.function_definit",
        "ions.function_definition_with_comments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006737,
        "KHR-GL33.shaders.preprocessor",
        ".recursion.recursion_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006738,
        "KHR-GL33.shaders.preprocessor.",
        "recursion.recursion_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006739,
        "KHR-GL33.shaders.preprocessor",
        ".recursion.recursion_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006740,
        "KHR-GL33.shaders.preprocessor.",
        "recursion.recursion_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006741,
        "KHR-GL33.shaders.preprocessor",
        ".recursion.recursion_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006742,
        "KHR-GL33.shaders.preprocessor.",
        "recursion.recursion_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006743,
        "KHR-GL33.shaders.preprocessor",
        ".recursion.recursion_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006744,
        "KHR-GL33.shaders.preprocessor.",
        "recursion.recursion_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006745,
        "KHR-GL33.shaders.preprocessor",
        ".recursion.recursion_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006746,
        "KHR-GL33.shaders.preprocessor.",
        "recursion.recursion_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006747,
        "KHR-GL33.shaders.preprocessor.function_re",
        "definitions.function_redefinition_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006748,
        "KHR-GL33.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006749,
        "KHR-GL33.shaders.preprocessor.function_re",
        "definitions.function_redefinition_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006750,
        "KHR-GL33.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006751,
        "KHR-GL33.shaders.preprocessor.function_re",
        "definitions.function_redefinition_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006752,
        "KHR-GL33.shaders.preprocessor.function_red",
        "efinitions.function_redefinition_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006753,
        "KHR-GL33.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006754,
        "KHR-GL33.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006755,
        "KHR-GL33.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006756,
        "KHR-GL33.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006757,
        "KHR-GL33.shaders.preprocessor.function_redefinit",
        "ions.invalid_function_redefinition_param_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006758,
        "KHR-GL33.shaders.preprocessor.function_redefiniti",
        "ons.invalid_function_redefinition_param_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006759,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006760,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006761,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006762,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006763,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006764,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006765,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006766,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006767,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006768,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006769,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006770,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_6_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006771,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_7_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006772,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_7_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006773,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "function_definitions.arguments_8_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006774,
        "KHR-GL33.shaders.preprocessor.invalid_f",
        "unction_definitions.arguments_8_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006775,
        "KHR-GL33.shaders.preprocessor.invalid_fun",
        "ction_definitions.unique_param_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006776,
        "KHR-GL33.shaders.preprocessor.invalid_func",
        "tion_definitions.unique_param_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006777,
        "KHR-GL33.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006778,
        "KHR-GL33.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006779,
        "KHR-GL33.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006780,
        "KHR-GL33.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006781,
        "KHR-GL33.shaders.preprocessor.invalid_fu",
        "nction_definitions.argument_list_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006782,
        "KHR-GL33.shaders.preprocessor.invalid_fun",
        "ction_definitions.argument_list_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006783,
        "KHR-GL33.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006784,
        "KHR-GL33.shaders.preprocessor.invalid_function",
        "_definitions.no_closing_parenthesis_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006785,
        "KHR-GL33.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006786,
        "KHR-GL33.shaders.preprocessor.invalid_function",
        "_definitions.no_closing_parenthesis_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006787,
        "KHR-GL33.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006788,
        "KHR-GL33.shaders.preprocessor.invalid_function",
        "_definitions.no_closing_parenthesis_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006789,
        "KHR-GL33.shaders.preprocessor.invalid_functio",
        "n_definitions.no_closing_parenthesis_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006790,
        "KHR-GL33.shaders.preprocessor.invalid_function",
        "_definitions.no_closing_parenthesis_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006791,
        "KHR-GL33.shaders.preprocessor.s",
        "emantic.ops_as_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006792,
        "KHR-GL33.shaders.preprocessor.se",
        "mantic.ops_as_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006793,
        "KHR-GL33.shaders.preprocessor",
        ".semantic.correct_order_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006794,
        "KHR-GL33.shaders.preprocessor.",
        "semantic.correct_order_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006795,
        "KHR-GL33.shaders.preprocessor.p",
        "redefined_macros.version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006796,
        "KHR-GL33.shaders.preprocessor.pr",
        "edefined_macros.version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006797,
        "KHR-GL33.shaders.preprocessor.predefi",
        "ned_macros.core_profile_defined_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006798,
        "KHR-GL33.shaders.preprocessor.predefin",
        "ed_macros.core_profile_defined_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006799,
        "KHR-GL33.shaders.preprocessor.predef",
        "ined_macros.core_profile_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006800,
        "KHR-GL33.shaders.preprocessor.predefi",
        "ned_macros.core_profile_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006801,
        "KHR-GL33.shaders.preprocessor.",
        "predefined_macros.line_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006802,
        "KHR-GL33.shaders.preprocessor.p",
        "redefined_macros.line_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006803,
        "KHR-GL33.shaders.preprocessor",
        ".predefined_macros.file_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006804,
        "KHR-GL33.shaders.preprocessor.",
        "predefined_macros.file_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006805,
        "KHR-GL33.shaders.preprocessor.prede",
        "fined_macros.if_core_profile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006806,
        "KHR-GL33.shaders.preprocessor.predef",
        "ined_macros.if_core_profile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006807,
        "KHR-GL33.shaders.preprocessor.pr",
        "edefined_macros.if_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006808,
        "KHR-GL33.shaders.preprocessor.pre",
        "defined_macros.if_version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006809,
        "KHR-GL33.shaders.preprocessor.con",
        "ditional_inclusion.basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006810,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006811,
        "KHR-GL33.shaders.preprocessor.con",
        "ditional_inclusion.basic_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006812,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.basic_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006813,
        "KHR-GL33.shaders.preprocessor.con",
        "ditional_inclusion.basic_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006814,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.basic_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006815,
        "KHR-GL33.shaders.preprocessor.con",
        "ditional_inclusion.basic_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006816,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.basic_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006817,
        "KHR-GL33.shaders.preprocessor.con",
        "ditional_inclusion.basic_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006818,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.basic_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006819,
        "KHR-GL33.shaders.preprocessor.cond",
        "itional_inclusion.expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006820,
        "KHR-GL33.shaders.preprocessor.condi",
        "tional_inclusion.expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006821,
        "KHR-GL33.shaders.preprocessor.",
        "invalid_ops.invalid_op_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006822,
        "KHR-GL33.shaders.preprocessor.i",
        "nvalid_ops.invalid_op_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006823,
        "KHR-GL33.shaders.preprocessor.",
        "invalid_ops.invalid_op_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006824,
        "KHR-GL33.shaders.preprocessor.i",
        "nvalid_ops.invalid_op_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006825,
        "KHR-GL33.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006826,
        "KHR-GL33.shaders.preprocessor.invalid_ops.in",
        "valid_defined_expected_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006827,
        "KHR-GL33.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006828,
        "KHR-GL33.shaders.preprocessor.invalid_ops.in",
        "valid_defined_expected_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006829,
        "KHR-GL33.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006830,
        "KHR-GL33.shaders.preprocessor.invalid_ops.in",
        "valid_defined_expected_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006831,
        "KHR-GL33.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006832,
        "KHR-GL33.shaders.preprocessor.invalid_ops.in",
        "valid_defined_expected_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006833,
        "KHR-GL33.shaders.preprocessor.invalid_ops.i",
        "nvalid_defined_expected_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006834,
        "KHR-GL33.shaders.preprocessor.invalid_ops.in",
        "valid_defined_expected_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006835,
        "KHR-GL33.shaders.preprocessor.invalid_op",
        "s.invalid_defined_expected_rparen_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006836,
        "KHR-GL33.shaders.preprocessor.invalid_ops",
        ".invalid_defined_expected_rparen_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006837,
        "KHR-GL33.shaders.preprocessor.i",
        "nvalid_ops.defined_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006838,
        "KHR-GL33.shaders.preprocessor.in",
        "valid_ops.defined_define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006839,
        "KHR-GL33.shaders.preprocessor.un",
        "defined_identifiers.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006840,
        "KHR-GL33.shaders.preprocessor.und",
        "efined_identifiers.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006841,
        "KHR-GL33.shaders.preprocessor.undefi",
        "ned_identifiers.in_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006842,
        "KHR-GL33.shaders.preprocessor.undefin",
        "ed_identifiers.in_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006843,
        "KHR-GL33.shaders.preprocessor.undefine",
        "d_identifiers.not_used_in_eval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006844,
        "KHR-GL33.shaders.preprocessor.undefined",
        "_identifiers.not_used_in_eval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006845,
        "KHR-GL33.shaders.preprocessor.undefine",
        "d_identifiers.not_used_in_eval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006846,
        "KHR-GL33.shaders.preprocessor.undefined",
        "_identifiers.not_used_in_eval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006847,
        "KHR-GL33.shaders.preprocessor.inv",
        "alid_conditionals.empty_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006848,
        "KHR-GL33.shaders.preprocessor.inva",
        "lid_conditionals.empty_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006849,
        "KHR-GL33.shaders.preprocessor.inva",
        "lid_conditionals.empty_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006850,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_conditionals.empty_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006851,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_conditionals.empty_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006852,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.empty_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006853,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_conditionals.invalid_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006854,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.invalid_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006855,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.invalid_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006856,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.invalid_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006857,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.empty_if_defined_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006858,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.empty_if_defined_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006859,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.unterminated_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006860,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006861,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.unterminated_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006862,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006863,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006864,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006865,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006866,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006867,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_else_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006868,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_else_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006869,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_else_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006870,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_else_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006871,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006872,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006873,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006874,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006875,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.unterminated_elif_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006876,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.unterminated_elif_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006877,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.elif_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006878,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.elif_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006879,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.else_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006880,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.else_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006881,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006882,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006883,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.endif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006884,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.endif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006885,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.else_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006886,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.else_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006887,
        "KHR-GL33.shaders.preprocessor.invalid_co",
        "nditionals.nested_elif_without_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006888,
        "KHR-GL33.shaders.preprocessor.invalid_con",
        "ditionals.nested_elif_without_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006889,
        "KHR-GL33.shaders.preprocessor.inv",
        "alid_conditionals.if_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006890,
        "KHR-GL33.shaders.preprocessor.inva",
        "lid_conditionals.if_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006891,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_conditionals.tokens_after_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006892,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006893,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_elif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006894,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_elif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006895,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_conditionals.tokens_after_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006896,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006897,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_endif_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006898,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.tokens_after_endif_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006899,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006900,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.tokens_after_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006901,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "conditionals.tokens_after_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006902,
        "KHR-GL33.shaders.preprocessor.invalid_c",
        "onditionals.tokens_after_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006903,
        "KHR-GL33.shaders.preprocessor.invalid_cond",
        "itionals.unterminated_nested_blocks_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006904,
        "KHR-GL33.shaders.preprocessor.invalid_condi",
        "tionals.unterminated_nested_blocks_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006905,
        "KHR-GL33.shaders.preprocesso",
        "r.conditionals.ifdef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006906,
        "KHR-GL33.shaders.preprocessor",
        ".conditionals.ifdef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006907,
        "KHR-GL33.shaders.preprocesso",
        "r.conditionals.ifdef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006908,
        "KHR-GL33.shaders.preprocessor",
        ".conditionals.ifdef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006909,
        "KHR-GL33.shaders.preprocesso",
        "r.conditionals.ifdef_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006910,
        "KHR-GL33.shaders.preprocessor",
        ".conditionals.ifdef_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006911,
        "KHR-GL33.shaders.preprocessor",
        ".conditionals.ifndef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006912,
        "KHR-GL33.shaders.preprocessor.",
        "conditionals.ifndef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006913,
        "KHR-GL33.shaders.preprocessor",
        ".conditionals.ifndef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006914,
        "KHR-GL33.shaders.preprocessor.",
        "conditionals.ifndef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006915,
        "KHR-GL33.shaders.preprocessor.conditio",
        "nals.mixed_conditional_inclusion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006916,
        "KHR-GL33.shaders.preprocessor.condition",
        "als.mixed_conditional_inclusion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006917,
        "KHR-GL33.shaders.preprocessor.",
        "conditionals.nested_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006918,
        "KHR-GL33.shaders.preprocessor.c",
        "onditionals.nested_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006919,
        "KHR-GL33.shaders.preprocessor.",
        "conditionals.nested_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006920,
        "KHR-GL33.shaders.preprocessor.c",
        "onditionals.nested_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006921,
        "KHR-GL33.shaders.preprocessor.",
        "conditionals.nested_if_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006922,
        "KHR-GL33.shaders.preprocessor.c",
        "onditionals.nested_if_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006923,
        "KHR-GL33.shaders.preprocessor.dir",
        "ective.version_with_profile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006924,
        "KHR-GL33.shaders.preprocessor.dire",
        "ctive.version_with_profile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006925,
        "KHR-GL33.shaders.preprocessor.direct",
        "ive.version_leading_whitespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006926,
        "KHR-GL33.shaders.preprocessor.directi",
        "ve.version_leading_whitespace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006927,
        "KHR-GL33.shaders.preprocessor.direc",
        "tive.version_leading_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006928,
        "KHR-GL33.shaders.preprocessor.direct",
        "ive.version_leading_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006929,
        "KHR-GL33.shaders.preprocessor.d",
        "irective.version_is_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006930,
        "KHR-GL33.shaders.preprocessor.di",
        "rective.version_is_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006931,
        "KHR-GL33.shaders.preprocessor.d",
        "irective.version_is_more_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006932,
        "KHR-GL33.shaders.preprocessor.di",
        "rective.version_is_more_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006933,
        "KHR-GL33.shaders.preprocessor.direc",
        "tive.version_invalid_profile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006934,
        "KHR-GL33.shaders.preprocessor.direct",
        "ive.version_invalid_profile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006935,
        "KHR-GL33.shaders.preprocessor.d",
        "irective.version_missing_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006936,
        "KHR-GL33.shaders.preprocessor.di",
        "rective.version_missing_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006937,
        "KHR-GL33.shaders.preprocessor.directiv",
        "e.version_not_first_statement_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006938,
        "KHR-GL33.shaders.preprocessor.directive",
        ".version_not_first_statement_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006939,
        "KHR-GL33.shaders.preprocessor.directiv",
        "e.version_not_first_statement_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006940,
        "KHR-GL33.shaders.preprocessor.directive",
        ".version_not_first_statement_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006941,
        "KHR-GL33.shaders.preprocessor.direc",
        "tive.version_invalid_token_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006942,
        "KHR-GL33.shaders.preprocessor.direct",
        "ive.version_invalid_token_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006943,
        "KHR-GL33.shaders.preprocessor.direc",
        "tive.version_invalid_token_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006944,
        "KHR-GL33.shaders.preprocessor.direct",
        "ive.version_invalid_token_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006945,
        "KHR-GL33.shaders.preprocessor.d",
        "irective.invalid_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006946,
        "KHR-GL33.shaders.preprocessor.di",
        "rective.invalid_version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006947,
        "KHR-GL33.shaders.preprocessor.di",
        "rective.additional_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006948,
        "KHR-GL33.shaders.preprocessor.dir",
        "ective.additional_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006949,
        "KHR-GL33.shaders.preprocessor.dir",
        "ective.error_with_no_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006950,
        "KHR-GL33.shaders.preprocessor.dire",
        "ctive.error_with_no_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006951,
        "KHR-GL33.shaders.preproces",
        "sor.directive.error_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006952,
        "KHR-GL33.shaders.preprocess",
        "or.directive.error_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006953,
        "KHR-GL33.shaders.preproc",
        "essor.builtin.line_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006954,
        "KHR-GL33.shaders.preproce",
        "ssor.builtin.line_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006955,
        "KHR-GL33.shaders.preprocessor",
        ".builtin.line_and_file_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006956,
        "KHR-GL33.shaders.preprocessor.",
        "builtin.line_and_file_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006957,
        "KHR-GL33.shaders.preproce",
        "ssor.pragmas.pragma_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006958,
        "KHR-GL33.shaders.preproces",
        "sor.pragmas.pragma_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006959,
        "KHR-GL33.shaders.preprocessor.",
        "pragmas.pragma_macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006960,
        "KHR-GL33.shaders.preprocessor.p",
        "ragmas.pragma_macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006961,
        "KHR-GL33.shaders.preproces",
        "sor.extensions.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006962,
        "KHR-GL33.shaders.preprocess",
        "or.extensions.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006963,
        "KHR-GL33.shaders.preprocesso",
        "r.extensions.macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006964,
        "KHR-GL33.shaders.preprocessor",
        ".extensions.macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006965,
        "KHR-GL33.shaders.preprocessor.exten",
        "sions.missing_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006966,
        "KHR-GL33.shaders.preprocessor.extens",
        "ions.missing_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006967,
        "KHR-GL33.shaders.preprocessor.exten",
        "sions.invalid_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006968,
        "KHR-GL33.shaders.preprocessor.extens",
        "ions.invalid_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006969,
        "KHR-GL33.shaders.preprocessor.",
        "extensions.missing_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006970,
        "KHR-GL33.shaders.preprocessor.e",
        "xtensions.missing_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006971,
        "KHR-GL33.shaders.preprocessor.e",
        "xtensions.expected_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006972,
        "KHR-GL33.shaders.preprocessor.ex",
        "tensions.expected_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006973,
        "KHR-GL33.shaders.preprocessor.ex",
        "tensions.missing_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006974,
        "KHR-GL33.shaders.preprocessor.ext",
        "ensions.missing_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006975,
        "KHR-GL33.shaders.preprocessor.ext",
        "ensions.invalid_behavior_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006976,
        "KHR-GL33.shaders.preprocessor.exte",
        "nsions.invalid_behavior_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006977,
        "KHR-GL33.shaders.preprocessor.ext",
        "ensions.invalid_behavior_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006978,
        "KHR-GL33.shaders.preprocessor.exte",
        "nsions.invalid_behavior_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006979,
        "KHR-GL33.shaders.preprocessor.exte",
        "nsions.invalid_char_in_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006980,
        "KHR-GL33.shaders.preprocessor.exten",
        "sions.invalid_char_in_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006981,
        "KHR-GL33.shaders.preprocessor.extens",
        "ions.invalid_char_in_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006982,
        "KHR-GL33.shaders.preprocessor.extensi",
        "ons.invalid_char_in_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006983,
        "KHR-GL33.shaders.preprocessor.exte",
        "nsions.unterminated_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006984,
        "KHR-GL33.shaders.preprocessor.exten",
        "sions.unterminated_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006985,
        "KHR-GL33.shaders.preprocessor.extension",
        "s.after_non_preprocessing_tokens_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006986,
        "KHR-GL33.shaders.preprocessor.extensions",
        ".after_non_preprocessing_tokens_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006987,
        "KHR-GL33.shaders.preprocessor",
        ".expressions.shift_left_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006988,
        "KHR-GL33.shaders.preprocessor.",
        "expressions.shift_left_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006989,
        "KHR-GL33.shaders.preprocessor.",
        "expressions.shift_right_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006990,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.shift_right_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006991,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.cmp_less_than_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006992,
        "KHR-GL33.shaders.preprocessor.ex",
        "pressions.cmp_less_than_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006993,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006994,
        "KHR-GL33.shaders.preprocessor.ex",
        "pressions.less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006995,
        "KHR-GL33.shaders.preproce",
        "ssor.expressions.or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006996,
        "KHR-GL33.shaders.preproces",
        "sor.expressions.or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006997,
        "KHR-GL33.shaders.preproces",
        "sor.expressions.and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006998,
        "KHR-GL33.shaders.preprocess",
        "or.expressions.and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006999,
        "KHR-GL33.shaders.preproces",
        "sor.expressions.xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007000,
        "KHR-GL33.shaders.preprocess",
        "or.expressions.xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007001,
        "KHR-GL33.shaders.preproces",
        "sor.expressions.mod_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007002,
        "KHR-GL33.shaders.preprocess",
        "or.expressions.mod_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007003,
        "KHR-GL33.shaders.preprocessor.exp",
        "ressions.parenthesis_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007004,
        "KHR-GL33.shaders.preprocessor.expr",
        "essions.parenthesis_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007005,
        "KHR-GL33.shaders.preprocessor.exp",
        "ressions.parenthesis_tricky_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007006,
        "KHR-GL33.shaders.preprocessor.expr",
        "essions.parenthesis_tricky_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007007,
        "KHR-GL33.shaders.preprocessor.exp",
        "ressions.parenthesis_if_no_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007008,
        "KHR-GL33.shaders.preprocessor.expr",
        "essions.parenthesis_if_no_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007009,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.parenthesis_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007010,
        "KHR-GL33.shaders.preprocessor.ex",
        "pressions.parenthesis_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007011,
        "KHR-GL33.shaders.preprocessor.expr",
        "essions.parenthesis_multi_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007012,
        "KHR-GL33.shaders.preprocessor.expre",
        "ssions.parenthesis_multi_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007013,
        "KHR-GL33.shaders.preprocessor.expre",
        "ssions.parenthesis_single_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007014,
        "KHR-GL33.shaders.preprocessor.expres",
        "sions.parenthesis_single_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007015,
        "KHR-GL33.shaders.preprocessor.expres",
        "sions.parenthesis_ifelse_true_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007016,
        "KHR-GL33.shaders.preprocessor.express",
        "ions.parenthesis_ifelse_true_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007017,
        "KHR-GL33.shaders.preprocessor.expres",
        "sions.parenthesis_ifelse_false_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007018,
        "KHR-GL33.shaders.preprocessor.express",
        "ions.parenthesis_ifelse_false_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007019,
        "KHR-GL33.shaders.preprocessor.",
        "expressions.eval_basic_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007020,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.eval_basic_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007021,
        "KHR-GL33.shaders.preprocessor.",
        "expressions.eval_basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007022,
        "KHR-GL33.shaders.preprocessor.e",
        "xpressions.eval_basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007023,
        "KHR-GL33.shaders.preprocessor.expres",
        "sions.eval_simple_precedence_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007024,
        "KHR-GL33.shaders.preprocessor.express",
        "ions.eval_simple_precedence_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007025,
        "KHR-GL33.shaders.preprocessor.expres",
        "sions.eval_simple_precedence_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007026,
        "KHR-GL33.shaders.preprocessor.express",
        "ions.eval_simple_precedence_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007027,
        "KHR-GL33.shaders.preprocessor.invalid",
        "_expressions.invalid_unary_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007028,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "expressions.invalid_unary_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007029,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "expressions.invalid_binary_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007030,
        "KHR-GL33.shaders.preprocessor.invalid_e",
        "xpressions.invalid_binary_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007031,
        "KHR-GL33.shaders.preprocessor.inva",
        "lid_expressions.missing_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007032,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_expressions.missing_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007033,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007034,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007035,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007036,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007037,
        "KHR-GL33.shaders.preprocessor.inval",
        "id_expressions.invalid_expr_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007038,
        "KHR-GL33.shaders.preprocessor.invali",
        "d_expressions.invalid_expr_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007039,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "expressions.unopened_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007040,
        "KHR-GL33.shaders.preprocessor.invalid_e",
        "xpressions.unopened_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007041,
        "KHR-GL33.shaders.preprocessor.invalid_",
        "expressions.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007042,
        "KHR-GL33.shaders.preprocessor.invalid_e",
        "xpressions.unclosed_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007043,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.modulo_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007044,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.modulo_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007045,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.div_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007046,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.div_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007047,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.mul_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007048,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007049,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.modulo_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007050,
        "KHR-GL33.shaders.preprocessor.operator_",
        "precedence.modulo_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007051,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.modulo_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007052,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.modulo_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007053,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.modulo_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007054,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.modulo_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007055,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.div_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007056,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.div_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007057,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.div_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007058,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.div_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007059,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.div_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007060,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.div_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007061,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.mul_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007062,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.mul_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007063,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007064,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.mul_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007065,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007066,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.mul_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007067,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.sub_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007068,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.sub_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007069,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.sub_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007070,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.sub_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007071,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.sub_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007072,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.sub_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007073,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.add_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007074,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.add_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007075,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.add_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007076,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.add_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007077,
        "KHR-GL33.shaders.preprocessor.ope",
        "rator_precedence.add_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007078,
        "KHR-GL33.shaders.preprocessor.oper",
        "ator_precedence.add_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007079,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.rshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007080,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.rshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007081,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.rshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007082,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.rshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007083,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.lshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007084,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.lshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007085,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.lshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007086,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.lshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007087,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.greater_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007088,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.greater_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007089,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.greater_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007090,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.greater_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007091,
        "KHR-GL33.shaders.preprocessor.operator_p",
        "recedence.less_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007092,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.less_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007093,
        "KHR-GL33.shaders.preprocessor.operator_p",
        "recedence.less_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007094,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.less_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007095,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.greater_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007096,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.greater_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007097,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.greater_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007098,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.greater_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007099,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.less_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007100,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.less_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007101,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.less_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007102,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.less_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007103,
        "KHR-GL33.shaders.preprocessor.operator_prec",
        "edence.not_equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007104,
        "KHR-GL33.shaders.preprocessor.operator_prece",
        "dence.not_equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007105,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.not_equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007106,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.not_equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007107,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.not_equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007108,
        "KHR-GL33.shaders.preprocessor.operator_",
        "precedence.not_equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007109,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.not_equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007110,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.not_equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007111,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007112,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007113,
        "KHR-GL33.shaders.preprocessor.operator_",
        "precedence.equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007114,
        "KHR-GL33.shaders.preprocessor.operator_p",
        "recedence.equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007115,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007116,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007117,
        "KHR-GL33.shaders.preprocessor.opera",
        "tor_precedence.equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007118,
        "KHR-GL33.shaders.preprocessor.operat",
        "or_precedence.equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007119,
        "KHR-GL33.shaders.preprocessor.operator_p",
        "recedence.bitwise_and_vs_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007120,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.bitwise_and_vs_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007121,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.bitwise_and_vs_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007122,
        "KHR-GL33.shaders.preprocessor.operator_",
        "precedence.bitwise_and_vs_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007123,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.xor_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007124,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.xor_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007125,
        "KHR-GL33.shaders.preprocessor.operato",
        "r_precedence.bitwise_or_vs_xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007126,
        "KHR-GL33.shaders.preprocessor.operator",
        "_precedence.bitwise_or_vs_xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007127,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.logical_and_vs_bitwise_or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007128,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.logical_and_vs_bitwise_or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007129,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.logical_and_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007130,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.logical_and_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007131,
        "KHR-GL33.shaders.preprocessor.operator_pr",
        "ecedence.logical_or_vs_logical_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_007132,
        "KHR-GL33.shaders.preprocessor.operator_pre",
        "cedence.logical_or_vs_logical_and_fragment");
