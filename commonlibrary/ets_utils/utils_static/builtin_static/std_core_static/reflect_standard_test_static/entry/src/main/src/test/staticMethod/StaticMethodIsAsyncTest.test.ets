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
  public static async test(): Promise<void> {
    return;
  }
}

class MyClass002 {
  public static async test(): Promise<void> {
    return;
  }
}

class MyClass003 {
  public static syncMethod(): void {}
}

class MyClass004 {
  public static async publicAsync(): Promise<void> {
    return;
  }
}

class MyClass005 {
  private static async privateAsync(): Promise<void> {
    return;
  }
}

class MyClass006 {
  protected static async protectedAsync(): Promise<void> {
    return;
  }
}

class MyClass007 {
  public static async returnString(): Promise<string> { return 'test'; }
  public static async returnInt(): Promise<int> { return 42; }
  public static async returnVoid(): Promise<void> { return; }
}

class MyClass008 {
  public static async test(): Promise<void> { return; }
}

class MyClass009 {
  public static async test(): Promise<void> { return; }
}

class MyClass010 {
  public static async asyncMethod(): Promise<string> { return 'test'; }
  public static syncMethod(): string { return 'test'; }
}

abstract class AbstractClass011 {
  public static async abstractAsync(): Promise<void> { return; }
}

final class FinalClass012 {
  public static async finalAsync(): Promise<void> { return; }
}

class MyClass013 {
  public static async test(): Promise<void> { return; }
}

class MyClass014 {
  public static async publicAsyncMethod(): Promise<void> { return; }
}

class MyClass015 {
  private static async privateAsyncMethod(): Promise<void> { return; }
}

class MyClass016 {
  public static async deprecatedAsyncMethod(): Promise<void> { return; }
}

