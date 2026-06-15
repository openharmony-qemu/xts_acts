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

class OpenAClass {
  public static openA(): string { return 'a'; }
}

class OpenBClass {
  public static openB(): int { return 1; }
}

class PrivateOnlyPubClass {
  private static privateMethod(): string { return 'priv'; }
}

class ProtectedOnlyPubClass {
  protected static protectedMethod(): string { return 'prot'; }
}

class DefaultPubClass {
  static defaultMethod(): string { return 'def'; }
}

class AsyncPubClass {
  public static async asyncMethod(): Promise<string> { return 'async'; }
}

class FinalPubClass {
  public static finalMethod(): string { return 'final'; }
}

class PrivateAsyncPubClass {
  private static async privateAsyncMethod(): Promise<int> { return 42; }
}

class VisibleAClass {
  public static visibleA(): boolean { return true; }
}

class VisibleBClass {
  public static visibleB(): float { return 1.0; }
}

class AllModifierPubClass {
  public static publicMethod(): string { return 'pub'; }
  private static privateMethod(): string { return 'priv'; }
  protected static protectedMethod(): string { return 'prot'; }
}

abstract class AbstractClass012 {
  public static abstractMethod(): string { return 'abs'; }
}

final class FinalClass013 {
  public static finalMethod(): int { return 0; }
}

class AttrPubClass {
  private static _attr: string = '';
  public static get attr(): string { return AttrPubClass._attr; }
  public static set attr(value: string) { AttrPubClass._attr = value; }
}

class ExplicitAClass {
  public static explicitA(): string { return 'x'; }
}

class PublicFinalPubClass {
  public static publicFinalMethod(): int { return 0; }
}

