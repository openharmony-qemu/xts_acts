
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
}
