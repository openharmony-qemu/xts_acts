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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../../hypium/index';
import Utils from '../../Util.test';

class Inv02Calculator {
  add(a: number, b: number): number {
    return a + b;
  }
  multiply(a: number, b: number): number {
    return a * b;
  }
  divide(a: number, b: number): number {
    return a / b;
  }
  subtract(a: number, b: number): number {
    return a - b;
  }
  mod(a: number, b: number): number {
    return a % b;
  }
  pow(a: number, b: number): number {
    return a ** b;
  }
  decrement(a: number): number {
    return a - 1;
  }
  increment(a: number): number {
    return a + 1;
  }
  isZero(v: number): boolean {
    return v === 0;
  }
  isPositive(v: number): boolean {
    return v > 0;
  }
  getVersion(): string {
    return '1.0';
  }
  addToField(v: number): void {}
  getField(): number {
    return 0;
  }
  getSelf(): Inv02Calculator {
    return this;
  }
  getMethod(name: string): Method {
    return (Type.from<Inv02Calculator>() as ClassType).getMethodByName(name);
  }
  static addStatic(a: number, b: number): number {
    return a + b;
  }
  static getVersion(): string {
    return '1.0';
  }
  static create(): Inv02Calculator {
    return new Inv02Calculator();
  }
  static resetStatic(): void {}
}
class Inv02Person {
  private name: string = 'Default';
  private age: number = 0;
  private addr: Inv02Address | null = null;
  getName(): string {
    return this.name;
  }
  setName(n: string): void {
    this.name = n;
  }
  getAge(): number {
    return this.age;
  }
  setAge(a: number): void {
    this.age = a;
  }
  isAdult(): boolean {
    return this.age >= 18;
  }
  greet(): string {
    return 'Hello, ' + this.name;
  }
  toString(): string {
    return 'Person(' + this.name + ',' + this.age.toString() + ')';
  }
  hashCode(): number {
    return this.name.length;
  }
  equals(other: Inv02Person): boolean {
    return this.name === other.name;
  }
  setEnabled(v: boolean): void {}
  setAddress(a: Inv02Address): void {
    this.addr = a;
  }
  getAddress(): Inv02Address | null {
    return this.addr;
  }
  getClass(): Object {
    return Type.from<Inv02Person>();
  }
}
class Inv02DataHolder {
  private value: number = 0;
  private enabled: boolean = false;
  setValue(v: number): void {
    this.value = v;
  }
  getValue(): number {
    return this.value;
  }
  setEnabled(e: boolean): void {
    this.enabled = e;
  }
  clear(): void {
    this.value = 0;
  }
  isEnabled(): boolean {
    return this.enabled;
  }
  clone(): Inv02DataHolder {
    let h = new Inv02DataHolder();
    h.value = this.value;
    return h;
  }
  copy(): Inv02DataHolder {
    return this.clone();
  }
  getNullable(): string | null {
    return null;
  }
  setNullable(v: string): void {}
  getDefault(): Inv02DataHolder {
    return new Inv02DataHolder();
  }
}
class Inv02ArrayList {
  private items: number[] = [];
  add(v: number): boolean {
    this.items.push(v);
    return true;
  }
  size(): number {
    return this.items.length;
  }
  isEmpty(): boolean {
    return this.items.length === 0;
  }
  get(index: int): number {
    return this.items[index];
  }
  toArray(): number[] {
    return this.items.slice();
  }
  remove(v: number): boolean {
    let idx = this.items.indexOf(v);
    if (idx >= 0) {
      this.items.splice(idx, 1);
    }
    return idx >= 0;
  }
  contains(v: number): boolean {
    return this.items.indexOf(v) >= 0;
  }
  indexOf(v: number): number {
    return this.items.indexOf(v);
  }
  lastIndexOf(v: number): number {
    return this.items.lastIndexOf(v);
  }
  subList(start: number, end: number): number[] {
    return this.items.slice(start.toInt(), end.toInt());
  }
  iterator(): Inv02ArrayListIterator {
    return new Inv02ArrayListIterator(this.items);
  }
}
class Inv02ArrayListIterator {
  private items: number[];
  private pos: number = 0;
  constructor(items: number[]) {
    this.items = items;
  }
  hasNext(): boolean {
    return this.pos < this.items.length;
  }
  next(): number {
    return this.items[this.pos.toInt()];
  }
}
class Inv02HashMap {
  private map: Map<string, string> = new Map<string, string>();
  put(k: string, v: string): void {
    this.map.set(k, v);
  }
  get(k: string): string | undefined {
    return this.map.get(k);
  }
  getOrDefault(k: string, d: string): string {
    let v = this.map.get(k);
    return v != undefined ? v : d;
  }
  values(): string[] {
    let r: string[] = [];
    this.map.forEach((v) => {
      r.push(v);
    });
    return r;
  }
  keySet(): string[] {
    let r: string[] = [];
    this.map.forEach((v, k) => {
      r.push(k);
    });
    return r;
  }
  size(): number {
    return this.map.size;
  }
}
class Inv02PersonBuilder {
  private n: string = '';
  private a: number = 0;
  setName(n: string): Inv02PersonBuilder {
    this.n = n;
    return this;
  }
  setAge(a: number): Inv02PersonBuilder {
    this.a = a;
    return this;
  }
  build(): Inv02Person {
    let p = new Inv02Person();
    p.setName(this.n);
    p.setAge(this.a);
    return p;
  }
}
class Inv02Address {
  private city: string = '';
  setCity(c: string): void {
    this.city = c;
  }
  getCity(): string {
    return this.city;
  }
}
class Inv04Calculator {
  add(a: number, b: number): number {
    return a + b;
  }
  multiply(a: number, b: number): number {
    return a * b;
  }
  subtract(a: number, b: number): number {
    return a - b;
  }
  divide(a: number, b: number): number {
    return a / b;
  }
  getVersion(): string {
    return '1.0';
  }
  addToField(v: number): void {
    this.field += v;
  }
  getField(): number {
    return this.field;
  }
  private field: number = 0;
  getMethod(name: string): Method {
    return (Type.from<Inv04Calculator>() as ClassType).getMethodByName(name);
  }
  static addStatic(a: number, b: number): number {
    return a + b;
  }
  static setStaticValue(v: number): void {}
  static getStaticValue(): number {
    return 0;
  }
  static addToStatic(v: number): void {}
  static resetStatic(): void {}
}
class Inv04Person {
  private name: string = 'Default';
  private age: number = 0;
  private addr: Inv04Address | null = null;
  getName(): string {
    return this.name;
  }
  setName(n: string): void {
    this.name = n;
  }
  getAge(): number {
    return this.age;
  }
  setAge(a: number): void {
    this.age = a;
  }
  addAge(a: number): void {
    this.age += a;
  }
  isAdult(): boolean {
    return this.age >= 18;
  }
  toString(): string {
    return 'Person(' + this.name + ',' + this.age.toString() + ')';
  }
  hashCode(): number {
    return this.name.length;
  }
  equals(other: Inv04Person): boolean {
    return this.name === other.name;
  }
  compareTo(other: Inv04Person): number {
    if (this.age > other.age) return 1;
    if (this.age < other.age) return -1;
    return 0;
  }
  deepCopy(): Inv04Person {
    let p = new Inv04Person();
    p.name = this.name;
    p.age = this.age;
    return p;
  }
  merge(other: Inv04Person): void {}
  setAddress(a: Inv04Address): void {
    this.addr = a;
  }
  getAddress(): Inv04Address | null {
    return this.addr;
  }
  getClass(): object {
    return Type.from<Inv04Person>();
  }
  setEnabled(v: boolean): void {}
}
class Inv04DataHolder {
  private value: number = 0;
  private closed: boolean = false;
  setValue(v: number): void {
    this.value = v;
  }
  getValue(): number {
    return this.value;
  }
  clear(): void {
    this.value = 0;
  }
  close(): void {
    this.closed = true;
  }
  isClosed(): boolean {
    return this.closed;
  }
  reset(): void {
    this.value = 0;
  }
  copy(): Inv04DataHolder {
    let h = new Inv04DataHolder();
    h.value = this.value;
    return h;
  }
  initialize(d: string): void {}
  isInitialized(): boolean {
    return true;
  }
  concurrentWrite(): void {
    throw new Error('concurrent conflict');
  }
}
class Inv04Address {
  private city: string = '';
  setCity(c: string): void {
    this.city = c;
  }
  getCity(): string {
    return this.city;
  }
}
class Inv04Color {
  name(): string {
    return 'RED';
  }
  ordinal(): number {
    return 0;
  }
  toString(): string {
    return 'RED';
  }
  static valueOf(name: string): Inv04Color {
    return new Inv04Color();
  }
}
class Inv04ArrayListIterator {
  private items: number[];
  private pos: number = 0;
  constructor(items: number[]) {
    this.items = items;
  }
  hasNext(): boolean {
    return this.pos < this.items.length;
  }
  next(): number {
    return this.items[this.pos.toInt()];
  }
}
class Inv04ArrayList {
  private items: number[] = [];
  add(v: number): boolean {
    this.items.push(v);
    return true;
  }
  size(): number {
    return this.items.length;
  }
  get(index: number): number {
    return this.items[index.toInt()];
  }
  sort(): void {
    this.items.sort((a, b) => {
      if (a > b) return 1;
      if (a < b) return -1;
      return 0;
    });
  }
  remove(index: number): void {
    this.items.splice(index.toInt(), 1);
  }
  iterator(): Inv04ArrayListIterator {
    return new Inv04ArrayListIterator(this.items);
  }
  addAll(arr: number[]): void {
    for (let i = 0; i < arr.length; i++) {
      this.items.push(arr[i.toInt()]);
    }
  }
  clear(): void {
    this.items = [];
  }
  toString(): string {
    return '[' + this.items.join(', ') + ']';
  }
}
class Inv04LazyHolder {
  private data: string = '';
  private loaded: boolean = false;
  get(): string {
    if (!this.loaded) {
      this.data = 'lazy';
      this.loaded = true;
    }
    return this.data;
  }
}
class Inv04Integer {
  static valueOf(v: number): number {
    return v;
  }
  equals(other: number): boolean {
    return other === 42;
  }
}

