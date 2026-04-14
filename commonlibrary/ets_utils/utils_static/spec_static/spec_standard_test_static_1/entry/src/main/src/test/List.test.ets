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
import GenericsDeclarationsCreateTest from "./generics/generic_declarations/create_array_using_generic_types/GenericsDeclarationsCreate.test";
import GenericClassesInheritanceTest from "./generics/generic_declarations/generic_classes/generic_inheritance/GenericClassesInheritance.test";
import GenericClassesImplementTest from "./generics/generic_declarations/generic_classes/implementation_of_different_types/GenericClassesImplement.test";
import GenericClassesBridgeTest from "./generics/generic_declarations/generic_classes/test_bridge_methods_in_generic_overrides/GenericClassesBridge.test";
import GenericDeclarationsFunctionTest from "./generics/generic_declarations/generic_functions/GenericDeclarationsFunction.test";
import GenericDeclarationsInOutTest from "./generics/generic_declarations/generic_in_out/GenericDeclarationsInOut.test";
import GenericDeclarationsInterfacesTest from "./generics/generic_declarations/generic_interfaces/GenericDeclarationsInterfaces.test";
import GenericDeclarationsTypeAliasTest from "./generics/generic_declarations/generic_type_alias/GenericDeclarationsTypeAlias.test";
import GenericInstantiationsTest from "./generics/generic_instantiations/explicit_generic_instantiations/GenericInstantiations.test";
import GenericInstantiationsImplicitTest from "./generics/generic_instantiations/implicit_generic_instantiations/GenericInstantiationsImplicit.test";
import TypeArgumentsTest from "./generics/generic_instantiations/type_arguments/type_arguments_of_parameterized_declarations/TypeArguments.test";
import TypeArguments_1Test from "./generics/generic_instantiations/type_arguments/type_arguments_of_parameterized_declarations/TypeArguments_1.test";
import UndefinedFixVerificationTest from "./undefined/UndefinedFixVerification.test";
import UndefinedTypeSafetyTest from "./undefined/UndefinedTypeSafety.test";
import StatementsTest from "./statements/StatementsTest.test";
import AwaitedUtilityTypeTest from "./generics/utility_types/awaited_utility_type/AwaitedUtilityType.test";
import NestingUtilityTypeTest from "./generics/utility_types/nesting_utility_type/NestingUtilityType.test";
import NonNullableUtilityTypeTest from "./generics/utility_types/nonnullable_utility_type/NonNullableUtilityType.test";
import RequiredUtilityTypeTest from "./generics/utility_types/required_utility_type/RequiredUtilityType.test";
import PartialUtilityTypeTest from "./generics/utility_types/partial_utility_type/PartialUtilityType.test";
import GenericClassesConstraintTest from "./generics/type_parameters/type_parameter_constraint/generic_classes/GenericClassesConstraint.test";
import GenericFunctionsConstraintTest from "./generics/type_parameters/type_parameter_constraint/generic_functions/GenericFunctionsConstraint.test";
import GenericMethodsConstraintTest from "./generics/type_parameters/type_parameter_constraint/generic_methods/GenericMethodsConstraint.test";
import GenericTypeAliasConstraintTest from "./generics/type_parameters/type_parameter_constraint/generic_type_alias/GenericTypeAliasConstraint.test";
import GenericTypeParameterDefaultTest from "./generics/type_parameters/type_parameter_default/GenericTypeParameterDefault.test";
import GenericClassesVarianceTest from "./generics/type_parameters/type_parameter_variance/generic_classes/GenericClassesVariance.test";
import GenericInterfacesVarianceTest from "./generics/type_parameters/type_parameter_variance/generic_interfaces/GenericInterfacesVariance.test";

export default function testsuite() {
  AssignmentLikeContextsTest();
  AnnotationsTest();
  AttemptInvalidTypeConversionTest();
  ImplicitConversionsTest();
  NumericCastingConversionsTest();
  NumericOperatorContextsTest();
  StringOperatorContextsTest();
  GenericsDeclarationsCreateTest();
  GenericClassesInheritanceTest();
  GenericClassesImplementTest();
  GenericClassesBridgeTest();
  GenericDeclarationsFunctionTest();
  GenericDeclarationsInterfacesTest();
  GenericDeclarationsInOutTest();
  GenericDeclarationsTypeAliasTest();
  GenericInstantiationsTest();
  GenericInstantiationsImplicitTest();
  TypeArgumentsTest();
  TypeArguments_1Test();
  UndefinedFixVerificationTest();
  UndefinedTypeSafetyTest();
  StatementsTest();
  AwaitedUtilityTypeTest();
  NestingUtilityTypeTest();
  NonNullableUtilityTypeTest();
  RequiredUtilityTypeTest();
  PartialUtilityTypeTest();
  GenericClassesConstraintTest();
  GenericFunctionsConstraintTest();
  GenericMethodsConstraintTest();
  GenericTypeAliasConstraintTest();
  GenericTypeParameterDefaultTest();
  GenericClassesVarianceTest();
  GenericInterfacesVarianceTest();
}