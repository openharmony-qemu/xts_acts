'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ArrayList from '@ohos.util.ArrayList';

type FieldValue = string | number | boolean | undefined | null | FieldValue[] | Record<string, FieldValue> | ReflectClass;

const FIELD_VALUE_EQUALS_MAX_DEPTH: number = 20;

function fieldValueEquals(a: FieldValue, b: FieldValue, depth: number = 0): boolean {
  if (depth > FIELD_VALUE_EQUALS_MAX_DEPTH) {
    console.warn(`fieldValueEquals: max depth ${FIELD_VALUE_EQUALS_MAX_DEPTH} exceeded, treating as not equal`);
    return false;
  }
  if (typeof a === 'number' && typeof b === 'number' && a !== a && b !== b) {
    return true;
  }
  if (a === b) {
    return true;
  }
  if (a === null || b === null || a === undefined || b === undefined) {
    return false;
  }
  if (typeof a !== typeof b) {
    return false;
  }
  if (Array.isArray(a) && Array.isArray(b)) {
    let arrA: FieldValue[] = a as FieldValue[];
    let arrB: FieldValue[] = b as FieldValue[];
    if (arrA.length !== arrB.length) {
      return false;
    }
    for (let i = 0; i < arrA.length; i++) {
      let valA: FieldValue = arrA[i] as FieldValue;
      let valB: FieldValue = arrB[i] as FieldValue;
      if (!fieldValueEquals(valA, valB, depth + 1)) {
        return false;
      }
    }
    return true;
  }
  if (typeof a === 'object' && typeof b === 'object') {
    if (a instanceof ReflectClass && b instanceof ReflectClass) {
      return a.equals(b);
    }
    let keysA: string[] = Object.keys(a as Record<string, FieldValue>);
    let keysB: string[] = Object.keys(b as Record<string, FieldValue>);
    if (keysA.length !== keysB.length) {
      return false;
    }
    for (let key of keysA) {
      if (keysB.findIndex((k: string) => k === key) === -1) {
        return false;
      }
      if (!fieldValueEquals(
        (a as Record<string, FieldValue>)[key],
        (b as Record<string, FieldValue>)[key],
        depth + 1
      )) {
        return false;
      }
    }
    return true;
  }
  return false;
}

interface StaticField {
  getName(): string;

  getOwner(): ReflectClass;

  getType(): ReflectClass;

  getValue(): FieldValue;

  equals(other: StaticField | null | undefined): boolean;

  isPublic(): boolean;

  isPrivate(): boolean;

  isProtected(): boolean;

  isInternal(): boolean;

  isReadonly(): boolean;

  setValue(value: FieldValue): void;
}

class StaticFieldImpl implements StaticField {
  private name: string;
  private owner: ReflectClass;
  private type: ReflectClass;
  private value: FieldValue;
  private isPublicFlag: boolean;
  private isPrivateFlag: boolean;
  private isProtectedFlag: boolean;
  private isReadonlyFlag: boolean;
  private isInternalFlag: boolean;

  constructor(
    name: string,
    owner: ReflectClass,
    type: ReflectClass,
    value: FieldValue,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ) {
    this.name = name;
    this.owner = owner;
    this.type = type;
    this.value = value;
    this.isPublicFlag = isPublic;
    this.isPrivateFlag = isPrivate;
    this.isProtectedFlag = isProtected;
    this.isReadonlyFlag = isReadonly;
    this.isInternalFlag = !isPublic && !isPrivate && !isProtected;
  }

  getName(): string {
    return this.name;
  }

  getOwner(): ReflectClass {
    return this.owner;
  }

  getType(): ReflectClass {
    return this.type;
  }

  getValue(): FieldValue {
    return this.value;
  }

  equals(other: StaticField | null | undefined): boolean {
    if (other === undefined || other === null) {
      return false;
    }
    let otherField: StaticField = other as StaticField;
    let otherOwner: ReflectClass = otherField.getOwner();
    let otherType: ReflectClass = otherField.getType();
    let thisVal = this.value;
    let otherVal = otherField.getValue();
    if (typeof thisVal === 'number' && typeof otherVal === 'number') {
      let thisIsNaN: boolean = thisVal !== thisVal;
      let otherIsNaN: boolean = otherVal !== otherVal;
      if (thisIsNaN && otherIsNaN) {
        return this.name === otherField.getName() &&
          this.owner.equals(otherOwner) &&
          this.type.equals(otherType);
      }
      if (thisIsNaN !== otherIsNaN) {
        return false;
      }
    }
    return this.name === otherField.getName() &&
      this.owner.equals(otherOwner) &&
      this.type.equals(otherType) &&
      fieldValueEquals(thisVal, otherVal);
  }

  isPublic(): boolean {
    return this.isPublicFlag;
  }

  isPrivate(): boolean {
    return this.isPrivateFlag;
  }

  isProtected(): boolean {
    return this.isProtectedFlag;
  }

  isInternal(): boolean {
    return this.isInternalFlag;
  }

  isReadonly(): boolean {
    return this.isReadonlyFlag;
  }

  setValue(value: FieldValue): void {
    if (this.isReadonlyFlag) {
      throw new TypeError('Cannot set value on readonly field');
    }
    this.value = value;
  }
}

class ReflectClass {
  private className: string;
  private staticFields: Map<string, StaticField>;
  private instanceFields: Map<string, StaticField>;

  constructor(className: string) {
    this.className = className;
    this.staticFields = new Map<string, StaticField>();
    this.instanceFields = new Map<string, StaticField>();
  }

  getName(): string {
    return this.className;
  }

  equals(other: ReflectClass): boolean {
    return this.className === other.getName();
  }

  addStaticField(
    name: string,
    type: ReflectClass,
    value: FieldValue,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ): void {
    if ((isPublic && isPrivate) || (isPublic && isProtected) || (isPrivate && isProtected)) {
      throw new TypeError(`StaticField '${name}': only one access modifier can be true.`);
    }
    if (!isPublic && !isPrivate && !isProtected) {
      throw new TypeError(`StaticField '${name}': at least one access modifier must be true. ` +
        `For internal fields, use addInternalStaticField instead.`);
    }

    let field = new StaticFieldImpl(name, this, type, value, isPublic, isPrivate, isProtected, isReadonly);
    this.staticFields.set(name, field);
  }

  addInternalStaticField(
    name: string,
    type: ReflectClass,
    value: FieldValue,
    isReadonly: boolean
  ): void {
    let field = new StaticFieldImpl(name, this, type, value, false, false, false, isReadonly);
    this.staticFields.set(name, field);
  }

  addInstanceField(
    name: string,
    type: ReflectClass,
    isPublic: boolean,
    isPrivate: boolean,
    isProtected: boolean,
    isReadonly: boolean
  ): void {
    if ((isPublic && isPrivate) || (isPublic && isProtected) || (isPrivate && isProtected)) {
      throw new TypeError(`InstanceField '${name}': only one access modifier can be true.`);
    }
    if (!isPublic && !isPrivate && !isProtected) {
      throw new TypeError(`InstanceField '${name}': at least one access modifier must be true.`);
    }

    let field = new StaticFieldImpl(name, this, type, undefined, isPublic, isPrivate, isProtected, isReadonly);
    this.instanceFields.set(name, field);
  }

  getStaticField(name: string): StaticField | null {
    let field = this.staticFields.get(name);
    return field !== undefined ? field : null;
  }

  getDeclaredStaticFields(): StaticField[] {
    let result: StaticField[] = [];
    let values = this.staticFields.values();
    let it = values.next();
    while (!it.done) {
      let field: StaticField | undefined = it.value;
      if (field !== undefined) {
        result.push(field);
      }
      it = values.next();
    }
    return result;
  }

  getInstanceField(name: string): StaticField | null {
    let field = this.instanceFields.get(name);
    return field !== undefined ? field : null;
  }
}

function createReflectClass(className: string): ReflectClass {
  return new ReflectClass(className);
}

const PLACEHOLDER_PASSWORD: string = 'placeholder_password';
const PLACEHOLDER_TOKEN: string = 'placeholder_token';
const PLACEHOLDER_API_KEY: string = 'placeholder_api_key';
const PLACEHOLDER_SSN: string = 'placeholder_ssn';
const PLACEHOLDER_CARD_NUMBER: string = 'placeholder_card_number';
const PLACEHOLDER_CVV: string = 'placeholder_cvv';
const PLACEHOLDER_USERNAME: string = 'placeholder_username';
const PLACEHOLDER_PATIENT_NAME: string = 'placeholder_patient';
const PLACEHOLDER_DIAGNOSIS: string = 'placeholder_diagnosis';

export interface Runnable {
  run(): void;
}


export class EmptyCls {
  public constructor() {}
}

export class DoubleFieldClass {
  public value: number = 0.0;
  public constructor(v: number) {
    this.value = v;
  }
}

export class DualParamCons {
  key_: string = '';
  count_: number = 0;
  public constructor(k: string, c: number) {
    this.key_ = k;
    this.count_ = c;
  }
}

export class MixedParamCons {
  flag_: boolean = false;
  label_: string = '';
  public constructor(f: boolean, l: string) {
    this.flag_ = f;
    this.label_ = l;
  }
}

export class ParamCountCls {
  public constructor(x: int, s: string) {}
}

export class StringFieldWithMethod {
  public value: string;
  public constructor(v: string) {
    this.value = v;
  }
  public getLength(): int {
    return this.value.length;
  }
  public prefix(pre: string): string {
    return pre + this.value;
  }
}

export class TcTwoPubA {
  public constructor(x?: int) {}
}

export class GetParamTypeABC {
  public constructor(x: int, s: string, b: boolean) {}
}

export class Eq02_C {
  public constructor(a: number, b: string) {}
}

export class S5 { constructor(a: int, b: string, c: boolean, d: int) {} }

export class S6 { constructor(a: int, b: string, c: boolean, d: int, e: string) {} }

export class S7 { constructor(a: int, b: string, c: boolean, d: int, e: string, f: int) {} }

export class S8 { constructor(a: int, b: string, c: boolean, d: int, e: string, f: int, g: string) {} }

export class S9 { constructor(a: int, b: string, c: boolean, d: int, e: string, f: int, g: string, h: boolean) {} }

export class S10 { constructor(a: int, b: string, c: boolean, d: int, e: string, f: int, g: string, h: boolean, i: int) {} }

export class DefaultAndRequired_Ext {
  public constructor(b: string, a: int = 0) {
  }
}

export class MultiParamCtor {
  public a: int;
  public b: string;
  public c: number;
  public constructor(a: int, b: string, c: number) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

export class IP2_110_PubDefBool {
  public constructor(b: boolean = true) {}
}

export class TcPub19 {
  public constructor(a: int[]) {
  }
}

export class MultiFieldClass {
  public intVal: int = 0;
  public strVal: string = "";
  public boolVal: boolean = false;
  public doubleVal: number = 0.0;
  public constructor(i: int, s: string, b: boolean, d: number) {
    this.intVal = i;
    this.strVal = s;
    this.boolVal = b;
    this.doubleVal = d;
  }
}

export class ComputedClass {
  public sum: int = 0;
  public concat: string = "";
  public constructor(a: int, b: int, prefix: string) {
    this.sum = a + b;
    this.concat = prefix + "suffix";
  }
}

export class CtorOverload3 {
  public value: string;
  public count: int;
  public constructor() {
    this.value = "default";
    this.count = 0;
  }
  public constructor(v: string) {
    this.value = v;
    this.count = 0;
  }
  public constructor(v: string, c: int) {
    this.value = v;
    this.count = c;
  }
}

export class Ctor2DblDbl {
  public a: double;
  public b: double;
  public constructor(a: double, b: double) {
    this.a = a;
    this.b = b;
  }
}

export class CI_ThisChain1 {
  public a: string;
  public b: int;
  public constructor() {
    this.a = "auto";
    this.b = 1;
  }
  public constructor(a: string, b: int) {
    this.a = a;
    this.b = b;
  }
}

export class EqOverloadCls {
  public constructor() {}
  public constructor(x: int) {}
}

export class CI_DefaultMix {
  public a: string;
  public b: int;
  public constructor(a: string) {
    this.a = a;
    this.b = 42;
  }
  public constructor(a: string, b: int) {
    this.a = a;
    this.b = b;
  }
}

export class CI_DefaultFlag {
  public flag: boolean;
  public constructor() {
    this.flag = true;
  }
  public constructor(flag: boolean) {
    this.flag = flag;
  }
}

export class Ext2_TwentyIntCtor {
  a0: int = 0; a1: int = 0; a2: int = 0; a3: int = 0; a4: int = 0;
  a5: int = 0; a6: int = 0; a7: int = 0; a8: int = 0; a9: int = 0;
  b0: int = 0; b1: int = 0; b2: int = 0; b3: int = 0; b4: int = 0;
  b5: int = 0; b6: int = 0; b7: int = 0; b8: int = 0; b9: int = 0;
  public constructor(a0: int, a1: int, a2: int, a3: int, a4: int,
    a5: int, a6: int, a7: int, a8: int, a9: int,
    b0: int, b1: int, b2: int, b3: int, b4: int,
    b5: int, b6: int, b7: int, b8: int, b9: int) {
    this.a0 = a0; this.a1 = a1; this.a2 = a2; this.a3 = a3; this.a4 = a4;
    this.a5 = a5; this.a6 = a6; this.a7 = a7; this.a8 = a8; this.a9 = a9;
    this.b0 = b0; this.b1 = b1; this.b2 = b2; this.b3 = b3; this.b4 = b4;
    this.b5 = b5; this.b6 = b6; this.b7 = b7; this.b8 = b8; this.b9 = b9;
  }
}

export class GetParamTypeBC { public constructor(s: string, b: boolean) {} }

export class OverloadMiddleCtor {
  public a: int;
  public b: string;
  public constructor() {
    this.a = 0;
    this.b = '';
  }
  public constructor(v: int) {
    this.a = v;
    this.b = '';
  }
  public constructor(v: int, s: string) {
    this.a = v;
    this.b = s;
  }
}

export class CI02_Container {
  public inner: CI02_Inner;
  public constructor(i: CI02_Inner) {
    this.inner = i;
  }
}

export abstract class GO2_Ext_AbstractGeneric<T> {
  public abstract process(val: T): T;
  public constructor() {}
}

export class SixMixed_Ext {
  public a: int;
  public b: string;
  public c: boolean;
  public d: number;
  public e: int;
  public f: string;
  public constructor(a: int, b: string, c: boolean, d: number, e: int, f: string) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.e = e;
    this.f = f;
  }
}

export class EightMixed_Ext {
  public p1: int;
  public p2: string;
  public p3: boolean;
  public p4: number;
  public p5: int;
  public p6: string;
  public p7: boolean;
  public p8: number;
  public constructor(p1: int, p2: string, p3: boolean, p4: number, p5: int, p6: string, p7: boolean, p8: number) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = p4;
    this.p5 = p5;
    this.p6 = p6;
    this.p7 = p7;
    this.p8 = p8;
  }
}

export class GN_P5 {
  public constructor(a: int, b: int, c: int, d: int, e: int) {}
}

export class IsPrivateWithFactory {
  private constructor() {}
  public static newInstance(): IsPrivateWithFactory { return new IsPrivateWithFactory(); }
}

export class IsProtectedWithStatic {
  protected constructor() {}
  public static VERSION: int = 1;
}

export class OT_Outer_OT_InnerGeneric<T> {
  public constructor(val: T) {}
}

export class Eq02_D {
  public constructor(x: number, y: number, z: number) {}
}

export class PubByteParam { public constructor(b: byte) {} }
export class PubDouble {
  public constructor(d: double) {}
}

export class PubShortParam { public constructor(s: short) {} }

export class IP3_193_PubFloat { public constructor(f: float) {} }

export class Ext4_FixedArrOptParam {
  val: FixedArray<int>;
  public constructor(v?: FixedArray<int>) {
    this.val = v ?? [];
  }
}

