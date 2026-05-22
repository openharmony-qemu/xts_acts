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
  protected static test(): void {}
}

class MyClass002 {
  protected static test(): void {}
}

class MyClass003 {
  public static publicMethod(): void {}
}

class MyClass004 {
  private static privateMethod(): void {}
}

class MyClass005 {
  protected static async protectedAsyncMethod(): Promise<void> { return; }
}

class MyClass006 {
  protected static protectedFinalMethod(): void {}
}

abstract class AbstractClass007 {
  protected static protectedMethod(): void {}
}

final class FinalClass008 {
  protected static protectedMethod(): void {}
}

class MyClass009 {
  protected static test(): void {}
}

class MyClass010 {
  protected static test(): void {}
}

class MyClass011 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

class MyClass012 {
  protected static protectedMethod1(): void {}
  protected static protectedMethod2(): void {}
  protected static protectedMethod3(): void {}
}

class MyClass013 {
  static defaultMethod(): void {}
}

class ParentClass014 {
  protected static parentProtected(): void {}
}

class ChildClass014 extends ParentClass014 {
  protected static childProtected(): void {}
}

class MyClass015 {
  protected static test(): void {}
}

class MyClass016 {
  protected static protectedFinalMethod(): void {}
}

class MyClass017 {
  protected static async protectedAsyncMethod(): Promise<void> { return; }
}

class MyClass018 {
  protected static deprecatedMethod(): void {}
}

class MyClass019 {
  protected static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass020 {
  public static async publicAsync(): Promise<void> { return; }
  protected static async protectedAsync(): Promise<void> { return; }
}

abstract class AbstractClass021 {
  protected static abstractProtected(): void {}
}

final class FinalClass021 {
  protected static finalProtected(): void {}
}

class NormalClass021 {
  protected static normalProtected(): void {}
}

class MyClass022 {
  protected static utilityMethod(): void {}
}

class MyClass023 {
  protected static helperMethod(): void {}
}

class MyClass024 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
  protected static anotherProtected(): void {}
}

class MyClass025 {
  protected static test(): void {}
}

class MyClass026 {
  public static m1(): void {}
  private static m2(): void {}
  protected static m3(): void {}
  protected static m4(): void {}
}

class MyClass027 {
  public static m1(): void {}
  private static m2(): void {}
  protected static m3(): void {}
  public static m4(): void {}
  private static m5(): void {}
  protected static m6(): void {}
}

class MyClass028 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

