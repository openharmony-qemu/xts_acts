'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ProgramEntryPointTest from "./modulesandnamespaces/programentrypoint/ProgramEntryPointTest.test";
import StandArdLibraryUsageTest from "./modulesandnamespaces/standardlibraryusage/StandArdLibraryUsageTest.test";
import TopLevelStatementsTest from "./modulesandnamespaces/toplevelstatements/TopLevelStatementsTest.test";
import ImportDirectivesTest from "./modulesandnamespaces/importdirectives/ImportDirectivesTest.test";
import ImportPathDirTest from "./modulesandnamespaces/importdirectives/importpath/dir/ImportPathDirTest.test";
import ImportTypeDirectiveTest from "./modulesandnamespaces/importdirectives/importtypedirective/ImportTypeDirectiveTest.test";
import SelectiveBindingTest from "./modulesandnamespaces/importdirectives/selectivebinding/SelectiveBindingTest.test";
import SeveralBindingsForOneImportPathTest from "./modulesandnamespaces/importdirectives/severalbindingsforoneimportpath/SeveralBindingsForOneImportPathTest.test";
import NameSpaceDeclarationsTest from "./modulesandnamespaces/namespacedeclarations/NameSpaceDeclarationsTest.test";
import ImportPathFileTest from "./modulesandnamespaces/importdirectives/importpath/file/ImportPathFileTest.test";

import EnumerationDoubleValuesTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/enumerationdoublevalues/EnumerationDoubleValuesTest.test";
import EnumerationTypeAnnotationTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/enumerationtypeannotation/EnumerationTypeAnnotationTest.test";
import AdditiveExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/additiveexpressions/AdditiveExpressionsTest.test';
import BitwiseExpressionsTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/bitwiseexpressions/BitwiseExpressionsTest.test";
import EqualityExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/equalityexpressions/EqualityExpressionsTest.test';
import ShiftExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/shiftexpressions/ShiftExpressionsTest.test';
import UnaryExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/unaryexpressions/UnaryExpressionsTest.test';
import EnumerationMethodsTest01 from "./experimentalfeatures/enumerationsexperimental/enumerationmethods/EnumerationMethodsTest01.test";
import EnumerationMethodsTest03 from "./experimentalfeatures/enumerationsexperimental/enumerationmethods/EnumerationMethodsTest03.test";
import EnumerationMethodsTest02 from "./experimentalfeatures/enumerationsexperimental/enumerationmethods/EnumerationMethodsTest02.test";
import EnumerationWithExplicitTypeTest01 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest01.test";
import EnumerationWithExplicitTypeTest02 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest02.test";
import EnumerationWithExplicitTypeTest03 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest03.test";
import EnumerationWithExplicitTypeTest04 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest04.test";
import EnumerationWithExplicitTypeTest05 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest05.test";
import EnumerationWithExplicitTypeTest06 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest06.test";
import EnumerationWithExplicitTypeTest07 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest07.test";
import EnumerationWithExplicitTypeTest08 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest08.test";
import EnumerationWithExplicitTypeTest09 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest09.test";
import EnumerationWithExplicitTypeTest10 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest10.test";
import EnumerationWithExplicitTypeTest11 from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest11.test";
import IndexableTypesTest from "./experimentalfeatures/indexabletypes/IndexableTypesTest.test";
import CallableTypesWithInvokeMethodTest from "./experimentalfeatures/callabletypes/callabletypeswithinvokemethod/CallableTypesWithInvokeMethodTest.test";
import CallableTypesWithInstantiateMethodTest from "./experimentalfeatures/callabletypes/callabletypeswithinstantiatemethod/CallableTypesWithInstantiateMethodTest.test";
import CallableTypesTest from "./experimentalfeatures/callabletypes/CallableTypesTest.test";
import ForOfTypeAnnotationTest from './experimentalfeatures/statements/foroftypeannotation/ForOfTypeAnnotationTest.test';
import ExplicitClassMethodOverloadTest from "./experimentalfeatures/explicitoverloaddeclarations/explicitclassmethodoverload/ExplicitClassMethodOverloadTest.test";
import ExplicitInterfaceMethodOverloadTest from './experimentalfeatures/explicitoverloaddeclarations/explicitinterfacemethodoverload/ExplicitInterfaceMethodOverloadTest.test';
import FinalClass from './experimentalfeatures/classesexperimental/finalclasses/FinalClassTest.test';
import FinalMethodsTest from "./experimentalfeatures/classesexperimental/finalmethods/FinalMethodsTest.test";
import DefaultInterfaceMethodDeclarationsTest from "./experimentalfeatures/defaultinterfacemethoddeclarations/DefaultInterfaceMethodDeclarationsTest.test";
import LambdaExpressionsWithReceiverTest from "./experimentalfeatures/addingfunctionalitytoexistingtypes/lambdaexpressionswithreceiver/LambdaExpressionsWithReceiverTest.test";
import FunctionTypesWithReceiverTest from  "./experimentalfeatures/addingfunctionalitytoexistingtypes/functiontypeswithreceiver/FunctionTypesWithReceiverTest.test";
import FunctionsWithReceiverTest from "./experimentalfeatures/addingfunctionalitytoexistingtypes/functionswithreceiver/FunctionsWithReceiverTest.test";
import AccessorsWithReceiverTest from  "./experimentalfeatures/addingfunctionalitytoexistingtypes/accessorswithreceiver/AccessorsWithReceiverTest.test";
import TrailingLambdasTest from "./experimentalfeatures/trailinglambdas/TrailingLambdasTest.test";
import DestructuringAssignmentTest from './experimentalfeatures/patternmatching/destructuringassignment/DestructuringAssignmentTest.test';
import GenericsExperimentalTest from './experimentalfeatures/genericsexperimental/GenericsExperimentalTest.test';
import NonNullishTypeParameterTest from './experimentalfeatures/genericsexperimental/nonnullishtypeparameter/NonNullishTypeParameterTest.test';