export class CtorMixedA {
  public constructor(a: double, b: boolean) {}
}

export class Eq04_TripleOL {
  public constructor() {}
  public constructor(x: int) {}
  public constructor(s: string) {}
}

export class Ext4_CharOptParam {
  val: char = c'a';
  public constructor(v?: char) {
    this.val = v ?? c'a';
  }
}

export class CtorFixedArrStrParam {
  public data: FixedArray<string>;
  public constructor(a: FixedArray<string>) {
    this.data = a;
  }
}

export class ObjectParamCtor_Ext {
  public constructor(obj: Object) {
  }
}

export class Eq03_ByteDblCls {
  public constructor(a: byte, b: double) {}
}

export class Eq03_StrCharCls {
  public constructor(a: string, b: char) {}
}

export class Eq03_FixedBoolCls {
  public constructor(a: FixedArray<boolean>) {}
}

export class Eq03_SigShortFloatA {
  public constructor(a: short, b: float) {}
}

export class Eq03_FourOverload {
  public constructor() {}
  public constructor(x: int) {}
  public constructor(s: string) {}
  public constructor(a: int, b: string) {}
}

export class TwoCtorsSameArity {
  public constructor(a: string) {
  }

  public constructor(a: int) {
  }
}

export class Ctor_int_String_double {
  a: int = 0; b: string = ""; c: double = 0.0;
  public constructor(a: int, b: string, c: double) { this.a = a; this.b = b; this.c = c; }
}

export class EqExt_CustomParamCtor {
  public constructor(d: EmptyCls) {}
}

export class EqExt_CustomAndInt {
  public constructor(d: EmptyCls, x: int) {}
}

export class EqExt_CustomAndStr {
  public constructor(d: EmptyCls, s: string) {}
}
export class GenericsMultiResolved_Ext<T, U> {
  public constructor(a: T, b: U) {
  }
}

export abstract class AbstractGeneric<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}
export class IP3_201_PubBoolArr { public constructor(arr: boolean[]) {} }

export class CtorDoubleArrParam {
  public data: double[];
  public constructor(a: double[]) {
    this.data = a;
  }
}

export class GN_ByteArr {
  public constructor(a: byte[]) {}
}

export class GN_ShortArr {
  public constructor(a: short[]) {}
}
export class GN_FloatArr {
  public constructor(a: float[]) {}
}

export class GN_CharArr {
  public constructor(a: char[]) {}
}

export class CtorMultiDimArrParam {
  public data: int[][];
  public constructor(a: int[][]) {
    this.data = a;
  }
}

export class TcStr2D {
  public constructor(a: string[][]) {}
}

export class TcBool2D {
  public constructor(a: boolean[][]) {}
}

export class GN_Long2D {
  public constructor(a: long[][]) {}
}

export class Ctor_MapStrInt {
  public constructor(p: Map<string, int>) {}
}

export class Ext3_HasSetParam {
  public constructor(v: Set<int>) {}
}

export class GN_MapIntSet {
  public constructor(a: Map<int, Set<string>>) {}
}

export class GN_SetStr {
  public constructor(a: Set<string>) {}
}

export class Ext2_MapStrBoolParam {
  data: Map<string, boolean> = new Map<string, boolean>();
  public constructor(data: Map<string, boolean>) {
    this.data = data;
  }
}

export class GN_MapIntDbl {
  public constructor(a: Map<int, double>) {}
}

export class GN_SetDbl {
  public constructor(a: Set<double>) {}
}

export class GN_MapStrDblArr {
  public constructor(a: Map<string, double[]>) {}
}

export class FiveParamCls {
  public constructor(a: int, b: string, c: boolean, d: double, e: byte) {}
}

export class GN3_Mix4ISBD {
  public constructor(p1: int, p2: string, p3: boolean, p4: double) {}
}
export class PGN_FifteenParam {
  public constructor(a0: int, a1: int, a2: int, a3: int, a4: int, a5: int, a6: int, a7: int, a8: int, a9: int, a10: int, a11: int, a12: int, a13: int, a14: int) {}
}

export class GN_P30 {
  public constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int, p10: int,
    p11: int, p12: int, p13: int, p14: int, p15: int, p16: int, p17: int, p18: int, p19: int, p20: int,
    p21: int, p22: int, p23: int, p24: int, p25: int, p26: int, p27: int, p28: int, p29: int, p30: int) {}
}

export class GN_P50 {
  public constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int, p10: int,
    p11: int, p12: int, p13: int, p14: int, p15: int, p16: int, p17: int, p18: int, p19: int, p20: int,
    p21: int, p22: int, p23: int, p24: int, p25: int, p26: int, p27: int, p28: int, p29: int, p30: int,
    p31: int, p32: int, p33: int, p34: int, p35: int, p36: int, p37: int, p38: int, p39: int, p40: int,
    p41: int, p42: int, p43: int, p44: int, p45: int, p46: int, p47: int, p48: int, p49: int, p50: int) {}
}

export class GN_ExtOv5 {
  public constructor() {}
  public constructor(a: int) {}
  public constructor(a: string) {}
  public constructor(a: int, b: string) {}
  public constructor(a: int, b: string, c: boolean) {}
}

export class GN_ExtCombIF {
  public constructor(a: int, b: float) {}
}

export class GN_ExtCombBI {
  public constructor(a: byte, b: int) {}
}

export class GN_ExtCombStrArr {
  public constructor(a: string[], b: int, c: boolean) {}
}

export class PGN_GenericThree<T, U, V> {
  public constructor(a: T, b: U, c: V) {}
}

export class OT_Overload6 {
  public constructor() {}
  public constructor(a: int) {}
  public constructor(a: int, b: string) {}
  public constructor(a: int, b: string, c: boolean) {}
  public constructor(a: int, b: string, c: boolean, d: double) {}
  public constructor(a: int, b: string, c: boolean, d: double, e: int[]) {}
}

export class OT_Overload8 {
  public constructor() {}
  public constructor(a: int) {}
  public constructor(a: int, b: string) {}
  public constructor(a: int, b: string, c: boolean) {}
  public constructor(a: int, b: string, c: boolean, d: double) {}
  public constructor(a: int, b: string, c: boolean, d: double, e: int[]) {}
  public constructor(a: int, b: string, c: boolean, d: double, e: int[], f: string) {}
  public constructor(a: int, b: string, c: boolean, d: double, e: int[], f: string, g: boolean) {}
}

export class OT_OverloadSameParamCount {
  public constructor(a: int) {}
  public constructor(a: string) {}
  public constructor(a: boolean) {}
}

export class OT_OverloadDefaultValue {
  public constructor(a: int = 0) {}
  public constructor(a: int, b: string = 'hello') {}
}

export class G01_AllTypes {
  public constructor(a: int, b: string, c: boolean, d: double, e: int[]) {}
}

export class G01_TenCtors {
  public constructor() {}
  public constructor(a: int) {}
  public constructor(a: int, b: int) {}
  public constructor(a: int, b: int, c: int) {}
  public constructor(a: int, b: int, c: int, d: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int) {}
}

export class PGN_FourParam {
  public constructor(a: int, b: string, c: boolean, d: float) {}
}

export class PGN_FiveParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double) {}
}

export class PGN_SixParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double, f: byte) {}
}

export class PGN_SevenParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double, f: byte, g: short) {}
}

export class PGN_EightParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double, f: byte, g: short, h: long) {}
}

export class PGN_NineParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double, f: byte, g: short, h: long, i: char) {}
}

export class PGN_TenParam {
  public constructor(a: int, b: string, c: boolean, d: float, e: double, f: byte, g: short, h: long, i: char, j: int) {}
}

export class PGN_AllPrimitives {
  public constructor(a: byte, b: short, c: int, d: long, e: float, f: double, g: boolean, h: char) {}
}

export class PGN_ObjectParam {
  public constructor(value: object) {}
}

export class PGN_ArrayIntParam {
  public constructor(value: Array<int>) {}
}

export class PGN_TupleParam {
  public constructor(value: [int, string]) {}
}

export class PGN_UnionParam {
  public constructor(value: int | string) {}
}

export class PGN_EnumParam {
  public constructor(value: PGN_TestColor) {}
}

export class PGN_InterfaceParam {
  public constructor(value: IF_Single) {}
}

export class PGN_CustomClassParam {
  public constructor(value: EmptyCls) {}
}

export class PGN_VoidParam {
  public constructor(value: undefined) {}
}

export class PGN_RestWithMand {
  public constructor(a: int, ...values: int[]) {}
}

export class PGN_AllSpecialMix {
  public constructor(a?: int, b: string = "hello", ...values: int[]) {}
}
export class TwoSameInt {
  public constructor(a: int, b: int) {}
}

export class PGN_GenericArray<T> {
  public constructor(values: Array<T>) {}
}

export class PrivateCtorWithDefault {
  val: int = 0;
  private constructor(v: int = 99) {
    this.val = v;
  }
  static create(): PrivateCtorWithDefault {
    return new PrivateCtorWithDefault();
  }
}

export class PGN_UnionType {
  public constructor(value: string | int) {}
}

export class PGN_FifteenMixed {
  public constructor(a0: int, a1: string, a2: boolean, a3: double, a4: long, a5: short, a6: byte, a7: float, a8: char, a9: int, a10: string, a11: boolean, a12: double, a13: long, a14: short) {}
}

export class PGN_OverloadMinMax {
  public constructor() {}
  public constructor(a: int) {}
  public constructor(a: int, b: int) {}
  public constructor(a: int, b: int, c: int) {}
  public constructor(a: int, b: int, c: int, d: int) {}
  public constructor(a: int, b: int, c: int, d: int, e: int) {}
}

export class PGN_OverloadMixed {
  public constructor(a: string) {}
  public constructor(a: string, b: int) {}
  public constructor(a: string, b: int, c: boolean) {}
}

export class GN_CrossComplex {
  public constructor(a: Map<string, Set<int>>, b: boolean, c: int) {}
}

export class GN_JointName {
  public constructor(a: int, b: string, c: boolean, d: double, e: int) {}
}

export class Pub11IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int, k: int) {}
}
export class TwoSameString {
  public constructor(a: string, b: string) {
  }
}

export class GN_3String {
  public constructor(p1: string, p2: string, p3: string) {}
}

export class GN_4String {
  public constructor(p1: string, p2: string, p3: string, p4: string) {}
}

export class GN_2Bool {
  public constructor(p1: boolean, p2: boolean) {}
}

export class Ctor3BoolParam {
  public a: boolean;
  public b: boolean;
  public c: boolean;
  public constructor(v1: boolean, v2: boolean, v3: boolean) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class NestedTypeParam_Ext<T> {
  public constructor(data: T, count: int) {
  }
}

export class GN2_Gen3Mix<T, U> {
  public constructor(p1: T, p2: U, p3: int) {}
}

export class GN2_GenMixOrder<T> {
  public constructor(p1: int, p2: T, p3: string) {}
}

export class GN3_12Str {
  public constructor(p0: string, p1: string, p2: string, p3: string, p4: string, p5: string, p6: string, p7: string, p8: string, p9: string, p10: string, p11: string) {}
}

export class GN3_Mix3IBF {
  public constructor(p1: int, p2: boolean, p3: float) {}
}

export class GN3_Mix6ISBDLS {
  public constructor(p1: int, p2: string, p3: boolean, p4: double, p5: long, p6: short) {}
}

export class GN3_Mix7ISBDLSB {
  public constructor(p1: int, p2: string, p3: boolean, p4: double, p5: long, p6: short, p7: byte) {}
}

export class GN3_Gen3StrBool<T> {
  public constructor(p1: T, p2: string, p3: boolean) {}
}

export class TcPub12 {
  public constructor(a: int, b: int, c: int, d: int) {}
}

export class Ext_FixedArrObj {
  public constructor(value: FixedArray<Object>) {}
}

export class Ctor_FixedArray_Int {
  public constructor(p1: FixedArray<int>, p2: int) {}
}

export abstract class Ext_FixedArrStr {
  public constructor(value: FixedArray<string>) {}
}
export class C4 {
  public constructor(a: string, b: int, c: boolean, d: byte) {}
}

export class C5 {
  public constructor(a: string, b: int, c: boolean, d: byte, e: short) {}
}

export class C6Last {
  public constructor(a: string, b: int, c: boolean, d: byte, e: short, f: long) {}
}

export class C1Object {
  public constructor(a: MyData) {}
}

export class FiftyParam {
  public constructor(a0: string, a1: string, a2: string, a3: string, a4: string, a5: string, a6: string, a7: string, a8: string, a9: string, a10: string, a11: string, a12: string, a13: string, a14: string, a15: string, a16: string, a17: string, a18: string, a19: string, a20: string, a21: string, a22: string, a23: string, a24: string, a25: string, a26: string, a27: string, a28: string, a29: string, a30: string, a31: string, a32: string, a33: string, a34: string, a35: string, a36: string, a37: string, a38: string, a39: string, a40: string, a41: string, a42: string, a43: string, a44: string, a45: string, a46: string, a47: string, a48: string, a49: string) {}
}

export class C2Byte {
  public constructor(a: byte, b: byte) {}
}
export class CtorMultiI {
  public constructor(a: string, b: int, c: boolean, d: double, e: long) {}
}

export class PrivSpecialStrDefault {
  private constructor(a: string = '!@#$%') {}
  static create(): PrivSpecialStrDefault {
    return new PrivSpecialStrDefault();
  }
}

export class CtorInterface {
  public constructor(a: ITestable) {}
}
export class FourParams {
  public constructor(a: string, b: int, c: boolean, d: double) {}
}

export class Ctor6MixedParam {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public constructor(v1: string, v2: int, v3: boolean, v4: double, v5: long, v6: short) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
    this.e = v5;
    this.f = v6;
  }
}
export class TcGapByte2D {
  public constructor(a: byte[][]) {}
}

export class CtorArr3D {
  public constructor(a: int[][][]) {}
}

export class CtorStrArr3D {
  public constructor(a: string[][][]) {}
}

export class CtorBoolArr3D {
  public constructor(a: boolean[][][]) {}
}

export class TcPub10 {
  public constructor(a: string, b: double) {}
}

export class CtorMixedC {
  public constructor(a: int, b: long, c: short, d: byte) {}
}
export class CtorMixedE {
  public constructor(a: char, b: byte, c: boolean) {}
}

export class CtorMixedF {
  public constructor(a: int[], b: string, c: boolean) {}
}
export class CtorMixedH {
  public constructor(a: short, b: long, c: double) {}
}

export class CtorArrPrim {
  public constructor(a: int[], b: long[], c: short[]) {}
}

export class FiveCtor {
  public constructor(a: string, b: int, c: boolean, d: double, e: byte) {}
}

export class TenCtor {
  public constructor(a: string, b: int, c: boolean, d: double, e: byte, f: long, g: short, h: float, i: char, j: byte) {}
}

export class GetParamTypeAC {
  public constructor(x: int, b: boolean) {}
}

export class BoolDoubleString {
  public constructor(a: boolean, b: double, c: string) {
  }
}

export class CtorDoubleExtremesParam {
  public a: double;
  public b: double;
  public c: double;
  public constructor(v1: double, v2: double, v3: double) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class CtorTestColor {
  public constructor(c: TestColor) {}
}

export class CtorTestFlag {
  public constructor(f: TestFlag) {}
}

export class CtorDataWrap {
  public constructor(w: DataWrap) {}
}

export class CtorFixArrLong {
  public constructor(arr: FixedArray<long>) {}
}

export class CtorBox {
  public constructor(b: GenBox<int>) {}
}

export class CtorAllPrim {
  public constructor(b: boolean, c: char, y: byte, s: short, i: int, l: long, f: float, d: double) {}
}

export class SevenParams {
  public constructor(a: string, b: int, c: boolean, d: double, e: long, f: short, g: byte) {
  }
}

export class EightParams {
  public constructor(a: string, b: int, c: boolean, d: double, e: long, f: short, g: byte, h: float) {
  }
}

export class CtorAllPrimitivesParam {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;
  public i: char;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float, chrVal: char) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
    this.i = chrVal;
  }
}

