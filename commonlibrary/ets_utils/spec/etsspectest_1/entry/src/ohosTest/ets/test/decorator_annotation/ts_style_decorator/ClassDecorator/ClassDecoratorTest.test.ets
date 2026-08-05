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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium'
import {
  isClassDecoratorApplied,
  testClassDecorator0002,
  testClassDecorator0003,
  testClassDecorator0004,
  testClassDecorator0005,
  testClassDecorator0006,
  testClassDecorator0007,
  testClassDecorator0008,
  testClassDecorator0009,
  testClassDecorator0010,
  testClassDecorator0011,
  testClassDecorator0012,
  testClassDecorator0013,
  testClassDecorator0014,
  testClassDecorator0015,
  testClassDecorator0016,
  testClassDecorator0017Boolean,
  testClassDecorator0017Number,
  testClassDecorator0017String,
  testClassDecorator0018,
  testClassDecorator0019,
  testClassDecorator0020,
  testClassDecorator0021,
  testClassDecorator0021Value,
  testClassDecorator0022,
  testClassDecorator0023,
  testClassDecorator0024,
  testClassDecorator0025,
  testClassDecorator0026FirstName,
  testClassDecorator0026LastName,
  testClassDecorator0027,
  testClassDecorator0028,
  testClassDecorator0029,
  testClassDecorator0030,
  testClassDecorator0031,
  testClassDecorator0032,
  testClassDecorator0033,
  testClassDecorator0034
} from './ClassDecoratorProducer'

let basicClassDecoratorCallCount: number = 0
let basicClassDecoratorTarget: Object | null = null

function basicClassDecorator(target: Object): void {
  basicClassDecoratorCallCount++
  basicClassDecoratorTarget = target
}

@basicClassDecorator
class BasicDecoratedClass {
  public value: number = 1
}

