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
  public static test(a: int, b: string): void {}
}

class MyClass002 {
  public static test(a: int, b: string): void {}
}

class MyClass003 {
  public static noParam(): void {}
}

class MyClass004 {
  public static singleParam(value: int): void {}
}

class MyClass005 {
  public static multiTypes(a: int, b: string, c: boolean, d: float): void {}
}

class MyClass006 {
  public static optionalParam(required: int, optional?: string): void {}
}

class MyClass007 {
  public static genericParam(map: Map<string, int>, arr: Array<boolean>): void {}
}

class MyClass008 {
  public static varArgs(...args: int[]): void {}
}

class MyClass009 {
  public static unionParam(value: int | string): void {}
}

interface JsonSerializable010 { }

class MyClass010 {
  public static objectParam(obj: MyClass010): void {}
  public static interfaceParam(obj: JsonSerializable010): void {}
}

class MyClass011 {
  public static test(a: int, b: string): void {}
}

class MyClass012 {
  public static test(a: int, b: string): void {}
}

class MyClass013 {
  public static allPrimitives(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ): void {}
}

class MyClass014 {
  public static manyParams(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ): void {}
}

class MyClass015 {
  public static test(a: int): void {}
}

class MyClass016 {
  public static normalMethod(a: int): void {}
  public static async asyncMethod(b: string): Promise<void> { return; }
  public static finalMethod(c: boolean): void {}
}

class MyClass017 {
  public static async fetchData(url: string, timeout: int): Promise<string> {
    return 'data';
  }
}

abstract class AbstractClass018 {
  public static abstractMethod(a: string, b: int): void {}
}

final class FinalClass018 {
  public static finalMethod(x: boolean, y: float, z: double): void {}
}

class MyClass019 {
  private static _name: string = '';
  private static _age: int = 0;
  public static set name(value: string) { MyClass019._name = value; }
  public static set age(value: int) { MyClass019._age = value; }
}

class MyClass020 {
  public static m0(): void {}
  public static m1(a: int): void {}
  public static m2(a: int, b: string): void {}
  public static m3(a: int, b: string, c: boolean): void {}
}

