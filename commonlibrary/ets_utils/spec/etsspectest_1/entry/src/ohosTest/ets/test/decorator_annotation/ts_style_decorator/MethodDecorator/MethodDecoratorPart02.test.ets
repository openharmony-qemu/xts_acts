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

class MethodDecoratorTrace {
  public value: string = ''
  public key: string = ''
  public count: number = 0

  public record(value: string, key: string): void {
    this.value = value
    this.key = key
    this.count++
  }
}

function createMethodDecorator(
  trace: MethodDecoratorTrace,
  value: string
): (_target: Object, key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    trace.record(value, key)
  }
}

const instanceMethodTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function instanceMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  instanceMethodTrace.record('instanceMethod', key)
}

class MethodDecoratorInstanceCase {
  @instanceMethodDecorator
  public readValue(): string {
    return 'instanceReturn'
  }
}

const staticMethodTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function staticMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  staticMethodTrace.record('staticMethod', key)
}

class MethodDecoratorStaticCase {
  @staticMethodDecorator
  public static readValue(): string {
    return 'staticReturn'
  }
}

const plainIdentifierTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function plainIdentifierMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  plainIdentifierTrace.record('plainIdentifier', key)
}

class MethodDecoratorPlainIdentifierCase {
  @plainIdentifierMethodDecorator
  public readValue(): string {
    return 'plainReturn'
  }
}

const factoryCallTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function factoryCallMethodDecorator(value: string): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryCallTrace, value)
}

class MethodDecoratorFactoryCallCase {
  @factoryCallMethodDecorator('factoryCall')
  public readValue(): string {
    return 'factoryCallReturn'
  }
}

const noParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function noParameterMethodDecorator(): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(noParameterTrace, 'noParameter')
}

class MethodDecoratorNoParameterCase {
  @noParameterMethodDecorator()
  public readValue(): string {
    return 'noParameterReturn'
  }
}

const singleParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function singleParameterMethodDecorator(value: string): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(singleParameterTrace, value)
}

class MethodDecoratorSingleParameterCase {
  @singleParameterMethodDecorator('singleParameter')
  public readValue(): string {
    return 'singleParameterReturn'
  }
}

const multiParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function multiParameterMethodDecorator(
  name: string,
  seed: number,
  enabled: boolean
): (_target: Object, key: string, _descriptor: Object) => void {
  const value: string = name + ':' + seed.toString() + ':' + (enabled ? 'true' : 'false')
  return createMethodDecorator(multiParameterTrace, value)
}

class MethodDecoratorMultiParameterCase {
  @multiParameterMethodDecorator('multiParameter', 7, true)
  public readValue(): string {
    return 'multiParameterReturn'
  }
}

const literalParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function literalParameterMethodDecorator(value: string): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(literalParameterTrace, value)
}

class MethodDecoratorLiteralParameterCase {
  @literalParameterMethodDecorator('literalParameter')
  public readValue(): string {
    return 'literalParameterReturn'
  }
}

const expressionParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
const methodExpressionPrefix: string = 'method'
function expressionParameterMethodDecorator(
  value: string
): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(expressionParameterTrace, value)
}

class MethodDecoratorExpressionParameterCase {
  @expressionParameterMethodDecorator(methodExpressionPrefix + 'Expression')
  public readValue(): string {
    return 'expressionParameterReturn'
  }
}

const functionParameterTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function methodParameterSource(): string {
  return 'functionParameter'
}

function functionParameterMethodDecorator(
  readValue: () => string
): (_target: Object, key: string, _descriptor: Object) => void {
  return createMethodDecorator(functionParameterTrace, readValue())
}

class MethodDecoratorFunctionParameterCase {
  @functionParameterMethodDecorator(methodParameterSource)
  public readValue(): string {
    return 'functionParameterReturn'
  }
}

const paramTypeTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function paramTypeMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  paramTypeTrace.record('paramType', key)
}

class MethodDecoratorParamTypeCase {
  @paramTypeMethodDecorator
  public readValue(param: string): string {
    return param
  }
}

const returnTypeTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnTypeMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnTypeTrace.record('returnType', key)
}

class MethodDecoratorReturnTypeCase {
  @returnTypeMethodDecorator
  public readValue(): number {
    return 42
  }
}

const voidReturnTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function voidReturnMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  voidReturnTrace.record('voidReturn', key)
}

class MethodDecoratorVoidReturnCase {
  @voidReturnMethodDecorator
  public readValue(): void {
  }
}

const visibilityTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function visibilityMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  visibilityTrace.record('visibility', key)
}

class MethodDecoratorVisibilityCase {
  @visibilityMethodDecorator
  public publicMethod(): string {
    return 'public'
  }

  @visibilityMethodDecorator
  protected protectedMethod(): string {
    return 'protected'
  }

  @visibilityMethodDecorator
  private privateMethod(): string {
    return 'private'
  }

  public callPrivate(): string {
    return this.privateMethod()
  }
}

const noArgTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function noArgMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  noArgTrace.record('noArg', key)
}

class MethodDecoratorNoArgCase {
  @noArgMethodDecorator
  public readValue(): string {
    return 'noArgReturn'
  }
}

const singleParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function singleParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  singleParamTrace.record('singleParam', key)
}

class MethodDecoratorSingleParamCase {
  @singleParamMethodDecorator
  public readValue(param: number): number {
    return param * 2
  }
}

const multiParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function multiParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  multiParamTrace.record('multiParam', key)
}

class MethodDecoratorMultiParamCase {
  @multiParamMethodDecorator
  public readValue(a: number, b: number, c: string): string {
    return c + (a + b).toString()
  }
}

const optionalParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function optionalParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  optionalParamTrace.record('optionalParam', key)
}

class MethodDecoratorOptionalParamCase {
  @optionalParamMethodDecorator
  public readValue(required: string, optional?: number): string {
    if (optional !== undefined) {
      return required + optional.toString()
    }
    return required
  }
}

const restParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function restParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  restParamTrace.record('restParam', key)
}

class MethodDecoratorRestParamCase {
  @restParamMethodDecorator
  public readValue(prefix: string, ...numbers: number[]): string {
    let sum: number = 0
    for (let i: number = 0; i < numbers.length; i++) {
      sum += numbers[i]
    }
    return prefix + sum.toString()
  }
}

const numberParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function numberParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  numberParamTrace.record('numberParam', key)
}

class MethodDecoratorNumberParamCase {
  @numberParamMethodDecorator
  public readValue(num: number): number {
    return num + 10
  }
}

const stringParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function stringParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  stringParamTrace.record('stringParam', key)
}

class MethodDecoratorStringParamCase {
  @stringParamMethodDecorator
  public readValue(str: string): string {
    return 'Hello, ' + str
  }
}

const booleanParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function booleanParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  booleanParamTrace.record('booleanParam', key)
}

class MethodDecoratorBooleanParamCase {
  @booleanParamMethodDecorator
  public readValue(flag: boolean): string {
    return flag ? 'true' : 'false'
  }
}

class ParamClass {
  public name: string = 'John'
  public age: number = 25
}

const classTypeParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function classTypeParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  classTypeParamTrace.record('classTypeParam', key)
}

class MethodDecoratorClassTypeParamCase {
  @classTypeParamMethodDecorator
  public readValue(person: ParamClass): string {
    return person.name + ':' + person.age.toString()
  }
}

const arrayParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function arrayParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  arrayParamTrace.record('arrayParam', key)
}

class MethodDecoratorArrayParamCase {
  @arrayParamMethodDecorator
  public readValue(arr: number[]): number {
    let sum: number = 0
    for (let item of arr) {
      sum += item
    }
    return sum
  }
}

const nullableParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function nullableParamMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  nullableParamTrace.record('nullableParam', key)
}

class MethodDecoratorNullableParamCase {
  @nullableParamMethodDecorator
  public readValue(param: string | null): string {
    if (param === null) {
      return 'null value'
    }
    return param
  }
}

const returnsVoidTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnsVoidMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnsVoidTrace.record('returnsVoid', key)
}

class MethodDecoratorReturnsVoidCase {
  @returnsVoidMethodDecorator
  public readValue(): void {
  }
}

const returnsNumberTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnsNumberMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnsNumberTrace.record('returnsNumber', key)
}