export class TenParams {
  public constructor(a: string, b: int, c: boolean, d: double, e: long, f: short, g: byte, h: float, i: char, j: string) {
  }
}

export class CustomParamCtor {
  public constructor(a: CustomType) {
  }
}

export class EnumParamCtor {
  public constructor(a: TestEnum) {
  }
}

export class FivePrimitiveTypes {
  public constructor(a: long, b: short, c: byte, d: float, e: char) {
  }
}

export class RefAndInt {
  public constructor(a: OrdRef, b: int) {
  }
}

export class TwoCustomTypes {
  public constructor(a: TypeA, b: TypeB) {
  }
}

export class ArrayAndPrimitive {
  public constructor(a: int[], b: string) {
  }
}

export class EnumAndInt {
  public constructor(a: MixEnum, b: int) {
  }
}

export class StrIntStr {
  public constructor(a: string, b: int, c: string) {
  }
}

export class TcMixArr {
  public constructor(a: int[][], b: string[]) {
  }
}

export class Pub2BoolIntExt {
  public constructor(a: boolean, b: int) {}
}

export class Ctor_double_String_boolean {
  a: double = 0.0; b: string = ""; c: boolean = false;
  public constructor(a: double, b: string, c: boolean) { this.a = a; this.b = b; this.c = c; }
}
export class OrdPrimitiveThenRef {
  public constructor(a: int, b: OrdRef) {
  }
}

export class FourTypesOrder {
  public constructor(a: long, b: int, c: short, d: byte) {
  }
}

export class FourTypesReverse {
  public constructor(a: byte, b: short, c: int, d: long) {
  }
}

export class IntBoolFloatStr {
  public constructor(a: int, b: boolean, c: float, d: string) {
  }
}

export class AllIndexesAccessible {
  public constructor(a: string, b: int, c: double, d: boolean) {
  }
}

export class ConsistencyWithNum {
  public constructor(a: string, b: int, c: double) {
  }
}

export class TwoCtorsNoArg {
  public constructor() {
  }

  public constructor(a: string) {
  }
}

export class IndepCtorTypes {
  public constructor(a: string) {
  }

  public constructor(a: int, b: boolean) {
  }
}

export class FourOverloads {
  public constructor() {
  }

  public constructor(a: string) {
  }

  public constructor(a: string, b: int) {
  }

  public constructor(a: int, b: boolean, c: double) {
  }
}

export class GenericMixed_Ext<T> {
  public constructor(a: T, b: string) {
  }
}

export class SelfRefType_Ext {
  public constructor(other: SelfRefType_Ext) {
  }
}

export class CtorSigIndependence_Ext {
  public constructor(a: int) {
  }

  public constructor(a: int, b: boolean) {
  }

  public constructor(a: string, b: double, c: long) {
  }
}

export class DoubleArrayAndString_Ext {
  public constructor(values: double[], label: string) {
  }
}

export class TwoArrayTypes_Ext {
  public constructor(ids: int[], names: string[]) {
  }
}

export class Ctor_int_String_int_String_int {
  a: int = 0; b: string = ""; c: int = 0; d: string = ""; e: int = 0;
  public constructor(a: int, b: string, c: int, d: string, e: int) { this.a = a; this.b = b; this.c = c; this.d = d; this.e = e; }
}

export class Ctor_mixed_eight {
  p1: int = 0; p2: boolean = false; p3: string = ""; p4: double = 0.0;
  p5: short = 0; p6: long = 0; p7: byte = 0; p8: float = 0;
  public constructor(p1: int, p2: boolean, p3: string, p4: double, p5: short, p6: long, p7: byte, p8: float) {
    this.p1 = p1; this.p2 = p2; this.p3 = p3; this.p4 = p4;
    this.p5 = p5; this.p6 = p6; this.p7 = p7; this.p8 = p8;
  }
}

export class Ctor_Custom_long_Custom_float {
  a: MyCustomClass2 = new MyCustomClass2(0);
  b: long = 0;
  c: MyCustomClass2 = new MyCustomClass2(0);
  d: float = 0;
  public constructor(a: MyCustomClass2, b: long, c: MyCustomClass2, d: float) { this.a = a; this.b = b; this.c = c; this.d = d; }
}

export class Ctor_intArr_double_boolArr_String {
  a: int[] = [];
  b: double = 0.0;
  c: boolean[] = [];
  d: string = "";
  public constructor(a: int[], b: double, c: boolean[], d: string) { this.a = a; this.b = b; this.c = c; this.d = d; }
}

export class Ctor_short_byte_boolean_float {
  a: short = 0; b: byte = 0; c: boolean = false; d: float = 0;
  public constructor(a: short, b: byte, c: boolean, d: float) { this.a = a; this.b = b; this.c = c; this.d = d; }
}

export class Ctor_long_String_double {
  a: long = 0; b: string = ""; c: double = 0.0;
  public constructor(a: long, b: string, c: double) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor_boolean_short_int_float_byte {
  a: boolean = false; b: short = 0; c: int = 0; d: float = 0; e: byte = 0;
  public constructor(a: boolean, b: short, c: int, d: float, e: byte) { this.a = a; this.b = b; this.c = c; this.d = d; this.e = e; }
}

export class Ctor_int_bool_String {
  a: int = 0; b: boolean = false; c: string = "";
  public constructor(a: int, b: boolean, c: string) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor_String_int_double_boolean_long {
  a: string = ""; b: int = 0; c: double = 0.0; d: boolean = false; e: long = 0;
  public constructor(a: string, b: int, c: double, d: boolean, e: long) { this.a = a; this.b = b; this.c = c; this.d = d; this.e = e; }
}

export class Ctor_byte_int_long {
  a: byte = 0; b: int = 0; c: long = 0;
  public constructor(a: byte, b: int, c: long) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor_float_short_double_byte {
  a: float = 0; b: short = 0; c: double = 0.0; d: byte = 0;
  public constructor(a: float, b: short, c: double, d: byte) { this.a = a; this.b = b; this.c = c; this.d = d; }
}

export class Ctor_boolArr_intArr_StringArr {
  a: boolean[] = []; b: int[] = []; c: string[] = [];
  public constructor(a: boolean[], b: int[], c: string[]) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor_StringArr_int_floatArr {
  a: string[] = []; b: int = 0; c: float[] = [];
  public constructor(a: string[], b: int, c: float[]) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor_long_short_byte {
  a: long = 0; b: short = 0; c: byte = 0;
  public constructor(a: long, b: short, c: byte) { this.a = a; this.b = b; this.c = c; }
}

export class PublicCtorThreeParams {
  a: int = 0;
  b: int = 0;
  c: int = 0;
  public constructor(x: int, y: int, z: int) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
}

export class Ctor_NestedFixedArr {
  public constructor(p: FixedArray<FixedArray<int>>) {}
}

export class Ctor_MapIntStr {
  public constructor(p: Map<int, string>) {}
}

export class Ctor_ArrayListInt {
  public constructor(p: ArrayList<int>) {}
}

export class IP3_183_PubClsParam { public constructor(c: Class) {} }

export class Ctor_ConstructorParam {
  public constructor(p: reflect.Constructor) {}
}

export class Ctor_HD_Param {
  public constructor(p: EmptyCls) {}
}

export class Ctor5StrParam {
  public a: string;
  public b: string;
  public c: string;
  public d: string;
  public e: string;
  public constructor(v1: string, v2: string, v3: string, v4: string, v5: string) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
    this.e = v5;
  }
}

export class Ctor_5Objs {
  public constructor(p1: Object, p2: Object, p3: Object, p4: Object, p5: Object) {}
}

export class Ctor_4Customs {
  public constructor(p1: EmptyCls, p2: EmptyCls, p3: EmptyCls, p4: EmptyCls) {}
}

export class Ctor_MixedContainers {
  public constructor(p1: FixedArray<int>, p2: Map<string, int>, p3: Array<int>) {}
}

export class Ctor_AllCategories {
  public constructor(p1: int, p2: EmptyCls, p3: FixedArray<string>, p4: Class, p5: reflect.Constructor) {}
}

export class Ctor_DoubleBoolOnly {
  public constructor(p1: double, p2: boolean, p3: double, p4: boolean) {}
}

export class Ctor_MapVariants {
  public constructor(p1: Map<string, int>, p2: Map<int, string>, p3: Map<boolean, double>) {}
}

export class Ctor_15MixedParams {
  public constructor(p1: int, p2: string, p3: boolean, p4: double, p5: Object,
    p6: int, p7: string, p8: boolean, p9: double, p10: Object,
    p11: int, p12: string, p13: boolean, p14: double, p15: Object) {}
}

export class Ctor_Bool_Int_String {
  public constructor(p1: boolean, p2: int, p3: string) {}
}

export class Ctor4DoubleParam {
  public a: double;
  public b: double;
  public c: double;
  public d: double;
  public constructor(v1: double, v2: double, v3: double, v4: double) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
  }
}

export class Ctor_Object_String_Int {
  public constructor(p1: Object, p2: string, p3: int) {}
}

export class Ctor_Bool_Object_Int {
  public constructor(p1: boolean, p2: Object, p3: int) {}
}

export class Ctor_String_Map_Int {
  public constructor(p1: string, p2: Map<string, int>, p3: int) {}
}

export class Ctor_Object_Object_Int {
  public constructor(p1: Object, p2: Object, p3: int) {}
}

export class Ctor_Class_Constructor_Int {
  public constructor(p1: Class, p2: reflect.Constructor, p3: int) {}
}

export class Ctor_Int_FixedArray_Map_Ref {
  public constructor(p1: int, p2: FixedArray<int>, p3: Map<string, int>, p4: EmptyCls) {}
}

export class SevenTypesOrder {
  public constructor(p1: int, p2: double, p3: boolean, p4: string, p5: EmptyCls, p6: EmptyCls, p7: Object) {}
}

export class Int_FAStr_MIntBool_Str_Double {
  public constructor(p1: int, p2: FixedArray<string>, p3: Map<int, boolean>, p4: string, p5: double) {}
}

export class NestedMapParam {
  public constructor(p1: Map<int, FixedArray<string>>, p2: int, p3: string) {}
}

export class Bool_Bool_Int_String {
  public constructor(p1: boolean, p2: boolean, p3: int, p4: string) {}
}

export class SameCustomTwice_Int {
  public constructor(p1: EmptyCls, p2: EmptyCls, p3: int) {}
}

export class String_Int_Int_Order {
  public constructor(p1: string, p2: int, p3: int) {}
}

export class ExtCmpE {
  public a: double;
  public b: float;
  public constructor(d: double, f: float) {
    this.a = d;
    this.b = f;
  }
}

export class FourMixCls {
  public name: string;
  public flag: boolean;
  public count: int;
  public rate: double;
  public constructor(s: string, b: boolean, i: int, d: double) {
    this.name = s;
    this.flag = b;
    this.count = i;
    this.rate = d;
  }
}

export class ByteShortLongCls {
  public a: byte;
  public b: short;
  public c: long;
  public constructor(x: byte, y: short, z: long) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
}

export class FltDblIntStrCls {
  public a: float;
  public b: double;
  public c: int;
  public d: string;
  public constructor(f: float, d: double, i: int, s: string) {
    this.a = f;
    this.b = d;
    this.c = i;
    this.d = s;
  }
}

export class ThreeCtorCls2 {
  public flag: boolean;
  public rate: double;
  public id: int;
  public constructor(b: boolean) {
    this.flag = b;
    this.rate = 0.0;
    this.id = 0;
  }
  public constructor(d: double) {
    this.flag = false;
    this.rate = d;
    this.id = 0;
  }
  public constructor(i: int, c: int) {
    this.flag = false;
    this.rate = 0.0;
    this.id = i;
  }
}

export class TwoCtorCls3 {
  public label: string;
  public level: byte;
  public constructor(s: string) {
    this.label = s;
    this.level = 0;
  }
  public constructor(b: byte) {
    this.label = '';
    this.level = b;
  }
}

export class TwoCtorCls4 {
  public code: long;
  public key: short;
  public constructor(l: long) {
    this.code = l;
    this.key = 0;
  }
  public constructor(s: short, b: boolean) {
    this.code = 0;
    this.key = s;
  }
}

export class Ext4_TwoGenCharFixed<A, B> {
  a: A;
  b: B;
  public constructor(a: A, b: B) {
    this.a = a;
    this.b = b;
  }
}

export class LoopCtorCls {
  public constructor() {}
  public constructor(x: int) {}
  public constructor(s: string, b: boolean) {}
}

export class EnumUserCls {
  public color: ColorShade;
  public constructor(c: ColorShade) {
    this.color = c;
  }
}

export class IsPublicGenericTwo<K, V> {
  public constructor(k: K, v: V) {}
}

export class FourCtorCls {
  public value: int;
  public name: string;
  public flag: boolean;
  public constructor() {
    this.value = 0;
    this.name = '';
    this.flag = false;
  }
  public constructor(v: int) {
    this.value = v;
    this.name = '';
    this.flag = false;
  }
  public constructor(v: int, s: string) {
    this.value = v;
    this.name = s;
    this.flag = false;
  }
  public constructor(v: int, s: string, b: boolean) {
    this.value = v;
    this.name = s;
    this.flag = b;
  }
}

export class FiveCtorCls {
  public a: int;
  public b: string;
  public c: boolean;
  public d: double;
  public e: byte;
  public constructor() {
    this.a = 0;
    this.b = '';
    this.c = false;
    this.d = 0.0;
    this.e = 0;
  }
  public constructor(v: int) {
    this.a = v;
    this.b = '';
    this.c = false;
    this.d = 0.0;
    this.e = 0;
  }
  public constructor(v: int, s: string) {
    this.a = v;
    this.b = s;
    this.c = false;
    this.d = 0.0;
    this.e = 0;
  }
  public constructor(v: int, s: string, b: boolean) {
    this.a = v;
    this.b = s;
    this.c = b;
    this.d = 0.0;
    this.e = 0;
  }
  public constructor(v: int, s: string, b: boolean, d: double) {
    this.a = v;
    this.b = s;
    this.c = b;
    this.d = d;
    this.e = 0;
  }
}

export class Ext2_ArrayStrParam {
  items: Array<string> = [];
  public constructor(items: Array<string>) {
    this.items = items;
  }
}

export class CtorCustomParam {
  public data: MyData;
  public constructor(a: MyData) {
    this.data = a;
  }
}

export class CtorFloatCharParam {
  public a: float;
  public b: char;
  public constructor(v: float, c: char) {
    this.a = v;
    this.b = c;
  }
}

export class CtorCombineArraysParam {
  public a: string[];
  public b: int[];
  public c: boolean[];
  public constructor(v1: string[], v2: int[], v3: boolean[]) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class CtorCombineCollectionsParam {
  public a: FixedArray<int>;
  public b: Array<string>;
  public c: Map<string, int>;
  public constructor(v1: FixedArray<int>, v2: Array<string>, v3: Map<string, int>) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class CtorCombineComplexParam {
  public a: Set<int>;
  public b: Map<string, InnerComboType>;
  public constructor(v1: Set<int>, v2: Map<string, InnerComboType>) {
    this.a = v1;
    this.b = v2;
  }
}

export class CtorNestedGenericParam {
  public data: Array<Array<int>>;
  public constructor(a: Array<Array<int>>) {
    this.data = a;
  }
}

export class CtorComplexGenericParam {
  public data: Map<string, Array<int>>;
  public constructor(a: Map<string, Array<int>>) {
    this.data = a;
  }
}

export class Pub2ShortByteExt {
  public constructor(a: short, b: byte) {}
}

export class ExtSimpleF {
  public a: float;
  public b: long;
  public c: short;
  public constructor(v1: float, v2: long, v3: short) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class ExtParamH {
  public a: string;
  public b: long;
  public constructor(s: string, v: long) {
    this.a = s;
    this.b = v;
  }
}

export class ExtParamI {
  public a: float;
  public b: double;
  public c: int;
  public constructor(f: float, d: double, i: int) {
    this.a = f;
    this.b = d;
    this.c = i;
  }
}

export class ExtNameG {
  public a: long;
  public b: short;
  public constructor(v1: long, v2: short) {
    this.a = v1;
    this.b = v2;
  }
}

export class ExtCmpI {
  public a: float;
  public b: int;
  public constructor(f: float, i: int) {
    this.a = f;
    this.b = i;
  }
}

export class Ext4_CharStringMix {
  a: char = c'x';
  b: string = "";
  public constructor(a: char, b: string) {
    this.a = a;
    this.b = b;
  }
}

export class ExtChainD {
  public a: int;
  public b: string;
  public c: double;
  public d: boolean;
  public constructor(i: int, s: string, d: double, f: boolean) {
    this.a = i;
    this.b = s;
    this.c = d;
    this.d = f;
  }
}

export class ExtChainE {
  public a: float;
  public b: long;
  public constructor(f: float, l: long) {
    this.a = f;
    this.b = l;
  }
}

export class ExtPcD {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;
  public i: char;
  public j: string;
  public k: int;
  public l: boolean;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float, chrVal: char, strVal2: string, intVal2: int, boolVal2: boolean) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
    this.i = chrVal;
    this.j = strVal2;
    this.k = intVal2;
    this.l = boolVal2;
  }
}

export class ExtPcE {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;
  public i: char;
  public j: string;
  public k: int;
  public l: boolean;
  public m: double;
  public n: long;
  public o: short;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float, chrVal: char, strVal2: string, intVal2: int, boolVal2: boolean, dblVal2: double, lngVal2: long, shtVal2: short) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
    this.i = chrVal;
    this.j = strVal2;
    this.k = intVal2;
    this.l = boolVal2;
    this.m = dblVal2;
    this.n = lngVal2;
    this.o = shtVal2;
  }
}

export class ExtPcF {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;
  public i: char;
  public j: string;
  public k: int;
  public l: boolean;
  public m: double;
  public n: long;
  public o: short;
  public p: byte;
  public q: float;
  public r: char;
  public s: string;
  public t: int;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float, chrVal: char, strVal2: string, intVal2: int, boolVal2: boolean, dblVal2: double, lngVal2: long, shtVal2: short, bytVal2: byte, fltVal2: float, chrVal2: char, strVal3: string, intVal3: int) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
    this.i = chrVal;
    this.j = strVal2;
    this.k = intVal2;
    this.l = boolVal2;
    this.m = dblVal2;
    this.n = lngVal2;
    this.o = shtVal2;
    this.p = bytVal2;
    this.q = fltVal2;
    this.r = chrVal2;
    this.s = strVal3;
    this.t = intVal3;
  }
}

