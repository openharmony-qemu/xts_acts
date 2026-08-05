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

class CheckAsyncClass {
  public static async checkAsync(): Promise<int> { return 1; }
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

abstract class AbstractClass011 {
  public static async abstractAsync(): Promise<string> { return 'abstract'; }
}

final class FinalClass012 {
  public static async finalAsync(): Promise<int> { return 1; }
}

@interface deprecated {
  fromVersion: string
}

class CrossAsyncOwnerClass {
  public static async ownerAsync(): Promise<int> { return 7; }
}

class CrossAsyncParamClass {
  public static async paramAsync(a: int, b: string): Promise<string> { return 'x'; }
}

class CrossAsyncSyncClass {
  public static async asyncOne(): Promise<string> { return 'one'; }
  public static syncOne(): string { return 'one'; }
}

class GetterNamedMethodClass {
  public static getName(): string { return 'name'; }
}

class MultiMethodAsyncClass {
  public static async a1(): Promise<string> { return '1'; }
  public static async a2(): Promise<int> { return 2; }
  public static async a3(): Promise<boolean> { return true; }
  public static sync1(): string { return 's'; }
  public static sync2(): int { return 0; }
}

class SimpleAsyncOnlyClass {
  public static async onlyAsync(): Promise<string> { return 'async'; }
}

class NestedAsyncInner {
  public static async nestedAsync(): Promise<string> { return 'nested'; }
}

class ParentAsyncClass {
  public static async parentAsync(): Promise<string> { return 'parent'; }
}

class ChildAsyncClass extends ParentAsyncClass {
}

class AsyncGetterClass {
  public static get asyncProp(): Promise<string> { return Promise.resolve('async getter'); }
}

class NamedAsyncClass {
  public static AsyncMethod(): string { return 'not async'; }
}

class DeprecatedAsyncWithAnnotation {
  @deprecated("6.0")
  public static async deprecatedAsync(): Promise<string> { return 'deprecated'; }
}



class MixedAsyncFullClass {
  public static async asyncMethod1(): Promise<string> { return 'async1'; }
  public static async asyncMethod2(): Promise<int> { return 1; }
  public static syncMethod1(): string { return 'sync1'; }
  public static syncMethod2(): int { return 2; }
}

class SyncOnlyFullClass {
  public static syncMethod1(): string { return 'sync1'; }
  public static syncMethod2(): int { return 2; }
  public static syncMethod3(): boolean { return true; }
}

class AsyncOnlyFullClass {
  public static async asyncMethod1(): Promise<string> { return 'async1'; }
  public static async asyncMethod2(): Promise<int> { return 1; }
}

final class FinalAsyncClass {
  public static async finalAsync(): Promise<string> { return 'final'; }
}


class CallableAsyncClass {
  public static $_invoke(): Promise<string> { return Promise.resolve('callable'); }
}

class AsyncTripleModifierA1 {
  public static async asyncTripleMethod(): Promise<void> {}
}
class MixedAsyncAccessA2 {
  public static async publicAsyncMethod(): Promise<string> { return 'public'; }
  private static privateSyncMethod(): string { return 'private'; }
  protected static protectedSyncMethod(): string { return 'protected'; }
}
class HighFreqAsyncB1 {
  public static async highFreqAsync(): Promise<void> {}
}
class ParentAsyncC1 {
  public static async parentAsyncMethod(): Promise<string> { return 'parent'; }
}
class ChildAsyncOverrideC1 extends ParentAsyncC1 {
  public static async childAsyncMethod(): Promise<string> { return 'child'; }
}
class ParentAsyncC2 {
  public static async sharedMethod(): Promise<string> { return 'parent'; }
}
class ChildSyncOverrideC2 extends ParentAsyncC2 {
  public static sharedMethod(): string { return 'child'; }
}
class ParentSyncC3 {
  public static sharedMethod(): string { return 'parent'; }
}
class ChildAsyncOverrideC3 extends ParentSyncC3 {
  public static async sharedMethod(): Promise<string> { return 'child'; }
}
class ParentPrivateAsyncC4 {
  private static async privateAsyncMethod(): Promise<string> { return 'private'; }
}
class ChildPrivateAsyncC4 extends ParentPrivateAsyncC4 {}
class MapAsyncParamD1 {
  public static async mapAsyncMethod(map: Map<string, int>): Promise<void> {}
}
class CustomObjD2 {
  public value: int = 0;
}
class CustomObjAsyncD2 {
  public static async customObjAsyncMethod(data: CustomObjD2): Promise<string> { return 'ok'; }
}
class ThreeParamAsyncD3 {
  public static async threeParamAsync(a: int, b: string, c: boolean): Promise<string> { return 'ok'; }
}
class FiveParamAsyncD4 {
  public static async fiveParamAsync(a: int, b: string, c: boolean, d: float, e: int): Promise<string> { return 'ok'; }
}
class FourPromiseClassE1 {
  public static async promiseStr(): Promise<string> { return 'str'; }
  public static async promiseInt(): Promise<int> { return 1; }
  public static async promiseVoid(): Promise<void> {}
  public static async promiseBool(): Promise<boolean> { return true; }
}
class MixedReturnClassE2 {
  public static async asyncReturnPromise(): Promise<string> { return 'async'; }
  public static syncReturnString(): string { return 'sync'; }
}
class TwoAsyncThreeSyncF1 {
  public static async asyncMethod1(): Promise<string> { return 'a1'; }
  public static async asyncMethod2(): Promise<int> { return 1; }
  public static syncMethod1(): string { return 's1'; }
  public static syncMethod2(): int { return 0; }
  public static syncMethod3(): boolean { return true; }
}
class AllPrivateAsyncF2 {
  private static async privateAsync1(): Promise<string> { return 'p1'; }
  private static async privateAsync2(): Promise<int> { return 1; }
}
class AllProtectedAsyncF3 {
  protected static async protectedAsync1(): Promise<string> { return 'p1'; }
  protected static async protectedAsync2(): Promise<int> { return 1; }
}
class ZeroAsyncClassG1 {
  public static syncMethod1(): string { return 's1'; }
  public static syncMethod2(): int { return 0; }
}
class NamedAsyncMethodG2 {
  public static asyncMethod(): string { return 'not async'; }
}
class CallablePromiseG3 {
  public static $_invoke(): Promise<string> { return Promise.resolve('callable'); }
}
class ChainCombinedAsyncH1 {
  public static async asyncMethod1(): Promise<string> { return 'a1'; }
  public static async asyncMethod2(): Promise<int> { return 1; }
}
class ThreeInOneBatchH2 {
  public static async asyncMethod1(): Promise<string> { return 'a1'; }
  public static async asyncMethod2(): Promise<int> { return 1; }
  public static async asyncMethod3(): Promise<boolean> { return true; }
}
class MultiParamAsyncH3 {
  public static async multiParamAsync(a: string, b: int, c: boolean): Promise<string> { return 'ok'; }
  public static async dualParamAsync(x: float, y: string): Promise<boolean> { return true; }
}
class AsyncInvokeChainClass {
  public static async fetchData(): Promise<string> { return 'async result'; }
}
class GenericAsyncClass<T> {
  public static async genericAsync(): Promise<string> { return 'generic async'; }
}
export default function StaticMethodIsAsync2Test(): void {

  describe('StaticMethodIsAsync2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0100
     * @tc.name testStaticMethodIsAsync2_001
     * @tc.desc Verify isAsync() combined with equals() returns true for two identical async static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CheckAsyncClass>();
      let m1 = cls.getStaticMethod('checkAsync');
      let m2 = cls.getStaticMethod('checkAsync');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isAsync()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0200
     * @tc.name testStaticMethodIsAsync2_002
     * @tc.desc Verify isAsync() combined with equals() returns false for async and sync static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossAsyncSyncClass>();
      let mAsync = cls.getStaticMethod('asyncOne');
      let mSync = cls.getStaticMethod('syncOne');
      expect(mAsync !== undefined).assertTrue();
      expect(mSync !== undefined).assertTrue();
      expect(mAsync!.isAsync()).assertTrue();
      expect(mSync!.isAsync()).assertFalse();
      expect(mAsync!.equals(mSync!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0300
     * @tc.name testStaticMethodIsAsync2_003
     * @tc.desc Verify isAsync() combined with getOwner() returns the declaring class of an async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossAsyncOwnerClass>();
      let method = cls.getStaticMethod('ownerAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossAsyncOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0400
     * @tc.name testStaticMethodIsAsync2_004
     * @tc.desc Verify isAsync() combined with getParameterTypes() for async static method with multiple parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossAsyncParamClass>();
      let method = cls.getStaticMethod('paramAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0500
     * @tc.name testStaticMethodIsAsync2_005
     * @tc.desc Verify isAsync() and equals() and getOwner() on an async static method of a final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalClass012>();
      let m1 = cls.getStaticMethod('finalAsync');
      let m2 = cls.getStaticMethod('finalAsync');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isAsync()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('FinalClass012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0600
     * @tc.name testStaticMethodIsAsync2_006
     * @tc.desc Verify isAsync() and equals() and getOwner() on an async static method of an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AbstractClass011>();
      let m1 = cls.getStaticMethod('abstractAsync');
      let m2 = cls.getStaticMethod('abstractAsync');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isAsync()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('AbstractClass011');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0700
     * @tc.name testStaticMethodIsAsync2_007
     * @tc.desc Verify isAsync() returns false for method named getXxx without async keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterNamedMethodClass>();
      let method = cls.getStaticMethod('getName');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0800
     * @tc.name testStaticMethodIsAsync2_008
     * @tc.desc Verify isAsync() counts async methods correctly in class with mixed sync/async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodAsyncClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncCount++;
        }
      }
      expect(asyncCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_0900
     * @tc.name testStaticMethodIsAsync2_009
     * @tc.desc Verify isAsync() returns true for single async method in class with only one method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SimpleAsyncOnlyClass>();
      let method = cls.getStaticMethod('onlyAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1000
     * @tc.name testStaticMethodIsAsync2_010
     * @tc.desc Verify isAsync() combined with getName() returns correct method name for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CheckAsyncClass>();
      let method = cls.getStaticMethod('checkAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getName()).assertEqual('checkAsync');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1100
     * @tc.name testStaticMethodIsAsync2_011
     * @tc.desc Verify isAsync() on async static method in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedAsyncInner>();
      let method = cls.getStaticMethod('nestedAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1200
     * @tc.name testStaticMethodIsAsync2_012
     * @tc.desc Verify inherited async static method is not exposed via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChildAsyncClass>();
      let method = cls.getStaticMethod('parentAsync');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1300
     * @tc.name testStaticMethodIsAsync2_013
     * @tc.desc Verify isAsync() combined with isPublic() on async public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicAsyncClass>();
      let method = cls.getStaticMethod('publicAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1400
     * @tc.name testStaticMethodIsAsync2_014
     * @tc.desc Verify private async method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrivateAsyncClass>();
      let method = cls.getStaticMethod('privateAsync');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1500
     * @tc.name testStaticMethodIsAsync2_015
     * @tc.desc Verify protected async method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedAsyncClass>();
      let method = cls.getStaticMethod('protectedAsync');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1600
     * @tc.name testStaticMethodIsAsync2_016
     * @tc.desc Verify isAsync() returns false for non-async method named with Async suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NamedAsyncClass>();
      let method = cls.getStaticMethod('AsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1700
     * @tc.name testStaticMethodIsAsync2_017
     * @tc.desc Verify isAsync() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CheckAsyncClass>();
      let method = cls.getStaticMethod('checkAsync');
      expect(method !== undefined).assertTrue();
      let isAsync = method!.isAsync();
      let isAsyncType = Class.of(isAsync).getName();
      expect(isAsyncType).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1800
     * @tc.name testStaticMethodIsAsync2_018
     * @tc.desc Verify isAsync() consistency across multiple identical async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CheckAsyncClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isAsync()) {
          asyncCount++;
        }
      }
      expect(asyncCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_1900
     * @tc.name testStaticMethodIsAsync2_019
     * @tc.desc Verify isAsync() returns true for deprecated async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DeprecatedAsyncWithAnnotation>();
      let method = cls.getStaticMethod('deprecatedAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2000
     * @tc.name testStaticMethodIsAsync2_020
     * @tc.desc Verify isAsync() combined with other method properties on deprecated async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DeprecatedAsyncWithAnnotation>();
      let method = cls.getStaticMethod('deprecatedAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2100
     * @tc.name testStaticMethodIsAsync2_021
     * @tc.desc Verify isAsync() consistency with isGetter and isSetter on mixed async/sync class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedAsyncFullClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let isAsync = methods[i].isAsync();
        let isGetter = methods[i].isGetter();
        let isSetter = methods[i].isSetter();
        if (isAsync) {
          asyncCount++;
        }
        expect(isGetter).assertFalse();
        expect(isSetter).assertFalse();
      }
      expect(asyncCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2200
     * @tc.name testStaticMethodIsAsync2_022
     * @tc.desc Verify isAsync() returns false for all methods in sync-only class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SyncOnlyFullClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isAsync()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2300
     * @tc.name testStaticMethodIsAsync2_023
     * @tc.desc Verify isAsync() returns true for all methods in async-only class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncOnlyFullClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(4);
      for (let i: int = 0; i < methods.length; i++) {
        let m = methods[i];
        if (m.getName().startsWith('%%async-')) {
          expect(m.isAsync()).assertFalse();
        } else {
          expect(m.isAsync()).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2400
     * @tc.name testStaticMethodIsAsync2_024
     * @tc.desc Verify isAsync() returns true for async method in final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalAsyncClass>();
      let method = cls.getStaticMethod('finalAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2500
     * @tc.name testStaticMethodIsAsync2_025
     * @tc.desc Verify isAsync() and isGetter cross validation on async getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncGetterClass>();
      let method = cls.getStaticMethod('%%get-asyncProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2600
     * @tc.name testStaticMethodIsAsync2_026
     * @tc.desc Verify isAsync() returns false for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableAsyncClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2700
     * @tc.name testStaticMethodIsAsync2_027
     * @tc.desc Verify isAsync combined with isPublic isPrivate isProtected on public async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncTripleModifierA1>();
      let method = cls.getStaticMethod('asyncTripleMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2800
     * @tc.name testStaticMethodIsAsync2_028
     * @tc.desc Verify isAsync remains correct when class also has private protected sync methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedAsyncAccessA2>();
      let asyncMethod = cls.getStaticMethod('publicAsyncMethod');
      expect(asyncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_2900
     * @tc.name testStaticMethodIsAsync2_029
     * @tc.desc Verify isAsync consistency across 10000 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<HighFreqAsyncB1>();
      let method = cls.getStaticMethod('highFreqAsync');
      expect(method !== undefined).assertTrue();
      for (let i: int = 0; i < 10000; i++) {
        expect(method!.isAsync()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3000
     * @tc.name testStaticMethodIsAsync2_030
     * @tc.desc Verify parent async child async both reflect their own methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentAsyncC1>();
      let childCls: Class = Class.from<ChildAsyncOverrideC1>();
      let parentMethod = parentCls.getStaticMethod('parentAsyncMethod');
      let childMethod = childCls.getStaticMethod('childAsyncMethod');
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      expect(parentMethod!.isAsync()).assertTrue();
      expect(childMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3100
     * @tc.name testStaticMethodIsAsync2_031
     * @tc.desc Verify parent async child sync child method isAsync false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildSyncOverrideC2>();
      let childMethod = childCls.getStaticMethod('sharedMethod');
      expect(childMethod !== undefined).assertTrue();
      expect(childMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3200
     * @tc.name testStaticMethodIsAsync2_032
     * @tc.desc Verify parent sync child async child method isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildAsyncOverrideC3>();
      let childMethod = childCls.getStaticMethod('sharedMethod');
      expect(childMethod !== undefined).assertTrue();
      expect(childMethod!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3300
     * @tc.name testStaticMethodIsAsync2_033
     * @tc.desc Verify parent private async not exposed via child reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildPrivateAsyncC4>();
      let childMethod = childCls.getStaticMethod('privateAsyncMethod');
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3400
     * @tc.name testStaticMethodIsAsync2_034
     * @tc.desc Verify async method with Map parameter isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MapAsyncParamD1>();
      let method = cls.getStaticMethod('mapAsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3500
     * @tc.name testStaticMethodIsAsync2_035
     * @tc.desc Verify async method with custom object parameter isAsync true and param count correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CustomObjAsyncD2>();
      let method = cls.getStaticMethod('customObjAsyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3600
     * @tc.name testStaticMethodIsAsync2_036
     * @tc.desc Verify async method with 3 parameters isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeParamAsyncD3>();
      let method = cls.getStaticMethod('threeParamAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3700
     * @tc.name testStaticMethodIsAsync2_037
     * @tc.desc Verify async method with 5 parameters isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FiveParamAsyncD4>();
      let method = cls.getStaticMethod('fiveParamAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3800
     * @tc.name testStaticMethodIsAsync2_038
     * @tc.desc Verify all async methods return Promise return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourPromiseClassE1>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(8);
      for (let i: int = 0; i < methods.length; i++) {
        let single: reflect.StaticMethod | undefined = cls.getStaticMethod(methods[i].getName());
        if (single === undefined || !single.isAsync()) {
          continue;
        }
        let rt = single.getReturnType();
        expect(rt.getName()).assertEqual('std.core.Promise');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_3900
     * @tc.name testStaticMethodIsAsync2_039
     * @tc.desc Verify async method return type is Promise sync method return type is not Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedReturnClassE2>();
      let asyncMethod = cls.getStaticMethod('asyncReturnPromise');
      let syncMethod = cls.getStaticMethod('syncReturnString');
      expect(asyncMethod !== undefined).assertTrue();
      expect(syncMethod !== undefined).assertTrue();
      expect(asyncMethod!.isAsync()).assertTrue();
      let asyncRt = asyncMethod!.getReturnType();
      expect(asyncRt.getName()).assertEqual('std.core.Promise');
      expect(syncMethod!.isAsync()).assertFalse();
      let syncRt = syncMethod!.getReturnType();
      expect(syncRt.getName()).not().assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4000
     * @tc.name testStaticMethodIsAsync2_040
     * @tc.desc Verify filtering async vs sync methods in mixed class with 2 async 3 sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TwoAsyncThreeSyncF1>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let single: reflect.StaticMethod | undefined = cls.getStaticMethod(methods[i].getName());
        if (single === undefined) {
          continue;
        }
        if (single.isAsync()) {
          asyncCount++;
        }
      }
      expect(asyncCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4100
     * @tc.name testStaticMethodIsAsync2_041
     * @tc.desc Verify getStaticMethods returns empty for all-private-async class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPrivateAsyncF2>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4200
     * @tc.name testStaticMethodIsAsync2_042
     * @tc.desc Verify getStaticMethods returns empty for all-protected-async class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllProtectedAsyncF3>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4300
     * @tc.name testStaticMethodIsAsync2_043
     * @tc.desc Verify all methods in sync-only class return isAsync false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ZeroAsyncClassG1>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isAsync()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4400
     * @tc.name testStaticMethodIsAsync2_044
     * @tc.desc Verify sync method named asyncMethod is not async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NamedAsyncMethodG2>();
      let method = cls.getStaticMethod('asyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4500
     * @tc.name testStaticMethodIsAsync2_045
     * @tc.desc Verify $_invoke callable returning Promise is not isAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallablePromiseG3>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4600
     * @tc.name testStaticMethodIsAsync2_046
     * @tc.desc Verify isAsync plus getReturnType plus getName chain on two async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChainCombinedAsyncH1>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let single: reflect.StaticMethod | undefined = cls.getStaticMethod(methods[i].getName());
        if (single === undefined || !single.isAsync()) {
          continue;
        }
        asyncCount++;
        let rt = single.getReturnType();
        expect(rt.getName()).assertEqual('std.core.Promise');
        expect(single.getName().startsWith('asyncMethod')).assertTrue();
      }
      expect(asyncCount >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4700
     * @tc.name testStaticMethodIsAsync2_047
     * @tc.desc Verify isAsync isPublic getReturnType Promise three-in-one batch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeInOneBatchH2>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let asyncCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let single: reflect.StaticMethod | undefined = cls.getStaticMethod(methods[i].getName());
        if (single === undefined || !single.isAsync()) {
          continue;
        }
        asyncCount++;
        expect(single.isPublic()).assertTrue();
        let rt = single.getReturnType();
        expect(rt.getName()).assertEqual('std.core.Promise');
      }
      expect(asyncCount >= 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4800
     * @tc.name testStaticMethodIsAsync2_048
     * @tc.desc Verify isAsync plus getParametersNum plus getParameterType on multi-param async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiParamAsyncH3>();
      let m3 = cls.getStaticMethod('multiParamAsync');
      expect(m3 !== undefined).assertTrue();
      expect(m3!.isAsync()).assertTrue();
      expect(m3!.getParametersNum()).assertEqual(3);
      expect(m3!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(m3!.getParameterType(1)!.getName()).assertEqual('i32');
      expect(m3!.getParameterType(2)!.getName()).assertEqual('u1');
      let m2 = cls.getStaticMethod('dualParamAsync');
      expect(m2 !== undefined).assertTrue();
      expect(m2!.isAsync()).assertTrue();
      expect(m2!.getParametersNum()).assertEqual(2);
      expect(m2!.getParameterType(0)!.getName()).assertEqual('f32');
      expect(m2!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_4900
     * @tc.name testStaticMethodIsAsync2_049
     * @tc.desc Verify isAsync plus invoke cross API chain async method invoke returns Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncInvokeChainClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
      let result = method!.invoke([]);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_ASYNC_TWO_5000
     * @tc.name testStaticMethodIsAsync2_050
     * @tc.desc Verify isAsync returns true for async method in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsAsync2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericAsyncClass<Object>>();
      let method = cls.getStaticMethod('genericAsync');
      expect(method !== undefined).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });
  });
}
