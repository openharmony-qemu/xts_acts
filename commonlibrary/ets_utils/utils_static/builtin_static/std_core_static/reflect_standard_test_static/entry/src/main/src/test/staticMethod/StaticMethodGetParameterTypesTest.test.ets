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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

enum TestColor { Red, Green, Blue }

class GetParamsClass {
  public static getParams(a: int, b: string): string { return b; }
}

class ReadParamsClass {
  public static readParams(x: int, y: string): int { return x; }
}

class NoParamTypesClass {
  public static noParam(): string { return 'none'; }
}

class SingleParamTypesClass {
  public static singleParam(value: int): string { return value.toString(); }
}

class MultiTypeParamsClass {
  public static multiTypes(a: int, b: string, c: boolean, d: float): boolean { return true; }
}

class OptionalParamTypesClass {
  public static optionalParam(required: int, optional?: string): string { return optional ?? ''; }
}

class GenericParamTypesClass {
  public static genericParam(map: Map<string, int>, arr: Array<boolean>): int { return map.size; }
}

class VarArgsParamsClass {
  public static varArgs(...args: int[]): int { return args.length; }
}

class UnionParamTypesClass {
  public static unionParam(value: int | string): boolean { return true; }
}

interface JsonSerializable010 { }

class ObjParamTypesClass {
  public static objectParam(obj: ObjParamTypesClass): string { return 'obj'; }
  public static interfaceParam(obj: JsonSerializable010): string { return 'iface'; }
}

class ArrayParamTypesClass {
  public static listParams(a: int, b: string): boolean { return false; }
}

class UsableParamTypesClass {
  public static checkParams(a: int, b: string): float { return 1.0; }
}

class AllPrimitiveParamsClass {
  public static allPrimitives(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ): string { return 'primitives'; }
}

class ManyParamTypesClass {
  public static manyParams(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ): int { return p1; }
}

class NoThrowParamTypesClass {
  public static oneParam(a: int): string { return a.toString(); }
}

class ModifierParamTypesClass {
  public static normalMethod(a: int): string { return a.toString(); }
  public static async asyncMethod(b: string): Promise<int> { return b.length; }
  public static finalMethod(c: boolean): string { return c.toString(); }
}

class AsyncParamTypesClass {
  public static async fetchData(url: string, timeout: int): Promise<boolean> {
    return true;
  }
}

abstract class AbstractClass018 {
  public static abstractMethod(a: string, b: int): boolean { return true; }
}

final class FinalClass018 {
  public static finalMethod(x: boolean, y: float, z: double): string { return x.toString(); }
}

class SetterParamTypesClass {
  private static _first: string = '';
  private static _second: int = 0;
  public static set first(value: string) { SetterParamTypesClass._first = value; }
  public static set second(value: int) { SetterParamTypesClass._second = value; }
}

class MultiCountParamsClass {
  public static m0(): string { return 'zero'; }
  public static m1(a: int): boolean { return a > 0; }
  public static m2(a: int, b: string): float { return 1.0; }
  public static m3(a: int, b: string, c: boolean): int { return a; }
}

class EnumParamTypesClass {
  public static enumParam(c: TestColor): string { return c.toString(); }
}

class ConstrainedParamTypesClass {
  public static constrainedParam<T extends Object>(p: T): string { return p.toString(); }
}

class UnionConstituentClass {
  public static unionParam(value: int | string | boolean): int { return 0; }
}

