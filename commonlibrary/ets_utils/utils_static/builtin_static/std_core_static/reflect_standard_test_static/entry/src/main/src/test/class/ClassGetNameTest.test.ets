'use static'
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

class MyClass001 {}

class MyClass002 {}

class MyClass003 {}

class TestClass004 {}

class SampleClass005 {}

class GenericClass006<T> {
      public value?: T;
  }

class DerivedClass007 extends BaseClass007 {}

class BaseClass007 {}

abstract class AbstractClass008 {
      public abstract method(): void;
  }

class FinalClass009 {}

interface MyInterface010 {
      name: string;
  }

class TestClass018 {}

class SameClass019 {}

class TestClass020 {}

class TestClass021 {}

class TestClass022 {}

class A023 {}

class _PrivateClass024 {}

class My类026 {}

class Logger027 {
      public static logClassName(obj: Object): void {
          let clazz = Class.of(obj);
          console.info("Object class: " + clazz.getName());
      }
  }

class UserService027 {
      public getUser(): string {
          return "Alice";
      }
  }

class Validator028 {
      public static isExpectedClass(obj: Object, expectedName: string): boolean {
          let clazz = Class.of(obj);
          return Utils.classNameMatches(clazz.getName(), expectedName);
      }
  }

class MyService028 {}

class ControllerRegistry029 {
      private static controllers: Map<string, Object> = new Map<string, Object>();

      private static toSimpleName(name: string): string {
          let idx = name.lastIndexOf('.');
          if (idx >= 0) {
              return name.substring(idx + 1);
          }
          return name;
      }

      public static register(controller: Object): void {
          let clazz = Class.of(controller);
          let name = ControllerRegistry029.toSimpleName(clazz.getName());
          ControllerRegistry029.controllers.set(name, controller);
      }

      public static get(controllerName: string): Object | undefined {
          return ControllerRegistry029.controllers.get(ControllerRegistry029.toSimpleName(controllerName));
      }
  }

class OrderController029 {}

class ProductController029 {}

class UserController029 {}

class Serializer030 {
      public static serializeClass(clazz: Class): string {
          let name = clazz.getName();
          return '{"class":"' + name + '","type":"Class"}';
      }
  }

class Config030 {
      public host: string = 'localhost';
      public port: int = 8080;
  }

class TestData031 {
      public name: string = 'test';
  }

class DebugHelper031 {
      public static dumpClassInfo(obj: Object): void {
          let clazz = Class.of(obj);
          console.info("=== Class Info ===");
          console.info("Name: " + clazz.getName());
          console.info("Super: " + (clazz.getSuper()?.getName() || "none"));
          console.info("Is Interface: " + clazz.isInterface());
          console.info("Is Abstract: " + clazz.isAbstract());
          console.info("Is Final: " + clazz.isFinal());
      }
  }

class MyClass033 {}

class ChildClass034 extends ParentClass034 {}

class ParentClass034 {}

class MyClass035 implements MyInterface035 {
      public name: string = '';
  }

interface MyInterface035 {
      name: string;
  }

class MyClass036 {}

class MyClass037 {}

class NestedClassForName015 {
      public name: string = '';
  }


