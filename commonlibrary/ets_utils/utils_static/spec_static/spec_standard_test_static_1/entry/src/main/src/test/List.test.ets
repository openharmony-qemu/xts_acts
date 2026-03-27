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
import UndefinedFixVerificationTest from "./undefined/UndefinedFixVerification.test";
import UndefinedTypeSafetyTest from "./undefined/UndefinedTypeSafety.test";
import StatementsTest from "./statements/StatementsTest.test";

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
  UndefinedFixVerificationTest();
  UndefinedTypeSafetyTest();
  StatementsTest();
}