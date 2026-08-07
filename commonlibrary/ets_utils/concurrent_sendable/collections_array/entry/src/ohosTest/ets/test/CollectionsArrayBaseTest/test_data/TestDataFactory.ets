/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// TestDataFactory.ets

import { collections, lang } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS';

// ==================== 基础类型测试数据 ====================
export class BasicTypeTestData {
  // number
  static readonly NUMBER_NORMAL: number = 100;
  static readonly NUMBER_SPECIAL: number = 1.5e-10;
  static readonly NUMBER_BOUNDARY: number = Number.MAX_SAFE_INTEGER;
  static readonly NUMBER_NAN: number = NaN;
  // 新增 number 特殊值
  static readonly NUMBER_NEGATIVE_ONE: number = -1;
  static readonly NUMBER_NEGATIVE_MAX: number = Number.MIN_SAFE_INTEGER;
  static readonly NUMBER_ZERO: number = 0;
  static readonly NUMBER_NEGATIVE_ZERO: number = -0;
  static readonly NUMBER_HEX: number = 0x12;
  static readonly NUMBER_OCTAL: number = 0o77;
  static readonly NUMBER_BINARY: number = 0b1010;
  static readonly NUMBER_INFINITY: number = Infinity;
  static readonly NUMBER_NEGATIVE_INFINITY: number = -Infinity;
  static readonly NUMBER_FLOAT_PI: number = 3.141592653589793;
  static readonly NUMBER_FLOAT_NEGATIVE: number = -0.001;
  static readonly NUMBER_NEGATIVE_01: number = -0.01;

  // bigint
  static readonly BIGINT_NORMAL: bigint = BigInt(100);
  static readonly BIGINT_LARGE: bigint = BigInt(Number.MAX_SAFE_INTEGER) + BigInt(1);
  static readonly BIGINT_ZERO: bigint = BigInt(0);
  static readonly BIGINT_NEGATIVE: bigint = BigInt(-1);

  // string
  static readonly STRING_NORMAL: string = 'test测试123';
  static readonly STRING_SPECIAL: string = 'a\n\t\u200B\u0000';
  static readonly STRING_EMOJI: string = '测试😀🎉🔥';
  static readonly STRING_EMPTY: string = '';

  // boolean
  static readonly BOOLEAN_TRUE: boolean = true;
  static readonly BOOLEAN_FALSE: boolean = false;

  // undefined/null
  static readonly UNDEFINED_VALUE: undefined = undefined;
  static readonly NULL_VALUE: null = null;
}

// ==================== 测试值包装类 ====================

@Sendable
export class NumberTestValue {
  id: string;
  value: number;
  constructor(id: string, value: number) {
    this.id = id;
    this.value = value;
  }
}

@Sendable
export class BigIntTestValue {
  id: string;
  value: bigint;
  constructor(id: string, value: bigint) {
    this.id = id;
    this.value = value;
  }
}

@Sendable
export class StringTestValue {
  id: string;
  value: string;
  constructor(id: string, value: string) {
    this.id = id;
    this.value = value;
  }
}

@Sendable
export class BooleanTestValue {
  id: string;
  value: boolean;
  constructor(id: string, value: boolean) {
    this.id = id;
    this.value = value;
  }
}

@Sendable
export class TestValueItem {
  id: string;
  value: lang.ISendable | null;
  constructor(id: string, value: lang.ISendable | null) {
    this.id = id;
    this.value = value;
  }
}

// ==================== Sendable 对象类型 ====================

@Sendable
export class NormalObject {
  name: string = 'test';
  age: number = 20;
}

@Sendable
export class EmptyObject {}

@Sendable
export class ComplexObject {
  key1: number = 1;
  key2: number = 2;
  extraProperties: collections.Map<string, number> | null = null;
}

// ==================== Sendable 函数类型 Wrapper ====================

@Sendable
export class NormalFunctionWrapper {
  type: string = 'function';
}

@Sendable
export class ArrowFunctionWrapper {
  type: string = 'arrow';
}

@Sendable
export class AsyncFunctionWrapper {
  type: string = 'async';
}

// ==================== Sendable 特殊类型 ====================

@Sendable
export class SendableClassBasic {
  id: number = 1;
  name: string = 'test';
}

@Sendable
export class SendableClassComplex {
  id: number = 1;
  data: SendableClassBasic = new SendableClassBasic();
  items: collections.Array<number> | null = null;
}

