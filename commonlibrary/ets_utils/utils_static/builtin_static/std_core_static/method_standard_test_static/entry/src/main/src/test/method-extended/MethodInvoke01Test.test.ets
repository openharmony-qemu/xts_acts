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

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class Inv01Calculator {
  add(a: number, b: number): number {
    return a + b;
  }
  isZero(v: number): boolean {
    return v === 0;
  }
}
class Inv01Person {
  private name: string = 'Default';
  private age: number = 0;
  getName(): string {
    return this.name;
  }
  setName(n: string): void {
    this.name = n;
  }
  toString(): string {
    return 'Person(' + this.name + ',' + this.age.toString() + ')';
  }
  hashCode(): number {
    return 0;
  }
  equals(other: Inv01Person): boolean {
    return this.name === other.name;
  }
}
class Inv01StringUtil {
  concat(a: string, b: string): string {
    return a + b;
  }
  join(arr: string[], sep: string): string {
    return arr.join(sep);
  }
}
class Inv01DataHolder {
  private value: number = 0;
  setValue(v: number): void {
    this.value = v;
  }
  getValue(): number {
    return this.value;
  }
  clear(): void {
    this.value = 0;
  }
  clone(): Inv01DataHolder {
    let h = new Inv01DataHolder();
    h.value = this.value;
    return h;
  }
}
class Inv01BaseClass {
  baseOnlyMethod(): string {
    return 'base';
  }
}
class Inv01DerivedClass extends Inv01BaseClass {}
class Inv01ArrayList {
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
  toArray(): number[] {
    return this.items.slice();
  }
}
class Inv01HashMap {
  private map: Map<string, string> = new Map<string, string>();
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
}
class Inv03Calculator {
  add(a: number, b: number): number {
    return a + b;
  }
  multiply(a: number, b: number): number {
    return a * b;
  }
  divide(a: number, b: number): number {
    return a / b;
  }
  getVersion(): string {
    return '1.0';
  }
  isZero(v: number): boolean {
    return v === 0;
  }
  sumThree(a: number, b: number, c: number): number {
    return a + b + c;
  }
  sumFour(a: number, b: number, c: number, d: number): number {
    return a + b + c + d;
  }
  getMethod(name: string): Method {
    return (Type.from<Inv03Calculator>() as ClassType).getMethodByName(name);
  }
  callThrowException(): void {
    throw new Error('nested exception');
  }
  setPositive(v: number): void {
    if (v <= 0) throw new Error('not positive');
  }
  infiniteRecursion(n: number): number {
    return this.infiniteRecursion(n);
  }
  static addStatic(a: number, b: number): number {
    return a + b;
  }
  static getVersion(): string {
    return '1.0';
  }
}
class Inv03Person {
  private name: string = 'Default';
  private age: number = 0;
  getName(): string {
    return this.name;
  }
  setName(n: string): void {
    this.name = n;
  }
  setAge(a: number): void {
    this.age = a;
  }
  getAge(): number {
    return this.age;
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
  equals(other: Inv03Person): boolean {
    return this.name === other.name;
  }
  getClass(): object {
    return Type.from<Inv03Person>();
  }
}
class Inv03DataHolder {
  private value: number = 0;
  setValue(v: number): void {
    this.value = v;
  }
  getValue(): number {
    return this.value;
  }
  throwIfZero(v: number): void {
    if (v === 0) throw new Error('zero');
  }
}
class Inv03StringUtil {
  concat(a: string, b: string): string {
    return a + b;
  }
  join(arr: string[], sep: string): string {
    return arr.join(sep);
  }
  checkNotNull(v: string | null): void {
    if (v === null) throw new Error('null');
  }
}
class Inv03ArrayList {
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
}
class Inv03Color {
  name(): string {
    return 'RED';
  }
  static valueOf(name: string): string {
    if (name === 'PURPLE') throw new Error('invalid');
    return name;
  }
}
export default function MethodInvoke01Test(): void {
  describe('MethodInvoke01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0100
     * @tc.name testMethodInvokeAtOne001
     * @tc.desc Verify invoke with empty args for isEmpty on non-empty collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv01ArrayList>() as ClassType;
      let list = new Inv01ArrayList();
      let addM = listCls.getMethodByName('add');
      addM.invoke(list, [1] as FixedArray<number>);
      let method = _M(listCls, 'isEmpty');
      let result = method.invoke(list, [] as FixedArray<never>);
      expect(result as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0200
     * @tc.name testMethodInvokeAtOne002
     * @tc.desc Verify invoke with empty args for values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCls = Type.from<Inv01HashMap>() as ClassType;
      let map = new Inv01HashMap();
      let method = mapCls.getMethodByName('values');
      let result = method.invoke(map, [] as FixedArray<never>);
      expect((result as Object[]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0400
     * @tc.name testMethodInvokeAtOne004
     * @tc.desc Verify invoke with empty args for hashCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let personCls = Type.from<Inv01Person>() as ClassType;
      let person = new Inv01Person();
      let method = personCls.getMethodByName('hashCode');
      let result = method.invoke(person, [] as FixedArray<never>);
      expect(result as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0500
     * @tc.name testMethodInvokeAtOne005
     * @tc.desc Verify invoke with single Object param add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv01ArrayList>() as ClassType;
      let list = new Inv01ArrayList();
      let method = listCls.getMethodByName('add');
      let result = method.invoke(list, [1] as FixedArray<number>);
      expect(result as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0600
     * @tc.name testMethodInvokeAtOne006
     * @tc.desc Verify child instance calls parent non-overridden method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Type.from<Inv01BaseClass>() as ClassType;
      let derived = new Inv01DerivedClass();
      let method = baseCls.getMethodByName('baseOnlyMethod');
      let result = method.invoke(derived, [] as FixedArray<never>);
      expect(result as Object).assertEqual('base');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0700
     * @tc.name testMethodInvokeAtOne007
     * @tc.desc Verify Person instance invokes Calculator isZero - should fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv01Calculator>() as ClassType;
      let person = new Inv01Person();
      let method = calcCls.getMethodByName('isZero');
      try {
        method.invoke(person, [0] as FixedArray<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_0900
     * @tc.name testMethodInvokeAtOne009
     * @tc.desc Verify invoke with empty args for no-param void method clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holderCls = Type.from<Inv01DataHolder>() as ClassType;
      let holder = new Inv01DataHolder();
      let setM = holderCls.getMethodByName('setValue');
      setM.invoke(holder, [99] as FixedArray<number>);
      let clearM = holderCls.getMethodByName('clear');
      clearM.invoke(holder, [] as FixedArray<never>);
      let getM = holderCls.getMethodByName('getValue');
      let val = getM.invoke(holder, [] as FixedArray<never>);
      expect(val as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1000
     * @tc.name testMethodInvokeAtOne010
     * @tc.desc Verify invoke with empty args for no-param method size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv01ArrayList>() as ClassType;
      let list = new Inv01ArrayList();
      let method = listCls.getMethodByName('size');
      let result = method.invoke(list, [] as FixedArray<never>);
      expect(result as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1100
     * @tc.name testMethodInvokeAtOne011
     * @tc.desc Verify invoke with empty args for no-param method isEmpty true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv01ArrayList>() as ClassType;
      let list = new Inv01ArrayList();
      let method = _M(listCls, 'isEmpty');
      let result = method.invoke(list, [] as FixedArray<never>);
      expect(result as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1200
     * @tc.name testMethodInvokeAtOne012
     * @tc.desc Verify invoke with single number param isZero true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv01Calculator>() as ClassType;
      let calc = new Inv01Calculator();
      let method = calcCls.getMethodByName('isZero');
      let result = method.invoke(calc, [0] as FixedArray<number>);
      expect(result as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1300
     * @tc.name testMethodInvokeAtOne013
     * @tc.desc Verify invoke with single number param isZero false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv01Calculator>() as ClassType;
      let calc = new Inv01Calculator();
      let method = calcCls.getMethodByName('isZero');
      let result = method.invoke(calc, [5] as FixedArray<number>);
      expect(result as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1400
     * @tc.name testMethodInvokeAtOne014
     * @tc.desc Verify invoke with two params concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let utilCls = Type.from<Inv01StringUtil>() as ClassType;
      let util = new Inv01StringUtil();
      let method = utilCls.getMethodByName('concat');
      let result = method.invoke(util, ['Hello', 'World'] as FixedArray<object>);
      expect(result as Object).assertEqual('HelloWorld');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1500
     * @tc.name testMethodInvokeAtOne015
     * @tc.desc Verify invoke with two params join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let utilCls = Type.from<Inv01StringUtil>() as ClassType;
      let util = new Inv01StringUtil();
      let method = utilCls.getMethodByName('join');
      let result = method.invoke(util, [['a', 'b', 'c'], ','] as FixedArray<object>);
      expect(result as Object).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1600
     * @tc.name testMethodInvokeAtOne016
     * @tc.desc Verify invoke with empty args for two-param method throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv01Calculator>() as ClassType;
      let calc = new Inv01Calculator();
      let method = calcCls.getMethodByName('add');
      try {
        method.invoke(calc, [] as FixedArray<never>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1700
     * @tc.name testMethodInvokeAtOne017
     * @tc.desc Verify null receiver for instance add throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('add');
      try {
        method.invoke(null, [1, 2] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1800
     * @tc.name testMethodInvokeAtOne018
     * @tc.desc Verify object state unchanged after exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: Inv03DataHolder = new Inv03DataHolder();
      let setM = (Type.from<Inv03DataHolder>() as ClassType).getMethodByName('setValue');
      setM.invoke(holder, [42] as FixedArray<number>);
      let method = (Type.from<Inv03DataHolder>() as ClassType).getMethodByName('throwIfZero');
      try {
        method.invoke(holder, [0] as FixedArray<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let getM = (Type.from<Inv03DataHolder>() as ClassType).getMethodByName('getValue');
      let val = getM.invoke(holder, [] as FixedArray<never>);
      expect(val as number).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_1900
     * @tc.name testMethodInvokeAtOne019
     * @tc.desc Verify nested exception propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv03Calculator = new Inv03Calculator();
      let method = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('callThrowException');
      try {
        method.invoke(calc, [] as FixedArray<never>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2000
     * @tc.name testMethodInvokeAtOne020
     * @tc.desc Verify checkNotNull with null arg throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let util: Inv03StringUtil = new Inv03StringUtil();
      let method = (Type.from<Inv03StringUtil>() as ClassType).getMethodByName('checkNotNull');
      try {
        method.invoke(util, [null!] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2100
     * @tc.name testMethodInvokeAtOne021
     * @tc.desc Verify setPositive with negative throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv03Calculator = new Inv03Calculator();
      let method = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('setPositive');
      try {
        method.invoke(calc, [-1] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2200
     * @tc.name testMethodInvokeAtOne022
     * @tc.desc Verify recursion stack overflow throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv03Calculator = new Inv03Calculator();
      let method = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('infiniteRecursion');
      try {
        method.invoke(calc, [0] as FixedArray<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('std.core.StackOverflowError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2300
     * @tc.name testMethodInvokeAtOne023
     * @tc.desc Verify invoke dispatches by receiver: Calculator toString invoked on Person receiver runs receiver default toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('toString');
      let person: Inv03Person = new Inv03Person();
      let result = method.invoke(person, [] as FixedArray<never>);
      expect(result as string).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2500
     * @tc.name testMethodInvokeAtOne025
     * @tc.desc Verify Method object obtained via getMethod invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc: Inv03Calculator = new Inv03Calculator();
      let getMethodM = (Type.from<Inv03Calculator>() as ClassType).getMethodByName('getMethod');
      let addMethod = getMethodM.invoke(calc, ['add'] as FixedArray<string>);
      let method = addMethod as Method;
      let r1 = method.invoke(calc, [3, 4] as FixedArray<object>);
      let r2 = method.invoke(calc, [5, 6] as FixedArray<object>);
      expect(r1 as number).assertEqual(7);
      expect(r2 as number).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2600
     * @tc.name testMethodInvokeAtOne026
     * @tc.desc Verify invoke throws TypeError when getMethodByName called with empty method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv03Calculator>() as ClassType;
      try {
        let method = _M(calcCls, '');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2700
     * @tc.name testMethodInvokeAtOne027
     * @tc.desc Verify invoke throws RangeError when list get called with negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listCls = Type.from<Inv03ArrayList>() as ClassType;
      let list = new Inv03ArrayList();
      let method = listCls.getMethodByName('get');
      try {
        method.invoke(list, [-1] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2800
     * @tc.name testMethodInvokeAtOne028
     * @tc.desc Verify exception handling for invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv03Calculator>() as ClassType;
      let calc = new Inv03Calculator();
      let method = calcCls.getMethodByName('add');
      let result = method.invoke(calc, [1e308, 1e308] as FixedArray<object>);
      expect(result as number).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_2900
     * @tc.name testMethodInvokeAtOne029
     * @tc.desc Verify exception handling for invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv03Calculator>() as ClassType;
      let calc = new Inv03Calculator();
      let method = calcCls.getMethodByName('isZero');
      let result = method.invoke(calc, [Double.NaN] as FixedArray<object>);
      expect(result as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_3000
     * @tc.name testMethodInvokeAtOne030
     * @tc.desc Verify exception handling for invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calcCls = Type.from<Inv03Calculator>() as ClassType;
      let calc = new Inv03Calculator();
      let method = calcCls.getMethodByName('add');
      try {
        method.invoke(calc, ['a', 'b'] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_3100
     * @tc.name testMethodInvokeAtOne031
     * @tc.desc Verify exception handling for invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumCls = Type.from<Inv03Color>() as ClassType;
      let method: Method | undefined = undefined;
      let n: number = enumCls.getMethodsNum();
      for (let i: number = 0; i < n; i += 1) {
        const m = enumCls.getMethod(i.toLong());
        if (m.getName() === 'valueOf' && m.isStatic()) {
          method = m;
          break;
        }
      }
      expect(method).not().assertUndefined();
      try {
        method!.invoke(null, ['PURPLE'] as FixedArray<object>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_ONE_3200
     * @tc.name testMethodInvokeAtOne032
     * @tc.desc Verify getMethodByName for static method addStatic via instance returns 3, then the case voluntarily fails expecting TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodInvokeAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let calcCls = Type.from<Inv03Calculator>() as ClassType;
        let calc = new Inv03Calculator();
        let method = calcCls.getMethodByName('addStatic');
        let result = method.invoke(calc, [1, 2] as FixedArray<object>);
        expect(result as number).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  });
}
