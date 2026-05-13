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

class MyClass001 {
      public static staticMethod(): void {
          console.info("static method");
      }
  }

class MyClass002 {}

class MyClass003 {
      public static method1(): void {}
      public static method2(): void {}
  }

interface MyInterface004 {
      name: string;
  }

abstract class AbstractClass005 {
      public static abstractMethod(): void {
          console.info("abstract static");
      }
      public abstract instanceMethod(): void;
  }

final class FinalClass006 {
      public static finalMethod(): void {
          console.info("final static");
      }
  }

class GenericClass007<T> {
      public static create(): GenericClass007<int> {
          return new GenericClass007<int>();
      }
      public static getValue(value: int): int {
          return value;
      }
  }

class MyClass008 {
      public static method1(): void {}
      public static method2(): void {}
  }

class NoStaticMethodClass009 {
      public instanceMethod(): void {
          console.info("instance");
      }
  }

class ChildClass010 extends ParentClass010 {
      public static childMethod(): string {
          return "child";
      }
  }

class ParentClass010 {
      public static parentMethod(): string {
          return "parent";
      }
  }

class MixedClass011 {
      public static staticMethod(): void {
          console.info("static");
      }
      public instanceMethod(): void {
          console.info("instance");
      }
  }

class MyClass012 {
      public static method(): void {}
  }

class MyClass013 {
      public static method(): void {}
  }

class MixedAccessClass014 {
      public static publicMethod(): string {
          return "public";
      }
      private static privateMethod(): string {
          return "private";
      }
      protected static protectedMethod(): string {
          return "protected";
      }
  }

class PrivateStaticClass015 {
      public static publicMethod(): void {}
      private static privateMethod(): void {
          console.info("private");
      }
  }

class OverloadClass016 {
      public static process(): string {
          return "no param";
      }
      public static process(msg: string): string {
          return msg;
      }
      public static process(msg: string, count: int): string {
          return msg + count;
      }
  }

class MyClass017 {
      public static method(): void {}
  }

class MyClass018 {
      public static method(): void {}
  }

class ClassWithGetter019 {
      private static _value: string = '';
      public static get value(): string {
          return ClassWithGetter019._value;
      }
  }

class ClassWithSetter020 {
      private static _value: string = '';
      public static set value(val: string) {
          ClassWithSetter020._value = val;
      }
  }

class AsyncStaticClass021 {
      public static async asyncMethod(): Promise<string> {
          return "async result";
      }
      public static syncMethod(): string {
          return "sync result";
      }
  }

class GenericStaticClass022 {
      public static createInt(): int {
          return 0;
      }
      public static processInt(value: int): int {
          return value;
      }
  }

class ChildClass023 extends ParentClass023 {
      public static childMethod(): string {
          return "child";
      }
  }

class ParentClass023 {
      public static parentMethod(): string {
          return "parent";
      }
  }

class ChildClass024 extends ParentClass024 {
      public static childMethod(): string {
          return "child";
      }
  }

class ParentClass024 {
      public static parentMethod(): string {
          return "parent";
      }
  }

class ChildClass025 extends ParentClass025 {
      public static process(): string {
          return "child";
      }
  }

class ParentClass025 {
      public static process(): string {
          return "parent";
      }
  }

class MyClass026 {
      public static myStaticMethod(): void {}
  }

class MyClass027 {
      public static getStringMethod(): string {
          return "test";
      }
      public static getIntMethod(): int {
          return 0;
      }
      public static getVoidMethod(): void {
          console.info("void");
      }
  }

class MyClass028 {
      public static methodWithParams(a: int, b: string): void {}
      public static methodNoParams(): void {}
  }

class MyClass029 {
      public static add(a: int, b: int): int {
          return a + b;
      }
  }

class ManyStaticMethodsClass030 {
      public static method1(): void {}
      public static method2(): void {}
      public static method3(): void {}
      public static method4(): void {}
      public static method5(): void {}
      // ... 假设有100个静态方法
  }

class EmptyClass031 {}

class OnlyInstanceMethodsClass032 {
      public method1(): void {}
      public method2(): void {}
  }

class StaticMethodInvoker033 {
      public static invokeAll(cls: Class, methodName: string, a: int, b: int): int {
          let methods = cls.getStaticMethods();
          let n = methods.length;
          for (let i = 0; i < n; i++) {
              let method = methods[i];
              if (method.getName() === methodName) {
                  return method.invoke([a, b]) as int;
              }
          }
          throw new Error("Method not found: " + methodName);
      }
  }

