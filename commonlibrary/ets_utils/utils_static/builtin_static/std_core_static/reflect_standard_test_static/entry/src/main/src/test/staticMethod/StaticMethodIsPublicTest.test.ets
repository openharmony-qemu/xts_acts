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
  public static test(): void {}
}

class MyClass002 {
  public static test(): void {}
}

class MyClass003 {
  private static privateMethod(): void {}
}

class MyClass004 {
  protected static protectedMethod(): void {}
}

class MyClass005 {
  static defaultMethod(): void {}
}

class MyClass006 {
  public static async asyncMethod(): Promise<void> { return; }
}

class MyClass007 {
  public static finalMethod(): void {}
}

class MyClass008 {
  private static async privateAsyncMethod(): Promise<void> { return; }
}

class MyClass009 {
  public static test(): void {}
}

class MyClass010 {
  public static test(): void {}
}

class MyClass011 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

abstract class AbstractClass012 {
  public static abstractMethod(): void {}
}

final class FinalClass013 {
  public static finalMethod(): void {}
}

class MyClass014 {
  private static _name: string = '';
  public static get name(): string { return MyClass014._name; }
  public static set name(value: string) { MyClass014._name = value; }
}

class MyClass015 {
  public static test(): void {}
}

class MyClass016 {
  public static publicFinalMethod(): void {}
}

class MyClass017 {
  public static async publicAsyncMethod(): Promise<void> { return; }
}

class MyClass018 {
  public static deprecatedMethod(): void {}
}

class MyClass019 {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass020 {
  private static async privateAsyncMethod(): Promise<void> { return; }
}

abstract class AbstractClass021 {
  public static abstractPublic(): void {}
}

final class FinalClass021 {
  public static finalPublic(): void {}
}

class NormalClass021 {
  public static normalPublic(): void {}
}

class MyClass022 {
  public static factoryMethod(): MyClass022 { return new MyClass022(); }
}

class MyClass023 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

class MyClass024 {
  public static test(): void {}
}

class MyClass025 {
  public static m1(): void {}
  private static m2(): void {}
  protected static m3(): void {}
  public static m4(): void {}
}

export default function StaticMethodIsPublicTest(): void {
  describe('StaticMethodIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0100
     * @tc.name testStaticMethodIsPublic001
     * @tc.desc Verify isPublic() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0200
     * @tc.name testStaticMethodIsPublic002
     * @tc.desc Verify isPublic() returns true for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(isPublic).assertTrue();
      expect(typeof isPublic).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0300
     * @tc.name testStaticMethodIsPublic003
     * @tc.desc Verify isPublic() returns false for private static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0400
     * @tc.name testStaticMethodIsPublic004
     * @tc.desc Verify isPublic() returns false for protected static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
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
    it('testStaticMethodIsPublic005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0600
     * @tc.name testStaticMethodIsPublic006
     * @tc.desc Verify isPublic() for async public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass006>().getStaticMethod('asyncMethod');
      expect(method != undefined).assertTrue();
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
    it('testStaticMethodIsPublic007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass007>().getStaticMethod('finalMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_0800
     * @tc.name testStaticMethodIsPublic008
     * @tc.desc Verify isPublic() returns false for private async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass008>().getStaticMethods();
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
    it('testStaticMethodIsPublic009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(typeof isPublic).assertEqual('boolean');
      expect(isPublic === true || isPublic === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1000
     * @tc.name testStaticMethodIsPublic010
     * @tc.desc Verify isPublic() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
      expect(isPublic === true || isPublic === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1100
     * @tc.name testStaticMethodIsPublic011
     * @tc.desc Verify mutual exclusivity between isPublic, isPrivate, and isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let m1 = cls.getStaticMethod('publicMethod');
      expect(m1 != undefined).assertTrue();
      expect(m1!.isPublic() && !m1!.isPrivate() && !m1!.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1200
     * @tc.name testStaticMethodIsPublic012
     * @tc.desc Verify isPublic() for abstract class public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<AbstractClass012>().getStaticMethod('abstractMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1300
     * @tc.name testStaticMethodIsPublic013
     * @tc.desc Verify isPublic() for final class public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<FinalClass013>().getStaticMethod('finalMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1400
     * @tc.name testStaticMethodIsPublic014
     * @tc.desc Verify isPublic() for getter and setter methods which are usually public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.isPublic()).assertTrue();
      expect(setter!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1500
     * @tc.name testStaticMethodIsPublic015
     * @tc.desc Verify isPublic() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isPublic: boolean = method!.isPublic();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1600
     * @tc.name testStaticMethodIsPublic016
     * @tc.desc Verify isPublic() for public+final modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass016>().getStaticMethod('publicFinalMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1700
     * @tc.name testStaticMethodIsPublic017
     * @tc.desc Verify isPublic() for public+async modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass017>().getStaticMethod('publicAsyncMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1800
     * @tc.name testStaticMethodIsPublic018
     * @tc.desc Verify isPublic() for Deprecated public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass018>().getStaticMethod('deprecatedMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_1900
     * @tc.name testStaticMethodIsPublic019
     * @tc.desc Verify isPublic() for async public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass019>().getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2000
     * @tc.name testStaticMethodIsPublic020
     * @tc.desc Verify isPublic() returns false for async private method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass020>().getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2100
     * @tc.name testStaticMethodIsPublic021
     * @tc.desc Verify isPublic() for normal, abstract, and final class public methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass021>().getStaticMethod('abstractPublic');
      let m2 = Class.from<FinalClass021>().getStaticMethod('finalPublic');
      let m3 = Class.from<NormalClass021>().getStaticMethod('normalPublic');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isPublic()).assertTrue();
      expect(m2!.isPublic()).assertTrue();
      expect(m3!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2200
     * @tc.name testStaticMethodIsPublic022
     * @tc.desc Verify isPublic() for factory method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass022>().getStaticMethod('factoryMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2300
     * @tc.name testStaticMethodIsPublic023
     * @tc.desc Verify isPublic() counts public methods in a class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass023>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2400
     * @tc.name testStaticMethodIsPublic024
     * @tc.desc Verify isPublic() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass024>().getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isNative()).assertFalse();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_2500
     * @tc.name testStaticMethodIsPublic025
     * @tc.desc Verify filtering public methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass025>();
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
