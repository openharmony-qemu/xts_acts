/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';

import DefaultExportedClassWithDecorator, {
  classDecorator,
  propertyDecorator,
  methodDecorator,
  decoratorFactory,
  decoratorFactoryWithArg,
  decoratorFactoryWithMultiArgs,
  decoratorFactoryWithAnyArg,
  namedFunction,
  getDecorated,
  getFactoryDecorated,
  getFactoryArg,
  getFactoryArgs,
  getFactoryAnyArg,
  getFactoryAnyArgAsFunction,
  getPropertyDecoratorCallCount,
  verifyPropertyDecoratorCalledOnClass,
  resetPropertyDecoratorCalls,
  ExportedClassWithDecorator
} from './DecoratorSyntaxHelper';

interface interfaceWithDecorator {
  interfaceProp: number
}

enum TestEnum {
  VALUE_A = 1,
  VALUE_B = 2
}

interface ObjectLiteralInterface {
  name: string
}

export default function DecoratorSyntaxTest() {
  describe('DecoratorSyntaxTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0100
     * @tc.name      testClassClassDecoratorSyntax0001
     * @tc.desc      Verify class decorator syntax works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassClassDecoratorSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass1 {
        public value: number = 10
      }
      const obj: TestClass1 = new TestClass1()
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0200
     * @tc.name      testClassPropertyDecoratorSyntax0001
     * @tc.desc      Verify property decorator syntax works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetPropertyDecoratorCalls()
      class TestClass2 {
        @propertyDecorator
        public prop1: number = 0
      }
      expect(getPropertyDecoratorCallCount()).assertEqual(1)
      expect(verifyPropertyDecoratorCalledOnClass(TestClass2, 'prop1')).assertTrue()
    })
    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0300
     * @tc.name      testClassMethodDecoratorSyntax0001
     * @tc.desc      Verify method decorator syntax works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass3 {
        @methodDecorator
        public greet(): string {
          return 'hello'
        }
      }
      const obj: TestClass3 = new TestClass3()
      expect(obj.greet()).assertEqual('hello decorated')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0400
     * @tc.name      testClassStaticPropertyDecoratorSyntax0001
     * @tc.desc      Verify static property decorator syntax works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticPropertyDecoratorSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass4 {
        @propertyDecorator
        public static staticProp: number = 0
      }
      expect(TestClass4.staticProp).assertEqual(42)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0500
     * @tc.name      testClassStaticMethodDecoratorSyntax0001
     * @tc.desc      Verify static method decorator syntax works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMethodDecoratorSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      class TestClass5 {
        @methodDecorator
        public static staticMethod(): string {
          return 'static'
        }
      }
      expect(TestClass5.staticMethod()).assertEqual('static decorated')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0600
     * @tc.name      testClassDecoratorCallExpression0001
     * @tc.desc      Verify decorator factory with empty parentheses call expression works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorCallExpression0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactory()
      class TestClass6 {
        public value: number = 5
      }
      const obj: TestClass6 = new TestClass6()
      expect(getFactoryDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0700
     * @tc.name      testClassDecoratorCallExpressionWithArg0001
     * @tc.desc      Verify decorator factory with single argument call expression works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorCallExpressionWithArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithArg('test')
      class TestClass7 {
        public value: number = 6
      }
      const obj: TestClass7 = new TestClass7()
      expect(getFactoryArg(obj)).assertEqual('test')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0800
     * @tc.name      testClassDecoratorCallExpressionWithMultiArgs0001
     * @tc.desc      Verify decorator factory with multiple arguments call expression works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorCallExpressionWithMultiArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithMultiArgs('hello', 123)
      class TestClass8 {
        public value: number = 7
      }
      const obj: TestClass8 = new TestClass8()
      expect(getFactoryArgs(obj)).assertEqual('hello-123')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_0900
     * @tc.name      testClassDecoratorNewlineBeforeDeclaration0001
     * @tc.desc      Verify decorator placed on a separate line before declaration works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorNewlineBeforeDeclaration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator

      class TestClass9 {
        public value: number = 9
      }
      const obj: TestClass9 = new TestClass9()
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1000
     * @tc.name      testClassClassDeclarationDecorator0001
     * @tc.desc      Verify decorator on class declaration statement works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassClassDeclarationDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass10 {
        public value: number = 10
      }
      const obj: TestClass10 = new TestClass10()
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1100
     * @tc.name      testClassExportedClassDecorator0001
     * @tc.desc      Verify decorator on class that can be exported works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExportedClassDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: ExportedClassWithDecorator = new ExportedClassWithDecorator()
      expect(obj.value).assertEqual(11)
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1200
     * @tc.name      testClassDefaultExportedClassDecorator0001
     * @tc.desc      Verify decorator on class used as default export works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultExportedClassDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DefaultExportedClassWithDecorator = new DefaultExportedClassWithDecorator()
      expect(obj.value).assertEqual(12)
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1300
     * @tc.name      testClassReadonlyPropertyDecorator0001
     * @tc.desc      Verify readonly property with decorator works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassReadonlyPropertyDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetPropertyDecoratorCalls()
      class TestClass15 {
        @propertyDecorator
        public readonly readonlyProp: number = 0
      }
      expect(getPropertyDecoratorCallCount()).assertEqual(1)
      expect(verifyPropertyDecoratorCalledOnClass(TestClass15, 'readonlyProp')).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1400
     * @tc.name      testClassPublicPropertyDecorator0001
     * @tc.desc      Verify public property with decorator works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPublicPropertyDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetPropertyDecoratorCalls()
      class TestClass16 {
        @propertyDecorator
        public publicProp: number = 0
      }
      expect(getPropertyDecoratorCallCount()).assertEqual(1)
      expect(verifyPropertyDecoratorCalledOnClass(TestClass16, 'publicProp')).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1500
     * @tc.name      testClassLocalFunctionStatementWithDecorator0001
     * @tc.desc      Verify decorator works when local function statement is present in scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassLocalFunctionStatementWithDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const localFn = (): number => 100
      @classDecorator
      class TestClass19 {
        public value: number = localFn()
      }
      const obj: TestClass19 = new TestClass19()
      expect(obj.value).assertEqual(100)
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1600
     * @tc.name      testClassExpressionStatementWithDecorator0001
     * @tc.desc      Verify decorator works when expression statement is present in scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionStatementWithDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass20 {
        public value: number = 20
      }
      const obj: TestClass20 = new TestClass20()
      obj.value
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1700
     * @tc.name      testClassAssignmentStatementWithDecorator0001
     * @tc.desc      Verify decorator works when assignment statement is present in scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassAssignmentStatementWithDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass21 {
        public value: number = 21
      }
      const obj: TestClass21 = new TestClass21()
      const ref: TestClass21 = obj
      expect(getDecorated(ref)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1800
     * @tc.name      testClassImportDeclarationDecorator0001
     * @tc.desc      Verify decorator using imported function works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportDeclarationDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass22 {
        public value: number = 22
      }
      const obj: TestClass22 = new TestClass22()
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_1900
     * @tc.name      testClassInterfaceMemberDecorator0001
     * @tc.desc      Verify decorator on class implementing interface works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassInterfaceMemberDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass24 implements interfaceWithDecorator {
        public interfaceProp: number = 24
      }
      const obj: TestClass24 = new TestClass24()
      expect(obj.interfaceProp).assertEqual(24)
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2000
     * @tc.name      testClassEnumMemberDecorator0001
     * @tc.desc      Verify decorator on class using enum member works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassEnumMemberDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass25 {
        public value: number = TestEnum.VALUE_B
      }
      const obj: TestClass25 = new TestClass25()
      expect(obj.value).assertEqual(2)
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2100
     * @tc.name      testClassObjectLiteralPropertyDecorator0001
     * @tc.desc      Verify decorator on class with object literal property works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteralPropertyDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass26 {
        public obj: ObjectLiteralInterface = { name: 'test' }
      }
      const obj: TestClass26 = new TestClass26()
      expect(obj.obj.name).assertEqual('test')
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2200
     * @tc.name      testClassBlockStatementDecorator0001
     * @tc.desc      Verify decorator works inside a block statement scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassBlockStatementDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        @classDecorator
        class TestClass27 {
          public value: number = 27
        }
        const obj: TestClass27 = new TestClass27()
        expect(getDecorated(obj)).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2300
     * @tc.name      testClassMultipleDecoratorsCombinationOrder0001
     * @tc.desc      Verify multiple decorators combination order works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsCombinationOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactory()
      @classDecorator
      class TestClass31 {
        public value: number = 31
      }
      const obj: TestClass31 = new TestClass31()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2400
     * @tc.name      testClassTwoConsecutiveDecorators0001
     * @tc.desc      Verify two consecutive decorators on same class work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTwoConsecutiveDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      @decoratorFactory()
      class TestClass32 {
        public value: number = 32
      }
      const obj: TestClass32 = new TestClass32()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2500
     * @tc.name      testClassThreeConsecutiveDecorators0001
     * @tc.desc      Verify three consecutive decorators on same class work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassThreeConsecutiveDecorators0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithArg('third')
      @decoratorFactory()
      @classDecorator
      class TestClass33 {
        public value: number = 33
      }
      const obj: TestClass33 = new TestClass33()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryDecorated(obj)).assertTrue()
      expect(getFactoryArg(obj)).assertEqual('third')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2600
     * @tc.name      testClassMultipleDecoratorsOnSeparateLines0001
     * @tc.desc      Verify multiple decorators on separate lines work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsOnSeparateLines0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithArg('line1')
      @decoratorFactory()
      @classDecorator
      class TestClass34 {
        public value: number = 34
      }
      const obj: TestClass34 = new TestClass34()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryArg(obj)).assertEqual('line1')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2700
     * @tc.name      testClassMultipleDecoratorsWithComment0001
     * @tc.desc      Verify multiple decorators with comment in between work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsWithComment0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithArg('comment')
      // comment between decorators
      @classDecorator
      class TestClass35 {
        public value: number = 35
      }
      const obj: TestClass35 = new TestClass35()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryArg(obj)).assertEqual('comment')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2800
     * @tc.name      testClassMultipleDecoratorsWithBlankLine0001
     * @tc.desc      Verify multiple decorators with blank line in between work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsWithBlankLine0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithArg('blank')

      @classDecorator
      class TestClass36 {
        public value: number = 36
      }
      const obj: TestClass36 = new TestClass36()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryArg(obj)).assertEqual('blank')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_2900
     * @tc.name      testClassMultipleDecoratorsFirstUnusual0001
     * @tc.desc      Verify multiple decorators where first uses factory form and second uses identifier form.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsFirstUnusual0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithMultiArgs('first', 1)
      @classDecorator
      class TestClass39 {
        public value: number = 39
      }
      const obj: TestClass39 = new TestClass39()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryArgs(obj)).assertEqual('first-1')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3000
     * @tc.name      testClassMultipleDecoratorsSecondUnusual0001
     * @tc.desc      Verify multiple decorators where second uses factory form and first uses identifier form.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsSecondUnusual0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      @decoratorFactoryWithMultiArgs('second', 2)
      class TestClass40 {
        public value: number = 40
      }
      const obj: TestClass40 = new TestClass40()
      expect(getDecorated(obj)).assertTrue()
      expect(getFactoryArgs(obj)).assertEqual('second-2')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3100
     * @tc.name      testClassMultipleDecoratorsWithPropertyAndMethod0001
     * @tc.desc      Verify multiple decorators on property and method of same class work.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleDecoratorsWithPropertyAndMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetPropertyDecoratorCalls()
      class TestClass42 {
        @propertyDecorator
        public prop1: number = 0

        @methodDecorator
        public method1(): string {
          return 'method'
        }
      }
      const obj: TestClass42 = new TestClass42()
      expect(verifyPropertyDecoratorCalledOnClass(TestClass42, 'prop1')).assertTrue()
      expect(obj.method1()).assertEqual('method decorated')
    })


    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3200
     * @tc.name      testClassFactoryWithNumberArg0001
     * @tc.desc      Verify decorator factory with number argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryWithNumberArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithAnyArg(48)
      class TestClass48 {
        public value: number = 48
      }
      const obj: TestClass48 = new TestClass48()
      expect(getFactoryAnyArg(obj)).assertEqual(48)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3300
     * @tc.name      testClassFactoryWithBooleanArg0001
     * @tc.desc      Verify decorator factory with boolean argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryWithBooleanArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithAnyArg(true)
      class TestClass49 {
        public value: number = 49
      }
      const obj: TestClass49 = new TestClass49()
      expect(getFactoryAnyArg(obj)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3400
     * @tc.name      testClassFactoryWithArrowFunctionArg0001
     * @tc.desc      Verify decorator factory with arrow function argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryWithArrowFunctionArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithAnyArg((): string => 'arrow')
      class TestClass50 {
        public value: number = 50
      }
      const obj: TestClass50 = new TestClass50()
      const arg: Function = getFactoryAnyArgAsFunction(obj)
      expect(arg()).assertEqual('arrow')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3500
     * @tc.name      testClassFactoryWithNormalFunctionArg0001
     * @tc.desc      Verify decorator factory with named function argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryWithNormalFunctionArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithAnyArg(namedFunction)
      class TestClass51 {
        public value: number = 51
      }
      const obj: TestClass51 = new TestClass51()
      const arg: Function = getFactoryAnyArgAsFunction(obj)
      expect(arg()).assertEqual('normal')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3600
     * @tc.name      testClassFactoryWithIIFEArg0001
     * @tc.desc      Verify decorator factory with IIFE argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassFactoryWithIIFEArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @decoratorFactoryWithAnyArg(((): string => 'iife')())
      class TestClass52 {
        public value: number = 52
      }
      const obj: TestClass52 = new TestClass52()
      expect(getFactoryAnyArg(obj)).assertEqual('iife')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3700
     * @tc.name      testClassCallExpressionMissingParenthesis0001
     * @tc.desc      Verify decorator used as identifier (without call expression) works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassCallExpressionMissingParenthesis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass53 {
        public value: number = 53
      }
      const obj: TestClass53 = new TestClass53()
      expect(getDecorated(obj)).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3800
     * @tc.name      testClassPropertyDecoratorFieldTypeMismatch0001
     * @tc.desc      Verify property decorator works even when field type differs from decorator value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFieldTypeMismatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetPropertyDecoratorCalls()
      class TestClass55 {
        @propertyDecorator
        public prop: number = 0
      }
      expect(getPropertyDecoratorCallCount()).assertEqual(1)
      expect(verifyPropertyDecoratorCalledOnClass(TestClass55, 'prop')).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_SYNTAX_3900
     * @tc.name      testClassDecoratorWithGetter0001
     * @tc.desc      Verify decorator on class with getter method produces stable behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorWithGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      @classDecorator
      class TestClass56 {
        private _internal: number = 56
        public get value(): number {
          return this._internal
        }
      }
      const obj: TestClass56 = new TestClass56()
      expect(obj.value).assertEqual(56)
      expect(getDecorated(obj)).assertTrue()
    })

  })
}