export class FuncParamCtorCls {
  public cb: Function;
  public constructor(f: Function) {
    this.cb = f;
  }
}

export class Ext2_ThreeGeneric<A, B, C> {
  a: A;
  b: B;
  c: C;
  public constructor(a: A, b: B, c: C) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

export class MultiArrCtorCls {
  public a: string[];
  public b: double[];
  public c: byte[];
  public constructor(v1: string[], v2: double[], v3: byte[]) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
  }
}

export class SetMapMixedCtorCls {
  public setData: Set<byte>;
  public mapData: Map<int, boolean>;
  public constructor(s: Set<byte>, m: Map<int, boolean>) {
    this.setData = s;
    this.mapData = m;
  }
}

export class BoolIntArrCtorCls {
  public flags: boolean[];
  public matrix: int[][];
  public constructor(f: boolean[], m: int[][]) {
    this.flags = f;
    this.matrix = m;
  }
}

export abstract class AbsDblParamCtor {
  public rate: double;
  public constructor(d: double) {
    this.rate = d;
  }
}

export class MultiImplParamCtor {
  public a: float;
  public b: byte;
  public constructor(f: float, g: byte) {
    this.a = f;
    this.b = g;
  }
  public step1(): void {}
  public step2(): void {}
}

export class NestedDeepGenericCtor {
  public data: Map<string, Array<FixedArray<int>>>;
  public constructor(m: Map<string, Array<FixedArray<int>>>) {
    this.data = m;
  }
}

export class CollectionPairCtor {
  public keys: Array<string>;
  public values: Array<int>;
  public constructor(k: Array<string>, v: Array<int>) {
    this.keys = k;
    this.values = v;
  }
}

export class CtorMulti {
  public constructor(a: number, b: string, c: boolean) {}
}

export class Over3Idx0 {
  public constructor(v?: number | string) {}
}

export class Over5Idx0 {
  public constructor(a?: number, b?: string, c?: boolean, d?: number) {}
}

export class IN_EightParamCtor {
  public constructor(a: int, b: string, c: boolean, d: double, e: int, f: string, g: boolean, h: double) {}
}

export class IN_RefOuterCtor {
  public constructor(ref: EmptyCls) {}
}

export class Ext_MixedNumTypes {
  a: int = 0;
  b: long = 0;
  c: double = 0.0;
  d: double = 0.0;
  e: byte = 0;
  f: short = 0;
  public constructor(a: int, b: long, c: float, d: double, e: byte, f: short) {
    this.a = a; this.b = b; this.c = c; this.d = d; this.e = e; this.f = f;
  }
}

export class Ext2_TwoFloatCtor {
  a: double = 0.0;
  b: double = 0.0;
  public constructor(a: float, b: float) {
    this.a = a;
    this.b = b;
  }
}

export class Ext2_FifteenParamCtor {
  p0: int = 0; p1: int = 0; p2: int = 0; p3: int = 0; p4: int = 0;
  p5: string = ''; p6: string = ''; p7: string = ''; p8: string = '';
  p9: boolean = false; p10: boolean = false; p11: double = 0.0;
  p12: double = 0.0; p13: long = 0; p14: long = 0;
  public constructor(p0: int, p1: int, p2: int, p3: int, p4: int,
    p5: string, p6: string, p7: string, p8: string,
    p9: boolean, p10: boolean, p11: float, p12: float, p13: long, p14: long) {
    this.p0 = p0; this.p1 = p1; this.p2 = p2; this.p3 = p3; this.p4 = p4;
    this.p5 = p5; this.p6 = p6; this.p7 = p7; this.p8 = p8;
    this.p9 = p9; this.p10 = p10; this.p11 = p11; this.p12 = p12;
    this.p13 = p13; this.p14 = p14;
  }
}

export class Ext2_LongDoubleCtor {
  a: long = 0;
  b: double = 0.0;
  public constructor(a: long, b: double) {
    this.a = a;
    this.b = b;
  }
}

export class Ext2_MultiContainer {
  list: Array<int> = [];
  map: Map<string, int> = new Map<string, int>();
  public constructor(list: Array<int>, map: Map<string, int>) {
    this.list = list;
    this.map = map;
  }
}

export class Ext2_ByteShortIntCtor {
  a: byte = 0;
  b: short = 0;
  c: int = 0;
  public constructor(a: byte, b: short, c: int) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

export class Ext4_CharFixedArrMix {
  a: char = c'a';
  b: FixedArray<int>;
  c: int = 0;
  public constructor(a: char, b: FixedArray<int>, c: int) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

export class Ext4_MixedQuadParam {
  a: char = c'a';
  b: FixedArray<int>;
  c: int = 0;
  d: boolean = false;
  public constructor(a: char, b: FixedArray<int>, c: int, d: boolean) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
}

export class PrivateCtorTwoParams {
  x: int = 0;
  y: string = "";
  private constructor(a: int, b: string) {
    this.x = a;
    this.y = b;
  }
  static create(a: int, b: string): PrivateCtorTwoParams {
    return new PrivateCtorTwoParams(a, b);
  }
}

export class PrivateCtorThreeParams {
  a: int = 0;
  b: int = 0;
  c: int = 0;
  private constructor(x: int, y: int, z: int) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
  static create(x: int, y: int, z: int): PrivateCtorThreeParams {
    return new PrivateCtorThreeParams(x, y, z);
  }
}

export class Priv3IntStrBoolExt2 {
  private constructor(a: int, b: string, c: boolean) {}
}

export class IP5_278_PrivDefBool {
  private constructor(b: boolean = true) {}
}

export class IP2_136_PrivIntArr { private constructor(arr: int[]) {} }

export class ThreeOverloadPrivateCtor {
  sum: int = 0;
  private constructor(a?: int, b?: int) {
    if (a !== undefined && b !== undefined) {
      this.sum = a + b;
    } else if (a !== undefined) {
      this.sum = a;
    }
  }
  static createDefault(): ThreeOverloadPrivateCtor {
    return new ThreeOverloadPrivateCtor();
  }
  static createOne(a: int): ThreeOverloadPrivateCtor {
    return new ThreeOverloadPrivateCtor(a);
  }
  static createTwo(a: int, b: int): ThreeOverloadPrivateCtor {
    return new ThreeOverloadPrivateCtor(a, b);
  }
}

export class FiveCallPub_L4434 {
  public constructorl(): void {}
}

export class Pub6IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int) {}
}

export class Pub7IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int) {}
}

export class Pub9IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int) {}
}

export class TcPriv5 {
  private constructor(a: double) {}
}

export class Priv2StrBoolExt {
  private constructor(a: string, b: boolean) {}
}

export class Priv2IntDoubleExt {
  private constructor(a: int, b: double) {}
}

export class Priv2BoolIntExt {
  private constructor(a: boolean, b: int) {}
}

export class Priv2StrDoubleExt {
  private constructor(a: string, b: double) {}
}

export class Priv2IntBoolExt {
  private constructor(a: int, b: boolean) {}
}

export class Priv2DoubleStrExt {
  private constructor(a: double, b: string) {}
}

export class Priv2LongIntExt {
  private constructor(a: long, b: int) {}
}

export class Priv2ShortByteExt {
  private constructor(a: short, b: byte) {}
}

export class Priv2FloatBoolExt {
  private constructor(a: float, b: boolean) {}
}

export class IP3_218_PubIntDbl { public constructor(a: int, d: double) {} }

export class Pub2DoubleStrExt {
  public constructor(a: double, b: string) {}
}

export class Pub2LongIntExt {
  public constructor(a: long, b: int) {}
}

export class Pub2FloatBoolExt {
  public constructor(a: float, b: boolean) {}
}

export class MultiPrivPubExt {
  private constructor(a: int) {}
  public constructor(a: string) {}
}

export class MultiPrivProtExt {
  private constructor(a: int) {}
  protected constructor(a: string) {}
}

export class MultiPubProtExt {
  public constructor(a: int) {}
  protected constructor(a: string) {}
}

export class Priv3IntStrDoubleExt2 {
  private constructor(a: int, b: string, c: double) {}
}

export class Priv3StrDoubleIntExt2 {
  private constructor(a: string, b: double, c: int) {}
}

export class Priv3BoolIntFloatExt2 {
  private constructor(a: boolean, b: int, c: float) {}
}

export class Priv3ShortIntDoubleExt2 {
  private constructor(a: short, b: int, c: double) {}
}

export class Priv3LongIntShortExt2 {
  private constructor(a: long, b: int, c: short) {}
}

export class Priv3ByteFloatBoolExt2 {
  private constructor(a: byte, b: float, c: boolean) {}
}

export class Pub3StrDoubleIntExt2 {
  public constructor(a: string, b: double, c: int) {}
}

export class Pub3BoolIntFloatExt2 {
  public constructor(a: boolean, b: int, c: float) {}
}

export class Pub3ShortIntDoubleExt2 {
  public constructor(a: short, b: int, c: double) {}
}

export class Pub3LongIntShortExt2 {
  public constructor(a: long, b: int, c: short) {}
}

export class Pub3ByteFloatBoolExt2 {
  public constructor(a: byte, b: float, c: boolean) {}
}

export class TcGapPriv4Param {
  private constructor(a: int, b: string, c: boolean, d: double) {}
}

export class Priv5IntStrBoolDoubleFloatExt2 {
  private constructor(a: int, b: string, c: boolean, d: double, e: float) {}
}

export class Pub5IntStrBoolDoubleFloatExt2 {
  public constructor(a: int, b: string, c: boolean, d: double, e: float) {}
}

export class Priv6IntStrBoolDoubleFloatLongExt2 {
  private constructor(a: int, b: string, c: boolean, d: double, e: float, f: long) {}
}

export class Pub6IntStrBoolDoubleFloatLongExt2 {
  public constructor(a: int, b: string, c: boolean, d: double, e: float, f: long) {}
}

export class Priv4StrBoolDoubleFloatExt {
  private constructor(a: string, b: boolean, c: double, d: float) {}
}

export class Pub4StrBoolDoubleFloatExt {
  public constructor(a: string, b: boolean, c: double, d: float) {}
}

export class Priv5LongIntShortByteBoolExt {
  private constructor(a: long, b: int, c: short, d: byte, e: boolean) {}
}

export class Pub5LongIntShortByteBoolExt {
  public constructor(a: long, b: int, c: short, d: byte, e: boolean) {}
}

export class Priv7IntStrBoolDoubleFloatLongShortExt {
  private constructor(a: int, b: string, c: boolean, d: double, e: float, f: long, g: short) {}
}

export class Pub7IntStrBoolDoubleFloatLongShortExt {
  public constructor(a: int, b: string, c: boolean, d: double, e: float, f: long, g: short) {}
}

export class MultiAllExt {
  private constructor(a: int) {}
  public constructor(a: string) {}
  protected constructor(a: double) {}
}

export class MultiPrivPrivExt {
  private constructor(a: int) {}
  private constructor(a: string) {}
}

export class MultiPrivTripleExt {
  private constructor(a: int) {}
  private constructor(a: string) {}
  private constructor(a: double) {}
}

export class MultiPubTripleExt {
  public constructor(a: int) {}
  public constructor(a: string) {}
  public constructor(a: double) {}
}

export class PrivObjParam {
  private constructor(a: Object) {}
  static create(a: Object): PrivObjParam {
    return new PrivObjParam(a);
  }
}

export class ProtObjParam {
  protected constructor(a: Object) {}
  static create(a: Object): ProtObjParam {
    return new ProtObjParam(a);
  }
}

export class PubCustomParam {
  public constructor(a: OrdRef) {}
}

export class PrivCustomParam {
  private constructor(a: OrdRef) {}
  static create(a: OrdRef): PrivCustomParam {
    return new PrivCustomParam(a);
  }
}

export class PrivFixedArrParam {
  private constructor(a: FixedArray<int>) {}
  static create(a: FixedArray<int>): PrivFixedArrParam {
    return new PrivFixedArrParam(a);
  }
}

export class ProtFixedArrParam {
  protected constructor(a: FixedArray<int>) {}
  static create(a: FixedArray<int>): ProtFixedArrParam {
    return new ProtFixedArrParam(a);
  }
}

export class PubObjIntParam {
  public constructor(a: Object, b: int) {}
}

export class PrivObjIntParam {
  private constructor(a: Object, b: int) {}
  static create(a: Object, b: int): PrivObjIntParam {
    return new PrivObjIntParam(a, b);
  }
}

export class PubCustomStrParam {
  public constructor(a: OrdRef, b: string) {}
}

export class PrivCustomStrParam {
  private constructor(a: OrdRef, b: string) {}
  static create(a: OrdRef, b: string): PrivCustomStrParam {
    return new PrivCustomStrParam(a, b);
  }
}

export class PubObjIntDoubleParam {
  public constructor(a: Object, b: int, c: double) {}
}

export class PrivObjIntDoubleParam {
  private constructor(a: Object, b: int, c: double) {}
  static create(a: Object, b: int, c: double): PrivObjIntDoubleParam {
    return new PrivObjIntDoubleParam(a, b, c);
  }
}
export class TcPub23 {
  public constructor(a: BigInt) {}
}

export class TcPub24 {
  public constructor(a: double[][]) {}
}

export class TcPub33 {
  public constructor(a: Date) {}
}

