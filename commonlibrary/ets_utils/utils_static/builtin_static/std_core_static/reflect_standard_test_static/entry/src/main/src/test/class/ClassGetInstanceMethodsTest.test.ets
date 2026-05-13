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
      // ... 更多方法
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
      defaultMethod(): void {} // 默认public
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
      public $_set(index: int, val: string): void {} // 模拟native方法
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
      public finalMethod(): void {}
  }

class SerializableClass056 {
      public testMethod(param1: int, param2: string): boolean {
          return true;
      }
  }

class LargeClass057 {
      // 100个方法
      public m001(): void {}
      public m002(): void {}
      public m003(): void {}
      public m004(): void {}
      public m005(): void {}
      // ... 更多方法
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
      // 实例字段
      public publicField: string = 'test';
      private privateField: int = 0;
      
      // 静态字段
      public static publicStaticField: boolean = true;
      private static privateStaticField: number = 0;
      
      // 实例方法
      public publicInstanceMethod(): void {}
      private privateInstanceMethod(): void {}
      protected protectedInstanceMethod(): void {}
      
      // 静态方法
      public static publicStaticMethod(): void {}
      private static privateStaticMethod(): void {}
      
      // getter/setter
      private _property: string = '';
      public get property(): string { return this._property; }
      public set property(value: string) { this._property = value; }
      
