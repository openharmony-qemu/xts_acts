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
import { looseClassOf } from './VoidFn.test';

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
  public value: T | undefined = undefined;
}

class TestClass024 {}

class ChildClass025 extends ParentClass025 {}

class ParentClass025 {}

class GenericClass037<T, U> {
  public first: T = undefined as T;
  public second: U = undefined as U;
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
  public field3: int = 3;
  public field4: int = 4;
  public field5: int = 5;
  public field6: int = 6;
  public field7: int = 7;
  public field8: int = 8;
  public field9: int = 9;
  public field10: int = 10;
  public field11: int = 11;
  public field12: int = 12;
  public field13: int = 13;
  public field14: int = 14;
  public field15: int = 15;
  public field16: int = 16;
  public field17: int = 17;
  public field18: int = 18;
  public field19: int = 19;
  public field20: int = 20;
  public field21: int = 21;
  public field22: int = 22;
  public field23: int = 23;
  public field24: int = 24;
  public field25: int = 25;
  public field26: int = 26;
  public field27: int = 27;
  public field28: int = 28;
  public field29: int = 29;
  public field30: int = 30;
  public field31: int = 31;
  public field32: int = 32;
  public field33: int = 33;
  public field34: int = 34;
  public field35: int = 35;
  public field36: int = 36;
  public field37: int = 37;
  public field38: int = 38;
  public field39: int = 39;
  public field40: int = 40;
  public field41: int = 41;
  public field42: int = 42;
  public field43: int = 43;
  public field44: int = 44;
  public field45: int = 45;
  public field46: int = 46;
  public field47: int = 47;
  public field48: int = 48;
  public field49: int = 49;
  public field50: int = 50;
  public field51: int = 51;
  public field52: int = 52;
  public field53: int = 53;
  public field54: int = 54;
  public field55: int = 55;
  public field56: int = 56;
  public field57: int = 57;
  public field58: int = 58;
  public field59: int = 59;
  public field60: int = 60;
  public field61: int = 61;
  public field62: int = 62;
  public field63: int = 63;
  public field64: int = 64;
  public field65: int = 65;
  public field66: int = 66;
  public field67: int = 67;
  public field68: int = 68;
  public field69: int = 69;
  public field70: int = 70;
  public field71: int = 71;
  public field72: int = 72;
  public field73: int = 73;
  public field74: int = 74;
  public field75: int = 75;
  public field76: int = 76;
  public field77: int = 77;
  public field78: int = 78;
  public field79: int = 79;
  public field80: int = 80;
  public field81: int = 81;
  public field82: int = 82;
  public field83: int = 83;
  public field84: int = 84;
  public field85: int = 85;
  public field86: int = 86;
  public field87: int = 87;
  public field88: int = 88;
  public field89: int = 89;
  public field90: int = 90;
  public field91: int = 91;
  public field92: int = 92;
  public field93: int = 93;
  public field94: int = 94;
  public field95: int = 95;
  public field96: int = 96;
  public field97: int = 97;
  public field98: int = 98;
  public field99: int = 99;
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
  describe('ClassOfTest', (): void => {
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
     * @tc.desc Verify ClassOf case 001: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls = Class.of(obj);
      expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0200
     * @tc.name testClassOf002
     * @tc.desc Verify ClassOf case 002: extra Class.of argument throws Error, Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      expect(Class.of(obj) !== null).assertTrue();
      try {
        looseClassOf().of(obj, "extra" as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(error.message.indexOf('Class.of expects 1 argument') >= 0).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0300
     * @tc.name testClassOf003
     * @tc.desc Verify ClassOf case 003: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass004();
      let clsOf = Class.of(obj);
      let clsFrom = Class.from<MyClass004>();
      expect(clsOf.getName()).assertEqual(clsFrom.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0400
     * @tc.name testClassOf004
     * @tc.desc Verify ClassOf case 004: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0500
     * @tc.name testClassOf005
     * @tc.desc Verify ClassOf case 005: Class.of(instance), getName returns "std.core.Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Array<int>();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0600
     * @tc.name testClassOf006
     * @tc.desc Verify ClassOf case 006: Class.of(instance), getName returns "std.core.Set"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Set<string>();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0700
     * @tc.name testClassOf007
     * @tc.desc Verify ClassOf case 007: Class.of(instance), isFixedArray returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: FixedArray<int> = [1, 2, 3];
      let cls = Class.of(obj);
      expect(cls.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0800
     * @tc.name testClassOf008
     * @tc.desc Verify ClassOf case 008: Class.of(instance), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ChildClass009();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ChildClass009");
      let superCls = cls.getSuper();
      expect(superCls !== null).assertTrue();
      expect(superCls!.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ParentClass009");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_0900
     * @tc.name testClassOf009
     * @tc.desc Verify ClassOf case 009: Class.of(instance), isInterface returns false, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass010();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.MyClass010");
      expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1000
     * @tc.name testClassOf010
     * @tc.desc Verify ClassOf case 010: Class.of(instance), isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyInterface011 = { name: "Alice", age: 30 };
      let cls = Class.of(obj);
      expect(reflect.isLiteralInitializedInterface(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1100
     * @tc.name testClassOf011
     * @tc.desc Verify ClassOf case 011: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new GenericClass012<int>();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.GenericClass012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1200
     * @tc.name testClassOf012
     * @tc.desc Verify ClassOf case 012: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(null);
      expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1300
     * @tc.name testClassOf013
     * @tc.desc Verify ClassOf case 013: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(null);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1400
     * @tc.name testClassOf014
     * @tc.desc Verify ClassOf case 014: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Array<int>();
      let cls1 = Class.of(obj);
      expect(cls1 !== null).assertTrue();

      let cls2 = Class.of(null);
      expect(cls2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1500
     * @tc.name testClassOf015
     * @tc.desc Verify ClassOf case 015: invalid input throws ClassCastError, Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Class.of(undefined as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1600
     * @tc.name testClassOf016
     * @tc.desc Verify ClassOf case 016: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedInt: Object = 42 as Object;
      let cls = Class.of(boxedInt);
      expect(cls !== null).assertTrue();
      expect(cls.getName()).assertEqual(Utils.scalarClassFromIntFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1700
     * @tc.name testClassOf017
     * @tc.desc Verify ClassOf case 017: Class.of(instance), getName returns "std.core.String"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedStr: Object = "hello" as Object;
      let cls = Class.of(boxedStr);
      expect(cls.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1800
     * @tc.name testClassOf018
     * @tc.desc Verify ClassOf case 018: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedBool: Object = true as Object;
      let cls = Class.of(boxedBool);
      expect(cls !== null).assertTrue();
      expect(cls.getName()).assertEqual(Utils.scalarClassFromBooleanFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_1900
     * @tc.name testClassOf019
     * @tc.desc Verify ClassOf case 019: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let boxedNaN: Object = nanVal as Object;
      let cls = Class.of(boxedNaN);
      expect(cls.getName()).assertEqual(Utils.scalarClassFromDoubleFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2000
     * @tc.name testClassOf020
     * @tc.desc Verify ClassOf case 020: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let boxedInf: Object = infVal as Object;
      let cls = Class.of(boxedInf);
      expect(cls.getName()).assertEqual(Utils.scalarClassFromDoubleFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2100
     * @tc.name testClassOf021
     * @tc.desc Verify ClassOf case 021: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls: Class = Class.of(obj);
      expect(typeof cls.getName).assertEqual("function");
      expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2200
     * @tc.name testClassOf022
     * @tc.desc Verify ClassOf case 022: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let cls = Class.of(obj);
      expect(typeof cls.getName).assertEqual("function");
      expect(typeof cls.getSuper).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2300
     * @tc.name testClassOf023
     * @tc.desc Verify ClassOf case 023: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass024();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.TestClass024");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2400
     * @tc.name testClassOf024
     * @tc.desc Verify ClassOf case 024: Class.of(instance), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ChildClass025();
      let cls = Class.of(obj);
      let superCls = cls.getSuper();
      expect(superCls !== null).assertTrue();
      expect(superCls!.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ParentClass025");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2500
     * @tc.name testClassOf025
     * @tc.desc Verify ClassOf case 025: Class.of(instance), isPrimitive returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let cls = Class.of(obj);
      expect(cls.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2600
     * @tc.name testClassOf026
     * @tc.desc Verify ClassOf case 026: Class.of(instance), isInterface returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let cls = Class.of(obj);
      expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2700
     * @tc.name testClassOf027
     * @tc.desc Verify ClassOf case 027: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls1 = Class.of(obj);
      let cls2 = Class.of(obj);
      expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2800
     * @tc.name testClassOf028
     * @tc.desc Verify ClassOf case 028: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new Map<int, string>();
      let obj2 = new Map<int, string>();
      let cls1 = Class.of(obj1);
      let cls2 = Class.of(obj2);
      expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_2900
     * @tc.name testClassOf029
     * @tc.desc Verify ClassOf case 029: Class.of(instance), getName returns "std.core.Null"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(null);
      expect(cls !== null).assertTrue();
      expect(cls.getName()).assertEqual("std.core.Null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3000
     * @tc.name testClassOf030
     * @tc.desc Verify ClassOf case 030: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3100
     * @tc.name testClassOf031
     * @tc.desc Verify ClassOf case 031: Class.from<Map<int, string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls1 = Class.of(obj);
      let cls2 = Class.from<Map<int, string>>();
      expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3200
     * @tc.name testClassOf032
     * @tc.desc Verify ClassOf case 032: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls1 = Class.of(obj);
      let cls2 = Class.ofAny(obj);
      expect(cls1.getName()).assertEqual(cls2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3300
     * @tc.name testClassOf033
     * @tc.desc Verify ClassOf case 033: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.of(null);
      let cls2 = Class.ofAny(null);
      expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3400
     * @tc.name testClassOf034
     * @tc.desc Verify ClassOf case 034: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let cls: Class = Class.of(obj);
      expect(cls !== null).assertTrue();
      expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3500
     * @tc.name testClassOf035
     * @tc.desc Verify ClassOf case 035: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object | null = new Map<int, string>();
      let cls1 = Class.of(obj1);
      let obj2: Object | null = null;
      let cls2 = Class.of(obj2);
      expect(cls1.getName()).assertEqual("std.core.Map");
      expect(cls2 !== null).assertTrue();
      expect(cls2!.getName()).assertEqual(Class.of(null).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3600
     * @tc.name testClassOf036
     * @tc.desc Verify ClassOf case 036: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new GenericClass037<int, string>();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.GenericClass037");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3700
     * @tc.name testClassOf037
     * @tc.desc Verify ClassOf case 037: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ImplClass038();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ImplClass038");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3800
     * @tc.name testClassOf038
     * @tc.desc Verify ClassOf case 038: Class.of(instance), getName returns "std.core.Map"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map1 = new Map<int, string>();
      let cls1 = Class.of(map1);

      let map2 = new Map<string, int>();
      let cls2 = Class.of(map2);

      let map3 = new Map<int, int>();
      let cls3 = Class.of(map3);
      expect(cls1.getName()).assertEqual("std.core.Map");
      expect(cls2.getName()).assertEqual("std.core.Map");
      expect(cls3.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_3900
     * @tc.name testClassOf039
     * @tc.desc Verify ClassOf case 039: Class.of(instance), getName returns "std.core.Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<int>();
      let cls1 = Class.of(arr1);

      let arr2 = new Array<string>();
      let cls2 = Class.of(arr2);

      let arr3 = new Array<Object>();
      let cls3 = Class.of(arr3);
      expect(cls1.getName()).assertEqual("std.core.Array");
      expect(cls2.getName()).assertEqual("std.core.Array");
      expect(cls3.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4000
     * @tc.name testClassOf040
     * @tc.desc Verify ClassOf case 040: Class.of(instance), getName returns "std.core.Set"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<int>();
      let cls1 = Class.of(set1);

      let set2 = new Set<string>();
      let cls2 = Class.of(set2);
      expect(cls1.getName()).assertEqual("std.core.Set");
      expect(cls2.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4100
     * @tc.name testClassOf041
     * @tc.desc Verify ClassOf case 041: Class.of(instance), isFixedArray returns true, getFixedArrayComponentType() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
      let cls = Class.of(arr);
      expect(cls.isFixedArray()).assertTrue();

      let componentType = cls.getFixedArrayComponentType();
      expect(componentType !== null).assertTrue();
      expect(componentType!.getName()).assertEqual(Utils.scalarReflectI32Fqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4200
     * @tc.name testClassOf042
     * @tc.desc Verify ClassOf case 042: Class.of(instance), isFixedArray returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>();
      let cls = Class.of(arr);
      expect(cls.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4300
     * @tc.name testClassOf043
     * @tc.desc Verify ClassOf case 043: Class.of(instance), isEnum returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(TestEnum044.VALUE1);
      expect(cls.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4400
     * @tc.name testClassOf044
     * @tc.desc Verify ClassOf case 044: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(myFunction045);
      expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4500
     * @tc.name testClassOf045
     * @tc.desc Verify ClassOf case 045: Class.of(instance), isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncFunction = async (): Promise<string> => {
        return "test";
      };
      let cls = Class.of(asyncFunction);
      expect(reflect.isFuncObjAsync(asyncFunction)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4600
     * @tc.name testClassOf046
     * @tc.desc Verify ClassOf case 046: Class.of(instance), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child047();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.Child047");

      let superCls = cls.getSuper();
      expect(superCls!.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.Parent047");

      let grandSuperCls = superCls!.getSuper();
      expect(grandSuperCls!.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.GrandParent047");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4700
     * @tc.name testClassOf047
     * @tc.desc Verify ClassOf case 047: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MultiInterfaceClass048();
      let cls = Class.of(obj);
      let interfaces = Utils.fixedArrayToArray(cls.getInterfaces());
      expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4800
     * @tc.name testClassOf048
     * @tc.desc Verify ClassOf case 048: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Parent049 = new Child049();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.Child049");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_4900
     * @tc.name testClassOf049
     * @tc.desc Verify ClassOf case 049: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyInterface050 = new ImplClass1050();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ImplClass1050");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5000
     * @tc.name testClassOf050
     * @tc.desc Verify ClassOf case 050: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new EmptyClass051();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.EmptyClass051");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5100
     * @tc.name testClassOf051
     * @tc.desc Verify ClassOf case 051: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new LargeClass052();
      let cls = Class.of(obj);
      expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5200
     * @tc.name testClassOf052
     * @tc.desc Verify ClassOf case 052: Class.of(instance), getName returns expected qualified name, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass053();
      let cls = Class.of(obj);
      cls.initialize();
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.MyClass053");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5300
     * @tc.name testClassOf053
     * @tc.desc Verify ClassOf case 053: Class.of(instance), isFinal returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new FinalClass054();
      let cls = Class.of(obj);
      expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5400
     * @tc.name testClassOf054
     * @tc.desc Verify ClassOf case 054: Class.of(instance), getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ConcreteClass055();
      let cls = Class.of(obj);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.ConcreteClass055");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5500
     * @tc.name testClassOf055
     * @tc.desc Verify ClassOf case 055: Class.from<Map<int, string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let startTime = Date.now();
      for (let i = 0; i < 10000; i++) {
        Class.of(obj);
      }
      let endTime = Date.now();
      expect(endTime - startTime).assertLarger(0);
      expect(Class.from<Map<int, string>>().getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5600
     * @tc.name testClassOf056
     * @tc.desc Verify ClassOf case 056: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objects = new Array<Object>();
      for (let i = 0; i < 1000; i++) {
        objects.push(new Map<int, string>());
      }
      let lastCls: Class | null = null;
      for (let obj of objects) {
        lastCls = Class.of(obj);
      }
      expect(objects.length).assertEqual(1000);
      expect(lastCls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5700
     * @tc.name testClassOf057
     * @tc.desc Verify ClassOf case 057: Class.from<MyClass>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let clsOf = Class.of(obj);
      let clsFrom = Class.from<MyClass>();
      expect(clsOf.getName()).assertEqual(clsFrom.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5800
     * @tc.name testClassOf058
     * @tc.desc Verify ClassOf case 058: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass();
      let obj2 = new MyClass();
      let cls1 = Class.of(obj1);
      let cls2 = Class.of(obj2);
      expect(cls1.getName()).assertEqual(cls2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_5900
     * @tc.name testClassOf059
     * @tc.desc Verify ClassOf case 059: Class.from<Map<int, string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let clsOf = Class.of(obj);
      let clsFrom = Class.from<Map<int, string>>();
      expect(clsOf.getName()).assertEqual(clsFrom.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6000
     * @tc.name testClassOf060
     * @tc.desc Verify ClassOf case 060: Class.of(instance), getName returns "std.core.Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedObj = new Array<int>();
      for (let i = 0; i < 10; i++) {
        let cls = Class.of(sharedObj);
        expect(cls.getName()).assertEqual("std.core.Array");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6100
     * @tc.name testClassOf061
     * @tc.desc Verify ClassOf case 061: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<int, string>();
      expect(isMap062(map)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6200
     * @tc.name testClassOf062
     * @tc.desc Verify ClassOf case 062: Class.from<Array<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Array<int>();
      let arrClass = Class.from<Array<int>>();
      expect(checkType063(obj, arrClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6300
     * @tc.name testClassOf063
     * @tc.desc Verify ClassOf case 063: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new Service064();
      let container = new Container064();
      container.register(service);
      expect(Class.of(service).getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.Service064");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6400
     * @tc.name testClassOf064
     * @tc.desc Verify ClassOf case 064: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data = new Data065();
      serialize065(data);
      expect(Class.of(data).getName()).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.Data065");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6500
     * @tc.name testClassOf065
     * @tc.desc Verify ClassOf case 065: Class.from<Map<int, string>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<int, string>();
      let clsOf = Class.of(obj);
      let clsFrom = Class.from<Map<int, string>>();
      expect(clsOf.getName()).assertEqual(clsFrom.getName());
      expect(clsFrom.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6600
     * @tc.name testClassOf066
     * @tc.desc Verify ClassOf case 066: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass();
      let className = legacyFunction067(obj);
      expect(className).assertEqual("entry.src.main.src.test.class.ClassOfTest.test.MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6700
     * @tc.name testClassOf067
     * @tc.desc Verify ClassOf case 067: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxedInt: Object = 123 as Object;
      let cls = Class.of(boxedInt);
      expect(cls !== null).assertTrue();
      expect(cls.getName()).assertEqual(Utils.scalarClassFromIntFqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OF_6800
     * @tc.name testClassOf068
     * @tc.desc Verify ClassOf case 068: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let direct = Class.of(null);
      expect(direct !== null).assertTrue();
      let result = safeGetClass069(null);
      expect(result !== null).assertTrue();
      expect(result!.getName()).assertEqual(direct.getName());
    });

  });
}

