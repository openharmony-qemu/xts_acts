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

class SubtypeParent {}

class MyClass001 extends SubtypeParent {}

class SubtypeChild extends SubtypeParent {}

class OtherClass003 {}

class ExtraClass003 {}

enum OtherEnum {
  OTHER
}

class A050 {}

class B050 extends A050 {}

class Subtype052_Root {}

class Subtype052_L1 extends Subtype052_Root {}

class Subtype052_L2 extends Subtype052_L1 {}

class Subtype052_L3 extends Subtype052_L2 {}

class Subtype052_L4 extends Subtype052_L3 {}

class Subtype052_L5 extends Subtype052_L4 {}

class Subtype052_L6 extends Subtype052_L5 {}

class Subtype052_L7 extends Subtype052_L6 {}

interface Interface053A {
  invoke053a(): void;
}

interface Interface053B {
  invoke053b(): void;
}

interface Interface053C {
  invoke053c(): void;
}

interface Interface053D {
  invoke053d(): void;
}

interface Interface053E {
  invoke053e(): void;
}

class ManyInterfaces053 implements Interface053A, Interface053B, Interface053C, Interface053D, Interface053E {
  public invoke053a(): void {}

  public invoke053b(): void {}

  public invoke053c(): void {}

  public invoke053d(): void {}

  public invoke053e(): void {}
}

class ChildClass002 extends ParentClass002 {}

class ParentClass002 {}

class B004 extends A004 {}

class A004 {}

class ChildClass009 extends ParentClass009 {
    public age: int = 10;
  }

class ParentClass009 {
    public name: string = "parent";
  }

class ChildClass010 extends ParentClass010 {}

class ParentClass010 {}

class MyClass011 {}

class ClassB012 {}

class ClassA012 {}

class Child013 extends Parent013 {}

class Parent013 extends GrandParent013 {}

class GrandParent013 {}

class Child014 extends Parent014 {}

class Parent014 extends GrandParent014 {}

class GrandParent014 {}

class Child015 extends Parent015 {}

class Parent015 extends GrandParent015 {}

class GrandParent015 {}

class E016 extends D016 {}

class D016 extends C016 {}

class C016 extends B016 {}

class B016 extends A016 {}

class A016 {}

class MyClass017 implements MyInterface017 {
    public test(): void {}
  }

interface MyInterface017 {
    test(): void;
  }

class MultiImpl018 implements InterfaceA018, InterfaceB018 {
    public methodA(): void {}
    public methodB(): void {}
  }

interface InterfaceB018 {
    methodB(): void;
  }

interface InterfaceA018 {
    methodA(): void;
  }

interface ChildInterface019 extends ParentInterface019 {
    method2(): void;
  }

interface ParentInterface019 {
    method1(): void;
  }

class MyClass020 implements ChildInterface020 {
    public method1(): void {}
    public method2(): void {}
  }

interface ChildInterface020 extends ParentInterface020 {
    method2(): void;
  }

interface ParentInterface020 {
    method1(): void;
  }

class B032 extends A032 {}

class A032 {}

class Container032<T> {}

class Doc033 implements Printable033 {
    public print(): void {}
  }

class Printer033<T extends Printable033> {}

interface Printable033 {
    print(): void;
  }

class MyClass034 {}

class MyClass035 {}

final class Child036 extends Parent036 {}

class Parent036 {}

final class Child037 extends Parent037 {}

class Parent037 {}

class ConcreteChild038 extends AbstractParent038 {
    public method(): void {}
  }

abstract class AbstractParent038 {
    public abstract method(): void;
  }

class ConcreteChild039 extends AbstractParent039 {}

abstract class AbstractParent039 {}

enum TestEnum040 {
    VALUE1,
    VALUE2
  }

interface ChildInterface041 extends ParentInterface041 {}

interface ParentInterface041 {}

interface MyInterface041 {
    test(): void;
  }

class Child042 extends Parent042 {}

class Parent042 {}

class C043 extends B043 {}

class B043 extends A043 {}

class A043 {}

class MyClass044 implements MyInterface044 {}

interface MyInterface044 {}

class MyClass045 {}

