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
import Utils from '../Util.test';

function findInstanceMethodByName(methods: FixedArray<reflect.InstanceMethod>, name: string): reflect.InstanceMethod | undefined {
  for (let i = 0; i < methods.length; i++) {
    if (methods[i].getName() === name) {
      return methods[i];
    }
  }
  return undefined;
}

function findInstanceMethodMatching(
  methods: FixedArray<reflect.InstanceMethod>,
  matcher: (m: reflect.InstanceMethod) => boolean
): reflect.InstanceMethod | undefined {
  for (let i = 0; i < methods.length; i++) {
    if (matcher(methods[i])) {
      return methods[i];
    }
  }
  return undefined;
}

function strArrayContains(arr: Array<string>, s: string): boolean {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === s) {
      return true;
    }
  }
  return false;
}

interface MethodInfoSnapshot056 {
  name: string;
  owner: string;
  returnType: string;
  paramCount: int;
  isPublic: boolean;
  isPrivate: boolean;
  isAsync: boolean;
  isFinal: boolean;
}

class ExternalClass {
  public extMethod(): void {}
}

class MyClass001 {
  public method1(): void {}
  public method2(): string { return "test"; }
  private privateMethod(): void {}
}

class TestClass003 {
  public testMethod(): void {}
}

class TestClass004 {
  public testMethod(): void {}
}

class MyClass005 {
  public method1(): void {}
  public method2(): string { return "test"; }
}

class MyClass006 {
  public method1(): void {}
  public method2(): string { return "test"; }
  public method3(): int { return 0; }
}

class MyClass007 {
  public testMethod(): void {}
}

class EmptyClass008 {
  private privateMethod(): void {}
  public static staticMethod(): void {}
}

class PrivateOnlyClass009 {
  private privateMethod1(): void {}
  private privateMethod2(): string { return "test"; }
}

class StaticOnlyClass010 {
  public static staticMethod1(): void {}
  public static staticMethod2(): string { return "test"; }
}

class MyClass011 {
  public testMethod(): void {}
}

class MyClass012 {
  public testMethod(param1: int, param2: string): boolean {
    return true;
  }
}

class ManyMethodsClass013 {
  public method1(): void {}
  public method2(): void {}
  public method3(): void {}
  public method4(): void {}
  public method5(): void {}
  public method6(): void {}
  public method7(): void {}
  public method8(): void {}
  public method9(): void {}
  public method10(): void {}
}

class OverloadClass014 {
  public test(): string {
    return "no param";
  }
  public test(msg: string): string {
    return msg;
  }
  public test(msg: string, count: int): string {
    return msg + count;
  }
}

class PublicClass015 {
  public publicMethod1(): void {}
  public publicMethod2(): string { return "test"; }
  public publicMethod3(): int { return 0; }
}

class DefaultPublicClass016 {
  defaultMethod(): void {}
}

class MixedClass017 {
  public publicMethod(): void {}
  private privateMethod(): void {}
}

class AllPrivateClass018 {
  private method1(): void {}
  private method2(): string { return "test"; }
}

class ProtectedClass019 {
  public publicMethod(): void {}
  protected protectedMethod(): void {}
}

class StaticClass020 {
  public instanceMethod(): void {}
  public static staticMethod(): void {}
}

class OnlyStaticClass021 {
  public static method1(): void {}
  public static method2(): string { return "test"; }
}

class MyClass022 implements MyInterface022 {
  public interfaceMethod(): string {
    return "implemented";
  }
  public classMethod(): void {}
}

interface MyInterface022 {
  interfaceMethod(): string;
}

class MultiInterfaceClass023 implements Interface1023, Interface2023 {
  public method1(): void {}
  public method2(): void {}
  public ownMethod(): void {}
}

interface Interface2023 {
  method2(): void;
}

interface Interface1023 {
  method1(): void;
}

class ImplClass024 implements InterfaceWithDefault024 {
  public defaultMethod(): string {
    return "implementation";
  }
}

interface InterfaceWithDefault024 {
  defaultMethod(): string;
}

class ChildClass025 extends ParentClass025 {
  public childMethod(): void {}
}

class ParentClass025 {
  public parentMethod(): void {}
}

class ChildClass026 extends ParentClass026 {
  public childMethod(): void {}
}

