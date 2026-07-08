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

class GuardedAClass {
   protected static guardedA(): string { return 'a'; }
}

class PublicOnlyProtClass {
   public static publicMethod(): string { return 'public'; }
}

class ProtectedAsyncClass {
   protected static async protectedAsyncMethod(): Promise<string> { return 'async'; }
}

class ProtectedFinalClass {
   protected static protectedFinalMethod(): string { return 'final'; }
}

abstract class AbstractClass007 {
   protected static protectedMethod(): string { return 'abs'; }
}

final class FinalClass008 {
   protected static protectedMethod(): int { return 0; }
}

class AllModifierProtClass {
  public static publicMethod(): string { return 'pub'; }
  private static privateMethod(): string { return 'priv'; }
  protected static protectedMethod(): string { return 'prot'; }
}

class ThreeProtectedMethodClass {
  protected static protectedMethod1(): string { return 'a'; }
  protected static protectedMethod2(): int { return 1; }
  protected static protectedMethod3(): boolean { return false; }
}

class DefaultProtClass {
  static defaultMethod(): string { return 'def'; }
}

class ParentClass014 {
  protected static parentProtected(): string { return 'parent'; }
}

class ChildClass014 extends ParentClass014 {
  protected static childProtected(): int { return 0; }
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedProtectedClass {
  @deprecated("5.0")
  protected static deprecatedMethod(): string { return 'dep'; }
}

class DualAsyncProtectedClass {
  public static async publicAsync(): Promise<string> { return 'public'; }
  protected static async protectedAsync(): Promise<int> { return 1; }
}

abstract class AbstractClass021 {
  protected static abstractProtected(): string { return 'abs'; }
}

final class FinalClass021 {
  protected static finalProtected(): int { return 0; }
}

class NormalClass021 {
  protected static normalProtected(): boolean { return true; }
}

class UtilityProtectedClass {
  protected static utilityMethod(): string { return 'util'; }
}

class HelperProtectedClass {
  protected static helperMethod(): int { return 0; }
}

class FourModifierProtClass {
  public static publicMethod(): string { return 'pub'; }
  private static privateMethod(): string { return 'priv'; }
  protected static protectedMethod(): string { return 'prot'; }
  protected static anotherProtected(): int { return 0; }
}

class FourMethodProtClass {
  public static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
  protected static m4(): float { return 1.0; }
}

class SixMethodProtClass {
  public static m1(): int { return 0; }
  private static m2(): string { return 'b'; }
  protected static m3(): float { return 1.0; }
  public static m4(): boolean { return true; }
  private static m5(): string { return 'e'; }
  protected static m6(): int { return 6; }
}

class ThreeMethodProtClass {
  public static publicMethod(): int { return 0; }
  private static privateMethod(): string { return 'p'; }
  protected static protectedMethod(): boolean { return true; }
}

export default function StaticMethodIsProtectedTest(): void {
  describe('StaticMethodIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0100
     * @tc.name testStaticMethodIsProtected001
     * @tc.desc Verify protected static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GuardedAClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('guardedA');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0200
     * @tc.name testStaticMethodIsProtected002
     * @tc.desc Verify isProtected() returns false for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlyProtClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0300
     * @tc.name testStaticMethodIsProtected003
     * @tc.desc Verify protected async static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<ProtectedAsyncClass>();
      let methods = cls005.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls005.getStaticMethod('protectedAsyncMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0400
     * @tc.name testStaticMethodIsProtected004
     * @tc.desc Verify protected final static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<ProtectedFinalClass>();
      let methods = cls006.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls006.getStaticMethod('protectedFinalMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0500
     * @tc.name testStaticMethodIsProtected005
     * @tc.desc Verify protected method in abstract class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<AbstractClass007>();
      let methods = cls007.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls007.getStaticMethod('protectedMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0600
     * @tc.name testStaticMethodIsProtected006
     * @tc.desc Verify protected method in final class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls008 = Class.from<FinalClass008>();
      let methods = cls008.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls008.getStaticMethod('protectedMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0700
     * @tc.name testStaticMethodIsProtected007
     * @tc.desc Verify isProtected() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlyProtClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isProtected = method!.isProtected();
      let isProtectedType = Class.of(isProtected).getName();
      expect(isProtectedType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0800
     * @tc.name testStaticMethodIsProtected008
     * @tc.desc Verify mutual exclusivity between isProtected, isPublic, and isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllModifierProtClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isProtected = method!.isProtected();
      let isPublic = method!.isPublic();
      let notProtectedAndPublic = !isProtected && isPublic;
      expect(notProtectedAndPublic).assertTrue();
      expect(method!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0900
     * @tc.name testStaticMethodIsProtected009
     * @tc.desc Verify multiple protected methods in same class are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeProtectedMethodClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1000
     * @tc.name testStaticMethodIsProtected010
     * @tc.desc Verify isProtected() for method with default access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DefaultProtClass>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method !== undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1100
     * @tc.name testStaticMethodIsProtected011
     * @tc.desc Verify protected methods in inheritance relationship are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass014>();
      let childCls = Class.from<ChildClass014>();
      let parentMethods = parentCls.getStaticMethods();
      let childMethods = childCls.getStaticMethods();
      expect(parentMethods.length).assertEqual(0);
      expect(childMethods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1200
     * @tc.name testStaticMethodIsProtected012
     * @tc.desc Verify isProtected() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls003 = Class.from<AllModifierProtClass>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1300
     * @tc.name testStaticMethodIsProtected013
     * @tc.desc Verify deprecated protected static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls018 = Class.from<DeprecatedProtectedClass>();
      let methods = cls018.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls018.getStaticMethod('deprecatedMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1400
     * @tc.name testStaticMethodIsProtected014
     * @tc.desc Verify isProtected() comparison between async public and async protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DualAsyncProtectedClass>();
      let m1 = cls.getStaticMethod('publicAsync');
      let m2 = cls.getStaticMethod('protectedAsync');
      let pubAccessible = m1 !== undefined;
      let protInaccessible = m2 === undefined;
      expect(pubAccessible).assertTrue();
      expect(protInaccessible).assertTrue();
      expect(m1!.isProtected()).assertFalse();
      expect(m1!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1500
     * @tc.name testStaticMethodIsProtected015
     * @tc.desc Verify protected methods in normal, abstract, and final classes are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass021>();
      let clsFin = Class.from<FinalClass021>();
      let clsNor = Class.from<NormalClass021>();
      let m1Methods = clsAbs.getStaticMethods();
      let m2Methods = clsFin.getStaticMethods();
      let m3Methods = clsNor.getStaticMethods();
      expect(m1Methods.length).assertEqual(0);
      expect(m2Methods.length).assertEqual(0);
      expect(m3Methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1600
     * @tc.name testStaticMethodIsProtected016
     * @tc.desc Verify protected utility and helper static methods are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls022 = Class.from<UtilityProtectedClass>();
      let cls023 = Class.from<HelperProtectedClass>();
      let m1Methods = cls022.getStaticMethods();
      let m2Methods = cls023.getStaticMethods();
      expect(m1Methods.length).assertEqual(0);
      expect(m2Methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1700
     * @tc.name testStaticMethodIsProtected017
     * @tc.desc Verify isProtected() counts protected methods in class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourModifierProtClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let protectedCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isProtected()) {
          protectedCount++;
        }
      }
      expect(protectedCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1800
     * @tc.name testStaticMethodIsProtected018
     * @tc.desc Verify isProtected() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls003 = Class.from<PublicOnlyProtClass>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1900
     * @tc.name testStaticMethodIsProtected019
     * @tc.desc Verify filtering protected methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourMethodProtClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let protectedMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isProtected()) {
          protectedMethods.push(methods[i]);
        }
      }
      expect(protectedMethods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2000
     * @tc.name testStaticMethodIsProtected020
     * @tc.desc Verify access level statistics across all methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SixMethodProtClass>();
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2100
     * @tc.name testStaticMethodIsProtected021
     * @tc.desc Verify each method has exactly one access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeMethodProtClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      for (let i: int = 0; i < methods.length; i++) {
        let method: reflect.StaticMethod = methods[i];
        let count: int = 0;
        if (method.isPublic()) count++;
        if (method.isPrivate()) count++;
        if (method.isProtected()) count++;
        expect(count).assertEqual(1);
      }
    });
  });
}