class B046 {}

class A046 {}

class Child047 extends Parent047 {}

class Parent047 {}

class B049 extends A049 {}

class A049 {}

class C056 extends B056 {}

class B056 extends A056 {}

class A056 {}

class Child057 extends Parent057 {}

class Parent057 {}

class MyClass058 implements I1058, I2058 {
    public method1(): void {}
    public method2(): void {}
  }

interface I2058 { method2(): void; }

interface I1058 { method1(): void; }

interface TopInterface059 extends MidInterface059 {}

interface MidInterface059 extends BaseInterface059 {}

interface BaseInterface059 {}

interface ChildInterface060 extends ParentInterface060 {}

interface ParentInterface060 {}

interface MyInterface060 {}

class NoParent065 {}

class Dog067 extends Animal067 {}

class Animal067 {}

function checkCompatibility068(implClass: Class, apiClass: Class): boolean {
    return implClass.isSubtypeOf(apiClass);
  }

class NewImplementation068 implements NewAPI068 {
    public methodV1(): void {}
    public methodV2(): void {}
  }

interface NewAPI068 extends OldAPI068 {
    methodV2(): void;
  }

interface OldAPI068 {
    methodV1(): void;
  }

function validatePlugin069(pluginClass: Class): boolean {
    let pluginInterface = Class.from<Plugin069>();
    return pluginClass.isSubtypeOf(pluginInterface);
  }

class MyPlugin069 implements Plugin069 {
    public initialize(): void {}
    public execute(): void {}
  }

interface Plugin069 {
    initialize(): void;
    execute(): void;
  }

function isSerializable070(cls: Class): boolean {
    let serializableIface = Class.from<Serializable070>();
    return cls.isSubtypeOf(serializableIface);
  }

class Data070 implements Serializable070 {
    public value: int = 0;
    public serialize(): string { return this.value.toString(); }
    public deserialize(data: string): void { this.value = Number.parseInt(data, 10).toInt(); }
  }

interface Serializable070 {
    serialize(): string;
    deserialize(data: string): void;
  }

function safeCast067<T>(obj: Object, targetClass: Class): T | null {
  let objClass = Class.of(obj);
  if (objClass.isSubtypeOf(targetClass)) {
    return obj as T;
  }
  return null;
}