class MethodDecoratorReturnsNumberCase {
  @returnsNumberMethodDecorator
  public readValue(): number {
    return 3.14
  }
}

const returnsStringTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnsStringMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnsStringTrace.record('returnsString', key)
}

class MethodDecoratorReturnsStringCase {
  @returnsStringMethodDecorator
  public readValue(): string {
    return 'Hello ETS'
  }
}

class ResultClass {
  public value: string = 'result'
}

const returnsClassTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnsClassMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnsClassTrace.record('returnsClass', key)
}

class MethodDecoratorReturnsClassCase {
  @returnsClassMethodDecorator
  public readValue(): ResultClass {
    return new ResultClass()
  }
}

const returnsArrayTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function returnsArrayMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  returnsArrayTrace.record('returnsArray', key)
}

class MethodDecoratorReturnsArrayCase {
  @returnsArrayMethodDecorator
  public readValue(): number[] {
    return [1, 2, 3, 4, 5]
  }
}

const signatureTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function signatureMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  signatureTrace.record('signature', key)
}

class MethodDecoratorSignatureCase {
  @signatureMethodDecorator
  public readValue(a: number, b: string): string {
    return b + a.toString()
  }
}

const staticMethod2Trace: MethodDecoratorTrace = new MethodDecoratorTrace()
function staticMethod2Decorator(_target: Object, key: string, _descriptor: Object): void {
  staticMethod2Trace.record('staticMethod2', key)
}

class MethodDecoratorStatic2Case {
  @staticMethod2Decorator
  public static readValue(): string {
    return 'static2Return'
  }
}

const publicMethodTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function publicMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  publicMethodTrace.record('publicMethod', key)
}

class MethodDecoratorPublicMethodCase {
  @publicMethodDecorator
  public readValue(): string {
    return 'publicDecoratedReturn'
  }
}

const overrideTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function overrideMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  overrideTrace.record('override', key)
}

class MethodDecoratorOverrideParent {
  @overrideMethodDecorator
  public readValue(): string {
    return 'parentOverride'
  }
}

class MethodDecoratorOverrideChild extends MethodDecoratorOverrideParent {
  @overrideMethodDecorator
  public readValue(): string {
    return 'childOverride'
  }
}

const privateAccessTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function privateAccessMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  privateAccessTrace.record('privateAccess', key)
}

class MethodDecoratorPrivateAccessCase {
  private secret: string = 'hidden'

  @privateAccessMethodDecorator
  public readValue(): string {
    return this.secret
  }
}

const staticAccessTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function staticAccessMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  staticAccessTrace.record('staticAccess', key)
}

class MethodDecoratorStaticAccessCase {
  @staticAccessMethodDecorator
  public static readValue(): string {
    return 'staticAccessReturn'
  }
}

const inheritanceTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function inheritanceMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  inheritanceTrace.record('inheritance', key)
}

class MethodDecoratorInheritanceParent {
  @inheritanceMethodDecorator
  public readValue(): string {
    return 'parentInheritance'
  }
}

class MethodDecoratorInheritanceChild extends MethodDecoratorInheritanceParent {
}

const override2Trace: MethodDecoratorTrace = new MethodDecoratorTrace()
function override2MethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  override2Trace.record('override2', key)
}

class MethodDecoratorOverride2Parent {
  @override2MethodDecorator
  public readValue(): string {
    return 'parentOverride2'
  }
}

class MethodDecoratorOverride2Child extends MethodDecoratorOverride2Parent {
  @override2MethodDecorator
  public readValue(): string {
    return 'childOverride2'
  }
}

const superCallTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function superCallMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  superCallTrace.record('superCall', key)
}

class MethodDecoratorSuperCallParent {
  @superCallMethodDecorator
  public readValue(): string {
    return 'parentSuper'
  }
}

class MethodDecoratorSuperCallChild extends MethodDecoratorSuperCallParent {
  @superCallMethodDecorator
  public readValue(): string {
    return 'child: ' + super.readValue()
  }
}

const thisBindingTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function thisBindingMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  thisBindingTrace.record('thisBinding', key)
}

class MethodDecoratorThisBindingCase {
  public name: string = 'bound'

  @thisBindingMethodDecorator
  public readValue(): string {
    return this.name
  }
}

interface IGreetable {
  greet(name: string): string
}