class ParentClass026 extends GrandParentClass026 {
  public parentMethod(): void {}
}

class GrandParentClass026 {
  public grandParentMethod(): void {}
}

class ChildClass027 extends ParentClass027 {
  public override overriddenMethod(): string {
    return "child";
  }
}

class ParentClass027 {
  public overriddenMethod(): string {
    return "parent";
  }
}

class MixedClass028 extends ParentClass028 implements MyInterface028 {
  public interfaceMethod(): void {}
  public ownMethod(): void {}
}

interface MyInterface028 {
  interfaceMethod(): void;
}

class ParentClass028 {
  public parentMethod(): void {}
}

class GetterClass029 {
  private _name: string = '';
  public get name(): string {
    return this._name;
  }
  public set name(value: string) {
    this._name = value;
  }
}

class SetterClass030 {
  private _value: int = 0;
  public get value(): int {
    return this._value;
  }
  public set value(val: int) {
    this._value = val;
  }
}

class ReadOnlyClass031 {
  private _readonly: string = 'test';
  public get readonly(): string {
    return this._readonly;
  }
}

class WithConstructor032 {
  public constructor() {}
  public constructor(param: string) {}
  public normalMethod(): void {}
}

class AsyncClass033 {
  public async asyncMethod(): Promise<string> {
    return "async result";
  }
  public syncMethod(): void {}
}

class GenericMethodClass034 {
  public genericMethod<T>(param: T): T {
    return param;
  }
  public normalMethod(): void {}
}

class FinalMethodClass035 {
  public final finalMethod(): void {}
  public normalMethod(): void {}
}

abstract class AbstractClass036 {
  public abstract abstractMethod(): void;
  public concreteMethod(): void {}
}

class NativeTestClass037 {
  public $_set(index: int, val: string): void {}
}

abstract class AbstractClass038 {
  public abstract abstractMethod(): void;
  public concreteMethod(): string {
    return "concrete";
  }
  private privateMethod(): void {}
}

class FinalClass039 {
  public method1(): void {}
  public method2(): string { return "test"; }
}

interface TestInterface040 {
  interfaceMethod(): void;
}

class GenericClass041<T> {
  public genericMethod(param: T): T {
    return param;
  }
  public normalMethod(): void {}
}

class GenericContainer042<T> {
  public get(value: T): T {
    return value;
  }
  public set(value: T): void {}
}

class EmptyClass043 {}

class LazyClass044 {
  public method(): void {}
}

class TestClass045 {
  public method(): void {}
}

class OriginalClass046 {
  public originalMethod(): void {}
}

class OwnerClass047 {
  public testMethod(): void {}
}

class MixedClass048 {
  public publicMethod(): void {}
  private privateMethod(): void {}
  protected protectedMethod(): void {}
}

class MixedClass049 {
  public instanceMethod(): void {}
  public static staticMethod(): void {}
}

class MixedClass050 {
  public instanceMethod1(): void {}
  public instanceMethod2(): string { return "test"; }
  public static staticMethod1(): void {}
  public static staticMethod2(): int { return 0; }
}

class TestClass051 {
  public method1(): void {}
  public method2(): string { return "test"; }
}

class MixedClass052 {
  public field1: string = 'test';
  public field2: int = 0;
  public method1(): void {}
  public method2(): string { return "test"; }
}

class InvokeTestClass053 {
  public greet(name: string): string {
    return "Hello, " + name;
  }
}

class TraverseClass054 {
  public method1(): void {}
  public method2(): string { return "test"; }
  public method3(param: int): boolean { return true; }
}

class FilterClass055 {
  public async asyncMethod(): Promise<void> {}
  public normalMethod(): void {}
  public final finalMethod(): void {}
}

class SerializableClass056 {
  public testMethod(param1: int, param2: string): boolean {
    return true;
  }
}

class LargeClass057 {
  public m001(): void {}
  public m002(): void {}
  public m003(): void {}
  public m004(): void {}
  public m005(): void {}
  public m100(): void {}
}

class TestClass058 {
  public method(): void {}
}

class CompatClass061 {
  public legacyMethod(): string {
    return "legacy";
  }
  public newMethod(): string {
    return "new";
  }
}

class ChildClass063 extends ParentClass063 implements Interface1063, Interface2063 {
  public method1(): void {}
  public method2(): void {}
  public childMethod(): void {}
  private privateMethod(): void {}
}

