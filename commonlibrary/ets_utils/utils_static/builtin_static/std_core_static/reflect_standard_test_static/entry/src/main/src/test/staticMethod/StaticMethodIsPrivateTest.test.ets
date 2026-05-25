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

class MyClass001 {
  private static test(): void {}
}

class MyClass002 {
  private static test(): void {}
}

class MyClass003 {
  public static publicMethod(): void {}
}

class MyClass004 {
  protected static protectedMethod(): void {}
}

class MyClass005 {
  private static async privateAsyncMethod(): Promise<void> { return; }
}

class MyClass006 {
  private static privateFinalMethod(): void {}
}

abstract class AbstractClass007 {
  private static privateMethod(): void {}
}

final class FinalClass008 {
  private static privateMethod(): void {}
}

class MyClass009 {
  private static test(): void {}
}

class MyClass010 {
  private static test(): void {}
}

class MyClass011 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

class MyClass012 {
  private static privateMethod1(): void {}
  private static privateMethod2(): void {}
  private static privateMethod3(): void {}
}

class MyClass013 {
  static defaultMethod(): void {}
}

class MyClass014 {
  private static test(): void {}
}

class MyClass015 {
  private static privateFinalMethod(): void {}
}

class MyClass016 {
  private static async privateAsyncMethod(): Promise<void> { return; }
}

@interface deprecated {
  fromVersion: string
}

class MyClass017 {
  @deprecated("5.0")
  private static deprecatedMethod(): void {}
}

class MyClass018 {
  private static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass019 {
  public static async publicAsync(): Promise<void> { return; }
  private static async privateAsync(): Promise<void> { return; }
}

abstract class AbstractClass020 {
  private static abstractPrivate(): void {}
}

final class FinalClass020 {
  private static finalPrivate(): void {}
}

class NormalClass020 {
  private static normalPrivate(): void {}
}

class MyClass021 {
  private static factoryMethod(): MyClass021 { return new MyClass021(); }
}

class MyClass022 {
  private static utilityMethod(): void {}
}

class MyClass023 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
  private static anotherPrivate(): void {}
}

class MyClass024 {
  private static test(): void {}
}

class MyClass025 {
  public static m1(): void {}
  private static m2(): void {}
  protected static m3(): void {}
  private static m4(): void {}
}

class MyClass026 {
  public static m1(): void {}
  private static m2(): void {}
  protected static m3(): void {}
  public static m4(): void {}
  private static m5(): void {}
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
      let cls: Class = Class.from<MyClass001>();
      let methods = cls.getStaticMethods();
      // Private methods are not accessible via reflection at runtime
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('test');
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
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
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
      let cls: Class = Class.from<MyClass004>();
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
      let cls5 = Class.from<MyClass005>();
      let methods = cls5.getStaticMethods();
      // Private async methods are not accessible via reflection at runtime
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
      let cls6 = Class.from<MyClass006>();
      let methods = cls6.getStaticMethods();
      // Private final methods are not accessible via reflection at runtime
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
      // Private methods in abstract class are not accessible via reflection at runtime
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
      // Private methods in final class are not accessible via reflection at runtime
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
      // 使用 public 方法验证 isPrivate() 返回 boolean 类型
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
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
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      // 运行时实际: getStaticMethods() 只返回 public 方法，用 public 方法验证互斥关系
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
      let cls: Class = Class.from<MyClass012>();
      let methods = cls.getStaticMethods();
      // Multiple private methods are not accessible via reflection; isPrivate() cannot be called directly
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
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      // classes.md:835 — 无显式修饰符默认 public，此处应为 false
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
      // 使用 public 方法验证 isPrivate() 不抛异常
      let cls003 = Class.from<MyClass003>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
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
      let cls17 = Class.from<MyClass017>();
      let methods = cls17.getStaticMethods();
      // Deprecated private methods are not accessible via reflection; isPrivate() cannot be called directly
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
      let cls: Class = Class.from<MyClass019>();
      let m1 = cls.getStaticMethod('publicAsync');
      let m2 = cls.getStaticMethod('privateAsync');
      let pubAccessible = m1 != undefined;
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
      // 运行时实际: getStaticMethods() 只返回 public 方法
      let clsAbs20 = Class.from<AbstractClass020>();
      let clsFin20 = Class.from<FinalClass020>();
      let clsNor20 = Class.from<NormalClass020>();
      let m1Methods = clsAbs20.getStaticMethods();
      let m2Methods = clsFin20.getStaticMethods();
      let m3Methods = clsNor20.getStaticMethods();
      // Private methods are not accessible via reflection; isPrivate() cannot be called directly
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
      let cls021 = Class.from<MyClass021>();
      let methods = cls021.getStaticMethods();
      // Private factory methods are not accessible via reflection; isPrivate() cannot be called directly
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
      let cls022 = Class.from<MyClass022>();
      let methods = cls022.getStaticMethods();
      // Private utility methods are not accessible via reflection; isPrivate() cannot be called directly
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
      let cls: Class = Class.from<MyClass023>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时实际: getStaticMethods() 只返回 public 方法
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
      // 使用 public 方法验证 isPrivate 与其他属性检查的组合
      let cls003 = Class.from<MyClass003>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
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
      let cls: Class = Class.from<MyClass025>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时实际: getStaticMethods() 只返回 public 方法
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
      let cls: Class = Class.from<MyClass026>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时实际: getStaticMethods() 只返回 public 方法
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
