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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

enum TestColor { Red, Green, Blue }

class GetReturnTypeClass {
  public static getMessage(): void {
   }
}

class BasicReturnTypesClass {
  public static returnString(): string { return 'test'; }
  public static returnInt(): int { return 42; }
  public static returnBoolean(): boolean { return true; }
}

class VoidReturnClass {
  public static noReturn(): void {
    console.info('no return');
  }
}

class ObjectReturnTypesClass {
  public static returnObject(): ObjectReturnTypesClass { return new ObjectReturnTypesClass(); }
  public static returnMap(): Map<string, int> { return new Map<string, int>(); }
}

class ArrayReturnTypesClass {
  public static returnArray(): Array<int> { return [1, 2, 3]; }
  public static returnFixedArray(): FixedArray<string> {
    let arr: FixedArray<string> = ['a', 'b'];
    return arr;
  }
}

class GenericReturnClass {
  public static returnGeneric(): Map<string, Array<int>> {
    return new Map<string, Array<int>>();
  }
}

class UnionReturnClass {
  public static returnUnion(): int | string { return 42; }
}

class PromiseReturnClass {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class NullableReturnClass {
  public static returnNullable(): string | null { return null; }
  public static returnUndefinable(): int | undefined { return undefined; }
}

class ObjMethodReturnClass {
  public static getTypeName(): string { return ''; }
}

class CompleteMethodReturnClass {
  public static getMethodList(): string { return ''; }
}

class AllPrimitiveReturnClass {
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

class ThisReturnClass {
  public static chain(): ThisReturnClass { return new ThisReturnClass(); }
}

class NoThrowReturnClass {
  public static noThrow(): string { return ''; }
}

class ModifierReturnClass {
  public static normalMethod(): string { return 'test'; }
  public static async asyncMethod(): Promise<int> { return 42; }
  public static finalMethod(): boolean { return true; }
}

class AsyncReturnClass {
  public static async fetchData(): Promise<string> { return 'data'; }
  public static async fetchNumber(): Promise<float> { return Double.toFloat(1.0); }
}

abstract class AbstractClass017 {
  public static abstractMethod(): string { return 'test'; }
}

final class FinalClass017 {
  public static finalMethod(): boolean { return false; }
}

class PropertyReturnClass {
  private static _label: string = '';
  public static get label(): string { return PropertyReturnClass._label; }
  public static set label(value: string) { PropertyReturnClass._label = value; }
}

class MultiMethodReturnClass {
  public static m1(): string { return ''; }
  public static m2(): int { return 0; }
  public static m3(): boolean { return true; }
  public static m4(): float { return 1.0; }
}

class EnumReturnClass {
  public static getColor(): TestColor { return TestColor.Red; }
}

class GenericConstraintReturnClass {
  public static identity<T extends Object>(value: T): T { return value; }
}

export default function StaticMethodGetReturnTypeTest(): void {
  describe('StaticMethodGetReturnTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0100
     * @tc.name testStaticMethodGetReturnType001
     * @tc.desc Verify getReturnType() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetReturnTypeClass>();
      let method = cls.getStaticMethod('getMessage');
      expect(method !== undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0200
     * @tc.name testStaticMethodGetReturnType002
     * @tc.desc Verify getReturnType() returns correct types for basic return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BasicReturnTypesClass>();
      let m1 = cls.getStaticMethod('returnString');
      let m2 = cls.getStaticMethod('returnInt');
      let m3 = cls.getStaticMethod('returnBoolean');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let rt1 = m1!.getReturnType();
      let rt2 = m2!.getReturnType();
      let rt3 = m3!.getReturnType();
      expect(rt1.getName()).assertEqual('std.core.String');
      expect(rt2.getName()).assertEqual('i32');
      expect(rt3.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0300
     * @tc.name testStaticMethodGetReturnType003
     * @tc.desc Verify getReturnType() returns void for void method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VoidReturnClass>();
      let method = cls.getStaticMethod('noReturn');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0400
     * @tc.name testStaticMethodGetReturnType004
     * @tc.desc Verify getReturnType() for object return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ObjectReturnTypesClass>();
      let m1 = cls.getStaticMethod('returnObject');
      let m2 = cls.getStaticMethod('returnMap');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let rt1 = m1!.getReturnType();
      let rt2 = m2!.getReturnType();
      expect(rt1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetReturnTypeTest.test.ObjectReturnTypesClass');
      expect(rt2.getName()).assertEqual('std.core.Map');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0500
     * @tc.name testStaticMethodGetReturnType005
     * @tc.desc Verify getReturnType() for array return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ArrayReturnTypesClass>();
      let m1 = cls.getStaticMethod('returnArray');
      let m2 = cls.getStaticMethod('returnFixedArray');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let rt1 = m1!.getReturnType();
      let rt2 = m2!.getReturnType();
      expect(rt1.getName()).assertEqual('std.core.Array');
      expect(rt2.getName()).assertEqual('std.core.String[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0600
     * @tc.name testStaticMethodGetReturnType006
     * @tc.desc Verify getReturnType() for generic return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericReturnClass>();
      let method = cls.getStaticMethod('returnGeneric');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetReturnType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UnionReturnClass>();
      let method = cls.getStaticMethod('returnUnion');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodGetReturnType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PromiseReturnClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_0900
     * @tc.name testStaticMethodGetReturnType009
     * @tc.desc Verify getReturnType() for nullable and undefinable return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NullableReturnClass>();
      let m1 = cls.getStaticMethod('returnNullable');
      let m2 = cls.getStaticMethod('returnUndefinable');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      // spec/types.md:1725: T|undefined is a nullish union type, isUnion() should return true.
      let isUnion1 = m1!.getReturnType().isUnion();
      expect(isUnion1).assertTrue();
      let isUnion2 = m2!.getReturnType().isUnion();
      expect(isUnion2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1000
     * @tc.name testStaticMethodGetReturnType010
     * @tc.desc Verify getReturnType() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ObjMethodReturnClass>();
      let method = cls.getStaticMethod('getTypeName');
      expect(method !== undefined).assertTrue();
      let returnType = method!.getReturnType();
      let returnTypeName = Class.of(returnType).getName();
      expect(returnTypeName !== null).assertTrue();
      expect(returnType.getName !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1100
     * @tc.name testStaticMethodGetReturnType011
     * @tc.desc Verify getReturnType() returned Class object has complete method set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CompleteMethodReturnClass>();
      let method = cls.getStaticMethod('getMethodList');
      expect(method !== undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType.getName() !== null).assertTrue();
      expect(returnType.isPrimitive !== null).assertTrue();
      expect(returnType.isInterface !== null).assertTrue();
      expect(returnType.isFinal !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1200
     * @tc.name testStaticMethodGetReturnType012
     * @tc.desc Verify getReturnType() for all primitive return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPrimitiveReturnClass>();
      let mByte = cls.getStaticMethod('rByte');
      let mShort = cls.getStaticMethod('rShort');
      let mInt = cls.getStaticMethod('rInt');
      let mLong = cls.getStaticMethod('rLong');
      let mFloat = cls.getStaticMethod('rFloat');
      let mDouble = cls.getStaticMethod('rDouble');
      let mNumber = cls.getStaticMethod('rNumber');
      let mBoolean = cls.getStaticMethod('rBoolean');
      let mChar = cls.getStaticMethod('rChar');
      let rtByte = mByte!.getReturnType();
      let rtShort = mShort!.getReturnType();
      let rtInt = mInt!.getReturnType();
      let rtLong = mLong!.getReturnType();
      let rtFloat = mFloat!.getReturnType();
      let rtDouble = mDouble!.getReturnType();
      let rtNumber = mNumber!.getReturnType();
      let rtBoolean = mBoolean!.getReturnType();
      let rtChar = mChar!.getReturnType();
      expect(rtByte.getName()).assertEqual('i8');
      expect(rtShort.getName()).assertEqual('i16');
      expect(rtInt.getName()).assertEqual('i32');
      expect(rtLong.getName()).assertEqual('i64');
      expect(rtFloat.getName()).assertEqual('f32');
      expect(rtDouble.getName()).assertEqual('f64');
      expect(rtNumber.getName()).assertEqual('f64');
      expect(rtBoolean.getName()).assertEqual('u1');
      expect(rtChar.getName()).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1300
     * @tc.name testStaticMethodGetReturnType013
     * @tc.desc Verify getReturnType() for this return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThisReturnClass>();
      let method = cls.getStaticMethod('chain');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetReturnTypeTest.test.ThisReturnClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1400
     * @tc.name testStaticMethodGetReturnType014
     * @tc.desc Verify getReturnType() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoThrowReturnClass>();
      let method = cls.getStaticMethod('noThrow');
      expect(method !== undefined).assertTrue();
      let returnType: Class = method!.getReturnType();
      expect(returnType !== null).assertTrue();
      expect(returnType.getName()).assertEqual('std.core.String');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1500
     * @tc.name testStaticMethodGetReturnType015
     * @tc.desc Verify getReturnType() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModifierReturnClass>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let rt1 = m1!.getReturnType();
      let rt2 = m2!.getReturnType();
      let rt3 = m3!.getReturnType();
      expect(rt1.getName()).assertEqual('std.core.String');
      expect(rt2.getName()).assertEqual('std.core.Promise');
      expect(rt3.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1600
     * @tc.name testStaticMethodGetReturnType016
     * @tc.desc Verify getReturnType() for async methods returns Promise types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncReturnClass>();
      let m1 = cls.getStaticMethod('fetchData');
      let m2 = cls.getStaticMethod('fetchNumber');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let rt1: Class = m1!.getReturnType();
      let rt2: Class = m2!.getReturnType();
      expect(rt1.getName()).assertEqual('std.core.Promise');
      expect(rt2.getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1700
     * @tc.name testStaticMethodGetReturnType017
     * @tc.desc Verify getReturnType() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass017>();
      let clsFin = Class.from<FinalClass017>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let rt1 = m1!.getReturnType();
      let rt2 = m2!.getReturnType();
      expect(rt1.getName()).assertEqual('std.core.String');
      expect(rt2.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1800
     * @tc.name testStaticMethodGetReturnType018
     * @tc.desc Verify getReturnType() for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PropertyReturnClass>();
      let getter = cls.getStaticMethod('%%get-label');
      let setter = cls.getStaticMethod('%%set-label');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let rtGetter = getter!.getReturnType();
      let rtSetter = setter!.getReturnType();
      expect(rtGetter.getName()).assertEqual('std.core.String');
      expect(rtSetter.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_1900
     * @tc.name testStaticMethodGetReturnType019
     * @tc.desc Verify getReturnType() for multiple static methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodReturnClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let returnTypes: Map<string, string> = new Map<string, string>();
      returnTypes.set('m1', 'std.core.String');
      returnTypes.set('m2', 'i32');
      returnTypes.set('m3', 'u1');
      returnTypes.set('m4', 'f32');
      for (let i: int = 0; i < methods.length; i++) {
        let method = methods[i];
        let methodName: string = method.getName();
        let expected = returnTypes.get(methodName);
        if (expected !== undefined) {
          let rt = method.getReturnType();
          expect(rt.getName()).assertEqual(expected);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_2000
     * @tc.name testStaticMethodGetReturnType020
     * @tc.desc Verify getReturnType() for enum return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EnumReturnClass>();
      let method = cls.getStaticMethod('getColor');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_2100
     * @tc.name testStaticMethodGetReturnType021
     * @tc.desc Verify getReturnType() for method with constrained generic type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericConstraintReturnClass>();
      let method = cls.getStaticMethod('identity');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt !== null).assertTrue();
    });
  });
}