import NumericDefaultLiteralTypesTest01 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest01.test';
import NumericDefaultLiteralTypesTest02 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest02.test';
import NumericDefaultLiteralTypesTest03 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest03.test';
import NumericDefaultLiteralTypesTest04 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest04.test';
import NumericDefaultLiteralTypesTest05 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest05.test';
import ReturnTypeInferenceTest01 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest01.test'
import ReturnTypeInferenceTest02 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest02.test'
import ReturnTypeInferenceTest03 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest03.test'
import ReturnTypeInferenceTest04 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest04.test'
import ComputingSmartTypesTest01 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest01.test'
import ComputingSmartTypesTest10 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest10.test'
import ComputingSmartTypesTest11 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest11.test'
import ComputingSmartTypesTest20 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest20.test'
import IntersectionTypesTest from './semanticrules/smartcastsandsmarttypes/intersectiontypes/IntersectionTypesTest.test'
import SmartCastExamplesTest from './semanticrules/smartcastsandsmarttypes/smartcastexamples/SmartCastExamplesTest.test'
import OverrideCompatibleSignaturesTest02 from './semanticrules/overriding/overridecompatiblesignatures/OverrideCompatibleSignaturesTest02.test'
import OverrideCompatibleSignaturesTest03 from './semanticrules/overriding/overridecompatiblesignatures/OverrideCompatibleSignaturesTest03.test'
import OverrideCompatibleSignaturesTest04 from './semanticrules/overriding/overridecompatiblesignatures/OverrideCompatibleSignaturesTest04.test'
import OverrideCompatibleSignaturesTest05 from './semanticrules/overriding/overridecompatiblesignatures/OverrideCompatibleSignaturesTest05.test'
import OverridingConflictTest from './semanticrules/overriding/overridingconflict/OverridingConflictTest.test';
import OverridingInClassesTest from './semanticrules/overriding/overridinginclasses/OverridingInClassesTest.test'
import OverridingTest from './semanticrules/overriding/overridingininterfaces/OverridingTest.test'
import FirstMatchTest01 from './semanticrules/overloading/firstmatch/FirstMatchTest01.test'
import FirstMatchTest02 from './semanticrules/overloading/firstmatch/FirstMatchTest02.test'
import FirstMatchTest03 from './semanticrules/overloading/firstmatch/FirstMatchTest03.test'
import FirstMatchTest04 from './semanticrules/overloading/firstmatch/FirstMatchTest04.test'
import SingleClassOverloadTest from './semanticrules/overloading/SingleClassOverloadTest.test'
import ImplicitConstructorOverloadingTest01 from './semanticrules/overloading/implicitconstructoroverloading/ImplicitConstructorOverloadingTest01.test'
import ImplicitConstructorOverloadingTest02 from './semanticrules/overloading/implicitconstructoroverloading/ImplicitConstructorOverloadingTest02.test'
import ImplicitConstructorOverloadingTest03 from './semanticrules/overloading/implicitconstructoroverloading/ImplicitConstructorOverloadingTest03.test'
import ImplicitFunctionOverloadingTest01 from './semanticrules/overloading/implicitfunctionoverloading/ImplicitFunctionOverloadingTest01.test'
import ImplicitFunctionOverloadingTest02 from './semanticrules/overloading/implicitfunctionoverloading/ImplicitFunctionOverloadingTest02.test'
import ImplicitMethodOverloadingTest01 from './semanticrules/overloading/implicitmethodoverloading/ImplicitMethodOverloadingTest01.test'
import ImplicitMethodOverloadingTest02 from './semanticrules/overloading/implicitmethodoverloading/ImplicitMethodOverloadingTest02.test'
import ImplicitMethodOverloadingTest03 from './semanticrules/overloading/implicitmethodoverloading/ImplicitMethodOverloadingTest03.test'
import InterfacesTest from './semanticrules/overloading/interfaces/InterfacesTest.test'
import OverloadEquivalentSignaturesTest from './semanticrules/overloading/overloadequivalentsignatures/OverloadEquivalentSignaturesTest.test'
import OverloadWithImportTest01 from './semanticrules/overloading/overloadwithimport/OverloadWithImportTest01.test'
import OverloadWithImportTest02 from './semanticrules/overloading/overloadwithimport/OverloadWithImportTest02.test'
import OverloadWithImportTest03 from './semanticrules/overloading/overloadwithimport/OverloadWithImportTest03.test'

