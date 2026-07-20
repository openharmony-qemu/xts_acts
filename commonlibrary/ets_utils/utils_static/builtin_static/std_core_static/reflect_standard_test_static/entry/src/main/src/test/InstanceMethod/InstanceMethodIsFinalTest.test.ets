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
  public final testMethod(): void {
  }
}

class MyClass005 {
  public normalMethod(): void {
  }

  public anotherNormal(): string {
    return 'test';
  }
}

class MyClass007 {
  private final privateFinalMethod(): void {
  }
}

class MyClass008 {
  protected final protectedFinalMethod(): void {
  }
}

class MyClass010 {
  private _value: number = 0;

  public final get value(): number {
    return this._value;
  }

  public final set value(v: number) {
    this._value = v;
  }
}

class MyClass014 {
  public final async finalAsyncMethod(): Promise<void> {
  }
}

class ParentClass016 {
  public normalMethod(): void {
  }
}

class ChildClass016 extends ParentClass016 {
  public final finalMethod(): void {
  }
}

class MyClass018 {
  public final finalMethod(): void {
  }

  public normalMethod(): void {
  }
}

class MyClass024 {
  public final publicFinal(): void {
  }

  private final privateFinal(): void {
  }

  protected final protectedFinal(): void {
  }
}

class MyClass030 {
  public final finalWithParams(a: number, b: string): boolean {
    return true;
  }
}

class MyClass031 {
  public final finalReturnNumber(): number {
    return 100;
  }

  public final finalReturnString(): string {
    return 'final';
  }

  public final finalReturnBoolean(): boolean {
    return true;
  }
}

class MyClass032 {
  public final finalMethod(): void {
  }

  public normalMethod(): void {
  }

  public anotherNormal(): string {
    return 'test';
  }
}

class EmptyClass033 {
}

class MyClass034 {
  public final finalAsyncMethod(): Promise<string> {
    return Promise.resolve('test');
  }
}

class ParentClass035 {
  public final parentFinalMethod(): void {
  }
}

class ChildClass035 extends ParentClass035 {
}

class MyClass036 {
  public final finalMethod(): void {
  }

  public nonFinalMethod(): void {
  }
}

class MyClass037 {
  public final finalWithParams(a: number, b: string): string {
    return b + a;
  }
}

class MyClass040 {
  public final voidMethod(): void {
  }
}

class CustomType041 {
  public id: number = 0;
}

class MyClass041 {
  public final getCustom(): CustomType041 {
    return new CustomType041();
  }
}

class MyClass042 {
  public final getArray(): number[] {
    return [1, 2, 3];
  }
}

class MyClass043 {
  public final optMethod(a: number, b?: string): void {
  }
}

class MyClass044 {
  public final defMethod(a: number, b: string = 'default'): void {
  }
}

class MyClass045 {
  public final restMethod(...args: string[]): void {
  }
}

class ParentClass046 {
  public final parentFinal(): void {
  }
}

class ChildClass046 extends ParentClass046 {
  public childOwnMethod(): void {
  }
}

abstract class AbstractClass047 {
  public abstract absMethod(): void;

  public final concreteFinalMethod(): void {
  }
}

class MyClass048 {
  public final finalGenericMethod<T>(value: T): T {
    return value;
  }
}

class MyClass049 {
  public final finalMethodA(): void {
  }

  public final finalMethodB(): void {
  }
}

class MyClass050 {
  public final getMap(): Map<string, number> {
    return new Map<string, number>();
  }
}

class MyClass051 {
  public final getSet(): Set<number> {
    return new Set<number>();
  }
}

class MyClass052 {
  public final finalOne(): void {
  }

  public final finalTwo(): void {
  }

  public final finalThree(): void {
  }

  public normalOne(): void {
  }
}

class MyClass053 {
  public final stableMethod(): void {
  }
}

class MyClass054 {
  public final manyParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass055 {
  private _val: number = 0;

  public final get val(): number {
    return this._val;
  }
}

class MyClass056 {
  private _val: number = 0;

