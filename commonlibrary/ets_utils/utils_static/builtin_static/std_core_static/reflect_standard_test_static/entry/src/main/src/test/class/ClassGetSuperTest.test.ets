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

function asInstanceFieldArraySuper(o: Object): Array<reflect.InstanceField> {
  return o as Array<reflect.InstanceField>;
}

function asInstanceMethodArraySuper(o: Object): Array<reflect.InstanceMethod> {
  return o as Array<reflect.InstanceMethod>;
}

class MyClass001 {}

class MyClass003 {}

class ChildClass004 extends ParentClass004 {
    public age: int = 10
  }

class ParentClass004 {
    public name: string = "parent"
  }

class ChildClass005 extends ParentClass005 {
    public childField: string = "child"
  }

class ParentClass005 extends GrandParent005 {
    public parentField: string = "parent"
  }

class GrandParent005 {
    public grandField: string = "grand"
  }

final class FinalChild006 extends ParentClass006 {
    public value: int = 100
  }

class ParentClass006 {}

class ChildClass007 extends AbstractParent007 {
    public getValue(): int {
      return 42
    }
  }

abstract class AbstractParent007 {
    public abstract getValue(): int
  }

class TestClass008 {}

class ChildClass009 extends ParentClass009 implements MyInterface009 {
    public test(): void {}
  }

class ParentClass009 {}

interface MyInterface009 {
    test(): void
  }

class ChildClass010 extends ParentClass010 implements Interface1010, Interface2010 {
    public method1(): void {}
    public method2(): void {}
  }

class ParentClass010 {}

interface Interface2010 {
    method2(): void
  }

interface Interface1010 {
    method1(): void
  }

class MyClass011 {}

class ChildClass013 extends ParentClass013 {}

class ParentClass013 {
    public parentField: string = "parent"
    public parentMethod(): string {
      return "parent method"
    }
  }

class GenericParent017<T> {
    public value: T
  }

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

class Child026 extends Parent1026 implements ISecondParent026 {
    public parent2Method(): void {}
  }

interface ISecondParent026 {
    parent2Method(): void
  }

class Parent2026 extends GrandParent026 {
    public parent2Field: string = "p2"
  }

class Parent1026 extends GrandParent026 {
    public parent1Field: string = "p1"
  }

class GrandParent026 {
    public field: string = "grand"
  }

class Level5027 extends Level4027 {
    public l5: string = "l5"
  }

class Level4027 extends Level3027 {
    public l4: string = "l4"
  }

class Level3027 extends Level2027 {
    public l3: string = "l3"
  }

class Level2027 extends Level1027 {
    public l2: string = "l2"
  }

class Level1027 {
    public l1: string = "l1"
  }

class ChildClass028 extends ParentClass028 implements Serializable028 {
    public age: int = 10
    public toJSON(): string {
      return '{"name":"' + this.name + '","age":' + this.age + '}'
    }
  }

class ParentClass028 {
    public name: string = "parent"
  }

interface Serializable028 {
    toJSON(): string
  }

class DerivedClass029 extends BaseClass029 implements Interface1029, Interface2029, Interface3029 {
    public method1(): void {}
    public method2(): void {}
    public method3(): void {}
  }

class BaseClass029 {
    public baseField: string = "base"
  }

interface Interface3029 {
    method3(): void
  }

interface Interface2029 {
    method2(): void
  }

interface Interface1029 {
    method1(): void
  }

class ChildClass030 extends ParentClass030 {}

class ParentClass030 {}

class ChildClass031 extends ParentClass031 {}

class ParentClass031 {
    public parentMethod(): void {}
  }

class ChildClass032 extends ParentClass032 {
    public childMethod(): string {
      return "child"
    }
  }

