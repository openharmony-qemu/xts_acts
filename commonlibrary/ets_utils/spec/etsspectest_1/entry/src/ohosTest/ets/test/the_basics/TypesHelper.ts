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
  CrossModuleTypeClass,
  createCrossModuleArray,
  createCrossModuleInstance,
  crossModuleFunction
} from './TypesCrossModule'

interface BasicObjectRecord {
  id: number
  label: string
}

interface SymbolPropertyRecord {
  visible: string
}

class RuntimeTypeClass {
  public label: string

  constructor(label: string) {
    this.label = label
  }
}

class BaseTypeClass {
  public baseValue: string = 'base'
}

class DerivedTypeClass extends BaseTypeClass {
  public derivedValue: string = 'derived'
}

class PrimitiveTypeBox {
  private value: number

  constructor(value: number) {
    this.value = value
  }

  public valueOf(): number {
    return this.value
  }
}

function helperFunctionValue(): number {
  return 12
}

function helperDouble(value: number): number {
  return value * 2
}

export function assertNumberBasicValues(): boolean {
  let integerValue: number = 12
  let floatValue: number = 3.5
  let negativeValue: number = -8
  return integerValue === 12 && floatValue === 3.5 && negativeValue === -8
}

export function assertNumberSpecialValues(): boolean {
  let nanValue: number = NaN
  let positiveInfinity: number = Infinity
  let negativeInfinity: number = -Infinity
  let positiveZero: number = +0
  let negativeZero: number = -0
  return nanValue !== nanValue &&
    positiveInfinity > 0 &&
    negativeInfinity < 0 &&
    1 / positiveZero === Infinity &&
    1 / negativeZero === -Infinity
}

export function assertStringBasicValues(): boolean {
  let emptyValue: string = ''
  let singleValue: string = 'A'
  let longValue: string = 'types-runtime-string'
  return emptyValue.length === 0 && singleValue.length === 1 && longValue.indexOf('types') === 0
}

export function assertBooleanBasicValues(): boolean {
  let values: boolean[] = [true, false]
  return values[0] !== values[1] && !values[0] === values[1] && !values[1] === values[0]
}

export function assertBigIntBasicValues(): boolean {
  let smallValue: bigint = 1n
  let largeValue: bigint = 9007199254740993n
  let negativeValue: bigint = -5n
  return smallValue + negativeValue === -4n && largeValue > smallValue
}

export function assertSymbolCreationUniqueness(): boolean {
  let leftSymbol: symbol = Symbol('type')
  let rightSymbol: symbol = Symbol('type')
  return leftSymbol !== rightSymbol && leftSymbol.toString() === 'Symbol(type)'
}

export function assertNullToBooleanFalsy(): boolean {
  return !null
}

export function assertUndefinedToBooleanFalsy(): boolean {
  return !undefined
}

export function assertObjectBasicPropertyAccess(): boolean {
  let value: BasicObjectRecord = {
    id: 9,
    label: 'type-object'
  }
  return value.id === 9 && value.label === 'type-object'
}

export function assertArrayRuntimeType(): boolean {
  let values: number[] = [1, 2, 3]
  return typeof values === 'object' && Array.isArray(values)
}

export function assertFunctionObjectTypeof(): boolean {
  return typeof helperFunctionValue === 'function' && helperFunctionValue() === 12
}

export function assertTypeofUndefined(): boolean {
  return typeof undefined === 'undefined'
}

export function assertTypeofNull(): boolean {
  return typeof null === 'object'
}

export function assertTypeofBigInt(): boolean {
  return typeof 1n === 'bigint'
}

export function assertTypeofSymbol(): boolean {
  return typeof Symbol('type') === 'symbol'
}

export function assertInstanceofClassInstance(): boolean {
  let value: RuntimeTypeClass = new RuntimeTypeClass('instance')
  return value instanceof RuntimeTypeClass
}

export function assertInstanceofArray(): boolean {
  let values: number[] = [1, 2, 3]
  return values instanceof Array
}