import FixedArrayTypesTest from "./experimentalfeatures/fixedarraytypes/FixedArrayTypesTest.test";
import ExtendedConditionalExpressionsTest01 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest01.test";
import DispatchTest from "./semanticrules/dispatch/DispatchTest.test";
import OverloadSetForClassInstanceMethodsTest from "./semanticrules/overloadresolution/overloadsetforclassinstancemethods/OverloadSetForClassInstanceMethodsTest.test";
import OverloadSetForConstructorsTest02 from "./semanticrules/overloadresolution/overloadsetforconstructors/OverloadSetForConstructorsTest02.test";
import OverloadSetForFunctionsTest01 from "./semanticrules/overloadresolution/overloadsetforfunctions/OverloadSetForFunctionsTest01.test";
import StaticInitializationExecOrderTest from "./semanticrules/staticinitialization/execorder/StaticInitializationExecOrderTest.test";
import StaticInitializationIncompleteTest from "./semanticrules/staticinitialization/incompleteinitialization/StaticInitializationIncompleteTest.test";
import StaticInitializationNamespaceTest from "./semanticrules/staticinitialization/namespace/StaticInitializationNamespaceTest.test";
import StaticInitializationSafetyTest from "./semanticrules/staticinitialization/staticinitializationsafety/StaticInitializationSafetyTest.test";
import StaticInitializationTest from "./semanticrules/staticinitialization/StaticInitializationTest.test";
import TypeErasureTest from "./semanticrules/typeerasure/TypeErasureTest.test";

