/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import AnnotationsTest from "./Annotations/annotations.test";
import AssignmentLikeContextsTest from "./contextsandconversions/AssignmentLikeContextsTest.test";
import AttemptInvalidTypeConversionTest from "./contextsandconversions/AttemptInvalidTypeConversionTest.test";
import ImplicitConversionsTest from "./contextsandconversions/ImplicitConversionsTest.test";
import NumericCastingConversionsTest from "./contextsandconversions/NumericCastingConversionsTest.test";
import NumericOperatorContextsTest from "./contextsandconversions/NumericOperatorContextsTest.test";
import StringOperatorContextsTest from "./contextsandconversions/StringOperatorContextsTest.test";
import GenericsDeclarationsCreate from "./generics/generic_declarations/create_array_using_generic_types/GenericsDeclarationsCreate.test";
import GenericClassesInheritance from "./generics/generic_declarations/generic_classes/generic_inheritance/GenericClassesInheritance.test";
import GenericClassesImplement from "./generics/generic_declarations/generic_classes/implementation_of_different_types/GenericClassesImplement.test";
import GenericClassesBridge from "./generics/generic_declarations/generic_classes/test_bridge_methods_in_generic_overrides/GenericClassesBridge.test";
import GenericDeclarationsFunction from "./generics/generic_declarations/generic_functions/GenericDeclarationsFunction.test";
import GenericDeclarationsInOut from "./generics/generic_declarations/generic_in_out/GenericDeclarationsInOut.test";
import GenericDeclarationsInterfaces from "./generics/generic_declarations/generic_interfaces/GenericDeclarationsInterfaces.test";
import GenericDeclarationsTypeAlias from "./generics/generic_declarations/generic_type_alias/GenericDeclarationsTypeAlias.test";
import GenericInstantiations from "./generics/generic_instantiations/explicit_generic_instantiations/GenericInstantiations.test";
import GenericInstantiationsImplicit from "./generics/generic_instantiations/implicit_generic_instantiations/GenericInstantiationsImplicit.test";
import TypeArguments from "./generics/generic_instantiations/type_arguments/type_arguments_of_parameterized_declarations/TypeArguments.test";
import TypeArguments_1 from "./generics/generic_instantiations/type_arguments/type_arguments_of_parameterized_declarations/TypeArguments_1.test";
import UndefinedFixVerificationTest from "./undefined/UndefinedFixVerification.test";
import UndefinedTypeSafetyTest from "./undefined/UndefinedTypeSafety.test";
import StatementsTest from "./statements/StatementsTest.test";
import AwaitedUtilityType from "./generics/utility_types/awaited_utility_type/AwaitedUtilityType.test";
import NestingUtilityType from "./generics/utility_types/nesting_utility_type/NestingUtilityType.test";
import NonNullableUtilityType from "./generics/utility_types/nonnullable_utility_type/NonNullableUtilityType.test";
import RequiredUtilityType from "./generics/utility_types/required_utility_type/RequiredUtilityType.test";
import PartialUtilityType from "./generics/utility_types/partial_utility_type/PartialUtilityType.test";
import GenericClassesConstraint from "./generics/type_parameters/type_parameter_constraint/generic_classes/GenericClassesConstraint.test";
import GenericFunctionsConstraint from "./generics/type_parameters/type_parameter_constraint/generic_functions/GenericFunctionsConstraint.test";
import GenericMethodsConstraint from "./generics/type_parameters/type_parameter_constraint/generic_methods/GenericMethodsConstraint.test";
import GenericTypeAliasConstraint from "./generics/type_parameters/type_parameter_constraint/generic_type_alias/GenericTypeAliasConstraint.test";

export default function testsuite() {
  AssignmentLikeContextsTest();
  AnnotationsTest();
  AttemptInvalidTypeConversionTest();
  ImplicitConversionsTest();
  NumericCastingConversionsTest();
  NumericOperatorContextsTest();
  StringOperatorContextsTest();
  GenericsDeclarationsCreate();
  GenericClassesInheritance();
  GenericClassesImplement();
  GenericClassesBridge();
  GenericDeclarationsFunction();
  GenericDeclarationsInterfaces();
  GenericDeclarationsInOut();
  GenericDeclarationsTypeAlias();
  GenericInstantiations();
  GenericInstantiationsImplicit();
  TypeArguments();
  TypeArguments_1();
  UndefinedFixVerificationTest();
  UndefinedTypeSafetyTest();
  StatementsTest();
  AwaitedUtilityType();
  NestingUtilityType();
  NonNullableUtilityType();
  RequiredUtilityType();
  PartialUtilityType();
  GenericClassesConstraint();
  GenericFunctionsConstraint();
  GenericMethodsConstraint();
  GenericTypeAliasConstraint();
}