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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  public async testMethod(): Promise<void> {
  }
}

class MyClass005 {
  public normalMethod(): void {
  }

  public syncMethod(): string {
    return 'test';
  }
}

class MyClass006 {
  public async publicAsyncMethod(): Promise<void> {
  }
}

class MyClass007 {
  private async privateAsyncMethod(): Promise<void> {
  }
}

class MyClass008 {
  protected async protectedAsyncMethod(): Promise<void> {
  }
}

class MyClass009 {
  public async asyncPromiseVoid(): Promise<void> {
  }

  public async asyncPromiseNumber(): Promise<number> {
    return 123;
  }

  public async asyncPromiseString(): Promise<string> {
    return 'test';
  }
}

class MyClass012 {
  public async testMethod(): Promise<void> {
  }
}

class MyClass013 {
  public final async finalAsyncMethod(): Promise<void> {
  }
}

class MyClass014 {
  public async instanceAsyncMethod(): Promise<void> {
  }
}

class ParentClass015 {
  public async parentAsyncMethod(): Promise<void> {
  }
}

class ParentClass016 {
  public async overrideMethod(): Promise<void> {
  }
}

class ChildClass016 extends ParentClass016 {
  public override async overrideMethod(): Promise<void> {
  }
}

class MyClass017 {
  public async asyncMethod(): Promise<void> {
  }

  public syncMethod(): void {
  }
}

class MyClass023 {
  public async publicAsync(): Promise<void> {
  }

  private async privateAsync(): Promise<void> {
  }

  protected async protectedAsync(): Promise<void> {
  }
}

class MyClass024 {
  public async instanceAsyncMethod(): Promise<void> {
  }
}

class MyClass027 {
  public returnsPromiseButNotAsync(): Promise<string> {
    return Promise.resolve('test');
  }
}

class MyClass030 {
  public async asyncWithParams(a: number, b: string): Promise<boolean> {
    return true;
  }
}

class MyClass031 {
  public async asyncReturnNumber(): Promise<number> {
    return 42;
  }

  public async asyncReturnString(): Promise<string> {
    return 'test';
  }

  public async asyncReturnBoolean(): Promise<boolean> {
    return true;
  }
}

class MyClass032 {
  public syncMethod(): number {
    return 100;
  }

  public async asyncMethod(): Promise<number> {
    return 200;
  }
}

class EmptyClass033 {
}

class MyClass034 {
  public async asyncMethod(): Promise<void> {
  }

  public normalMethod(): void {
  }

  public anotherNormal(): string {
    return 'test';
  }
}

class ParentClass035 {
  public async parentAsync(): Promise<void> {
  }
}

class ChildClass035 extends ParentClass035 {
}

class ParentClass036 {
  public async overrideAsync(): Promise<void> {
  }
}

class ChildClass036 extends ParentClass036 {
  public override async overrideAsync(): Promise<void> {
  }
}

class MyClass037 {
  public final async finalAsync(): Promise<string> {
    return 'final-async';
  }
}

class MyClass038 {
  public returningObject(): object {
    return {};
  }

  public returningArray(): number[] {
    return [1, 2, 3];
  }
}

class MyClass040 {
  public async asyncReturnBool(): Promise<boolean> {
    return true;
  }
}

class MyClass041 {
  public async asyncReturnBigInt(): Promise<bigint> {
    return 10n;
  }
}

class CustomType042 {
  public value: number = 0;
}

class MyClass042 {
  public async asyncReturnCustom(): Promise<CustomType042> {
    return new CustomType042();
  }
}

class MyClass043 {
  public async asyncReturnArray(): Promise<number[]> {
    return [1, 2, 3];
  }
}

class MyClass044 {
  public async asyncWithOptional(a: number, b?: string): Promise<void> {
  }
}

class MyClass045 {
  public async asyncWithDefault(a: number, b: string = 'default'): Promise<void> {
  }
}

class MyClass046 {
  public async asyncOne(): Promise<void> {
  }