const implementedTrace: MethodDecoratorTrace = new MethodDecoratorTrace()
function implementedMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  implementedTrace.record('implemented', key)
}

class MethodDecoratorImplementedCase implements IGreetable {
  @implementedMethodDecorator
  public greet(name: string): string {
    return 'Hello, ' + name
  }
}

export default function MethodDecoratorPart02Test() {
  describe('MethodDecoratorPart02Test', () => {
    beforeAll(() => {})
    beforeEach(async () => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0100
     * @tc.name      testClassMethodDecoratorInstance0001
     * @tc.desc      Verify instance method decorator can decorate an instance method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorInstanceCase = new MethodDecoratorInstanceCase()
      const result: string = obj.readValue()
      expect(instanceMethodTrace.value).assertEqual('instanceMethod')
      expect(instanceMethodTrace.key).assertEqual('readValue')
      expect(instanceMethodTrace.count).assertEqual(1)
      expect(result).assertEqual('instanceReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0200
     * @tc.name      testClassMethodDecoratorStatic0001
     * @tc.desc      Verify static method decorator can decorate a static method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = MethodDecoratorStaticCase.readValue()
      expect(staticMethodTrace.value).assertEqual('staticMethod')
      expect(staticMethodTrace.key).assertEqual('readValue')
      expect(staticMethodTrace.count).assertEqual(1)
      expect(result).assertEqual('staticReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0300
     * @tc.name      testClassMethodDecoratorPlainIdentifier0001
     * @tc.desc      Verify method decorator can be an ordinary identifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorPlainIdentifier0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorPlainIdentifierCase = new MethodDecoratorPlainIdentifierCase()
      const result: string = obj.readValue()
      expect(plainIdentifierTrace.value).assertEqual('plainIdentifier')
      expect(plainIdentifierTrace.key).assertEqual('readValue')
      expect(plainIdentifierTrace.count).assertEqual(1)
      expect(result).assertEqual('plainReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0400
     * @tc.name      testClassMethodDecoratorFactoryCall0001
     * @tc.desc      Verify method decorator can be a factory call expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryCallCase = new MethodDecoratorFactoryCallCase()
      const result: string = obj.readValue()
      expect(factoryCallTrace.value).assertEqual('factoryCall')
      expect(factoryCallTrace.key).assertEqual('readValue')
      expect(factoryCallTrace.count).assertEqual(1)
      expect(result).assertEqual('factoryCallReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0500
     * @tc.name      testClassMethodDecoratorNoParameter0001
     * @tc.desc      Verify method decorator factory can be called without parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorNoParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorNoParameterCase = new MethodDecoratorNoParameterCase()
      const result: string = obj.readValue()
      expect(noParameterTrace.value).assertEqual('noParameter')
      expect(noParameterTrace.key).assertEqual('readValue')
      expect(noParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('noParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0600
     * @tc.name      testClassMethodDecoratorSingleParameter0001
     * @tc.desc      Verify method decorator factory can receive one parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSingleParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorSingleParameterCase = new MethodDecoratorSingleParameterCase()
      const result: string = obj.readValue()
      expect(singleParameterTrace.value).assertEqual('singleParameter')
      expect(singleParameterTrace.key).assertEqual('readValue')
      expect(singleParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('singleParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0700
     * @tc.name      testClassMethodDecoratorMultiParameter0001
     * @tc.desc      Verify method decorator factory can receive multiple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorMultiParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorMultiParameterCase = new MethodDecoratorMultiParameterCase()
      const result: string = obj.readValue()
      expect(multiParameterTrace.value).assertEqual('multiParameter:7:true')
      expect(multiParameterTrace.key).assertEqual('readValue')
      expect(multiParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('multiParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0800
     * @tc.name      testClassMethodDecoratorLiteralParameter0001
     * @tc.desc      Verify method decorator factory can receive a literal parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorLiteralParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorLiteralParameterCase = new MethodDecoratorLiteralParameterCase()
      const result: string = obj.readValue()
      expect(literalParameterTrace.value).assertEqual('literalParameter')
      expect(literalParameterTrace.key).assertEqual('readValue')
      expect(literalParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('literalParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_0900
     * @tc.name      testClassMethodDecoratorExpressionParameter0001
     * @tc.desc      Verify method decorator factory can receive an expression parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorExpressionParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorExpressionParameterCase = new MethodDecoratorExpressionParameterCase()
      const result: string = obj.readValue()
      expect(expressionParameterTrace.value).assertEqual('methodExpression')
      expect(expressionParameterTrace.key).assertEqual('readValue')
      expect(expressionParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('expressionParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1000
     * @tc.name      testClassMethodDecoratorFunctionParameter0001
     * @tc.desc      Verify method decorator factory can receive a function parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFunctionParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFunctionParameterCase = new MethodDecoratorFunctionParameterCase()
      const result: string = obj.readValue()
      expect(functionParameterTrace.value).assertEqual('functionParameter')
      expect(functionParameterTrace.key).assertEqual('readValue')
      expect(functionParameterTrace.count).assertEqual(1)
      expect(result).assertEqual('functionParameterReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1100
     * @tc.name      testClassMethodDecoratorParamType0001
     * @tc.desc      Verify method decorator can coexist with method parameter type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorParamType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorParamTypeCase = new MethodDecoratorParamTypeCase()
      const result: string = obj.readValue('test')
      expect(paramTypeTrace.value).assertEqual('paramType')
      expect(paramTypeTrace.key).assertEqual('readValue')
      expect(paramTypeTrace.count).assertEqual(1)
      expect(result).assertEqual('test')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1200
     * @tc.name      testClassMethodDecoratorReturnType0001
     * @tc.desc      Verify method decorator can coexist with method return type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnTypeCase = new MethodDecoratorReturnTypeCase()
      const result: number = obj.readValue()
      expect(returnTypeTrace.value).assertEqual('returnType')
      expect(returnTypeTrace.key).assertEqual('readValue')
      expect(returnTypeTrace.count).assertEqual(1)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1300
     * @tc.name      testClassMethodDecoratorVoidReturn0001
     * @tc.desc      Verify method decorator can coexist with void return method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorVoidReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorVoidReturnCase = new MethodDecoratorVoidReturnCase()
      obj.readValue()
      expect(voidReturnTrace.value).assertEqual('voidReturn')
      expect(voidReturnTrace.key).assertEqual('readValue')
      expect(voidReturnTrace.count).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1400
     * @tc.name      testClassMethodDecoratorVisibility0001
     * @tc.desc      Verify method decorator does not change method visibility.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorVisibility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorVisibilityCase = new MethodDecoratorVisibilityCase()
      const publicResult: string = obj.publicMethod()
      const privateResult: string = obj.callPrivate()
      expect(visibilityTrace.value).assertEqual('visibility')
      expect(visibilityTrace.count).assertEqual(3)
      expect(publicResult).assertEqual('public')
      expect(privateResult).assertEqual('private')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1500
     * @tc.name      testClassMethodDecoratorNoArg0001
     * @tc.desc      Verify method decorator can decorate a no-arg method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorNoArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorNoArgCase = new MethodDecoratorNoArgCase()
      const result: string = obj.readValue()
      expect(noArgTrace.value).assertEqual('noArg')
      expect(noArgTrace.key).assertEqual('readValue')
      expect(noArgTrace.count).assertEqual(1)
      expect(result).assertEqual('noArgReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1600
     * @tc.name      testClassMethodDecoratorSingleParam0001
     * @tc.desc      Verify method decorator can decorate a single parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSingleParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorSingleParamCase = new MethodDecoratorSingleParamCase()
      const result: number = obj.readValue(21)
      expect(singleParamTrace.value).assertEqual('singleParam')
      expect(singleParamTrace.key).assertEqual('readValue')
      expect(singleParamTrace.count).assertEqual(1)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1700
     * @tc.name      testClassMethodDecoratorMultiParam0001
     * @tc.desc      Verify method decorator can decorate a multiple parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorMultiParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorMultiParamCase = new MethodDecoratorMultiParamCase()
      const result: string = obj.readValue(10, 20, 'result:')
      expect(multiParamTrace.value).assertEqual('multiParam')
      expect(multiParamTrace.key).assertEqual('readValue')
      expect(multiParamTrace.count).assertEqual(1)
      expect(result).assertEqual('result:30')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1800
     * @tc.name      testClassMethodDecoratorOptionalParam0001
     * @tc.desc      Verify method decorator can decorate an optional parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorOptionalParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorOptionalParamCase = new MethodDecoratorOptionalParamCase()
      const result1: string = obj.readValue('test')
      const result2: string = obj.readValue('test', 123)
      expect(optionalParamTrace.value).assertEqual('optionalParam')
      expect(optionalParamTrace.key).assertEqual('readValue')
      expect(optionalParamTrace.count).assertEqual(1)
      expect(result1).assertEqual('test')
      expect(result2).assertEqual('test123')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_1900
     * @tc.name      testClassMethodDecoratorRestParam0001
     * @tc.desc      Verify method decorator can decorate a rest parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorRestParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorRestParamCase = new MethodDecoratorRestParamCase()
      const result: string = obj.readValue('sum:', 1, 2, 3, 4)
      expect(restParamTrace.value).assertEqual('restParam')
      expect(restParamTrace.key).assertEqual('readValue')
      expect(restParamTrace.count).assertEqual(1)
      expect(result).assertEqual('sum:10')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2000
     * @tc.name      testClassMethodDecoratorNumberParam0001
     * @tc.desc      Verify method decorator can decorate a number parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorNumberParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorNumberParamCase = new MethodDecoratorNumberParamCase()
      const result: number = obj.readValue(32)
      expect(numberParamTrace.value).assertEqual('numberParam')
      expect(numberParamTrace.key).assertEqual('readValue')
      expect(numberParamTrace.count).assertEqual(1)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2100
     * @tc.name      testClassMethodDecoratorStringParam0001
     * @tc.desc      Verify method decorator can decorate a string parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorStringParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorStringParamCase = new MethodDecoratorStringParamCase()
      const result: string = obj.readValue('World')
      expect(stringParamTrace.value).assertEqual('stringParam')
      expect(stringParamTrace.key).assertEqual('readValue')
      expect(stringParamTrace.count).assertEqual(1)
      expect(result).assertEqual('Hello, World')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2200
     * @tc.name      testClassMethodDecoratorBooleanParam0001
     * @tc.desc      Verify method decorator can decorate a boolean parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorBooleanParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorBooleanParamCase = new MethodDecoratorBooleanParamCase()
      const result1: string = obj.readValue(true)
      const result2: string = obj.readValue(false)
      expect(booleanParamTrace.value).assertEqual('booleanParam')
      expect(booleanParamTrace.key).assertEqual('readValue')
      expect(booleanParamTrace.count).assertEqual(1)
      expect(result1).assertEqual('true')
      expect(result2).assertEqual('false')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2300
     * @tc.name      testClassMethodDecoratorClassTypeParam0001
     * @tc.desc      Verify method decorator can decorate a class type parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorClassTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorClassTypeParamCase = new MethodDecoratorClassTypeParamCase()
      const person: ParamClass = new ParamClass()
      const result: string = obj.readValue(person)
      expect(classTypeParamTrace.value).assertEqual('classTypeParam')
      expect(classTypeParamTrace.key).assertEqual('readValue')
      expect(classTypeParamTrace.count).assertEqual(1)
      expect(result).assertEqual('John:25')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2400
     * @tc.name      testClassMethodDecoratorArrayParam0001
     * @tc.desc      Verify method decorator can decorate an array parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorArrayParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorArrayParamCase = new MethodDecoratorArrayParamCase()
      const result: number = obj.readValue([1, 2, 3, 4, 5])
      expect(arrayParamTrace.value).assertEqual('arrayParam')
      expect(arrayParamTrace.key).assertEqual('readValue')
      expect(arrayParamTrace.count).assertEqual(1)
      expect(result).assertEqual(15)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2500
     * @tc.name      testClassMethodDecoratorNullableParam0001
     * @tc.desc      Verify method decorator can decorate a nullable parameter method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorNullableParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorNullableParamCase = new MethodDecoratorNullableParamCase()
      const result1: string = obj.readValue('test')
      const result2: string = obj.readValue(null)
      expect(nullableParamTrace.value).assertEqual('nullableParam')
      expect(nullableParamTrace.key).assertEqual('readValue')
      expect(nullableParamTrace.count).assertEqual(1)
      expect(result1).assertEqual('test')
      expect(result2).assertEqual('null value')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2600
     * @tc.name      testClassMethodDecoratorReturnsVoid0001
     * @tc.desc      Verify method decorator can decorate a method that returns void.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnsVoid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnsVoidCase = new MethodDecoratorReturnsVoidCase()
      obj.readValue()
      expect(returnsVoidTrace.value).assertEqual('returnsVoid')
      expect(returnsVoidTrace.key).assertEqual('readValue')
      expect(returnsVoidTrace.count).assertEqual(1)
      const result: void = obj.readValue()
      const resultType: string = result === undefined ? 'undefined' : 'unexpected'
      expect(resultType).assertEqual('undefined')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2700
     * @tc.name      testClassMethodDecoratorReturnsNumber0001
     * @tc.desc      Verify method decorator can decorate a method that returns number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnsNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnsNumberCase = new MethodDecoratorReturnsNumberCase()
      const result: number = obj.readValue()
      expect(returnsNumberTrace.value).assertEqual('returnsNumber')
      expect(returnsNumberTrace.key).assertEqual('readValue')
      expect(returnsNumberTrace.count).assertEqual(1)
      expect(result).assertEqual(3.14)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2800
     * @tc.name      testClassMethodDecoratorReturnsString0001
     * @tc.desc      Verify method decorator can decorate a method that returns string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnsString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnsStringCase = new MethodDecoratorReturnsStringCase()
      const result: string = obj.readValue()
      expect(returnsStringTrace.value).assertEqual('returnsString')
      expect(returnsStringTrace.key).assertEqual('readValue')
      expect(returnsStringTrace.count).assertEqual(1)
      expect(result).assertEqual('Hello ETS')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_2900
     * @tc.name      testClassMethodDecoratorReturnsClass0001
     * @tc.desc      Verify method decorator can decorate a method that returns class type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnsClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnsClassCase = new MethodDecoratorReturnsClassCase()
      const result: ResultClass = obj.readValue()
      expect(returnsClassTrace.value).assertEqual('returnsClass')
      expect(returnsClassTrace.key).assertEqual('readValue')
      expect(returnsClassTrace.count).assertEqual(1)
      expect(result.value).assertEqual('result')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3000
     * @tc.name      testClassMethodDecoratorReturnsArray0001
     * @tc.desc      Verify method decorator can decorate a method that returns array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorReturnsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorReturnsArrayCase = new MethodDecoratorReturnsArrayCase()
      const result: number[] = obj.readValue()
      expect(returnsArrayTrace.value).assertEqual('returnsArray')
      expect(returnsArrayTrace.key).assertEqual('readValue')
      expect(returnsArrayTrace.count).assertEqual(1)
      expect(result.length).assertEqual(5)
      expect(result[0]).assertEqual(1)
      expect(result[4]).assertEqual(5)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3100
     * @tc.name      testClassMethodDecoratorSignature0001
     * @tc.desc      Verify method decorator does not change method signature.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorSignatureCase = new MethodDecoratorSignatureCase()
      const result: string = obj.readValue(42, 'value:')
      expect(signatureTrace.value).assertEqual('signature')
      expect(signatureTrace.key).assertEqual('readValue')
      expect(signatureTrace.count).assertEqual(1)
      expect(result).assertEqual('value:42')
      const method: (a: number, b: string) => string = obj.readValue
      expect(method.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3200
     * @tc.name      testClassMethodDecoratorStatic0002
     * @tc.desc      Verify static method decorator behavior in static visibility matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = MethodDecoratorStatic2Case.readValue()
      expect(staticMethod2Trace.value).assertEqual('staticMethod2')
      expect(staticMethod2Trace.key).assertEqual('readValue')
      expect(staticMethod2Trace.count).assertEqual(1)
      expect(result).assertEqual('static2Return')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3300
     * @tc.name      testClassMethodDecoratorPublicMethod0001
     * @tc.desc      Verify public method decorator can decorate a public method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorPublicMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorPublicMethodCase = new MethodDecoratorPublicMethodCase()
      const result: string = obj.readValue()
      expect(publicMethodTrace.value).assertEqual('publicMethod')
      expect(publicMethodTrace.key).assertEqual('readValue')
      expect(publicMethodTrace.count).assertEqual(1)
      expect(result).assertEqual('publicDecoratedReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3400
     * @tc.name      testClassMethodDecoratorOverride0001
     * @tc.desc      Verify override method decorator can decorate an overridden method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorOverride0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const child: MethodDecoratorOverrideChild = new MethodDecoratorOverrideChild()
      const result: string = child.readValue()
      expect(overrideTrace.value).assertEqual('override')
      expect(overrideTrace.key).assertEqual('readValue')
      expect(overrideTrace.count).assertEqual(2)
      expect(result).assertEqual('childOverride')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3500
     * @tc.name      testClassMethodDecoratorPrivateAccess0001
     * @tc.desc      Verify decorated method accessing private still follows rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorPrivateAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorPrivateAccessCase = new MethodDecoratorPrivateAccessCase()
      const result: string = obj.readValue()
      expect(privateAccessTrace.value).assertEqual('privateAccess')
      expect(privateAccessTrace.key).assertEqual('readValue')
      expect(privateAccessTrace.count).assertEqual(1)
      expect(result).assertEqual('hidden')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3600
     * @tc.name      testClassMethodDecoratorStaticAccess0001
     * @tc.desc      Verify static decorated method can be accessed via class name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorStaticAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = MethodDecoratorStaticAccessCase.readValue()
      expect(staticAccessTrace.value).assertEqual('staticAccess')
      expect(staticAccessTrace.key).assertEqual('readValue')
      expect(staticAccessTrace.count).assertEqual(1)
      expect(result).assertEqual('staticAccessReturn')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3700
     * @tc.name      testClassMethodDecoratorInheritance0001
     * @tc.desc      Verify decorated method inheritance works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const child: MethodDecoratorInheritanceChild = new MethodDecoratorInheritanceChild()
      const result: string = child.readValue()
      expect(inheritanceTrace.value).assertEqual('inheritance')
      expect(inheritanceTrace.key).assertEqual('readValue')
      expect(inheritanceTrace.count).assertEqual(1)
      expect(result).assertEqual('parentInheritance')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3800
     * @tc.name      testClassMethodDecoratorOverride0002
     * @tc.desc      Verify decorated method override works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorOverride0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const child: MethodDecoratorOverride2Child = new MethodDecoratorOverride2Child()
      const result: string = child.readValue()
      expect(override2Trace.value).assertEqual('override2')
      expect(override2Trace.key).assertEqual('readValue')
      expect(override2Trace.count).assertEqual(2)
      expect(result).assertEqual('childOverride2')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_3900
     * @tc.name      testClassMethodDecoratorSuperCall0001
     * @tc.desc      Verify decorated method super call works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSuperCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const child: MethodDecoratorSuperCallChild = new MethodDecoratorSuperCallChild()
      const result: string = child.readValue()
      expect(superCallTrace.value).assertEqual('superCall')
      expect(superCallTrace.key).assertEqual('readValue')
      expect(superCallTrace.count).assertEqual(2)
      expect(result).assertEqual('child: parentSuper')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4000
     * @tc.name      testClassMethodDecoratorThisBinding0001
     * @tc.desc      Verify decorated method this binding works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorThisBinding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorThisBindingCase = new MethodDecoratorThisBindingCase()
      const result1: string = obj.readValue()
      expect(thisBindingTrace.value).assertEqual('thisBinding')
      expect(thisBindingTrace.key).assertEqual('readValue')
      expect(thisBindingTrace.count).assertEqual(1)
      expect(result1).assertEqual('bound')
      const methodRef: () => string = (): string => {
        return obj.readValue()
      }
      const result2: string = methodRef()
      expect(result2).assertEqual('bound')
    })

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4100
     * @tc.name      testClassMethodDecoratorImplemented0001
     * @tc.desc      Verify implemented method decorator works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImplemented0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImplementedCase = new MethodDecoratorImplementedCase()
      const result: string = obj.greet('Alice')
      expect(implementedTrace.value).assertEqual('implemented')
      expect(implementedTrace.key).assertEqual('greet')
      expect(implementedTrace.count).assertEqual(1)
      expect(result).assertEqual('Hello, Alice')
    })
  })
}
