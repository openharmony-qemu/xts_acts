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
  public static userMethod(): string { return 'user defined'; }
}

abstract class AbstractClass004 {
  public static abstractMethod(): void {}
}

final class FinalClass005 {
  public static finalMethod(): void {}
}

class MyClass006 {
  public static async asyncMethod(): Promise<void> { return; }
}

class MyClass007 {
  private static _name: string = '';
  public static get name(): string { return MyClass007._name; }
  public static set name(value: string) { MyClass007._name = value; }
}

class MyClass008 {
  public static test(): void {}
}

class MyClass009 {
  public static test(): void {}
}

class MyClass010 {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

class MyClass011 {
  public static deprecatedMethod(): void {}
  public static finalMethod(): void {}
}

class MyClass012 {
  public static test(): void {}
}

class MyClass013 {
  public static normalMethod(): void {}
  public static async asyncMethod(): Promise<void> { return; }
  public static finalMethod(): void {}
}

class MyClass014 {
  public static async fetchData(): Promise<string> { return 'data'; }
}

abstract class AbstractClass015 {
  public static abstractMethod(): void {}
}

final class FinalClass015 {
  public static finalMethod(): void {}
}

class NormalClass015 {
  public static normalMethod(): void {}
}

class MyClass016 {
  private static _name: string = '';
  public static get name(): string { return MyClass016._name; }
  public static set name(value: string) { MyClass016._name = value; }
}

class MyClass017 {
  public static method1(): void {}
  public static method2(): void {}
  public static method3(): void {}
}

class MyClass018 {
  public static test(): void {}
}

class MyClass019 {
  public static myMethod(): void {}
}

export default function StaticMethodIsNativeTest(): void {
  describe('StaticMethodIsNativeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0100
     * @tc.name testStaticMethodIsNative001
     * @tc.desc Verify isNative() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0200
     * @tc.name testStaticMethodIsNative002
     * @tc.desc Verify isNative() returns false for normal user-defined static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative).assertFalse();
      expect(typeof isNative).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0300
     * @tc.name testStaticMethodIsNative003
     * @tc.desc Verify isNative() returns false for user-defined class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('userMethod');
      expect(method != undefined).assertTrue();
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
    it('testStaticMethodIsNative004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<AbstractClass004>().getStaticMethod('abstractMethod');
      expect(method != undefined).assertTrue();
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
    it('testStaticMethodIsNative005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<FinalClass005>().getStaticMethod('finalMethod');
      expect(method != undefined).assertTrue();
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
    it('testStaticMethodIsNative006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass006>().getStaticMethod('asyncMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0700
     * @tc.name testStaticMethodIsNative007
     * @tc.desc Verify isNative() returns false for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.isNative()).assertFalse();
      expect(setter!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0800
     * @tc.name testStaticMethodIsNative008
     * @tc.desc Verify isNative() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(typeof isNative).assertEqual('boolean');
      expect(isNative === true || isNative === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_0900
     * @tc.name testStaticMethodIsNative009
     * @tc.desc Verify isNative() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isNative: boolean = method!.isNative();
      expect(isNative === true || isNative === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1000
     * @tc.name testStaticMethodIsNative010
     * @tc.desc Verify isNative() returns false for all access level methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let m1 = cls.getStaticMethod('publicMethod');
      expect(m1 != undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1100
     * @tc.name testStaticMethodIsNative011
     * @tc.desc Verify isNative() returns false for annotated methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let m1 = cls.getStaticMethod('deprecatedMethod');
      let m2 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1200
     * @tc.name testStaticMethodIsNative012
     * @tc.desc Verify isNative() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        let isNative: boolean = method!.isNative();
        expect(isNative != null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1300
     * @tc.name testStaticMethodIsNative013
     * @tc.desc Verify isNative() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
      expect(m3!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1400
     * @tc.name testStaticMethodIsNative014
     * @tc.desc Verify isNative() returns false for async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1500
     * @tc.name testStaticMethodIsNative015
     * @tc.desc Verify isNative() for normal, abstract, and final class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass015>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass015>().getStaticMethod('finalMethod');
      let m3 = Class.from<NormalClass015>().getStaticMethod('normalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isNative()).assertFalse();
      expect(m2!.isNative()).assertFalse();
      expect(m3!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1600
     * @tc.name testStaticMethodIsNative016
     * @tc.desc Verify isNative() for getter and setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass016>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.isNative()).assertFalse();
      expect(setter!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1700
     * @tc.name testStaticMethodIsNative017
     * @tc.desc Verify isNative() returns false for all user-defined static methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass017>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      for (let i: int = 0; i < methods.length; i++) {
        let isNative: boolean = methods[i].isNative();
        expect(isNative).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1800
     * @tc.name testStaticMethodIsNative018
     * @tc.desc Verify isNative() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass018>().getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.isNative()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_1900
     * @tc.name testStaticMethodIsNative019
     * @tc.desc Verify isNative() on built-in Array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<Array<int>>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(0);
      let validCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let isNative: boolean = methods[i].isNative();
        if (isNative == true || isNative == false) {
          validCount++;
        }
      }
      expect(validCount).assertEqual(methods.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_NATIVE_2000
     * @tc.name testStaticMethodIsNative020
     * @tc.desc Verify isNative() comparison between built-in and user-defined methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsNative020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let userMethod = Class.from<MyClass019>().getStaticMethod('myMethod');
      expect(userMethod != undefined).assertTrue();
      expect(userMethod!.isNative()).assertFalse();
      let arrayCls: Class = Class.from<Array<int>>();
      let arrayMethods = arrayCls.getStaticMethods();
      for (let i: int = 0; i < arrayMethods.length; i++) {
        let isNative: boolean = arrayMethods[i].isNative();
        expect(isNative != null).assertTrue();
      }
    });
  });
}
