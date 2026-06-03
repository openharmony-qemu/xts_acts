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

function asInstanceFieldArraySuper(fields: FixedArray<reflect.InstanceField>): Array<reflect.InstanceField> {
  return Utils.fixedArrayToArray(fields);
}

function asInstanceMethodArraySuper(methods: FixedArray<reflect.InstanceMethod>): Array<reflect.InstanceMethod> {
  return Utils.fixedArrayToArray(methods);
}

class MyClass001 {}


class ParentClass004 {
  public name: string = "parent"
}

class ChildClass004 extends ParentClass004 {
  public age: int = 10
}

class GrandParent005 {
  public grandField: string = "grand"
}

class ParentClass005 extends GrandParent005 {
  public parentField: string = "parent"
}

class ChildClass005 extends ParentClass005 {
  public childField: string = "child"
}

class ParentClass006 {}

final class FinalChild006 extends ParentClass006 {
  public value: int = 100
}

class ChildClass007 extends AbstractParent007 {
  public getValue(): int {
    return 42
  }
}

abstract class AbstractParent007 {
  public abstract getValue(): int
}

class TestClass008 {}

class ParentClass009 {}

interface MyInterface009 {
  test(): void
}

class ChildClass009 extends ParentClass009 implements MyInterface009 {
  public test(): void {}
}

class ParentClass010 {}

interface Interface1010 {
  method1(): void
}

interface Interface2010 {
  method2(): void
}

class ChildClass010 extends ParentClass010 implements Interface1010, Interface2010 {
  public method1(): void {}
  public method2(): void {}
}

class MyClass011 {}

class ParentClass013 {
  public parentField: string = "parent"
  public parentMethod(): string {
    return "parent method"
  }
}

class ChildClass013 extends ParentClass013 {}

class GenericParent017<T> {
  public value: T | undefined = undefined
}

class GenericChild017 extends GenericParent017<int> {}

enum TestEnum019 {
  VALUE1,
  VALUE2
}

class MyClass020 {}

class MyClass021 {}

class DynamicClass022 {}

final class FinalClass023 {
  public value: int = 1
}

abstract class AbstractClass024 {
  public abstract method(): void
}

class ConcreteClass025 extends AbstractChild025 {
  public method1(): void {}
  public method2(): void {}
}

abstract class AbstractChild025 extends AbstractParent025 {
  public abstract method2(): void
}

abstract class AbstractParent025 {
  public abstract method1(): void
}

class GrandParent026 {
  public field: string = "grand"
}

class Parent1026 extends GrandParent026 {
  public parent1Field: string = "p1"
}

class Parent2026 extends GrandParent026 {
  public parent2Field: string = "p2"
}

interface ISecondParent026 {
  parent2Method(): void
}

class Child026 extends Parent1026 implements ISecondParent026 {
  public parent2Method(): void {}
}

class Level1027 {
  public l1: string = "l1"
}

class Level2027 extends Level1027 {
  public l2: string = "l2"
}

class Level3027 extends Level2027 {
  public l3: string = "l3"
}

class Level4027 extends Level3027 {
  public l4: string = "l4"
}

class Level5027 extends Level4027 {
  public l5: string = "l5"
}

class ParentClass028 {
  public name: string = "parent"
}

interface Serializable028 {
  toJSON(): string
}

class ChildClass028 extends ParentClass028 implements Serializable028 {
  public age: int = 10
  public toJSON(): string {
    return '{"name":"' + this.name + '","age":' + this.age + '}'
  }
}

class BaseClass029 {
  public baseField: string = "base"
}

interface Interface1029 {
  method1(): void
}

interface Interface2029 {
  method2(): void
}

interface Interface3029 {
  method3(): void
}

class DerivedClass029 extends BaseClass029 implements Interface1029, Interface2029, Interface3029 {
  public method1(): void {}
  public method2(): void {}
  public method3(): void {}
}

class ParentClass030 {}

class ChildClass030 extends ParentClass030 {}

class ParentClass031 {
  public parentMethod(): void {}
}

class ChildClass031 extends ParentClass031 {}

class ParentClass032 {
  public parentMethod(): string {
    return "parent"
  }
}

class ChildClass032 extends ParentClass032 {
  public childMethod(): string {
    return "child"
  }
}

class MyClass033 {}

class TestClass034 {}

class UserService035 extends BaseService035 {
  public getUser(): string {
    return "user"
  }
}

class BaseService035 {
  public log(): void {
    console.info("base service")
  }
}

class UserModel036 extends BaseModel036 {
  public username: string = ""
  public email: string = ""
}

class BaseModel036 {
  public id: int = 0
  public createdAt: string = ""
}

class Parent037 {
  public parentField: string = "parent"
}