class PublicAsyncPubClass {
  public static async publicAsyncMethod(): Promise<string> { return 'async'; }
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedPubClass {
  @deprecated("5.0")
  public static deprecatedMethod(): string { return 'dep'; }
}

class FetchDataPubClass {
  public static async fetchData(): Promise<boolean> { return true; }
}

class PrivateAsyncCoverClass {
  private static async privateAsyncMethod(): Promise<string> { return 'priv'; }
}

abstract class AbstractClass021 {
  public static abstractPublic(): string { return 'abs'; }
}

final class FinalClass021 {
  public static finalPublic(): int { return 0; }
}

class NormalClass021 {
  public static normalPublic(): boolean { return true; }
}

class FactoryPubClass {
  public static factoryMethod(): FactoryPubClass { return new FactoryPubClass(); }
}

class ThreeModifierPubClass {
  public static publicMethod(): int { return 0; }
  private static privateMethod(): string { return 'p'; }
  protected static protectedMethod(): boolean { return true; }
}

class LastPubClass {
  public static lastPublic(): boolean { return false; }
}

class FourMethodPubClass {
  public static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
  public static m4(): float { return 1.0; }
}

export default function StaticMethodIsPublicTest(): void {
  describe('StaticMethodIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0100
     * @tc.name testStaticMethodIsPublic001
     * @tc.desc Verify isPublic() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OpenAClass>();
      let method = cls.getStaticMethod('openA');
      expect(method !== undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(isPublic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0200
     * @tc.name testStaticMethodIsPublic002
     * @tc.desc Verify isPublic() returns true for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OpenBClass>();
      let method = cls.getStaticMethod('openB');
      expect(method !== undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(isPublic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0300
     * @tc.name testStaticMethodIsPublic003
     * @tc.desc Verify private static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrivateOnlyPubClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0400
     * @tc.name testStaticMethodIsPublic004
     * @tc.desc Verify protected static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedOnlyPubClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0500
     * @tc.name testStaticMethodIsPublic005
     * @tc.desc Verify isPublic() for method with default access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DefaultPubClass>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method !== undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      // classes.md:835 — 无显式修饰符默认 public
      expect(isPublic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0600
     * @tc.name testStaticMethodIsPublic006
     * @tc.desc Verify isPublic() for async public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<AsyncPubClass>();
      let method = cls006.getStaticMethod('asyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0700
     * @tc.name testStaticMethodIsPublic007
     * @tc.desc Verify isPublic() for final public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<FinalPubClass>();
      let method = cls007.getStaticMethod('finalMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0800
     * @tc.name testStaticMethodIsPublic008
     * @tc.desc Verify private async static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls008 = Class.from<PrivateAsyncPubClass>();
      let methods = cls008.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0900
     * @tc.name testStaticMethodIsPublic009
     * @tc.desc Verify isPublic() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VisibleAClass>();
      let method = cls.getStaticMethod('visibleA');
      expect(method !== undefined).assertTrue();
      let isPublic = method!.isPublic();
      let isPublicType = Class.of(isPublic).getName();
      expect(isPublicType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1000
     * @tc.name testStaticMethodIsPublic010
     * @tc.desc Verify mutual exclusivity between isPublic, isPrivate, and isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllModifierPubClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let m1 = cls.getStaticMethod('publicMethod');
      expect(m1 !== undefined).assertTrue();
      let isPublicCheck: boolean = m1!.isPublic() && !m1!.isPrivate() && !m1!.isProtected();
      expect(isPublicCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1100
     * @tc.name testStaticMethodIsPublic011
     * @tc.desc Verify isPublic() for abstract class public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls012 = Class.from<AbstractClass012>();
      let method = cls012.getStaticMethod('abstractMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1200
     * @tc.name testStaticMethodIsPublic012
     * @tc.desc Verify isPublic() for final class public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls013 = Class.from<FinalClass013>();
      let method = cls013.getStaticMethod('finalMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1300
     * @tc.name testStaticMethodIsPublic013
     * @tc.desc Verify isPublic() for getter and setter methods which are usually public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AttrPubClass>();
      let getter = cls.getStaticMethod('%%get-attr');
      let setter = cls.getStaticMethod('%%set-attr');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isPublic()).assertTrue();
      expect(setter!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1400
     * @tc.name testStaticMethodIsPublic014
     * @tc.desc Verify isPublic() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ExplicitAClass>();
      let method = cls.getStaticMethod('explicitA');
      expect(method !== undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(isPublic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1500
     * @tc.name testStaticMethodIsPublic015
     * @tc.desc Verify isPublic() for public+final modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<PublicFinalPubClass>();
      let method = cls016.getStaticMethod('publicFinalMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1600
     * @tc.name testStaticMethodIsPublic016
     * @tc.desc Verify isPublic() for public+async modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<PublicAsyncPubClass>();
      let method = cls017.getStaticMethod('publicAsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1700
     * @tc.name testStaticMethodIsPublic017
     * @tc.desc Verify isPublic() for Deprecated public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls018 = Class.from<DeprecatedPubClass>();
      let method = cls018.getStaticMethod('deprecatedMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1800
     * @tc.name testStaticMethodIsPublic018
     * @tc.desc Verify isPublic() for async public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<FetchDataPubClass>();
      let method = cls019.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1900
     * @tc.name testStaticMethodIsPublic019
     * @tc.desc Verify async private static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls020 = Class.from<PrivateAsyncCoverClass>();
      let methods = cls020.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2000
     * @tc.name testStaticMethodIsPublic020
     * @tc.desc Verify isPublic() for normal, abstract, and final class public methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass021>();
      let clsFin = Class.from<FinalClass021>();
      let clsNor = Class.from<NormalClass021>();
      let m1 = clsAbs.getStaticMethod('abstractPublic');
      let m2 = clsFin.getStaticMethod('finalPublic');
      let m3 = clsNor.getStaticMethod('normalPublic');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isPublic()).assertTrue();
      expect(m2!.isPublic()).assertTrue();
      expect(m3!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2100
     * @tc.name testStaticMethodIsPublic021
     * @tc.desc Verify isPublic() for factory method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls022 = Class.from<FactoryPubClass>();
      let method = cls022.getStaticMethod('factoryMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2200
     * @tc.name testStaticMethodIsPublic022
     * @tc.desc Verify isPublic() counts public methods in a class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeModifierPubClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let publicCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPublic()) {
          publicCount++;
        }
      }
      expect(publicCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2300
     * @tc.name testStaticMethodIsPublic023
     * @tc.desc Verify isPublic() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls024 = Class.from<LastPubClass>();
      let method = cls024.getStaticMethod('lastPublic');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isNative()).assertFalse();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2400
     * @tc.name testStaticMethodIsPublic024
     * @tc.desc Verify filtering public methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourMethodPubClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let publicMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPublic()) {
          publicMethods.push(methods[i]);
        }
      }
      expect(publicMethods.length).assertEqual(2);
    });
  });
}