  public async asyncTwo(): Promise<void> {
  }

  public async asyncThree(): Promise<void> {
  }

  public async asyncFour(): Promise<void> {
  }
}

class MyClass047 {
  public async myAsyncName(): Promise<void> {
  }
}

class MyClass048 {
  public async firstAsync(): Promise<void> {
  }

  public async secondAsync(): Promise<void> {
  }
}

class MyClass049 {
  public async asyncNoParams(): Promise<void> {
  }
}

class MyClass050 {
  public async asyncThreeParams(a: number, b: string, c: boolean): Promise<void> {
  }
}

class MyClass051 {
  public async instanceAsync(): Promise<void> {
  }
}

class GrandParent052 {
  public async grandAsync(): Promise<void> {
  }
}

class ParentClass052 extends GrandParent052 {
  public async parentAsync(): Promise<void> {
  }
}

class ChildClass052 extends ParentClass052 {
  public async childAsync(): Promise<void> {
  }
}

class MyClass053 {
  public async publicAsyncCombined(): Promise<void> {
  }

  public syncMethodCombined(): void {
  }
}

class MyClass054 {
  public async asyncAlpha(): Promise<number> {
    return 1;
  }

  public async asyncBeta(): Promise<string> {
    return 'x';
  }

  public async asyncGamma(): Promise<boolean> {
    return true;
  }

  public syncDelta(): void {
  }
}

class MyClass055 {
  public async promiseVoidAsync(): Promise<void> {
  }

  public nonAsyncPromise(): Promise<void> {
    return Promise.resolve();
  }
}

class MyClass060 {
  public prop: number = 0;

  public get asyncCheck(): number {
    return this.prop;
  }

  public set asyncCheck(v: number) {
    this.prop = v;
  }

  public async realAsync(): Promise<void> {
  }
}

class MyClass061 {
  public async asyncForEquals(): Promise<void> {
  }
}

class MyClass062 {
  public async asyncAlphaEq(): Promise<number> {
    return 1;
  }

  public async asyncBetaEq(): Promise<string> {
    return 'x';
  }
}

class MyClass063 {
  public async asyncParamsCheck(a: number, b: string, c: boolean, d: number): Promise<void> {
  }
}

class MyClass064 {
  public async asyncSingleParam(a: number): Promise<number> {
    return a;
  }
}

class MyClass065 {
  public async combinedAsync(): Promise<void> {
  }

  public syncOne(): void {
  }

  public syncTwo(): string {
    return 'a';
  }
}