@Sendable
export class SendableClassExtended extends SendableClassBasic {
  extraField: string = 'extended';
}

export const enum SendableEnum {
  Success = 0,
  Failure = 1,
  Pending = 2
}

@Sendable
export function sendableFunction(): string {
  return 'sendable';
}

// ==================== Wrapper 类 ====================

@Sendable
export class NumberWrapper {
  value: number = 0;
  constructor(value: number = 0) {
    this.value = value;
  }
}

@Sendable
export class BigIntWrapper {
  value: bigint = BigInt(0);
  constructor(value: bigint = BigInt(0)) {
    this.value = value;
  }
}

@Sendable
export class StringWrapper {
  value: string = '';
  constructor(value: string = '') {
    this.value = value;
  }
}

@Sendable
export class BooleanWrapper {
  value: boolean = false;
  constructor(value: boolean = false) {
    this.value = value;
  }
}

@Sendable
export class ObjectWrapper {
  value: NormalObject | null = null;
}

@Sendable
export class EmptyObjectWrapper {
  value: EmptyObject | null = null;
}

@Sendable
export class ComplexObjectWrapper {
  value: ComplexObject | null = null;
}

@Sendable
export class ArrayWrapper {
  value: collections.Array<number> | null = null;
}

@Sendable
export class EmptyArrayWrapper {
  value: collections.Array<number> | null = null;
}

@Sendable
export class SparseArrayWrapper {
  value: collections.Array<number> | null = null;
  hasHole: boolean = true;
}

// ==================== 边界类型 ====================

@Sendable
export class LargeObjectWrapper {
  value: ComplexObject | null = null;
  propCount: number = 1000;
}

@Sendable
export class LargeArrayWrapper {
  value: collections.Array<number> | null = null;
  elementCount: number = 10000;
}

@Sendable
export class DeepNestedWrapper {
  depth: number = 10;
  data: string = 'deep_nested';
  children: collections.Array<DeepNestedWrapper> | null = null;
}

@Sendable
export class CircularRefWrapper {
  selfRef: boolean = true;
  data: string = 'circular';
}

// ==================== 测试值获取函数 ====================

export function getNumberTestValues(): collections.Array<NumberTestValue> {
  let result: collections.Array<NumberTestValue> = new collections.Array<NumberTestValue>();
  result.push(new NumberTestValue('number_normal', BasicTypeTestData.NUMBER_NORMAL));
  result.push(new NumberTestValue('number_special', BasicTypeTestData.NUMBER_SPECIAL));
  result.push(new NumberTestValue('number_boundary', BasicTypeTestData.NUMBER_BOUNDARY));
  result.push(new NumberTestValue('number_nan', BasicTypeTestData.NUMBER_NAN));
  result.push(new NumberTestValue('number_negative_one', BasicTypeTestData.NUMBER_NEGATIVE_ONE));
  result.push(new NumberTestValue('number_negative_max', BasicTypeTestData.NUMBER_NEGATIVE_MAX));
  result.push(new NumberTestValue('number_zero', BasicTypeTestData.NUMBER_ZERO));
  result.push(new NumberTestValue('number_negative_zero', BasicTypeTestData.NUMBER_NEGATIVE_ZERO));
  result.push(new NumberTestValue('number_hex', BasicTypeTestData.NUMBER_HEX));
  result.push(new NumberTestValue('number_octal', BasicTypeTestData.NUMBER_OCTAL));
  result.push(new NumberTestValue('number_binary', BasicTypeTestData.NUMBER_BINARY));
  result.push(new NumberTestValue('number_infinity', BasicTypeTestData.NUMBER_INFINITY));
  result.push(new NumberTestValue('number_negative_infinity', BasicTypeTestData.NUMBER_NEGATIVE_INFINITY));
  result.push(new NumberTestValue('number_float_pi', BasicTypeTestData.NUMBER_FLOAT_PI));
  result.push(new NumberTestValue('number_float_negative', BasicTypeTestData.NUMBER_FLOAT_NEGATIVE));
  result.push(new NumberTestValue('number_negative_01', BasicTypeTestData.NUMBER_NEGATIVE_01));
  return result;
}