export class TcPub34 {
  public constructor(a: RegExp) {}
}

export class TcPubProtA {
  public constructor() {}
  protected constructor(x: int) {}
}

export class TcPubPrivA { public constructor() {} private constructor(x: int) {} }

export class TcAllVisA {
  public constructor() {}
  protected constructor(x: int) {}
  private constructor(y: string) {}
}

export class TcAllOpt5 {
  public constructor(a?: int, b?: string, c?: boolean, d?: double, e?: short) {}
}

export class TcMapSS {
  public constructor(m: Map<string, string>) {}
}

export class TcStrIntArr {
  public constructor(s: string, a: int[][]) {}
}

export class TcIntMap {
  public constructor(i: int, m: Map<int, string>) {}
}

export class TcGapCustArr {
  public constructor(a: EmptyCls[]) {}
}

export class TcGapMapII {
  public constructor(a: Map<int, int>) {}
}

export class TcGapFnParam {
  public constructor(a: () => void) {}
}

export class TcGapUniNB {
  public constructor(a: number | boolean) {}
}

export class TcGapShort2D {
  public constructor(a: short[][]) {}
}

export class TcGapFloat2D {
  public constructor(a: float[][]) {}
}

export class IP5_268_ProChar {
  protected constructor(c: char) {}
}

export abstract class C1Char {
  public constructor(a: char) {}
}

export class IsPublicCtorRefParam {
  public constructor(inner: MyData) {}
}

export class IsPublicThenPrivateCtor {
  public constructor(x: int) {}
  private constructor(s: string) {}
  public static createStr(): IsPublicThenPrivateCtor { return new IsPublicThenPrivateCtor(''); }
}

export class IsPrivateThenPublicCtor {
  private constructor() {}
  public constructor(x: int) {}
  public static createDefault(): IsPrivateThenPublicCtor { return new IsPrivateThenPublicCtor(); }
}
export class IP2_128_5CIdx0 { public constructor() {} public constructor(a: int) {} public constructor(s: string) {} public constructor(b: boolean) {} public constructor(d: double) {} }

export class IP3_181_PubDblInt { public constructor(d: double, a: int) {} }

export class IP3_191_ArrIdx4 { public constructor() {} public constructor(a: int) {} public constructor(s: string) {} public constructor(d: double) {} }

export class IP3_198_PubMap { public constructor(m: Map<String, int>) {} }

export class IP3_200_PubDblFixedArr { public constructor(arr: FixedArray<double>) {} }

export class IP3_209_7Overload { public constructor() {} public constructor(a: int) {} public constructor(s: string) {} public constructor(b: boolean) {} public constructor(d: double) {} public constructor(f: float) {} public constructor(l: long) {} }

export class IP3_211_PubObjArr { public constructor(arr: Object[]) {} }

export class IP3_214_PubCtorArr { public constructor(arr: reflect.Constructor[]) {} }

export class IP3_216_All6Idx2 { public constructor() {} public constructor(a: int) {} public constructor(s: string) {} public constructor(b: boolean) {} public constructor(d: double) {} public constructor(f: float) {} }

export class IP3_217_PubClsArr { public constructor(arr: Class[]) {} }

export class ZeroParamCons {
  id_: number = 0;
  public constructor() {}
}

export class SingleParamCons {
  val_: number = 0;
  public constructor(v: number) {
    this.val_ = v;
  }
}

export class MultiCtorTarget {
  numVal: int = 0;
  strVal: string = '';
  public constructor(x?: int, s?: string) {
    if (x !== undefined) {
      this.numVal = x;
    }
    if (s !== undefined) {
      this.strVal = s;
    }
  }
}

export class Eq04_StrP {
  val: int = 0;
  public constructor(s?: string) {}
}
export class EqOneParam {
  val: int = 0;
  public constructor(v: int) { this.val = v; }
}

export class EqTwoParam {
  a: int = 0;
  b: string = '';
  public constructor(x: int, s: string) { this.a = x; this.b = s; }
}

export class S1 { constructor() {} }

export class RecovOne {
  val: number = 0;
  public constructor(v: number) { this.val = v; }
}

export class S2 { constructor(a: int) {} }

export class S3 { constructor(a: int, b: string) {} }

export class S4 { constructor(a: int, b: string, c: boolean) {} }
export class IntCtor {
  public v: int;
  public constructor(v: int) {
    this.v = v;
  }
}

export class TwoParamCtor {
  public s: string;
  public n: int;
  public constructor(s: string, n: int) {
    this.s = s;
    this.n = n;
  }
}

export class ThreeParamCtor {
  public a: int;
  public b: string;
  public c: boolean;
  public constructor(a: int, b: string, c: boolean) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
}

export class StringCtor {
  public v: string;
  public constructor(v: string) {
    this.v = v;
  }
}

export class BoolCtor {
  public v: boolean;
  public constructor(v: boolean) {
    this.v = v;
  }
}

export class NumberCtor {
  public v: number;
  public constructor(v: number) {
    this.v = v;
  }
}

export class ArrayCtor {
  public v: int[];
  public constructor(v: int[]) {
    this.v = v;
  }
}
export class NoArgClass {
  public constructor() {}
  public name: string = "default";
}

export class IntFieldClass {
  public value: int = 0;
  public constructor(v: int) {
    this.value = v;
  }
}

export class StringFieldClass {
  public value: string = "";
  public constructor(v: string) {
    this.value = v;
  }
}

export class BoolFieldClass {
  public value: boolean = false;
  public constructor(v: boolean) {
    this.value = v;
  }
}

export class ParentClass {
  public parentField: string = "parent";
  public parentDouble:double=Double.MAX_VALUE;
  public constructor() {}
}

export class ChildClass extends ParentClass {
  public childField: string = "child";
  public childInt:int=Int.MAX_VALUE;
  public constructor() {
    super();
  }
}

export class ArrayWrapClass {
  public items: int[] = [];
  public constructor(arr: int[]) {
    this.items = arr;
  }
}

export class ManyFieldsClass {
  public f0: int = 0;
  public f1: int = 0;
  public f2: int = 0;
  public f3: int = 0;
  public f4: int = 0;
  public f5: int = 0;
  public constructor() {}
}

export class CI_ThisChain0 {
  public value: string;
  public count: int;
  public constructor() {
    this.value = "default";
    this.count = 0;
  }
}

export class CI_SuperBase {
  public baseVal: string;
  public constructor(v: string) {
    this.baseVal = v;
  }
}

export class CI_SuperChild extends CI_SuperBase {
  public childVal: int;
  public constructor(v: string, n: int) {
    super(v);
    this.childVal = n;
  }
}

export class CI_ThreeLevel {
  public l1: string;
  public constructor(v: string) {
    this.l1 = v;
  }
}

export class CI_ThreeMid extends CI_ThreeLevel {
  public l2: string;
  public constructor(v: string) {
    super(v);
    this.l2 = v;
  }
}

export class CI_ThreeLeaf extends CI_ThreeMid {
  public l3: string;
  public constructor(v: string) {
    super(v);
    this.l3 = v;
  }
}

export class CI_Default1 {
  public x: int;
  public constructor() {
    this.x = 10;
  }
  public constructor(x: int) {
    this.x = x;
  }
}

export class CI_DefaultZero {
  public n: int;
  public constructor() {
    this.n = 0;
  }
  public constructor(n: int) {
    this.n = n;
  }
}
export class CI_20Params {
  public items: int[];
  public constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int, p10: int,
    p11: int, p12: int, p13: int, p14: int, p15: int, p16: int, p17: int, p18: int, p19: int, p20: int) {
    this.items = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20];
  }
}
export class CI02_OneInt {
  public val: int = 0;
  public constructor(v: int) {
    this.val = v;
  }
}

export class CI02_TwoStrBool {
  public a: string = "";
  public b: boolean = false;
  public constructor(a: string, b: boolean) {
    this.a = a;
    this.b = b;
  }
}

export class CI02_TwoIntStr {
  public a: int = 0;
  public b: string = "";
  public constructor(x: int, y: string) {
    this.a = x;
    this.b = y;
  }
}

export class CI02_Multi {
  public a: int = 0;
  public b: string = "";
  public c: boolean = false;
  public d: number = 0.0;
  public constructor(w: int, x: string, y: boolean, z: number) {
    this.a = w;
    this.b = x;
    this.c = y;
    this.d = z;
  }
}

export class CI02_Overload {
  public val: int = 0;
  public tag: string = "";
  public constructor() {}
  public constructor(v: int) {
    this.val = v;
  }
  public constructor(v: int, t: string) {
    this.val = v;
    this.tag = t;
  }
}

export class CI02_Default {
  public x: int = 100;
  public y: string = "def";
  public constructor() {}
  public constructor(a: int) {
    this.x = a;
  }
  public constructor(a: int, b: string) {
    this.x = a;
    this.y = b;
  }
}

export class CI02_Inner {
  public data: int = 0;
  public constructor(d: int) {
    this.data = d;
  }
}

export class CI02_WithMethod {
  public base: int = 0;
  public constructor(v: int) {
    this.base = v;
  }
  public getDouble(): int {
    return this.base * 2;
  }
  public isPositive(): boolean {
    return this.base > 0;
  }
}

export interface Computable_Ext {
  compute(): int;
}

export class InterfaceImplClass implements Computable_Ext {
  public base: int;
  public constructor(base: int) {
    this.base = base;
  }
  public compute(): int {
    return this.base * 2;
  }
}
export class ConcreteFromAbstract_Ext extends EmptyCls {
  public val: string;
  public constructor(val: string) {
    super();
    this.val = val;
  }
}

export interface IAlpha_Ext {
  alpha(): string;
}

export interface IBeta_Ext {
  beta(): int;
}

export class MultiInterface_Ext implements IAlpha_Ext, IBeta_Ext {
  public name: string;
  public count: int;
  public constructor(name: string, count: int) {
    this.name = name;
    this.count = count;
  }
  public alpha(): string {
    return "prefix_" + this.name;
  }
  public beta(): int {
    return this.count + 100;
  }
}
export class GenCls<T> {
  public constructor(val: T) {}
}
export class Eq02_B {
  public constructor(x: number) {}
}
export class Eq02_E {
  public constructor(x: number = 10) {}
}

export class Eq02_F<T> {
  public constructor(val: T) {}
}
export class TcPub3 {
  public constructor(a: double) {}
}

export class PubFixedArrParam {
  public constructor(a: FixedArray<int>) {}
}

export class Eq03_FixedStrCls {
  public constructor(a: FixedArray<string>) {}
}

export class TcGapObj {
  public constructor(a: Object) {}
}
export class BooleanArg {
  public constructor(b: boolean) {}
}
export class GN_P2 {
  public constructor(a: int, b: string) {}
}
export class Eq03_ImmC {
  public constructor(a: string, b: boolean) {}
}

export class Eq03_ImmE {
  public constructor(a: int, b: string, c: double) {}
}

export class Eq03_ImmG {
  public constructor(x: long) {}
}

export class Eq03_ImmI {
  public constructor(x: short, y: float) {}
}
export class Eq03_ImmL {
  public constructor(x: double) {}
}
export interface EqExt_IFace {
  doIt(): void;
}

export class EqExt_ImplEmpty implements EqExt_IFace {
  public constructor() {}
  doIt(): void {}
}
export class EqExt_ImplInt implements EqExt_IFace {
  public constructor(a: int) {}
  doIt(): void {}
}

export class EqExt_ImplStr implements EqExt_IFace {
  public constructor(a: string) {}
  doIt(): void {}
}

export class EqExt_ImplBool implements EqExt_IFace {
  public constructor(a: boolean) {}
  doIt(): void {}
}

export class EqExt_ImplTwoParams implements EqExt_IFace {
  public constructor(a: string, b: int) {}
  doIt(): void {}
}

export interface EqExt_GenericIFace<T> {
  process(val: T): void;
}

export class EqExt_GenericImpl<T> implements EqExt_GenericIFace<T> {
  public constructor(val: T) {}
  process(val: T): void {}
}
export class SingleField {
  public val: int = 0;
  public constructor() {}
}

export class MixedArgs {
  public constructor(a: int, b?: string) {}
}

export class ChildWithSuper extends ParentWithParam {
  public constructor(a: int) {
    super(a);
  }
}

export interface IfaceMethod {
  exec(): void;
}

export class ImplIfaceMethod implements IfaceMethod {
  public exec(): void {}
  public constructor() {}
}
export class GenericOne<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class GenericTwo<T, U> {
  public a: T;
  public b: U;
  public constructor(x: T, y: U) {
    this.a = x;
    this.b = y;
  }
}

export class GenericBound<T extends int> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class GenericArrayField<T> {
  public items: T[] = [];
  public constructor() {}
}

export class GenParent<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class GenParentBase<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class GenChild<T> extends GenParentBase<T> {
  public childVal: T;
  public constructor(v: T) {
    super(v);
    this.childVal = v;
  }
}

export class TripleOverload {
  public constructor(x?: int, y?: string) {}
}

export interface IMarker {
}

export class GenBaseCombo<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class ComboChild<T> extends GenBaseCombo<T> implements IMarker {
  public constructor(v: T) {
    super(v);
  }
}

export class GN_4Ctor {
  public constructor(x?: int, y?: string, z?: boolean) {}
}

export class GN_6Ctor {
  public constructor(x?: int, y?: string, z?: boolean, w?: double, v?: byte) {}
}

export class GN_LoopUpper {
  public constructor(a: int, b: string, c: boolean, d: double) {}
}

export class GN_NoThrowGen<T> {
  public constructor(val: T) {}
}

export class GN_P10 {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int) {}
}

export class GN_P15 {
  public constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int, p10: int, p11: int, p12: int, p13: int, p14: int, p15: int) {}
}

export class GN_P20 {
  public constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int, p10: int, p11: int, p12: int, p13: int, p14: int, p15: int, p16: int, p17: int, p18: int, p19: int, p20: int) {}
}
export class GN_GenGen<T> {
  public constructor(val: T) {}
}

export class MethodCls {
  public foo(): int {
    return 42;
  }
  public bar(a: int): int {
    return a;
  }
  public constructor() {}
}
export interface InterA {
  foo(): void;
}

export interface InterB {
  bar(): void;
}

export class SingleIF implements InterA {
  public x: int = 0;
  public foo(): void {}
  public constructor() {}
}

export class MultiIF implements InterA, InterB {
  public x: int = 0;
  public foo(): void {}
  public bar(): void {}
  public constructor() {}
}

export abstract class AbsCls {
  public abstract foo(): void;
  public constructor() {}
}

