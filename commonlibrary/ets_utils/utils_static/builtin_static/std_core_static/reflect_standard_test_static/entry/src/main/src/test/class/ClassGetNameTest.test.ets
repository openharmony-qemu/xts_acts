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
    return clazz.getName() === expectedName;
  }
}

class MyService028 {}

class ControllerRegistry029 {
  private static controllers: Map<string, Object> = new Map<string, Object>();

  public static register(controller: Object): void {
    let clazz = Class.of(controller);
    ControllerRegistry029.controllers.set(clazz.getName(), controller);
  }

  public static get(controllerFqn: string): Object | undefined {
    return ControllerRegistry029.controllers.get(controllerFqn);
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
     * @tc.desc Verify ClassGetName case 001: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass001>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyClass001");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0200
     * @tc.name testClassGetName002
     * @tc.desc Verify ClassGetName case 002: Class.from<MyClass003>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass003>();
      let name = clazz.getName();
      expect(typeof name).assertEqual("string");
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyClass003");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0300
     * @tc.name testClassGetName003
     * @tc.desc Verify ClassGetName case 003: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass004();
      let clazz = Class.of(obj);
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.TestClass004");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0400
     * @tc.name testClassGetName004
     * @tc.desc Verify ClassGetName case 004: Class.from<SampleClass005>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<SampleClass005>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.SampleClass005");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0500
     * @tc.name testClassGetName005
     * @tc.desc Verify ClassGetName case 005: Class.from<GenericClass006<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz1 = Class.from<GenericClass006<int>>();
      let name1 = clazz1.getName();
      let clazz2 = Class.from<GenericClass006<string>>();
      let name2 = clazz2.getName();
      expect(name1).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.GenericClass006");
      expect(name2).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.GenericClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0600
     * @tc.name testClassGetName006
     * @tc.desc Verify ClassGetName case 006: Class.from<DerivedClass007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<DerivedClass007>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.DerivedClass007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0700
     * @tc.name testClassGetName007
     * @tc.desc Verify ClassGetName case 007: Class.from<AbstractClass008>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<AbstractClass008>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.AbstractClass008");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0800
     * @tc.name testClassGetName008
     * @tc.desc Verify ClassGetName case 008: Class.from<FinalClass009>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<FinalClass009>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.FinalClass009");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_0900
     * @tc.name testClassGetName009
     * @tc.desc Verify ClassGetName case 009: Class.from<MyInterface010>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyInterface010>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyInterface010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1000
     * @tc.name testClassGetName010
     * @tc.desc Verify ClassGetName case 010: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.getName()).assertEqual(Utils.scalarPrimitiveBooleanFqn());

      let intClass = Class.PRIMITIVE_INT;
      expect(intClass.getName()).assertEqual(Utils.scalarParameterI32Fqn());

