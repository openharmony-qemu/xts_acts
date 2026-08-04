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
import DecoratorFactoryDefaultExportClass, {
  DecoratorFactoryNamedExportClass,
  importedClosureFactory,
  importedFactoryName,
  importedFactorySeed,
  importedLoweringName,
  importedModuleBinding,
  importedPropertyFactory,
  importedReturnedDecorator,
  readDefaultExportDecorated,
  readImportedCaptureKey,
  readImportedFactoryKey,
  readImportedModuleInitOrder,
  readImportedReturnedKey,
  readNamedExportDecorated
} from './DecoratorFactoryImportModule'

class DecoratorFactoryTrace {
  public value: string = ''
  public key: string = ''
  public factoryCount: number = 0
  public decoratorCount: number = 0

  public recordFactory(value: string): void {
    this.factoryCount++
    this.value = value
  }

  public recordDecorator(key: string): void {
    this.decoratorCount++
    this.key = key
  }

  public recordDecoratorValue(value: string, key: string): void {
    this.decoratorCount++
    this.value = value
    this.key = key
  }

  public summary(): string {
    return this.value + ':' + this.key + ':' + this.factoryCount.toString() +
      ':' + this.decoratorCount.toString()
  }
}

class DecoratorFactoryPayload {
  public text: string

  public constructor(text: string) {
    this.text = text
  }
}

enum DecoratorFactoryMode {
  Ready = 23
}

class DecoratorFactoryStaticSource {
  public static tag: string = 'staticValue'
}

const localFactoryName: string = 'localValue'
const localReturnText: string = 'localReturn'
const moduleReturnText: string = 'moduleReturn'

function tracePropertyFactory(trace: DecoratorFactoryTrace, value: string): (_target: Object, key: string) => void {
  trace.recordFactory(value)
  return (__target: Object, key: string): void => {
    trace.recordDecorator(key)
  }
}

function traceMethodFactory(
  trace: DecoratorFactoryTrace,
  value: string
): (_target: Object, key: string, descriptor: Object) => void {
  trace.recordFactory(value)
  return (__target: Object, key: string, _descriptor: Object): void => {
    trace.recordDecorator(key)
  }
}

function traceClassFactory(trace: DecoratorFactoryTrace, value: string): (_target: Object) => void {
  trace.recordFactory(value)
  return (__target: Object): void => {
    trace.recordDecorator('class')
  }
}

const noArgTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function noArgFactory(): (_target: Object, key: string) => void {
  return tracePropertyFactory(noArgTrace, 'noArg')
}

class DecoratorFactoryNoArgCase {
  @noArgFactory()
  public value: number = 1
}

const singleArgTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function singleArgFactory(name: string): (_target: Object, key: string) => void {
  singleArgTrace.recordFactory(name)
  return (__target: Object, key: string): void => {
    singleArgTrace.recordDecorator(key)
  }
}

class DecoratorFactorySingleArgCase {
  @singleArgFactory('singleValue')
  public singleValue: number = 2
}

const multiArgTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function multiArgFactory(name: string, seed: number, enabled: boolean): (_target: Object, key: string) => void {
  const result: string = name + ':' + seed.toString() + ':' + (enabled ? 'true' : 'false')
  multiArgTrace.recordFactory(result)
  return (_target: Object, key: string): void => {
    multiArgTrace.recordDecorator(key)
  }
}

class DecoratorFactoryMultiArgCase {
  @multiArgFactory('multiValue', 3, true)
  public multiValue: number = 3
}

const callResultTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function callResultFactory(): (_target: Object, key: string) => void {
  return tracePropertyFactory(callResultTrace, 'callResult')
}

class DecoratorFactoryCallResultCase {
  @callResultFactory()
  public callResultValue: number = 4
}

let contrastOrdinaryCalls: number = 0
let contrastFactoryCalls: number = 0
let contrastReturnedCalls: number = 0
function contrastPlainDecorator(_target: Object, _key: string): void {
  contrastOrdinaryCalls++
}

function contrastFactory(): (_target: Object, key: string) => void {
  contrastFactoryCalls++
  return (_target: Object, _key: string): void => {
    contrastReturnedCalls++
  }
}

class DecoratorFactoryContrastCase {
  @contrastPlainDecorator
  public plainValue: number = 5

  @contrastFactory()
  public factoryValue: number = 6
}

const propertyTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryPropertyCase {
  @tracePropertyFactory(propertyTrace, 'property')
  public propertyValue: number = 6
}

const staticPropertyTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryStaticPropertyCase {
  @tracePropertyFactory(staticPropertyTrace, 'staticProperty')
  public static staticValue: number = 7
}

const methodTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryMethodCase {
  @traceMethodFactory(methodTrace, 'method')
  public readValue(): number {
    return 8
  }
}

const classTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
@traceClassFactory(classTrace, 'classFactory')
class DecoratorFactoryClassCase {
  public value: number = 9
}

const returnDecoratorTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnDecoratorFactory(): (_target: Object, key: string) => void {
  return tracePropertyFactory(returnDecoratorTrace, 'returnDecorator')
}

class DecoratorFactoryReturnDecoratorCase {
  @returnDecoratorFactory()
  public value: number = 14
}

const closureTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function closureDecoratorFactory(expectedKey: string): (_target: Object, key: string) => void {
  const capturedKey: string = expectedKey
  closureTrace.recordFactory(capturedKey)
  return (_target: Object, key: string): void => {
    closureTrace.recordDecorator(capturedKey + ':' + key)
  }
}

class DecoratorFactoryClosureCase {
  @closureDecoratorFactory('closureValue')
  public closureValue: number = 15
}

let statefulCounter: number = 0
const statefulTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function statefulDecoratorFactory(): (_target: Object, key: string) => void {
  statefulCounter++
  statefulTrace.recordFactory(statefulCounter.toString())
  return (_target: Object, key: string): void => {
    statefulTrace.recordDecorator(key + ':' + statefulCounter.toString())
  }
}

class DecoratorFactoryStatefulCase {
  @statefulDecoratorFactory()
  public value: number = 16
}

let noRepeatFactoryCalls: number = 0
let noRepeatDecoratorCalls: number = 0
function noRepeatFactory(): (_target: Object, key: string) => void {
  noRepeatFactoryCalls++
  return (_target: Object, _key: string): void => {
    noRepeatDecoratorCalls++
  }
}

class DecoratorFactoryNoRepeatCase {
  @noRepeatFactory()
  public value: number = 17
}

let noMissingFactoryCalls: number = 0
let noMissingDecoratorCalls: number = 0
function noMissingFactory(): (_target: Object, key: string) => void {
  noMissingFactoryCalls++
  return (_target: Object, _key: string): void => {
    noMissingDecoratorCalls++
  }
}

class DecoratorFactoryNoMissingCase {
  @noMissingFactory()
  public value: number = 18
}

const stringLiteralTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryStringLiteralCase {
  @tracePropertyFactory(stringLiteralTrace, 'stringLiteral')
  public value: number = 19
}

const numberLiteralTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function numberLiteralFactory(seed: number): (_target: Object, key: string) => void {
  return tracePropertyFactory(numberLiteralTrace, seed.toString())
}

class DecoratorFactoryNumberLiteralCase {
  @numberLiteralFactory(20)
  public value: number = 20
}

const booleanLiteralTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function booleanLiteralFactory(enabled: boolean): (_target: Object, key: string) => void {
  return tracePropertyFactory(booleanLiteralTrace, enabled ? 'true' : 'false')
}

class DecoratorFactoryBooleanLiteralCase {
  @booleanLiteralFactory(true)
  public value: number = 21
}

const enumValueTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function enumValueFactory(mode: DecoratorFactoryMode): (_target: Object, key: string) => void {
  return tracePropertyFactory(enumValueTrace, mode.toString())
}

class DecoratorFactoryEnumValueCase {
  @enumValueFactory(DecoratorFactoryMode.Ready)
  public value: number = 23
}

const classStaticTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryClassStaticValueCase {
  @tracePropertyFactory(classStaticTrace, DecoratorFactoryStaticSource.tag)
  public value: number = 24
}

const localConstTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryLocalConstCase {
  @tracePropertyFactory(localConstTrace, localFactoryName)
  public value: number = 25
}

const importedBindingTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function importedBindingFactory(name: string, seed: number): (_target: Object, key: string) => void {
  return tracePropertyFactory(importedBindingTrace, name + ':' + seed.toString())
}

class DecoratorFactoryImportedBindingCase {
  @importedBindingFactory(importedFactoryName, importedFactorySeed)
  public value: number = 26
}

const arrowFunctionTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function arrowFunctionFactory(readValue: () => number): (_target: Object, key: string) => void {
  return tracePropertyFactory(arrowFunctionTrace, readValue().toString())
}

class DecoratorFactoryArrowFunctionCase {
  @arrowFunctionFactory((): number => { return 27 })
  public value: number = 27
}

function normalFactoryArgument(): number {
  return 28
}

const normalFunctionTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function normalFunctionFactory(readValue: () => number): (_target: Object, key: string) => void {
  return tracePropertyFactory(normalFunctionTrace, readValue().toString())
}

class DecoratorFactoryNormalFunctionCase {
  @normalFunctionFactory(normalFactoryArgument)
  public value: number = 28
}

const iifeTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function iifeFactory(seed: number): (_target: Object, key: string) => void {
  return tracePropertyFactory(iifeTrace, seed.toString())
}

class DecoratorFactoryIifeCase {
  @iifeFactory(((): number => { return 29 })())
  public value: number = 29
}

function nestedSeed(): string {
  return 'nested'
}

const nestedCallTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function nestedCallFactory(name: string): (_target: Object, key: string) => void {
  return tracePropertyFactory(nestedCallTrace, name)
}

class DecoratorFactoryNestedCallCase {
  @nestedCallFactory(nestedSeed())
  public value: number = 30
}

const mixedPrimitiveTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function mixedPrimitiveFactory(name: string, seed: number, enabled: boolean): (_target: Object, key: string) => void {
  return tracePropertyFactory(mixedPrimitiveTrace, name + ':' + seed.toString() + ':' + (enabled ? 'true' : 'false'))
}

class DecoratorFactoryMixedPrimitiveCase {
  @mixedPrimitiveFactory('mixedPrimitive', 37, true)
  public value: number = 37
}

function mixedFunctionText(): string {
  return 'normalFunction'
}

const mixedFunctionTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function mixedFunctionFactory(
  name: string,
  readValue: () => number,
  readText: () => string
): (_target: Object, key: string) => void {
  return tracePropertyFactory(mixedFunctionTrace, name + ':' + readValue().toString() + ':' + readText())
}

class DecoratorFactoryMixedFunctionCase {
  @mixedFunctionFactory('mixedFunction', (): number => { return 38 }, mixedFunctionText)
  public value: number = 38
}

const mixedImportTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function mixedImportFactory(name: string, seed: number, source: string): (_target: Object, key: string) => void {
  return tracePropertyFactory(mixedImportTrace, name + ':' + seed.toString() + ':' + source)
}

class DecoratorFactoryMixedImportCase {
  @mixedImportFactory(importedFactoryName, importedFactorySeed, importedModuleBinding)
  public value: number = 39
}

let sideEffectCounter: number = 0
function sideEffectArgument(): string {
  sideEffectCounter++
  return 'sideEffect'
}

const sideEffectTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactorySideEffectCase {
  @tracePropertyFactory(sideEffectTrace, sideEffectArgument())
  public value: number = 41
}

let argumentOrderTrace: string = ''
function orderedArgument(value: string): string {
  argumentOrderTrace = argumentOrderTrace + value
  return value
}

function orderedFactory(_left: string, _right: string): (_target: Object, key: string) => void {
  argumentOrderTrace = argumentOrderTrace + ':factory'
  return (_target: Object, _key: string): void => {
    argumentOrderTrace = argumentOrderTrace + ':decorator'
  }
}

class DecoratorFactoryArgumentOrderCase {
  @orderedFactory(orderedArgument('left'), orderedArgument(':right'))
  public value: number = 42
}

const returnPropertyTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryReturnPropertyCase {
  @tracePropertyFactory(returnPropertyTrace, 'returnProperty')
  public value: number = 43
}

const returnMethodTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
class DecoratorFactoryReturnMethodCase {
  @traceMethodFactory(returnMethodTrace, 'returnMethod')
  public readValue(): number {
    return 44
  }
}

const returnClassTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
@traceClassFactory(returnClassTrace, 'returnClass')
class DecoratorFactoryReturnClassCase {
  public value: number = 45
}

const closureReturnTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function closureReturnFactory(expectedKey: string): (_target: Object, key: string) => void {
  const capturedKey: string = expectedKey
  closureReturnTrace.recordFactory(capturedKey)
  return (_target: Object, key: string): void => {
    closureReturnTrace.recordDecorator(capturedKey + ':' + key)
  }
}

class DecoratorFactoryClosureReturnCase {
  @closureReturnFactory('closureReturn')
  public value: number = 46
}

let returnedStateCounter: number = 0
const returnedStateTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnedStateFactory(): (_target: Object, key: string) => void {
  returnedStateCounter++
  returnedStateTrace.recordFactory(returnedStateCounter.toString())
  return (_target: Object, key: string): void => {
    returnedStateTrace.recordDecorator(key + ':' + returnedStateCounter.toString())
  }
}

class DecoratorFactoryReturnedStateCase {
  @returnedStateFactory()
  public value: number = 47
}

const returnedParameterTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnedParameterFactory(expectedKey: string): (_target: Object, key: string) => void {
  returnedParameterTrace.recordFactory(expectedKey)
  return (_target: Object, key: string): void => {
    returnedParameterTrace.recordDecorator(expectedKey + ':' + key)
  }
}

class DecoratorFactoryReturnedParameterCase {
  @returnedParameterFactory('returnedParameter')
  public value: number = 48
}

const returnedModuleTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnedModuleFactory(): (_target: Object, key: string) => void {
  returnedModuleTrace.recordFactory(moduleReturnText)
  return (_target: Object, key: string): void => {
    returnedModuleTrace.recordDecorator(moduleReturnText + ':' + key)
  }
}

class DecoratorFactoryReturnedModuleCase {
  @returnedModuleFactory()
  public value: number = 49
}

const returnedLocalTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnedLocalFactory(): (_target: Object, key: string) => void {
  returnedLocalTrace.recordFactory(localReturnText)
  return (_target: Object, key: string): void => {
    returnedLocalTrace.recordDecorator(localReturnText + ':' + key)
  }
}

class DecoratorFactoryReturnedLocalCase {
  @returnedLocalFactory()
  public value: number = 50
}

const returnNumberTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnNumberPayloadFactory(): (_target: Object, key: string) => void {
  const result: number = 53
  returnNumberTrace.recordFactory(result.toString())
  return (_target: Object, key: string): void => {
    returnNumberTrace.recordDecorator(key)
  }
}

class DecoratorFactoryReturnNumberCase {
  @returnNumberPayloadFactory()
  public value: number = 53
}

const returnStringTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnStringPayloadFactory(): (_target: Object, key: string) => void {
  const result: string = 'returnString'
  returnStringTrace.recordFactory(result)
  return (_target: Object, key: string): void => {
    returnStringTrace.recordDecorator(key)
  }
}

class DecoratorFactoryReturnStringCase {
  @returnStringPayloadFactory()
  public value: number = 54
}

const returnObjectTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnObjectPayloadFactory(): (_target: Object, key: string) => void {
  const payload: DecoratorFactoryPayload = new DecoratorFactoryPayload('returnObject')
  returnObjectTrace.recordFactory(payload.text)
  return (_target: Object, key: string): void => {
    returnObjectTrace.recordDecorator(key)
  }
}

class DecoratorFactoryReturnObjectCase {
  @returnObjectPayloadFactory()
  public value: number = 55
}

const returnInstanceTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function returnClassInstancePayloadFactory(): (_target: Object, key: string) => void {
  const payload: DecoratorFactoryPayload = new DecoratorFactoryPayload('returnInstance')
  returnInstanceTrace.recordFactory(payload.text)
  return (_target: Object, key: string): void => {
    returnInstanceTrace.recordDecorator(key)
  }
}

class DecoratorFactoryReturnInstanceCase {
  @returnClassInstancePayloadFactory()
  public value: number = 56
}

class DecoratorFactoryImportFactoryCase {
  @importedPropertyFactory('importFactoryValue')
  public importFactoryValue: number = 93
}

class DecoratorFactoryImportReturnedCase {
  @importedReturnedDecorator
  public importReturnedValue: number = 94
}

const importParameterTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function importParameterFactory(name: string, seed: number): (_target: Object, key: string) => void {
  return tracePropertyFactory(importParameterTrace, name + ':' + seed.toString())
}

class DecoratorFactoryImportParameterCase {
  @importParameterFactory(importedFactoryName, importedFactorySeed)
  public value: number = 95
}

class DecoratorFactoryImportedCaptureCase {
  @importedClosureFactory()
  public importedCaptureValue: number = 96
}

const importLoweringTrace: DecoratorFactoryTrace = new DecoratorFactoryTrace()
function importLoweringFactory(name: string): (_target: Object, key: string) => void {
  return tracePropertyFactory(importLoweringTrace, name)
}

class DecoratorFactoryImportLoweringCase {
  @importLoweringFactory(importedLoweringName)
  public value: number = 102
}

function resultWithValue(trace: DecoratorFactoryTrace, value: number): string {
  return trace.summary() + ':' + value.toString()
}