export class RealCls extends AbsCls {
  public foo(): void {}
  public constructor() {
    super();
  }
}
export class BoxCls<T> {
  public val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class GetSetCls {
  private p: string = '';
  public get prop(): string {
    return this.p;
  }
  public set prop(v: string) {
    this.p = v;
  }
  public constructor() {}
}
export enum GO_Color { RED, GREEN, BLUE }

export interface GO_MyIface { foo(): void; }

export interface GO_IfaceA { methodA(): void; }

export interface GO_IfaceB { methodB(): void; }

export class GO_ImplIface implements GO_MyIface {
  public constructor() {}
  public foo(): void {}
}

export class GO_ImplMultiIface implements GO_IfaceA, GO_IfaceB {
  public constructor() {}
  public methodA(): void {}
  public methodB(): void {}
}
export interface OT_MyInterface {
  foo(): void;
}

export interface OT_ExtendsInterface extends OT_MyInterface {
  bar(): void;
}
export class MultiIfaceCtorCls implements OT_ExtendsInterface {
  public constructor() {}
  public foo(): void {}
  public bar(): void {}
}
export class OT_GenericOne<T> {
  public constructor(val: T) {}
}

export class OT_GenericTwo<T, U> {
  public constructor(a: T, b: U) {}
}

export class OT_GenericThree<T, U, V> {
  public constructor(a: T, b: U, c: V) {}
}

export class OT_GenericBound<T extends EmptyCls> {
  public constructor(val: T) {}
}

export class OT_GenericNested<T> {
  public constructor(val: T) {}
}

export class OT_GenericExtends<T> extends OT_GenericNested<T> {
  public constructor(val: T) { super(val); }
}

export class OT_GenericContainer<T> {
  public constructor() {}
  public foo(): T {
    return undefined as T;
  }
}

export enum OT_Color {
  RED, GREEN, BLUE
}

export enum OT_Season {
  SPRING = "SPRING",
  SUMMER = "SUMMER",
  AUTUMN = "AUTUMN",
  WINTER = "WINTER"
}

export class OT_DataPoint {
  x: int = 0;
  y: int = 0;
  public constructor() {}
}

export class OT_DataPerson {
  name: string = "";
  age: int = 0;
  public constructor() {}
}

export class OT_ReflectTarget {
  public constructor() {}
  public value: int = 42;
  public greet(): string {
    return "hello";
  }
}

export class OT_ReflectWithFields {
  public constructor() {}
  public name: string = "test";
  public count: int = 100;
  public active: boolean = true;
}

export class OT_ReflectWithMethods {
  public constructor() {}
  public add(a: int, b: int): int {
    return a + b;
  }
  public multiply(a: int, b: int): int {
    return a * b;
  }
}

export class OT_DerivedWithParam extends ParentWithParam {
  public constructor(x: int) { super(x); }
}
export class G01_TenParams {
  public constructor(p0: int, p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int, p9: int) {}
}

export class G01_OnlyMethods {
  public foo(): int {
    return 42;
  }
  public bar(s: string): string {
    return s;
  }
  public constructor() {}
}

export class G01_ManyFields {
  public f0: int = 0;
  public f1: int = 0;
  public f2: int = 0;
  public f3: int = 0;
  public f4: int = 0;
  public f5: int = 0;
  public f6: int = 0;
  public f7: int = 0;
  public f8: int = 0;
  public f9: int = 0;
  public constructor() {}
}

export class G01_AllFieldTypes {
  public fi: int = 0;
  public fs: string = '';
  public fb: boolean = false;
  public fd: double = 0.0;
  public fa: int[] = [0];
  public constructor() {}
}

export class G01_FieldExtremes {
  public maxInt: int = 2147483647;
  public minInt: int = -2147483648;
  public zeroInt: int = 0;
  public emptyStr: string = '';
  public trueVal: boolean = true;
  public falseVal: boolean = false;
  public constructor() {}
}
export class G01_StaticMembers {
  public static s: int = 0;
  public static t: string = '';
  public constructor() {}
}
export class GO2_Ext_ConcreteGeneric extends GO2_Ext_AbstractGeneric<int> {
  public process(val: int): int { return val; }
  public constructor() { super(); }
}

export class EW_FloatParam {
  public val: float;
  public constructor(v: float) {
    this.val = v;
  }
}

export class EW_ByteParam {
  public val: byte;
  public constructor(v: byte) {
    this.val = v;
  }
}

export class EW_ShortParam {
  public val: short;
  public constructor(v: short) {
    this.val = v;
  }
}

export class EW_LongParam {
  public val: long;
  public constructor(v: long) {
    this.val = v;
  }
}

export class EW_CharParam {
  public val: char;
  public constructor(v: char) {
    this.val = v;
  }
}

export class EW_ObjectParam {
  public val: Object;
  public constructor(v: Object) {
    this.val = v;
  }
}

export class EW_FixedArrayParam {
  public val: FixedArray<int>;
  public constructor(v: FixedArray<int>) {
    this.val = v;
  }
}

export class EW_IntBoundary {
  public val: int;
  public constructor(v: int) {
    this.val = v;
  }
}
export class MyData {
  public constructor() {}
  public value: int = 0;
}
export class CtorOverload {
  public constructor(a?: string) {}
}
export class CtorGeneric<T> {
  public constructor(a: T) {}
}

export interface ITestable {
}
export class ExtInheritChild extends Eq04_StrP {
  public constructor(a: int, b: string) { super(b); }
}

export enum TestColor {
  RED = 0, GREEN = 1, BLUE = 2
}

export enum TestFlag {
  YES = 1, NO = 0
}

export class DataWrap {
  public constructor(val: int) {}
}

export class BaseNum<T> {
  public constructor(v: T) {}
}

export class ExtGenChild extends BaseNum<int> {
  public constructor(v: int) { super(v); }
}

export class GenBox<T> {
  public constructor(item: T) {}
}
export class FieldsAndMethods {
  public constructor() {}
  x: int = 0;
  y: string = "";
  calc(): int {
    return this.x;
  }
}
export class CustomType {
  public constructor() {}
  value: int = 0;
}

export enum TestEnum {
  A, B, C
}
export class OrdRef {
  public constructor() {}
  id: int = 0;
}

export class TypeA {
  public constructor() {}
  a: int = 0;
}

export class TypeB {
  public constructor() {}
  b: string = "";
}

export enum MixEnum {
  X, Y, Z
}
export class AfterGetName {
  public constructor(msg: string, code: int) {
  }
}
export class GenericClass_Ext<T> {
  public constructor(a: T) {
  }
}

export class GenericMulti_Ext<T, U> {
  public constructor(a: T, b: U) {
  }
}

export interface MyInterface_Ext {
  doSomething(): void;
}

export class ImplInterface_Ext implements MyInterface_Ext {
  doSomething(): void {
  }

  public constructor(a: string) {
  }
}

export class Base_Ext {
  public constructor() {}
  baseVal: int = 0;
}

export interface Action_Ext {
  run(): void;
}

export class ExtendsAndImplements_Ext extends Base_Ext implements Action_Ext {
  run(): void {
  }

  public constructor(a: int, b: string) {
    super();
  }
}

export interface IA_Ext {
  foo(): void;
}

export class MyCustomClass2 {
  id: int = 0;
  public constructor(id: int) { this.id = id; }
}

export class Base {
  x: int = 0;
  public constructor(x: int) { this.x = x; }
}
export class Derived2 extends Base {
  y: string = "";
  z: boolean = false;
  public constructor(x: int, y: string, z: boolean) { super(x); this.y = y; this.z = z; }
}

export class Ctor3int {
  a: int = 0; b: int = 0; c: int = 0;
  public constructor(a: int, b: int, c: int) { this.a = a; this.b = b; this.c = c; }
}

export class Ctor3str {
  a: string = ""; b: string = ""; c: string = "";
  public constructor(a: string, b: string, c: string) { this.a = a; this.b = b; this.c = c; }
}
export class NoExplicitCtor {
  public constructor() {}
  x: int = 0;
  y: string = "";
}
export class GenericEmptyCtorExt<T> {
  public constructor() {}
}

export interface IF_Single {
  doWork(): void;
}

export interface IF_A {
  taskA(): void;
}

export interface IF_B {
  taskB(): void;
}

export interface IF_WithProp {
  id: int;
  process(): void;
}

export enum PGN_TestColor { RED, GREEN, BLUE }
export class PGN_SingleDefault {
  public constructor(value: int = 0) {}
}
export class PGN_TwoDefault {
  public constructor(a: int = 0, b: string = "hello") {}
}
export class PGN_MultiDefaultMand {
  public constructor(a: int, b: string = "hello", c: boolean = true) {}
}
export class PGN_InheritChild extends ParentWithParam {
  public constructor(a: int, b: string) {
    super(a);
  }
}
export class PGN_Level2 extends ParentWithParam {
  public constructor(a: int, b: int) {
    super(a);
  }
}

export class PGN_Level3 extends PGN_Level2 {
  public constructor(a: int, b: int, c: int) {
    super(a, b);
  }
}

export class PGN_Level4 extends PGN_Level3 {
  public constructor(a: int, b: int, c: int, d: int) {
    super(a, b, c);
  }
}

export class PGN_Level5 extends PGN_Level4 {
  public constructor(a: int, b: int, c: int, d: int, e: int) {
    super(a, b, c, d);
  }
}
export class PGN_ThreeLevelC extends EmptyCls {
  public constructor(a: int) {
    super();
  }
}
export class PGN_SuperCallTwoParamChild extends TwoSameInt {
  public constructor(a: int, b: int) {
    super(a, b);
  }
}
export class PGN_ImplSingleInterface implements IF_Single {
  public constructor(a: int) {}
  doWork(): void {}
}

export class PGN_ImplMultiInterface implements IF_A, IF_B {
  public constructor(a: int) {}
  taskA(): void {}
  taskB(): void {}
}

export class PGN_ImplInterfaceProp implements IF_WithProp {
  id: int = 0;
  public constructor(a: int) {}
  process(): void {}
}

export class PGN_InheritAndInterface extends EmptyCls implements IF_Single {
  public constructor(a: int) {
    super();
  }
  doWork(): void {}
}

export class PGN_MultiInheritMultiInterface extends EmptyCls implements IF_A, IF_B {
  public constructor(a: int) {
    super();
  }
  taskA(): void {}
  taskB(): void {}
}

export class PGN_InterfaceNoCtor implements IF_Single {
  public constructor() {}
  doWork(): void {}
}

export class PGN_InterfaceTwoParam implements IF_Single {
  public constructor(a: int, b: string) {}
  doWork(): void {}
}

export class PGN_InterfaceThreeParam implements IF_Single {
  public constructor(a: int, b: string, c: boolean) {}
  doWork(): void {}
}

export interface IF_Generic<T> {
  getData(): T;
}

export class PGN_GenericInterfaceImpl<T> implements IF_Generic<T> {
  public constructor(a: int) {}
  getData(): T { return undefined!; }
}
export class PGN_AbstractGenericInterface<T> extends EmptyCls implements IF_Generic<T> {
  public constructor(a: int) {
    super();
  }
  getData(): T { return undefined!; }
}

export class PGN_GenericSingle<T> {
  public constructor(value: T) {}
}

export class PGN_GenericTwo<T, U> {
  public constructor(a: T, b: U) {}
}

export class PGN_GenericConstrained<T extends number> {
  public constructor(value: T) {}
}

export class PGN_GenericDefault<T = string> {
  public constructor(value: T) {}
}

export class PGN_GenericChild<T> extends PGN_GenericSingle<T> {
  public constructor(value: T) {
    super(value);
  }
}

export class PGN_GenericImplInterface<T> implements IF_Generic<T> {
  public constructor(value: T) {}
  getData(): T { return undefined!; }
}

export class PGN_ComplexGenericInherit<T> extends PGN_GenericSingle<T> implements IF_Single {
  public constructor(value: T) {
    super(value);
  }
  doWork(): void {}
}
export class PGN_Config {
  public constructor(host: string, port: int) {}
}

export class GN2_B1P {
  public constructor(p1: int) {}
}

export class GN2_D2P extends GN2_B1P {
  public constructor(p1: int, p2: string) { super(p1); }
}

export class GN2_B2P {
  public constructor(p1: int, p2: int) {}
}

export class GN2_D0P extends GN2_B2P {
  public constructor() { super(0, 0); }
}
export class GN2_LvlB extends EmptyCls {
  public constructor(p1: int) { super(); }
}

export class GN2_LvlC extends GN2_LvlB {
  public constructor(p1: int, p2: int) { super(p1); }
}
export class GN3_Base4P {
  public constructor(p1: int, p2: int, p3: int, p4: int) {}
}

export class GN3_Derived1P extends GN3_Base4P {
  public constructor(p1: int) { super(p1, 0, 0, 0); }
}

export class IntFieldCls {
  public value: int;
  public constructor() {
    this.value = 0;
  }
}

export class StrFieldCls {
  public name: string;
  public constructor() {
    this.name = 'a';
  }
}

export class BoolFieldCls {
  public flag: boolean;
  public constructor() {
    this.flag = true;
  }
}

export class DoubleFieldCls {
  public value: double;
  public constructor() {
    this.value = 3.14;
  }
}

export class FloatFieldCls {
  public value: float;
  public constructor() {
    this.value = 2.5f;
  }
}

export class ByteFieldCls {
  public value: byte;
  public constructor() {
    this.value = 127;
  }
}

export class LongFieldCls {
  public value: long;
  public constructor() {
    this.value = 100000;
  }
}

export class ShortFieldCls {
  public value: short;
  public constructor() {
    this.value = 0;
  }
}

export class MultiFieldCls {
  public id: int;
  public name: string;
  public active: boolean;
  public constructor() {
    this.id = 1;
    this.name = 'x';
    this.active = true;
  }
}

export class ExtCmpB {
  public value: int;
  public constructor(v: int) {
    this.value = v;
  }
}

export class ExtCmpC {
  public name: string;
  public constructor(s: string) {
    this.name = s;
  }
}

export class BoolParamCls {
  public flag: boolean;
  public constructor(b: boolean) {
    this.flag = b;
  }
}

export class ExtArrB {
  public value: double;
  public constructor(d: double) {
    this.value = d;
  }
}

export class FloatParamCls {
  public value: float;
  public constructor(f: float) {
    this.value = f;
  }
}

export class ByteParamCls {
  public value: byte;
  public constructor(b: byte) {
    this.value = b;
  }
}

export class LongParamCls {
  public value: long;
  public constructor(l: long) {
    this.value = l;
  }
}

export class ShortParamCls {
  public value: short;
  public constructor(s: short) {
    this.value = s;
  }
}

export class ClassParamCls {
  public clazz: Class;
  public constructor(c: Class) {
    this.clazz = c;
  }
}

export class ArrParamCls {
  public data: FixedArray<int>;
  public constructor(arr: FixedArray<int>) {
    this.data = arr;
  }
}

export class TwoIntCls {
  public a: int;
  public b: int;
  public constructor(x: int, y: int) {
    this.a = x;
    this.b = y;
  }
}

export class StrIntCls {
  public name: string;
  public id: int;
  public constructor(s: string, n: int) {
    this.name = s;
    this.id = n;
  }
}

export class BoolStrCls {
  public flag: boolean;
  public label: string;
  public constructor(b: boolean, s: string) {
    this.flag = b;
    this.label = s;
  }
}

export class ThreeIntCls {
  public x: int;
  public y: int;
  public z: int;
  public constructor(a: int, b: int, c: int) {
    this.x = a;
    this.y = b;
    this.z = c;
  }
}

export class MixThreeCls {
  public id: int;
  public name: string;
  public active: boolean;
  public constructor(i: int, s: string, b: boolean) {
    this.id = i;
    this.name = s;
    this.active = b;
  }
}

export class TwoStrCls {
  public first: string;
  public last: string;
  public constructor(a: string, b: string) {
    this.first = a;
    this.last = b;
  }
}

export class TwoCtorCls {
  public value: int;
  public constructor() {
    this.value = 0;
  }
  public constructor(v: int) {
    this.value = v;
  }
}

export class ThreeCtorCls {
  public value: int;
  public name: string;
  public constructor() {
    this.value = 0;
    this.name = '';
  }
  public constructor(v: int) {
    this.value = v;
    this.name = '';
  }
  public constructor(v: int, s: string) {
    this.value = v;
    this.name = s;
  }
}
export class BoxGeneric<T> {
  public content: T;
  public constructor(v: T) {
    this.content = v;
  }
}

export class BoxInt<T> {
  public content: T;
  public constructor(v: T) {
    this.content = v;
  }
}

export class Pair<A, B> {
  public first: A;
  public second: B;
  public constructor(a: A, b: B) {
    this.first = a;
    this.second = b;
  }
}

export class InitMethodCls {
  public value: int;
  public constructor() {
    this.init();
  }
  private init(): void {
    this.value = 42;
  }
}

export class ProtectFieldCls {
  protected status: string;
  public constructor(s: string) {
    this.status = s;
  }
}

export class MultiInitCls {
  public id: int;
  public tag: string;
  public constructor() {
    this.id = 0;
    this.tag = 'dft';
  }
}
export class CompactIntCls {
  public constructor(d: int) {}
}

export class PubLongParam {
  public constructor(l: long) {}
}

export class WrapBool<T> {
  public constructor(v: T) {}
}
export class InitThisCls {
  public arr: FixedArray<int>;
  public constructor() {
    this.arr = [1, 2, 3];
  }
}

export class BranchCtor {
  public code: int;
  public constructor(flag: boolean) {
    if (flag) {
      this.code = 1;
    } else {
      this.code = 0;
    }
  }
}

export class LoopBodyCtor {
  public sum: int;
  public constructor(n: int) {
    let s: int = 0;
    for (let i = 0; i < n; i++) {
      s = s + i;
    }
    this.sum = s;
  }
}

export class CreateInCtor {
  public obj: Object;
  public constructor() {
    this.obj = new Object();
  }
}

export enum ColorShade { RED, BLUE }

export class ThrowInCtor {
  public value: int;
  public constructor() {
    throw new Error('ctor fail');
  }
}

export class ThrowParamCtor {
  public name: string;
  public constructor(s: string) {
    if (s.length == 0) {
      throw new Error('empty');
    }
    this.name = s;
  }
}

export class WrongArgCtor {
  public data: int;
  public constructor(x: int) {
    this.data = x;
  }
}

export class GenericBox<T> {
  public content: T;
  public constructor(v: T) {
    this.content = v;
  }
}

export class MapPair<K, V> {
  public key: K;
  public value: V;
  public constructor(k: K, v: V) {
    this.key = k;
    this.value = v;
  }
}
export class LevelBase {
  public id: int;
  public constructor(i: int) {
    this.id = i;
  }
}

export class LevelSub extends LevelBase {
  public tag: string;
  public constructor(i: int, s: string) {
    super(i);
    this.tag = s;
  }
}

export class LevelSubSub extends LevelSub {
  public rate: double;
  public constructor(i: int, s: string, d: double) {
    super(i, s);
    this.rate = d;
  }
}
export class InnerComboType {
  public constructor() {}
  public val: int = 1;
}

export class CtorStrArrParam {
  public data: string[];
  public constructor(a: string[]) {
    this.data = a;
  }
}

export class CtorBoolArrParam {
  public data: boolean[];
  public constructor(a: boolean[]) {
    this.data = a;
  }
}

export class CtorMapParam {
  public data: Map<string, int>;
  public constructor(a: Map<string, int>) {
    this.data = a;
  }
}

export class CtorSetParam {
  public data: Set<int>;
  public constructor(a: Set<int>) {
    this.data = a;
  }
}

export class CtorArrayIntParam {
  public data: Array<int>;
  public constructor(a: Array<int>) {
    this.data = a;
  }
}

export class CtorArrayStrParam {
  public data: Array<string>;
  public constructor(a: Array<string>) {
    this.data = a;
  }
}
export class ImplInterfaceCtorCls {
  public constructor() {}
  public doSomething(): void {}
}

export class Ctor5IntParam {
  public a: int;
  public b: int;
  public c: int;
  public d: int;
  public e: int;
  public constructor(v1: int, v2: int, v3: int, v4: int, v5: int) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
    this.e = v5;
  }
}
export class ExtLenC {
  public a: string;
  public b: boolean;
  public constructor(s: string, f: boolean) {
    this.a = s;
    this.b = f;
  }
}
export class ExtArrC {
  public x: int;
  public y: string;
  public constructor(a: int, b: string) {
    this.x = a;
    this.y = b;
  }
}
export class ExtFinB {
  public flag: boolean;
  public constructor(v: boolean) {
    this.flag = v;
  }
}