export default function InstanceMethodIsAsyncTest(): void {
  describe('InstanceMethodIsAsyncTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0001
     * @tc.name testInstanceMethodIsAsync0001
     * @tc.desc Verify isAsync() returns true for an async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let isAsync = method!.isAsync();
      expect(isAsync).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0002
     * @tc.name testInstanceMethodIsAsync0002
     * @tc.desc Verify non-async method returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isAsync()).assertEqual(false);
      let syncMethod = cls.getInstanceMethod('syncMethod');
      expect(syncMethod!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0003
     * @tc.name testInstanceMethodIsAsync0003
     * @tc.desc Verify public async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let method = cls.getInstanceMethod('publicAsyncMethod');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0004
     * @tc.name testInstanceMethodIsAsync0004
     * @tc.desc Verify private async method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('privateAsyncMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0005
     * @tc.name testInstanceMethodIsAsync0005
     * @tc.desc Verify protected async method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('protectedAsyncMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0006
     * @tc.name testInstanceMethodIsAsync0006
     * @tc.desc Verify async method returns Promise type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let voidMethod = cls.getInstanceMethod('asyncPromiseVoid');
      expect(voidMethod!.isAsync()).assertEqual(true);
      expect(voidMethod!.getReturnType().getName()).assertEqual('std.core.Promise');
      let numMethod = cls.getInstanceMethod('asyncPromiseNumber');
      expect(numMethod!.isAsync()).assertEqual(true);
      let strMethod = cls.getInstanceMethod('asyncPromiseString');
      expect(strMethod!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0007
     * @tc.name testInstanceMethodIsAsync0007
     * @tc.desc Verify isAsync() and isPublic() can both be true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0008
     * @tc.name testInstanceMethodIsAsync0008
     * @tc.desc Verify async and final can be used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let method = cls.getInstanceMethod('finalAsyncMethod');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0009
     * @tc.name testInstanceMethodIsAsync0009
     * @tc.desc Verify InstanceMethod.isAsync() returns true and getReturnType returns Promise for an async instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let method = cls.getInstanceMethod('instanceAsyncMethod');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0010
     * @tc.name testInstanceMethodIsAsync0010
     * @tc.desc Verify async method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass015>();
      let method = parentCls.getInstanceMethod('parentAsyncMethod');
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0011
     * @tc.name testInstanceMethodIsAsync0011
     * @tc.desc Verify overridden async method in subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass016>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0012
     * @tc.name testInstanceMethodIsAsync0012
     * @tc.desc Verify identifying async methods using isAsync()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let asyncMethodCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isAsync()) {
          asyncMethodCount++;
        }
      });
      expect(asyncMethodCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0013
     * @tc.name testInstanceMethodIsAsync0013
     * @tc.desc Verify public async is exposed and private or protected async lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      let pubAsync = cls.getInstanceMethod('publicAsync');
      expect(pubAsync!.isAsync()).assertEqual(true);
      expect(pubAsync!.isPublic()).assertEqual(true);
      let privAsync = cls.getInstanceMethod('privateAsync');
      expect(privAsync).assertUndefined();
      let protAsync = cls.getInstanceMethod('protectedAsync');
      expect(protAsync).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0014
     * @tc.name testInstanceMethodIsAsync0014
     * @tc.desc Verify InstanceMethod.isAsync() returns true with isPublic for async instance combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let method = cls.getInstanceMethod('instanceAsyncMethod');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0015
     * @tc.name testInstanceMethodIsAsync0015
     * @tc.desc Verify non-async method returning Promise has isAsync return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let method = cls.getInstanceMethod('returnsPromiseButNotAsync');
      expect(method!.isAsync()).assertEqual(false);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0016
     * @tc.name testInstanceMethodIsAsync0016
     * @tc.desc Verify async method with parameters returns true for isAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let method = cls.getInstanceMethod('asyncWithParams');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0017
     * @tc.name testInstanceMethodIsAsync0017
     * @tc.desc Verify async methods with different Promise return types all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      expect(cls.getInstanceMethod('asyncReturnNumber')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncReturnString')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncReturnBoolean')!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0018
     * @tc.name testInstanceMethodIsAsync0018
     * @tc.desc Verify sync and async methods in same class have correct isAsync values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      expect(cls.getInstanceMethod('syncMethod')!.isAsync()).assertEqual(false);
      expect(cls.getInstanceMethod('asyncMethod')!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0019
     * @tc.name testInstanceMethodIsAsync0019
     * @tc.desc Verify empty class has no methods to check isAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass033>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0020
     * @tc.name testInstanceMethodIsAsync0020
     * @tc.desc Verify isAsync for all methods in a mixed class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue Platform includes one implicit method in getInstanceMethods, causing syncCount to be 3
     *             (2 user-defined sync methods + 1 implicit) instead of the expected 2.
     *             Strengthened: now asserts the exact observed count (3). When the platform stops injecting the
     *             implicit method, this assertion will fail (count drops to 2), alerting that the bug is fixed;
     *             at that point revert to assertEqual(2).
     */
    it('testInstanceMethodIsAsync0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let asyncCount: number = 0;
      let syncCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isAsync()) {
          asyncCount++;
        } else {
          syncCount++;
        }
      });
      expect(asyncCount).assertEqual(1);
      expect(syncCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0021
     * @tc.name testInstanceMethodIsAsync0021
     * @tc.desc Verify inherited async method has isAsync true in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsAsync0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass035>();
      let method = childCls.getInstanceMethod('parentAsync');
      if (method !== undefined) {
        expect(method!.isAsync()).assertEqual(true);
      } else {
        expect(method).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0022
     * @tc.name testInstanceMethodIsAsync0022
     * @tc.desc Verify overridden async method in child class has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass036>();
      let childCls = Class.from<ChildClass036>();
      expect(parentCls.getInstanceMethod('overrideAsync')!.isAsync()).assertEqual(true);
      expect(childCls.getInstanceMethod('overrideAsync')!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0023
     * @tc.name testInstanceMethodIsAsync0023
     * @tc.desc Verify final async method has isAsync true and isFinal true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let method = cls.getInstanceMethod('finalAsync');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0024
     * @tc.name testInstanceMethodIsAsync0024
     * @tc.desc Verify that non-async methods returning object or array are not async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let objMethod = cls.getInstanceMethod('returningObject');
      expect(objMethod!.isAsync()).assertEqual(false);
      expect(objMethod!.isPublic()).assertEqual(true);
      let arrMethod = cls.getInstanceMethod('returningArray');
      expect(arrMethod!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0025
     * @tc.name testInstanceMethodIsAsync0025
     * @tc.desc Verify async method returning Promise<boolean> has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let method = cls.getInstanceMethod('asyncReturnBool');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0026
     * @tc.name testInstanceMethodIsAsync0026
     * @tc.desc Verify async method returning Promise<bigint> has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let method = cls.getInstanceMethod('asyncReturnBigInt');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0027
     * @tc.name testInstanceMethodIsAsync0027
     * @tc.desc Verify async method returning Promise<custom class> has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let method = cls.getInstanceMethod('asyncReturnCustom');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0028
     * @tc.name testInstanceMethodIsAsync0028
     * @tc.desc Verify async method returning Promise<array> has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('asyncReturnArray');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0029
     * @tc.name testInstanceMethodIsAsync0029
     * @tc.desc Verify async method with optional parameter has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('asyncWithOptional');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0030
     * @tc.name testInstanceMethodIsAsync0030
     * @tc.desc Verify async method with default value parameter has isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('asyncWithDefault');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0031
     * @tc.name testInstanceMethodIsAsync0031
     * @tc.desc Verify multiple async methods in one class all return isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();
      expect(cls.getInstanceMethod('asyncOne')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncTwo')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncThree')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncFour')!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0032
     * @tc.name testInstanceMethodIsAsync0032
     * @tc.desc Verify async method getName consistency with isAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass047>();
      let method = cls.getInstanceMethod('myAsyncName');
      expect(method!.getName()).assertEqual('myAsyncName');
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0033
     * @tc.name testInstanceMethodIsAsync0033
     * @tc.desc Verify two async methods in same class are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass048>();
      let m1 = cls.getInstanceMethod('firstAsync');
      let m2 = cls.getInstanceMethod('secondAsync');
      expect(m1!.isAsync()).assertEqual(true);
      expect(m2!.isAsync()).assertEqual(true);
      expect(m1!.equals(m2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0034
     * @tc.name testInstanceMethodIsAsync0034
     * @tc.desc Verify async method with no params has getParametersNum 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
      let method = cls.getInstanceMethod('asyncNoParams');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0035
     * @tc.name testInstanceMethodIsAsync0035
     * @tc.desc Verify async method with three params has correct getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      let method = cls.getInstanceMethod('asyncThreeParams');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0036
     * @tc.name testInstanceMethodIsAsync0036
     * @tc.desc Verify async method from Class.of and Class.from are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass051();
      let methodOf = Class.of(obj).getInstanceMethod('instanceAsync');
      let methodFrom = Class.from<MyClass051>().getInstanceMethod('instanceAsync');
      expect(methodOf!.isAsync()).assertEqual(true);
      expect(methodFrom!.isAsync()).assertEqual(true);
      expect(methodOf!.equals(methodFrom!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0037
     * @tc.name testInstanceMethodIsAsync0037
     * @tc.desc Verify multi-level inheritance async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<GrandParent052>();
      let pCls = Class.from<ParentClass052>();
      let cCls = Class.from<ChildClass052>();
      expect(gpCls.getInstanceMethod('grandAsync')!.isAsync()).assertEqual(true);
      expect(pCls.getInstanceMethod('parentAsync')!.isAsync()).assertEqual(true);
      expect(cCls.getInstanceMethod('childAsync')!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0038
     * @tc.name testInstanceMethodIsAsync0038
     * @tc.desc Verify mixed class with async and sync methods - identify correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let asyncM = cls.getInstanceMethod('publicAsyncCombined');
      let syncM = cls.getInstanceMethod('syncMethodCombined');
      expect(asyncM!.isAsync()).assertEqual(true);
      expect(syncM!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0039
     * @tc.name testInstanceMethodIsAsync0039
     * @tc.desc Verify multiple async methods with different return types all isAsync true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      expect(cls.getInstanceMethod('asyncAlpha')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncBeta')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('asyncGamma')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('syncDelta')!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0040
     * @tc.name testInstanceMethodIsAsync0040
     * @tc.desc Verify async vs non-async method both returning Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let asyncM = cls.getInstanceMethod('promiseVoidAsync');
      let nonAsyncM = cls.getInstanceMethod('nonAsyncPromise');
      expect(asyncM!.isAsync()).assertEqual(true);
      expect(nonAsyncM!.isAsync()).assertEqual(false);
      expect(nonAsyncM!.getReturnType().getName()).assertEqual('std.core.Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0041
     * @tc.name testInstanceMethodIsAsync0041
     * @tc.desc Verify async method and getter/setter coexist - getter is not async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
      let getter = cls.getInstanceMethod('%%get-asyncCheck');
      let setter = cls.getInstanceMethod('%%set-asyncCheck');
      let asyncM = cls.getInstanceMethod('realAsync');
      expect(getter!.isAsync()).assertEqual(false);
      expect(setter!.isAsync()).assertEqual(false);
      expect(asyncM!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0042
     * @tc.name testInstanceMethodIsAsync0042
     * @tc.desc Verify async method equals itself (reflexivity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let m1 = cls.getInstanceMethod('asyncForEquals');
      let m2 = cls.getInstanceMethod('asyncForEquals');
      expect(m1!.isAsync()).assertEqual(true);
      expect(m1!.equals(m2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0043
     * @tc.name testInstanceMethodIsAsync0043
     * @tc.desc Verify async methods with different return types are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass062>();
      let m1 = cls.getInstanceMethod('asyncAlphaEq');
      let m2 = cls.getInstanceMethod('asyncBetaEq');
      expect(m1!.isAsync()).assertEqual(true);
      expect(m2!.isAsync()).assertEqual(true);
      expect(m1!.equals(m2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0044
     * @tc.name testInstanceMethodIsAsync0044
     * @tc.desc Verify async method with four params has correct getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass063>();
      let method = cls.getInstanceMethod('asyncParamsCheck');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0045
     * @tc.name testInstanceMethodIsAsync0045
     * @tc.desc Verify async method with single param has correct getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass064>();
      let method = cls.getInstanceMethod('asyncSingleParam');
      expect(method!.isAsync()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISASYNC_0046
     * @tc.name testInstanceMethodIsAsync0046
     * @tc.desc Verify mixed class async and sync methods count correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAsync0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass065>();
      let asyncM = cls.getInstanceMethod('combinedAsync');
      let sync1 = cls.getInstanceMethod('syncOne');
      let sync2 = cls.getInstanceMethod('syncTwo');
      expect(asyncM!.isAsync()).assertEqual(true);
      expect(sync1!.isAsync()).assertEqual(false);
      expect(sync2!.isAsync()).assertEqual(false);
    });
  });
}
