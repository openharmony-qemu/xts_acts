
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
}
