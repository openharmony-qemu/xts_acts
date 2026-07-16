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

class HiddenAClass {
  private static hiddenA(): string { return 'a'; }
}

class PublicOnlyClass {
  public static publicMethod(): string { return 'public'; }
}

class ProtectedOnlyClass {
  protected static protectedMethod(): string { return 'protected'; }
}

class PrivateAsyncClassOnly {
  private static async privateAsyncMethod(): Promise<string> { return 'async'; }
}

class PrivateFinalClassOnly {
  private static privateFinalMethod(): string { return 'final'; }
}

abstract class AbstractClass007 {
  private static privateMethod(): string { return 'abs'; }
}

final class FinalClass008 {
  private static privateMethod(): int { return 0; }
}

class AllModifierPrivateClass {
  public static publicMethod(): string { return 'pub'; }
  private static privateMethod(): string { return 'priv'; }
  protected static protectedMethod(): string { return 'prot'; }
}

class ThreePrivateMethodClass {
  private static privateMethod1(): string { return 'a'; }
  private static privateMethod2(): int { return 1; }
  private static privateMethod3(): boolean { return false; }
}

class DefaultPrivateClass {
  static defaultMethod(): string { return 'default'; }
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedPrivateClass {
  @deprecated("5.0")
  private static deprecatedMethod(): string { return 'dep'; }
}

class DualAsyncPrivateClass {
  public static async publicAsync(): Promise<string> { return 'public'; }
  private static async privateAsync(): Promise<int> { return 1; }
}

abstract class AbstractClass020 {
  private static abstractPrivate(): string { return 'abs'; }
}

final class FinalClass020 {
  private static finalPrivate(): int { return 0; }
}

class NormalClass020 {
  private static normalPrivate(): boolean { return true; }
}

class FactoryPrivateClass {
  private static factoryMethod(): FactoryPrivateClass { return new FactoryPrivateClass(); }
}

class UtilityPrivateClass {
  private static utilityMethod(): string { return 'util'; }
}

class FourModifierPrivateClass {
  public static publicMethod(): string { return 'pub'; }
  private static privateMethod(): string { return 'priv'; }
  protected static protectedMethod(): string { return 'prot'; }
  private static anotherPrivate(): int { return 0; }
}

class FourMethodPrivateClass {
  public static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
  private static m4(): float { return 1.0; }
}

class FiveMethodPrivateClass {
  public static m1(): int { return 0; }
  private static m2(): string { return 'b'; }
  protected static m3(): float { return 1.0; }
  public static m4(): boolean { return true; }
  private static m5(): string { return 'e'; }
}

export default function StaticMethodIsPrivateTest(): void {
  describe('StaticMethodIsPrivateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0100
     * @tc.name testStaticMethodIsPrivate001
     * @tc.desc Verify private static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<HiddenAClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('hiddenA');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0200
     * @tc.name testStaticMethodIsPrivate002
     * @tc.desc Verify isPrivate() returns false for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlyClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0300
     * @tc.name testStaticMethodIsPrivate003
     * @tc.desc Verify protected static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedOnlyClass>();
      let methods = cls.getStaticMethods();
      // Protected methods are not accessible via reflection; isPrivate() cannot be called directly
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('protectedMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0400
     * @tc.name testStaticMethodIsPrivate004
     * @tc.desc Verify private async static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls5 = Class.from<PrivateAsyncClassOnly>();
      let methods = cls5.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls5.getStaticMethod('privateAsyncMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0500
     * @tc.name testStaticMethodIsPrivate005
     * @tc.desc Verify private final static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls6 = Class.from<PrivateFinalClassOnly>();
      let methods = cls6.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls6.getStaticMethod('privateFinalMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0600
     * @tc.name testStaticMethodIsPrivate006
     * @tc.desc Verify private method in abstract class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls7 = Class.from<AbstractClass007>();
      let methods = cls7.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls7.getStaticMethod('privateMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0700
     * @tc.name testStaticMethodIsPrivate007
     * @tc.desc Verify private method in final class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls8 = Class.from<FinalClass008>();
      let methods = cls8.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls8.getStaticMethod('privateMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0800
     * @tc.name testStaticMethodIsPrivate008
     * @tc.desc Verify isPrivate() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlyClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isPrivate = method!.isPrivate();
      let isPrivateType = Class.of(isPrivate).getName();
      expect(isPrivateType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_0900
     * @tc.name testStaticMethodIsPrivate009
     * @tc.desc Verify mutual exclusivity between isPrivate, isPublic, and isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllModifierPrivateClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isPrivate = method!.isPrivate();
      let isPublic = method!.isPublic();
      let notPrivateAndPublic = !isPrivate && isPublic;
      expect(notPrivateAndPublic).assertTrue();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1000
     * @tc.name testStaticMethodIsPrivate010
     * @tc.desc Verify multiple private methods in same class are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreePrivateMethodClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1100
     * @tc.name testStaticMethodIsPrivate011
     * @tc.desc Verify isPrivate() for method with default access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DefaultPrivateClass>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method !== undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1200
     * @tc.name testStaticMethodIsPrivate012
     * @tc.desc Verify isPrivate() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls003 = Class.from<AllModifierPrivateClass>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1300
     * @tc.name testStaticMethodIsPrivate013
     * @tc.desc Verify deprecated private static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls17 = Class.from<DeprecatedPrivateClass>();
      let methods = cls17.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls17.getStaticMethod('deprecatedMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1400
     * @tc.name testStaticMethodIsPrivate014
     * @tc.desc Verify isPrivate() comparison between async public and async private methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DualAsyncPrivateClass>();
      let m1 = cls.getStaticMethod('publicAsync');
      let m2 = cls.getStaticMethod('privateAsync');
      let pubAccessible = m1 !== undefined;
      let privInaccessible = m2 === undefined;
      expect(pubAccessible).assertTrue();
      expect(privInaccessible).assertTrue();
      expect(m1!.isPrivate()).assertFalse();
      expect(m1!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1500
     * @tc.name testStaticMethodIsPrivate015
     * @tc.desc Verify private methods in normal, abstract, and final classes are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs20 = Class.from<AbstractClass020>();
      let clsFin20 = Class.from<FinalClass020>();
      let clsNor20 = Class.from<NormalClass020>();
      let m1Methods = clsAbs20.getStaticMethods();
      let m2Methods = clsFin20.getStaticMethods();
      let m3Methods = clsNor20.getStaticMethods();
      expect(m1Methods.length).assertEqual(0);
      expect(m2Methods.length).assertEqual(0);
      expect(m3Methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1600
     * @tc.name testStaticMethodIsPrivate016
     * @tc.desc Verify private factory static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls021 = Class.from<FactoryPrivateClass>();
      let methods = cls021.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls021.getStaticMethod('factoryMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1700
     * @tc.name testStaticMethodIsPrivate017
     * @tc.desc Verify private utility static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls022 = Class.from<UtilityPrivateClass>();
      let methods = cls022.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls022.getStaticMethod('utilityMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1800
     * @tc.name testStaticMethodIsPrivate018
     * @tc.desc Verify isPrivate() counts private methods in a class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourModifierPrivateClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let privateCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateCount++;
        }
      }
      expect(privateCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_1900
     * @tc.name testStaticMethodIsPrivate019
     * @tc.desc Verify isPrivate() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls003 = Class.from<PublicOnlyClass>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_2000
     * @tc.name testStaticMethodIsPrivate020
     * @tc.desc Verify filtering private methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourMethodPrivateClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let privateMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateMethods.push(methods[i]);
        }
      }
      expect(privateMethods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_2100
     * @tc.name testStaticMethodIsPrivate021
     * @tc.desc Verify access level statistics across all methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FiveMethodPrivateClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let publicCount: int = 0;
      let privateCount: int = 0;
      let protectedCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPublic()) {
          publicCount++;
        } else if (methods[i].isPrivate()) {
          privateCount++;
        } else if (methods[i].isProtected()) {
          protectedCount++;
        }
      }
      expect(publicCount).assertEqual(2);
      expect(privateCount).assertEqual(0);
      expect(protectedCount).assertEqual(0);
    });
  });
}
