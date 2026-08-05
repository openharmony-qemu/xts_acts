import ClassDeclarationTest from './class/classDeclaration/ClassDeclarationTest.test';
import ClassTypeTest from './class/classType/ClassTypeTest.test';
import ClassInstantiationTest from './class/classInstantiation/ClassInstantiationTest.test';
import ClassFieldTest from './class/classField/ClassFieldTest.test';
import ClassMethodTest from './class/classMethod/ClassMethodTest.test';
import ClassConstructorTest from './class/classConstructor/ClassConstructorTest.test';
import ClassInheritanceTest from './class/classInheritance/ClassInheritanceTest.test';
import ClassVisibilityTest from './class/classVisibility/ClassVisibilityTest.test';
import ClassSuperTest from './class/classSuper/ClassSuperTest.test';
import ClassStaticTest from './class/classStatic/ClassStaticTest.test';
import InterfaceObjectLiteralTest from './interface/InterfaceObjectLiteralTest.test';
import ClassGenericTest from './class/classGeneric/ClassGenericTest.test';
import ClassAbstractTest from './class/classAbstract/ClassAbstractTest.test';
import ClassInterfaceTest from './class/classInterface/ClassInterfaceTest.test';
import ClassInitOrderTest from './class/classInitOrder/ClassInitOrderTest.test';
import ClassOverrideTest from './class/classOverride/ClassOverrideTest.test';
import ClassReadonlyTest from './class/classReadonly/ClassReadonlyTest.test';
import ClassScopeTest from './class/classScope/ClassScopeTest.test';
import InterfaceTest from './interface/InterfaceTest.test';

import ArrowFunctionTest from './function/arrowFunction/ArrowFunctionTest.test';
import ClosureTest from './function/closure/ClosureTest.test';
import FunctionCallTest from './function/functionCall/FunctionCallTest.test';
import FunctionDeclarationTest from './function/functionDeclaration/FunctionDeclarationTest.test';
import FunctionExpressionTest from './function/functionExpression/FunctionExpressionTest.test';
import FunctionScopeTest from './function/functionScope/FunctionScopeTest.test';
import FunctionTypeTest from './function/functionType/FunctionTypeTest.test';
import OptionalParameterTest from './function/optionalParameter/OptionalParameterTest.test';
import RestParameterTest from './function/restParameter/RestParameterTest.test';
import ReturnTypeTest from './function/returnType/ReturnTypeTest.test';

//generic
import GenericTypeParameterTest from "./generic/TypeParameter/GenericTypeParameterTest.test";
import GenericFunctionTest from "./generic/GenericFunction/GenericFunctionTest.test";
import GenericClassTest from "./generic/GenericClass/GenericClassTest.test";
import GenericInterfaceTest from "./generic/GenericInterface/GenericInterfaceTest.test";
import GenericInferenceTest from "./generic/TypeInference/GenericInferenceTest.test";
import GenericConstraintTest from "./generic/GenericConstraint/GenericConstraintTest.test";
import GenericInheritanceTest from "./generic/GenericInheritance/GenericInheritanceTest.test";
import GenericVarianceTest from "./generic/Variance/GenericVarianceTest.test";
import RuntimeABCTest from "./generic/RuntimeABC/RuntimeABCTest.test";
import GenericInteropTest from "./generic/Interoperability/GenericInteropTest.test";
import DefaultTypeParameterTest from "./generic/DefaultTypeParameter/DefaultTypeParameterTest.test";
import GenericOverloadTest from "./generic/GenericOverload/GenericOverloadTest.test";
import GenericOverrideTest from "./generic/GenericOverride/GenericOverrideTest.test";
import GenericUtilityTypeTest from "./generic/UtilityType/GenericUtilityTypeTest.test";

//module
import ModuleSyntaxTest from './module/ModuleSyntaxTest.test';

//null_safety
import BasicValueTest from './null_safety/BasicValue/BasicValueTest.test';
import ClassInterfaceOptionalTest from './null_safety/ClassInterfaceOptional/ClassInterfaceOptionalTest.test';
import CrossFeatureTest from './null_safety/CrossFeature/CrossFeatureTest.test';
import FunctionParamReturnTest from './null_safety/FunctionParamReturn/FunctionParamReturnTest.test';
import GenericBoundaryTest from './null_safety/GenericBoundary/GenericBoundaryTest.test';
import NullishCoalescingTest from './null_safety/NullishCoalescing/NullishCoalescingTest.test';
import OptionalChainingTest from './null_safety/OptionalChaining/OptionalChainingTest.test';

//this_keyword
import ThisKeywordTest from "./this_keyword/ThisKeywordTest.test";

//the_basics
import TypesTest from "./the_basics/TypesTest.test";

//decorator_annotation
import AnnotationArraysTest from "./decorator_annotation/arkts_annotation/AnnotationArrays/AnnotationArraysTest.test";
import AnnotationDeclarationTest
  from "./decorator_annotation/arkts_annotation/AnnotationDeclaration/AnnotationDeclarationTest.test";