export default function DecoratorFactoryTest1() {
  describe('DecoratorFactoryTest1', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0100
     * @tc.name      testClassDecoratorFactoryNoArg0001
     * @tc.desc      Verify no-argument factory returns a property decorator (DECORATOR-FACTORY-TD-0001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNoArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNoArgCase = new DecoratorFactoryNoArgCase()
      expect(resultWithValue(noArgTrace, obj.value)).assertEqual('noArg:value:1:1:1')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0200
     * @tc.name      testClassDecoratorFactorySingleArg0001
     * @tc.desc      Verify single-argument decorator factory receives string parameter (DECORATOR-FACTORY-TD-0002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactorySingleArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactorySingleArgCase = new DecoratorFactorySingleArgCase()
      expect(resultWithValue(singleArgTrace, obj.singleValue)).assertEqual('singleValue:singleValue:1:1:2')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0300
     * @tc.name      testClassDecoratorFactoryMultiArg0001
     * @tc.desc      Verify multi-argument decorator factory receives primitive parameters (DECORATOR-FACTORY-TD-0003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMultiArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryMultiArgCase = new DecoratorFactoryMultiArgCase()
      expect(resultWithValue(multiArgTrace, obj.multiValue)).assertEqual('multiValue:3:true:multiValue:1:1:3')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0400
     * @tc.name      testClassDecoratorFactoryCallResult0001
     * @tc.desc      Verify factory call result is applied as the actual decorator (DECORATOR-FACTORY-TD-0004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryCallResult0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryCallResultCase = new DecoratorFactoryCallResultCase()
      expect(resultWithValue(callResultTrace, obj.callResultValue)).assertEqual('callResult:callResultValue:1:1:4')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0500
     * @tc.name      testClassDecoratorFactoryIdentifierContrast0001
     * @tc.desc      Verify factory form and ordinary decorator identifier are distinct (DECORATOR-FACTORY-TD-0005)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryIdentifierContrast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryContrastCase = new DecoratorFactoryContrastCase()
      expect(contrastOrdinaryCalls + contrastFactoryCalls + contrastReturnedCalls + obj.factoryValue).assertEqual(9)
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0600
     * @tc.name      testClassDecoratorFactoryProperty_target0001
     * @tc.desc      Verify decorator factory can _target an instance property (DECORATOR-FACTORY-TD-0006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryProperty_target0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryPropertyCase = new DecoratorFactoryPropertyCase()
      expect(resultWithValue(propertyTrace, obj.propertyValue)).assertEqual('property:propertyValue:1:1:6')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0700
     * @tc.name      testClassDecoratorFactoryStaticProperty_target0001
     * @tc.desc      Verify decorator factory can _target a static property (DECORATOR-FACTORY-TD-0007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryStaticProperty_target0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(resultWithValue(staticPropertyTrace, DecoratorFactoryStaticPropertyCase.staticValue)).
        assertEqual('staticProperty:staticValue:1:1:7')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0800
     * @tc.name      testClassDecoratorFactoryMethod_target0001
     * @tc.desc      Verify decorator factory can _target an instance method (DECORATOR-FACTORY-TD-0008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMethod_target0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryMethodCase = new DecoratorFactoryMethodCase()
      expect(resultWithValue(methodTrace, obj.readValue())).assertEqual('method:readValue:1:1:8')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_0900
     * @tc.name      testClassDecoratorFactoryClass_target0001
     * @tc.desc      Verify decorator factory can _target a class declaration (DECORATOR-FACTORY-TD-0009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryClass_target0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryClassCase = new DecoratorFactoryClassCase()
      expect(resultWithValue(classTrace, obj.value)).assertEqual('classFactory:class:1:1:9')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1000
     * @tc.name      testClassDecoratorFactoryReturnDecorator0001
     * @tc.desc      Verify factory returns a decorator function for property application (DECORATOR-FACTORY-TD-0014)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnDecoratorCase = new DecoratorFactoryReturnDecoratorCase()
      expect(resultWithValue(returnDecoratorTrace, obj.value)).assertEqual('returnDecorator:value:1:1:14')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1100
     * @tc.name      testClassDecoratorFactoryReturnClosure0001
     * @tc.desc      Verify factory returns a closure decorator function (DECORATOR-FACTORY-TD-0015)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnClosure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryClosureCase = new DecoratorFactoryClosureCase()
      expect(resultWithValue(closureTrace, obj.closureValue)).
        assertEqual('closureValue:closureValue:closureValue:1:1:15')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1200
     * @tc.name      testClassDecoratorFactoryStatefulReturn0001
     * @tc.desc      Verify factory returns a stateful decorator function once (DECORATOR-FACTORY-TD-0016)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryStatefulReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryStatefulCase = new DecoratorFactoryStatefulCase()
      expect(resultWithValue(statefulTrace, obj.value)).assertEqual('1:value:1:1:1:16')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1300
     * @tc.name      testClassDecoratorFactoryNoDuplicateCall0001
     * @tc.desc      Verify decorator factory is not called more than once (DECORATOR-FACTORY-TD-0017)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNoDuplicateCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNoRepeatCase = new DecoratorFactoryNoRepeatCase()
      expect(noRepeatFactoryCalls + noRepeatDecoratorCalls + obj.value).assertEqual(19)
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1400
     * @tc.name      testClassDecoratorFactoryNoMissingCall0001
     * @tc.desc      Verify decorator factory call is not omitted (DECORATOR-FACTORY-TD-0018)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNoMissingCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNoMissingCase = new DecoratorFactoryNoMissingCase()
      expect(noMissingFactoryCalls + noMissingDecoratorCalls + obj.value).assertEqual(20)
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1500
     * @tc.name      testClassDecoratorFactoryStringLiteralArg0001
     * @tc.desc      Verify string literal factory argument is preserved (DECORATOR-FACTORY-TD-0019)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryStringLiteralArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryStringLiteralCase = new DecoratorFactoryStringLiteralCase()
      expect(resultWithValue(stringLiteralTrace, obj.value)).assertEqual('stringLiteral:value:1:1:19')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1600
     * @tc.name      testClassDecoratorFactoryNumberLiteralArg0001
     * @tc.desc      Verify number literal factory argument is preserved (DECORATOR-FACTORY-TD-0020)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNumberLiteralArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNumberLiteralCase = new DecoratorFactoryNumberLiteralCase()
      expect(resultWithValue(numberLiteralTrace, obj.value)).assertEqual('20:value:1:1:20')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1700
     * @tc.name      testClassDecoratorFactoryBooleanLiteralArg0001
     * @tc.desc      Verify boolean literal factory argument is preserved (DECORATOR-FACTORY-TD-0021)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryBooleanLiteralArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryBooleanLiteralCase = new DecoratorFactoryBooleanLiteralCase()
      expect(resultWithValue(booleanLiteralTrace, obj.value)).assertEqual('true:value:1:1:21')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1800
     * @tc.name      testClassDecoratorFactoryEnumValueArg0001
     * @tc.desc      Verify enum value factory argument is preserved (DECORATOR-FACTORY-TD-0023)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryEnumValueArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryEnumValueCase = new DecoratorFactoryEnumValueCase()
      expect(resultWithValue(enumValueTrace, obj.value)).assertEqual('23:value:1:1:23')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_1900
     * @tc.name      testClassDecoratorFactoryClassStaticArg0001
     * @tc.desc      Verify class static value factory argument is preserved (DECORATOR-FACTORY-TD-0024)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryClassStaticArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryClassStaticValueCase = new DecoratorFactoryClassStaticValueCase()
      expect(resultWithValue(classStaticTrace, obj.value)).assertEqual('staticValue:value:1:1:24')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2000
     * @tc.name      testClassDecoratorFactoryLocalConstArg0001
     * @tc.desc      Verify local const factory argument is preserved (DECORATOR-FACTORY-TD-0025)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryLocalConstArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryLocalConstCase = new DecoratorFactoryLocalConstCase()
      expect(resultWithValue(localConstTrace, obj.value)).assertEqual('localValue:value:1:1:25')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2100
     * @tc.name      testClassDecoratorFactoryImportedBindingArg0001
     * @tc.desc      Verify imported binding factory argument is preserved (DECORATOR-FACTORY-TD-0026)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportedBindingArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryImportedBindingCase = new DecoratorFactoryImportedBindingCase()
      expect(resultWithValue(importedBindingTrace, obj.value)).assertEqual('importedValue:39:value:1:1:26')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2200
     * @tc.name      testClassDecoratorFactoryArrowFunctionArg0001
     * @tc.desc      Verify arrow function factory argument is evaluated correctly (DECORATOR-FACTORY-TD-0027)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryArrowFunctionArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryArrowFunctionCase = new DecoratorFactoryArrowFunctionCase()
      expect(resultWithValue(arrowFunctionTrace, obj.value)).assertEqual('27:value:1:1:27')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2300
     * @tc.name      testClassDecoratorFactoryNormalFunctionArg0001
     * @tc.desc      Verify normal function factory argument is evaluated correctly (DECORATOR-FACTORY-TD-0028)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNormalFunctionArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNormalFunctionCase = new DecoratorFactoryNormalFunctionCase()
      expect(resultWithValue(normalFunctionTrace, obj.value)).assertEqual('28:value:1:1:28')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2400
     * @tc.name      testClassDecoratorFactoryIifeArg0001
     * @tc.desc      Verify IIFE factory argument result is preserved (DECORATOR-FACTORY-TD-0029)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryIifeArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryIifeCase = new DecoratorFactoryIifeCase()
      expect(resultWithValue(iifeTrace, obj.value)).assertEqual('29:value:1:1:29')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2500
     * @tc.name      testClassDecoratorFactoryNestedCallArg0001
     * @tc.desc      Verify nested call factory argument result is preserved (DECORATOR-FACTORY-TD-0030)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryNestedCallArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNestedCallCase = new DecoratorFactoryNestedCallCase()
      expect(resultWithValue(nestedCallTrace, obj.value)).assertEqual('nested:value:1:1:30')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2600
     * @tc.name      testClassDecoratorFactoryMixedPrimitiveArgs0001
     * @tc.desc      Verify mixed primitive factory arguments are preserved (DECORATOR-FACTORY-TD-0037)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMixedPrimitiveArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryMixedPrimitiveCase = new DecoratorFactoryMixedPrimitiveCase()
      expect(resultWithValue(mixedPrimitiveTrace, obj.value)).
        assertEqual('mixedPrimitive:37:true:value:1:1:37')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2700
     * @tc.name      testClassDecoratorFactoryMixedFunctionArgs0001
     * @tc.desc      Verify mixed function factory arguments are preserved (DECORATOR-FACTORY-TD-0038)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMixedFunctionArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryMixedFunctionCase = new DecoratorFactoryMixedFunctionCase()
      expect(resultWithValue(mixedFunctionTrace, obj.value)).
        assertEqual('mixedFunction:38:normalFunction:value:1:1:38')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2800
     * @tc.name      testClassDecoratorFactoryMixedImportArgs0001
     * @tc.desc      Verify mixed import factory arguments are preserved (DECORATOR-FACTORY-TD-0039)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryMixedImportArgs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryMixedImportCase = new DecoratorFactoryMixedImportCase()
      expect(resultWithValue(mixedImportTrace, obj.value)).
        assertEqual('importedValue:39:moduleBinding:value:1:1:39')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_2900
     * @tc.name      testClassDecoratorFactoryArgumentSideEffect0001
     * @tc.desc      Verify factory argument side effect executes once (DECORATOR-FACTORY-TD-0041)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryArgumentSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactorySideEffectCase = new DecoratorFactorySideEffectCase()
      expect(resultWithValue(sideEffectTrace, obj.value) + ':' + sideEffectCounter.toString()).
        assertEqual('sideEffect:value:1:1:41:1')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3000
     * @tc.name      testClassDecoratorFactoryArgumentOrder0001
     * @tc.desc      Verify factory arguments are evaluated from left to right (DECORATOR-FACTORY-TD-0042)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryArgumentOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(argumentOrderTrace).assertEqual('left:right:factory:decorator')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3100
     * @tc.name      testClassDecoratorFactoryReturnPropertyDecorator0001
     * @tc.desc      Verify factory returns property decorator function (DECORATOR-FACTORY-TD-0043)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnPropertyDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnPropertyCase = new DecoratorFactoryReturnPropertyCase()
      expect(resultWithValue(returnPropertyTrace, obj.value)).assertEqual('returnProperty:value:1:1:43')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3200
     * @tc.name      testClassDecoratorFactoryReturnMethodDecorator0001
     * @tc.desc      Verify factory returns method decorator function (DECORATOR-FACTORY-TD-0044)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnMethodDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnMethodCase = new DecoratorFactoryReturnMethodCase()
      expect(resultWithValue(returnMethodTrace, obj.readValue())).assertEqual('returnMethod:readValue:1:1:44')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3300
     * @tc.name      testClassDecoratorFactoryReturnClassDecorator0001
     * @tc.desc      Verify factory returns class decorator function (DECORATOR-FACTORY-TD-0045)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnClassDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnClassCase = new DecoratorFactoryReturnClassCase()
      expect(resultWithValue(returnClassTrace, obj.value)).assertEqual('returnClass:class:1:1:45')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3400
     * @tc.name      testClassDecoratorFactoryClosureReturnValue0001
     * @tc.desc      Verify returned decorator closure captures factory parameter (DECORATOR-FACTORY-TD-0046)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryClosureReturnValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryClosureReturnCase = new DecoratorFactoryClosureReturnCase()
      expect(resultWithValue(closureReturnTrace, obj.value)).
        assertEqual('closureReturn:closureReturn:value:1:1:46')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3500
     * @tc.name      testClassDecoratorFactoryStatefulFunctionReturn0001
     * @tc.desc      Verify returned decorator function preserves factory state (DECORATOR-FACTORY-TD-0047)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryStatefulFunctionReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnedStateCase = new DecoratorFactoryReturnedStateCase()
      expect(resultWithValue(returnedStateTrace, obj.value)).assertEqual('1:value:1:1:1:47')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3600
     * @tc.name      testClassDecoratorFactoryReturnedFunctionReadsParameter0001
     * @tc.desc      Verify returned decorator function can read factory parameter (DECORATOR-FACTORY-TD-0048)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnedFunctionReadsParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
      const obj: DecoratorFactoryReturnedParameterCase = new DecoratorFactoryReturnedParameterCase()
      expect(resultWithValue(returnedParameterTrace, obj.value)).
        assertEqual('returnedParameter:returnedParameter:value:1:1:48')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3700
     * @tc.name      testClassDecoratorFactoryReturnedFunctionReadsModule0001
     * @tc.desc      Verify returned decorator function can read module binding (DECORATOR-FACTORY-TD-0049)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnedFunctionReadsModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
      const obj: DecoratorFactoryReturnedModuleCase = new DecoratorFactoryReturnedModuleCase()
      expect(resultWithValue(returnedModuleTrace, obj.value)).assertEqual('moduleReturn:moduleReturn:value:1:1:49')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3800
     * @tc.name      testClassDecoratorFactoryReturnedFunctionReadsLocal0001
     * @tc.desc      Verify returned decorator function can read local const (DECORATOR-FACTORY-TD-0050)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnedFunctionReadsLocal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnedLocalCase = new DecoratorFactoryReturnedLocalCase()
      expect(resultWithValue(returnedLocalTrace, obj.value)).assertEqual('localReturn:localReturn:value:1:1:50')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_3900
     * @tc.name      testClassDecoratorFactoryReturnNumberPayload0001
     * @tc.desc      Verify factory return path preserves number payload (DECORATOR-FACTORY-TD-0053)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnNumberPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnNumberCase = new DecoratorFactoryReturnNumberCase()
      expect(resultWithValue(returnNumberTrace, obj.value)).assertEqual('53:value:1:1:53')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4000
     * @tc.name      testClassDecoratorFactoryReturnStringPayload0001
     * @tc.desc      Verify factory return path preserves string payload (DECORATOR-FACTORY-TD-0054)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnStringPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnStringCase = new DecoratorFactoryReturnStringCase()
      expect(resultWithValue(returnStringTrace, obj.value)).assertEqual('returnString:value:1:1:54')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4100
     * @tc.name      testClassDecoratorFactoryReturnObjectPayload0001
     * @tc.desc      Verify factory return path preserves object payload (DECORATOR-FACTORY-TD-0055)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnObjectPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnObjectCase = new DecoratorFactoryReturnObjectCase()
      expect(resultWithValue(returnObjectTrace, obj.value)).assertEqual('returnObject:value:1:1:55')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4200
     * @tc.name      testClassDecoratorFactoryReturnClassInstancePayload0001
     * @tc.desc      Verify factory return path preserves class instance payload (DECORATOR-FACTORY-TD-0056)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnClassInstancePayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryReturnInstanceCase = new DecoratorFactoryReturnInstanceCase()
      expect(resultWithValue(returnInstanceTrace, obj.value)).assertEqual('returnInstance:value:1:1:56')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4300
     * @tc.name      testClassDecoratorFactoryImportFactory0001
     * @tc.desc      Verify imported factory can be called as a decorator factory (DECORATOR-FACTORY-TD-0093)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportFactory0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryImportFactoryCase = new DecoratorFactoryImportFactoryCase()
      expect(readImportedFactoryKey() + ':' + obj.importFactoryValue.toString()).assertEqual('importFactoryValue:93')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4400
     * @tc.name      testClassDecoratorFactoryImportReturnedDecorator0001
     * @tc.desc      Verify imported returned decorator can decorate a property (DECORATOR-FACTORY-TD-0094)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportReturnedDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryImportReturnedCase = new DecoratorFactoryImportReturnedCase()
      expect(readImportedReturnedKey() + ':' + obj.importReturnedValue.toString()).assertEqual('importReturnedValue:94')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4500
     * @tc.name      testClassDecoratorFactoryImportParameter0001
     * @tc.desc      Verify factory parameter can reference imported binding (DECORATOR-FACTORY-TD-0095)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryImportParameterCase = new DecoratorFactoryImportParameterCase()
      expect(resultWithValue(importParameterTrace, obj.value)).assertEqual('importedValue:39:value:1:1:95')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4600
     * @tc.name      testClassDecoratorFactoryReturnedDecoratorCapturesImport0001
     * @tc.desc      Verify returned decorator captures imported binding (DECORATOR-FACTORY-TD-0096)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryReturnedDecoratorCapturesImport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
      const obj: DecoratorFactoryImportedCaptureCase = new DecoratorFactoryImportedCaptureCase()
      expect(readImportedCaptureKey() + ':' + obj.importedCaptureValue.toString()).
        assertEqual('moduleBinding:importedCaptureValue:96')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4700
     * @tc.name      testClassDecoratorFactoryExportClass0001
     * @tc.desc      Verify exported class can carry a factory decorator (DECORATOR-FACTORY-TD-0097)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryExportClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryNamedExportClass = new DecoratorFactoryNamedExportClass()
      const result: string = (readNamedExportDecorated() ? 'decorated' : 'notDecorated') + ':' + obj.value.toString()
      expect(result).assertEqual('decorated:97')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4800
     * @tc.name      testClassDecoratorFactoryDefaultExportClass0001
     * @tc.desc      Verify default exported class can carry a factory decorator (DECORATOR-FACTORY-TD-0098)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryDefaultExportClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryDefaultExportClass = new DecoratorFactoryDefaultExportClass()
      const result: string = (readDefaultExportDecorated() ? 'decorated' : 'notDecorated') + ':' + obj.value.toString()
      expect(result).assertEqual('decorated:98')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_4900
     * @tc.name      testClassDecoratorFactoryModuleInitializationOrder0001
     * @tc.desc      Verify imported module initialization is visible to factory tests (DECORATOR-FACTORY-TD-0101)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryModuleInitializationOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(readImportedModuleInitOrder()).assertEqual('moduleReady:importedValue')
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_5000
     * @tc.name      testClassDecoratorFactoryImportBindingAfterLowering0001
     * @tc.desc      Verify imported binding remains correct after decorator lowering (DECORATOR-FACTORY-TD-0102)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportBindingAfterLowering0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryImportLoweringCase = new DecoratorFactoryImportLoweringCase()
      expect(resultWithValue(importLoweringTrace, obj.value)).assertEqual('loweringImport:value:1:1:102')
    })
  })
}