  public final set val(v: number) {
    this._val = v;
  }
}

export default function InstanceMethodIsFinalTest(): void {
  describe('InstanceMethodIsFinalTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0001
     * @tc.name testInstanceMethodIsFinal0001
     * @tc.desc Verify isFinal() returns true for a final method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let isFinal = method!.isFinal();
      expect(isFinal).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0002
     * @tc.name testInstanceMethodIsFinal0002
     * @tc.desc Verify non-final method returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isFinal()).assertEqual(false);
      let anotherNormal = cls.getInstanceMethod('anotherNormal');
      expect(anotherNormal!.isFinal()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0003
     * @tc.name testInstanceMethodIsFinal0003
     * @tc.desc Verify private final method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('privateFinalMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0004
     * @tc.name testInstanceMethodIsFinal0004
     * @tc.desc Verify protected final method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('protectedFinalMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0005
     * @tc.name testInstanceMethodIsFinal0005
     * @tc.desc Verify final getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');
      expect(getter!.isFinal()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
      expect(setter!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0006
     * @tc.name testInstanceMethodIsFinal0006
     * @tc.desc Verify final and async can be used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let method = cls.getInstanceMethod('finalAsyncMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0007
     * @tc.name testInstanceMethodIsFinal0007
     * @tc.desc Verify subclass can define its own final method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass016>();
      let method = childCls.getInstanceMethod('finalMethod');
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0008
     * @tc.name testInstanceMethodIsFinal0008
     * @tc.desc Verify identifying final methods using isFinal()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let finalMethodCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isFinal()) {
          finalMethodCount++;
        }
      });
      expect(finalMethodCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0009
     * @tc.name testInstanceMethodIsFinal0009
     * @tc.desc Verify public final is exposed and private or protected final lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let pubFinal = cls.getInstanceMethod('publicFinal');
      expect(pubFinal!.isFinal()).assertEqual(true);
      expect(pubFinal!.isPublic()).assertEqual(true);
      let privFinal = cls.getInstanceMethod('privateFinal');
      expect(privFinal).assertUndefined();
      let protFinal = cls.getInstanceMethod('protectedFinal');
      expect(protFinal).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0010
     * @tc.name testInstanceMethodIsFinal0010
     * @tc.desc Verify final method with parameters returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let method = cls.getInstanceMethod('finalWithParams');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0011
     * @tc.name testInstanceMethodIsFinal0011
     * @tc.desc Verify final methods with different return types all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      expect(cls.getInstanceMethod('finalReturnNumber')!.isFinal()).assertEqual(true);
      expect(cls.getInstanceMethod('finalReturnString')!.isFinal()).assertEqual(true);
      expect(cls.getInstanceMethod('finalReturnBoolean')!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0012
     * @tc.name testInstanceMethodIsFinal0012
     * @tc.desc Verify mixed final and non-final methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      expect(cls.getInstanceMethod('finalMethod')!.isFinal()).assertEqual(true);
      expect(cls.getInstanceMethod('normalMethod')!.isFinal()).assertEqual(false);
      expect(cls.getInstanceMethod('anotherNormal')!.isFinal()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0013
     * @tc.name testInstanceMethodIsFinal0013
     * @tc.desc Verify empty class has no methods to check isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass033>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0014
     * @tc.name testInstanceMethodIsFinal0014
     * @tc.desc Verify final method returning Promise has isFinal true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let method = cls.getInstanceMethod('finalAsyncMethod');
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0015
     * @tc.name testInstanceMethodIsFinal0015
     * @tc.desc Verify getInstanceMethod returns undefined for inherited final method on child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass035>();
      let childCls = Class.from<ChildClass035>();
      expect(parentCls.getInstanceMethod('parentFinalMethod')!.isFinal()).assertEqual(true);
      let childMethod = childCls.getInstanceMethod('parentFinalMethod');
      expect(childMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0016
     * @tc.name testInstanceMethodIsFinal0016
     * @tc.desc Verify isFinal for all methods in a mixed class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let finalCount: number = 0;
      let nonFinalCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isFinal()) {
          finalCount++;
        } else {
          nonFinalCount++;
        }
      });
      expect(finalCount).assertEqual(1);
      expect(nonFinalCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0017
     * @tc.name testInstanceMethodIsFinal0017
     * @tc.desc Verify final method combined with isPublic check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isAbstract()).assertEqual(false);
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0018
     * @tc.name testInstanceMethodIsFinal0018
     * @tc.desc Verify final method with parameters returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let method = cls.getInstanceMethod('finalWithParams');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0019
     * @tc.name testInstanceMethodIsFinal0019
     * @tc.desc Verify final void method combined with getName and getReturnType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let method = cls.getInstanceMethod('voidMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.getName()).assertEqual('voidMethod');
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0020
     * @tc.name testInstanceMethodIsFinal0020
     * @tc.desc Verify final method returning a custom class type returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let method = cls.getInstanceMethod('getCustom');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0021
     * @tc.name testInstanceMethodIsFinal0021
     * @tc.desc Verify final method returning an array type returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let method = cls.getInstanceMethod('getArray');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0022
     * @tc.name testInstanceMethodIsFinal0022
     * @tc.desc Verify looking up a non-existent method name returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let method = cls.getInstanceMethod('nonExistentMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0023
     * @tc.name testInstanceMethodIsFinal0023
     * @tc.desc Verify final method with optional parameter returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('optMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0024
     * @tc.name testInstanceMethodIsFinal0024
     * @tc.desc Verify final method with default value parameter returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('defMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0025
     * @tc.name testInstanceMethodIsFinal0025
     * @tc.desc Verify final method with rest parameters returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('restMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0026
     * @tc.name testInstanceMethodIsFinal0026
     * @tc.desc Verify child class own non-final method returns false for isFinal while parent has final method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass046>();
      expect(parentCls.getInstanceMethod('parentFinal')!.isFinal()).assertEqual(true);
      let childCls = Class.from<ChildClass046>();
      let ownMethod = childCls.getInstanceMethod('childOwnMethod');
      expect(ownMethod!.isFinal()).assertEqual(false);
      expect(ownMethod!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0027
     * @tc.name testInstanceMethodIsFinal0027
     * @tc.desc Verify final concrete method in abstract class returns true and abstract method is not final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass047>();
      let concrete = cls.getInstanceMethod('concreteFinalMethod');
      expect(concrete!.isFinal()).assertEqual(true);
      expect(concrete!.isAbstract()).assertEqual(false);
      let absMethod = cls.getInstanceMethod('absMethod');
      expect(absMethod!.isAbstract()).assertEqual(true);
      expect(absMethod!.isFinal()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0028
     * @tc.name testInstanceMethodIsFinal0028
     * @tc.desc Verify final generic method returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass048>();
      let method = cls.getInstanceMethod('finalGenericMethod');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0029
     * @tc.name testInstanceMethodIsFinal0029
     * @tc.desc Verify method equality for methods with same isFinal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
      let methodA1 = cls.getInstanceMethod('finalMethodA');
      let methodA2 = cls.getInstanceMethod('finalMethodA');
      expect(methodA1!.isFinal()).assertEqual(true);
      expect(methodA2!.isFinal()).assertEqual(true);
      expect(methodA1!.equals(methodA2!)).assertEqual(true);
      let methodB = cls.getInstanceMethod('finalMethodB');
      expect(methodB!.isFinal()).assertEqual(true);
      expect(methodA1!.equals(methodB!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0030
     * @tc.name testInstanceMethodIsFinal0030
     * @tc.desc Verify final method returning Map type returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      let method = cls.getInstanceMethod('getMap');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0031
     * @tc.name testInstanceMethodIsFinal0031
     * @tc.desc Verify final method returning Set type returns true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let method = cls.getInstanceMethod('getSet');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0032
     * @tc.name testInstanceMethodIsFinal0032
     * @tc.desc Verify counting final methods using getInstanceMethods in a class with multiple final methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let finalCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isFinal()) {
          finalCount++;
        }
      });
      expect(finalCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0033
     * @tc.name testInstanceMethodIsFinal0033
     * @tc.desc Verify isFinal returns true for a stable final method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let method = cls.getInstanceMethod('stableMethod');
      expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0034
     * @tc.name testInstanceMethodIsFinal0034
     * @tc.desc Verify final method with five parameters returns true for isFinal and correct parameter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('manyParams');
      expect(method!.isFinal()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(5);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0035
     * @tc.name testInstanceMethodIsFinal0035
     * @tc.desc Verify final getter only (no setter) returns true for isFinal and setter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let getter = cls.getInstanceMethod('%%get-val');
      expect(getter!.isFinal()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-val');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISFINAL_0036
     * @tc.name testInstanceMethodIsFinal0036
     * @tc.desc Verify final setter only (no getter) returns true for isFinal and getter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsFinal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let getter = cls.getInstanceMethod('%%get-val');
      expect(getter).assertUndefined();
      let setter = cls.getInstanceMethod('%%set-val');
      expect(setter!.isFinal()).assertEqual(true);
    });
  });
}