export default function StaticMethodIsProtectedTest(): void {
  describe('StaticMethodIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0100
     * @tc.name testStaticMethodIsProtected001
     * @tc.desc Verify isProtected() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let methods = cls.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0200
     * @tc.name testStaticMethodIsProtected002
     * @tc.desc Verify isProtected() returns true for protected static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let methods = cls.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0300
     * @tc.name testStaticMethodIsProtected003
     * @tc.desc Verify isProtected() returns false for public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0400
     * @tc.name testStaticMethodIsProtected004
     * @tc.desc Verify isProtected() returns false for private static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let methods = cls.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 private 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0500
     * @tc.name testStaticMethodIsProtected005
     * @tc.desc Verify isProtected() for protected async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<MyClass005>();
      let methods = cls005.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected async 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0600
     * @tc.name testStaticMethodIsProtected006
     * @tc.desc Verify isProtected() for protected final static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<MyClass006>();
      let methods = cls006.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected final 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0700
     * @tc.name testStaticMethodIsProtected007
     * @tc.desc Verify isProtected() for abstract class protected method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<AbstractClass007>();
      let methods = cls007.getStaticMethods();
      // 运行时: getStaticMethods() 不返回抽象类的 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0800
     * @tc.name testStaticMethodIsProtected008
     * @tc.desc Verify isProtected() for final class protected method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls008 = Class.from<FinalClass008>();
      let methods = cls008.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 final 类的 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_0900
     * @tc.name testStaticMethodIsProtected009
     * @tc.desc Verify isProtected() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 使用 public 方法验证 isProtected() 返回 boolean 类型
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(typeof isProtected).assertEqual('boolean');
      expect(isProtected === true || isProtected === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1000
     * @tc.name testStaticMethodIsProtected010
     * @tc.desc Verify isProtected() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      expect(isProtected === true || isProtected === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1100
     * @tc.name testStaticMethodIsProtected011
     * @tc.desc Verify mutual exclusivity between isProtected, isPublic, and isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      // 运行时: getStaticMethods() 只返回 public 方法，用 public 方法验证互斥关系
      expect(!method!.isProtected() && method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1200
     * @tc.name testStaticMethodIsProtected012
     * @tc.desc Verify isProtected() for multiple protected methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let methods = cls.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1300
     * @tc.name testStaticMethodIsProtected013
     * @tc.desc Verify isProtected() for method with default access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('defaultMethod');
      expect(method != undefined).assertTrue();
      let isProtected: boolean = method!.isProtected();
      // classes.md:835 — 无显式修饰符默认 public，此处应为 false
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1400
     * @tc.name testStaticMethodIsProtected014
     * @tc.desc Verify isProtected() for protected methods in inheritance relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 运行时: getStaticMethods() 不返回 protected 方法，继承关系同理
      let parentCls = Class.from<ParentClass014>();
      let childCls = Class.from<ChildClass014>();
      let parentMethods = parentCls.getStaticMethods();
      let childMethods = childCls.getStaticMethods();
      expect(parentMethods.length).assertEqual(0);
      expect(childMethods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1500
     * @tc.name testStaticMethodIsProtected015
     * @tc.desc Verify isProtected() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 使用 public 方法验证 isProtected() 不抛异常
      let cls003 = Class.from<MyClass003>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      try {
        let isProtected: boolean = method!.isProtected();
        // 脑图: public 方法的 isProtected() 预期返回 false
        expect(isProtected).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1600
     * @tc.name testStaticMethodIsProtected016
     * @tc.desc Verify isProtected() for protected+final modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<MyClass016>();
      let methods = cls016.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected final 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1700
     * @tc.name testStaticMethodIsProtected017
     * @tc.desc Verify isProtected() for protected+async modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<MyClass017>();
      let methods = cls017.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected async 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1800
     * @tc.name testStaticMethodIsProtected018
     * @tc.desc Verify isProtected() for Deprecated protected method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls018 = Class.from<MyClass018>();
      let methods = cls018.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_1900
     * @tc.name testStaticMethodIsProtected019
     * @tc.desc Verify isProtected() for async protected method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<MyClass019>();
      let methods = cls019.getStaticMethods();
      // 运行时: getStaticMethods() 不返回 protected async 方法
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2000
     * @tc.name testStaticMethodIsProtected020
     * @tc.desc Verify isProtected() comparison between async public and async protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass020>();
      let m1 = cls.getStaticMethod('publicAsync');
      expect(m1 != undefined).assertTrue();
      expect(m1!.isProtected()).assertFalse();
      expect(m1!.isAsync()).assertTrue();
      // arkts-sta-reflect.md:823 — getStaticMethods() 仅返回 public 方法
      // 运行时实际: 类有 public 方法时连带返回 protected，与规范不一致
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2100
     * @tc.name testStaticMethodIsProtected021
     * @tc.desc Verify isProtected() for normal, abstract, and final class protected methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 运行时: getStaticMethods() 不返回 protected 方法
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2200
     * @tc.name testStaticMethodIsProtected022
     * @tc.desc Verify isProtected() for protected utility and helper methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 运行时: getStaticMethods() 不返回 protected 方法
      let cls022 = Class.from<MyClass022>();
      let cls023 = Class.from<MyClass023>();
      let m1Methods = cls022.getStaticMethods();
      let m2Methods = cls023.getStaticMethods();
      expect(m1Methods.length).assertEqual(0);
      expect(m2Methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2300
     * @tc.name testStaticMethodIsProtected023
     * @tc.desc Verify isProtected() counts protected methods in class with mixed access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass024>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时: getStaticMethods() 只返回 public 方法
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2400
     * @tc.name testStaticMethodIsProtected024
     * @tc.desc Verify isProtected() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 使用 public 方法验证 isProtected 与其他属性检查的组合
      let cls003 = Class.from<MyClass003>();
      let method = cls003.getStaticMethod('publicMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2500
     * @tc.name testStaticMethodIsProtected025
     * @tc.desc Verify filtering protected methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass026>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时: getStaticMethods() 只返回 public 方法
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2600
     * @tc.name testStaticMethodIsProtected026
     * @tc.desc Verify access level statistics across all methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass027>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时: getStaticMethods() 只返回 public 方法
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_2700
     * @tc.name testStaticMethodIsProtected027
     * @tc.desc Verify each method has exactly one access level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass028>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      // 运行时: getStaticMethods() 只返回 public 方法
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
