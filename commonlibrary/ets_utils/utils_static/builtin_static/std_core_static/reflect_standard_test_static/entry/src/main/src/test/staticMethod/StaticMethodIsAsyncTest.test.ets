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

class IsAsyncBasicClass {
  public static async isAsync(): Promise<void> {
  }
}

class CheckAsyncClass {
  public static async checkAsync(): Promise<int> { return 1; }
}

class SyncMethodAsyncClass {
  public static syncMethod(): string { return 'sync'; }
}

class PublicAsyncClass {
  public static async publicAsync(): Promise<string> { return 'public'; }
}

class PrivateAsyncClass {
  private static async privateAsync(): Promise<string> { return 'private'; }
}

class ProtectedAsyncClass {
  protected static async protectedAsync(): Promise<int> { return 1; }
}

class MultiAsyncReturnClass {
  public static async returnString(): Promise<string> { return 'test'; }
  public static async returnInt(): Promise<int> { return 42; }
  public static async returnVoid(): Promise<void> { return; }
}

class VerifyAsyncClass {
  public static async verifyAsync(): Promise<void> { return; }
}

class SafeAsyncClass {
  public static async safeAsync(): Promise<boolean> { return true; }
}

class MixedAsyncClass {
  public static async asyncMethod(): Promise<string> { return 'test'; }
  public static syncMethod(): string { return 'test'; }
}

abstract class AbstractClass011 {
  public static async abstractAsync(): Promise<string> { return 'abstract'; }
}

final class FinalClass012 {
  public static async finalAsync(): Promise<int> { return 1; }
}

class NoThrowAsyncClass {
  public static async withoutThrow(): Promise<void> { return; }
}

class PublicAsyncMethodClass {
  public static async publicAsyncMethod(): Promise<string> { return 'public'; }
}

