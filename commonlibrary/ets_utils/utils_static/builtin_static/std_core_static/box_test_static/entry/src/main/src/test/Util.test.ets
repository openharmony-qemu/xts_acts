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


export default class Utils{
  static async msSleep(count: int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

export class EmptyClass001 {}

export interface Person002 {
  name: string;
  age: int;
}

export class Holder013<U> {
  val: U | null = null;
  constructor(v: U) {
    this.val = v;
  }
}

export class SelfRefNode014 {
  next: SelfRefNode014 | null = null;
  value: int = 0;
  constructor() {}
}

export enum Color015 {
  RED = 0,
  GREEN = 1,
  BLUE = 2,
  YELLOW = 3
}

export class SignedData016 {}

export class Success016 extends SignedData016 {
  value: int = 0;
  constructor(v: int) {
    this.value = v;
  }
}

export class Failure016 extends SignedData016 {
  message: string = "";
  constructor(m: string) {
    this.message = m;
  }
}

export type IntSupplier017 = () => int;
export type BiFunction018 = (a: int, b: string) => boolean;
export type VoidFunction019 = () => void;
export type IntPredicate020 = (x: int) => boolean;
export type StringComparator021 = (a: string, b: string) => int;
export type BoxFactory022 = () => Box<int>;
export type BoxProcessor023 = (box: Box<string>) => int;

export class BigData024 {
  f1: int = 0;
  f2: int = 0;
  f3: int = 0;
  f4: int = 0;
  f5: int = 0;
}

export class Teacher025 {
  name: string = "";
  age: int = 0;
  subject: string = "";
  constructor(n: string, a: int, s: string) {
    this.name = n;
    this.age = a;
    this.subject = s;
  }
}

export class Singleton026 {
  private static instance: Singleton026 | null = null;
  private constructor() {}
  public static getInstance(): Singleton026 {
    let inst: Singleton026 | null = Singleton026.instance;
    if (inst === null) {
      inst = new Singleton026();
      Singleton026.instance = inst;
    }
    return inst;
  }
}

export class Logger027 {
  tag: string = "";
  constructor(t: string) {
    this.tag = t;
  }
}

export interface Config028 {
  host: string;
  port: int;
}

export type NullableInt029 = int | null;
export type NullableString030 = string | null;
export type IntOrString031 = int | string;
export type MultiUnion032 = int | string | boolean;
export type BoxIntArray034 = Box<int>[];
export type StringBoxIntMap035 = Map<string, Box<int>>;
export type BoxStringSet036 = Set<Box<string>>;
export type BoxIntArray037 = Array<Box<int>>;
export type NestedBox038 = Box<Box<int>>;
export interface MarkerInterface039 {}

export type ReadonlyIntArray040 = readonly int[];
export type IntStringTuple041 = [int, string];
export interface Person042 {
  name: string;
  age: int;
}

export const CHAR_NUL: char = c'\0';
export const CHAR_BEL: char = c'\x07';
export const CHAR_BS: char = c'\b';
export const CHAR_TAB: char = c'\t';
export const CHAR_LF: char = c'\n';
export const CHAR_VT: char = c'\x0B';
export const CHAR_FF: char = c'\f';
export const CHAR_CR: char = c'\r';
export const CHAR_EXCLAMATION: char = c'!';
export const CHAR_DIGIT_0: char = c'0';
export const CHAR_DIGIT_9: char = c'9';
export const CHAR_UPPER_A: char = c'A';
export const CHAR_UPPER_Z: char = c'Z';
export const CHAR_LOWER_A: char = c'a';
export const CHAR_LOWER_B: char = c'b';
export const CHAR_LOWER_X: char = c'x';
export const CHAR_LOWER_Y: char = c'y';
export const CHAR_LOWER_Z: char = c'z';
export const CHAR_TILDE: char = c'~';
export const CHAR_DEL: char = c'\x7F';
export const CHAR_COPYRIGHT: char = c'©';
export const CHAR_REGISTERED: char = c'®';
export const CHAR_PLUS_MINUS: char = c'±';
export const CHAR_A_GRAVE: char = c'À';
export const CHAR_N_TILDE: char = c'ñ';
export const CHAR_CJK_ZHONG: char = c'中';
export const CHAR_CJK_GUO: char = c'国';
export const CHAR_CJK_HAN: char = c'汉';
export const CHAR_CJK_ZI: char = c'字';
export const CHAR_CJK_CE: char = c'测';
export const CHAR_CJK_SHI: char = c'试';
export const CHAR_HANGUL_GA: char = c'가';
export const CHAR_HANGUL_HAN: char = c'한';
export const CHAR_HANGUL_HIH: char = c'힣';
export const CHAR_BMP_MAX: char = c'￿';

export class Animal { type: string = "animal"; }
export class Dog extends Animal { breed: string = "dog"; }
export class Point { x: number = 0; y: number = 0; }
export interface Named { getName(): string; }
export class AppError extends Error { erroCode: int = 0; constructor(msg: string, code: int) { super(msg); this.erroCode = code; } }
export class Person { name: string = ""; constructor(name: string) { this.name = name; } }

export class A {}

export interface ABC {
  a: number;
  b: number;
  c: number;
}

export interface AandB extends IdObj, NamedObj {}

export interface AddNumObj {
  add(x: number, y: number): number;
}

export class AdvancedCharBoxWrapper {
  box: CharBox = new CharBox(c'A');
  getChar(): char { return this.box.get(); }
  setChar(c: char): void { this.box.set(c); }
  isUpperCase(): boolean {
    let code: int = this.box.get().toInt();
    return code >= c'A'.toInt() && code <= c'Z'.toInt();
  }
}

export class AnimalBase {}

export class B extends A {}

export class Base {
  baseVal: number = 1;
}

export class Bird implements Flyable {
  fly(): void {}
}

export class BoxManager {
  box: BooleanBox = new BooleanBox(false);

  toggle(): void {
    this.box.set(!this.box.get());
  }

  getStatus(): boolean {
    return this.box.get();
  }
}

export class Calc {
  add(a: number, b: number): number {
    return a + b;
  }
}

export class Calculator {
  add(a: number, b: number): number {
    return a + b;
  }
}

export class Cat extends Animal {
  sound: string = 'meow';
}

export class CharBoxWrapper {
  box: CharBox = new CharBox(c'H');
  getValue(): char { return this.box.get(); }
  setValue(val: char): void { this.box.set(val); }
}

export class Child extends Parent {}

export class CjkCharBoxWrapper {
  box: CharBox = new CharBox(c'包');
  getCjk(): char { return this.box.get(); }
  setCjk(v: char): void { this.box.set(v); }
}

export interface ConcatFn {
  concat(a: string, b: string): string;
}

export class Counter {
  count: number = 0;

  increment(): void {
    this.count++;
  }
}

export class CustomBox<T> {
  value: T;

  constructor(v: T) {
    this.value = v;
  }
}

export class Data {
  value: number = 0;
}

export class DataVal {
  val: number = 0;
}

export interface DeepLevel1 {
  level2: NamedObj;
}

export interface DeepObj {
  deep: NamedObj;
}

export class Derived extends Base {
  derivedVal: number = 2;
}

export class DogBase extends AnimalBase {}

export class DoubleBoxWrapper {
  box: DoubleBox;

  constructor(initVal: double = 0.0) {
    this.box = new DoubleBox(initVal);
  }

  getValue(): double {
    return this.box.get();
  }

  setValue(val: double): void {
    this.box.set(val);
  }
}

export interface Executable {
  execute(): void;
}

export interface FlagRecord {
  flag: Box<boolean>;
}

export class FloatBoxWrapper {
  box: FloatBox;

  constructor(initVal: float = (0.0).toFloat()) {
    this.box = new FloatBox(initVal);
  }

  getValue(): float {
    return this.box.get();
  }

  setValue(val: float): void {
    this.box.set(val);
  }
}

export interface Flyable {
  fly(): void;
}

export interface FnNumNumObj {
  fn(x: number): number;
}

export interface HasGetName {
  getName: () => string;
}

export interface IdAndNameType extends IdObj, NamedObj {}

export interface IdObj {
  id: number;
}

export class IntBoxCounter {
  box: IntBox = new IntBox(0);

  increment(): void {
    this.box.set(this.box.get() + 1);
  }

  decrement(): void {
    this.box.set(this.box.get() - 1);
  }

  getCount(): int {
    return this.box.get();
  }
}

export class IntBoxWrapper {
  box: IntBox = new IntBox(0);

  getValue(): int {
    return this.box.get();
  }

  setValue(val: int): void {
    this.box.set(val);
  }
}

export interface L1 {
  l1: L2;
}

export interface L2 {
  l2: NamedObj;
}

export class LongBoxWrapper {
  box: LongBox = new LongBox(0);

  getValue(): long {
    return this.box.get();
  }

  setValue(val: long): void {
    this.box.set(val);
  }
}

export class LongBoxWrapper3333 {
  box: LongBox = new LongBox(3333333333);

  getValue(): long {
    return this.box.get();
  }

  setValue(val: long): void {
    this.box.set(val);
  }
}

export interface MatrixObj {
  matrix: number[][];
}

export class MyClass {}

export interface NameAndAge extends NamedObj, IdObj {}

export interface NameDate {
  name: string;
  date: Date;
}

export interface NameTags {
  name: string;
  tags: string[];
}

export interface NamedObj {
  name: string;
}

export class NestedCharBox {
  inner: CharBox = new CharBox(c'S');
  getNested(): char { return this.inner.get(); }
  setNested(v: char): void { this.inner.set(v); }
}

export class NestedLongBox {
  inner: LongBox = new LongBox(4646464646);

  getNested(): long {
    return this.inner.get();
  }

  setNested(v: long): void {
    this.inner.set(v);
  }
}

export interface OldNewObj {
  old: string;
  newVal: string
}

export interface OptionalAB {
  a?: string;
  b?: number;
}

export interface OuterInner {
  outer: NamedObj;
}

export class Parent {}

export class BoxPerson implements Named {
  getName(): string {
    return 'Alice';
  }
}

export interface PredicateFn {
  isPositive(n: number): boolean;
}

export interface Processor {
  process(items: number[]): number[];
}

export interface SetVoidObj {
  set(val: number): void;
}

export class ShortBoxWrapper {
  box: ShortBox = new ShortBox(3300);

  getValue(): short {
    return this.box.get();
  }

  setValue(val: short): void {
    this.box.set(val);
  }
}

export class Singleton {
  static instance: Singleton = new Singleton();
  id: number = 1;
}

export interface Transformer {
  transform(input: number): number;
}

export class User implements Named {
  getName(): string {
    return 'Alice';
  }
}

export interface ValGetVal {
  val: number;
  getVal: () => number;
}

export class ValidatingWrapper {
  box: CharBox = new CharBox(c'X');
  getAndValidate(expected: char): boolean {
    return this.box.get() === expected;
  }
  setAndConfirm(val: char): boolean {
    this.box.set(val);
    return this.box.get() === val;
  }
}

export interface Validator {
  validate(s: string): boolean;
}

export interface XY {
  x: number;
  y: number;
}

export interface Xcoord {
  x: number;
}

export interface Ycoord {
  y: number;
}

export interface Zcoord {
  z: number;
}

export interface XYZcoords extends Xcoord, Ycoord, Zcoord {}

export interface AObj {
  a: BObj;
}

export interface BObj {
  b: NamedObj;
}

export interface KeyValue {
  key: string;
}

export interface DeepL3 {
  l3: string;
}

export interface DeepL2 {
  l2: DeepL3;
}

export interface DeepL1 {
  l1: DeepL2;
}

export interface NameAndAgeWithAge {
  name: string;
  age: number;
}

export interface AandBWithValues {
  a: number;
  b: string;
}

export interface XYObj {
  x: number;
  y: number;
}

export interface ABObj {
  a?: number;
  b?: number;
}

export interface KeyVal {
  key: string;
}

export interface UserAge {
  user: string;
  age: number;
}

export interface InnerValue {
  inner: string;
}

export interface OuterInnerWithInner {
  outer: InnerValue;
}

export interface NestedStringLevelB {
  c: string;
}

export interface NestedStringLevelA {
  b: NestedStringLevelB;
}

export interface NestedStringObject {
  a: NestedStringLevelA;
}

export interface DeepNestedValue {
  nested: string;
}

export interface DeepNestedObject {
  deep: DeepNestedValue;
}

export class NamedPerson implements Named {
  getName(): string {
    return 'Alice';
  }
}

export function toggleLongBoxSign(box: LongBox): long {
  box.set(box.get() * -1);
  return box.get();
}

export function longBoxAddOne(v: long): long {
  return v + 1;
}

export function longBoxMultiplyByTwo(v: long): long {
  return v * 2;
}

export function longBoxAddFour(v: long): long {
  return v + 4;
}

export function longBoxComputeValue(v: long): long {
  return longBoxMultiplyByTwo(longBoxAddFour(v));
}

export function shortBoxAddOne(v: int): int {
  return v + 1;
}

export function shortBoxMultiplyByTwo(v: int): int {
  return v * 2;
}