export function getBigIntTestValues(): collections.Array<BigIntTestValue> {
  let result: collections.Array<BigIntTestValue> = new collections.Array<BigIntTestValue>();
  result.push(new BigIntTestValue('bigint_normal', BasicTypeTestData.BIGINT_NORMAL));
  result.push(new BigIntTestValue('bigint_large', BasicTypeTestData.BIGINT_LARGE));
  result.push(new BigIntTestValue('bigint_zero', BasicTypeTestData.BIGINT_ZERO));
  result.push(new BigIntTestValue('bigint_negative', BasicTypeTestData.BIGINT_NEGATIVE));
  return result;
}

export function getStringTestValues(): collections.Array<StringTestValue> {
  let result: collections.Array<StringTestValue> = new collections.Array<StringTestValue>();
  result.push(new StringTestValue('string_normal', BasicTypeTestData.STRING_NORMAL));
  result.push(new StringTestValue('string_special', BasicTypeTestData.STRING_SPECIAL));
  result.push(new StringTestValue('string_emoji', BasicTypeTestData.STRING_EMOJI));
  result.push(new StringTestValue('string_empty', BasicTypeTestData.STRING_EMPTY));
  return result;
}

export function getBooleanTestValues(): collections.Array<BooleanTestValue> {
  let result: collections.Array<BooleanTestValue> = new collections.Array<BooleanTestValue>();
  result.push(new BooleanTestValue('boolean_true', BasicTypeTestData.BOOLEAN_TRUE));
  result.push(new BooleanTestValue('boolean_false', BasicTypeTestData.BOOLEAN_FALSE));
  return result;
}