export class ExtFinC {
  public a: string;
  public b: int;
  public c: boolean;
  public constructor(s: string, i: int, f: boolean) {
    this.a = s;
    this.b = i;
    this.c = f;
  }
}
export class ExtCmpH {
  public value: float;
  public constructor(v: float) {
    this.value = v;
  }
}
export class ExtSimpleC {
  public a: string;
  public b: string;
  public constructor(x: string, y: string) {
    this.a = x;
    this.b = y;
  }
}

export class ExtSimpleD {
  public a: int;
  public b: string;
  public c: boolean;
  public constructor(i: int, s: string, f: boolean) {
    this.a = i;
    this.b = s;
    this.c = f;
  }
}

export class ExtParamE {
  public a: int;
  public b: int;
  public c: int;
  public d: int;
  public constructor(w: int, x: int, y: int, z: int) {
    this.a = w;
    this.b = x;
    this.c = y;
    this.d = z;
  }
}
export class ExtCmpD {
  public flag: boolean;
  public constructor(f: boolean) {
    this.flag = f;
  }
}
export class ExtCmpG {
  public value: short;
  public constructor(v: short) {
    this.value = v;
  }
}
export class ExtOwnJ {
  public value: char;
  public constructor(v: char) {
    this.value = v;
  }
}
export class ExtParamD {
  public a: int;
  public b: string;
  public c: double;
  public constructor(i: int, s: string, d: double) {
    this.a = i;
    this.b = s;
    this.c = d;
  }
}
export class ExtParamF {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public constructor(v1: string, v2: int, v3: boolean, v4: double, v5: long) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
    this.e = v5;
  }
}
export class ExtNameD {
  public a: boolean;
  public b: int;
  public constructor(f: boolean, v: int) {
    this.a = f;
    this.b = v;
  }
}
export class ExtChainF {
  public value: char;
  public constructor(c: char) {
    this.value = c;
  }
}

export class ExtPcA {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public constructor(v1: string, v2: int, v3: boolean, v4: double, v5: long, v6: short, v7: byte) {
    this.a = v1;
    this.b = v2;
    this.c = v3;
    this.d = v4;
    this.e = v5;
    this.f = v6;
    this.g = v7;
  }
}

export class ExtPcB {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
  }
}

export class ExtPcC {
  public a: string;
  public b: int;
  public c: boolean;
  public d: double;
  public e: long;
  public f: short;
  public g: byte;
  public h: float;
  public i: char;
  public j: string;

  public constructor(strVal: string, intVal: int, boolVal: boolean, dblVal: double, lngVal: long, shtVal: short, bytVal: byte, fltVal: float, chrVal: char, strVal2: string) {
    this.a = strVal;
    this.b = intVal;
    this.c = boolVal;
    this.d = dblVal;
    this.e = lngVal;
    this.f = shtVal;
    this.g = bytVal;
    this.h = fltVal;
    this.i = chrVal;
    this.j = strVal2;
  }
}

export class TryCatchCtorCls {
  public result: int;
  public constructor(v: int) {
    try {
      this.result = 100 / v;
    } catch (e) {
      this.result = -1;
    }
  }
}

export class SwitchCtorCls {
  public code: int;
  public constructor(c: int) {
    switch (c) {
      case 1:
        this.code = 10;
        break;
      default:
        this.code = 0;
    }
  }
}

export class WhileCtorCls {
  public sum: int;
  public constructor(n: int) {
    let i: int = 0;
    let s: int = 0;
    while (i < n) {
      s = s + i;
      i++;
    }
    this.sum = s;
  }
}

export class DoWhileCtorCls {
  public count: int;
  public constructor(limit: int) {
    let i: int = 0;
    do {
      i++;
    } while (i < limit);
    this.count = i;
  }
}

export class TernaryCtorCls {
  public value: int;
  public constructor(flag: boolean) {
    this.value = flag ? 1 : 0;
  }
}

export class NoExplicitCtorCls {
  public constructor() {}
  public id: int = 42;
  public label: string = 'default';
}

export class DelegateBaseCls {
  public x: int;
  public constructor(v: int) {
    this.x = v;
  }
}

export class DelegateCtorCls extends DelegateBaseCls {
  public y: int;
  public constructor() {
    super(0);
    this.y = -1;
  }
  public constructor(v: int, w: int) {
    super(v);
    this.y = w;
  }
}
export class UnionCtorCls {
  public data: string;
  public constructor(a: int | string) {
    this.data = '' + a;
  }
}

export class ObjectParamCtorCls {
  public obj: Object;
  public constructor(o: Object) {
    this.obj = o;
  }
}

export class GenExtGenBaseCls<T> {
  public item: T;
  public constructor(v: T) {
    this.item = v;
  }
}

export class GenExtGenCls<T, U> extends GenExtGenBaseCls<T> {
  public extra: U;
  public constructor(v: T, e: U) {
    super(v);
    this.extra = e;
  }
}

export class TripleGenCls<A, B, C> {
  public first: A;
  public second: B;
  public third: C;
  public constructor(a: A, b: B, c: C) {
    this.first = a;
    this.second = b;
    this.third = c;
  }
}
export class ReadonlyFieldCls {
  public readonly id: int;
  public readonly name: string;
  public constructor(i: int, s: string) {
    this.id = i;
    this.name = s;
  }
}

export class StaticAccessCtorCls {
  public value: int;
  public constructor() {
    this.value = StaticAccessCtorCls.getDefault();
  }
  public static getDefault(): int {
    return 99;
  }
}

function helperFunc(): string {
  return 'helper_result';
}

export class HelperFnCtorCls {
  public data: string;
  public constructor() {
    this.data = helperFunc();
  }
}

export class LongStrCtorCls {
  public text: string;
  public constructor() {
    this.text = 'a very long string literal that exceeds typical short string length for testing purposes with getReturnType';
  }
}

export class CharEscapeCtorCls {
  public chars: string;
  public constructor() {
    this.chars = '\n\t\r\0';
  }
}
export class NestedInitCtorCls {
  public data: FixedArray<int>;
  public constructor() {
    this.data = [10, 20, 30, 40, 50];
  }
}

export class DefaultParamCtorCls {
  public a: int;
  public b: string;
  public constructor(v: int = 0, s: string = 'x') {
    this.a = v;
    this.b = s;
  }
}

export class StaticRefOtherCtorCls {
  public value: int;
  public constructor() {
    this.value = StaticAccessCtorCls.getDefault();
  }
}
export class ExtImplCls extends EmptyCls {
  public call(): void {}
  public constructor() {
    super();
  }
}

export class GenericIntfCls<T> {
  public data: T;
  public constructor(v: T) {
    this.data = v;
  }
  public get(): T {
    return this.data;
  }
}

export class GenericCharCtor<T> {
  public value: T;
  public constructor(v: T) {
    this.value = v;
  }
}

export class GenericByteArrCtor<T> {
  public value: T;
  public constructor(v: T) {
    this.value = v;
  }
}

export class LongInheritMid extends LongInheritBase {
  public constructor(v: long) {
    super(v);
  }
}
export class HasField {
  public constructor() {}
  value: number = 0;
}

export class ParentD {
  public constructor() {}
  foo(): number { return 1; }
}

export class HasGetter {
  public constructor() {}
  get val(): number { return 10; }
}

export class HasSetter {
  public constructor() {}
  set val(v: number) {}
}

export class HasStaticField {
  public constructor() {}
  static version: number = 1;
}

export class HasStaticMethod {
  public constructor() {}
  static util(): void {}
}

export class HasReadonly {
  public constructor() {}
  readonly id: number = 99;
}

export abstract class AbsClass {
  public constructor() {}
  abstract run(): void;
}

export class Over2Idx0 {
  public constructor(x?: number) {}
}

export class Over2Idx1 {
  public constructor(s?: string) {}
}
export class Over4Idx0 {
  public constructor(a?: number, b?: string, c?: boolean) {}
}
export class ImplRunnable implements Runnable {
  public constructor() {}
  run(): void {}
}

export abstract class BaseAbs {
  public constructor() {}
  abstract go(): void;
}

export class Concrete extends BaseAbs {
  public constructor() {}
  go(): void {}
}
export class DerivedC extends EmptyCls {
  extra: number = 0;
  public constructor() { super(); }
}
export class DerivedD extends ParentD {
  public constructor() {}
  foo(): number { return 2; }
}

export class GenOne<T> {
  public constructor(val: T) {}
}

export class GenTwo<T, U> {
  public constructor(a: T, b: U) {}
}

export class GenBound<T extends number> {
  public constructor(val: T) {}
}

export class GenMethod<T extends object> {
  public constructor() {}
  getVal(): object { return {}; }
}

export class GenDefault<T = string> {
  public constructor(v: T) {}
}

export class GenExt<T, U> extends GenOne<T> {
  public constructor(v: T, w: U) { super(v); }
}
export class ManyFields {
  public constructor() {}
  a: number = 1;
  b: number = 2;
  c: number = 3;
  d: number = 4;
  e: number = 5;
  f: number = 6;
  g: number = 7;
  h: number = 8;
  i: number = 9;
  j: number = 10;
}
export class BothGetSet {
  public constructor() {}
  private _v: number = 0;
  get v(): number { return this._v; }
  set v(val: number) { this._v = val; }
}
export class StaticOnly {
  public constructor() {}
  static MODE: number = 1;
  static run(): void {}
}

export class AfterParamType {
  public constructor(x: number, y: string) {}
}
export class IN_IntArrCtor {
  public constructor(arr: int[]) {}
}
export class Ext_ByteParam {
  data: byte = 0;
  public constructor(v: byte) {
    this.data = v;
  }
}

export class Ext_ShortParam {
  data: short = 0;
  public constructor(v: short) {
    this.data = v;
  }
}

export class Ext_LongParam {
  data: long = 0;
  public constructor(v: long) {
    this.data = v;
  }
}

export class Ext_FloatParam {
  data: double = 0.0;
  public constructor(v: float) {
    this.data = v;
  }
}

export class Ext_DoubleParam {
  data: double = 0.0;
  public constructor(v: double) {
    this.data = v;
  }
}

export class Ext_NestedArrayParam {
  val: Array<Array<int>> = [[]];
  public constructor(v: Array<Array<int>>) {
    this.val = v;
  }
}

export class Ext_HasObjectField {
  val: Object = new Object();
  public constructor(v: Object) {
    this.val = v;
  }
}

export class Ext_EmptyBodyCtor {
  data: int = 0;
  public constructor(x: int) {}
}

export class Ext_BranchBodyCtor {
  val: int = 0;
  public constructor(flag: boolean) {
    if (flag) {
      this.val = 1;
    } else {
      this.val = 2;
    }
  }
}

export class Ext_LoopBodyCtor {
  arr: Array<int> = [];
  public constructor(n: int) {
    for (let i: int = 0; i < n; i++) {
      this.arr.push(i);
    }
  }
}

export class Ext2_InitLogicCtor {
  val: int = 0;
  public constructor() {
    this.val = 42;
  }
}

export class Ext2_TryCatchBody {
  val: int = 0;
  public constructor(v: int) {
    try {
      this.val = v;
    } catch (e) {
      this.val = 0;
    }
  }
}

export class Ext2_SwitchBodyCtor {
  val: int = 0;
  public constructor(v: int) {
    switch (v) {
      case 0:
        this.val = 10;
        break;
      case 1:
        this.val = 20;
        break;
      default:
        this.val = 30;
    }
  }
}

export class Ext2_PrivateFieldCls {
  private secret: int = 0;
  public constructor(v: int) {
    this.secret = v;
  }
}
export class Ext2_GenBox<T> {
  data: T;
  public constructor(d: T) {
    this.data = d;
  }
}