import SpecificsOfAssignmentLikeContexts from './semanticrules/semanticessentials/AssignmentContextPositiveCases.test'
import BinaryOverflow from './semanticrules/semanticessentials/BinaryOverflow.test'
import CompoundAssignmentByte from './semanticrules/semanticessentials/CompoundAssignmentByte.test'
import CompoundAssignmentInt from './semanticrules/semanticessentials/CompoundAssignmentInt.test'
import CompoundAssignmentMixed from './semanticrules/semanticessentials/CompoundAssignmentMixed.test'
import CompoundAssignmentShort from './semanticrules/semanticessentials/CompoundAssignmentShort.test'
import DecrementUnaryOverflow from './semanticrules/semanticessentials/DecrementUnaryOverflow.test'
import NumericExpressions from './semanticrules/semanticessentials/NumericExpressions.test'
import SpecificsOfVariableInitializationContext from './semanticrules/semanticessentials/SpecificsOfVariableInitializationContext.test'
import TypeOfStandaloneExpression from './semanticrules/semanticessentials/TypeOfStandaloneExpression.test'
import UnaryOverflow from './semanticrules/semanticessentials/UnaryOverflow.test'
import SpecificsOfStringOperatorContextsTest from './semanticrules/semanticessentials/SpecificsOfStringOperatorContextsTest.test'
import SpecificsOfTypeParametersTest from './semanticrules/semanticessentials/SpecificsOfTypeParametersTest.test'
import ArrayTypesIdentityTest from './semanticrules/typeidentity/ArrayTypesIdentityTest.test'
import UnionTypesIdentityTest from './semanticrules/typeidentity/UnionTypesIdentityTest.test'
import SemanticRulesTypeIdentity from './semanticrules/typeidentity/SemanticRulesTypeIdentity.test'
import TypeIdentityCaseTest from './semanticrules/typeidentity/TypeIdentityCaseTest.test'
import ArrayOfArraysTypesIdentityTest from './semanticrules/typeidentity/ArrayOfArraysTypesIdentityTest.test'
import AssignabilityTest from './semanticrules/assignability/AssignabilityTest.test'
import InvarianceCovarianceAndContravarianceContravarianceTest from './semanticrules/invariancecovarianceandcontravariance/InvarianceCovarianceAndContravarianceContravarianceTest.test'
import InvarianceCovarianceAndContravarianceCovarianceTest from './semanticrules/invariancecovarianceandcontravariance/InvarianceCovarianceAndContravarianceCovarianceTest.test'
import InvarianceCovarianceAndContravarianceExamplesTest from './semanticrules/invariancecovarianceandcontravariance/InvarianceCovarianceAndContravarianceExamplesTest.test'
import InvarianceCovarianceAndContravarianceInvarianceTest from './semanticrules/invariancecovarianceandcontravariance/InvarianceCovarianceAndContravarianceInvarianceTest.test'
import AsymmetricVerificationCaseTest from './semanticrules/compatibilitycallargs/AsymmetricVerificationCaseTest.test'
import BoundaryCaseTest from './semanticrules/compatibilitycallargs/BoundaryCaseTest.test'
import DiffTypeCompatCaseTest from './semanticrules/compatibilitycallargs/DiffTypeCompatCaseTest.test'
import ImplicitCompatCaseTest from './semanticrules/compatibilitycallargs/ImplicitCompatCaseTest.test'
import InheritanceRelationshipCompatibilityCaseTest from './semanticrules/compatibilitycallargs/InheritanceRelationshipCompatibilityCaseTest.test'
import InterfaceImplementationCompatibilityCaseTest from './semanticrules/compatibilitycallargs/InterfaceImplementationCompatibilityCaseTest.test'
import RestParameterWithOptionalTest from './semanticrules/compatibilitycallargs/RestParameterWithOptionalTest.test'
import RestParamsSpreadTest from './semanticrules/compatibilitycallargs/RestParamsSpreadTest.test'
import RestParamsTest from './semanticrules/compatibilitycallargs/RestParamsTest.test'
import SameTypeCompatNoImplicitCaseTest from './semanticrules/compatibilitycallargs/SameTypeCompatNoImplicitCaseTest.test'
import SingleParamsTest from './semanticrules/compatibilitycallargs/SingleParamsTest.test'
import SpecExamples2Test from './semanticrules/compatibilitycallargs/SpecExamples2Test.test'
import SpecExamplesTest from './semanticrules/compatibilitycallargs/SpecExamplesTest.test'
import TupleRestParamsTest from './semanticrules/compatibilitycallargs/TupleRestParamsTest.test'

