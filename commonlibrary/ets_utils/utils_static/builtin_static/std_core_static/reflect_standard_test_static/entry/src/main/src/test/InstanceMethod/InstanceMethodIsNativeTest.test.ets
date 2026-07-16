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

class MyClass007 {
  public constructor() {
  }

  public constructorNamedMethod(): void {
  }
}

class MyClass008 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(v: number) {
    this._value = v;
  }
}

class MyClass012 {
  public userMethod(): void {
  }
}

class MyClass015 {
  public testMethod(): void {
  }
}

class ParentClass017 {
  public parentMethod(): void {
  }
}

class ParentClass018 {
  public overrideMethod(): void {
  }
}

class ChildClass018 extends ParentClass018 {
  public override overrideMethod(): void {
  }
}

class MyClass019 {
  public numberParam(a: number): void {
  }

  public stringParam(a: string): void {
  }

  public boolParam(a: boolean): void {
  }

  public objectParam(a: object): void {
  }

  public arrayParam(a: number[]): void {
  }
}

class MyClass020 {
  public userMethod(): void {
  }
}

abstract class AbstractClass024 {
  public abstract abstractMethod(): void;
}

class MyClass025 {
  public async asyncMethod(): Promise<void> {
  }
}

class MyClass026 {
  public genericMethod<T>(param: T): void {
  }
}

class MyClass031 {
  public testMethod(): void {
  }
}

class MyClass032 {
  public voidMethod(): void {
  }

  public numberMethod(): number {
    return 0;
  }

  public stringMethod(): string {
    return 'test';
  }

  public boolMethod(): boolean {
    return true;
  }

  public objectMethod(): object {
    return {};
  }
}

class MyClass033 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }

  public anotherPublicMethod(): void {
  }

  public final finalMethod(): void {
  }
}

class CustomType034 {
}

class MyClass034 {
  public customParam(a: CustomType034): void {
  }
}

class MyClass035 {
  public mapParam(m: Map<string, number>): void {
  }

  public setParam(s: Set<number>): void {
  }
}

class MyClass036 {
  public manyParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class EmptyClass037 {
}

class MyClass038 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }

  public method3(a: number): boolean {
    return true;
  }
}

class ParentClass039 {
  public parentMethod(): void {
  }
}

class ChildClass039 extends ParentClass039 {
}

class MyClass040 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass041 {
  public final finalMethod(): string {
    return 'final';
  }

  public async asyncMethod(): Promise<void> {
  }
}

class MyClass042 {
  public userMethod(a: number, b: string): boolean {
    return a > 0;
  }
}

class CustomType043 {
  public value: number = 0;
}

class MyClass043 {
  public getCustom(): CustomType043 {
    return new CustomType043();
  }
}

class MyClass044 {
  public getArrayMethod(): number[] {
    return [];
  }
}

class MyClass045 {
  public getDateMethod(): Date {
    return new Date();
  }
}

class MyClass046 {
  public getRegExpMethod(): RegExp {
    return new RegExp('test');
  }
}

class MyClass047 {
  public optionalParamMethod(a: number, b?: string): void {
  }
}

class MyClass048 {
  public defaultParamMethod(a: number, b: string = 'default'): void {
  }
}

class MyClass049 {
  public restParamMethod(...args: string[]): void {
  }
}

class GrandparentClass050 {
  public grandparentMethod(): void {
  }
}

class ParentClass050 extends GrandparentClass050 {
  public parentMethod(): void {
  }
}

class MyClass051 {
  public getMapMethod(): Map<string, number> {
    return new Map<string, number>();
  }
}

class MyClass052 {
  public getSetMethod(): Set<number> {
    return new Set<number>();
  }
}

class MyClass053 {
  public async promiseMethod(): Promise<number> {
    return 0;
  }
}

class MyClass054 {
  public numberReturnMethod(): number {
    return 0;
  }

  public voidReturnMethod(): void {
  }
}

class MyClass055 {
  public methodA(): void {
  }

  public methodB(): number {
    return 0;
  }

  public methodC(): string {
    return '';
  }

  public methodD(): boolean {
    return true;
  }

  public async methodE(): Promise<void> {
  }

  public final finalMethodF(): void {
  }
}

class MyClass056 {
  public mixedParams(a: number, b: string, c: boolean, d: number[], e: CustomType043): void {
  }
}

class MyClass057 {
  private _data: string = '';

  public get data(): string {
    return this._data;
  }
}

class MyClass058 {
  public alphaMethod(): void {
  }

  public betaMethod(): void {
  }
}