class PrivateAsyncMethodClass {
  private static async privateAsyncMethod(): Promise<int> { return 1; }
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedAsyncClass {
  @deprecated("5.0")
  public static async deprecatedAsyncMethod(): Promise<string> { return 'deprecated'; }
}

class FetchDataAsyncClass {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class FetchParamAsyncClass {
  public static async fetchWithParam(url: string): Promise<string> { return 'data'; }
}

abstract class AbstractClass019 {
  public static async abstractAsync(): Promise<boolean> { return true; }
}

final class FinalClass019 {
  public static async finalAsync(): Promise<float> { return 1.0; }
}

class NormalClass019 {
  public static async normalAsync(): Promise<string> { return 'normal'; }
}

class CreateAsyncClass {
  public static async createAsync(): Promise<CreateAsyncClass> { return new CreateAsyncClass(); }
}

class DualAsyncClass {
  public static async asyncMethod1(): Promise<int> { return 1; }
  public static syncMethod(): string { return 'sync'; }
  public static async asyncMethod2(): Promise<string> { return 'test'; }
}

class LastCheckAsyncClass {
  public static async lastCheck(): Promise<void> { return; }
}

class ThreeMethodAsyncClass {
  public static syncMethod(): float { return 1.0; }
  public static async asyncMethod1(): Promise<boolean> { return true; }
  public static async asyncMethod2(): Promise<string> { return 'test'; }
}

class SyncAndAsyncClass {
  public static syncVersion(): string { return 'sync'; }
  public static async asyncVersion(): Promise<string> { return 'async'; }
}

class PromiseReturnAsyncClass {
  public static returnsPromise(): Promise<string> {
    return Promise.resolve('test');
  }
}

export default function StaticMethodIsAsyncTest(): void {
  describe('StaticMethodIsAsyncTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
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
    it('testStaticMethodIsAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<IsAsyncBasicClass>();
      let method = cls.getStaticMethod('isAsync');
      expect(method !== undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0200
     * @tc.name testStaticMethodIsAsync002
     * @tc.desc Verify isAsync() returns true for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CheckAsyncClass>();
      let method = cls.getStaticMethod('checkAsync');
      expect(method !== undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0300
     * @tc.name testStaticMethodIsAsync003
     * @tc.desc Verify isAsync() returns false for sync static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SyncMethodAsyncClass>();
      let method = cls.getStaticMethod('syncMethod');
      expect(method !== undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0400
     * @tc.name testStaticMethodIsAsync004
     * @tc.desc Verify isAsync() for public async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls004 = Class.from<PublicAsyncClass>();
      let method = cls004.getStaticMethod('publicAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0500
     * @tc.name testStaticMethodIsAsync005
     * @tc.desc Verify private async static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<PrivateAsyncClass>();
      let method = cls005.getStaticMethod('privateAsync');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0600
     * @tc.name testStaticMethodIsAsync006
     * @tc.desc Verify protected async static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<ProtectedAsyncClass>();
      let method = cls006.getStaticMethod('protectedAsync');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0700
     * @tc.name testStaticMethodIsAsync007
     * @tc.desc Verify isAsync() returns true for async methods returning different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiAsyncReturnClass>();
      let mStr = cls.getStaticMethod('returnString');
      let mInt = cls.getStaticMethod('returnInt');
      let mVoid = cls.getStaticMethod('returnVoid');
      expect(mStr!.isAsync()).assertTrue();
      expect(mInt!.isAsync()).assertTrue();
      expect(mVoid!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0800
     * @tc.name testStaticMethodIsAsync008
     * @tc.desc Verify isAsync() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VerifyAsyncClass>();
      let method = cls.getStaticMethod('verifyAsync');
      expect(method !== undefined).assertTrue();
      let isAsync = method!.isAsync();
      let isAsyncType = Class.of(isAsync).getName();
      expect(isAsyncType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_0900
     * @tc.name testStaticMethodIsAsync009
     * @tc.desc Verify async method return type contains Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedAsyncClass>();
      let asyncMethod = cls.getStaticMethod('asyncMethod');
      let syncMethod = cls.getStaticMethod('syncMethod');
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      let rt = asyncMethod!.getReturnType();
      let rtName: string = rt.getName();
      expect(rtName).assertEqual('std.core.Promise');
      expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1000
     * @tc.name testStaticMethodIsAsync010
     * @tc.desc Verify isAsync() for abstract class async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls011 = Class.from<AbstractClass011>();
      let method = cls011.getStaticMethod('abstractAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1100
     * @tc.name testStaticMethodIsAsync011
     * @tc.desc Verify isAsync() for final class async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls012 = Class.from<FinalClass012>();
      let method = cls012.getStaticMethod('finalAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1200
     * @tc.name testStaticMethodIsAsync012
     * @tc.desc Verify isAsync() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoThrowAsyncClass>();
      let method = cls.getStaticMethod('withoutThrow');
      expect(method !== undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1300
     * @tc.name testStaticMethodIsAsync013
     * @tc.desc Verify isAsync() with async+public modifier combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls014 = Class.from<PublicAsyncMethodClass>();
      let method = cls014.getStaticMethod('publicAsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1400
     * @tc.name testStaticMethodIsAsync014
     * @tc.desc Verify async private static method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls015 = Class.from<PrivateAsyncMethodClass>();
      let method = cls015.getStaticMethod('privateAsyncMethod');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1500
     * @tc.name testStaticMethodIsAsync015
     * @tc.desc Verify isAsync() for Deprecated async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<DeprecatedAsyncClass>();
      let method = cls016.getStaticMethod('deprecatedAsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1600
     * @tc.name testStaticMethodIsAsync016
     * @tc.desc Verify isAsync() async method characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FetchDataAsyncClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      let rt = method!.getReturnType();
      let rtName: string = rt.getName();
      expect(rtName).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1700
     * @tc.name testStaticMethodIsAsync017
     * @tc.desc Verify isAsync() for async method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls018 = Class.from<FetchParamAsyncClass>();
      let method = cls018.getStaticMethod('fetchWithParam');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1800
     * @tc.name testStaticMethodIsAsync018
     * @tc.desc Verify isAsync() for normal, abstract, and final class async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass019>();
      let clsFin = Class.from<FinalClass019>();
      let clsNor = Class.from<NormalClass019>();
      let m1 = clsAbs.getStaticMethod('abstractAsync');
      let m2 = clsFin.getStaticMethod('finalAsync');
      let m3 = clsNor.getStaticMethod('normalAsync');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isAsync()).assertTrue();
      expect(m2!.isAsync()).assertTrue();
      expect(m3!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_1900
     * @tc.name testStaticMethodIsAsync019
     * @tc.desc Verify isAsync() for async factory method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls020 = Class.from<CreateAsyncClass>();
      let method = cls020.getStaticMethod('createAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2000
     * @tc.name testStaticMethodIsAsync020
     * @tc.desc Verify isAsync() counts async methods in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DualAsyncClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncCount++;
        }
      }
      expect(asyncCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2100
     * @tc.name testStaticMethodIsAsync021
     * @tc.desc Verify isAsync() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls022 = Class.from<LastCheckAsyncClass>();
      let method = cls022.getStaticMethod('lastCheck');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2200
     * @tc.name testStaticMethodIsAsync022
     * @tc.desc Verify filtering async methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeMethodAsyncClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncMethods: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncMethods.push(methods[i]);
        }
      }
      expect(asyncMethods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2300
     * @tc.name testStaticMethodIsAsync023
     * @tc.desc Verify isAsync() comparison between sync and async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SyncAndAsyncClass>();
      let syncMethod = cls.getStaticMethod('syncVersion');
      let asyncMethod = cls.getStaticMethod('asyncVersion');
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod!.isAsync()).assertFalse();
      expect(asyncMethod!.isAsync()).assertTrue();
      let syncRt = syncMethod!.getReturnType();
      let asyncRt = asyncMethod!.getReturnType();
      expect(syncRt.getName()).assertEqual('std.core.String');
      let asyncRtName: string = asyncRt.getName();
      expect(asyncRtName).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_2400
     * @tc.name testStaticMethodIsAsync024
     * @tc.desc Verify isAsync() returns false for method returning Promise without async keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PromiseReturnAsyncClass>();
      let method = cls.getStaticMethod('returnsPromise');
      expect(method !== undefined).assertTrue();
      let isAsync: boolean = method!.isAsync();
      expect(isAsync).assertFalse();
    });
  });
}