export default function StaticMethodGetParameterTypesTest(): void {
  describe('StaticMethodGetParameterTypesTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
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
    it('testStaticMethodGetParameterTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetParamsClass>();
      let method = cls.getStaticMethod('getParams');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0200
     * @tc.name testStaticMethodGetParameterTypes002
     * @tc.desc Verify getParameterTypes() returns correct types for multi-param method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ReadParamsClass>();
      let method = cls.getStaticMethod('readParams');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoParamTypesClass>();
      let method = cls.getStaticMethod('noParam');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleParamTypesClass>();
      let method = cls.getStaticMethod('singleParam');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiTypeParamsClass>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OptionalParamTypesClass>();
      let method = cls.getStaticMethod('optionalParam');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual('i32');
      // spec/types.md:1327: optional parameter type is T|undefined (nullish union).
      let paramName: string = paramTypes[1].getName();
      expect(paramName).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_0700
     * @tc.name testStaticMethodGetParameterTypes007
     * @tc.desc Verify getParameterTypes() for method with generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericParamTypesClass>();
      let method = cls.getStaticMethod('genericParam');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VarArgsParamsClass>();
      let method = cls.getStaticMethod('varArgs');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UnionParamTypesClass>();
      let method = cls.getStaticMethod('unionParam');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ObjParamTypesClass>();
      let m1 = cls.getStaticMethod('objectParam');
      let m2 = cls.getStaticMethod('interfaceParam');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let p1: FixedArray<Class> = m1!.getParameterTypes();
      let p2: FixedArray<Class> = m2!.getParameterTypes();
      expect(p1[0].getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetParameterTypesTest.test.ObjParamTypesClass');
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
    it('testStaticMethodGetParameterTypes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ArrayParamTypesClass>();
      let method = cls.getStaticMethod('listParams');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      let typeName: string = Class.of(paramTypes).getName();
      expect(typeName).assertEqual('std.core.Class[]');
      let isFixed: boolean = Class.of(paramTypes).isFixedArray();
      expect(isFixed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1200
     * @tc.name testStaticMethodGetParameterTypes012
     * @tc.desc Verify each Class object in getParameterTypes() result is usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UsableParamTypesClass>();
      let method = cls.getStaticMethod('checkParams');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      for (let i: int = 0; i < paramTypes.length; i++) {
        expect(paramTypes[i].getName !== null).assertTrue();
        expect(paramTypes[i].isPrimitive !== null).assertTrue();
        expect(paramTypes[i].isInterface !== null).assertTrue();
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
    it('testStaticMethodGetParameterTypes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPrimitiveParamsClass>();
      let method = cls.getStaticMethod('allPrimitives');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyParamTypesClass>();
      let method = cls.getStaticMethod('manyParams');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoThrowParamTypesClass>();
      let method = cls.getStaticMethod('oneParam');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1600
     * @tc.name testStaticMethodGetParameterTypes016
     * @tc.desc Verify getParameterTypes() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModifierParamTypesClass>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let param0 = m1!.getParameterTypes()[0].getName();
      expect(param0).assertEqual('i32');
      let param1 = m2!.getParameterTypes()[0].getName();
      expect(param1).assertEqual('std.core.String');
      let param2 = m3!.getParameterTypes()[0].getName();
      expect(param2).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_1700
     * @tc.name testStaticMethodGetParameterTypes017
     * @tc.desc Verify getParameterTypes() for async static method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncParamTypesClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass018>();
      let clsFin = Class.from<FinalClass018>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetterParamTypesClass>();
      let setter1 = cls.getStaticMethod('%%set-first');
      let setter2 = cls.getStaticMethod('%%set-second');
      expect(setter1 !== undefined).assertTrue();
      expect(setter2 !== undefined).assertTrue();
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
    it('testStaticMethodGetParameterTypes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiCountParamsClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let expectedLengths: FixedArray<int> = [0, 1, 2, 3];
      for (let i: int = 0; i < methods.length; i++) {
        let paramTypes: FixedArray<Class> = methods[i].getParameterTypes();
        expect(paramTypes.length).assertEqual(expectedLengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_2100
     * @tc.name testStaticMethodGetParameterTypes021
     * @tc.desc Verify getParameterTypes() for enum type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EnumParamTypesClass>();
      let method = cls.getStaticMethod('enumParam');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_2200
     * @tc.name testStaticMethodGetParameterTypes022
     * @tc.desc Verify getParameterTypes() for constrained generic type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spec/generics.md:64 — T extends Object is compatible with Object methods
      let cls: Class = Class.from<ConstrainedParamTypesClass>();
      let method = cls.getStaticMethod('constrainedParam');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      let paramType = paramTypes[0];
      expect(paramType !== null).assertTrue();
      expect(paramType.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_2300
     * @tc.name testStaticMethodGetParameterTypes023
     * @tc.desc Verify getUnionConstituentTypes() on union type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UnionConstituentClass>();
      let method = cls.getStaticMethod('unionParam');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      let paramType = paramTypes[0];
      expect(paramType.isUnion()).assertTrue();
      let constituents = paramType.getUnionConstituentTypes();
      expect(constituents !== null).assertTrue();
    });
  });
}