export default function StaticMethodGetParameterTypesTest(): void {
  describe('StaticMethodGetParameterTypesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0100
     * @tc.name testStaticMethodGetParameterTypes001
     * @tc.desc Verify getParameterTypes() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0200
     * @tc.name testStaticMethodGetParameterTypes002
     * @tc.desc Verify getParameterTypes() returns correct types for multi-param method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('i32');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0300
     * @tc.name testStaticMethodGetParameterTypes003
     * @tc.desc Verify getParameterTypes() returns empty array for no-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('noParam');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0400
     * @tc.name testStaticMethodGetParameterTypes004
     * @tc.desc Verify getParameterTypes() for single-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let method = cls.getStaticMethod('singleParam');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0500
     * @tc.name testStaticMethodGetParameterTypes005
     * @tc.desc Verify getParameterTypes() for method with multiple different param types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(4);
      expect(paramTypes[0].getName()).assertEqual('i32');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
      expect(paramTypes[2].getName()).assertEqual('u1');
      expect(paramTypes[3].getName()).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0600
     * @tc.name testStaticMethodGetParameterTypes006
     * @tc.desc Verify getParameterTypes() for method with optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('optionalParam');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('i32');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0700
     * @tc.name testStaticMethodGetParameterTypes007
     * @tc.desc Verify getParameterTypes() for method with generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('genericParam');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('std.core.Map');
      expect(paramTypes[1].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0800
     * @tc.name testStaticMethodGetParameterTypes008
     * @tc.desc Verify getParameterTypes() for method with variadic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('varArgs');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0900
     * @tc.name testStaticMethodGetParameterTypes009
     * @tc.desc Verify getParameterTypes() for union type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('unionParam');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1000
     * @tc.name testStaticMethodGetParameterTypes010
     * @tc.desc Verify getParameterTypes() for object and interface type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let m1 = cls.getStaticMethod('objectParam');
      let m2 = cls.getStaticMethod('interfaceParam');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      let p1: FixedArray<Class> = m1!.getParameterTypes();
      let p2: FixedArray<Class> = m2!.getParameterTypes();
      expect(p1[0].getName().includes('MyClass010')).assertTrue();
      expect(p2[0].isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1100
     * @tc.name testStaticMethodGetParameterTypes011
     * @tc.desc Verify getParameterTypes() return type is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1200
     * @tc.name testStaticMethodGetParameterTypes012
     * @tc.desc Verify each Class object in getParameterTypes() result is usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      for (let i: int = 0; i < paramTypes.length; i++) {
        expect(paramTypes[i].getName != null).assertTrue();
        expect(paramTypes[i].isPrimitive != null).assertTrue();
        expect(paramTypes[i].isInterface != null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1300
     * @tc.name testStaticMethodGetParameterTypes013
     * @tc.desc Verify getParameterTypes() for all primitive type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('allPrimitives');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(9);
      expect(paramTypes[0].getName()).assertEqual('i8');
      expect(paramTypes[1].getName()).assertEqual('i16');
      expect(paramTypes[2].getName()).assertEqual('i32');
      expect(paramTypes[3].getName()).assertEqual('i64');
      expect(paramTypes[4].getName()).assertEqual('f32');
      expect(paramTypes[5].getName()).assertEqual('f64');
      expect(paramTypes[6].getName()).assertEqual('f64');
      expect(paramTypes[7].getName()).assertEqual('u1');
      expect(paramTypes[8].getName()).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1400
     * @tc.name testStaticMethodGetParameterTypes014
     * @tc.desc Verify getParameterTypes() for method with many parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let method = cls.getStaticMethod('manyParams');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(10);
      for (let i: int = 0; i < 10; i++) {
        expect(paramTypes[i].getName()).assertEqual('i32');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1500
     * @tc.name testStaticMethodGetParameterTypes015
     * @tc.desc Verify getParameterTypes() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        let paramTypes: FixedArray<Class> = method!.getParameterTypes();
        expect(paramTypes != null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1600
     * @tc.name testStaticMethodGetParameterTypes016
     * @tc.desc Verify getParameterTypes() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass016>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getParameterTypes()[0].getName()).assertEqual('i32');
      expect(m2!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(m3!.getParameterTypes()[0].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1700
     * @tc.name testStaticMethodGetParameterTypes017
     * @tc.desc Verify getParameterTypes() for async static method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass017>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('std.core.String');
      expect(paramTypes[1].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1800
     * @tc.name testStaticMethodGetParameterTypes018
     * @tc.desc Verify getParameterTypes() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass018>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass018>().getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      let p1: FixedArray<Class> = m1!.getParameterTypes();
      let p2: FixedArray<Class> = m2!.getParameterTypes();
      expect(p1.length).assertEqual(2);
      expect(p2.length).assertEqual(3);
      expect(p1[0].getName()).assertEqual('std.core.String');
      expect(p1[1].getName()).assertEqual('i32');
      expect(p2[0].getName()).assertEqual('u1');
      expect(p2[1].getName()).assertEqual('f32');
      expect(p2[2].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1900
     * @tc.name testStaticMethodGetParameterTypes019
     * @tc.desc Verify getParameterTypes() for setter method parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass019>();
      let setter1 = cls.getStaticMethod('%%set-name');
      let setter2 = cls.getStaticMethod('%%set-age');
      expect(setter1 != undefined).assertTrue();
      expect(setter2 != undefined).assertTrue();
      let p1: FixedArray<Class> = setter1!.getParameterTypes();
      let p2: FixedArray<Class> = setter2!.getParameterTypes();
      expect(p1.length).assertEqual(1);
      expect(p2.length).assertEqual(1);
      expect(p1[0].getName()).assertEqual('std.core.String');
      expect(p2[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_2000
     * @tc.name testStaticMethodGetParameterTypes020
     * @tc.desc Verify getParameterTypes() for multiple static methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass020>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let expectedLengths: FixedArray<int> = [0, 1, 2, 3];
      for (let i: int = 0; i < methods.length; i++) {
        let paramTypes: FixedArray<Class> = methods[i].getParameterTypes();
        expect(paramTypes.length).assertEqual(expectedLengths[i]);
      }
    });
  });
}