export class Ext2_BoundedGeneric<T extends Object> {
  val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class Ext2_MixedPrivatePublic {
  private id: int = 0;
  public name: string = '';
  public constructor(id: int, name: string) {
    this.id = id;
    this.name = name;
  }
}

export class Ext2_DerivedSuper extends Base {
  extra: string = '';
  public constructor(x: int, s: string) {
    super(x);
    this.extra = s;
  }
}

export class Ext2_ThrowBodyCtor {
  val: int = 0;
  public constructor(v: int) {
    this.val = v;
    throw new Error('forced');
  }
}

export class Ext2_NestedIfElseCtor {
  val: int = 0;
  public constructor(a: int, b: int) {
    if (a > 0) {
      if (b > 0) {
        this.val = a + b;
      } else {
        this.val = a;
      }
    } else {
      this.val = b;
    }
  }
}

export class Ext2_GetterMethod {
  private _val: int = 0;
  get value(): int {
    return this._val;
  }
  dbl(): int {
    return this._val * 2;
  }
  public constructor(v: int) {
    this._val = v;
  }
}

export class Ext2_AllNumericTypes {
  public constructor() {}
  a: int = 0;
  b: long = 0;
  c: double = 0.0;
  d: double = 0.0;
  e: byte = 0;
  f: short = 0;
}

export class Ext2_ManyFields {
  public constructor() {}
  f0: int = 0; f1: int = 0; f2: int = 0; f3: int = 0; f4: int = 0;
  f5: int = 0; f6: int = 0; f7: int = 0; f8: int = 0; f9: int = 0;
  f10: int = 0; f11: int = 0; f12: int = 0; f13: int = 0; f14: int = 0;
  f15: int = 0; f16: int = 0; f17: int = 0; f18: int = 0; f19: int = 0;
  f20: int = 0; f21: int = 0; f22: int = 0; f23: int = 0; f24: int = 0;
}

export class Ext2_StaticInstanceField {
  static count: int = 0;
  index: int = 0;
  public constructor(idx: int) {
    this.index = idx;
  }
}

export class Ext3_TwoGeneric<A, B> {
  public constructor(a: A, b: B) {}
}
export class Ext3_AllDefaults {
  public constructor(a: int = 1) {}
}
export interface Ext3_Iface {
  foo(): int;
}

export class Ext3_ImplIface implements Ext3_Iface {
  public constructor() {}
  foo(): int {
    return 42;
  }
}

export class Ext4_BaseChar {
  val: char = c'a';
  public constructor(v: char) {
    this.val = v;
  }
}

export class Ext4_BaseFixedArr {
  val: FixedArray<int>;
  public constructor(v: FixedArray<int>) {
    this.val = v;
  }
}

export class Ext4_GenChar<T> {
  val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class Ext4_GenFixedArr<T> {
  val: T;
  public constructor(v: T) {
    this.val = v;
  }
}
export class Ext4_DerivedChar extends Ext4_BaseChar {
  extra: string = "";
  public constructor(v: char, s: string) {
    super(v);
    this.extra = s;
  }
}
export class Ext4_DerivedFixedArr extends Ext4_BaseFixedArr {
  extra: string = "";
  public constructor(v: FixedArray<int>, s: string) {
    super(v);
    this.extra = s;
  }
}

export interface Ext4_CharIface {
  getVal(): char;
}

export class Ext4_CharImpl implements Ext4_CharIface {
  val: char = c'z';
  public constructor(v: char) {
    this.val = v;
  }
  getVal(): char {
    return this.val;
  }
}

export interface Ext4_FixedArrIface {
  getVal(): FixedArray<int>;
}

export class Ext4_FixedArrImpl implements Ext4_FixedArrIface {
  val: FixedArray<int>;
  public constructor(v: FixedArray<int>) {
    this.val = v;
  }
  getVal(): FixedArray<int> {
    return this.val;
  }
}

export class Ext4_FixedArrIntMix {
  a: FixedArray<int>;
  b: int = 0;
  public constructor(a: FixedArray<int>, b: int) {
    this.a = a;
    this.b = b;
  }
}

export class Ext4_BoundedGenChar<T extends Object> {
  val: T;
  public constructor(v: T) {
    this.val = v;
  }
}

export class NoModCtor {
  public constructor() {}
  id: int = 1;
}

export class DefaultCtor {
  label: string = "d";
  public constructor() {}
}

export class PublicCtorEmpty {
  tag: string = "pub";
  public constructor() {}
}

export class PrivateCtorEmpty {
  key: int = 0;
  private constructor() {}
  static create(): PrivateCtorEmpty {
    return new PrivateCtorEmpty();
  }
}

export class ProtectedCtorEmpty {
  flag: boolean = false;
  protected constructor() {}
  static create(): ProtectedCtorEmpty {
    return new ProtectedCtorEmpty();
  }
}

export class PublicCtorIntParam {
  value: int = 0;
  public constructor(v: int) {
    this.value = v;
  }
}

export class PrivateCtorIntParam {
  data: int = 0;
  private constructor(v: int) {
    this.data = v;
  }
  static create(v: int): PrivateCtorIntParam {
    return new PrivateCtorIntParam(v);
  }
}

export class PublicCtorTwoParams {
  a: int = 0;
  b: string = "";
  public constructor(x: int, y: string) {
    this.a = x;
    this.b = y;
  }
}

export class PublicMixedParams {
  a: int = 0;
  b: string = "";
  c: boolean = false;
  public constructor(x: int, y: string, z: boolean) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
}

export class PrivateMixedParams {
  a: int = 0;
  b: string = "";
  c: boolean = false;
  private constructor(x: int, y: string, z: boolean) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
  static create(x: int, y: string, z: boolean): PrivateMixedParams {
    return new PrivateMixedParams(x, y, z);
  }
}

export class PublicCtorWithDefault {
  val: int = 0;
  public constructor(v: int = 42) {
    this.val = v;
  }
}

export class PublicStrCtor {
  val: string = "";
  public constructor(v: string) {
    this.val = v;
  }
}

export class PrivateStrCtor {
  val: string = "";
  private constructor(v: string) {
    this.val = v;
  }
  static create(v: string): PrivateStrCtor {
    return new PrivateStrCtor(v);
  }
}

export class PublicBoolCtor {
  val: boolean = false;
  public constructor(v: boolean) {
    this.val = v;
  }
}

export class PrivateBoolCtor {
  val: boolean = false;
  private constructor(v: boolean) {
    this.val = v;
  }
  static create(v: boolean): PrivateBoolCtor {
    return new PrivateBoolCtor(v);
  }
}

export class PublicArrCtor {
  val: int[] = [];
  public constructor(v: int[]) {
    this.val = v;
  }
}

export class PrivateArrCtor {
  val: int[] = [];
  private constructor(v: int[]) {
    this.val = v;
  }
  static create(v: int[]): PrivateArrCtor {
    return new PrivateArrCtor(v);
  }
}

export class ParentBase {
  id: int = 0;
  public constructor() {}
}

export class ChildPublicCtor extends ParentBase {
  name: string = "c";
  public constructor() {
    super();
  }
}

export class ChildPrivateCtor extends ParentBase {
  name: string = "c-priv";
  private constructor() {
    super();
  }
  static create(): ChildPrivateCtor {
    return new ChildPrivateCtor();
  }
}

export class ChildProtectedCtor extends ParentBase {
  name: string = "c-prot";
  protected constructor() {
    super();
  }
  static create(): ChildProtectedCtor {
    return new ChildProtectedCtor();
  }
}

export class UtilityClass {
  static VERSION: string = "2.0";
  private constructor() {}
}

export class PublicOverloadedCtor {
  val: int = 0;
  public constructor(v?: int) {
    if (v !== undefined) {
      this.val = v;
    }
  }
}

export class PrivateOverloadedCtor {
  val: int = 0;
  private constructor(v?: int) {
    if (v !== undefined) {
      this.val = v;
    }
  }
  static create(): PrivateOverloadedCtor {
    return new PrivateOverloadedCtor();
  }
  static createWith(v: int): PrivateOverloadedCtor {
    return new PrivateOverloadedCtor(v);
  }
}

export class ThreeOverloadPublicCtor {
  sum: int = 0;
  public constructor(a?: int, b?: int) {
    if (a !== undefined && b !== undefined) {
      this.sum = a + b;
    } else if (a !== undefined) {
      this.sum = a;
    }
  }
}
export interface PubIfc {
  doStuff(): void;
}

export class PubIfcImpl implements PubIfc {
  public constructor() {}
  doStuff(): void {}
}

export class PubGen<T> {
  public constructor() {}
}

export class PubGenTwo<T, U> {
  public constructor() {}
}

export class DefGenNoCtor<T> {
  public constructor() {}
}

export class Pub12IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int, k: int, l: int) {}
}

export class Pub15IntExt {
  public constructor(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int, k: int, l: int, m: int, n: int, o: int) {}
}
export class TcPriv4 {
  private constructor(a: int, b: string) {}
}
export class Pub2IntDoubleExt {
  public constructor(a: int, b: double) {}
}

export class Pub2IntBoolExt {
  public constructor(a: int, b: boolean) {}
}
export class PubNullDefault {
  public constructor(a?: OrdRef) {}
}

export class PrivNullDefault {
  private constructor(a?: OrdRef) {}
  static create(): PrivNullDefault {
    return new PrivNullDefault();
  }
}

export class PrivEmptyStrDefault {
  private constructor(a: string = '') {}
  static create(): PrivEmptyStrDefault {
    return new PrivEmptyStrDefault();
  }
}

export class PrivUnicodeDefault {
  private constructor(a: string = '你好') {}
  static create(): PrivUnicodeDefault {
    return new PrivUnicodeDefault();
  }
}

export class PrivMinIntDefault {
  private constructor(a: int = -2147483648) {}
  static create(): PrivMinIntDefault {
    return new PrivMinIntDefault();
  }
}

export class PrivMaxIntDefault {
  private constructor(a: int = 2147483647) {}
  static create(): PrivMaxIntDefault {
    return new PrivMaxIntDefault();
  }
}

export class PrivHexDefault {
  private constructor(a: int = 255) {}
  static create(): PrivHexDefault {
    return new PrivHexDefault();
  }
}

export class PrivBinDefault {
  private constructor(a: int = 10) {}
  static create(): PrivBinDefault {
    return new PrivBinDefault();
  }
}
export class TcPub13<T> {
  public constructor() {}
}

export class TcPub14<T> {
  public constructor(val: T) {}
}

export class TcPub15<K, V> {
  public constructor(k: K, v: V) {}
}
export class TcGenPub<T> {
  public constructor() {}
}

export class TcGapNameGen<T> {
  public constructor() {}
}

export interface TcGapIfce {
  identify(): string;
}

export class TcGapIfcPub implements TcGapIfce {
  public constructor() {}
  identify(): string { return "TcGapIfcPub"; }
}

export class TcGapIfcProt implements TcGapIfce {
  protected constructor() {}
  identify(): string { return "TcGapIfcProt"; }
}

export class TcGapGenCharArg<T> {
  public constructor() {}
}

export class IsPublicGeneric<T> {
  public constructor() {}
}

export class IsPublicGenericParam<T> {
  public constructor(t: T) {}
}

export class IsPublicGenericBound<T extends Object> {
  public constructor(t: T) {}
}

export class IsPrivateGenericParam<T> {
  private constructor(t: T) {}
  public static create<T>(t: T): IsPrivateGenericParam<T> { return new IsPrivateGenericParam<T>(t); }
}

export interface IsPublicTestIfc {
  foo(): void;
}

export class IsPublicImplIfc implements IsPublicTestIfc {
  public constructor() {}
  foo(): void {}
}
export class IP_Ext_GenCls<T extends Class> {
  public constructor(t: T) {}
}

export class IP_Ext_GenBase<T> {
  public constructor(t: T) {}
}

export class IP_Ext_DerivGen extends IP_Ext_GenBase<int> {
  public constructor() { super(0); }
}
export class IP2_121_GenTUPub<T, U> { public constructor(t: T, u: U) {} }

export class IP2_122_GenTCtor<T extends reflect.Constructor> { public constructor(t: T) {} }
export class ParentWithParam {
  public constructor(a: int) {}
}




export class LongInheritBase {
  public value: long;
  public constructor(v: long) {
    this.value = v;
  }
}










export { FieldValue, Runnable, EmptyCls, StaticField, StaticFieldImpl, ReflectClass, createReflectClass,
  PLACEHOLDER_PASSWORD, PLACEHOLDER_TOKEN, PLACEHOLDER_API_KEY, PLACEHOLDER_SSN,
  PLACEHOLDER_CARD_NUMBER, PLACEHOLDER_CVV, PLACEHOLDER_USERNAME, PLACEHOLDER_PATIENT_NAME,
  PLACEHOLDER_DIAGNOSIS };

export default class Utils {
  /** Module prefix for ClassOfCallerTest user types (full FQN = prefix + "." + simpleName). */
  static classOfCallerModulePrefix(): string {
    return "entry.src.main.src.test.class.ClassOfCallerTest.test";
  }

  /**
   * Copy FixedArray into std.core.Array. Runtime cannot cast FixedArray<T> to Array<T>.
   */
  static fixedArrayToArray<T>(raw: FixedArray<T>): Array<T> {
    const out: Array<T> = [];
    for (let i = 0; i < raw.length; i++) {
      out.push(raw[i]);
    }
    return out;
  }

  static findStaticMethodByName(
    methods: FixedArray<reflect.StaticMethod>,
    name: string
  ): reflect.StaticMethod | undefined {
    for (let i = 0; i < methods.length; i++) {
      if (methods[i].getName() === name) {
        return methods[i];
      }
    }
    return undefined;
  }

  /** Reflection lookups may return undefined; some APIs use null (spec/types.md: void ≡ undefined). */
  static isAbsentOptional<T>(v: T | undefined | null): boolean {
    return v === undefined || v === null;
  }

  /** Class-typed reflection optional (getSuper, getFixedArrayComponentType, ofCaller, etc.). */
  static isAbsentReflectOptional(v: Class | undefined | null): boolean {
    return Utils.isAbsentOptional(v);
  }

  /** Class.from<T>() scalar getName() FQN (boxed class names). */
  static scalarClassFromBooleanFqn(): string { return "std.core.Boolean"; }
  static scalarClassFromByteFqn(): string { return "std.core.Byte"; }
  static scalarClassFromCharFqn(): string { return "std.core.Char"; }
  static scalarClassFromShortFqn(): string { return "std.core.Short"; }
  static scalarClassFromIntFqn(): string { return "std.core.Int"; }
  static scalarClassFromLongFqn(): string { return "std.core.Long"; }
  static scalarClassFromFloatFqn(): string { return "std.core.Float"; }
  static scalarClassFromDoubleFqn(): string { return "std.core.Double"; }
  static scalarClassFromNumberFqn(): string { return "std.core.Double"; }
  static scalarClassFromVoidFqn(): string { return "std.core.Object"; }

  /** getParameterType / getParameterTypes primitive spellings. */
  static scalarParameterI8Fqn(): string { return "i8"; }
  static scalarParameterI16Fqn(): string { return "i16"; }
  static scalarParameterI32Fqn(): string { return "i32"; }
  static scalarParameterI64Fqn(): string { return "i64"; }
  static scalarParameterF32Fqn(): string { return "f32"; }
  static scalarParameterF64Fqn(): string { return "f64"; }

  /** getFixedArrayComponentType / Class.from<FixedArray<T>> component Class.getName(). */
  static scalarReflectI8Fqn(): string { return "std.core.Byte"; }
  static scalarReflectI16Fqn(): string { return "std.core.Short"; }
  static scalarReflectI32Fqn(): string { return "std.core.Int"; }
  static scalarReflectI64Fqn(): string { return "std.core.Long"; }
  static scalarReflectF32Fqn(): string { return "std.core.Float"; }
  static scalarReflectF64Fqn(): string { return "std.core.Double"; }
  static scalarFixedArrayBooleanFqn(): string { return "std.core.Boolean"; }

  /** Class.of(FixedArray<T> instance).getName() for scalar T (e.g. std.core.Int[]). */
  static scalarReflectI32FixedArrayInstanceFqn(): string {
    return `${Utils.scalarReflectI32Fqn()}[]`;
  }

  /** ReflectionUtils057-style FixedArray<T> type info string. */
  static fixedArrayTypeInfoFqn(componentFqn: string): string {
    return `FixedArray<${componentFqn}>`;
  }

  /** Class.PRIMITIVE_* getName() spellings. */
  static scalarPrimitiveBooleanFqn(): string { return "u1"; }
  static scalarPrimitiveVoidFqn(): string { return "void"; }

  static mindMapItSuffix(seq: int): string {
    if (seq < 10) {
      return `00${seq}`;
    }
    if (seq < 100) {
      return `0${seq}`;
    }
    return `${seq}`;
  }

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int | PromiseLike<int>) => void, reject: (value: Error) => void) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}
