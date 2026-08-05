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

const decoratedClassNames: string[] = []
const factoryValues: string[] = []
let singleParamValue: string = ''
let multiParamValue1: string = ''
let multiParamValue2: number = 0
let constructorName: string = ''
let constructorTargetReference: Function | null = null
let factoryStringValue: string = ''
let factoryNumberValue: number = 0
let factoryBooleanValue: boolean = false
let factoryMultiValue1: string = ''
let factoryMultiValue2: number = 0
let factoryMultiValue3: boolean = false
let arrowFnResult: number = 0
let normalFnResult: number = 0
let localConstValue: string = ''
let returnedDecoratorTarget: Function | null = null
let closureValue: string = ''

function recordDecoratedTarget(target: Function): void {
  decoratedClassNames.push(target.name)
}

function normalFnImpl(x: number): number {
  return x + 2
}

function classDecoratorImpl(target: Function): void {
  recordDecoratedTarget(target)
}

function noParamsDecoratorImpl(target: Function): void {
  recordDecoratedTarget(target)
}

function factoryDecoratorImpl(value: string): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    factoryValues.push(value)
  }
}

function singleParamDecoratorImpl(value: string): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    singleParamValue = value
  }
}

function multiParamDecoratorImpl(value1: string, value2: number): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    multiParamValue1 = value1
    multiParamValue2 = value2
  }
}

function voidDecoratorImpl(target: Function): void {
  recordDecoratedTarget(target)
}

function originalReturnDecoratorImpl<T extends Function>(target: T): T {
  recordDecoratedTarget(target)
  return target
}

function factoryNoParamsImpl(): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
  }
}

function factoryStringImpl(value: string): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    factoryStringValue = value
  }
}

function factoryNumberImpl(value: number): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    factoryNumberValue = value
  }
}

function factoryBooleanImpl(value: boolean): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    factoryBooleanValue = value
  }
}

function factoryMultiImpl(value1: string, value2: number, value3: boolean): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    factoryMultiValue1 = value1
    factoryMultiValue2 = value2
    factoryMultiValue3 = value3
  }
}

function factoryArrowFnImpl(arrow: (x: number) => number): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    arrowFnResult = arrow(10)
  }
}

function factoryNormalFnImpl(normalFn: (x: number) => number): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    normalFnResult = normalFn(10)
  }
}

function factoryLocalConstImpl(localConst: string): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    localConstValue = localConst
  }
}

function factoryReturningDecoratorImpl(): (target: Function) => void {
  return (target: Function): void => {
    recordDecoratedTarget(target)
    returnedDecoratorTarget = target
  }
}

function factoryReturningClosureImpl(): (target: Function) => void {
  const capturedClosureValue: string = 'closure_value'
  return (target: Function): void => {
    recordDecoratedTarget(target)
    closureValue = capturedClosureValue
  }
}

function constructorTargetDecorator(target: Function): void {
  recordDecoratedTarget(target)
  constructorName = target.name
  constructorTargetReference = target
}

@noParamsDecoratorImpl
class Class0002 {
  public value: number = 42
}

@factoryDecoratorImpl('factory_applied')
class Class0003 {
  public label: string = 'original'
}

@noParamsDecoratorImpl
class Class0004 {
}

@singleParamDecoratorImpl('single_param')
class Class0005 {
  public data: string = 'init'
}

@multiParamDecoratorImpl('hello', 123)
class Class0006 {
  public data: string = 'init'
}

@factoryDecoratorImpl('literal_0007')
class Class0007 {
  public value: number = 1
}

@factoryDecoratorImpl('exp' + '_' + '0008')
class Class0008 {
  public value: number = 1
}

function getFactoryParam0009(): string {
  return 'fn_value_0009'
}

@factoryDecoratorImpl(getFactoryParam0009())
class Class0009 {
  public value: number = 1
}

@classDecoratorImpl
class Class0017 {
  public greet(): string {
    return 'hello'
  }
}

@constructorTargetDecorator
class Class0019 {
  public name: string = 'test'
}

@factoryNoParamsImpl()
class Class0035 {
  public value: number = 1
}

@factoryStringImpl('')
class Class0036 {
  public value: number = 1
}

@factoryNumberImpl(0)
class Class0037 {
  public value: number = 1
}

@factoryBooleanImpl(true)
class Class0038 {
  public value: number = 1
}

@factoryMultiImpl('str', 42, false)
class Class0039 {
  public value: number = 1
}

const arrowFnParam: (x: number) => number = (x: number): number => x + 1

@factoryArrowFnImpl(arrowFnParam)
class Class0040 {
  public value: number = 1
}

@factoryNormalFnImpl(normalFnImpl)
class Class0041 {
  public value: number = 1
}

const localConstParam: string = 'local_const_value'

@factoryLocalConstImpl(localConstParam)
class Class0044 {
  public value: number = 1
}

@factoryReturningDecoratorImpl()
class Class0045 {
  public value: number = 1
}