export default function MethodInvoke02Test(): void {
  describe('MethodInvoke02Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0100
     * @tc.name testMethodInvokeAtTwo001
     * @tc.desc Verify invoke returns exact int value for add method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('add');
      let result = method.invoke(calc, [1, 2] as FixedArray<Object>);
      expect(result as number).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0200
     * @tc.name testMethodInvokeAtTwo002
     * @tc.desc Verify invoke returns negative value for add with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('add');
      let result = method.invoke(calc, [-5, 3] as FixedArray<Object>);
      expect(result as number).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0300
     * @tc.name testMethodInvokeAtTwo003
     * @tc.desc Verify invoke returns product for multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('multiply');
      let result = method.invoke(calc, [3, 4] as FixedArray<Object>);
      expect(result as number).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0400
     * @tc.name testMethodInvokeAtTwo004
     * @tc.desc Verify invoke returns float result for float add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('add');
      let result = method.invoke(calc, [1.5, 2.5] as FixedArray<Object>);
      expect(result as number).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0500
     * @tc.name testMethodInvokeAtTwo005
     * @tc.desc Verify invoke returns float for divide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('divide');
      let result = method.invoke(calc, [7.0, 2.0] as FixedArray<Object>);
      expect(result as number).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0600
     * @tc.name testMethodInvokeAtTwo006
     * @tc.desc Verify invoke returns mod result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('mod');
      let result = method.invoke(calc, [10, 3] as FixedArray<Object>);
      expect(result as number).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0700
     * @tc.name testMethodInvokeAtTwo007
     * @tc.desc Verify invoke returns pow result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('pow');
      let result = method.invoke(calc, [2, 10] as FixedArray<Object>);
      expect(result as number).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0800
     * @tc.name testMethodInvokeAtTwo008
     * @tc.desc Verify invoke returns decrement result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('decrement');
      let result = method.invoke(calc, [5] as FixedArray<Int>);
      expect(result as number).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_0900
     * @tc.name testMethodInvokeAtTwo009
     * @tc.desc Verify invoke returns subtract result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('subtract');
      let result = method.invoke(calc, [100, 1] as FixedArray<Object>);
      expect(result as number).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1000
     * @tc.name testMethodInvokeAtTwo010
     * @tc.desc Verify greet returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv02Person = new Inv02Person();
      let setNameM = (Type.from<Inv02Person>() as ClassType).getMethodByName('setName');
      setNameM.invoke(person, ['Bob'] as FixedArray<String>);
      let greetM = (Type.from<Inv02Person>() as ClassType).getMethodByName('greet');
      let result = greetM.invoke(person, [] as FixedArray<never>);
      expect(result as string).assertEqual('Hello, Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1100
     * @tc.name testMethodInvokeAtTwo011
     * @tc.desc Verify isAdult returns true for adult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv02Person = new Inv02Person();
      let setAgeM = (Type.from<Inv02Person>() as ClassType).getMethodByName('setAge');
      setAgeM.invoke(person, [20] as FixedArray<Int>);
      let isAdultM = (Type.from<Inv02Person>() as ClassType).getMethodByName('isAdult');
      let result = isAdultM.invoke(person, [] as FixedArray<never>);
      expect(result as Boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1200
     * @tc.name testMethodInvokeAtTwo012
     * @tc.desc Verify isAdult returns false for minor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv02Person = new Inv02Person();
      let setAgeM = (Type.from<Inv02Person>() as ClassType).getMethodByName('setAge');
      setAgeM.invoke(person, [15] as FixedArray<Int>);
      let isAdultM = (Type.from<Inv02Person>() as ClassType).getMethodByName('isAdult');
      let result = isAdultM.invoke(person, [] as FixedArray<never>);
      expect(result as Boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1300
     * @tc.name testMethodInvokeAtTwo013
     * @tc.desc Verify contains returns true for existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [10] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('contains');
      let result = method.invoke(list, [10] as FixedArray<Int>);
      expect(result as Boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1400
     * @tc.name testMethodInvokeAtTwo014
     * @tc.desc Verify contains returns false for non-existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [10] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('contains');
      let result = method.invoke(list, [20] as FixedArray<Int>);
      expect(result as Boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1500
     * @tc.name testMethodInvokeAtTwo015
     * @tc.desc Verify hasNext iterator returns false for empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let iterM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('iterator');
      let iter = iterM.invoke(list, [] as FixedArray<never>);
      let hasNextM = (Type.from<Inv02ArrayListIterator>() as ClassType).getMethodByName('hasNext');
      let result = hasNextM.invoke(iter, [] as FixedArray<never>);
      expect(result as Boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1600
     * @tc.name testMethodInvokeAtTwo016
     * @tc.desc Verify clone preserves value after invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Inv02DataHolder = new Inv02DataHolder();
      let setM = (Type.from<Inv02DataHolder>() as ClassType).getMethodByName('setValue');
      setM.invoke(holder, [42] as FixedArray<Int>);
      let cloneM = (Type.from<Inv02DataHolder>() as ClassType).getMethodByName('clone');
      let cloned = cloneM.invoke(holder, [] as FixedArray<never>);
      expect((cloned as Inv02DataHolder).getValue()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1700
     * @tc.name testMethodInvokeAtTwo017
     * @tc.desc Verify getClass returns the ClassType object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv02Person = new Inv02Person();
      let method = (Type.from<Inv02Person>() as ClassType).getMethodByName('getClass');
      let result = method.invoke(person, [] as FixedArray<never>);
      expect(result as Object)
        .not()
        .assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1800
     * @tc.name testMethodInvokeAtTwo018
     * @tc.desc Verify toArray returns array with all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [10] as FixedArray<Int>);
      addM.invoke(list, [20] as FixedArray<Int>);
      let toArrM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('toArray');
      let result = toArrM.invoke(list, [] as FixedArray<never>);
      expect((result as number[]).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_1900
     * @tc.name testMethodInvokeAtTwo019
     * @tc.desc Verify Builder returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let builder: Inv02PersonBuilder = new Inv02PersonBuilder();
      let method = (Type.from<Inv02PersonBuilder>() as ClassType).getMethodByName('setName');
      let result = method.invoke(builder, ['Alice'] as FixedArray<String>);
      expect(result as Object).assertEqual(builder as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2000
     * @tc.name testMethodInvokeAtTwo020
     * @tc.desc Verify getMethod returns Method object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('getMethod');
      let result = method.invoke(calc, ['add'] as FixedArray<String>);
      expect(result as Object)
        .not()
        .assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2100
     * @tc.name testMethodInvokeAtTwo021
     * @tc.desc Verify getAddress returns same address
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv02Person = new Inv02Person();
      let addr: Inv02Address = new Inv02Address();
      let setAddrM = (Type.from<Inv02Person>() as ClassType).getMethodByName('setAddress');
      setAddrM.invoke(person, [addr] as FixedArray<Object>);
      let getAddrM = (Type.from<Inv02Person>() as ClassType).getMethodByName('getAddress');
      let result = getAddrM.invoke(person, [] as FixedArray<never>);
      expect(result as Object).assertEqual(addr as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2200
     * @tc.name testMethodInvokeAtTwo022
     * @tc.desc Verify remove returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('remove');
      let result = method.invoke(list, [1] as FixedArray<Int>);
      expect(result as Boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2300
     * @tc.name testMethodInvokeAtTwo023
     * @tc.desc Verify getSelf returns same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('getSelf');
      let result = method.invoke(calc, [] as FixedArray<never>);
      expect(result as Object).assertEqual(calc as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2400
     * @tc.name testMethodInvokeAtTwo024
     * @tc.desc Verify copy returns different object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Inv02DataHolder = new Inv02DataHolder();
      let method = (Type.from<Inv02DataHolder>() as ClassType).getMethodByName('copy');
      let result = method.invoke(holder, [] as FixedArray<never>);
      expect(result as Object)
        .not()
        .assertEqual(holder);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2500
     * @tc.name testMethodInvokeAtTwo025
     * @tc.desc Verify isPositive returns correct booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('isPositive');
      let r1 = method.invoke(calc, [5] as FixedArray<Int>);
      let r2 = method.invoke(calc, [-1] as FixedArray<Object>);
      expect(r1 as Boolean).assertTrue();
      expect(r2 as Boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2600
     * @tc.name testMethodInvokeAtTwo026
     * @tc.desc Verify max int add returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('add');
      let maxVal: number = 2147483647;
      let result = method.invoke(calc, [maxVal, 1] as FixedArray<Object>);
      expect(result as number).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2700
     * @tc.name testMethodInvokeAtTwo027
     * @tc.desc Verify min int add returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('add');
      let result = method.invoke(calc, [-2147483648, -1] as FixedArray<Object>);
      expect(result as number).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2800
     * @tc.name testMethodInvokeAtTwo028
     * @tc.desc Verify consecutive increment returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv02Calculator = new Inv02Calculator();
      let method = (Type.from<Inv02Calculator>() as ClassType).getMethodByName('increment');
      let r1 = method.invoke(calc, [0] as FixedArray<Int>);
      let r2 = method.invoke(calc, [r1 as Object] as FixedArray<Object>);
      let r3 = method.invoke(calc, [r2 as Object] as FixedArray<Object>);
      expect(r1 as number).assertEqual(1);
      expect(r2 as number).assertEqual(2);
      expect(r3 as number).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_2900
     * @tc.name testMethodInvokeAtTwo029
     * @tc.desc Verify size returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<Int>);
      addM.invoke(list, [2] as FixedArray<Int>);
      addM.invoke(list, [3] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('size');
      let result = method.invoke(list, [] as FixedArray<never>);
      expect(result as number).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3000
     * @tc.name testMethodInvokeAtTwo030
     * @tc.desc Verify get returns element by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [10] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('get');
      let result = method.invoke(list, [0] as FixedArray<Int>);
      expect(result as number).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3100
     * @tc.name testMethodInvokeAtTwo031
     * @tc.desc Verify getOrDefault returns default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Inv02HashMap = new Inv02HashMap();
      let method = (Type.from<Inv02HashMap>() as ClassType).getMethodByName('getOrDefault');
      let result = method.invoke(map, ['missing', 'default'] as FixedArray<Object>);
      expect(result as string).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3200
     * @tc.name testMethodInvokeAtTwo032
     * @tc.desc Verify indexOf returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<Int>);
      addM.invoke(list, [2] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('indexOf');
      let result = method.invoke(list, [2] as FixedArray<Int>);
      expect(result as number).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3300
     * @tc.name testMethodInvokeAtTwo033
     * @tc.desc Verify lastIndexOf returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv02ArrayList = new Inv02ArrayList();
      let addM = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<Int>);
      addM.invoke(list, [2] as FixedArray<Int>);
      addM.invoke(list, [1] as FixedArray<Int>);
      let method = (Type.from<Inv02ArrayList>() as ClassType).getMethodByName('lastIndexOf');
      let result = method.invoke(list, [1] as FixedArray<Int>);
      expect(result as number).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3400
     * @tc.name testMethodInvokeAtTwo034
     * @tc.desc Verify values returns collection with put elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCls = Type.from<Inv02HashMap>() as ClassType;
      let map = new Inv02HashMap();
      let putM = mapCls.getMethodByName('put');
      putM.invoke(map, ['key1', 'val1'] as FixedArray<Object>);
      let method = mapCls.getMethodByName('values');
      let result = method.invoke(map, [] as FixedArray<never>);
      expect((result as string[]).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3500
     * @tc.name testMethodInvokeAtTwo035
     * @tc.desc Verify subList returns sub-array with correct size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv02ArrayList>() as ClassType;
      let list = new Inv02ArrayList();
      let addM = listCls.getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<Int>);
      addM.invoke(list, [2] as FixedArray<Int>);
      addM.invoke(list, [3] as FixedArray<Int>);
      let method = listCls.getMethodByName('subList');
      let result = method.invoke(list, [1, 3] as FixedArray<Object>);
      expect((result as number[]).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3600
     * @tc.name testMethodInvokeAtTwo036
     * @tc.desc Verify invoke returns null for nullable getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holderCls = Type.from<Inv02DataHolder>() as ClassType;
      let holder = new Inv02DataHolder();
      let setM = holderCls.getMethodByName('setNullable');
      setM.invoke(holder, ['value'] as FixedArray<Object>);
      let getM = holderCls.getMethodByName('getNullable');
      let result = getM.invoke(holder, [] as FixedArray<never>) as null;
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3700
     * @tc.name testMethodInvokeAtTwo037
     * @tc.desc Verify Builder end-to-end builds person with set fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let builderCls = Type.from<Inv02PersonBuilder>() as ClassType;
      let builder = new Inv02PersonBuilder();
      builderCls.getMethodByName('setName').invoke(builder, ['Alice'] as FixedArray<Object>);
      builderCls.getMethodByName('setAge').invoke(builder, [25] as FixedArray<Int>);
      let person = builderCls.getMethodByName('build').invoke(builder, [] as FixedArray<never>);
      let personCls = Type.from<Inv02Person>() as ClassType;
      let name = personCls.getMethodByName('getName').invoke(person, [] as FixedArray<never>);
      let age = personCls.getMethodByName('getAge').invoke(person, [] as FixedArray<never>);
      expect(name as string).assertEqual('Alice');
      expect(age as number).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3800
     * @tc.name testMethodInvokeAtTwo038
     * @tc.desc Verify invoke preserves floating-point precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv02Calculator>() as ClassType;
      let calc = new Inv02Calculator();
      let method = calcCls.getMethodByName('add');
      let result = method.invoke(calc, [0.1, 0.2] as FixedArray<Object>);
      expect(result as number).assertEqual(0.30000000000000004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_3900
     * @tc.name testMethodInvokeAtTwo039
     * @tc.desc Verify divide by zero returns POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv02Calculator>() as ClassType;
      let calc = new Inv02Calculator();
      let method = calcCls.getMethodByName('divide');
      let result = method.invoke(calc, [1.0, 0.0] as FixedArray<Object>);
      expect(result as number).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4000
     * @tc.name testMethodInvokeAtTwo040
     * @tc.desc Verify toString with name and age set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv04Person = new Inv04Person();
      person.setName('Alice');
      person.setAge(30);
      let method = (Type.from<Inv04Person>() as ClassType).getMethodByName('toString');
      let result = method.invoke(person, [] as FixedArray<never>);
      expect(result as string).assertEqual('Person(Alice,30)');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4100
     * @tc.name testMethodInvokeAtTwo041
     * @tc.desc Verify ArrayList toString returns formatted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv04ArrayList = new Inv04ArrayList();
      list.add(1);
      list.add(2);
      let method = (Type.from<Inv04ArrayList>() as ClassType).getMethodByName('toString');
      let result = method.invoke(list, [] as FixedArray<never>);
      expect(result as string).assertEqual('[1, 2]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4200
     * @tc.name testMethodInvokeAtTwo042
     * @tc.desc Verify equals symmetric property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Inv04Person = new Inv04Person();
      let p2: Inv04Person = new Inv04Person();
      let eqM = (Type.from<Inv04Person>() as ClassType).getMethodByName('equals');
      let r1 = eqM.invoke(p1, [p2] as FixedArray<object>);
      let r2 = eqM.invoke(p2, [p1] as FixedArray<object>);
      expect(r1 as Object).assertEqual(r2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4300
     * @tc.name testMethodInvokeAtTwo043
     * @tc.desc Verify invoke with mismatched argument type throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let person: Inv04Person = new Inv04Person();
        let method = (Type.from<Inv04Person>() as ClassType).getMethodByName('equals');
        let result = method.invoke(person, ['string'] as FixedArray<string>);
        expect(result as boolean).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4400
     * @tc.name testMethodInvokeAtTwo044
     * @tc.desc Verify hashCode consistency on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv04Person = new Inv04Person();
      let method = (Type.from<Inv04Person>() as ClassType).getMethodByName('hashCode');
      let h1 = method.invoke(person, [] as FixedArray<never>);
      let h2 = method.invoke(person, [] as FixedArray<never>);
      let h3 = method.invoke(person, [] as FixedArray<never>);
      expect(h1 as Object).assertEqual(h2 as Object);
      expect(h2 as Object).assertEqual(h3 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4500
     * @tc.name testMethodInvokeAtTwo045
     * @tc.desc Verify equals and hashCode contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Inv04Person = new Inv04Person();
      let p2: Inv04Person = new Inv04Person();
      let eqM = (Type.from<Inv04Person>() as ClassType).getMethodByName('equals');
      let hashM = (Type.from<Inv04Person>() as ClassType).getMethodByName('hashCode');
      let equal = eqM.invoke(p1, [p2] as FixedArray<object>);
      if (equal) {
        let h1 = hashM.invoke(p1, [] as FixedArray<never>);
        let h2 = hashM.invoke(p2, [] as FixedArray<never>);
        expect(h1 as Object).assertEqual(h2 as Object);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4600
     * @tc.name testMethodInvokeAtTwo046
     * @tc.desc Verify different objects have different hashCodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Inv04Person = new Inv04Person();
      let p2: Inv04Person = new Inv04Person();
      p1.setName('Alice');
      p2.setName('Bob');
      let hashM = (Type.from<Inv04Person>() as ClassType).getMethodByName('hashCode');
      let h1 = hashM.invoke(p1, [] as FixedArray<never>);
      let h2 = hashM.invoke(p2, [] as FixedArray<never>);
      expect(h1 as Object)
        .not()
        .assertEqual(h2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4700
     * @tc.name testMethodInvokeAtTwo047
     * @tc.desc Verify getMethodByName for static valueOf throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let firstValue = (Type.from<Inv04Integer>() as ClassType)
          .getMethodByName('valueOf')
          .invoke(null, [42] as FixedArray<number>);
        let secondValue = (Type.from<Inv04Integer>() as ClassType)
          .getMethodByName('valueOf')
          .invoke(null, [42] as FixedArray<number>);
        let method = (Type.from<Inv04Integer>() as ClassType).getMethodByName('equals');
        let result = method.invoke(firstValue, [secondValue as Object] as FixedArray<object>);
        expect(result as boolean).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4800
     * @tc.name testMethodInvokeAtTwo048
     * @tc.desc Verify getMethodByName for getClass throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let calc: Inv04Calculator = new Inv04Calculator();
        let getClassM = (Type.from<Inv04Calculator>() as ClassType).getMethodByName('getClass');
        let clsObj = getClassM.invoke(calc, [] as FixedArray<never>);
        let clsType: ClassType = clsObj as ClassType;
        let getMethodsM = clsType.getMethodByName('getMethods');
        let allMethods = getMethodsM.invoke(clsType, [] as FixedArray<never>);
        expect(allMethods as Object)
          .not()
          .assertNull();
        expect((allMethods as Method[]).length).assertLarger(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_4900
     * @tc.name testMethodInvokeAtTwo049
     * @tc.desc Verify four operations combined via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv04Calculator = new Inv04Calculator();
      let add = (Type.from<Inv04Calculator>() as ClassType)
        .getMethodByName('add')
        .invoke(calc, [10, 5] as FixedArray<object>);
      let sub = (Type.from<Inv04Calculator>() as ClassType)
        .getMethodByName('subtract')
        .invoke(calc, [add as Object, 3] as FixedArray<object>);
      let mul = (Type.from<Inv04Calculator>() as ClassType)
        .getMethodByName('multiply')
        .invoke(calc, [sub as Object, 2] as FixedArray<object>);
      let div = (Type.from<Inv04Calculator>() as ClassType)
        .getMethodByName('divide')
        .invoke(calc, [mul as Object, 2] as FixedArray<object>);
      expect(div as number).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5000
     * @tc.name testMethodInvokeAtTwo050
     * @tc.desc Verify list sort and get combined via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv04ArrayList = new Inv04ArrayList();
      (Type.from<Inv04ArrayList>() as ClassType).getMethodByName('add').invoke(list, [3] as FixedArray<number>);
      (Type.from<Inv04ArrayList>() as ClassType).getMethodByName('add').invoke(list, [1] as FixedArray<number>);
      (Type.from<Inv04ArrayList>() as ClassType).getMethodByName('add').invoke(list, [2] as FixedArray<number>);
      (Type.from<Inv04ArrayList>() as ClassType).getMethodByName('sort').invoke(list, [] as FixedArray<never>);
      let first = (Type.from<Inv04ArrayList>() as ClassType)
        .getMethodByName('get')
        .invoke(list, [0] as FixedArray<number>);
      expect(first as number).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5100
     * @tc.name testMethodInvokeAtTwo051
     * @tc.desc Verify getMethodByName for static valueOf on enum throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let enumCls: ClassType = Type.from<Inv04Color>() as ClassType;
        let red = enumCls.getMethodByName('valueOf').invoke(null, ['RED'] as FixedArray<string>);
        let name = enumCls.getMethodByName('name').invoke(red, [] as FixedArray<never>);
        let ord = enumCls.getMethodByName('ordinal').invoke(red, [] as FixedArray<never>);
        expect(name as string).assertEqual('RED');
        expect(ord as number).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5200
     * @tc.name testMethodInvokeAtTwo052
     * @tc.desc Verify compareTo via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Inv04Person = new Inv04Person();
      let p2: Inv04Person = new Inv04Person();
      (Type.from<Inv04Person>() as ClassType).getMethodByName('setAge').invoke(p1, [30] as FixedArray<number>);
      (Type.from<Inv04Person>() as ClassType).getMethodByName('setAge').invoke(p2, [25] as FixedArray<number>);
      let compM = (Type.from<Inv04Person>() as ClassType).getMethodByName('compareTo');
      let result = compM.invoke(p1, [p2] as FixedArray<object>);
      expect(result as number).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5300
     * @tc.name testMethodInvokeAtTwo053
     * @tc.desc Verify iterator via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let list: Inv04ArrayList = new Inv04ArrayList();
      list.add(1);
      list.add(2);
      let iter = (Type.from<Inv04ArrayList>() as ClassType)
        .getMethodByName('iterator')
        .invoke(list, [] as FixedArray<never>);
      let iterCls = Type.from<Inv04ArrayListIterator>() as ClassType;
      let h1 = iterCls.getMethodByName('hasNext').invoke(iter, [] as FixedArray<never>);
      expect(h1 as boolean).assertTrue();
      let n1 = iterCls.getMethodByName('next').invoke(iter, [] as FixedArray<never>);
      expect(n1 as number).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5400
     * @tc.name testMethodInvokeAtTwo054
     * @tc.desc Verify complex business method chain via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Inv04Person = new Inv04Person();
      (Type.from<Inv04Person>() as ClassType)
        .getMethodByName('setName')
        .invoke(person, ['Admin'] as FixedArray<string>);
      (Type.from<Inv04Person>() as ClassType).getMethodByName('setAge').invoke(person, [25] as FixedArray<number>);
      let name = (Type.from<Inv04Person>() as ClassType)
        .getMethodByName('getName')
        .invoke(person, [] as FixedArray<never>);
      let age = (Type.from<Inv04Person>() as ClassType)
        .getMethodByName('getAge')
        .invoke(person, [] as FixedArray<never>);
      let adult = (Type.from<Inv04Person>() as ClassType)
        .getMethodByName('isAdult')
        .invoke(person, [] as FixedArray<never>);
      let str = (Type.from<Inv04Person>() as ClassType)
        .getMethodByName('toString')
        .invoke(person, [] as FixedArray<never>);
      expect(name as string).assertEqual('Admin');
      expect(age as number).assertEqual(25);
      expect(adult as boolean).assertTrue();
      expect(str as string).assertEqual('Person(Admin,25)');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5500
     * @tc.name testMethodInvokeAtTwo055
     * @tc.desc Verify lazy init via invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Inv04LazyHolder = new Inv04LazyHolder();
      let getM = (Type.from<Inv04LazyHolder>() as ClassType).getMethodByName('get');
      let r1 = getM.invoke(holder, [] as FixedArray<never>);
      let r2 = getM.invoke(holder, [] as FixedArray<never>);
      expect(r1 as Object).assertEqual(r2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5600
     * @tc.name testMethodInvokeAtTwo056
     * @tc.desc Verify getMethodByName for static valueOf on enum throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let enumCls = Type.from<Inv04Color>() as ClassType;
        let red = enumCls.getMethodByName('valueOf').invoke(null, ['RED'] as FixedArray<object>);
        let method = enumCls.getMethodByName('toString');
        let result = method.invoke(red, [] as FixedArray<never>);
        expect(result as string).assertEqual('RED');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5700
     * @tc.name testMethodInvokeAtTwo057
     * @tc.desc Verify getMethodByName for getClass throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let calcCls = Type.from<Inv04Calculator>() as ClassType;
        let calc = new Inv04Calculator();
        let getClassM = calcCls.getMethodByName('getClass');
        let clsObj = getClassM.invoke(calc, [] as FixedArray<never>);
        let clsType = clsObj as ClassType;
        let getNameM = clsType.getMethodByName('getName');
        let name = getNameM.invoke(clsType, [] as FixedArray<never>);
        expect(name as string).assertEqual('Calculator');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_TWO_5800
     * @tc.name testMethodInvokeAtTwo058
     * @tc.desc Verify invoke propagates business exception thrown by target method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let holder: Inv04DataHolder = new Inv04DataHolder();
        let method = (Type.from<Inv04DataHolder>() as ClassType).getMethodByName('concurrentWrite');
        method.invoke(holder, [] as FixedArray<never>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
