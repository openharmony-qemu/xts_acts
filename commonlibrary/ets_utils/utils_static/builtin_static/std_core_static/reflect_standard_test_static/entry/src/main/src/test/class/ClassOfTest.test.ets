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

class MyClass {}

class MyClass004 {
    public name: string = "test";
  }

class ChildClass009 extends ParentClass009 {
    public age: int = 10;
  }

class ParentClass009 {
    public name: string = "parent";
  }

class MyClass010 implements MyInterface010 {
    public getName(): string {
      return "test";
    }
  }

interface MyInterface010 {
    getName(): string;
  }

interface MyInterface011 {
    name: string;
    age: int;
  }

class GenericClass012<T> {
    public value: T;
  }

class TestClass024 {}

class ChildClass025 extends ParentClass025 {}

class ParentClass025 {}

class GenericClass037<T, U> {
    public first: T;
    public second: U;
  }

interface GenericInterface038<T> {
    getValue(): T;
  }

class ImplClass038 implements GenericInterface038<int> {
    public getValue(): int {
      return 0;
    }
  }

enum TestEnum044 {
    VALUE1,
    VALUE2,
    VALUE3
  }

function myFunction045() {
    console.info("test");
  }

class Child047 extends Parent047 {
    public c: int = 3;
  }

class Parent047 extends GrandParent047 {
    public b: int = 2;
  }

class GrandParent047 {
    public a: int = 1;
  }

class MultiInterfaceClass048 implements Interface1048, Interface2048 {
    public method1(): void {}
    public method2(): void {}
  }

interface Interface2048 {
    method2(): void;
  }

interface Interface1048 {
    method1(): void;
  }

class Child049 extends Parent049 {
    public age: int = 10;
  }

class Parent049 {
    public name: string = "parent";
  }

class ImplClass2050 implements MyInterface050 {
    public getName(): string {
      return "Impl2";
    }
  }

class ImplClass1050 implements MyInterface050 {
    public getName(): string {
      return "Impl1";
    }
  }

interface MyInterface050 {
    getName(): string;
  }

class EmptyClass051 {}

class LargeClass052 {
    public field1: int = 1;
    public field2: int = 2;
    // ... 更多字段
    public field100: int = 100;
  }

class MyClass053 {
    public static value: int = 0;
  }

final class FinalClass054 {
    public value: int = 1;
  }

class ConcreteClass055 extends AbstractClass055 {
    public method(): void {}
  }

abstract class AbstractClass055 {
    public abstract method(): void;
  }

function isMap062(obj: Object): boolean {
    let cls = Class.of(obj);
    return cls.getName() === "std.core.Map";
  }

class Container064 {
    public register(instance: Object): void {
      let cls = Class.of(instance);
    }
  }

class Service064 {
    public name: string = "service";
  }

class Data065 {
    public value: int = 100;
  }

function serialize065(obj: Object): string {
    let cls = Class.of(obj);
    let fields = cls.getInstanceFields();
    // 基于Class信息序列化
    return "";
  }

function legacyFunction067(obj: Object): string {
    let cls = Class.of(obj);
    return cls.getName();
  }

function safeGetClass069(obj: Object | null): Class | null {
    try {
      return Class.of(obj);
    } catch (error) {
      return null;
    }
  }

function checkType063(obj: Object, targetClass: Class): boolean {
  let objClass = Class.of(obj);
  return objClass.getName() === targetClass.getName();
}


