import abilityTest from "./Ability.test";

//SKD
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
//GX
import EnumerationDoubleValuesTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/enumerationdoublevalues/EnumerationDoubleValuesTest.test";
import EnumerationTypeAnnotationTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/enumerationtypeannotation/EnumerationTypeAnnotationTest.test";
import AdditiveExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/additiveexpressions/AdditiveExpressionsTest.test';
import BitwiseExpressionsTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/bitwiseexpressions/BitwiseExpressionsTest.test";
import EqualityExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/equalityexpressions/EqualityExpressionsTest.test';
import ShiftExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/shiftexpressions/ShiftExpressionsTest.test';
import UnaryExpressionsTest from './experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/unaryexpressions/UnaryExpressionsTest.test';
import EnumerationWithExplicitTypeTest from "./experimentalfeatures/enumerationsexperimental/enumerationwithexplicittype/EnumerationWithExplicitTypeTest.test";
// import EnumerationMethodsTest from "./experimentalfeatures/enumerationsexperimental/enumerationmethods/EnumerationMethodsTest.test";
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
//FJ
import NumericDefaultLiteralTypesTest01 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest01.test';
import NumericDefaultLiteralTypesTest02 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest02.test';
import NumericDefaultLiteralTypesTest03 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest03.test';
import NumericDefaultLiteralTypesTest04 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest04.test';
import NumericDefaultLiteralTypesTest05 from './semanticrules/typeinference/typeinferencefornumericliterals/NumericDefaultLiteralTypesTest05.test';
import ReturnTypeInferenceTest01 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest01.test'
import ReturnTypeInferenceTest02 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest02.test'
import ReturnTypeInferenceTest03 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest03.test'
import ReturnTypeInferenceTest04 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest04.test'
import ReturnTypeInferenceTest05 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest05.test'
import ReturnTypeInferenceTest06 from './semanticrules/typeinference/returntypeinference/ReturnTypeInferenceTest06.test'
import ComputingSmartTypesTest01 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest01.test'
import ComputingSmartTypesTest02 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest02.test'
import ComputingSmartTypesTest03 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest03.test'
import ComputingSmartTypesTest04 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest04.test'
import ComputingSmartTypesTest05 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest05.test'
import ComputingSmartTypesTest06 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest06.test'
import ComputingSmartTypesTest07 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest07.test'
import ComputingSmartTypesTest08 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest08.test'
import ComputingSmartTypesTest09 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest09.test'
import ComputingSmartTypesTest10 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest10.test'
import ComputingSmartTypesTest11 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest11.test'
import ComputingSmartTypesTest12 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest12.test'
import ComputingSmartTypesTest13 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest13.test'
import ComputingSmartTypesTest14 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest14.test'
import ComputingSmartTypesTest15 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest15.test'
import ComputingSmartTypesTest16 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest16.test'
import ComputingSmartTypesTest17 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest17.test'
import ComputingSmartTypesTest18 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest18.test'
import ComputingSmartTypesTest19 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest19.test'
import ComputingSmartTypesTest20 from './semanticrules/smartcastsandsmarttypes/computingsmarttypes/ComputingSmartTypesTest20.test'
import IntersectionTypesTest from './semanticrules/smartcastsandsmarttypes/intersectiontypes/IntersectionTypesTest.test'
import SmartCastExamplesTest from './semanticrules/smartcastsandsmarttypes/smartcastexamples/SmartCastExamplesTest.test'
import OverrideCompatibleSignaturesTest01 from './semanticrules/overriding/overridecompatiblesignatures/OverrideCompatibleSignaturesTest01.test'
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
//GL
import FixedArrayTypesTest from "./experimentalfeatures/fixedarraytypes/FixedArrayTypesTest.test";
import ResizableArrayCreationExpressionsTest from "./experimentalfeatures/resizablearraycreationexpressions/ResizableArrayCreationExpressionsTest.test";
import TypeCharTest from "./experimentalfeatures/typechar/TypeCharTest.test";
import ExtendedConditionalExpressionsTest01 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest01.test";
import ExtendedConditionalExpressionsTest02 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest02.test";
import ExtendedConditionalExpressionsTest03 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest03.test";
import ExtendedConditionalExpressionsTest04 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest04.test";
import ExtendedConditionalExpressionsTest05 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest05.test";
import ExtendedConditionalExpressionsTest06 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest06.test";
import ExtendedConditionalExpressionsTest07 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest07.test";
import ExtendedConditionalExpressionsTest08 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest08.test";
import ExtendedConditionalExpressionsTest09 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest09.test";
import ExtendedConditionalExpressionsTest10 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest10.test";
import ExtendedConditionalExpressionsTest11 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest11.test";
import ExtendedConditionalExpressionsTest12 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest12.test";
import ExtendedConditionalExpressionsTest13 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest13.test";
import ExtendedConditionalExpressionsTest14 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest14.test";
import ExtendedConditionalExpressionsTest15 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest15.test";
import ExtendedConditionalExpressionsTest16 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest16.test";
import ExtendedConditionalExpressionsTest17 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest17.test";
import ExtendedConditionalExpressionsTest18 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest18.test";
import ExtendedConditionalExpressionsTest19 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest19.test";
import ExtendedConditionalExpressionsTest20 from "./semanticrules/compatibilityfeatures/extendedconditionalexpressions/ExtendedConditionalExpressionsTest20.test";
import DispatchTest from "./semanticrules/dispatch/DispatchTest.test";
import OverloadSetForClassInstanceMethodsTest from "./semanticrules/overloadresolution/overloadsetforclassinstancemethods/OverloadSetForClassInstanceMethodsTest.test";
import OverloadSetForConstructorsTest01 from "./semanticrules/overloadresolution/overloadsetforconstructors/OverloadSetForConstructorsTest01.test";
import OverloadSetForConstructorsTest02 from "./semanticrules/overloadresolution/overloadsetforconstructors/OverloadSetForConstructorsTest02.test";
import OverloadSetForFunctionsTest01 from "./semanticrules/overloadresolution/overloadsetforfunctions/OverloadSetForFunctionsTest01.test";
import OverloadSetForFunctionsTest02 from "./semanticrules/overloadresolution/overloadsetforfunctions/OverloadSetForFunctionsTest02.test";
import StaticInitializationExecOrderTest from "./semanticrules/staticinitialization/execorder/StaticInitializationExecOrderTest.test";
import StaticInitializationIncompleteTest from "./semanticrules/staticinitialization/incompleteinitialization/StaticInitializationIncompleteTest.test";
import StaticInitializationNamespaceTest from "./semanticrules/staticinitialization/namespace/StaticInitializationNamespaceTest.test";
import StaticInitializationSafetyTest from "./semanticrules/staticinitialization/staticinitializationsafety/StaticInitializationSafetyTest.test";
import StaticInitializationTest from "./semanticrules/staticinitialization/StaticInitializationTest.test";
import TypeErasureTest from "./semanticrules/typeerasure/TypeErasureTest.test";
import SemanticRulesTest from "./semanticrules/SemanticRulesTest.test";
export default function testsuite(): void {
  abilityTest();
  //SKD
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
  //GX
  GenericsExperimentalTest();
  NonNullishTypeParameterTest();
  DestructuringAssignmentTest();
  FinalClass();
  AdditiveExpressionsTest();
  BitwiseExpressionsTest();
  EqualityExpressionsTest();
  ShiftExpressionsTest();
  UnaryExpressionsTest();
  // EnumerationMethodsTest();
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
  EnumerationWithExplicitTypeTest();
  IndexableTypesTest();
  LambdaExpressionsWithReceiverTest();
  TrailingLambdasTest();
  ExplicitClassMethodOverloadTest();
  ForOfTypeAnnotationTest();
  ExplicitInterfaceMethodOverloadTest();
//FJ
  NumericDefaultLiteralTypesTest01();
  NumericDefaultLiteralTypesTest02();
  NumericDefaultLiteralTypesTest03();
  NumericDefaultLiteralTypesTest04();
  NumericDefaultLiteralTypesTest05();
  ReturnTypeInferenceTest01();
  ReturnTypeInferenceTest02();
  ReturnTypeInferenceTest03();
  ReturnTypeInferenceTest04();
  ReturnTypeInferenceTest05();
  ReturnTypeInferenceTest06();
  ComputingSmartTypesTest01();
  ComputingSmartTypesTest02();
  ComputingSmartTypesTest03();
  ComputingSmartTypesTest04();
  ComputingSmartTypesTest05();
  ComputingSmartTypesTest06();
  ComputingSmartTypesTest07();
  ComputingSmartTypesTest08();
  ComputingSmartTypesTest09();
  ComputingSmartTypesTest10();
  ComputingSmartTypesTest11();
  ComputingSmartTypesTest12();
  ComputingSmartTypesTest13();
  ComputingSmartTypesTest14();
  ComputingSmartTypesTest15();
  ComputingSmartTypesTest16();
  ComputingSmartTypesTest17();
  ComputingSmartTypesTest18();
  ComputingSmartTypesTest19();
  ComputingSmartTypesTest20();
  IntersectionTypesTest();
  SmartCastExamplesTest();
  OverridingInClassesTest();
  OverridingTest();
  OverrideCompatibleSignaturesTest01();
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
// GL
  DispatchTest();
  ExtendedConditionalExpressionsTest01();
  ExtendedConditionalExpressionsTest02();
  ExtendedConditionalExpressionsTest03();
  ExtendedConditionalExpressionsTest04();
  ExtendedConditionalExpressionsTest05();
  ExtendedConditionalExpressionsTest06();
  ExtendedConditionalExpressionsTest07();
  ExtendedConditionalExpressionsTest08();
  ExtendedConditionalExpressionsTest09();
  ExtendedConditionalExpressionsTest10();
  ExtendedConditionalExpressionsTest11();
  ExtendedConditionalExpressionsTest12();
  ExtendedConditionalExpressionsTest13();
  ExtendedConditionalExpressionsTest14();
  ExtendedConditionalExpressionsTest15();
  ExtendedConditionalExpressionsTest16();
  ExtendedConditionalExpressionsTest17();
  ExtendedConditionalExpressionsTest18();
  ExtendedConditionalExpressionsTest19();
  ExtendedConditionalExpressionsTest20();
  FixedArrayTypesTest();
  OverloadSetForClassInstanceMethodsTest();
  OverloadSetForConstructorsTest01();
  OverloadSetForConstructorsTest02();
  OverloadSetForFunctionsTest01();
  OverloadSetForFunctionsTest02();
  ResizableArrayCreationExpressionsTest();
  SemanticRulesTest();
  StaticInitializationExecOrderTest();
  StaticInitializationIncompleteTest();
  StaticInitializationNamespaceTest();
  StaticInitializationSafetyTest();
  StaticInitializationTest();
  TypeCharTest();
  TypeErasureTest();
}