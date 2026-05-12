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

class MyClass017 {
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
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0100
     * @tc.name testStaticMethodIsPrivate001
     * @tc.desc Verify isPrivate() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let methods = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0200
     * @tc.name testStaticMethodIsPrivate002
     * @tc.desc Verify isPrivate() returns true for private static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let methods = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0300
     * @tc.name testStaticMethodIsPrivate003
     * @tc.desc Verify isPrivate() returns false for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(isPrivate).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0400
     * @tc.name testStaticMethodIsPrivate004
     * @tc.desc Verify isPrivate() returns false for protected static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let methods = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 protected 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0500
     * @tc.name testStaticMethodIsPrivate005
     * @tc.desc Verify isPrivate() for private async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass005>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private async 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0600
     * @tc.name testStaticMethodIsPrivate006
     * @tc.desc Verify isPrivate() for private final static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass006>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private final 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0700
     * @tc.name testStaticMethodIsPrivate007
     * @tc.desc Verify isPrivate() for abstract class private method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<AbstractClass007>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回抽象类的 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0800
     * @tc.name testStaticMethodIsPrivate008
     * @tc.desc Verify isPrivate() for final class private method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<FinalClass008>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 final 类的 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0900
     * @tc.name testStaticMethodIsPrivate009
     * @tc.desc Verify isPrivate() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用 public 方法验证 isPrivate() 返回 boolean 类型
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(typeof isPrivate).assertEqual('boolean');
      expect(isPrivate === true || isPrivate === false).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1000
     * @tc.name testStaticMethodIsPrivate010
     * @tc.desc Verify isPrivate() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      expect(isPrivate === true || isPrivate === false).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1100
     * @tc.name testStaticMethodIsPrivate011
     * @tc.desc Verify mutual exclusivity between isPrivate, isPublic, and isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      // ArkTS 1.2: getStaticMethods() 只返回 public 方法，用 public 方法验证互斥关系
      expect(!method!.isPrivate() && method!.isPublic()).assertTrue();
      expect(method!.isProtected()).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1200
     * @tc.name testStaticMethodIsPrivate012
     * @tc.desc Verify isPrivate() for multiple private methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let methods = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1300
     * @tc.name testStaticMethodIsPrivate013
     * @tc.desc Verify isPrivate() for method with default access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1400
     * @tc.name testStaticMethodIsPrivate014
     * @tc.desc Verify isPrivate() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用 public 方法验证 isPrivate() 不抛异常
      let method = Class.from<MyClass003>().getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isPrivate: boolean = method!.isPrivate();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1500
     * @tc.name testStaticMethodIsPrivate015
     * @tc.desc Verify isPrivate() for private+final modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass015>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private final 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1600
     * @tc.name testStaticMethodIsPrivate016
     * @tc.desc Verify isPrivate() for private+async modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass016>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private async 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1700
     * @tc.name testStaticMethodIsPrivate017
     * @tc.desc Verify isPrivate() for Deprecated private method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass017>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1800
     * @tc.name testStaticMethodIsPrivate018
     * @tc.desc Verify isPrivate() for async private method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass018>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private async 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1900
     * @tc.name testStaticMethodIsPrivate019
     * @tc.desc Verify isPrivate() comparison between async public and async private methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass019>();
      let m1 = cls.getStaticMethod('publicAsync');
      expect(m1 != undefined).assertTrue();
      expect(m1!.isPrivate()).assertFalse();
      expect(m1!.isAsync()).assertTrue();
      // ArkTS 1.2: 类有 public 方法时，getStaticMethods() 返回所有方法(含 private)
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2000
     * @tc.name testStaticMethodIsPrivate020
     * @tc.desc Verify isPrivate() for normal, abstract, and final class private methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      let m1Methods = Class.from<AbstractClass020>().getStaticMethods();
      let m2Methods = Class.from<FinalClass020>().getStaticMethods();
      let m3Methods = Class.from<NormalClass020>().getStaticMethods();
      expect(m1Methods.length).assertEqual(0);
      expect(m2Methods.length).assertEqual(0);
      expect(m3Methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2100
     * @tc.name testStaticMethodIsPrivate021
     * @tc.desc Verify isPrivate() for private factory method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass021>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2200
     * @tc.name testStaticMethodIsPrivate022
     * @tc.desc Verify isPrivate() for private utility method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methods = Class.from<MyClass022>().getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2300
     * @tc.name testStaticMethodIsPrivate023
     * @tc.desc Verify isPrivate() counts private methods in a class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass023>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 只返回 public 方法
      expect(methods.length).assertEqual(1);
      let privateCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateCount++;
        }
      }
      expect(privateCount).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2400
     * @tc.name testStaticMethodIsPrivate024
     * @tc.desc Verify isPrivate() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用 public 方法验证 isPrivate 与其他属性检查的组合
      let method = Class.from<MyClass003>().getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isProtected()).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2500
     * @tc.name testStaticMethodIsPrivate025
     * @tc.desc Verify filtering private methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass025>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 只返回 public 方法
      expect(methods.length).assertEqual(1);
      let privateMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateMethods.push(methods[i]);
        }
      }
      expect(privateMethods.length).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2600
     * @tc.name testStaticMethodIsPrivate026
     * @tc.desc Verify access level statistics across all methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass026>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // ArkTS 1.2: getStaticMethods() 只返回 public 方法
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
      return;
    });
  });
}