@factoryReturningClosureImpl()
class Class0046 {
  public value: number = 1
}

@classDecoratorImpl
class Class0053 {
  public name: string = 'decorated_class'
  public greet(): string {
    return 'I am ' + this.name
  }
}

@classDecoratorImpl
class Class0067 {
  public name: string
  constructor() {
    this.name = 'no_args'
  }
}

@classDecoratorImpl
class Class0068 {
  public name: string
  constructor(name: string) {
    this.name = name
  }
}

@classDecoratorImpl
class Class0069 {
  public firstName: string
  public lastName: string
  constructor(firstName: string, lastName: string) {
    this.firstName = firstName
    this.lastName = lastName
  }
}

@classDecoratorImpl
class Class0071 {
  public typedField: string = 'typed_value'
}

@classDecoratorImpl
class Class0073 {
  public static staticField: number = 100
  public getStatic(): number {
    return Class0073.staticField
  }
}

@classDecoratorImpl
class Class0074 {
  public greet(name: string): string {
    return 'Hello, ' + name
  }
}

@classDecoratorImpl
class Class0075 {
  public getName(): string {
    return 'TestClass'
  }
}

@classDecoratorImpl
class Class0076 {
  public static staticMethod(): number {
    return 42
  }
}

@classDecoratorImpl
class Class0085 {
  public static data: string = 'original_data'
  public static getData(): string {
    return Class0085.data
  }
}

@voidDecoratorImpl
class Class0101 {
  public value: number = 1
}

@originalReturnDecoratorImpl
class Class0103 {
  public value: number = 1
}

export function isClassDecoratorApplied(className: string): boolean {
  return decoratedClassNames.indexOf(className) >= 0
}

export function testClassDecorator0002(): number {
  return new Class0002().value
}

export function testClassDecorator0003(): string {
  return factoryValues.indexOf('factory_applied') >= 0 ? 'factory_applied' : 'none'
}

export function testClassDecorator0004(): boolean {
  return new Class0004() instanceof Class0004
}

export function testClassDecorator0005(): string {
  return singleParamValue || 'none'
}

export function testClassDecorator0006(): string {
  return multiParamValue1 + '_' + String(multiParamValue2)
}

export function testClassDecorator0007(): string {
  return factoryValues.indexOf('literal_0007') >= 0 ? 'literal_0007' : 'none'
}

export function testClassDecorator0008(): string {
  return factoryValues.indexOf('exp_0008') >= 0 ? 'exp_0008' : 'none'
}

export function testClassDecorator0009(): string {
  return factoryValues.indexOf('fn_value_0009') >= 0 ? 'fn_value_0009' : 'none'
}

export function testClassDecorator0010(): string {
  return new Class0017().greet()
}

export function testClassDecorator0011(): string {
  return constructorName
}

export function testClassDecorator0012(): boolean {
  return constructorTargetReference !== null && constructorTargetReference.name === 'Class0019'
}

export function testClassDecorator0013(): number {
  return new Class0035().value
}

export function testClassDecorator0014(): string {
  return factoryStringValue
}

export function testClassDecorator0015(): number {
  return factoryNumberValue
}

export function testClassDecorator0016(): boolean {
  return factoryBooleanValue
}

export function testClassDecorator0017String(): string {
  return factoryMultiValue1
}

export function testClassDecorator0017Number(): number {
  return factoryMultiValue2
}

export function testClassDecorator0017Boolean(): boolean {
  return factoryMultiValue3
}

export function testClassDecorator0018(): number {
  return arrowFnResult
}

export function testClassDecorator0019(): number {
  return normalFnResult
}

export function testClassDecorator0020(): string {
  return localConstValue || 'none'
}

export function testClassDecorator0021(): boolean {
  return returnedDecoratorTarget !== null && returnedDecoratorTarget.name === 'Class0045'
}

export function testClassDecorator0021Value(): number {
  return new Class0045().value
}

export function testClassDecorator0022(): string {
  return closureValue || 'none'
}

export function testClassDecorator0023(): string {
  return new Class0053().greet()
}

export function testClassDecorator0024(): string {
  return new Class0067().name
}

export function testClassDecorator0025(): string {
  return new Class0068('single_arg').name
}

export function testClassDecorator0026FirstName(): string {
  return new Class0069('John', 'Doe').firstName
}

export function testClassDecorator0026LastName(): string {
  return new Class0069('John', 'Doe').lastName
}

export function testClassDecorator0027(): string {
  return new Class0071().typedField
}

export function testClassDecorator0028(): number {
  return new Class0073().getStatic()
}

export function testClassDecorator0029(): string {
  return new Class0074().greet('World')
}

export function testClassDecorator0030(): string {
  return new Class0075().getName()
}

export function testClassDecorator0031(): number {
  return Class0076.staticMethod()
}

export function testClassDecorator0032(): string {
  return Class0085.getData()
}

export function testClassDecorator0033(): number {
  return new Class0101().value
}

export function testClassDecorator0034(): number {
  return new Class0103().value
}