class MyClass017 {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass018 {
  public static async fetchWithParam(url: string): Promise<string> { return 'data'; }
}

abstract class AbstractClass019 {
  public static async abstractAsync(): Promise<void> { return; }
}

final class FinalClass019 {
  public static async finalAsync(): Promise<void> { return; }
}

class NormalClass019 {
  public static async normalAsync(): Promise<void> { return; }
}

class MyClass020 {
  public static async createAsync(): Promise<MyClass020> { return new MyClass020(); }
}

class MyClass021 {
  public static async asyncMethod1(): Promise<void> { return; }
  public static syncMethod(): void {}
  public static async asyncMethod2(): Promise<string> { return 'test'; }
}

class MyClass022 {
  public static async test(): Promise<void> { return; }
}

class MyClass023 {
  public static syncMethod(): void {}
  public static async asyncMethod1(): Promise<void> { return; }
  public static async asyncMethod2(): Promise<string> { return 'test'; }
}

class MyClass024 {
  public static syncVersion(): string { return 'sync'; }
  public static async asyncVersion(): Promise<string> { return 'async'; }
}

class MyClass025 {
  public static returnsPromise(): Promise<string> {
    return Promise.resolve('test');
  }
}

export default function StaticMethodIsAsyncTest(): void {
  describe('StaticMethodIsAsyncTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): void => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0100
     * @tc.name testStaticMethodIsAsync001
     * @tc.desc Verify isAsync() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0200
     * @tc.name testStaticMethodIsAsync002
     * @tc.desc Verify isAsync() returns true for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertTrue();
      expect(typeof isAsync).assertEqual('boolean');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0300
     * @tc.name testStaticMethodIsAsync003
     * @tc.desc Verify isAsync() returns false for sync static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('syncMethod');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0400
     * @tc.name testStaticMethodIsAsync004
     * @tc.desc Verify isAsync() for public async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass004>().getStaticMethod('publicAsync');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0500
     * @tc.name testStaticMethodIsAsync005
     * @tc.desc Verify isAsync() for private async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass005>().getStaticMethod('privateAsync');
      expect(method == undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0600
     * @tc.name testStaticMethodIsAsync006
     * @tc.desc Verify isAsync() for protected async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass006>().getStaticMethod('protectedAsync');
      expect(method == undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0700
     * @tc.name testStaticMethodIsAsync007
     * @tc.desc Verify isAsync() returns true for async methods returning different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      expect(cls.getStaticMethod('returnString')!.isAsync()).assertTrue();
      expect(cls.getStaticMethod('returnInt')!.isAsync()).assertTrue();
      expect(cls.getStaticMethod('returnVoid')!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0800
     * @tc.name testStaticMethodIsAsync008
     * @tc.desc Verify isAsync() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(typeof isAsync).assertEqual('boolean');
      expect(isAsync === true || isAsync === false).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0900
     * @tc.name testStaticMethodIsAsync009
     * @tc.desc Verify isAsync() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync === true || isAsync === false).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1000
     * @tc.name testStaticMethodIsAsync010
     * @tc.desc Verify async method return type contains Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let asyncMethod = cls.getStaticMethod('asyncMethod');
      let syncMethod = cls.getStaticMethod('syncMethod');
      expect(asyncMethod != undefined).assertTrue();
      expect(syncMethod != undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(asyncMethod!.getReturnType().getName().includes('Promise')).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1100
     * @tc.name testStaticMethodIsAsync011
     * @tc.desc Verify isAsync() for abstract class async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<AbstractClass011>().getStaticMethod('abstractAsync');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1200
     * @tc.name testStaticMethodIsAsync012
     * @tc.desc Verify isAsync() for final class async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<FinalClass012>().getStaticMethod('finalAsync');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1300
     * @tc.name testStaticMethodIsAsync013
     * @tc.desc Verify isAsync() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1400
     * @tc.name testStaticMethodIsAsync014
     * @tc.desc Verify isAsync() with async+public modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass014>().getStaticMethod('publicAsyncMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1500
     * @tc.name testStaticMethodIsAsync015
     * @tc.desc Verify isAsync() with async+private modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass015>().getStaticMethod('privateAsyncMethod');
      expect(method == undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1600
     * @tc.name testStaticMethodIsAsync016
     * @tc.desc Verify isAsync() for Deprecated async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass016>().getStaticMethod('deprecatedAsyncMethod');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1700
     * @tc.name testStaticMethodIsAsync017
     * @tc.desc Verify isAsync() async method characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass017>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getReturnType().getName().includes('Promise')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1800
     * @tc.name testStaticMethodIsAsync018
     * @tc.desc Verify isAsync() for async method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass018>().getStaticMethod('fetchWithParam');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1900
     * @tc.name testStaticMethodIsAsync019
     * @tc.desc Verify isAsync() for normal, abstract, and final class async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass019>().getStaticMethod('abstractAsync');
      let m2 = Class.from<FinalClass019>().getStaticMethod('finalAsync');
      let m3 = Class.from<NormalClass019>().getStaticMethod('normalAsync');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isAsync()).assertTrue();
      expect(m2!.isAsync()).assertTrue();
      expect(m3!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2000
     * @tc.name testStaticMethodIsAsync020
     * @tc.desc Verify isAsync() for async factory method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass020>().getStaticMethod('createAsync');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2100
     * @tc.name testStaticMethodIsAsync021
     * @tc.desc Verify isAsync() counts async methods in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass021>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncCount++;
        }
      }
      expect(asyncCount).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2200
     * @tc.name testStaticMethodIsAsync022
     * @tc.desc Verify isAsync() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass022>().getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isNative()).assertFalse();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2300
     * @tc.name testStaticMethodIsAsync023
     * @tc.desc Verify filtering async methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass023>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncMethods.push(methods[i]);
        }
      }
      expect(asyncMethods.length).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2400
     * @tc.name testStaticMethodIsAsync024
     * @tc.desc Verify isAsync() comparison between sync and async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass024>();
      let syncMethod = cls.getStaticMethod('syncVersion');
      let asyncMethod = cls.getStaticMethod('asyncVersion');
      expect(syncMethod != undefined).assertTrue();
      expect(asyncMethod != undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod!.isAsync()).assertTrue();
      expect(syncMethod!.getReturnType().getName()).assertEqual('std.core.String');
      expect(asyncMethod!.getReturnType().getName().includes('Promise')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2500
     * @tc.name testStaticMethodIsAsync025
     * @tc.desc Verify isAsync() returns false for method returning Promise without async keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass025>();
      let method = cls.getStaticMethod('returnsPromise');
      expect(method != undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertFalse();
      return;
    });
  });
}