export function assertToBooleanFalsyValues(): boolean {
  let nanValue: number = NaN
  let negZero: number = -0
  let bigZero: bigint = 0n
  return !Boolean(0) &&
    !Boolean('') &&
    !Boolean(null) &&
    !Boolean(undefined) &&
    !Boolean(nanValue) &&
    !Boolean(negZero) &&
    !Boolean(bigZero) &&
    !Boolean(false)
}

export function assertToBooleanTruthyValues(): boolean {
  let values: number[] = []
  let record: BasicObjectRecord = {
    id: 1,
    label: 'truthy'
  }
  return Boolean('0') && Boolean('false') && Boolean(values) && Boolean(record)
}

export function assertToNumberString(): boolean {
  let validNumber: number = Number('123')
  let invalidNumber: number = Number('abc')
  return validNumber === 123 && invalidNumber !== invalidNumber
}

export function assertToStringNumber(): boolean {
  return String(123) === '123'
}

export function assertNullEqualsUndefined(): boolean {
  let nullValue: null | undefined = null
  let undefinedValue: null | undefined = undefined
  return nullValue == undefinedValue
}

export function assertNullStrictNotUndefined(): boolean {
  let nullValue: null | undefined = null
  let undefinedValue: null | undefined = undefined
  return !(nullValue === undefinedValue)
}

export function assertNumberEqualsBigInt(): boolean {
  let values: (number | bigint)[] = [1, 1n]
  return values[0] == values[1]
}

export function assertTypeofPlusOperatorCombination(): boolean {
  let value: string = 1 + '2'
  return typeof value === 'string' && value === '12'
}

export function assertInstanceofClassInheritanceChain(): boolean {
  let value: DerivedTypeClass = new DerivedTypeClass()
  return value instanceof DerivedTypeClass && value instanceof BaseTypeClass
}

export function assertArrayTypeofMethods(): boolean {
  let values: number[] = [1, 2]
  values.push(3)
  let mapped: number[] = values.map((value: number): number => value * 2)
  return typeof values === 'object' &&
    Array.isArray(values) &&
    values.length === 3 &&
    mapped[2] === 6
}

export function assertToPrimitiveObjectOperator(): boolean {
  let box: PrimitiveTypeBox = new PrimitiveTypeBox(40)
  return Number(box) + 2 === 42
}

export function assertTypeConversionComparisonEquality(): boolean {
  let values: (string | number)[] = ['5', 5]
  return values[0] == values[1]
}

export function assertSymbolPropertyKeyForIn(): boolean {
  let symbolKey: symbol = Symbol('hidden')
  let record: SymbolPropertyRecord = {
    visible: 'shown'
  }
  Object.defineProperty(record, symbolKey, {
    value: 'hidden',
    enumerable: true
  })

  let keys: string[] = []
  for (let key in record) {
    keys.push(key)
  }

  let symbols: symbol[] = Object.getOwnPropertySymbols(record)
  let descriptor: PropertyDescriptor | undefined = Object.getOwnPropertyDescriptor(record, symbolKey)
  return keys.length === 1 &&
    keys[0] === 'visible' &&
    symbols.length === 1 &&
    symbols[0] === symbolKey &&
    descriptor !== undefined &&
    descriptor.value === 'hidden'
}

export function assertCrossModuleClassInstanceof(): boolean {
  let value: CrossModuleTypeClass = createCrossModuleInstance()
  return value instanceof CrossModuleTypeClass && value.value === 33
}

export function assertCrossModuleArrayTypeConsistency(): boolean {
  let value: number[] = createCrossModuleArray()
  return typeof value === 'object' && Array.isArray(value) && value.length === 3
}

export function assertCrossModuleFunctionTypeConsistency(): boolean {
  return typeof crossModuleFunction === 'function' && crossModuleFunction() === 'cross-module-function'
}

export function assertTypeofObject(): boolean {
  return typeof {} === 'object'
}