export default function testsuite(): void {

  ProgramEntryPointTest();
  StandArdLibraryUsageTest();
  TopLevelStatementsTest();
  NameSpaceDeclarationsTest();
  ImportDirectivesTest();
  ImportPathDirTest();
  ImportTypeDirectiveTest();
  SelectiveBindingTest();
  SeveralBindingsForOneImportPathTest();
  ImportPathFileTest();
  GenericsExperimentalTest();
  NonNullishTypeParameterTest();
  DestructuringAssignmentTest();
  FinalClass();
  AdditiveExpressionsTest();
  BitwiseExpressionsTest();
  EqualityExpressionsTest();
  ShiftExpressionsTest();
  UnaryExpressionsTest();
  EnumerationMethodsTest01();
  EnumerationMethodsTest03();
  EnumerationMethodsTest02();
  CallableTypesTest();
  CallableTypesWithInvokeMethodTest();
  CallableTypesWithInstantiateMethodTest();
  FinalMethodsTest()
  DefaultInterfaceMethodDeclarationsTest()
  FunctionsWithReceiverTest()
  AccessorsWithReceiverTest()
  FunctionTypesWithReceiverTest()
  EnumerationDoubleValuesTest();
  EnumerationTypeAnnotationTest();
  EnumerationWithExplicitTypeTest01();
  EnumerationWithExplicitTypeTest02();
  EnumerationWithExplicitTypeTest03();
  EnumerationWithExplicitTypeTest04();
  EnumerationWithExplicitTypeTest05();
  EnumerationWithExplicitTypeTest06();
  EnumerationWithExplicitTypeTest07();
  EnumerationWithExplicitTypeTest08();
  EnumerationWithExplicitTypeTest09();
  EnumerationWithExplicitTypeTest10();
  EnumerationWithExplicitTypeTest11();
  IndexableTypesTest();
  LambdaExpressionsWithReceiverTest();
  TrailingLambdasTest();
  ExplicitClassMethodOverloadTest();
  ForOfTypeAnnotationTest();
  ExplicitInterfaceMethodOverloadTest();
  NumericDefaultLiteralTypesTest01();
  NumericDefaultLiteralTypesTest02();
  NumericDefaultLiteralTypesTest03();
  NumericDefaultLiteralTypesTest04();
  NumericDefaultLiteralTypesTest05();
  ReturnTypeInferenceTest01();
  ReturnTypeInferenceTest02();
  ReturnTypeInferenceTest03();
  ReturnTypeInferenceTest04();
  ComputingSmartTypesTest01();
  ComputingSmartTypesTest10();
  ComputingSmartTypesTest11();
  ComputingSmartTypesTest20();
  IntersectionTypesTest();
  SmartCastExamplesTest();
  OverridingInClassesTest();
  OverridingTest();
  OverrideCompatibleSignaturesTest02();
  OverrideCompatibleSignaturesTest03();
  OverrideCompatibleSignaturesTest04();
  OverrideCompatibleSignaturesTest05();
  OverridingConflictTest();
  SingleClassOverloadTest();
  ImplicitFunctionOverloadingTest01();
  ImplicitFunctionOverloadingTest02();
  ImplicitMethodOverloadingTest01();
  ImplicitMethodOverloadingTest02();
  ImplicitMethodOverloadingTest03();
  ImplicitConstructorOverloadingTest01();
  ImplicitConstructorOverloadingTest02();
  ImplicitConstructorOverloadingTest03();
  OverloadEquivalentSignaturesTest();
  FirstMatchTest01();
  FirstMatchTest02();
  FirstMatchTest03();
  FirstMatchTest04();
  InterfacesTest();
  OverloadWithImportTest01();
  OverloadWithImportTest02();
  OverloadWithImportTest03();
  DispatchTest();
  ExtendedConditionalExpressionsTest01();
  FixedArrayTypesTest();
  OverloadSetForClassInstanceMethodsTest();
  OverloadSetForConstructorsTest02();
  OverloadSetForFunctionsTest01();
  StaticInitializationExecOrderTest();
  StaticInitializationIncompleteTest();
  StaticInitializationNamespaceTest();
  StaticInitializationSafetyTest();
  StaticInitializationTest();
  TypeErasureTest();
  SpecificsOfAssignmentLikeContexts();
  BinaryOverflow();
  CompoundAssignmentByte();
  CompoundAssignmentInt();
  CompoundAssignmentMixed();
  CompoundAssignmentShort();
  DecrementUnaryOverflow();
  NumericExpressions();
  SpecificsOfVariableInitializationContext();
  TypeOfStandaloneExpression();
  UnaryOverflow();
  SpecificsOfStringOperatorContextsTest();
  SpecificsOfTypeParametersTest();
  ArrayTypesIdentityTest();
  UnionTypesIdentityTest();
  SemanticRulesTypeIdentity();
  TypeIdentityCaseTest();
  ArrayOfArraysTypesIdentityTest();
  AssignabilityTest();
  InvarianceCovarianceAndContravarianceContravarianceTest();
  InvarianceCovarianceAndContravarianceCovarianceTest();
  InvarianceCovarianceAndContravarianceExamplesTest();
  InvarianceCovarianceAndContravarianceInvarianceTest();
  AsymmetricVerificationCaseTest();
  BoundaryCaseTest();
  DiffTypeCompatCaseTest();
  ImplicitCompatCaseTest();
  InheritanceRelationshipCompatibilityCaseTest();
  InterfaceImplementationCompatibilityCaseTest();
  RestParameterWithOptionalTest();
  RestParamsSpreadTest();
  RestParamsTest();
  SameTypeCompatNoImplicitCaseTest();
  SingleParamsTest();
  SpecExamples2Test();
  SpecExamplesTest();
  TupleRestParamsTest();
}