class Child037 extends Parent037 {
  public childField: string = "child"
}

export default function ClassGetSuperTest(): void {
  describe('ClassGetSuperTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0100
     * @tc.name testClassGetSuper001
     * @tc.desc Verify ClassGetSuper case 001: Class.of(instance), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.of(new MyClass001())
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("std.core.Object")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0200
     * @tc.name testClassGetSuper002
     * @tc.desc Verify ClassGetSuper case 002: Class.from<ChildClass004>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass004>()
      let superClazz = childClazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass004")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0300
     * @tc.name testClassGetSuper003
     * @tc.desc Verify ClassGetSuper case 003: Class.from<ChildClass005>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass005>()
      let parentClazz = childClazz.getSuper()
      let grandClazz = parentClazz!.getSuper()
      expect(parentClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass005")
      expect(grandClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.GrandParent005")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0400
     * @tc.name testClassGetSuper004
     * @tc.desc Verify ClassGetSuper case 004: Class.from<FinalChild006>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<FinalChild006>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass006")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0500
     * @tc.name testClassGetSuper005
     * @tc.desc Verify ClassGetSuper case 005: Class.from<ChildClass007>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<ChildClass007>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.AbstractParent007")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0600
     * @tc.name testClassGetSuper006
     * @tc.desc Verify ClassGetSuper case 006: Class.from<TestClass008>(), root Class getSuper is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<TestClass008>()
      let superClazz = clazz.getSuper()
      let rootSuper = superClazz!.getSuper()
      expect(Utils.isAbsentReflectOptional(rootSuper)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0700
     * @tc.name testClassGetSuper007
     * @tc.desc Verify ClassGetSuper case 007: Class.from<ChildClass009>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<ChildClass009>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass009")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0800
     * @tc.name testClassGetSuper008
     * @tc.desc Verify ClassGetSuper case 008: Class.from<ChildClass010>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<ChildClass010>()
      let superClazz = clazz.getSuper()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass010")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0900
     * @tc.name testClassGetSuper009
     * @tc.desc Verify ClassGetSuper case 009: Class.from<MyClass011>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass011>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      let isCls: boolean = superClazz instanceof Class;
      expect(isCls).assertTrue()
      let name = superClazz!.getName()
      expect(name).assertEqual("std.core.Object")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1000
     * @tc.name testClassGetSuper010
     * @tc.desc Verify ClassGetSuper case 010: Class.from<Object>(), root Class getSuper is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<Object>()
      let superClazz = clazz.getSuper()
      expect(Utils.isAbsentReflectOptional(superClazz)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1100
     * @tc.name testClassGetSuper011
     * @tc.desc Verify ClassGetSuper case 011: Class.from<ChildClass013>(), getSuper returns expected parent Class, parent field name is "parentField"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass013>()
      let parentClazz = childClazz.getSuper()
      let fields = asInstanceFieldArraySuper(parentClazz!.getInstanceFields())
      expect(fields.length).assertEqual(1)
      expect(fields[0].getName()).assertEqual("parentField")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1200
     * @tc.name testClassGetSuper012
     * @tc.desc Verify ClassGetSuper case 012: Class.from<string>(), root Class getSuper is absent, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intClass = Class.PRIMITIVE_INT;
      expect(Utils.isAbsentReflectOptional(intClass.getSuper())).assertTrue();

      let stringClass = Class.from<string>();
      let stringSuper = stringClass.getSuper();
      expect(stringSuper !== undefined && stringSuper !== null).assertTrue();
      expect(stringSuper!.getName()).assertEqual("std.core.Object");

      let boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(Utils.isAbsentReflectOptional(boolClass.getSuper())).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1300
     * @tc.name testClassGetSuper013
     * @tc.desc Verify ClassGetSuper case 013: Class.from<FixedArray<int>>(), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrClass = Class.from<FixedArray<int>>()
      let arrSuper = arrClass.getSuper()
      expect(arrSuper !== null).assertTrue()
      expect(arrSuper!.getName()).assertEqual("std.core.Object")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1400
     * @tc.name testClassGetSuper014
     * @tc.desc Verify ClassGetSuper case 014: Class.of(instance), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedArr: FixedArray<int> = [1, 2, 3]
      let clazz = Class.of(fixedArr)
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("std.core.Object")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1500
     * @tc.name testClassGetSuper015
     * @tc.desc Verify ClassGetSuper case 015: Class.from<GenericChild017>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<GenericChild017>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.GenericParent017")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1600
     * @tc.name testClassGetSuper016
     * @tc.desc Verify ClassGetSuper case 016: Class.from<int | string>(), root Class getSuper is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unionClass = Class.from<int | string>()
      let isUnion = unionClass.isUnion()
      expect(isUnion).assertTrue()
      let unionSuper = unionClass.getSuper()
      expect(Utils.isAbsentReflectOptional(unionSuper)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1700
     * @tc.name testClassGetSuper017
     * @tc.desc Verify ClassGetSuper case 017: Class.from<TestEnum019>(), getSuper returns expected parent Class, getName returns "std.core.BaseEnum"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumClass = Class.from<TestEnum019>()
      let enumSuper = enumClass.getSuper()
      expect(enumSuper !== null).assertTrue()
      expect(enumSuper!.getName()).assertEqual("std.core.BaseEnum")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1800
     * @tc.name testClassGetSuper018
     * @tc.desc Verify ClassGetSuper case 018: Class.from<MyClass020>(), isUnion returns false, getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass020>();
      let superClazz = clazz.getSuper();
      expect(clazz.isUnion()).assertFalse();
      expect(superClazz !== null).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1900
     * @tc.name testClassGetSuper019
     * @tc.desc Verify ClassGetSuper case 019: Class.from<MyClass021>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass021>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2000
     * @tc.name testClassGetSuper020
     * @tc.desc Verify ClassGetSuper case 020: Class.from<DynamicClass022>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<DynamicClass022>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2100
     * @tc.name testClassGetSuper021
     * @tc.desc Verify ClassGetSuper case 021: Class.from<FinalClass023>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<FinalClass023>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2200
     * @tc.name testClassGetSuper022
     * @tc.desc Verify ClassGetSuper case 022: Class.from<AbstractClass024>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<AbstractClass024>()
      let superClazz = clazz.getSuper()
      expect(superClazz !== null).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2300
     * @tc.name testClassGetSuper023
     * @tc.desc Verify ClassGetSuper case 023: Class.from<ConcreteClass025>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<ConcreteClass025>()
      let super1 = clazz.getSuper()
      let super2 = super1!.getSuper()
      expect(super1!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.AbstractChild025")
      expect(super2!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.AbstractParent025")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2400
     * @tc.name testClassGetSuper024
     * @tc.desc Verify ClassGetSuper case 024: Class.from<Child026>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<Child026>()
      let superClazz = clazz.getSuper()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.Parent1026")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2500
     * @tc.name testClassGetSuper025
     * @tc.desc Verify ClassGetSuper case 025: Class.from<Level5027>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<Level5027>()
      let current = clazz
      let expectedNames = ["entry.src.main.src.test.class.ClassGetSuperTest.test.Level4027", "entry.src.main.src.test.class.ClassGetSuperTest.test.Level3027", "entry.src.main.src.test.class.ClassGetSuperTest.test.Level2027", "entry.src.main.src.test.class.ClassGetSuperTest.test.Level1027", "std.core.Object"]
      for (let i = 0; i < expectedNames.length; i++) {
        current = current!.getSuper()!
        expect(current!.getName()).assertEqual(expectedNames[i])
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2600
     * @tc.name testClassGetSuper026
     * @tc.desc Verify ClassGetSuper case 026: Class.from<ChildClass028>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<ChildClass028>()
      let superClazz = clazz.getSuper()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass028")
      let interfaces = clazz.getInterfaces()
      expect(interfaces.length).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2700
     * @tc.name testClassGetSuper027
     * @tc.desc Verify ClassGetSuper case 027: Class.from<DerivedClass029>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<DerivedClass029>()
      let superClazz = clazz.getSuper()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.BaseClass029")
      let interfaces = clazz.getInterfaces()
      expect(interfaces.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2800
     * @tc.name testClassGetSuper028
     * @tc.desc Verify ClassGetSuper case 028: Class.from<ChildClass030>(), isSubtypeOf relationship verified, getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass030>()
      let parentClazz = childClazz.getSuper()
      expect(parentClazz !== null).assertTrue()
      expect(childClazz.isSubtypeOf(parentClazz!)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2900
     * @tc.name testClassGetSuper029
     * @tc.desc Verify ClassGetSuper case 029: Class.from<ChildClass031>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass031>()
      let superClazz = childClazz.getSuper()
      let parentName = superClazz!.getName()
      expect(parentName).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.ParentClass031")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3000
     * @tc.name testClassGetSuper030
     * @tc.desc Verify ClassGetSuper case 030: Class.from<ChildClass032>(), getSuper returns expected parent Class, getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass032>()
      let parentClazz = childClazz.getSuper()
      let parentMethods = asInstanceMethodArraySuper(parentClazz!.getInstanceMethods())
      expect(parentMethods.length).assertEqual(1)
      expect(parentMethods[0].getName()).assertEqual("parentMethod")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3100
     * @tc.name testClassGetSuper031
     * @tc.desc Verify ClassGetSuper case 031: Class.from<MyClass033>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass033>()
      let super1 = clazz.getSuper()
      let super2 = clazz.getSuper()
      let super3 = clazz.getSuper()
      expect(super1 !== null).assertTrue()
      expect(super1 === super2).assertTrue()
      expect(super2 === super3).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3200
     * @tc.name testClassGetSuper032
     * @tc.desc Verify ClassGetSuper case 032: Class.from<TestClass034>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let classes: Array<Object> = new Array<Object>()
      for (let i = 0; i < 1000; i++) {
        classes.push(Class.from<TestClass034>())
      }
      let startTime = Date.now()
      for (let i = 0; i < classes.length; i++) {
        let clazz = classes[i] as Class
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
      }
      let endTime = Date.now()
      console.info("1000次getSuper调用耗时: " + (endTime - startTime) + "ms")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3300
     * @tc.name testClassGetSuper033
     * @tc.desc Verify ClassGetSuper case 033: Class.from<UserService035>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let serviceClazz = Class.from<UserService035>()
      let current: Class | undefined = serviceClazz
      let depth = 0
      while (current !== undefined && depth < 100) {
        console.info("依赖层级: " + current!.getName())
        current = current!.getSuper()
        depth++
      }
      expect(serviceClazz.getSuper()!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.BaseService035");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3400
     * @tc.name testClassGetSuper034
     * @tc.desc Verify ClassGetSuper case 034: Class.from<UserModel036>(), getSuper returns expected parent Class, getName returns expected qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let modelClazz = Class.from<UserModel036>()
      let superClazz = modelClazz.getSuper()
      expect(superClazz!.getName()).assertEqual("entry.src.main.src.test.class.ClassGetSuperTest.test.BaseModel036")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3500
     * @tc.name testClassGetSuper035
     * @tc.desc Verify ClassGetSuper case 035: Class.of(instance), getSuper returns expected parent Class, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new Child037()
      let clazz = Class.of(child)
      let current: Class | undefined = clazz
      let serialized: Map<string, string> = new Map<string, string>()
      let depth = 0
      while (current !== undefined && depth < 100) {
        let fields = asInstanceFieldArraySuper(current!.getInstanceFields())
        let nf = fields.length
        for (let fi = 0; fi < nf; fi++) {
          let field = fields[fi]
          let value = field.getValue(child)
          serialized.set(String(field.getName() ?? ''), (value !== null && value !== undefined) ? String(value) : '')
        }
        current = current!.getSuper()
        depth++
      }
      expect(serialized.get("parentField")).assertEqual("parent")
      expect(serialized.get("childField")).assertEqual("child")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3600
     * @tc.name testClassGetSuper036
     * @tc.desc Verify ClassGetSuper case 036: Class.from<Object>(), root Class getSuper is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objClazz = Class.from<Object>()
      let objSuper = objClazz.getSuper()
      expect(Utils.isAbsentReflectOptional(objSuper)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3700
     * @tc.name testClassGetSuper037
     * @tc.desc Verify ClassGetSuper case 037: Class.from<Set<int>>(), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setClazz = Class.from<Set<int>>()
      let setSuper = setClazz.getSuper()
      expect(setSuper !== null).assertTrue()
      expect(setSuper!.getName()).assertEqual("std.core.Object")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3800
     * @tc.name testClassGetSuper038
     * @tc.desc Verify ClassGetSuper case 038: Class.from<Map<string, int>>(), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapClazz = Class.from<Map<string, int>>();
      let mapSuper = mapClazz.getSuper();
      expect(mapSuper !== null).assertTrue();
      expect(mapSuper!.getName()).assertEqual("std.core.Object");

      let arrayClazz = Class.from<Array<int>>();
      let arraySuper = arrayClazz.getSuper();
      expect(arraySuper !== null).assertTrue();
      expect(arraySuper!.getName()).assertEqual("std.core.Object");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3900
     * @tc.name testClassGetSuper039
     * @tc.desc Verify ClassGetSuper case 039: getSuper returns expected parent Class, getName returns "void"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let voidClazz = Class.PRIMITIVE_VOID
      let voidSuper = voidClazz.getSuper()
      expect(voidClazz.getName()).assertEqual("void")
      expect(voidSuper === voidClazz.getSuper()).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_4000
     * @tc.name testClassGetSuper040
     * @tc.desc Verify ClassGetSuper case 040: Class.from<Promise<string>>(), getSuper returns std.core.Object, getName returns "std.core.Object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetSuper040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promiseClazz = Class.from<Promise<string>>()
      let promiseSuper = promiseClazz.getSuper()
      expect(promiseSuper !== null).assertTrue()
      expect(promiseSuper!.getName()).assertEqual("std.core.Object")
    });

  });
}