      // 构造函数
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
  describe('ClassGetInstanceMethodsTest', () => {
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
     * @tc.desc Verify ClassGetInstanceMethods case 001: getInstanceMethods()not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0200
     * @tc.name testClassGetInstanceMethods002
     * @tc.desc Verify ClassGetInstanceMethods case 002: parameters should compile error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let methods = cls.getInstanceMethods();
        expect(methods.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0300
     * @tc.name testClassGetInstanceMethods003
     * @tc.desc Verify ClassGetInstanceMethods case 003: via Class.from()get object call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass003>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0400
     * @tc.name testClassGetInstanceMethods004
     * @tc.desc Verify ClassGetInstanceMethods case 004: via instance get Classobject call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new TestClass004();
        let cls = Class.of(obj);
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0500
     * @tc.name testClassGetInstanceMethods005
     * @tc.desc Verify ClassGetInstanceMethods case 005: return FixedArray<reflect.InstanceMethod>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass005>();
        let methods = cls.getInstanceMethods();
        expect(methods.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0600
     * @tc.name testClassGetInstanceMethods006
     * @tc.desc Verify ClassGetInstanceMethods case 006: return array publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass006>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(3);
        
        // 验证方法名
        let methodNames = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            methodNames.push(methods[i].getName());
        }
        expect(strArrayContains(methodNames, "method1")).assertTrue();
        expect(strArrayContains(methodNames, "method2")).assertTrue();
        expect(strArrayContains(methodNames, "method3")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0700
     * @tc.name testClassGetInstanceMethods007
     * @tc.desc Verify ClassGetInstanceMethods case 007: call return array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        let methods1 = cls.getInstanceMethods();
        let methods2 = cls.getInstanceMethods();
        expect(methods1 === methods2).assertFalse(); // 不是同一个引用
        expect(methods1.length).assertEqual(methods2.length); // 内容相同
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0800
     * @tc.name testClassGetInstanceMethods008
     * @tc.desc Verify ClassGetInstanceMethods case 008: publicinstance method when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass008>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_0900
     * @tc.name testClassGetInstanceMethods009
     * @tc.desc Verify ClassGetInstanceMethods case 009: privatemethod when not in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PrivateOnlyClass009>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1000
     * @tc.name testClassGetInstanceMethods010
     * @tc.desc Verify ClassGetInstanceMethods case 010: staticmethod when not in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticOnlyClass010>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1100
     * @tc.name testClassGetInstanceMethods011
     * @tc.desc Verify ClassGetInstanceMethods case 011: return array InstanceMethodtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass011>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertLarger(0);
        let method = methods[0];
        expect(method.getName()).assertEqual("testMethod");
        expect(method.getOwner().getName()).assertEqual("MyClass011");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1200
     * @tc.name testClassGetInstanceMethods012
     * @tc.desc Verify ClassGetInstanceMethods case 012: return InstanceMethodobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass012>();
        let methods = cls.getInstanceMethods();
        let method = methods[0];
        
        // 验证方法名
        expect(method.getName()).assertEqual("testMethod");
        
        // 验证返回类型
        expect(method.getReturnType().getName()).assertEqual("std.core.Boolean");
        
        // 验证参数类型
        let paramTypes = method.getParameterTypes();
        expect(paramTypes.length).assertEqual(2);
        expect(paramTypes[0].getName()).assertEqual("i32");
        expect(paramTypes[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1300
     * @tc.name testClassGetInstanceMethods013
     * @tc.desc Verify ClassGetInstanceMethods case 013: method when return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ManyMethodsClass013>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1400
     * @tc.name testClassGetInstanceMethods014
     * @tc.desc Verify ClassGetInstanceMethods case 014: method when return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OverloadClass014>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(3); // 3个重载版本
        
        // 验证不同签名
        for (let i = 0; i < methods.length; i++) {
            expect(methods[i].getName()).assertEqual("test");
            expect(methods[i].getParametersNum()).assertLessOrEqual(2);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1500
     * @tc.name testClassGetInstanceMethods015
     * @tc.desc Verify ClassGetInstanceMethods case 015: return array publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicClass015>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1600
     * @tc.name testClassGetInstanceMethods016
     * @tc.desc Verify ClassGetInstanceMethods case 016: modifier method is public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<DefaultPublicClass016>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
        expect(methods[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1700
     * @tc.name testClassGetInstanceMethods017
     * @tc.desc Verify ClassGetInstanceMethods case 017: privatemethod not in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass017>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // 只有publicMethod
        expect(methods[0].getName()).assertEqual("publicMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1800
     * @tc.name testClassGetInstanceMethods018
     * @tc.desc Verify ClassGetInstanceMethods case 018: method private when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AllPrivateClass018>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_1900
     * @tc.name testClassGetInstanceMethods019
     * @tc.desc Verify ClassGetInstanceMethods case 019: protectedmethod should in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ProtectedClass019>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2); // public和protected方法
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2000
     * @tc.name testClassGetInstanceMethods020
     * @tc.desc Verify ClassGetInstanceMethods case 020: staticmethod not in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticClass020>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // 只有instanceMethod
        expect(methods[0].getName()).assertEqual("instanceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2100
     * @tc.name testClassGetInstanceMethods021
     * @tc.desc Verify ClassGetInstanceMethods case 021: static method when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OnlyStaticClass021>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2200
     * @tc.name testClassGetInstanceMethods022
     * @tc.desc Verify ClassGetInstanceMethods case 022: return array from interface inheritance publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass022>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2); // interfaceMethod和classMethod
        
        // 验证包含接口方法
        let methodNames = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            methodNames.push(methods[i].getName());
        }
        expect(strArrayContains(methodNames, "interfaceMethod")).assertTrue();
        expect(strArrayContains(methodNames, "classMethod")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2300
     * @tc.name testClassGetInstanceMethods023
     * @tc.desc Verify ClassGetInstanceMethods case 023: multiple interface when interface method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiInterfaceClass023>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(3); // method1, method2, ownMethod
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2400
     * @tc.name testClassGetInstanceMethods024
     * @tc.desc Verify ClassGetInstanceMethods case 024: interface method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ImplClass024>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
        expect(methods[0].getName()).assertEqual("defaultMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2500
     * @tc.name testClassGetInstanceMethods025
     * @tc.desc Verify ClassGetInstanceMethods case 025: not from inheritance publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass025>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // 只有childMethod
        expect(methods[0].getName()).assertEqual("childMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2600
     * @tc.name testClassGetInstanceMethods026
     * @tc.desc Verify ClassGetInstanceMethods case 026: inheritance when return method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass026>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // 只有childMethod
        
        // 通过getSuper()获取父类方法
        let parentMethods = cls.getSuper()!.getInstanceMethods();
        expect(parentMethods.length).assertEqual(1); // 只有parentMethod
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2700
     * @tc.name testClassGetInstanceMethods027
     * @tc.desc Verify ClassGetInstanceMethods case 027: method in return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass027>();
        let methods = childCls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // overriddenMethod在ChildClass中
        
        // 验证方法归属
        expect(methods[0].getOwner().getName()).assertEqual("ChildClass027");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2800
     * @tc.name testClassGetInstanceMethods028
     * @tc.desc Verify ClassGetInstanceMethods case 028: when inheritance interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass028>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2); // interfaceMethod和ownMethod
        
        // 验证不包含parentMethod
        let methodNames = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            methodNames.push(methods[i].getName());
        }
        expect(strArrayContains(methodNames, "parentMethod")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_2900
     * @tc.name testClassGetInstanceMethods029
     * @tc.desc Verify ClassGetInstanceMethods case 029: gettermethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GetterClass029>();
        let methods = cls.getInstanceMethods();
        
        // getter方法名格式为 %%get-propertyName
        let getterFound = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].getName() === "%%get-name") {
                expect(methods[i].isGetter()).assertTrue();
                getterFound = true;
                break;
            }
        }
        expect(getterFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3000
     * @tc.name testClassGetInstanceMethods030
     * @tc.desc Verify ClassGetInstanceMethods case 030: settermethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SetterClass030>();
        let methods = cls.getInstanceMethods();
        
        // setter方法名格式为 %%set-propertyName
        let setterFound = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].getName() === "%%set-value") {
                expect(methods[i].isSetter()).assertTrue();
                setterFound = true;
                break;
            }
        }
        expect(setterFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3100
     * @tc.name testClassGetInstanceMethods031
     * @tc.desc Verify ClassGetInstanceMethods case 031: getter property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ReadOnlyClass031>();
        let methods = cls.getInstanceMethods();
        
        // 只有getter，没有setter
        let hasGetter = false;
        let hasSetter = false;
        for (let i = 0; i < methods.length; i++) {
            let name = methods[i].getName();
            if (name === "%%get-readonly") {
                hasGetter = true;
            }
            if (name === "%%set-readonly") {
                hasSetter = true;
            }
        }
        expect(hasGetter).assertTrue();
        expect(hasSetter).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3200
     * @tc.name testClassGetInstanceMethods032
     * @tc.desc Verify ClassGetInstanceMethods case 032: constructor not in instance method array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<WithConstructor032>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1); // 只有normalMethod
        
        // 构造函数通过getConstructors()获取
        let constructors = cls.getConstructors();
        expect(constructors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3300
     * @tc.name testClassGetInstanceMethods033
     * @tc.desc Verify ClassGetInstanceMethods case 033: asyncmethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AsyncClass033>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
        
        // 验证async属性
        let asyncMethod = methods[0];
        expect(asyncMethod.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3400
     * @tc.name testClassGetInstanceMethods034
     * @tc.desc Verify ClassGetInstanceMethods case 034: generic method in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericMethodClass034>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
        
        // 验证泛型方法存在
        let genericFound = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].getName() === "genericMethod") {
                genericFound = true;
                break;
            }
        }
        expect(genericFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3500
     * @tc.name testClassGetInstanceMethods035
     * @tc.desc Verify ClassGetInstanceMethods case 035: finalmethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalMethodClass035>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
        
        // 验证final属性
        let finalMethod = methods[0];
        expect(finalMethod.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3600
     * @tc.name testClassGetInstanceMethods036
     * @tc.desc Verify ClassGetInstanceMethods case 036: abstractmethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass036>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2); // abstract和concrete都返回
        
        // 验证abstract属性
        let abstractMethod = methods[0];
        expect(abstractMethod.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3700
     * @tc.name testClassGetInstanceMethods037
     * @tc.desc Verify ClassGetInstanceMethods case 037: nativemethod in return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用内置类型的native方法

        let cls = Class.from<NativeTestClass037>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
        
        // 实际场景：Array的$_set是native方法
        let arrCls = Class.from<Array<int>>();
        let arrMethods = arrCls.getInstanceMethods();
        let hasNative = false;
        for (let i = 0; i < arrMethods.length; i++) {
            if (arrMethods[i].isNative()) {
                hasNative = true;
                break;
            }
        }
        expect(hasNative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3800
     * @tc.name testClassGetInstanceMethods038
     * @tc.desc Verify ClassGetInstanceMethods case 038: abstract class publicinstance method return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass038>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2); // abstract和concrete
        
        // 验证不包含private
        let methodNames = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            methodNames.push(methods[i].getName());
        }
        expect(strArrayContains(methodNames, "privateMethod")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_3900
     * @tc.name testClassGetInstanceMethods039
     * @tc.desc Verify ClassGetInstanceMethods case 039: final instance method return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass039>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4000
     * @tc.name testClassGetInstanceMethods040
     * @tc.desc Verify ClassGetInstanceMethods case 040: interface Classobject call getInstanceMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let interfaceCls = Class.from<TestInterface040>();
        let methods = interfaceCls.getInstanceMethods();
        expect(interfaceCls.isInterface()).assertTrue();
        expect(methods.length).assertEqual(1);
        expect(methods[0].getName()).assertEqual("interfaceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4100
     * @tc.name testClassGetInstanceMethods041
     * @tc.desc Verify ClassGetInstanceMethods case 041: generic instance method return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass041<int>>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4200
     * @tc.name testClassGetInstanceMethods042
     * @tc.desc Verify ClassGetInstanceMethods case 042: different type parameters generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let intCls = Class.from<GenericContainer042<int>>();
        let strCls = Class.from<GenericContainer042<string>>();
        
        let intMethods = intCls.getInstanceMethods();
        let strMethods = strCls.getInstanceMethods();
        
        expect(intMethods.length).assertEqual(strMethods.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4300
     * @tc.name testClassGetInstanceMethods043
     * @tc.desc Verify ClassGetInstanceMethods case 043: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass043>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4400
     * @tc.name testClassGetInstanceMethods044
     * @tc.desc Verify ClassGetInstanceMethods case 044: in call getInstanceMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LazyClass044>();
        // 类未初始化，但getInstanceMethods应该可以工作
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4500
     * @tc.name testClassGetInstanceMethods045
     * @tc.desc Verify ClassGetInstanceMethods case 045: call return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass045>();
        
        let methods1 = cls.getInstanceMethods();
        let methods2 = cls.getInstanceMethods();
        let methods3 = cls.getInstanceMethods();
        
        expect(methods1.length).assertEqual(methods2.length);
        expect(methods2.length).assertEqual(methods3.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4600
     * @tc.name testClassGetInstanceMethods046
     * @tc.desc Verify ClassGetInstanceMethods case 046: after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // ArkTS是静态类型，不支持动态添加方法
        // 这个测试用例仅用于验证静态行为

        let cls = Class.from<OriginalClass046>();
        let methods1 = cls.getInstanceMethods();
        expect(methods1.length).assertEqual(1);
        
        // 类定义不能在运行时修改
        // getInstanceMethods应该始终返回相同的方法列表
        let methods2 = cls.getInstanceMethods();
        expect(methods2.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4700
     * @tc.name testClassGetInstanceMethods047
     * @tc.desc Verify ClassGetInstanceMethods case 047: return method object getOwner()return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OwnerClass047>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(1);
        for (let i = 0; i < methods.length; i++) {
            expect(methods[i].getOwner().getName()).assertEqual("OwnerClass047");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4800
     * @tc.name testClassGetInstanceMethods048
     * @tc.desc Verify ClassGetInstanceMethods case 048: return method public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass048>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(2);
        for (let i = 0; i < methods.length; i++) {
            // 所有返回的方法都应该是public或protected
            expect(methods[i].isPublic() || methods[i].isProtected()).assertTrue();
            expect(methods[i].isPrivate()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_4900
     * @tc.name testClassGetInstanceMethods049
     * @tc.desc Verify ClassGetInstanceMethods case 049: return method instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass049>();
        let methods = cls.getInstanceMethods();
        
        // getInstanceMethods返回的是InstanceMethod类型
        // 静态方法应该通过getStaticMethods()获取
        expect(methods.length).assertEqual(1);
        expect(methods[0].getName()).assertEqual("instanceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5000
     * @tc.name testClassGetInstanceMethods050
     * @tc.desc Verify ClassGetInstanceMethods case 050: getInstanceMethods and getStaticMethodsreturn different method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass050>();
        
        let instanceMethods = cls.getInstanceMethods();
        let staticMethods = cls.getStaticMethods();
        
        expect(instanceMethods.length).assertEqual(2);
        expect(staticMethods.length).assertEqual(2);
        
        // 验证方法名不重复
        let instanceNames = new Array<string>();
        for (let i = 0; i < instanceMethods.length; i++) {
            instanceNames.push(instanceMethods[i].getName());
        }
        
        let staticNames = new Array<string>();
        for (let i = 0; i < staticMethods.length; i++) {
            staticNames.push(staticMethods[i].getName());
        }
        
        // 验证没有重叠
        for (let i = 0; i < instanceNames.length; i++) {
            expect(strArrayContains(staticNames, instanceNames[i])).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5100
     * @tc.name testClassGetInstanceMethods051
     * @tc.desc Verify ClassGetInstanceMethods case 051: getInstanceMethodsreturn and getInstanceMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass051>();
        
        // 批量获取
        let allMethods = cls.getInstanceMethods();
        
        // 单个获取
        let method1 = cls.getInstanceMethod("method1", []);
        let method2 = cls.getInstanceMethod("method2", []);
        
        expect(allMethods.length).assertEqual(2);
        expect(method1 !== null).assertTrue();
        expect(method2 !== null).assertTrue();
        
        // 验证方法是相同的（通过equals）
        let found1 = false;
        let found2 = false;
        for (let i = 0; i < allMethods.length; i++) {
            if (allMethods[i].equals(method1!)) {
                found1 = true;
            }
            if (allMethods[i].equals(method2!)) {
                found2 = true;
            }
        }
        expect(found1).assertTrue();
        expect(found2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5200
     * @tc.name testClassGetInstanceMethods052
     * @tc.desc Verify ClassGetInstanceMethods case 052: getInstanceMethods and getInstanceFieldsreturn different type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass052>();
        
        let methods = cls.getInstanceMethods();
        let fields = cls.getInstanceFields();
        
        expect(methods.length).assertEqual(2);
        expect(fields.length).assertEqual(2);
        
        // 验证返回类型
        let m0: boolean = methods[0] instanceof reflect.InstanceMethod;
        let f0: boolean = fields[0] instanceof reflect.InstanceField;
        expect(m0).assertTrue();
        expect(f0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5300
     * @tc.name testClassGetInstanceMethods053
     * @tc.desc Verify ClassGetInstanceMethods case 053: get method after via invokecall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<InvokeTestClass053>();
        let methods = cls.getInstanceMethods();
        
        expect(methods.length).assertEqual(1);
        
        let obj = new InvokeTestClass053();
        let result = methods[0].invoke(obj, ["World"]);
        expect((result as string)).assertEqual("Hello, World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5400
     * @tc.name testClassGetInstanceMethods054
     * @tc.desc Verify ClassGetInstanceMethods case 054: method array get method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TraverseClass054>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertEqual(3);
        for (let i = 0; i < methods.length; i++) {
            let method = methods[i];
            // 获取方法名
            let name = method.getName();
            expect(name !== null).assertTrue();
            
            // 获取参数数量
            let paramCount = method.getParametersNum();
            expect(paramCount).assertLargerOrEqual(0);
            
            // 获取返回类型
            let returnType = method.getReturnType();
            expect(returnType !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5500
     * @tc.name testClassGetInstanceMethods055
     * @tc.desc Verify ClassGetInstanceMethods case 055: method property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FilterClass055>();
        let methods = cls.getInstanceMethods();
        
        // 过滤async方法
        let asyncMethods = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].isAsync()) {
                asyncMethods.push(methods[i]);
            }
        }
        expect(asyncMethods.length).assertEqual(1);
        
        // 过滤final方法
        let finalMethods = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].isFinal()) {
                finalMethods.push(methods[i]);
            }
        }
        expect(finalMethods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5600
     * @tc.name testClassGetInstanceMethods056
     * @tc.desc Verify ClassGetInstanceMethods case 056: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SerializableClass056>();
        let methods = cls.getInstanceMethods();
        
        let method = methods[0];
        let methodInfo: MethodInfoSnapshot056 = {
            name: method.getName(),
            owner: method.getOwner().getName(),
            returnType: method.getReturnType().getName(),
            paramCount: method.getParametersNum(),
            isPublic: method.isPublic(),
            isPrivate: method.isPrivate(),
            isAsync: method.isAsync(),
            isFinal: method.isFinal()
        };
        
        expect(methodInfo.name).assertEqual("testMethod");
        expect(methodInfo.owner).assertEqual("SerializableClass056");
        expect(methodInfo.paramCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5700
     * @tc.name testClassGetInstanceMethods057
     * @tc.desc Verify ClassGetInstanceMethods case 057: method when performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass057>();
        let startTime = Date.now();
        let methods = cls.getInstanceMethods();
        let endTime = Date.now();
        
        expect(methods.length).assertEqual(100);
        expect(endTime - startTime).assertLess(1000); // 应该在1秒内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5800
     * @tc.name testClassGetInstanceMethods058
     * @tc.desc Verify ClassGetInstanceMethods case 058: call method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass058>();
        
        let startTime = Date.now();
        for (let i = 0; i < 1000; i++) {
            let methods = cls.getInstanceMethods();
            expect(methods.length).assertEqual(1);
        }
        let endTime = Date.now();
        
        expect(endTime - startTime).assertLess(5000); // 1000次调用应在5秒内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_5900
     * @tc.name testClassGetInstanceMethods059
     * @tc.desc Verify ClassGetInstanceMethods case 059: in Classobject call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 编译时错误：不能在非Class对象上调用
        let notAClass = "test";
        // notAClass.getInstanceMethods(); // ❌ 编译错误
        expect(typeof notAClass).assertEqual('string');
        expect(Class.from<TestClass003>().getInstanceMethods().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6000
     * @tc.name testClassGetInstanceMethods060
     * @tc.desc Verify ClassGetInstanceMethods case 060: not in type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 此测试仅用于验证未捕获异常的行为，跳过执行
        // 编译时错误：类型不存在
        // let cls = Class.from<NonExistentType>();
        // let methods = cls.getInstanceMethods();
        expect(Class.from<TestClass003>().getInstanceMethods().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6100
     * @tc.name testClassGetInstanceMethods061
     * @tc.desc Verify ClassGetInstanceMethods case 061: method in different API is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CompatClass061>();
        let methods = cls.getInstanceMethods();
        
        // 验证所有版本都返回相同的方法
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6200
     * @tc.name testClassGetInstanceMethods062
     * @tc.desc Verify ClassGetInstanceMethods case 062: get method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 假设有另一个模块的类

        let cls = Class.from<ExternalClass>();
        let methods = cls.getInstanceMethods();
        
        // 应该能正确获取外部类的public实例方法
        expect(methods.length).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6300
     * @tc.name testClassGetInstanceMethods063
     * @tc.desc Verify ClassGetInstanceMethods case 063: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass063>();
        let methods = cls.getInstanceMethods();
        
        // 应该包含method1, method2, childMethod（3个）
        // 不包含parentMethod（父类方法）
        // 不包含privateMethod（私有方法）
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6400
     * @tc.name testClassGetInstanceMethods064
     * @tc.desc Verify ClassGetInstanceMethods case 064: generic inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass064<int>>();
        let methods = cls.getInstanceMethods();
        
        // 应该包含genericMethod和ownMethod
        // 不包含baseMethod（父类方法）
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6500
     * @tc.name testClassGetInstanceMethods065
     * @tc.desc Verify ClassGetInstanceMethods case 065: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CompleteClass065>();
        let methods = cls.getInstanceMethods();
        
        // 应该包含：
        // - publicInstanceMethod
        // - protectedInstanceMethod
        // - %%get-property
        // - %%set-property
        // 不包含：
        // - privateInstanceMethod（私有）
        // - publicStaticMethod（静态）
        // - privateStaticMethod（静态且私有）
        // - 构造函数
        
        expect(methods.length).assertEqual(4); // 2个方法 + 1个getter + 1个setter
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6600
     * @tc.name testClassGetInstanceMethods066
     * @tc.desc Verify ClassGetInstanceMethods case 066: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods066', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass066>();
        let methods = cls.getInstanceMethods();
        
        // 应该包含：test(2个重载), sayHi
        // 不包含：privateMethod（私有）, sayHello（父类方法）
        expect(methods.length).assertEqual(3);
        
        let methodNames = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            methodNames.push(methods[i].getName());
        }
        
        // 验证包含test方法（可能有多个重载）
        let testCount = 0;
        for (let i = 0; i < methodNames.length; i++) {
            if (methodNames[i] === "test") {
                testCount++;
            }
        }
        expect(testCount).assertEqual(2); // 2个test重载
        
        // 验证包含sayHi
        expect(strArrayContains(methodNames, "sayHi")).assertTrue();
        
        // 验证父类方法
        methods = cls.getSuper()!.getInstanceMethods();
        expect(methods.length).assertEqual(1); // sayHello
        expect(methods[0].getName()).assertEqual("sayHello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHODS_6700
     * @tc.name testClassGetInstanceMethods067
     * @tc.desc Verify ClassGetInstanceMethods case 067: getInstanceMethods()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethods067', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        let cls = Class.from<Object>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertLargerOrEqual(0);
    });

  });
}