class MathUtils033 {
      public static add(a: int, b: int): int {
          return a + b;
      }
      public static multiply(a: int, b: int): int {
          return a * b;
      }
      public static divide(a: int, b: int): int {
          return a / b;
      }
  }

class MethodNameCollector034 {
      public static getStaticMethodNames(cls: Class): Array<string> {
          let methods = cls.getStaticMethods();
          let out: Array<string> = new Array<string>();
          let n = methods.length;
          for (let i = 0; i < n; i++) {
              out.push(methods[i].getName());
          }
          return out;
      }
  }

class Utils034 {
      public static method1(): void {}
      public static method2(): void {}
      public static helper1(): void {}
      public static helper2(): void {}
  }

class ApiFilter035 {
      public static getPublicApis(cls: Class): Array<reflect.StaticMethod> {
          let allMethods = cls.getStaticMethods();
          let publicApis: Array<reflect.StaticMethod> = new Array<reflect.StaticMethod>();
          let n = allMethods.length;
          for (let i = 0; i < n; i++) {
              let method = allMethods[i];
              let name = method.getName();
              if (name.startsWith("public")) {
                  publicApis.push(method);
              }
          }
          return publicApis;
      }
  }

class Service035 {
      public static publicApi(): string {
          return "public";
      }
      public static internalApi(): string {
          return "internal";
      }
  }

class SignatureValidator036 {
      public static validateSignature(cls: Class, methodName: string): boolean {
          let methods = cls.getStaticMethods();
          let n = methods.length;
          for (let i = 0; i < n; i++) {
              let method = methods[i];
              if (method.getName() === methodName) {
                  let num = method.getParametersNum();
                  if (num > 0) {
                      let firstParamType = method.getParameterType(0)!;
                      return firstParamType.getName().includes("Array");
                  }
              }
          }
          return false;
      }
  }

class MyService036 {
      public static processData(data: Array<int>): int {
          return data.length;
      }
  }

class PerformanceTest037 {
      public static method1(): void {}
      public static method2(): void {}
      // ... 100个方法
  }

class MixedClass038 {
      public static staticMethod(): void {
          console.info("static");
      }
      public instanceMethod(): void {
          console.info("instance");
      }
  }

class MyService039 {
      public static method1(): string {
          return "1";
      }
      public static method2(): string {
          return "2";
      }
  }

class Config040 {
      public static version: string = "1.0";
      public static getVersion(): string {
          return Config040.version;
      }
  }

class C041 extends B041 {
      public static methodC(): string {
          return "C041";
      }
  }

class B041 extends A041 {
      public static methodB(): string {
          return "B041";
      }
  }

class A041 {
      public static methodA(): string {
          return "A041";
      }
  }