export default function ClassGetNameTest(): void {
  describe('ClassGetNameTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0100
     * @tc.name testClassGetName001
     * @tc.desc Verify ClassGetName case 001: getName() with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass001>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "MyClass001")).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0300
     * @tc.name testClassGetName003
     * @tc.desc Verify ClassGetName case 003: get name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass003>();
        let name = clazz.getName();
        expect(typeof name).assertEqual("string");
        expect(Utils.classNameMatches(name, "MyClass003")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0400
     * @tc.name testClassGetName004
     * @tc.desc Verify ClassGetName case 004: via Class.ofget Class object after call getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass004();
        let clazz = Class.of(obj);
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "TestClass004")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0500
     * @tc.name testClassGetName005
     * @tc.desc Verify ClassGetName case 005: via Class.fromget Class object after call getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<SampleClass005>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "SampleClass005")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0600
     * @tc.name testClassGetName006
     * @tc.desc Verify ClassGetName case 006: get generic name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz1 = Class.from<GenericClass006<int>>();
        let name1 = clazz1.getName();
        let clazz2 = Class.from<GenericClass006<string>>();
        let name2 = clazz2.getName();
        expect(name1).assertContain("GenericClass006");
        expect(name2).assertContain("GenericClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0700
     * @tc.name testClassGetName007
     * @tc.desc Verify ClassGetName case 007: get name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<DerivedClass007>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "DerivedClass007")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0800
     * @tc.name testClassGetName008
     * @tc.desc Verify ClassGetName case 008: get abstract class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<AbstractClass008>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "AbstractClass008")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0900
     * @tc.name testClassGetName009
     * @tc.desc Verify ClassGetName case 009: get final name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<FinalClass009>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "FinalClass009")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1000
     * @tc.name testClassGetName010
     * @tc.desc Verify ClassGetName case 010: get interface Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyInterface010>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "MyInterface010")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1100
     * @tc.name testClassGetName011
     * @tc.desc Verify ClassGetName case 011: get type Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolClass = Class.PRIMITIVE_BOOLEAN;
        expect(Utils.reflectScalarTypeNameMatches(boolClass.getName(), "boolean")).assertTrue();

        let intClass = Class.PRIMITIVE_INT;
        expect(Utils.reflectScalarTypeNameMatches(intClass.getName(), "int")).assertTrue();

        let floatClass = Class.PRIMITIVE_FLOAT;
        expect(Utils.reflectScalarTypeNameMatches(floatClass.getName(), "float")).assertTrue();

        let voidClass = Class.PRIMITIVE_VOID;
        expect(Utils.reflectScalarTypeNameMatches(voidClass.getName(), "void")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1200
     * @tc.name testClassGetName012
     * @tc.desc Verify ClassGetName case 012: get array type Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>();
        let clazz = Class.of(arr);
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();
        expect(name).assertContain("Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1300
     * @tc.name testClassGetName013
     * @tc.desc Verify ClassGetName case 013: get Map type Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, int>();
        let clazz = Class.of(map);
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();
        expect(name).assertContain("Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1400
     * @tc.name testClassGetName014
     * @tc.desc Verify ClassGetName case 014: get Settype Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
        let clazz = Class.of(set);
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();
        expect(name).assertContain("Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1500
     * @tc.name testClassGetName015
     * @tc.desc Verify ClassGetName case 015: get empty name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let clazz = Class.from<NestedClassForName015>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "NestedClassForName015")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1600
     * @tc.name testClassGetName016
     * @tc.desc Verify ClassGetName case 016: get type Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<int | string>();
        let name = clazz.getName();
        console.info(name);
        expect(clazz.isUnion()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1700
     * @tc.name testClassGetName017
     * @tc.desc Verify ClassGetName case 017: get array type Class object name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let clazz = Class.of(arr);
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();
        expect(name.indexOf('[') >= 0).assertTrue();
        expect(name.indexOf(']') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1800
     * @tc.name testClassGetName018
     * @tc.desc Verify ClassGetName case 018: Class object call getNamereturn same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass018>();
        let name1 = clazz.getName();
        let name2 = clazz.getName();
        let name3 = clazz.getName();
        expect(name1).assertEqual(name2);
        expect(name2).assertEqual(name3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1900
     * @tc.name testClassGetName019
     * @tc.desc Verify ClassGetName case 019: different get Class object getNamereturn same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new SameClass019();
        let clazz1 = Class.of(obj);
        let clazz2 = Class.from<SameClass019>();
        expect(clazz1.getName()).assertEqual(clazz2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2000
     * @tc.name testClassGetName020
     * @tc.desc Verify ClassGetName case 020: verify return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass020>();
        let name = clazz.getName();
        expect(typeof name).assertEqual("string");
        expect(typeof name === "string").assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2100
     * @tc.name testClassGetName021
     * @tc.desc Verify ClassGetName case 021: getNamenot should return null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass021>();
        let name = clazz.getName();
        expect(name !== null).assertTrue();
        expect(name !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2200
     * @tc.name testClassGetName022
     * @tc.desc Verify ClassGetName case 022: should 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass022>();
        let name = clazz.getName();
        expect(name.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2300
     * @tc.name testClassGetName023
     * @tc.desc Verify ClassGetName case 023: generic class getName contains type info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<A023>();
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();

        expect(Utils.classNameMatches(name, "A023")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2400
     * @tc.name testClassGetName024
     * @tc.desc Verify ClassGetName case 024: array type getName format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<_PrivateClass024>();
        let name = clazz.getName();
        expect(Utils.classNameMatches(name, "_PrivateClass024")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2500
     * @tc.name testClassGetName025
     * @tc.desc Verify ClassGetName case 025: verify not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass001>();
        expect(Utils.classNameMatches(clazz.getName(), "MyClass001")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2600
     * @tc.name testClassGetName026
     * @tc.desc Verify ClassGetName case 026: Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<My类026>();
        let name = clazz.getName();
        expect(name.length > 0).assertTrue();
        expect(name).assertContain("026");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2700
     * @tc.name testClassGetName027
     * @tc.desc Verify ClassGetName case 027: in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new UserService027();
        Logger027.logClassName(service);
        expect(Utils.classNameMatches(Class.from<UserService027>().getName(), "UserService027")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2800
     * @tc.name testClassGetName028
     * @tc.desc Verify ClassGetName case 028: verify object is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new MyService028();
        expect(Validator028.isExpectedClass(service, "MyService028")).assertEqual(true);
        expect(Validator028.isExpectedClass(service, "OtherClass")).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2900
     * @tc.name testClassGetName029
     * @tc.desc Verify ClassGetName case 029: using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      ControllerRegistry029.register(new UserController029());
        ControllerRegistry029.register(new ProductController029());

        let userCtrl = ControllerRegistry029.get("UserController029");
        let productCtrl = ControllerRegistry029.get("ProductController029");
        expect(userCtrl !== undefined).assertTrue();
        expect(productCtrl !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3000
     * @tc.name testClassGetName030
     * @tc.desc Verify ClassGetName case 030: union type getName contains union marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let configClass = Class.from<Config030>();
        let serialized = Serializer030.serializeClass(configClass);
        expect(serialized).assertContain("Config030");
        expect(serialized).assertContain("Class");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3100
     * @tc.name testClassGetName031
     * @tc.desc Verify ClassGetName case 031: in when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data = new TestData031();
        DebugHelper031.dumpClassInfo(data);
        expect(Utils.classNameMatches(Class.from<TestData031>().getName(), "TestData031")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3200
     * @tc.name testClassGetName032
     * @tc.desc Verify ClassGetName case 032: get performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let startTime = Date.now();
        for (let i = 0; i < 100; i++) {
            let clazz = Class.from<MyClass033>();
            let name = clazz.getName();
            expect(name.length).assertLarger(0);
        }
        let endTime = Date.now();
        console.info("获取100个类名耗时: " + (endTime - startTime) + "ms");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3300
     * @tc.name testClassGetName033
     * @tc.desc Verify ClassGetName case 033: getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let clazz = Class.from<MyClass033>();
        let name1 = clazz.getName();
        let name2 = clazz.getName();

        expect(name1).assertEqual(name2);

        console.info("Same reference: " + (name1 === name2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3400
     * @tc.name testClassGetName034
     * @tc.desc Verify ClassGetName case 034: with getName getSuperverify inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass034>();
        let childName = childClazz.getName();
        let superClazz = childClazz.getSuper();

        expect(Utils.classNameMatches(childName, "ChildClass034")).assertTrue();
        expect(superClazz !== undefined).assertTrue();
        expect(Utils.classNameMatches(superClazz!.getName(), "ParentClass034")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3500
     * @tc.name testClassGetName035
     * @tc.desc Verify ClassGetName case 035: via getName isInterface interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let interfaceClazz = Class.from<MyInterface035>();
        let classClazz = Class.from<MyClass035>();
        expect(interfaceClazz.getName().length > 0).assertTrue();
        expect(Utils.classNameMatches(classClazz.getName(), "MyClass035")).assertTrue();
        expect(interfaceClazz.isInterface()).assertTrue();
        expect(classClazz.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3600
     * @tc.name testClassGetName036
     * @tc.desc Verify ClassGetName case 036: via getName isPrimitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myClassClazz = Class.from<MyClass036>();
        let intClazz = Class.PRIMITIVE_INT;
        expect(Utils.classNameMatches(myClassClazz.getName(), "MyClass036")).assertTrue();
        expect(myClassClazz.isPrimitive()).assertFalse();
        expect(Utils.reflectScalarTypeNameMatches(intClazz.getName(), "int")).assertTrue();
        expect(intClazz.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3700
     * @tc.name testClassGetName037
     * @tc.desc Verify ClassGetName case 037: getName getDescriptorreturn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetName037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass037>();
        let name = clazz.getName();
        let descriptor = clazz.getDescriptor();

        console.info("Name: " + name);
        console.info("Descriptor: " + descriptor);

        expect(name !== descriptor).assertTrue();
        expect(Utils.classNameMatches(name, "MyClass037")).assertTrue();
        expect(descriptor).assertContain("MyClass037");
    });

  });
}