      let floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.getName()).assertEqual(Utils.scalarParameterF32Fqn());

      let voidClass = Class.PRIMITIVE_VOID;
      expect(voidClass.getName()).assertEqual(Utils.scalarPrimitiveVoidFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1100
     * @tc.name testClassGetName011
     * @tc.desc Verify ClassGetName case 011: Class.of(instance), getName returns "std.core.Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>();
      let clazz = Class.of(arr);
      expect(clazz.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1200
     * @tc.name testClassGetName012
     * @tc.desc Verify ClassGetName case 012: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, int>();
      let clazz = Class.of(map);
      expect(clazz.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1300
     * @tc.name testClassGetName013
     * @tc.desc Verify ClassGetName case 013: Class.of(instance), getName returns "std.core.Set"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let clazz = Class.of(set);
      expect(clazz.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1400
     * @tc.name testClassGetName014
     * @tc.desc Verify ClassGetName case 014: Class.from<NestedClassForName015>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<NestedClassForName015>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.NestedClassForName015");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1500
     * @tc.name testClassGetName015
     * @tc.desc Verify ClassGetName case 015: Class.from<int | string>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<int | string>();
      let name = clazz.getName();
      console.info(name);
      expect(clazz.isUnion()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1600
     * @tc.name testClassGetName016
     * @tc.desc Verify ClassGetName case 016: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
      let clazz = Class.of(arr);
      expect(clazz.getName()).assertEqual(Utils.scalarReflectI32FixedArrayInstanceFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1700
     * @tc.name testClassGetName017
     * @tc.desc Verify ClassGetName case 017: Class.from<TestClass018>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass018>();
      let name1 = clazz.getName();
      let name2 = clazz.getName();
      let name3 = clazz.getName();
      expect(name1).assertEqual(name2);
      expect(name2).assertEqual(name3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1800
     * @tc.name testClassGetName018
     * @tc.desc Verify ClassGetName case 018: Class.from<SameClass019>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new SameClass019();
      let clazz1 = Class.of(obj);
      let clazz2 = Class.from<SameClass019>();
      expect(clazz1.getName()).assertEqual(clazz2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_1900
     * @tc.name testClassGetName019
     * @tc.desc Verify ClassGetName case 019: Class.from<TestClass020>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass020>();
      let name = clazz.getName();
      expect(typeof name).assertEqual("string");
      expect(typeof name === "string").assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2000
     * @tc.name testClassGetName020
     * @tc.desc Verify ClassGetName case 020: Class.from<TestClass021>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass021>();
      let name = clazz.getName();
      expect(name !== null).assertTrue();
      expect(name !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2100
     * @tc.name testClassGetName021
     * @tc.desc Verify ClassGetName case 021: Class.from<TestClass022>(), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass022>();
      expect(clazz.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.TestClass022");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2200
     * @tc.name testClassGetName022
     * @tc.desc Verify ClassGetName case 022: Class.from<A023>(), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<A023>();
      expect(clazz.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.A023");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2300
     * @tc.name testClassGetName023
     * @tc.desc Verify ClassGetName case 023: Class.from<_PrivateClass024>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<_PrivateClass024>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test._PrivateClass024");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2400
     * @tc.name testClassGetName024
     * @tc.desc Verify ClassGetName case 024: Class.from<My类026>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<My类026>();
      let name = clazz.getName();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.My类026");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2500
     * @tc.name testClassGetName025
     * @tc.desc Verify ClassGetName case 025: Class.from<UserService027>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new UserService027();
      Logger027.logClassName(service);
      expect(Class.from<UserService027>().getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.UserService027");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2600
     * @tc.name testClassGetName026
     * @tc.desc Verify ClassGetName case 026: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new MyService028();
      expect(Validator028.isExpectedClass(service, "entry.src.main.src.test.class.ClassGetNameTest.test.MyService028")).assertEqual(true);
      expect(Validator028.isExpectedClass(service, "OtherClass")).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2700
     * @tc.name testClassGetName027
     * @tc.desc Verify ClassGetName case 027: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const userFqn = "entry.src.main.src.test.class.ClassGetNameTest.test.UserController029";
      const productFqn = "entry.src.main.src.test.class.ClassGetNameTest.test.ProductController029";
      ControllerRegistry029.register(new UserController029());
      ControllerRegistry029.register(new ProductController029());

      let userCtrl = ControllerRegistry029.get(userFqn);
      let productCtrl = ControllerRegistry029.get(productFqn);
      expect(userCtrl !== undefined).assertTrue();
      expect(productCtrl !== undefined).assertTrue();
      expect(Class.of(userCtrl!).getName()).assertEqual(userFqn);
      expect(Class.of(productCtrl!).getName()).assertEqual(productFqn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2800
     * @tc.name testClassGetName028
     * @tc.desc Verify ClassGetName case 028: Class.from<Config030>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const configFqn = "entry.src.main.src.test.class.ClassGetNameTest.test.Config030";
      let configClass = Class.from<Config030>();
      expect(configClass.getName()).assertEqual(configFqn);
      let serialized = Serializer030.serializeClass(configClass);
      expect(serialized).assertEqual('{"class":"' + configFqn + '","type":"Class"}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_2900
     * @tc.name testClassGetName029
     * @tc.desc Verify ClassGetName case 029: Class.from<TestData031>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data = new TestData031();
      DebugHelper031.dumpClassInfo(data);
      expect(Class.from<TestData031>().getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.TestData031");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3000
     * @tc.name testClassGetName030
     * @tc.desc Verify ClassGetName case 030: Class.from<MyClass033>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startTime = Date.now();
      const expected = "entry.src.main.src.test.class.ClassGetNameTest.test.MyClass033";
      for (let i = 0; i < 100; i++) {
        expect(Class.from<MyClass033>().getName()).assertEqual(expected);
      }
      let endTime = Date.now();
      console.info("获取100个类名耗时: " + (endTime - startTime) + "ms");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3100
     * @tc.name testClassGetName031
     * @tc.desc Verify ClassGetName case 031: Class.from<MyClass033>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass033>();
      let name1 = clazz.getName();
      let name2 = clazz.getName();

      expect(name1).assertEqual(name2);

      console.info("Same reference: " + (name1 === name2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3200
     * @tc.name testClassGetName032
     * @tc.desc Verify ClassGetName case 032: Class.from<ChildClass034>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass034>();
      let childName = childClazz.getName();
      let superClazz = childClazz.getSuper();

      expect(childName).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.ChildClass034");
      expect(superClazz !== undefined).assertTrue();
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.ParentClass034");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3300
     * @tc.name testClassGetName033
     * @tc.desc Verify ClassGetName case 033: Class.from<MyInterface035>(), isInterface returns true, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let interfaceClazz = Class.from<MyInterface035>();
      let classClazz = Class.from<MyClass035>();
      expect(interfaceClazz.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyInterface035");
      expect(classClazz.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyClass035");
      expect(interfaceClazz.isInterface()).assertTrue();
      expect(classClazz.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3400
     * @tc.name testClassGetName034
     * @tc.desc Verify ClassGetName case 034: Class.from<MyClass036>(), isPrimitive returns false, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myClassClazz = Class.from<MyClass036>();
      let intClazz = Class.PRIMITIVE_INT;
      expect(myClassClazz.getName()).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyClass036");
      expect(myClassClazz.isPrimitive()).assertFalse();
      expect(intClazz.getName()).assertEqual(Utils.scalarParameterI32Fqn());
      expect(intClazz.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETNAME_3500
     * @tc.name testClassGetName035
     * @tc.desc Verify ClassGetName case 035: Class.from<MyClass037>(), getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetName035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass037>();
      let name = clazz.getName();
      let descriptor = clazz.getDescriptor();

      console.info("Name: " + name);
      console.info("Descriptor: " + descriptor);

      expect(name !== descriptor).assertTrue();
      expect(name).assertEqual("entry.src.main.src.test.class.ClassGetNameTest.test.MyClass037");
      let inner = descriptor.substring(1, descriptor.length - 1);
      let nameFromDescriptor = inner.split('/').join('.');
      expect(nameFromDescriptor).assertEqual(name);
    });

  });
}