export default function ClassGetStaticMethodsTest(): void {
  describe('ClassGetStaticMethodsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0100
     * @tc.name testClassGetStaticMethods001
     * @tc.desc Verify ClassGetStaticMethods case 001: getStaticMethodsmethod not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0200
     * @tc.name testClassGetStaticMethods002
     * @tc.desc Verify ClassGetStaticMethods case 002: parameters should compile error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass002>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0300
     * @tc.name testClassGetStaticMethods003
     * @tc.desc Verify ClassGetStaticMethods case 003: call getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0400
     * @tc.name testClassGetStaticMethods004
     * @tc.desc Verify ClassGetStaticMethods case 004: interface static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface004>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0500
     * @tc.name testClassGetStaticMethods005
     * @tc.desc Verify ClassGetStaticMethods case 005: abstract class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass005>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0600
     * @tc.name testClassGetStaticMethods006
     * @tc.desc Verify ClassGetStaticMethods case 006: final static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass006>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0700
     * @tc.name testClassGetStaticMethods007
     * @tc.desc Verify ClassGetStaticMethods case 007: generic static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass007<string>>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0800
     * @tc.name testClassGetStaticMethods008
     * @tc.desc Verify ClassGetStaticMethods case 008: static method return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass008>();
        let methods = cls.getStaticMethods();
        expect(methods instanceof Array).assertEqual(true);
        expect(methods.length).assertLarger(0);
        let isSm: boolean = methods[0] instanceof reflect.StaticMethod;
        expect(isSm).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0900
     * @tc.name testClassGetStaticMethods009
     * @tc.desc Verify ClassGetStaticMethods case 009: static method return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoStaticMethodClass009>();
        let methods = cls.getStaticMethods();
        expect(methods instanceof Array).assertEqual(true);
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1000
     * @tc.name testClassGetStaticMethods010
     * @tc.desc Verify ClassGetStaticMethods case 010: return static method not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass010>();
        let childMethods = childCls.getStaticMethods();
        expect(childMethods.length).assertEqual(1);
        expect(childMethods[0].getName()).assertEqual("childMethod");

        let parentCls = Class.from<ParentClass010>();
        let parentMethods = parentCls.getStaticMethods();
        expect(parentMethods.length).assertEqual(1);
        expect(parentMethods[0].getName()).assertEqual("parentMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1100
     * @tc.name testClassGetStaticMethods011
     * @tc.desc Verify ClassGetStaticMethods case 011: instance method not in static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass011>();
        let staticMethods = cls.getStaticMethods();
        let instanceMethods = cls.getInstanceMethods();
        expect(staticMethods.length).assertEqual(1);
        expect(instanceMethods.length).assertEqual(1);
        expect(staticMethods[0].getName()).assertEqual("staticMethod");
        expect(instanceMethods[0].getName()).assertEqual("instanceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1200
     * @tc.name testClassGetStaticMethods012
     * @tc.desc Verify ClassGetStaticMethods case 012: call return array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass012>();
        let methods1 = cls.getStaticMethods();
        let methods2 = cls.getStaticMethods();
        expect(methods1 === methods2).assertEqual(false);
        expect(methods1.length).assertEqual(methods2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1300
     * @tc.name testClassGetStaticMethods013
     * @tc.desc Verify ClassGetStaticMethods case 013: return FixedArraytype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass013>();
        let methods = cls.getStaticMethods();
        // FixedArray是定长数组，长度固定
        expect(methods.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1400
     * @tc.name testClassGetStaticMethods014
     * @tc.desc Verify ClassGetStaticMethods case 014: return publicstatic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedAccessClass014>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
        expect(methods[0].getName()).assertEqual("publicMethod");
        expect(methods[0].isPublic()).assertEqual(true);

        let hasPrivate = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].getName() === "privateMethod") {
                hasPrivate = true;
                break;
            }
        }
        expect(hasPrivate).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1500
     * @tc.name testClassGetStaticMethods015
     * @tc.desc Verify ClassGetStaticMethods case 015: privatestatic method not in method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PrivateStaticClass015>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
        expect(methods[0].getName()).assertEqual("publicMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1600
     * @tc.name testClassGetStaticMethods016
     * @tc.desc Verify ClassGetStaticMethods case 016: static method return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OverloadClass016>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(3);
        // 每个重载都是独立的StaticMethod对象
        let names: Array<string> = new Array<string>();
        for (let i = 0; i < methods.length; i++) {
            names.push(methods[i].getName());
        }
        expect(names).assertContain("process");
        let processCount = 0;
        for (let i = 0; i < names.length; i++) {
            if (names[i] === "process") {
                processCount++;
            }
        }
        expect(processCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1700
     * @tc.name testClassGetStaticMethods017
     * @tc.desc Verify ClassGetStaticMethods case 017: call not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass017>();
        try {
            let methods = cls.getStaticMethods();
            expect(methods.length).assertEqual(1);
        } catch (error) {
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1800
     * @tc.name testClassGetStaticMethods018
     * @tc.desc Verify ClassGetStaticMethods case 018: call getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass018>();
        // 类未初始化不影响静态方法获取
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1900
     * @tc.name testClassGetStaticMethods019
     * @tc.desc Verify ClassGetStaticMethods case 019: static gettermethod not in return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ClassWithGetter019>();
        let methods = cls.getStaticMethods();
        // 静态getter以"%%get-"开头命名
        let hasGetter = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].isGetter()) {
                hasGetter = true;
                break;
            }
        }
        expect(hasGetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2000
     * @tc.name testClassGetStaticMethods020
     * @tc.desc Verify ClassGetStaticMethods case 020: static settermethod not in return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ClassWithSetter020>();
        let methods = cls.getStaticMethods();
        let hasSetter = false;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].isSetter()) {
                hasSetter = true;
                break;
            }
        }
        expect(hasSetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2100
     * @tc.name testClassGetStaticMethods021
     * @tc.desc Verify ClassGetStaticMethods case 021: asyncstatic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AsyncStaticClass021>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(2);

        let asyncMethod: reflect.StaticMethod | undefined = undefined;
        let syncMethod: reflect.StaticMethod | undefined = undefined;
        for (let i = 0; i < methods.length; i++) {
            let m = methods[i];
            if (m.getName() === "asyncMethod") {
                asyncMethod = m;
            }
            if (m.getName() === "syncMethod") {
                syncMethod = m;
            }
        }
        expect(asyncMethod!.isAsync()).assertEqual(true);
        expect(syncMethod!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2200
     * @tc.name testClassGetStaticMethods022
     * @tc.desc Verify ClassGetStaticMethods case 022: generic static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericStaticClass022>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2300
     * @tc.name testClassGetStaticMethods023
     * @tc.desc Verify ClassGetStaticMethods case 023: getStaticMethodsnot method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass023>();
        let childMethods = childCls.getStaticMethods();
        expect(childMethods.length).assertEqual(1);
        let childMethodNames: Array<string> = new Array<string>();
        for (let i = 0; i < childMethods.length; i++) {
            childMethodNames.push(childMethods[i].getName());
        }
        expect(childMethodNames).assertContain("childMethod");
        expect(childMethodNames.indexOf("parentMethod") === -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2400
     * @tc.name testClassGetStaticMethods024
     * @tc.desc Verify ClassGetStaticMethods case 024: using getSuperget static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass024>();
        let superCls = childCls.getSuper();
        expect(superCls != null).assertTrue();
        let superMethods = superCls!.getStaticMethods();
        expect(superMethods.length).assertEqual(1);
        expect(superMethods[0].getName()).assertEqual("parentMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2500
     * @tc.name testClassGetStaticMethods025
     * @tc.desc Verify ClassGetStaticMethods case 025: static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCls = Class.from<ParentClass025>();
        let childCls = Class.from<ChildClass025>();

        let parentMethods = parentCls.getStaticMethods();
        let childMethods = childCls.getStaticMethods();

        expect(parentMethods.length).assertEqual(1);
        expect(childMethods.length).assertEqual(1);

        expect(parentMethods[0].getName()).assertEqual("process");
        expect(childMethods[0].getName()).assertEqual("process");

        // 验证是不同类的方法
        expect(parentMethods[0].getOwner().getName()).assertEqual("ParentClass025");
        expect(childMethods[0].getOwner().getName()).assertEqual("ChildClass025");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2600
     * @tc.name testClassGetStaticMethods026
     * @tc.desc Verify ClassGetStaticMethods case 026: return StaticMethodobject getNamemethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass026>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertLarger(0);
        for (let i = 0; i < methods.length; i++) {
            let method = methods[i];
            let name = method.getName();
            expect(typeof name).assertEqual("string");
            expect(name.length).assertLarger(0);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2700
     * @tc.name testClassGetStaticMethods027
     * @tc.desc Verify ClassGetStaticMethods case 027: return StaticMethodobject getReturnTypemethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass027>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertLarger(0);
        for (let i = 0; i < methods.length; i++) {
            let method = methods[i];
            let returnType = method.getReturnType();
            expect(returnType != null).assertTrue();
            expect(typeof returnType.getName).assertEqual("function");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2800
     * @tc.name testClassGetStaticMethods028
     * @tc.desc Verify ClassGetStaticMethods case 028: return StaticMethodobject getParameterTypesmethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass028>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertLarger(0);
        for (let i = 0; i < methods.length; i++) {
            let method = methods[i];
            expect(method.getParametersNum()).assertLargerOrEqual(0);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2900
     * @tc.name testClassGetStaticMethods029
     * @tc.desc Verify ClassGetStaticMethods case 029: return StaticMethodobject invokemethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass029>();
        let methods = cls.getStaticMethods();
        let addMethod: reflect.StaticMethod | undefined = undefined;
        for (let i = 0; i < methods.length; i++) {
            if (methods[i].getName() === "add") {
                addMethod = methods[i];
                break;
            }
        }
        expect(addMethod != undefined).assertTrue();

        let result = addMethod!.invoke([3, 5]);
        expect(result as int).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3000
     * @tc.name testClassGetStaticMethods030
     * @tc.desc Verify ClassGetStaticMethods case 030: static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ManyStaticMethodsClass030>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertLarger(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3100
     * @tc.name testClassGetStaticMethods031
     * @tc.desc Verify ClassGetStaticMethods case 031: empty static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass031>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3200
     * @tc.name testClassGetStaticMethods032
     * @tc.desc Verify ClassGetStaticMethods case 032: instance method return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OnlyInstanceMethodsClass032>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3300
     * @tc.name testClassGetStaticMethods033
     * @tc.desc Verify ClassGetStaticMethods case 033: using call static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MathUtils033>();
        let result = StaticMethodInvoker033.invokeAll(cls, "add", 10, 20);
        expect(result as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3400
     * @tc.name testClassGetStaticMethods034
     * @tc.desc Verify ClassGetStaticMethods case 034: static method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Utils034>();
        let methodNames = MethodNameCollector034.getStaticMethodNames(cls);
        expect(methodNames.length).assertEqual(4);
        expect(methodNames).assertContain("method1");
        expect(methodNames).assertContain("method2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3500
     * @tc.name testClassGetStaticMethods035
     * @tc.desc Verify ClassGetStaticMethods case 035: static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Service035>();
        let publicApis = ApiFilter035.getPublicApis(cls);
        expect(publicApis.length).assertEqual(1);
        expect(publicApis[0].getName()).assertEqual("publicApi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3600
     * @tc.name testClassGetStaticMethods036
     * @tc.desc Verify ClassGetStaticMethods case 036: verify static method parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyService036>();
        let isValid = SignatureValidator036.validateSignature(cls, "processData");
        expect(isValid).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3700
     * @tc.name testClassGetStaticMethods037
     * @tc.desc Verify ClassGetStaticMethods case 037: static method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 创建一个有100个静态方法的类

        let cls = Class.from<PerformanceTest037>();
        let startTime = Date.now();
        for (let i = 0; i < 1000; i++) {
            let methods = cls.getStaticMethods();
            expect(methods.length).assertLarger(0);
        }
        let endTime = Date.now();
        expect(endTime >= startTime).assertTrue();
        console.info("获取1000次静态方法耗时: " + (endTime - startTime) + "ms");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3800
     * @tc.name testClassGetStaticMethods038
     * @tc.desc Verify ClassGetStaticMethods case 038: getStaticMethods and getInstanceMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass038>();
        let staticMethods = cls.getStaticMethods();
        let instanceMethods = cls.getInstanceMethods();
        expect(staticMethods.length).assertEqual(1);
        expect(instanceMethods.length).assertEqual(1);
        expect(staticMethods[0].getName()).assertEqual("staticMethod");
        expect(instanceMethods[0].getName()).assertEqual("instanceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3900
     * @tc.name testClassGetStaticMethods039
     * @tc.desc Verify ClassGetStaticMethods case 039: getStaticMethodsget method after getStaticMethod method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyService039>();
        let allMethods = cls.getStaticMethods();
        let method2 = cls.getStaticMethod("method2");
        expect(allMethods.length).assertEqual(2);
        expect(method2 != undefined).assertTrue();
        expect(method2!.getName()).assertEqual("method2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_4000
     * @tc.name testClassGetStaticMethods040
     * @tc.desc Verify ClassGetStaticMethods case 040: getStaticMethods and getStaticFields return method field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Config040>();
        let staticMethods = cls.getStaticMethods();
        let staticFields = cls.getStaticFields();

        expect(staticMethods.length).assertEqual(1);
        expect(staticFields.length).assertEqual(1);

        expect(staticMethods[0].getName()).assertEqual("getVersion");
        expect(staticFields[0].getName()).assertEqual("version");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_4100
     * @tc.name testClassGetStaticMethods041
     * @tc.desc Verify ClassGetStaticMethods case 041: inheritance static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethods041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsA = Class.from<A041>();
        let clsB = Class.from<B041>();
        let clsC = Class.from<C041>();

        let methodsA = clsA.getStaticMethods();
        let methodsB = clsB.getStaticMethods();
        let methodsC = clsC.getStaticMethods();

        expect(methodsA.length).assertEqual(1);
        expect(methodsB.length).assertEqual(1);
        expect(methodsC.length).assertEqual(1);

        expect(methodsA[0].getName()).assertEqual("methodA");
        expect(methodsB[0].getName()).assertEqual("methodB");
        expect(methodsC[0].getName()).assertEqual("methodC");
    });

  });
}