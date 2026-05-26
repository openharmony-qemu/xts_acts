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

class NativeCheckClass {
  public static isNativeCheck(): boolean { return false; }
}

class VerifyNativeClass {
  public static verifyNative(): string { return 'native'; }
}

class UserDefinedNativeClass {
  public static userMethod(): string { return 'user defined'; }
}

abstract class AbstractClass004 {
  public static abstractMethod(): string { return 'abstract'; }
}

final class FinalClass005 {
  public static finalMethod(): int { return 0; }
}

class AsyncNativeClass {
  public static async asyncMethod(): Promise<int> { return 42; }
}

class PropNativeClass {
  private static _prop: string = '';
  public static get prop(): string { return PropNativeClass._prop; }
  public static set prop(value: string) { PropNativeClass._prop = value; }
}

class GetNativeFlagClass {
  public static getNativeFlag(): boolean { return false; }
}

class SafeNativeClass {
  public static safeNative(): string { return 'safe'; }
}

class ModifierNativeClass {
  public static publicMethod(): string { return 'public'; }
  private static privateMethod(): string { return 'private'; }
  protected static protectedMethod(): string { return 'protected'; }
}

@interface deprecated {
  fromVersion: string
}

@interface TestAnno009 {}

class AnnoNativeClass {
  @TestAnno009
  @deprecated("5.0")
  public static deprecatedMethod(): string { return 'deprecated'; }
  @TestAnno009
  public static finalMethod(): int { return 0; }
}

class LastCheckNativeClass {
  public static lastCheck(): boolean { return false; }
}

class MultiMethodNativeClass {
  public static normalMethod(): string { return 'normal'; }
  public static async asyncMethod(): Promise<string> { return 'async'; }
  public static finalMethod(): int { return 0; }
}

class FetchDataNativeClass {
  public static async fetchData(): Promise<string> { return 'data'; }
}

abstract class AbstractClass015 {
  public static abstractMethod(): boolean { return true; }
}

final class FinalClass015 {
  public static finalMethod(): string { return 'final'; }
}

class NormalClass015 {
  public static normalMethod(): int { return 0; }
}

class AttrNativeClass {
  private static _attr: string = '';
  public static get attr(): string { return AttrNativeClass._attr; }
  public static set attr(value: string) { AttrNativeClass._attr = value; }
}

class MultiArgNativeClass {
  public static method1(a: int): int { return a; }
  public static method2(s: string): string { return s; }
  public static method3(b: boolean): boolean { return b; }
}

class BatchCheckNativeClass {
  public static batchCheck(): boolean { return false; }
}

class CustomNativeClass {
  public static myMethod(value: float): float { return value; }
}

export default function StaticMethodIsNativeTest(): void {
  describe('StaticMethodIsNativeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0100
     * @tc.name testStaticMethodIsNative001
     * @tc.desc Verify isNative() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NativeCheckClass>();
      let method = cls.getStaticMethod('isNativeCheck');
      expect(method !== undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0200
     * @tc.name testStaticMethodIsNative002
     * @tc.desc Verify isNative() returns false for normal user-defined static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VerifyNativeClass>();
      let method = cls.getStaticMethod('verifyNative');
      expect(method !== undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0300
     * @tc.name testStaticMethodIsNative003
     * @tc.desc Verify isNative() returns false for user-defined class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UserDefinedNativeClass>();
      let method = cls.getStaticMethod('userMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0400
     * @tc.name testStaticMethodIsNative004
     * @tc.desc Verify isNative() returns false for abstract class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls004 = Class.from<AbstractClass004>();
      let method = cls004.getStaticMethod('abstractMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0500
     * @tc.name testStaticMethodIsNative005
     * @tc.desc Verify isNative() returns false for final class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<FinalClass005>();
      let method = cls005.getStaticMethod('finalMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0600
     * @tc.name testStaticMethodIsNative006
     * @tc.desc Verify isNative() returns false for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<AsyncNativeClass>();
      let method = cls006.getStaticMethod('asyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0700
     * @tc.name testStaticMethodIsNative007
     * @tc.desc Verify isNative() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetNativeFlagClass>();
      let method = cls.getStaticMethod('getNativeFlag');
      expect(method !== undefined).assertTrue();
      let isNative = method!.isNative();
      let isNativeType = Class.of(isNative).getName();
      expect(isNativeType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0800
     * @tc.name testStaticMethodIsNative008
     * @tc.desc Verify isNative() returns false for all access level methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModifierNativeClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let m1 = cls.getStaticMethod('publicMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0900
     * @tc.name testStaticMethodIsNative009
     * @tc.desc Verify isNative() returns false for annotated methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AnnoNativeClass>();
      let m1 = cls.getStaticMethod('deprecatedMethod');
      let m2 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1000
     * @tc.name testStaticMethodIsNative010
     * @tc.desc Verify isNative() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LastCheckNativeClass>();
      let method = cls.getStaticMethod('lastCheck');
      expect(method !== undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1100
     * @tc.name testStaticMethodIsNative011
     * @tc.desc Verify isNative() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodNativeClass>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
      expect(m3!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1200
     * @tc.name testStaticMethodIsNative012
     * @tc.desc Verify isNative() returns false for async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FetchDataNativeClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1300
     * @tc.name testStaticMethodIsNative013
     * @tc.desc Verify isNative() for normal, abstract, and final class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass015>();
      let clsFin = Class.from<FinalClass015>();
      let clsNor = Class.from<NormalClass015>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      let m3 = clsNor.getStaticMethod('normalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
      expect(m3!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1400
     * @tc.name testStaticMethodIsNative014
     * @tc.desc Verify isNative() for getter and setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AttrNativeClass>();
      let getter = cls.getStaticMethod('%%get-attr');
      let setter = cls.getStaticMethod('%%set-attr');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isNative()).assertFalse();
      expect(setter!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1500
     * @tc.name testStaticMethodIsNative015
     * @tc.desc Verify isNative() returns false for all user-defined static methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiArgNativeClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      for (let i: int = 0; i < methods.length; i++) {
        let isNative: boolean = methods[i].isNative();
        expect(isNative).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1600
     * @tc.name testStaticMethodIsNative016
     * @tc.desc Verify isNative() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls018 = Class.from<BatchCheckNativeClass>();
      let method = cls018.getStaticMethod('batchCheck');
      expect(method !== undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1700
     * @tc.name testStaticMethodIsNative017
     * @tc.desc Verify isNative() on built-in Array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<Array<int>>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(0);
      for (let i: int = 0; i < methods.length; i++) {
        let isNative: boolean = methods[i].isNative();
        let isNativeType = Class.of(isNative).getName();
        expect(isNativeType).assertEqual('std.core.Boolean');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1800
     * @tc.name testStaticMethodIsNative018
     * @tc.desc Verify isNative() comparison between built-in and user-defined methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<CustomNativeClass>();
      let userMethod = cls019.getStaticMethod('myMethod');
      expect(userMethod !== undefined).assertTrue();
      expect(userMethod!.isNative()).assertFalse();
      let arrayCls: Class = Class.from<Array<int>>();
      let arrayMethods = arrayCls.getStaticMethods();
      for (let i: int = 0; i < arrayMethods.length; i++) {
        let isNative = arrayMethods[i].isNative();
        let isNativeType = Class.of(isNative).getName();
        expect(isNativeType).assertEqual('std.core.Boolean');
      }
    });
  });
}