class ParentClass063 {
  public parentMethod(): void {}
}

interface Interface2063 {
  method2(): void;
}

interface Interface1063 {
  method1(): void;
}

class GenericClass064<T> extends BaseClass064 {
  public genericMethod(param: T): T {
    return param;
  }
  public ownMethod(): void {}
}

class BaseClass064 {
  public baseMethod(): void {}
}

class CompleteClass065 {
  public publicField: string = 'test';
  private privateField: int = 0;

  public static publicStaticField: boolean = true;
  private static privateStaticField: int = 0;

  public publicInstanceMethod(): void {}
  private privateInstanceMethod(): void {}
  protected protectedInstanceMethod(): void {}

  public static publicStaticMethod(): void {}
  private static privateStaticMethod(): void {}

  private _property: string = '';
  public get property(): string { return this._property; }
  public set property(value: string) { this._property = value; }

  public constructor() {}
  public constructor(param: string) {}
}

class MyClass066 extends ParentClass066 implements MyInterface066 {
  public test(): string {
    return "test";
  }
  public test(msg: string): string {
    return msg;
  }
  private privateMethod(msg: string): string {
    return msg;
  }
  public sayHi(): string {
    return "sayHi";
  }
}

interface MyInterface066 {
  sayHi(): string;
}

class ParentClass066 {
  public sayHello(): string {
    return "sayHello";
  }
}

export default function ClassGetInstanceMethodsTest(): void {
  describe('ClassGetInstanceMethodsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0100
     * @tc.name testClassGetInstanceMethods001
     * @tc.desc Verify ClassGetInstanceMethods case 001: Class.from<CompatClass061>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CompatClass061>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0200
     * @tc.name testClassGetInstanceMethods002
     * @tc.desc Verify ClassGetInstanceMethods case 002: Class.from<ExternalClass>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExternalClass>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(1);
      expect(methods[0].getName()).assertEqual("extMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0300
     * @tc.name testClassGetInstanceMethods003
     * @tc.desc Verify ClassGetInstanceMethods case 003: Class.from<ChildClass063>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass063>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(3);

      let methodNames = new Array<string>();
      for (let i = 0; i < methods.length; i++) {
        methodNames.push(methods[i].getName());
      }

      expect(strArrayContains(methodNames, "method1")).assertTrue();
      expect(strArrayContains(methodNames, "method2")).assertTrue();
      expect(strArrayContains(methodNames, "childMethod")).assertTrue();
      expect(strArrayContains(methodNames, "parentMethod")).assertFalse();
      expect(strArrayContains(methodNames, "privateMethod")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0400
     * @tc.name testClassGetInstanceMethods004
     * @tc.desc Verify ClassGetInstanceMethods case 004: Class.from<GenericClass064<int>>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass064<int>>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0500
     * @tc.name testClassGetInstanceMethods005
     * @tc.desc Verify ClassGetInstanceMethods case 005: Class.from<CompleteClass065>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CompleteClass065>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0600
     * @tc.name testClassGetInstanceMethods006
     * @tc.desc Verify ClassGetInstanceMethods case 006: Class.from<MyClass066>(), getSuper returns expected parent Class, getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass066>();
      let methods = cls.getInstanceMethods();

      expect(methods.length).assertEqual(3);

      let methodNames = new Array<string>();
      for (let i = 0; i < methods.length; i++) {
        methodNames.push(methods[i].getName());
      }

      let testCount = 0;
      for (let i = 0; i < methodNames.length; i++) {
        if (methodNames[i] === "test") {
          testCount++;
        }
      }
      expect(testCount).assertEqual(2);

      expect(strArrayContains(methodNames, "sayHi")).assertTrue();

      methods = cls.getSuper()!.getInstanceMethods();
      expect(methods.length).assertEqual(1);
      let parentMethod = findInstanceMethodByName(methods, "sayHello");
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.getName()).assertEqual("sayHello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0700
     * @tc.name testClassGetInstanceMethods007
     * @tc.desc Verify ClassGetInstanceMethods case 007: Class.from<Object>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceMethods007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Object>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertLarger(0);
      expect(methods[0].getName().length).assertLarger(0);
    });

  });
}