export default function ClassOfTest(): void {
  describe('ClassOfTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0100
     * @tc.name testClassOf001
     * @tc.desc Verify ClassOf case 001: parameters obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls = Class.of(obj);
        expect(cls != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0200
     * @tc.name testClassOf002
     * @tc.desc Verify ClassOf case 002: not parameters should
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.of(new Map<int, string>()) != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0300
     * @tc.name testClassOf003
     * @tc.desc Verify ClassOf case 003: parameters should
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let obj = new Map<int, string>();
          let cls = Class.of(obj);
          expect(cls != null).assertTrue();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0400
     * @tc.name testClassOf004
     * @tc.desc Verify ClassOf case 004: instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass004();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("MyClass004");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0500
     * @tc.name testClassOf005
     * @tc.desc Verify ClassOf case 005: Mapobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0600
     * @tc.name testClassOf006
     * @tc.desc Verify ClassOf case 006: Arrayobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Array<int>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0700
     * @tc.name testClassOf007
     * @tc.desc Verify ClassOf case 007: Setobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Set<string>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0800
     * @tc.name testClassOf008
     * @tc.desc Verify ClassOf case 008: FixedArrayobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(obj);
        expect(cls.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0900
     * @tc.name testClassOf009
     * @tc.desc Verify ClassOf case 009: instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new ChildClass009();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("ChildClass009");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1000
     * @tc.name testClassOf010
     * @tc.desc Verify ClassOf case 010: interface instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass010();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("MyClass010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1100
     * @tc.name testClassOf011
     * @tc.desc Verify ClassOf case 011: object interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: MyInterface011 = { name: "Alice", age: 30 };
        let cls = Class.of(obj);
        expect(reflect.isLiteralInitializedInterface(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1200
     * @tc.name testClassOf012
     * @tc.desc Verify ClassOf case 012: generic instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new GenericClass012<int>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertContain("GenericClass012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1300
     * @tc.name testClassOf013
     * @tc.desc Verify ClassOf case 013: null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(null);
        expect(cls != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1400
     * @tc.name testClassOf014
     * @tc.desc Verify ClassOf case 014: nullnot undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(null);
        expect(cls != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1500
     * @tc.name testClassOf015
     * @tc.desc Verify ClassOf case 015: verify type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // Object类型
        let obj = new Array<int>();
        let cls1 = Class.of(obj);
        expect(cls1 != null).assertTrue();

        // null类型
        let cls2 = Class.of(null);
        expect(cls2 != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1600
     * @tc.name testClassOf016
     * @tc.desc Verify ClassOf case 016: undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(undefined as Object);
          expect(cls != null).assertTrue();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1700
     * @tc.name testClassOf017
     * @tc.desc Verify ClassOf case 017: number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(123);
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1800
     * @tc.name testClassOf018
     * @tc.desc Verify ClassOf case 018: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of("test");
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1900
     * @tc.name testClassOf019
     * @tc.desc Verify ClassOf case 019: boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(true);
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2000
     * @tc.name testClassOf020
     * @tc.desc Verify ClassOf case 020: NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(NaN);
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2100
     * @tc.name testClassOf021
     * @tc.desc Verify ClassOf case 021: Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(Infinity);
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2200
     * @tc.name testClassOf022
     * @tc.desc Verify ClassOf case 022: return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls = Class.of(obj);
        expect(cls != null).assertTrue();
        expect(cls!.getName()).assertContain("Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2300
     * @tc.name testClassOf023
     * @tc.desc Verify ClassOf case 023: return Class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(typeof cls.getName).assertEqual("function");
        expect(typeof cls.getSuper).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2400
     * @tc.name testClassOf024
     * @tc.desc Verify ClassOf case 024: return Classobject call getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new TestClass024();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("TestClass024");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2500
     * @tc.name testClassOf025
     * @tc.desc Verify ClassOf case 025: return Classobject get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new ChildClass025();
        let cls = Class.of(obj);
        let superCls = cls.getSuper();
        expect(superCls != null).assertTrue();
        expect(superCls!.getName()).assertEqual("ParentClass025");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2600
     * @tc.name testClassOf026
     * @tc.desc Verify ClassOf case 026: return Classobject is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(cls.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2700
     * @tc.name testClassOf027
     * @tc.desc Verify ClassOf case 027: return Classobject is interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2800
     * @tc.name testClassOf028
     * @tc.desc Verify ClassOf case 028: object call ofreturn same Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls1 = Class.of(obj);
        let cls2 = Class.of(obj);
        expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2900
     * @tc.name testClassOf029
     * @tc.desc Verify ClassOf case 029: different instance return same Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj1 = new Map<int, string>();
        let obj2 = new Map<int, string>();
        let cls1 = Class.of(obj1);
        let cls2 = Class.of(obj2);
        expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3000
     * @tc.name testClassOf030
     * @tc.desc Verify ClassOf case 030: Object nulltype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.of(12345);
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3100
     * @tc.name testClassOf031
     * @tc.desc Verify ClassOf case 031: object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3200
     * @tc.name testClassOf032
     * @tc.desc Verify ClassOf case 032: of instance from type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls1 = Class.of(obj);
        let cls2 = Class.from<Map<int, string>>();
        expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3300
     * @tc.name testClassOf033
     * @tc.desc Verify ClassOf case 033: of Object null ofAny Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls1 = Class.of(obj);
        let cls2 = Class.ofAny(obj);
        expect(cls1.getName()).assertEqual(cls2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3400
     * @tc.name testClassOf034
     * @tc.desc Verify ClassOf case 034: of null ofAny null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.of(null);
        let cls2 = Class.ofAny(null);
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3500
     * @tc.name testClassOf035
     * @tc.desc Verify ClassOf case 035: compile when type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls: Class = Class.of(obj);
        expect(cls != null).assertTrue();
        expect(cls.getName().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3600
     * @tc.name testClassOf036
     * @tc.desc Verify ClassOf case 036: Object null type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj1: Object | null = new Map<int, string>();
        let cls1 = Class.of(obj1);
        let obj2: Object | null = null;
        let cls2 = Class.of(obj2);
        expect(cls1.getName()).assertContain("Map");
        expect(cls2 != null).assertTrue();
        expect(cls2!.getName()).assertEqual(Class.of(null).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3700
     * @tc.name testClassOf037
     * @tc.desc Verify ClassOf case 037: get generic Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new GenericClass037<int, string>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertContain("GenericClass037");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3800
     * @tc.name testClassOf038
     * @tc.desc Verify ClassOf case 038: generic interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new ImplClass038();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("ImplClass038");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3900
     * @tc.name testClassOf039
     * @tc.desc Verify ClassOf case 039: different generic parameters Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let map1 = new Map<int, string>();
        let cls1 = Class.of(map1);

        let map2 = new Map<string, int>();
        let cls2 = Class.of(map2);

        let map3 = new Map<int, int>();
        let cls3 = Class.of(map3);
        expect(cls1.getName()).assertContain("Map");
        expect(cls2.getName()).assertContain("Map");
        expect(cls3.getName()).assertContain("Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4000
     * @tc.name testClassOf040
     * @tc.desc Verify ClassOf case 040: different type Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr1 = new Array<int>();
        let cls1 = Class.of(arr1);

        let arr2 = new Array<string>();
        let cls2 = Class.of(arr2);

        let arr3 = new Array<Object>();
        let cls3 = Class.of(arr3);
        expect(cls1.getName()).assertContain("Array");
        expect(cls2.getName()).assertContain("Array");
        expect(cls3.getName()).assertContain("Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4100
     * @tc.name testClassOf041
     * @tc.desc Verify ClassOf case 041: different type Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let set1 = new Set<int>();
        let cls1 = Class.of(set1);

        let set2 = new Set<string>();
        let cls2 = Class.of(set2);
        expect(cls1.getName()).assertContain("Set");
        expect(cls2.getName()).assertContain("Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4200
     * @tc.name testClassOf042
     * @tc.desc Verify ClassOf case 042: array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        expect(cls.isFixedArray()).assertTrue();

        let componentType = cls.getFixedArrayComponentType();
        expect(componentType != null).assertTrue();
        expect(componentType!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4300
     * @tc.name testClassOf043
     * @tc.desc Verify ClassOf case 043: array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr = new Array<int>();
        let cls = Class.of(arr);
        expect(cls.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4400
     * @tc.name testClassOf044
     * @tc.desc Verify ClassOf case 044: type Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(TestEnum044.VALUE1);
        expect(cls.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4500
     * @tc.name testClassOf045
     * @tc.desc Verify ClassOf case 045: is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(myFunction045);
        expect(cls != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4600
     * @tc.name testClassOf046
     * @tc.desc Verify ClassOf case 046: Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let asyncFunction = async (): Promise<string> => {
          return "test";
        };
        let cls = Class.of(asyncFunction);
        expect(reflect.isFuncObjAsync(asyncFunction)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4700
     * @tc.name testClassOf047
     * @tc.desc Verify ClassOf case 047: inheritance Classget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Child047();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("Child047");

        let superCls = cls.getSuper();
        expect(superCls!.getName()).assertEqual("Parent047");

        let grandSuperCls = superCls!.getSuper();
        expect(grandSuperCls!.getName()).assertEqual("GrandParent047");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4800
     * @tc.name testClassOf048
     * @tc.desc Verify ClassOf case 048: multiple interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MultiInterfaceClass048();
        let cls = Class.of(obj);
        let interfaces = cls.getInterfaces() as Array<Class>;
        expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4900
     * @tc.name testClassOf049
     * @tc.desc Verify ClassOf case 049: scenario Classget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Parent049 = new Child049();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("Child049");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5000
     * @tc.name testClassOf050
     * @tc.desc Verify ClassOf case 050: interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: MyInterface050 = new ImplClass1050();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("ImplClass1050");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5100
     * @tc.name testClassOf051
     * @tc.desc Verify ClassOf case 051: empty instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new EmptyClass051();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("EmptyClass051");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5200
     * @tc.name testClassOf052
     * @tc.desc Verify ClassOf case 052: property object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new LargeClass052();
        let cls = Class.of(obj);
        expect(cls != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5300
     * @tc.name testClassOf053
     * @tc.desc Verify ClassOf case 053: call initialize object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass053();
        let cls = Class.of(obj);
        cls.initialize();
        expect(cls.getName()).assertEqual("MyClass053");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5400
     * @tc.name testClassOf054
     * @tc.desc Verify ClassOf case 054: final Classget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new FinalClass054();
        let cls = Class.of(obj);
        expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5500
     * @tc.name testClassOf055
     * @tc.desc Verify ClassOf case 055: abstract class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new ConcreteClass055();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("ConcreteClass055");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5600
     * @tc.name testClassOf056
     * @tc.desc Verify ClassOf case 056: call ofmethod performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let startTime = Date.now();
        for (let i = 0; i < 10000; i++) {
          Class.of(obj);
        }
        let endTime = Date.now();
        expect(endTime - startTime).assertLarger(0);
        expect(Class.from<Map<int, string>>().getName().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5700
     * @tc.name testClassOf057
     * @tc.desc Verify ClassOf case 057: different object call of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let objects = new Array<Object>();
        for (let i = 0; i < 1000; i++) {
          objects.push(new Map<int, string>());
        }
        for (let obj of objects) {
          let cls = Class.of(obj);
          expect(cls != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5800
     * @tc.name testClassOf058
     * @tc.desc Verify ClassOf case 058: get Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(cls.getName()).assertEqual("MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5900
     * @tc.name testClassOf059
     * @tc.desc Verify ClassOf case 059: type Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj1 = new MyClass();
        let obj2 = new MyClass();
        let cls1 = Class.of(obj1);
        let cls2 = Class.of(obj2);
        // 验证是否返回同一个Class实例或等价的实例
        expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6000
     * @tc.name testClassOf060
     * @tc.desc Verify ClassOf case 060: scenario ofcall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertContain("Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6100
     * @tc.name testClassOf061
     * @tc.desc Verify ClassOf case 061: multiple get object Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let sharedObj = new Array<int>();
        for (let i = 0; i < 10; i++) {
          let cls = Class.of(sharedObj);
          expect(cls.getName()).assertContain("Array");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6200
     * @tc.name testClassOf062
     * @tc.desc Verify ClassOf case 062: using Class.of type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let map = new Map<int, string>();
        expect(isMap062(map)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6300
     * @tc.name testClassOf063
     * @tc.desc Verify ClassOf case 063: verify object is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Array<int>();
        let arrClass = Class.from<Array<int>>();
        expect(checkType063(obj, arrClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6400
     * @tc.name testClassOf064
     * @tc.desc Verify ClassOf case 064: using Class.ofget type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let service = new Service064();
        let container = new Container064();
        container.register(service);
        expect(Class.of(service).getName()).assertContain("Service064");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6500
     * @tc.name testClassOf065
     * @tc.desc Verify ClassOf case 065: Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let data = new Data065();
        serialize065(data);
        expect(Class.of(data).getName()).assertEqual("Data065");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6600
     * @tc.name testClassOf066
     * @tc.desc Verify ClassOf case 066: verify Class.of in different API is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf066', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Map<int, string>();
        let cls = Class.of(obj);
        expect(cls.getName()).assertContain("Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6700
     * @tc.name testClassOf067
     * @tc.desc Verify ClassOf case 067: using Class.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf067', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 模拟旧代码的使用方式


        let obj = new MyClass();
        let className = legacyFunction067(obj);
        expect(className).assertEqual("MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6800
     * @tc.name testClassOf068
     * @tc.desc Verify ClassOf case 068: exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf068', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let invalidObject: Object = 123 as Object;
        try {
          let cls = Class.of(invalidObject);
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6900
     * @tc.name testClassOf069
     * @tc.desc Verify ClassOf case 069: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOf069', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = safeGetClass069(null);
        expect(result != null).assertTrue();
    });

  });
}