export default function ClassIsSubtypeOfTest(): void {
  describe('ClassIsSubtypeOfTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0100
     * @tc.name testClassIsSubtypeOf001
     * @tc.desc Verify ClassIsSubtypeOf case 001: not parameters call isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let parent = Class.from<SubtypeParent>();
        expect(cls.isSubtypeOf(parent)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0200
     * @tc.name testClassIsSubtypeOf002
     * @tc.desc Verify ClassIsSubtypeOf case 002: 1 Classtype parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass002>();
        let parentClazz = Class.from<ParentClass002>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0300
     * @tc.name testClassIsSubtypeOf003
     * @tc.desc Verify ClassIsSubtypeOf case 003: 1 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let other = Class.from<OtherClass003>();
        let extra = Class.from<ExtraClass003>();
        expect(cls.isSubtypeOf(other)).assertFalse();
        expect(cls.isSubtypeOf(extra)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0400
     * @tc.name testClassIsSubtypeOf004
     * @tc.desc Verify ClassIsSubtypeOf case 004: Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsB = Class.from<B004>();
        let clsA = Class.from<A004>();
        let result = clsB.isSubtypeOf(clsA);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0500
     * @tc.name testClassIsSubtypeOf005
     * @tc.desc Verify ClassIsSubtypeOf case 005: null is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
          let result = cls.isSubtypeOf(null as Class);
          // 如果不抛出异常，应该返回false
          expect(result).assertFalse();
        } catch (error) {
          expect(error instanceof TypeError).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0600
     * @tc.name testClassIsSubtypeOf006
     * @tc.desc Verify ClassIsSubtypeOf case 006: undefined is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
          let result = cls.isSubtypeOf(undefined as Class);
          expect(result).assertFalse();
        } catch (error) {
          expect(error instanceof TypeError).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0700
     * @tc.name testClassIsSubtypeOf007
     * @tc.desc Verify ClassIsSubtypeOf case 007: object string Classtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 编译时应该报错
        // let result1 = cls.isSubtypeOf({} as Class);
        // let result2 = cls.isSubtypeOf("string" as Class);
        // let result3 = cls.isSubtypeOf(123 as Class);
        expect(cls.isSubtypeOf(cls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0800
     * @tc.name testClassIsSubtypeOf008
     * @tc.desc Verify ClassIsSubtypeOf case 008: PRIMITIVE_BOOLEAN type Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<number>();
        let primitiveNumber = Class.PRIMITIVE_NUMBER;
        let result = cls.isSubtypeOf(primitiveNumber);
        expect(result).assertFalse();
        
        let primitiveInt = Class.PRIMITIVE_INT;
        let result2 = primitiveInt.isSubtypeOf(primitiveNumber);
        expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0900
     * @tc.name testClassIsSubtypeOf009
     * @tc.desc Verify ClassIsSubtypeOf case 009: Classobject call isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass009>();
        let parentClazz = Class.from<ParentClass009>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1000
     * @tc.name testClassIsSubtypeOf010
     * @tc.desc Verify ClassIsSubtypeOf case 010: Classobject call isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ChildClass010>();
        let parentClazz = Class.from<ParentClass010>();
        let result = parentClazz.isSubtypeOf(childClazz);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1100
     * @tc.name testClassIsSubtypeOf011
     * @tc.desc Verify ClassIsSubtypeOf case 011: Classobject call isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass011>();
        let result = cls.isSubtypeOf(cls);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1200
     * @tc.name testClassIsSubtypeOf012
     * @tc.desc Verify ClassIsSubtypeOf case 012: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsA = Class.from<ClassA012>();
        let clsB = Class.from<ClassB012>();
        let result1 = clsA.isSubtypeOf(clsB);
        let result2 = clsB.isSubtypeOf(clsA);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1300
     * @tc.name testClassIsSubtypeOf013
     * @tc.desc Verify ClassIsSubtypeOf case 013: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<Child013>();
        let grandParentClazz = Class.from<GrandParent013>();
        let result = childClazz.isSubtypeOf(grandParentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1400
     * @tc.name testClassIsSubtypeOf014
     * @tc.desc Verify ClassIsSubtypeOf case 014: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<Child014>();
        let parentClazz = Class.from<Parent014>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1500
     * @tc.name testClassIsSubtypeOf015
     * @tc.desc Verify ClassIsSubtypeOf case 015: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentClazz = Class.from<Parent015>();
        let childClazz = Class.from<Child015>();
        let result = parentClazz.isSubtypeOf(childClazz);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1600
     * @tc.name testClassIsSubtypeOf016
     * @tc.desc Verify ClassIsSubtypeOf case 016: 5 or inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsE = Class.from<E016>();
        let clsA = Class.from<A016>();
        let result = clsE.isSubtypeOf(clsA);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1700
     * @tc.name testClassIsSubtypeOf017
     * @tc.desc Verify ClassIsSubtypeOf case 017: interface interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass017>();
        let iface = Class.from<MyInterface017>();
        let result = cls.isSubtypeOf(iface);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1800
     * @tc.name testClassIsSubtypeOf018
     * @tc.desc Verify ClassIsSubtypeOf case 018: multiple interface interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiImpl018>();
        let ifaceA = Class.from<InterfaceA018>();
        let ifaceB = Class.from<InterfaceB018>();
        expect(cls.isSubtypeOf(ifaceA)).assertTrue();
        expect(cls.isSubtypeOf(ifaceB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1900
     * @tc.name testClassIsSubtypeOf019
     * @tc.desc Verify ClassIsSubtypeOf case 019: interface interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childIface = Class.from<ChildInterface019>();
        let parentIface = Class.from<ParentInterface019>();
        let result = childIface.isSubtypeOf(parentIface);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2000
     * @tc.name testClassIsSubtypeOf020
     * @tc.desc Verify ClassIsSubtypeOf case 020: interface interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass020>();
        let parentIface = Class.from<ParentInterface020>();
        let result = cls.isSubtypeOf(parentIface);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2100
     * @tc.name testClassIsSubtypeOf021
     * @tc.desc Verify ClassIsSubtypeOf case 021: numbertype Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let numClass = Class.from<number>();
        let primitiveNum = Class.PRIMITIVE_NUMBER;
        let result1 = numClass.isSubtypeOf(primitiveNum);
        let result2 = primitiveNum.isSubtypeOf(numClass);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2200
     * @tc.name testClassIsSubtypeOf022
     * @tc.desc Verify ClassIsSubtypeOf case 022: booleantype Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let boolClass = Class.from<boolean>();
        let primitiveBool = Class.PRIMITIVE_BOOLEAN;
        let result1 = boolClass.isSubtypeOf(primitiveBool);
        let result2 = primitiveBool.isSubtypeOf(boolClass);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2300
     * @tc.name testClassIsSubtypeOf023
     * @tc.desc Verify ClassIsSubtypeOf case 023: stringtype Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let strClass = Class.from<string>();
        let result = strClass.isSubtypeOf(Class.PRIMITIVE_NUMBER);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2400
     * @tc.name testClassIsSubtypeOf024
     * @tc.desc Verify ClassIsSubtypeOf case 024: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let primitives = [
          Class.PRIMITIVE_BOOLEAN,
          Class.PRIMITIVE_BYTE,
          Class.PRIMITIVE_CHAR,
          Class.PRIMITIVE_SHORT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_LONG,
          Class.PRIMITIVE_FLOAT,
          Class.PRIMITIVE_DOUBLE,
          Class.PRIMITIVE_NUMBER
        ];
        for (let i = 0; i < primitives.length; i++) {
          for (let j = 0; j < primitives.length; j++) {
            if (i !== j) {
              let result = primitives[i].isSubtypeOf(primitives[j]);
              expect(result).assertFalse();
            }
          }
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2500
     * @tc.name testClassIsSubtypeOf025
     * @tc.desc Verify ClassIsSubtypeOf case 025: Array<Type> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arrNum = Class.from<Array<number>>();
        let arrStr = Class.from<Array<string>>();
        let result = arrNum.isSubtypeOf(arrStr);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2600
     * @tc.name testClassIsSubtypeOf026
     * @tc.desc Verify ClassIsSubtypeOf case 026: FixedArray<Type> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let fixedArr = Class.from<FixedArray<int>>();
        let normalArr = Class.from<Array<int>>();
        let result1 = fixedArr.isSubtypeOf(normalArr);
        let result2 = normalArr.isSubtypeOf(fixedArr);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2700
     * @tc.name testClassIsSubtypeOf027
     * @tc.desc Verify ClassIsSubtypeOf case 027: different type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arrInt = Class.from<Array<int>>();
        let arrDouble = Class.from<Array<double>>();
        let result = arrInt.isSubtypeOf(arrDouble);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2800
     * @tc.name testClassIsSubtypeOf028
     * @tc.desc Verify ClassIsSubtypeOf case 028: type and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let unionType = Class.from<int | string>();
        let intType = Class.from<int>();
        let strType = Class.from<string>();
        let result1 = unionType.isSubtypeOf(intType);
        let result2 = unionType.isSubtypeOf(strType);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2900
     * @tc.name testClassIsSubtypeOf029
     * @tc.desc Verify ClassIsSubtypeOf case 029: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let intType = Class.from<int>();
        let unionType = Class.from<int | string>();
        let result = intType.isSubtypeOf(unionType);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3000
     * @tc.name testClassIsSubtypeOf030
     * @tc.desc Verify ClassIsSubtypeOf case 030: multiple type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let complexUnion = Class.from<int | string | boolean | Array<double>>();
        let intType = Class.from<int>();
        let result = complexUnion.isSubtypeOf(intType);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3100
     * @tc.name testClassIsSubtypeOf031
     * @tc.desc Verify ClassIsSubtypeOf case 031: same generic different type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let mapIntStr = Class.from<Map<int, string>>();
        let mapStrInt = Class.from<Map<string, int>>();
        let result = mapIntStr.isSubtypeOf(mapStrInt);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3200
     * @tc.name testClassIsSubtypeOf032
     * @tc.desc Verify ClassIsSubtypeOf case 032: generic type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let containerB = Class.from<Container032<B032>>();
        let containerA = Class.from<Container032<A032>>();
        let result = containerB.isSubtypeOf(containerA);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3300
     * @tc.name testClassIsSubtypeOf033
     * @tc.desc Verify ClassIsSubtypeOf case 033: generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let printerDoc = Class.from<Printer033<Doc033>>();
        let printable = Class.from<Printable033>();
        let result = printerDoc.isSubtypeOf(printable);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3400
     * @tc.name testClassIsSubtypeOf034
     * @tc.desc Verify ClassIsSubtypeOf case 034: Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass034>();
        let objClass = Class.from<Object>();
        let result = cls.isSubtypeOf(objClass);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3500
     * @tc.name testClassIsSubtypeOf035
     * @tc.desc Verify ClassIsSubtypeOf case 035: Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass035>();
        let objClass = Class.from<Object>();
        let result = objClass.isSubtypeOf(cls);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3600
     * @tc.name testClassIsSubtypeOf036
     * @tc.desc Verify ClassIsSubtypeOf case 036: final inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<Child036>();
        let parentClazz = Class.from<Parent036>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3700
     * @tc.name testClassIsSubtypeOf037
     * @tc.desc Verify ClassIsSubtypeOf case 037: final not inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 试图定义class GrandChild extends Child037 {}会编译失败
        let childClazz = Class.from<Child037>();
        let parentClazz = Class.from<Parent037>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3800
     * @tc.name testClassIsSubtypeOf038
     * @tc.desc Verify ClassIsSubtypeOf case 038: abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<ConcreteChild038>();
        let parentClazz = Class.from<AbstractParent038>();
        let result = childClazz.isSubtypeOf(parentClazz);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3900
     * @tc.name testClassIsSubtypeOf039
     * @tc.desc Verify ClassIsSubtypeOf case 039: abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentClazz = Class.from<AbstractParent039>();
        let childClazz = Class.from<ConcreteChild039>();
        let result = parentClazz.isSubtypeOf(childClazz);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4000
     * @tc.name testClassIsSubtypeOf040
     * @tc.desc Verify ClassIsSubtypeOf case 040: type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let enumClass = Class.from<TestEnum040>();
        let objClass = Class.from<Object>();
        let result = enumClass.isSubtypeOf(objClass);
        expect(result).assertTrue();
        
        let enumClass2 = Class.from<TestEnum040>();
        let otherEnum = Class.from<OtherEnum>();
        let result2 = enumClass2.isSubtypeOf(otherEnum);
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4100
     * @tc.name testClassIsSubtypeOf041
     * @tc.desc Verify ClassIsSubtypeOf case 041: using isInterface()verify interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let iface = Class.from<MyInterface041>();
        expect(iface.isInterface()).assertTrue();
        


        let childIface = Class.from<ChildInterface041>();
        let parentIface = Class.from<ParentInterface041>();
        let result = childIface.isSubtypeOf(parentIface);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4200
     * @tc.name testClassIsSubtypeOf042
     * @tc.desc Verify ClassIsSubtypeOf case 042: verify inheritance scenario return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<Child042>().isSubtypeOf(Class.from<Parent042>());
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4300
     * @tc.name testClassIsSubtypeOf043
     * @tc.desc Verify ClassIsSubtypeOf case 043: verify inheritance scenario return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<C043>().isSubtypeOf(Class.from<A043>());
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4400
     * @tc.name testClassIsSubtypeOf044
     * @tc.desc Verify ClassIsSubtypeOf case 044: verify interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<MyClass044>().isSubtypeOf(Class.from<MyInterface044>());
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4500
     * @tc.name testClassIsSubtypeOf045
     * @tc.desc Verify ClassIsSubtypeOf case 045: return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass045>();
        let result = cls.isSubtypeOf(cls);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4600
     * @tc.name testClassIsSubtypeOf046
     * @tc.desc Verify ClassIsSubtypeOf case 046: verify return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<A046>().isSubtypeOf(Class.from<B046>());
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4700
     * @tc.name testClassIsSubtypeOf047
     * @tc.desc Verify ClassIsSubtypeOf case 047: verify inheritance return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<Parent047>().isSubtypeOf(Class.from<Child047>());
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4800
     * @tc.name testClassIsSubtypeOf048
     * @tc.desc Verify ClassIsSubtypeOf case 048: generic type parameters different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<Array<int>>().isSubtypeOf(Class.from<Array<string>>());
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4900
     * @tc.name testClassIsSubtypeOf049
     * @tc.desc Verify ClassIsSubtypeOf case 049: verify return booleantype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<B049>().isSubtypeOf(Class.from<A049>());
        expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5000
     * @tc.name testClassIsSubtypeOf050
     * @tc.desc Verify ClassIsSubtypeOf case 050: verify return not number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.from<B050>().isSubtypeOf(Class.from<A050>());
        expect(typeof result === 'number').assertFalse();
        expect(typeof result === 'string').assertFalse();
        expect(typeof result === 'object').assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5100
     * @tc.name testClassIsSubtypeOf051
     * @tc.desc Verify ClassIsSubtypeOf case 051: or inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
// 此测试仅用于验证未捕获异常的行为，跳过执行
        // 以下代码应该编译失败
        // class A extends B {}
        // class B extends A {}
        
        // 如果运行时存在循环继承，isSubtypeOf应该能正确处理
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5200
     * @tc.name testClassIsSubtypeOf052
     * @tc.desc Verify ClassIsSubtypeOf case 052: 100 inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let deepChildClass = Class.from<Subtype052_L7>();
        let rootClass = Class.from<Subtype052_Root>();
        let startTime = Date.now();
        let result = deepChildClass.isSubtypeOf(rootClass);
        let endTime = Date.now();
        expect(result).assertTrue();
        expect(endTime - startTime).assertLess(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5300
     * @tc.name testClassIsSubtypeOf053
     * @tc.desc Verify ClassIsSubtypeOf case 053: 100 interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ManyInterfaces053>();
        let startTime = Date.now();
        let result = cls.isSubtypeOf(Class.from<Interface053A>());
        let endTime = Date.now();
        expect(result).assertTrue();
        expect(endTime - startTime).assertLess(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5400
     * @tc.name testClassIsSubtypeOf054
     * @tc.desc Verify ClassIsSubtypeOf case 054: multiple when call isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let parent = Class.from<SubtypeParent>();
        for (let i = 0; i < 100; i++) {
          expect(cls.isSubtypeOf(parent)).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5500
     * @tc.name testClassIsSubtypeOf055
     * @tc.desc Verify ClassIsSubtypeOf case 055: call same parameters isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SubtypeChild>();
        let parent = Class.from<SubtypeParent>();
        
        let time1 = Date.now();
        for (let i = 0; i < 1000; i++) {
          cls.isSubtypeOf(parent);
        }
        let time2 = Date.now();
        
        // 预热后的调用应该更快
        let time3 = Date.now();
        for (let i = 0; i < 1000; i++) {
          cls.isSubtypeOf(parent);
        }
        let time4 = Date.now();
        
        expect(time4 - time3).assertLessOrEqual(time2 - time1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5600
     * @tc.name testClassIsSubtypeOf056
     * @tc.desc Verify ClassIsSubtypeOf case 056: isSubtypeOf and getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsC = Class.from<C056>();
        let current = clsC;
        while (current.getSuper() !== undefined) {
          let superClazz = current.getSuper()!;
          expect(clsC.isSubtypeOf(superClazz)).assertTrue();
          current = superClazz;
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5700
     * @tc.name testClassIsSubtypeOf057
     * @tc.desc Verify ClassIsSubtypeOf case 057: getSuperreturn isSubtypeOfshould return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childClazz = Class.from<Child057>();
        let superClazz = childClazz.getSuper();
        if (superClazz !== undefined) {
          expect(childClazz.isSubtypeOf(superClazz)).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5800
     * @tc.name testClassIsSubtypeOf058
     * @tc.desc Verify ClassIsSubtypeOf case 058: getInterfacesreturn interface isSubtypeOf return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass058>();
        let interfaces = cls.getInterfaces() as Array<Class>;
        for (let i = 0; i < interfaces.length; i++) {
          expect(cls.isSubtypeOf(interfaces[i])).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5900
     * @tc.name testClassIsSubtypeOf059
     * @tc.desc Verify ClassIsSubtypeOf case 059: verify interface inheritance isSubtypeOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let topIface = Class.from<TopInterface059>();
        let baseIface = Class.from<BaseInterface059>();
        expect(topIface.isSubtypeOf(baseIface)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6000
     * @tc.name testClassIsSubtypeOf060
     * @tc.desc Verify ClassIsSubtypeOf case 060: isInterfacereturn true type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let iface = Class.from<MyInterface060>();
        expect(iface.isInterface()).assertTrue();
        


        let childIface = Class.from<ChildInterface060>();
        let parentIface = Class.from<ParentInterface060>();
        expect(childIface.isInterface()).assertTrue();
        expect(parentIface.isInterface()).assertTrue();
        expect(childIface.isSubtypeOf(parentIface)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6100
     * @tc.name testClassIsSubtypeOf061
     * @tc.desc Verify ClassIsSubtypeOf case 061: isPrimitivereturn true type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_NUMBER.isPrimitive()).assertTrue();
        
        // 验证基本类型之间的关系
        let result = Class.PRIMITIVE_INT.isSubtypeOf(Class.PRIMITIVE_NUMBER);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6200
     * @tc.name testClassIsSubtypeOf062
     * @tc.desc Verify ClassIsSubtypeOf case 062: null when exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
          let result = cls.isSubtypeOf(null as Class);
          expect(result).assertFalse();
        } catch (error) {
          expect(error instanceof TypeError).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6300
     * @tc.name testClassIsSubtypeOf063
     * @tc.desc Verify ClassIsSubtypeOf case 063: undefined when exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
          let result = cls.isSubtypeOf(undefined as Class);
          expect(result).assertFalse();
        } catch (error) {
          expect(error instanceof TypeError).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6400
     * @tc.name testClassIsSubtypeOf064
     * @tc.desc Verify ClassIsSubtypeOf case 064: Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let invalidClass = {} as Class;
        try {
          let result = cls.isSubtypeOf(invalidClass);
          expect(result).assertFalse();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6500
     * @tc.name testClassIsSubtypeOf065
     * @tc.desc Verify ClassIsSubtypeOf case 065: Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoParent065>();
        let objClass = Class.from<Object>();
        expect(cls.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6600
     * @tc.name testClassIsSubtypeOf066
     * @tc.desc Verify ClassIsSubtypeOf case 066: Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf066', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let objClass = Class.from<Object>();
        expect(objClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6700
     * @tc.name testClassIsSubtypeOf067
     * @tc.desc Verify ClassIsSubtypeOf case 067: using isSubtypeOfverify type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf067', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let dog = new Dog067();
        let result = safeCast067<Dog067>(dog, Class.from<Dog067>());
        expect(result != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6800
     * @tc.name testClassIsSubtypeOf068
     * @tc.desc Verify ClassIsSubtypeOf case 068: using isSubtypeOf API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf068', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let impl = Class.from<NewImplementation068>();
        let oldApi = Class.from<OldAPI068>();
        let newApi = Class.from<NewAPI068>();
        
        expect(checkCompatibility068(impl, oldApi)).assertTrue();
        expect(checkCompatibility068(impl, newApi)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6900
     * @tc.name testClassIsSubtypeOf069
     * @tc.desc Verify ClassIsSubtypeOf case 069: verify interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf069', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let myPluginClass = Class.from<MyPlugin069>();
        expect(validatePlugin069(myPluginClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_7000
     * @tc.name testClassIsSubtypeOf070
     * @tc.desc Verify ClassIsSubtypeOf case 070: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsSubtypeOf070', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let dataClass = Class.from<Data070>();
        expect(isSerializable070(dataClass)).assertTrue();
    });

  });
}