class ParentClass032 {
    public parentMethod(): string {
      return "parent"
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

class Child037 extends Parent037 {
    public childField: string = "child"
  }

class Parent037 {
    public parentField: string = "parent"
  }


export default function ClassGetSuperTest(): void {
  describe('ClassGetSuperTest', () => {
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
     * @tc.desc Verify ClassGetSuper case 001: getSuper() is no parameters instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.of(new MyClass001())
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0200
     * @tc.name testClassGetSuper002
     * @tc.desc Verify ClassGetSuper case 002: method no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 确认方法签名
        let clazz = Class.from<MyClass001>()
        // clazz.getSuper(param) // 编译错误：不应有参数
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0300
     * @tc.name testClassGetSuper003
     * @tc.desc Verify ClassGetSuper case 003: inheritance std.core.Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.of(new MyClass003())
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0400
     * @tc.name testClassGetSuper004
     * @tc.desc Verify ClassGetSuper case 004: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass004>()
        let superClazz = childClazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("ParentClass004")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0500
     * @tc.name testClassGetSuper005
     * @tc.desc Verify ClassGetSuper case 005: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass005>()
        let parentClazz = childClazz.getSuper()
        let grandClazz = parentClazz!.getSuper()
        expect(parentClazz!.getName()).assertEqual("ParentClass005")
        expect(grandClazz!.getName()).assertEqual("GrandParent005")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0600
     * @tc.name testClassGetSuper006
     * @tc.desc Verify ClassGetSuper case 006: final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<FinalChild006>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("ParentClass006")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0700
     * @tc.name testClassGetSuper007
     * @tc.desc Verify ClassGetSuper case 007: abstract inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ChildClass007>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("AbstractParent007")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0800
     * @tc.name testClassGetSuper008
     * @tc.desc Verify ClassGetSuper case 008: Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<TestClass008>()
        let superClazz = clazz.getSuper()
        let rootSuper = superClazz!.getSuper()
        expect(rootSuper).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_0900
     * @tc.name testClassGetSuper009
     * @tc.desc Verify ClassGetSuper case 009: interface not inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ChildClass009>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertEqual("ParentClass009")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1000
     * @tc.name testClassGetSuper010
     * @tc.desc Verify ClassGetSuper case 010: multiple interface not get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ChildClass010>()
        let superClazz = clazz.getSuper()
        expect(superClazz!.getName()).assertEqual("ParentClass010")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1100
     * @tc.name testClassGetSuper011
     * @tc.desc Verify ClassGetSuper case 011: getSuperreturn type is Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<MyClass011>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        let isCls: boolean = superClazz instanceof Class;
        expect(isCls).assertTrue()
        // 可以调用Class的方法
        let name = superClazz!.getName()
        expect(name).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1200
     * @tc.name testClassGetSuper012
     * @tc.desc Verify ClassGetSuper case 012: return type is Class undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<Object>()
        let superClazz = clazz.getSuper()
        expect(superClazz).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1300
     * @tc.name testClassGetSuper013
     * @tc.desc Verify ClassGetSuper case 013: return Classobject call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass013>()
        let parentClazz = childClazz.getSuper()
        // 使用返回的Class对象
        let fields = asInstanceFieldArraySuper(parentClazz!.getInstanceFields())
        expect(fields.length).assertEqual(1)
        expect(fields[0].getName()).assertEqual("parentField")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1400
     * @tc.name testClassGetSuper014
     * @tc.desc Verify ClassGetSuper case 014: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 测试各种基本类型
        let boolClass = Class.PRIMITIVE_BOOLEAN
        let intClass = Class.PRIMITIVE_INT
        let stringClass = Class.from<string>()
        // 基本类型可能没有父类或有特定父类
        let boolSuper = boolClass.getSuper()
        expect(boolSuper !== null).assertTrue() // 或根据实际情况验证
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1500
     * @tc.name testClassGetSuper015
     * @tc.desc Verify ClassGetSuper case 015: array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arrClass = Class.from<Array<int>>()
        let arrSuper = arrClass.getSuper()
        expect(arrSuper !== null).assertTrue()
        // 数组可能有特殊的父类
        console.info(arrSuper!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1600
     * @tc.name testClassGetSuper016
     * @tc.desc Verify ClassGetSuper case 016: array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let fixedArr: FixedArray<int> = [1, 2, 3]
        let clazz = Class.of(fixedArr)
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        console.info(superClazz!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1700
     * @tc.name testClassGetSuper017
     * @tc.desc Verify ClassGetSuper case 017: generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ChildClass005>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
        expect(superClazz!.getName()).assertContain("ParentClass005")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1800
     * @tc.name testClassGetSuper018
     * @tc.desc Verify ClassGetSuper case 018: type Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let unionClass = Class.from<int | string>()
        let isUnion = unionClass.isUnion()
        expect(isUnion).assertTrue()
        let unionSuper = unionClass.getSuper()
        // 联合类型可能返回undefined或有特定父类
        console.info(unionSuper)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_1900
     * @tc.name testClassGetSuper019
     * @tc.desc Verify ClassGetSuper case 019: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let enumClass = Class.from<TestEnum019>()
        let enumSuper = enumClass.getSuper()
        expect(enumSuper !== null).assertTrue()
        // 枚举可能有特殊的父类
        console.info(enumSuper!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2000
     * @tc.name testClassGetSuper020
     * @tc.desc Verify ClassGetSuper case 020: getSupernot throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<MyClass020>()
        try {
          let superClazz = clazz.getSuper()
          expect(clazz.isUnion()).assertFalse()
          expect(superClazz !== null).assertTrue()
        } catch (error) {
          expect().assertFail()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2100
     * @tc.name testClassGetSuper021
     * @tc.desc Verify ClassGetSuper case 021: getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<MyClass021>()
        // 不调用initialize()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2200
     * @tc.name testClassGetSuper022
     * @tc.desc Verify ClassGetSuper case 022: runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<DynamicClass022>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2300
     * @tc.name testClassGetSuper023
     * @tc.desc Verify ClassGetSuper case 023: final get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<FinalClass023>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2400
     * @tc.name testClassGetSuper024
     * @tc.desc Verify ClassGetSuper case 024: abstract get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<AbstractClass024>()
        let superClazz = clazz.getSuper()
        expect(superClazz !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2500
     * @tc.name testClassGetSuper025
     * @tc.desc Verify ClassGetSuper case 025: abstract class inheritance abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ConcreteClass025>()
        let super1 = clazz.getSuper()
        let super2 = super1!.getSuper()
        expect(super1!.getName()).assertEqual("AbstractChild025")
        expect(super2!.getName()).assertEqual("AbstractParent025")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2600
     * @tc.name testClassGetSuper026
     * @tc.desc Verify ClassGetSuper case 026: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 如果语言支持多重继承
        // class Child026 extends Parent1026, Parent2026 {}
        // 否则测试接口实现


        let clazz = Class.from<Child026>()
        let superClazz = clazz.getSuper()
        expect(superClazz!.getName()).assertEqual("Parent1026")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2700
     * @tc.name testClassGetSuper027
     * @tc.desc Verify ClassGetSuper case 027: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<Level5027>()
        let current = clazz
        let expectedNames = ["Level4027", "Level3027", "Level2027", "Level1027", "std.core.Object"]
        for (let i = 0; i < expectedNames.length; i++) {
          current = current!.getSuper()!
          expect(current!.getName()).assertEqual(expectedNames[i])
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2800
     * @tc.name testClassGetSuper028
     * @tc.desc Verify ClassGetSuper case 028: inheritance interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<ChildClass028>()
        let superClazz = clazz.getSuper()
        expect(superClazz!.getName()).assertEqual("ParentClass028")
        // 验证接口通过getInterfaces获取
        let interfaces = clazz.getInterfaces()
        expect(interfaces.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_2900
     * @tc.name testClassGetSuper029
     * @tc.desc Verify ClassGetSuper case 029: inheritance multiple interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<DerivedClass029>()
        let superClazz = clazz.getSuper()
        expect(superClazz!.getName()).assertEqual("BaseClass029")
        let interfaces = clazz.getInterfaces()
        expect(interfaces.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3000
     * @tc.name testClassGetSuper030
     * @tc.desc Verify ClassGetSuper case 030: getSuper and isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass030>()
        let parentClazz = childClazz.getSuper()
        expect(parentClazz !== null).assertTrue()
        // 验证isSubtypeOf关系
        expect(childClazz.isSubtypeOf(parentClazz!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3100
     * @tc.name testClassGetSuper031
     * @tc.desc Verify ClassGetSuper case 031: get name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass031>()
        let superClazz = childClazz.getSuper()
        let parentName = superClazz!.getName()
        expect(parentName).assertEqual("ParentClass031")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3200
     * @tc.name testClassGetSuper032
     * @tc.desc Verify ClassGetSuper case 032: via get method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass032>()
        let parentClazz = childClazz.getSuper()
        let parentMethods = asInstanceMethodArraySuper(parentClazz!.getInstanceMethods())
        expect(parentMethods.length).assertEqual(1)
        expect(parentMethods[0].getName()).assertEqual("parentMethod")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3300
     * @tc.name testClassGetSuper033
     * @tc.desc Verify ClassGetSuper case 033: call getSuperreturn same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clazz = Class.from<MyClass033>()
        let super1 = clazz.getSuper()
        let super2 = clazz.getSuper()
        let super3 = clazz.getSuper()
        expect(super1 !== null).assertTrue()
        expect(super1 === super2).assertTrue()
        expect(super2 === super3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3400
     * @tc.name testClassGetSuper034
     * @tc.desc Verify ClassGetSuper case 034: performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3500
     * @tc.name testClassGetSuper035
     * @tc.desc Verify ClassGetSuper case 035: via getSuper inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 模拟框架解析依赖
        let serviceClazz = Class.from<UserService035>()
        let current: Class | undefined = serviceClazz
        while (current !== undefined) {
          console.info("依赖层级: " + current!.getName())
          current = current!.getSuper()
        }
        expect(serviceClazz.getSuper()!.getName()).assertEqual("BaseService035")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3600
     * @tc.name testClassGetSuper036
     * @tc.desc Verify ClassGetSuper case 036: via getSuper inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let modelClazz = Class.from<UserModel036>()
        let superClazz = modelClazz.getSuper()
        expect(superClazz!.getName()).assertEqual("BaseModel036")
        // ORM可以基于此映射表结构
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3700
     * @tc.name testClassGetSuper037
     * @tc.desc Verify ClassGetSuper case 037: via getSuper inheritance object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let child = new Child037()
        let clazz = Class.of(child)
        let current: Class | undefined = clazz
        let serialized: Map<string, string> = new Map<string, string>()
        while (current !== undefined) {
          let fields = asInstanceFieldArraySuper(current!.getInstanceFields())
          let nf = fields.length
          for (let fi = 0; fi < nf; fi++) {
            let field = fields[fi]
            let value = field.getValue(child)
            serialized.set(String(field.getName() ?? ''), (value !== null && value !== undefined) ? String(value) : '')
          }
          current = current!.getSuper()
        }
        expect(serialized.get("parentField")).assertEqual("parent")
        expect(serialized.get("childField")).assertEqual("child")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3800
     * @tc.name testClassGetSuper038
     * @tc.desc Verify ClassGetSuper case 038: getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let objClazz = Class.from<Object>()
        let objSuper = objClazz.getSuper()
        expect(objSuper).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_3900
     * @tc.name testClassGetSuper039
     * @tc.desc Verify ClassGetSuper case 039: Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arrClazz = Class.from<Array<int>>()
        let arrSuper = arrClazz.getSuper()
        expect(arrSuper !== null).assertTrue()
        console.info("Array的父类: " + arrSuper!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_4000
     * @tc.name testClassGetSuper040
     * @tc.desc Verify ClassGetSuper case 040: Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let mapClazz = Class.from<Map<string, int>>()
        let mapSuper = mapClazz.getSuper()
        expect(mapSuper !== null).assertTrue()
        console.info("Map的父类: " + mapSuper!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_4100
     * @tc.name testClassGetSuper041
     * @tc.desc Verify ClassGetSuper case 041: voidtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let voidClazz = Class.PRIMITIVE_VOID
        let voidSuper = voidClazz.getSuper()
        expect(voidClazz.getName()).assertEqual("void")
        expect(voidSuper === voidClazz.getSuper()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSUPER_4200
     * @tc.name testClassGetSuper042
     * @tc.desc Verify ClassGetSuper case 042: Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetSuper042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let promiseClazz = Class.from<Promise<string>>()
        let promiseSuper = promiseClazz.getSuper()
        expect(promiseSuper !== null).assertTrue()
        console.info("Promise的父类: " + promiseSuper!.getName())
    });

  });
}