export function getAllTestValues(): collections.Array<TestValueItem> {
  let result: collections.Array<TestValueItem> = new collections.Array<TestValueItem>();

  // ===== number（16个） =====
  result.push(new TestValueItem('number_normal', new NumberWrapper(100)));
  result.push(new TestValueItem('number_special', new NumberWrapper(1.5e-10)));
  result.push(new TestValueItem('number_boundary', new NumberWrapper(Number.MAX_SAFE_INTEGER)));
  result.push(new TestValueItem('number_nan', new NumberWrapper(NaN)));
  result.push(new TestValueItem('number_negative_one', new NumberWrapper(-1)));
  result.push(new TestValueItem('number_negative_max', new NumberWrapper(Number.MIN_SAFE_INTEGER)));
  result.push(new TestValueItem('number_zero', new NumberWrapper(0)));
  result.push(new TestValueItem('number_negative_zero', new NumberWrapper(-0)));
  result.push(new TestValueItem('number_hex', new NumberWrapper(0x12)));
  result.push(new TestValueItem('number_octal', new NumberWrapper(0o77)));
  result.push(new TestValueItem('number_binary', new NumberWrapper(0b1010)));
  result.push(new TestValueItem('number_infinity', new NumberWrapper(Infinity)));
  result.push(new TestValueItem('number_negative_infinity', new NumberWrapper(-Infinity)));
  result.push(new TestValueItem('number_float_pi', new NumberWrapper(3.141592653589793)));
  result.push(new TestValueItem('number_float_negative', new NumberWrapper(-0.001)));
  result.push(new TestValueItem('number_negative_01', new NumberWrapper(-0.01)));

  // ===== bigint（4个） =====
  result.push(new TestValueItem('bigint_normal', new BigIntWrapper(BigInt(100))));
  result.push(new TestValueItem('bigint_large', new BigIntWrapper(BigInt(Number.MAX_SAFE_INTEGER) + BigInt(1))));
  result.push(new TestValueItem('bigint_zero', new BigIntWrapper(BigInt(0))));
  result.push(new TestValueItem('bigint_negative', new BigIntWrapper(BigInt(-1))));

  // ===== string（4个） =====
  result.push(new TestValueItem('string_normal', new StringWrapper('test测试123')));
  result.push(new TestValueItem('string_special', new StringWrapper('a\n\t\u200B\u0000')));
  result.push(new TestValueItem('string_emoji', new StringWrapper('测试😀🎉🔥')));
  result.push(new TestValueItem('string_empty', new StringWrapper('')));

  // ===== boolean（2个） =====
  result.push(new TestValueItem('boolean_true', new BooleanWrapper(true)));
  result.push(new TestValueItem('boolean_false', new BooleanWrapper(false)));

  // ===== 复合类型（9个） =====
  result.push(new TestValueItem('object_normal', new NormalObject()));
  result.push(new TestValueItem('object_empty', new EmptyObject()));

  let complexObj: ComplexObject = new ComplexObject();
  complexObj.extraProperties = new collections.Map<string, number>();
  complexObj.extraProperties.set('key3', 3);
  complexObj.extraProperties.set('key4', 4);
  result.push(new TestValueItem('object_complex', complexObj));

  let arrayWrapper: ArrayWrapper = new ArrayWrapper();
  arrayWrapper.value = new collections.Array<number>();
  arrayWrapper.value.push(1);
  arrayWrapper.value.push(2);
  arrayWrapper.value.push(3);
  result.push(new TestValueItem('array_normal', arrayWrapper));

  let emptyArrWrapper: EmptyArrayWrapper = new EmptyArrayWrapper();
  emptyArrWrapper.value = new collections.Array<number>();
  result.push(new TestValueItem('array_empty', emptyArrWrapper));

  let sparseWrapper: SparseArrayWrapper = new SparseArrayWrapper();
  sparseWrapper.value = new collections.Array<number>();
  sparseWrapper.value.push(1);
  sparseWrapper.value.push(2);
  result.push(new TestValueItem('array_sparse', sparseWrapper));

  result.push(new TestValueItem('function_normal', new NormalFunctionWrapper()));
  result.push(new TestValueItem('function_arrow', new ArrowFunctionWrapper()));
  result.push(new TestValueItem('function_async', new AsyncFunctionWrapper()));

  // ===== Sendable 特殊类型（11个） =====
  result.push(new TestValueItem('sendable_class_basic', new SendableClassBasic()));

  let complexInst: SendableClassComplex = new SendableClassComplex();
  complexInst.items = new collections.Array<number>();
  complexInst.items.push(1);
  complexInst.items.push(2);
  complexInst.items.push(3);
  result.push(new TestValueItem('sendable_class_complex', complexInst));

  result.push(new TestValueItem('sendable_class_extended', new SendableClassExtended()));
  result.push(new TestValueItem('sendable_function', new NormalFunctionWrapper()));
  result.push(new TestValueItem('sendable_enum', new NumberWrapper(SendableEnum.Success)));

  result.push(new TestValueItem('async_lock', new ArkTSUtils.locks.AsyncLock()));
  result.push(new TestValueItem('condition_variable', new ArkTSUtils.locks.ConditionVariable()));
  result.push(new TestValueItem('sendable_lru_cache', new ArkTSUtils.SendableLruCache<number, string>()));

  result.push(new TestValueItem('nested_map', new collections.Map<number, string>()));
  result.push(new TestValueItem('nested_set', new collections.Set<number>()));
  result.push(new TestValueItem('nested_array', new collections.Array<number>()));

  // ===== 边界类型（4个） =====
  let largeObj: LargeObjectWrapper = new LargeObjectWrapper();
  let largeComplexObj: ComplexObject = new ComplexObject();
  let largeExtraProps: collections.Map<string, number> = new collections.Map<string, number>();
  for (let j: number = 0; j < 1000; j++) {
    largeExtraProps.set('prop_' + j.toString(), j);
  }
  largeComplexObj.extraProperties = largeExtraProps;
  largeObj.value = largeComplexObj;
  result.push(new TestValueItem('large_object', largeObj));

  let largeArrWrapper: LargeArrayWrapper = new LargeArrayWrapper();
  largeArrWrapper.value = new collections.Array<number>();
  for (let j: number = 0; j < 10000; j++) {
    largeArrWrapper.value.push(j);
  }
  result.push(new TestValueItem('large_array', largeArrWrapper));

  let deepNested: DeepNestedWrapper = new DeepNestedWrapper();
  deepNested.depth = 0;
  deepNested.data = 'level_0';
  deepNested.children = new collections.Array<DeepNestedWrapper>();
  let currentParent: DeepNestedWrapper = deepNested;
  for (let j: number = 1; j <= 10; j++) {
    let child: DeepNestedWrapper = new DeepNestedWrapper();
    child.depth = j;
    child.data = 'level_' + j.toString();
    child.children = new collections.Array<DeepNestedWrapper>();
    currentParent.children!.push(child);
    currentParent = child;
  }
  result.push(new TestValueItem('deep_nested', deepNested));

  result.push(new TestValueItem('circular_ref', new CircularRefWrapper()));

  return result;
}