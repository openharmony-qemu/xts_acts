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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  public static test(): string {
    return '';
  }
}

class MyClass002 {
  public static returnString(): string { return 'test'; }
  public static returnInt(): int { return 42; }
  public static returnBoolean(): boolean { return true; }
}

class MyClass003 {
  public static noReturn(): void {
    console.info('no return');
  }
}

class MyClass004 {
  public static returnObject(): MyClass004 { return new MyClass004(); }
  public static returnMap(): Map<string, int> { return new Map<string, int>(); }
}

class MyClass005 {
  public static returnArray(): Array<int> { return [1, 2, 3]; }
  public static returnFixedArray(): FixedArray<string> {
    let arr: FixedArray<string> = ['a', 'b'];
    return arr;
  }
}

class MyClass006 {
  public static returnGeneric(): Map<string, Array<int>> {
    return new Map<string, Array<int>>();
  }
}

class MyClass007 {
  public static returnUnion(): int | string { return 42; }
}

class MyClass008 {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass009 {
  public static returnNullable(): string | null { return null; }
  public static returnUndefinable(): int | undefined { return undefined; }
}

class MyClass010 {
  public static test(): string { return ''; }
}

class MyClass011 {
  public static test(): string { return ''; }
}

class MyClass012 {
  public static rByte(): byte { return 0; }
  public static rShort(): short { return 0; }
  public static rInt(): int { return 0; }
  public static rLong(): long { return 0 as long; }
  public static rFloat(): float { return Double.toFloat(0.0); }
  public static rDouble(): double { return 0.0; }
  public static rNumber(): number { return 0; }
  public static rBoolean(): boolean { return true; }
  public static rChar(): char { return c'A'; }
}

class MyClass013 {
  public static chain(): MyClass013 { return new MyClass013(); }
}

class MyClass014 {
  public static test(): string { return ''; }
}

class MyClass015 {
  public static normalMethod(): string { return 'test'; }
  public static async asyncMethod(): Promise<string> { return 'test'; }
  public static finalMethod(): int { return 0; }
}

class MyClass016 {
  public static async fetchData(): Promise<string> { return 'data'; }
  public static async fetchNumber(): Promise<int> { return 42; }
}

abstract class AbstractClass017 {
  public static abstractMethod(): string { return 'test'; }
}

final class FinalClass017 {
  public static finalMethod(): int { return 0; }
}

class MyClass018 {
  private static _name: string = '';
  public static get name(): string { return MyClass018._name; }
  public static set name(value: string) { MyClass018._name = value; }
}

class MyClass019 {
  public static m1(): string { return ''; }
  public static m2(): int { return 0; }
  public static m3(): boolean { return true; }
  public static m4(): void {}
}

export default function StaticMethodGetReturnTypeTest(): void {
  describe('StaticMethodGetReturnTypeTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0100
     * @tc.name testStaticMethodGetReturnType001
     * @tc.desc Verify getReturnType() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0200
     * @tc.name testStaticMethodGetReturnType002
     * @tc.desc Verify getReturnType() returns correct types for basic return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let m1 = cls.getStaticMethod('returnString');
      let m2 = cls.getStaticMethod('returnInt');
      let m3 = cls.getStaticMethod('returnBoolean');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
      expect(m3!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0300
     * @tc.name testStaticMethodGetReturnType003
     * @tc.desc Verify getReturnType() returns void for void method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('noReturn');
      expect(method != undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0400
     * @tc.name testStaticMethodGetReturnType004
     * @tc.desc Verify getReturnType() for object return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let m1 = cls.getStaticMethod('returnObject');
      let m2 = cls.getStaticMethod('returnMap');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getReturnType().getName().includes('MyClass004')).assertTrue();
      expect(m2!.getReturnType().getName()).assertEqual('std.core.Map');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0500
     * @tc.name testStaticMethodGetReturnType005
     * @tc.desc Verify getReturnType() for array return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let m1 = cls.getStaticMethod('returnArray');
      let m2 = cls.getStaticMethod('returnFixedArray');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.Array');
      expect(m2!.getReturnType().getName()).assertEqual('std.core.String[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0600
     * @tc.name testStaticMethodGetReturnType006
     * @tc.desc Verify getReturnType() for generic return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('returnGeneric');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Map');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0700
     * @tc.name testStaticMethodGetReturnType007
     * @tc.desc Verify getReturnType() for union return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('returnUnion');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0800
     * @tc.name testStaticMethodGetReturnType008
     * @tc.desc Verify getReturnType() for Promise return type contains Promise in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName().includes('Promise')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0900
     * @tc.name testStaticMethodGetReturnType009
     * @tc.desc Verify getReturnType() for nullable and undefinable return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let m1 = cls.getStaticMethod('returnNullable');
      let m2 = cls.getStaticMethod('returnUndefinable');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getReturnType().isUnion()).assertTrue();
      expect(m2!.getReturnType().isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1000
     * @tc.name testStaticMethodGetReturnType010
     * @tc.desc Verify getReturnType() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(typeof returnType).assertEqual('object');
      expect(returnType.getName != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1100
     * @tc.name testStaticMethodGetReturnType011
     * @tc.desc Verify getReturnType() returned Class object has complete method set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName() != null).assertTrue();
      expect(returnType.isPrimitive != null).assertTrue();
      expect(returnType.isInterface != null).assertTrue();
      expect(returnType.isFinal != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1200
     * @tc.name testStaticMethodGetReturnType012
     * @tc.desc Verify getReturnType() for all primitive return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      expect(cls.getStaticMethod('rByte')!.getReturnType().getName()).assertEqual('i8');
      expect(cls.getStaticMethod('rShort')!.getReturnType().getName()).assertEqual('i16');
      expect(cls.getStaticMethod('rInt')!.getReturnType().getName()).assertEqual('i32');
      expect(cls.getStaticMethod('rLong')!.getReturnType().getName()).assertEqual('i64');
      expect(cls.getStaticMethod('rFloat')!.getReturnType().getName()).assertEqual('f32');
      expect(cls.getStaticMethod('rDouble')!.getReturnType().getName()).assertEqual('f64');
      expect(cls.getStaticMethod('rNumber')!.getReturnType().getName()).assertEqual('f64');
      expect(cls.getStaticMethod('rBoolean')!.getReturnType().getName()).assertEqual('u1');
      expect(cls.getStaticMethod('rChar')!.getReturnType().getName()).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1300
     * @tc.name testStaticMethodGetReturnType013
     * @tc.desc Verify getReturnType() for this return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('chain');
      expect(method != undefined).assertTrue();
      expect(method!.getReturnType().getName().includes('MyClass013')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1400
     * @tc.name testStaticMethodGetReturnType014
     * @tc.desc Verify getReturnType() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        let returnType: Class = method!.getReturnType();
        expect(returnType != null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1500
     * @tc.name testStaticMethodGetReturnType015
     * @tc.desc Verify getReturnType() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m2!.getReturnType().getName().includes('Promise')).assertTrue();
      expect(m3!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1600
     * @tc.name testStaticMethodGetReturnType016
     * @tc.desc Verify getReturnType() for async methods returns Promise types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass016>();
      let m1 = cls.getStaticMethod('fetchData');
      let m2 = cls.getStaticMethod('fetchNumber');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      let rt1: Class = m1!.getReturnType();
      let rt2: Class = m2!.getReturnType();
      expect(rt1.getName().includes('Promise')).assertTrue();
      expect(rt2.getName().includes('Promise')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1700
     * @tc.name testStaticMethodGetReturnType017
     * @tc.desc Verify getReturnType() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass017>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass017>().getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1800
     * @tc.name testStaticMethodGetReturnType018
     * @tc.desc Verify getReturnType() for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.getReturnType().getName()).assertEqual('std.core.String');
      expect(setter!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1900
     * @tc.name testStaticMethodGetReturnType019
     * @tc.desc Verify getReturnType() for multiple static methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass019>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let returnTypes: Map<string, string> = new Map<string, string>();
      returnTypes.set('m1', 'std.core.String');
      returnTypes.set('m2', 'i32');
      returnTypes.set('m3', 'u1');
      returnTypes.set('m4', 'void');
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        let expected = returnTypes.get(name);
        if (expected !== undefined) {
          expect(methods[i].getReturnType().getName()).assertEqual(expected);
        }
      }
    });
  });
}