import AnnotationEnumFieldsTest
  from "./decorator_annotation/arkts_annotation/AnnotationEnumFields/AnnotationEnumFieldsTest.test";
import AnnotationFieldTypesTest
  from "./decorator_annotation/arkts_annotation/AnnotationFieldTypes/AnnotationFieldTypesTest.test";
import AnnotationInheritanceTest
  from "./decorator_annotation/arkts_annotation/AnnotationInheritance/AnnotationInheritanceTest.test";
import AnnotationRepeatabilityTest
  from "./decorator_annotation/arkts_annotation/AnnotationRepeatability/AnnotationRepeatabilityTest.test";
import AnnotationUsageTargetsTest
  from "./decorator_annotation/arkts_annotation/AnnotationUsageTargets/AnnotationUsageTargetsTest.test";
import ClassDecoratorTest from "./decorator_annotation/ts_style_decorator/ClassDecorator/ClassDecoratorTest.test";
import DecoratorExecutionOrderTest
  from "./decorator_annotation/ts_style_decorator/DecoratorExecutionOrder/DecoratorExecutionOrderTest.test";
import DecoratorFactoryTest1
  from "./decorator_annotation/ts_style_decorator/DecoratorFactory/DecoratorFactoryTest1.test";
import DecoratorFactoryTest2
  from "./decorator_annotation/ts_style_decorator/DecoratorFactory/DecoratorFactoryTest2.test";
import DecoratorModuleScopeTest
  from "./decorator_annotation/ts_style_decorator/DecoratorModuleScope/DecoratorModuleScopeTest.test";
import DecoratorSyntaxTest from "./decorator_annotation/ts_style_decorator/DecoratorSyntax/DecoratorSyntaxTest.test";
import DecoratorWithClassFeaturesTest
  from "./decorator_annotation/ts_style_decorator/DecoratorWithClassFeatures/DecoratorWithClassFeaturesTest.test";
import MethodDecoratorPart02Test
  from "./decorator_annotation/ts_style_decorator/MethodDecorator/MethodDecoratorPart02.test";
import MethodDecoratorPart03Test
  from "./decorator_annotation/ts_style_decorator/MethodDecorator/MethodDecoratorPart03.test";
import PropertyDecoratorTest
  from "./decorator_annotation/ts_style_decorator/PropertyDecorator/PropertyDecoratorTest.test";

export default function testsuite() {
  ClassDeclarationTest();
  ClassTypeTest();
  ClassInstantiationTest();
  ClassFieldTest();
  ClassMethodTest();
  ClassConstructorTest();
  ClassInheritanceTest();
  ClassVisibilityTest();
  ClassSuperTest();
  ClassStaticTest();
  InterfaceObjectLiteralTest();
  ClassGenericTest();
  ClassAbstractTest();
  ClassInterfaceTest();
  ClassInitOrderTest();
  ClassOverrideTest();
  ClassReadonlyTest();
  ClassScopeTest();

  InterfaceTest();

  ArrowFunctionTest();
  ClosureTest();
  FunctionCallTest();
  FunctionDeclarationTest();
  FunctionExpressionTest();
  FunctionScopeTest();
  FunctionTypeTest();
  OptionalParameterTest();
  RestParameterTest();
  ReturnTypeTest();

  //generic
  GenericTypeParameterTest();
  GenericFunctionTest();
  GenericClassTest();
  GenericInterfaceTest();
  GenericInferenceTest();
  GenericConstraintTest();
  GenericInheritanceTest();
  GenericVarianceTest();
  RuntimeABCTest();
  GenericInteropTest();
  DefaultTypeParameterTest();
  GenericOverloadTest();
  GenericOverrideTest();
  GenericUtilityTypeTest();

  //module
  ModuleSyntaxTest();

  //null_safety
  BasicValueTest();
  ClassInterfaceOptionalTest();
  CrossFeatureTest();
  FunctionParamReturnTest();
  GenericBoundaryTest();
  NullishCoalescingTest();
  OptionalChainingTest();

  //this_keyword
  ThisKeywordTest();

  //the_basics
  TypesTest();

  //decorator_annotation
  AnnotationArraysTest();
  AnnotationDeclarationTest();
  AnnotationEnumFieldsTest();
  AnnotationFieldTypesTest();
  AnnotationInheritanceTest();
  AnnotationRepeatabilityTest();
  AnnotationUsageTargetsTest();

  ClassDecoratorTest();
  DecoratorExecutionOrderTest();
  DecoratorFactoryTest1();
  DecoratorFactoryTest2();
  DecoratorModuleScopeTest();
  DecoratorSyntaxTest();
  DecoratorWithClassFeaturesTest();
  MethodDecoratorPart02Test();
  MethodDecoratorPart03Test();
  PropertyDecoratorTest();
}