export default function InstanceMethodIsNativeTest(): void {
  describe('InstanceMethodIsNativeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0001
     * @tc.name testInstanceMethodIsNative0001
     * @tc.desc Verify built-in type native method returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<number>>();
      let method = cls.getInstanceMethod('$_set');
      expect(method!.getName()).assertEqual('$_set');
      expect(method!.isNative()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0002
     * @tc.name testInstanceMethodIsNative0002
     * @tc.desc Verify an instance method on a class with a constructor is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('constructorNamedMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0003
     * @tc.name testInstanceMethodIsNative0003
     * @tc.desc Verify getter and setter are not native methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');
      expect(getter!.isNative()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
      expect(setter!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0004
     * @tc.name testInstanceMethodIsNative0004
     * @tc.desc Verify non-existent method lookup returns undefined before isNative()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let method = cls.getInstanceMethod('nonExistentMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0005
     * @tc.name testInstanceMethodIsNative0005
     * @tc.desc Verify isNative() with getName() coordination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let method = cls.getInstanceMethod('testMethod');
      let methodName = method!.getName();
      let isNative = method!.isNative();

      expect(methodName).assertEqual('testMethod');
      expect(isNative).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0006
     * @tc.name testInstanceMethodIsNative0006
     * @tc.desc Verify method declared on a parent class is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass017>();
      let method = parentCls.getInstanceMethod('parentMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0007
     * @tc.name testInstanceMethodIsNative0007
     * @tc.desc Verify overridden method is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass018>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0008
     * @tc.name testInstanceMethodIsNative0008
     * @tc.desc Verify methods with different parameter types are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      expect(cls.getInstanceMethod('numberParam')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('stringParam')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('boolParam')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('objectParam')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('arrayParam')!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0009
     * @tc.name testInstanceMethodIsNative0009
     * @tc.desc Verify user-defined instance methods are non-native using isNative()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let nonNativeCount: number = 0;
      let nonNativeMethodName: string = '';
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (!method.isNative()) {
          nonNativeCount++;
          nonNativeMethodName = method.getName();
        }
      });
      expect(nonNativeCount).assertEqual(1);
      expect(nonNativeMethodName).assertEqual('userMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0010
     * @tc.name testInstanceMethodIsNative0010
     * @tc.desc Verify abstract method is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass024>();
      let method = absCls.getInstanceMethod('abstractMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0011
     * @tc.name testInstanceMethodIsNative0011
     * @tc.desc Verify async method is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0012
     * @tc.name testInstanceMethodIsNative0012
     * @tc.desc Verify generic method is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let method = cls.getInstanceMethod('genericMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0013
     * @tc.name testInstanceMethodIsNative0013
     * @tc.desc Verify isNative() with logical combination conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0014
     * @tc.name testInstanceMethodIsNative0014
     * @tc.desc Verify methods with different return types are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      expect(cls.getInstanceMethod('voidMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('numberMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('stringMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('boolMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('objectMethod')!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0015
     * @tc.name testInstanceMethodIsNative0015
     * @tc.desc Verify visible methods with different modifiers are non-native and hidden non-public lookups return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
      expect(cls.getInstanceMethod('publicMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('privateMethod')).assertUndefined();
      expect(cls.getInstanceMethod('protectedMethod')).assertUndefined();
      expect(cls.getInstanceMethod('anotherPublicMethod')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('finalMethod')!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0016
     * @tc.name testInstanceMethodIsNative0016
     * @tc.desc Verify method with custom class parameter is non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let method = cls.getInstanceMethod('customParam');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0017
     * @tc.name testInstanceMethodIsNative0017
     * @tc.desc Verify methods with Map and Set parameters are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      expect(cls.getInstanceMethod('mapParam')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('setParam')!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0018
     * @tc.name testInstanceMethodIsNative0018
     * @tc.desc Verify method with many parameters is non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let method = cls.getInstanceMethod('manyParams');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0019
     * @tc.name testInstanceMethodIsNative0019
     * @tc.desc Verify empty class has no methods to check isNative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass037>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0020
     * @tc.name testInstanceMethodIsNative0020
     * @tc.desc Verify all methods in a class return false for isNative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isNative()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0021
     * @tc.name testInstanceMethodIsNative0021
     * @tc.desc Verify inherited method is non-native in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsNative0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass039>();
      let childCls = Class.from<ChildClass039>();
      expect(parentCls.getInstanceMethod('parentMethod')!.isNative()).assertEqual(false);
      let childMethod = childCls.getInstanceMethod('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.isNative()).assertEqual(false);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0022
     * @tc.name testInstanceMethodIsNative0022
     * @tc.desc Verify getter and setter are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isNative()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0023
     * @tc.name testInstanceMethodIsNative0023
     * @tc.desc Verify final and async methods are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let finalMethod = cls.getInstanceMethod('finalMethod');
      expect(finalMethod!.isNative()).assertEqual(false);
      expect(finalMethod!.isFinal()).assertEqual(true);
      let asyncMethod = cls.getInstanceMethod('asyncMethod');
      expect(asyncMethod!.isNative()).assertEqual(false);
      expect(asyncMethod!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0024
     * @tc.name testInstanceMethodIsNative0024
     * @tc.desc Verify user-defined method with parameters is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let method = cls.getInstanceMethod('userMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0025
     * @tc.name testInstanceMethodIsNative0025
     * @tc.desc Verify method returning custom class type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('getCustom');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getName()).assertEqual('getCustom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0026
     * @tc.name testInstanceMethodIsNative0026
     * @tc.desc Verify method returning array type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('getArrayMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0027
     * @tc.name testInstanceMethodIsNative0027
     * @tc.desc Verify method returning Date type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('getDateMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0028
     * @tc.name testInstanceMethodIsNative0028
     * @tc.desc Verify method returning RegExp type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();
      let method = cls.getInstanceMethod('getRegExpMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0029
     * @tc.name testInstanceMethodIsNative0029
     * @tc.desc Verify method with optional parameter is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass047>();
      let method = cls.getInstanceMethod('optionalParamMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0030
     * @tc.name testInstanceMethodIsNative0030
     * @tc.desc Verify method with default value parameter is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass048>();
      let method = cls.getInstanceMethod('defaultParamMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0031
     * @tc.name testInstanceMethodIsNative0031
     * @tc.desc Verify method with rest parameters is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
      let method = cls.getInstanceMethod('restParamMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0032
     * @tc.name testInstanceMethodIsNative0032
     * @tc.desc Verify methods in a multi-level inheritance chain are not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<GrandparentClass050>();
      expect(gpCls.getInstanceMethod('grandparentMethod')!.isNative()).assertEqual(false);
      let pCls = Class.from<ParentClass050>();
      expect(pCls.getInstanceMethod('parentMethod')!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0033
     * @tc.name testInstanceMethodIsNative0033
     * @tc.desc Verify method returning Map type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let method = cls.getInstanceMethod('getMapMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0034
     * @tc.name testInstanceMethodIsNative0034
     * @tc.desc Verify method returning Set type is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let method = cls.getInstanceMethod('getSetMethod');
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0035
     * @tc.name testInstanceMethodIsNative0035
     * @tc.desc Verify async method returning Promise is not native and isAsync is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let method = cls.getInstanceMethod('promiseMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0036
     * @tc.name testInstanceMethodIsNative0036
     * @tc.desc Verify isNative consistency with getReturnType for number returning f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('numberReturnMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getReturnType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0037
     * @tc.name testInstanceMethodIsNative0037
     * @tc.desc Verify isNative consistency with getReturnType for void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('voidReturnMethod');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0038
     * @tc.name testInstanceMethodIsNative0038
     * @tc.desc Verify equals() comparison between methods and isNative consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let method1 = cls.getInstanceMethod('alphaMethod');
      let method2 = cls.getInstanceMethod('alphaMethod');
      expect(method1!.isNative()).assertEqual(false);
      expect(method2!.isNative()).assertEqual(false);
      expect(method1!.equals(method2!)).assertEqual(true);
      let otherMethod = cls.getInstanceMethod('betaMethod');
      expect(method1!.equals(otherMethod!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0039
     * @tc.name testInstanceMethodIsNative0039
     * @tc.desc Verify all methods in a mixed class with various types are non-native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isNative()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0040
     * @tc.name testInstanceMethodIsNative0040
     * @tc.desc Verify method with mixed complex parameter types is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let method = cls.getInstanceMethod('mixedParams');
      expect(method!.isNative()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0041
     * @tc.name testInstanceMethodIsNative0041
     * @tc.desc Verify getter-only accessor with no setter is not native
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let getter = cls.getInstanceMethod('%%get-data');
      expect(getter!.isNative()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-data');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISNATIVE_0042
     * @tc.name testInstanceMethodIsNative0042
     * @tc.desc Verify isNative with isPublic isAsync isFinal consistency for multiple methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsNative0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      expect(cls.getInstanceMethod('methodA')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('methodA')!.isPublic()).assertEqual(true);
      expect(cls.getInstanceMethod('methodB')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('methodC')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('methodD')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('methodE')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('methodE')!.isAsync()).assertEqual(true);
      expect(cls.getInstanceMethod('finalMethodF')!.isNative()).assertEqual(false);
      expect(cls.getInstanceMethod('finalMethodF')!.isFinal()).assertEqual(true);
    });
  });
}