export default function ClassDecoratorTest(): void {
  describe('ClassDecoratorTest', () => {
    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0100
     * @tc.name      testClassDecoratorBasicApplication0001
     * @tc.desc      Design: Verify basic application. Distinction: Checks invocation count, target, and class behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorBasicApplication0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const instance: BasicDecoratedClass = new BasicDecoratedClass()
      expect(basicClassDecoratorCallCount).assertEqual(1)
      expect(basicClassDecoratorTarget !== null).assertTrue()
      expect(instance.value).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0200
     * @tc.name      testClassDecoratorPlainIdentifier0002
     * @tc.desc      Design: Verify plain-identifier syntax. Distinction: Uses no decorator factory call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorPlainIdentifier0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0002()).assertEqual(42)
      expect(isClassDecoratorApplied('Class0002')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0300
     * @tc.name      testClassDecoratorFactoryCall0003
     * @tc.desc      Design: Verify a factory call returns and applies a decorator. Distinction: Checks the call form.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryCall0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0003()).assertEqual('factory_applied')
      expect(isClassDecoratorApplied('Class0003')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0400
     * @tc.name      testClassDecoratorEmptyClass0004
     * @tc.desc      Verify a parameterless class decorator can be applied to an empty class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorEmptyClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0004()).assertTrue()
      expect(isClassDecoratorApplied('Class0004')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0500
     * @tc.name      testClassDecoratorSingleParam0005
     * @tc.desc      Design: Verify one string argument. Distinction: Uses a dedicated single-parameter factory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorSingleParam0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0005()).assertEqual('single_param')
      expect(isClassDecoratorApplied('Class0005')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0600
     * @tc.name      testClassDecoratorMultiParams0006
     * @tc.desc      Verify class decorator with multiple parameters passes all values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorMultiParams0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0006()).assertEqual('hello_123')
      expect(isClassDecoratorApplied('Class0006')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0700
     * @tc.name      testClassDecoratorFactoryLiteralParam0007
     * @tc.desc      Design: Verify a literal factory argument. Distinction: Focuses on argument expression syntax.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryLiteralParam0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0007()).assertEqual('literal_0007')
      expect(isClassDecoratorApplied('Class0007')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0800
     * @tc.name      testClassDecoratorFactoryExpressionParam0008
     * @tc.desc      Verify factory decorator parameter accepts expression value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryExpressionParam0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0008()).assertEqual('exp_0008')
      expect(isClassDecoratorApplied('Class0008')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_0900
     * @tc.name      testClassDecoratorFactoryFunctionReturnParam0009
     * @tc.desc      Verify factory decorator parameter accepts function return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryFunctionReturnParam0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0009()).assertEqual('fn_value_0009')
      expect(isClassDecoratorApplied('Class0009')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1000
     * @tc.name      testClassDecoratorPreservesBehavior0010
     * @tc.desc      Design: Verify method behavior is preserved. Distinction: Method does not depend on instance state.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorPreservesBehavior0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0010()).assertEqual('hello')
      expect(isClassDecoratorApplied('Class0017')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1100
     * @tc.name      testClassDecoratorReceivesConstructorName0011
     * @tc.desc      Design: Verify the target name. Distinction: Reads the constructor name string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorReceivesConstructorName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0011()).assertEqual('Class0019')
      expect(isClassDecoratorApplied('Class0019')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1200
     * @tc.name      testClassDecoratorHasConstructorRef0012
     * @tc.desc      Design: Verify a constructor reference is captured. Distinction: Checks its constructor name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorHasConstructorRef0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0012()).assertTrue()
      expect(isClassDecoratorApplied('Class0019')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1300
     * @tc.name      testClassDecoratorFactoryNoParams0013
     * @tc.desc      Design: Verify a parameterless factory. Distinction: Focuses on zero factory arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNoParams0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0013()).assertEqual(1)
      expect(isClassDecoratorApplied('Class0035')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1400
     * @tc.name      testClassDecoratorFactoryEmptyStringParam0014
     * @tc.desc      Verify a factory decorator accepts an empty string parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryEmptyStringParam0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0014()).assertEqual('')
      expect(isClassDecoratorApplied('Class0036')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1500
     * @tc.name      testClassDecoratorFactoryZeroNumberParam0015
     * @tc.desc      Verify a factory decorator accepts zero as its number parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryZeroNumberParam0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0015()).assertEqual(0)
      expect(isClassDecoratorApplied('Class0037')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1600
     * @tc.name      testClassDecoratorFactoryBooleanParam0016
     * @tc.desc      Verify factory decorator with single boolean parameter works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryBooleanParam0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0016()).assertTrue()
      expect(isClassDecoratorApplied('Class0038')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1700
     * @tc.name      testClassDecoratorFactoryMultiParams0017
     * @tc.desc      Verify factory decorator with multiple parameters works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMultiParams0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0017String()).assertEqual('str')
      expect(testClassDecorator0017Number()).assertEqual(42)
      expect(testClassDecorator0017Boolean()).assertFalse()
      expect(isClassDecoratorApplied('Class0039')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1800
     * @tc.name      testClassDecoratorFactoryArrowFunctionParam0018
     * @tc.desc      Verify factory decorator parameter accepts arrow function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryArrowFunctionParam0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0018()).assertEqual(11)
      expect(isClassDecoratorApplied('Class0040')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_1900
     * @tc.name      testClassDecoratorFactoryNormalFunctionParam0019
     * @tc.desc      Verify factory decorator parameter accepts normal function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNormalFunctionParam0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0019()).assertEqual(12)
      expect(isClassDecoratorApplied('Class0041')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2000
     * @tc.name      testClassDecoratorFactoryLocalConstParam0020
     * @tc.desc      Verify factory decorator parameter accepts local const value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryLocalConstParam0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0020()).assertEqual('local_const_value')
      expect(isClassDecoratorApplied('Class0044')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2100
     * @tc.name      testClassDecoratorFactoryReturnedTarget0021
     * @tc.desc      Design: Verify a returned decorator receives its target. Distinction: Checks the target name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnedTarget0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0021()).assertTrue()
      expect(testClassDecorator0021Value()).assertEqual(1)
      expect(isClassDecoratorApplied('Class0045')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2200
     * @tc.name      testClassDecoratorFactoryReturnsClosure0022
     * @tc.desc      Verify factory returns closure class decorator function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnsClosure0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0022()).assertEqual('closure_value')
      expect(isClassDecoratorApplied('Class0046')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2300
     * @tc.name      testClassDecoratorPreservesFieldMethod0023
     * @tc.desc      Design: Verify method behavior. Distinction: Its result depends on an instance field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorPreservesFieldMethod0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0023()).assertEqual('I am decorated_class')
      expect(isClassDecoratorApplied('Class0053')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2400
     * @tc.name      testClassDecoratorConstructorNoArgs0024
     * @tc.desc      Verify decorated class constructor with no arguments works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorConstructorNoArgs0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0024()).assertEqual('no_args')
      expect(isClassDecoratorApplied('Class0067')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2500
     * @tc.name      testClassDecoratorConstructorSingleArg0025
     * @tc.desc      Verify decorated class constructor with single argument works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorConstructorSingleArg0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0025()).assertEqual('single_arg')
      expect(isClassDecoratorApplied('Class0068')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2600
     * @tc.name      testClassDecoratorConstructorMultiArgs0026
     * @tc.desc      Verify decorated class constructor with multiple arguments works.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorConstructorMultiArgs0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0026FirstName()).assertEqual('John')
      expect(testClassDecorator0026LastName()).assertEqual('Doe')
      expect(isClassDecoratorApplied('Class0069')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2700
     * @tc.name      testClassDecoratorFieldType0027
     * @tc.desc      Verify class field type works correctly with decorator applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFieldType0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0027()).assertEqual('typed_value')
      expect(isClassDecoratorApplied('Class0071')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2800
     * @tc.name      testClassDecoratorStaticFieldType0028
     * @tc.desc      Verify static field type works correctly with decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorStaticFieldType0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0028()).assertEqual(100)
      expect(isClassDecoratorApplied('Class0073')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_2900
     * @tc.name      testClassDecoratorMethodParamType0029
     * @tc.desc      Verify method parameter type works correctly with decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorMethodParamType0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0029()).assertEqual('Hello, World')
      expect(isClassDecoratorApplied('Class0074')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_3000
     * @tc.name      testClassDecoratorMethodReturnType0030
     * @tc.desc      Verify method return type works correctly with decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorMethodReturnType0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0030()).assertEqual('TestClass')
      expect(isClassDecoratorApplied('Class0075')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_3100
     * @tc.name      testClassDecoratorStaticMethod0031
     * @tc.desc      Design: Verify a static method. Distinction: It returns an independent constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorStaticMethod0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0031()).assertEqual(42)
      expect(isClassDecoratorApplied('Class0076')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_3200
     * @tc.name      testClassDecoratorStaticMemberInteraction0032
     * @tc.desc      Design: Verify a static method reads a static field. Distinction: Checks member interaction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorStaticMemberInteraction0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0032()).assertEqual('original_data')
      expect(isClassDecoratorApplied('Class0085')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_3300
     * @tc.name      testClassDecoratorVoidReturn0033
     * @tc.desc      Design: Verify a void return. Distinction: No replacement constructor is required.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorVoidReturn0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0033()).assertEqual(1)
      expect(isClassDecoratorApplied('Class0101')).assertTrue()
    })

    /**
     * @tc.number    SUB_CLASS_DECORATOR_ANNOTATION_3400
     * @tc.name      testClassDecoratorOriginalReturn0034
     * @tc.desc      Verify class decorator returning original class works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorOriginalReturn0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassDecorator0034()).assertEqual(1)
      expect(isClassDecoratorApplied('Class0103')).assertTrue()
    })
  })
}
