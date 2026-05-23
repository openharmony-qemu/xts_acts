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

import FixedArrayTypesTest from "./experimentalfeatures/fixedarraytypes/FixedArrayTypesTest.test";
import TypeCharTest from "./experimentalfeatures/typechar/TypeCharTest.test";

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

  FixedArrayTypesTest();
  TypeCharTest();

}