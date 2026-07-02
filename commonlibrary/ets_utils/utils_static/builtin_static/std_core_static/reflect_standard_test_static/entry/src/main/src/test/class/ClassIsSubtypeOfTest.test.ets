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

class ParentClass002 {}

class ChildClass002 extends ParentClass002 {}

class A004 {}

class B004 extends A004 {}

class ParentClass009 {
  public name: string = "parent";
}

class ChildClass009 extends ParentClass009 {
  public age: int = 10;
}

class ParentClass010 {}

class ChildClass010 extends ParentClass010 {}

class MyClass011 {}

class ClassA012 {}

class ClassB012 {}

class GrandParent013 {}

class Parent013 extends GrandParent013 {}

class Child013 extends Parent013 {}

class GrandParent014 {}

class Parent014 extends GrandParent014 {}

class Child014 extends Parent014 {}

class GrandParent015 {}

class Parent015 extends GrandParent015 {}

class Child015 extends Parent015 {}

class A016 {}

class B016 extends A016 {}

class C016 extends B016 {}

class D016 extends C016 {}

class E016 extends D016 {}

interface MyInterface017 {
  test(): void;
}

class MyClass017 implements MyInterface017 {
  public test(): void {}
}

interface InterfaceA018 {
  methodA(): void;
}

interface InterfaceB018 {
  methodB(): void;
}

class MultiImpl018 implements InterfaceA018, InterfaceB018 {
  public methodA(): void {}
  public methodB(): void {}
}

interface ParentInterface019 {
  method1(): void;
}

interface ChildInterface019 extends ParentInterface019 {
  method2(): void;
}

interface ParentInterface020 {
  method1(): void;
}

interface ChildInterface020 extends ParentInterface020 {
  method2(): void;
}

class MyClass020 implements ChildInterface020 {
  public method1(): void {}
  public method2(): void {}
}

class A032 {}

class B032 extends A032 {}

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

/** spec/semantics.md：未在子类型章节描述�?PRIMITIVE 互查应为 false；number≡double �?Type Identity 例外 */
function expectDistinctPrimitiveSubtypeOfSpec024(fromKind: string, toKind: string): boolean {
  if ((fromKind === 'double' && toKind === 'number') || (fromKind === 'number' && toKind === 'double')) {
    return true;
  }
  return false;
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
  public deserialize(data: string): void { this.value = parseInt(data, 10).toInt(); }
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
  describe('ClassIsSubtypeOfTest', (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 001: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let parent = Class.from<SubtypeParent>();
      expect(cls.isSubtypeOf(parent)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0200
     * @tc.name testClassIsSubtypeOf002
     * @tc.desc Verify ClassIsSubtypeOf case 002: Class.from<ChildClass002>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass002>();
      let parentClazz = Class.from<ParentClass002>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0300
     * @tc.name testClassIsSubtypeOf003
     * @tc.desc Verify ClassIsSubtypeOf case 003: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let other = Class.from<OtherClass003>();
      let extra = Class.from<ExtraClass003>();
      expect(cls.isSubtypeOf(other)).assertFalse();
      expect(cls.isSubtypeOf(extra)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0400
     * @tc.name testClassIsSubtypeOf004
     * @tc.desc Verify ClassIsSubtypeOf case 004: Class.from<B004>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsB = Class.from<B004>();
      let clsA = Class.from<A004>();
      let result = clsB.isSubtypeOf(clsA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0500
     * @tc.name testClassIsSubtypeOf005
     * @tc.desc Verify ClassIsSubtypeOf case 005: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let result = cls.isSubtypeOf(null as Class);
        expect(result).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0600
     * @tc.name testClassIsSubtypeOf006
     * @tc.desc Verify ClassIsSubtypeOf case 006: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let result = cls.isSubtypeOf(undefined as Class);
        expect(result).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0700
     * @tc.name testClassIsSubtypeOf007
     * @tc.desc Verify ClassIsSubtypeOf case 007: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      expect(cls.isSubtypeOf(cls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0800
     * @tc.name testClassIsSubtypeOf008
     * @tc.desc Verify ClassIsSubtypeOf case 008: Class.from<number>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<number>();
      let primitiveNumber = Class.PRIMITIVE_NUMBER;
      let result = cls.isSubtypeOf(primitiveNumber);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_0900
     * @tc.name testClassIsSubtypeOf009
     * @tc.desc Verify ClassIsSubtypeOf case 009: Class.from<ChildClass009>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass009>();
      let parentClazz = Class.from<ParentClass009>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1000
     * @tc.name testClassIsSubtypeOf010
     * @tc.desc Verify ClassIsSubtypeOf case 010: Class.from<ChildClass010>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ChildClass010>();
      let parentClazz = Class.from<ParentClass010>();
      let result = parentClazz.isSubtypeOf(childClazz);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1100
     * @tc.name testClassIsSubtypeOf011
     * @tc.desc Verify ClassIsSubtypeOf case 011: Class.from<MyClass011>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let result = cls.isSubtypeOf(cls);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1200
     * @tc.name testClassIsSubtypeOf012
     * @tc.desc Verify ClassIsSubtypeOf case 012: Class.from<ClassA012>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 013: Class.from<Child013>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<Child013>();
      let grandParentClazz = Class.from<GrandParent013>();
      let result = childClazz.isSubtypeOf(grandParentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1400
     * @tc.name testClassIsSubtypeOf014
     * @tc.desc Verify ClassIsSubtypeOf case 014: Class.from<Child014>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<Child014>();
      let parentClazz = Class.from<Parent014>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1500
     * @tc.name testClassIsSubtypeOf015
     * @tc.desc Verify ClassIsSubtypeOf case 015: Class.from<Parent015>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentClazz = Class.from<Parent015>();
      let childClazz = Class.from<Child015>();
      let result = parentClazz.isSubtypeOf(childClazz);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1600
     * @tc.name testClassIsSubtypeOf016
     * @tc.desc Verify ClassIsSubtypeOf case 016: Class.from<E016>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsE = Class.from<E016>();
      let clsA = Class.from<A016>();
      let result = clsE.isSubtypeOf(clsA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1700
     * @tc.name testClassIsSubtypeOf017
     * @tc.desc Verify ClassIsSubtypeOf case 017: Class.from<MyClass017>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let iface = Class.from<MyInterface017>();
      let result = cls.isSubtypeOf(iface);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1800
     * @tc.name testClassIsSubtypeOf018
     * @tc.desc Verify ClassIsSubtypeOf case 018: Class.from<MultiImpl018>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiImpl018>();
      let ifaceA = Class.from<InterfaceA018>();
      let ifaceB = Class.from<InterfaceB018>();
      expect(cls.isSubtypeOf(ifaceA)).assertTrue();
      expect(cls.isSubtypeOf(ifaceB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_1900
     * @tc.name testClassIsSubtypeOf019
     * @tc.desc Verify ClassIsSubtypeOf case 019: Class.from<ChildInterface019>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childIface = Class.from<ChildInterface019>();
      let parentIface = Class.from<ParentInterface019>();
      let result = childIface.isSubtypeOf(parentIface);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2000
     * @tc.name testClassIsSubtypeOf020
     * @tc.desc Verify ClassIsSubtypeOf case 020: Class.from<MyClass020>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let parentIface = Class.from<ParentInterface020>();
      let result = cls.isSubtypeOf(parentIface);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2100
     * @tc.name testClassIsSubtypeOf021
     * @tc.desc Verify ClassIsSubtypeOf case 021: Class.from<number>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 022: Class.from<boolean>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 023: Class.from<string>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strClass = Class.from<string>();
      let result = strClass.isSubtypeOf(Class.PRIMITIVE_NUMBER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2400
     * @tc.name testClassIsSubtypeOf024
     * @tc.desc Verify ClassIsSubtypeOf case 024: isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      let kinds = [
      'boolean', 'byte', 'char', 'short', 'int', 'long', 'float', 'double', 'number'
      ];
      for (let i = 0; i < primitives.length; i++) {
        for (let j = 0; j < primitives.length; j++) {
          if (i !== j) {
            let result = primitives[i].isSubtypeOf(primitives[j]);
            let expected = expectDistinctPrimitiveSubtypeOfSpec024(kinds[i], kinds[j]);
            if (result !== expected) {
              console.info(`testClassIsSubtypeOf024: ${kinds[i]}->${kinds[j]} spec=${expected} actual=${result}`);
            }
            expect(result).assertEqual(expected);
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2500
     * @tc.name testClassIsSubtypeOf025
     * @tc.desc Verify ClassIsSubtypeOf case 025: Class.from<Array<number>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrNum = Class.from<Array<number>>();
      let arrStr = Class.from<Array<string>>();
      let result = arrNum.isSubtypeOf(arrStr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2600
     * @tc.name testClassIsSubtypeOf026
     * @tc.desc Verify ClassIsSubtypeOf case 026: Class.from<FixedArray<int>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 027: Class.from<Array<int>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrInt = Class.from<Array<int>>();
      let arrDouble = Class.from<Array<double>>();
      expect(arrInt.isSubtypeOf(arrDouble)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_2800
     * @tc.name testClassIsSubtypeOf028
     * @tc.desc Verify ClassIsSubtypeOf case 028: Class.from<int | string>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 029: Class.from<int>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intType = Class.from<int>();
      let unionType = Class.from<int | string>();
      expect(intType.isSubtypeOf(unionType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3000
     * @tc.name testClassIsSubtypeOf030
     * @tc.desc Verify ClassIsSubtypeOf case 030: Class.from<int | string | boolean | Array<double>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let complexUnion = Class.from<int | string | boolean | Array<double>>();
      let intType = Class.from<int>();
      let result = complexUnion.isSubtypeOf(intType);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3100
     * @tc.name testClassIsSubtypeOf031
     * @tc.desc Verify ClassIsSubtypeOf case 031: Class.from<Map<int, string>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapIntStr = Class.from<Map<int, string>>();
      let mapStrInt = Class.from<Map<string, int>>();
      expect(mapIntStr.isSubtypeOf(mapStrInt)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3200
     * @tc.name testClassIsSubtypeOf032
     * @tc.desc Verify ClassIsSubtypeOf case 032: Class.from<Container032<B032>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let containerB = Class.from<Container032<B032>>();
      let containerA = Class.from<Container032<A032>>();
      expect(containerB.isSubtypeOf(containerA)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3300
     * @tc.name testClassIsSubtypeOf033
     * @tc.desc Verify ClassIsSubtypeOf case 033: Class.from<Printer033<Doc033>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let printerDoc = Class.from<Printer033<Doc033>>();
      let printable = Class.from<Printable033>();
      let result = printerDoc.isSubtypeOf(printable);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3400
     * @tc.name testClassIsSubtypeOf034
     * @tc.desc Verify ClassIsSubtypeOf case 034: Class.from<MyClass034>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let objClass = Class.from<Object>();
      let result = cls.isSubtypeOf(objClass);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3500
     * @tc.name testClassIsSubtypeOf035
     * @tc.desc Verify ClassIsSubtypeOf case 035: Class.from<MyClass035>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let objClass = Class.from<Object>();
      let result = objClass.isSubtypeOf(cls);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3600
     * @tc.name testClassIsSubtypeOf036
     * @tc.desc Verify ClassIsSubtypeOf case 036: Class.from<Child036>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<Child036>();
      let parentClazz = Class.from<Parent036>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3700
     * @tc.name testClassIsSubtypeOf037
     * @tc.desc Verify ClassIsSubtypeOf case 037: Class.from<Child037>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<Child037>();
      let parentClazz = Class.from<Parent037>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3800
     * @tc.name testClassIsSubtypeOf038
     * @tc.desc Verify ClassIsSubtypeOf case 038: Class.from<ConcreteChild038>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<ConcreteChild038>();
      let parentClazz = Class.from<AbstractParent038>();
      let result = childClazz.isSubtypeOf(parentClazz);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_3900
     * @tc.name testClassIsSubtypeOf039
     * @tc.desc Verify ClassIsSubtypeOf case 039: Class.from<AbstractParent039>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentClazz = Class.from<AbstractParent039>();
      let childClazz = Class.from<ConcreteChild039>();
      let result = parentClazz.isSubtypeOf(childClazz);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4000
     * @tc.name testClassIsSubtypeOf040
     * @tc.desc Verify ClassIsSubtypeOf case 040: Class.from<TestEnum040>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 041: Class.from<MyInterface041>(), isInterface returns true, isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 042: Class.from<Child042>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<Child042>().isSubtypeOf(Class.from<Parent042>());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4300
     * @tc.name testClassIsSubtypeOf043
     * @tc.desc Verify ClassIsSubtypeOf case 043: Class.from<C043>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<C043>().isSubtypeOf(Class.from<A043>());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4400
     * @tc.name testClassIsSubtypeOf044
     * @tc.desc Verify ClassIsSubtypeOf case 044: Class.from<MyClass044>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<MyClass044>().isSubtypeOf(Class.from<MyInterface044>());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4500
     * @tc.name testClassIsSubtypeOf045
     * @tc.desc Verify ClassIsSubtypeOf case 045: Class.from<MyClass045>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let result = cls.isSubtypeOf(cls);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4600
     * @tc.name testClassIsSubtypeOf046
     * @tc.desc Verify ClassIsSubtypeOf case 046: Class.from<A046>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<A046>().isSubtypeOf(Class.from<B046>());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4700
     * @tc.name testClassIsSubtypeOf047
     * @tc.desc Verify ClassIsSubtypeOf case 047: Class.from<Parent047>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<Parent047>().isSubtypeOf(Class.from<Child047>());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4800
     * @tc.name testClassIsSubtypeOf048
     * @tc.desc Verify ClassIsSubtypeOf case 048: Class.from<Array<int>>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<Array<int>>().isSubtypeOf(Class.from<Array<string>>())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_4900
     * @tc.name testClassIsSubtypeOf049
     * @tc.desc Verify ClassIsSubtypeOf case 049: Class.from<B049>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<B049>().isSubtypeOf(Class.from<A049>());
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5000
     * @tc.name testClassIsSubtypeOf050
     * @tc.desc Verify ClassIsSubtypeOf case 050: Class.from<B050>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Class.from<B050>().isSubtypeOf(Class.from<A050>());
      expect(typeof result === 'number').assertFalse();
      expect(typeof result === 'string').assertFalse();
      expect(typeof result === 'object').assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5100
     * @tc.name testClassIsSubtypeOf051
     * @tc.desc Verify ClassIsSubtypeOf case 051: Class.from<Subtype052_L7>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<Subtype052_L7>().isSubtypeOf(Class.from<Subtype052_Root>())).assertTrue();
      expect(Class.from<Subtype052_Root>().isSubtypeOf(Class.from<Subtype052_L7>())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5200
     * @tc.name testClassIsSubtypeOf052
     * @tc.desc Verify ClassIsSubtypeOf case 052: Class.from<Subtype052_L7>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deepChildClass = Class.from<Subtype052_L7>();
      let rootClass = Class.from<Subtype052_Root>();
      let startTime = Date.now();
      let result = deepChildClass.isSubtypeOf(rootClass);
      let endTime = Date.now();
      expect(result).assertTrue();
      console.info(`isSubtypeOf perf: ${endTime - startTime}ms`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5300
     * @tc.name testClassIsSubtypeOf053
     * @tc.desc Verify ClassIsSubtypeOf case 053: Class.from<ManyInterfaces053>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ManyInterfaces053>();
      let startTime = Date.now();
      let result = cls.isSubtypeOf(Class.from<Interface053A>());
      let endTime = Date.now();
      expect(result).assertTrue();
      console.info(`isSubtypeOf batch perf: ${endTime - startTime}ms`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5400
     * @tc.name testClassIsSubtypeOf054
     * @tc.desc Verify ClassIsSubtypeOf case 054: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let parent = Class.from<SubtypeParent>();
      for (let i = 0; i < 100; i++) {
        expect(cls.isSubtypeOf(parent)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5500
     * @tc.name testClassIsSubtypeOf055
     * @tc.desc Verify ClassIsSubtypeOf case 055: Class.from<SubtypeChild>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SubtypeChild>();
      let parent = Class.from<SubtypeParent>();
      expect(cls.isSubtypeOf(parent)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5600
     * @tc.name testClassIsSubtypeOf056
     * @tc.desc Verify ClassIsSubtypeOf case 056: Class.from<C056>(), isSubtypeOf relationship verified, getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 057: Class.from<Child057>(), isSubtypeOf relationship verified, getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childClazz = Class.from<Child057>();
      let superClazz = childClazz.getSuper();
      if (superClazz !== undefined) {
        expect(childClazz.isSubtypeOf(superClazz)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5800
     * @tc.name testClassIsSubtypeOf058
     * @tc.desc Verify ClassIsSubtypeOf case 058: Class.from<MyClass058>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let interfaces = Utils.fixedArrayToArray(cls.getInterfaces());
      for (let i = 0; i < interfaces.length; i++) {
        expect(cls.isSubtypeOf(interfaces[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_5900
     * @tc.name testClassIsSubtypeOf059
     * @tc.desc Verify ClassIsSubtypeOf case 059: Class.from<TopInterface059>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let topIface = Class.from<TopInterface059>();
      let baseIface = Class.from<BaseInterface059>();
      expect(topIface.isSubtypeOf(baseIface)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6000
     * @tc.name testClassIsSubtypeOf060
     * @tc.desc Verify ClassIsSubtypeOf case 060: Class.from<MyInterface060>(), isInterface returns true, isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.desc Verify ClassIsSubtypeOf case 061: isPrimitive returns true, isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
      expect(Class.PRIMITIVE_NUMBER.isPrimitive()).assertTrue();

      let result = Class.PRIMITIVE_INT.isSubtypeOf(Class.PRIMITIVE_NUMBER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6200
     * @tc.name testClassIsSubtypeOf062
     * @tc.desc Verify ClassIsSubtypeOf case 062: invalid input throws ClassCastError, Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        cls.isSubtypeOf(null as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6300
     * @tc.name testClassIsSubtypeOf063
     * @tc.desc Verify ClassIsSubtypeOf case 063: invalid input throws ClassCastError, Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        cls.isSubtypeOf(undefined as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6400
     * @tc.name testClassIsSubtypeOf064
     * @tc.desc Verify ClassIsSubtypeOf case 064: Class.from<MyClass001>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let otherClass = Class.from<ChildClass002>();
      expect(cls.isSubtypeOf(otherClass)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6500
     * @tc.name testClassIsSubtypeOf065
     * @tc.desc Verify ClassIsSubtypeOf case 065: Class.from<NoParent065>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParent065>();
      let objClass = Class.from<Object>();
      expect(cls.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6600
     * @tc.name testClassIsSubtypeOf066
     * @tc.desc Verify ClassIsSubtypeOf case 066: Class.from<Object>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objClass = Class.from<Object>();
      expect(objClass.isSubtypeOf(objClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6700
     * @tc.name testClassIsSubtypeOf067
     * @tc.desc Verify ClassIsSubtypeOf case 067: Class.from<Dog067>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog = new Dog067();
      let result = safeCast067<Dog067>(dog, Class.from<Dog067>());
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6800
     * @tc.name testClassIsSubtypeOf068
     * @tc.desc Verify ClassIsSubtypeOf case 068: Class.from<NewImplementation068>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl = Class.from<NewImplementation068>();
      let oldApi = Class.from<OldAPI068>();
      let newApi = Class.from<NewAPI068>();

      expect(checkCompatibility068(impl, oldApi)).assertTrue();
      expect(checkCompatibility068(impl, newApi)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_6900
     * @tc.name testClassIsSubtypeOf069
     * @tc.desc Verify ClassIsSubtypeOf case 069: Class.from<MyPlugin069>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myPluginClass = Class.from<MyPlugin069>();
      expect(validatePlugin069(myPluginClass)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISSUBTYPEOF_7000
     * @tc.name testClassIsSubtypeOf070
     * @tc.desc Verify ClassIsSubtypeOf case 070: Class.from<Data070>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsSubtypeOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dataClass = Class.from<Data070>();
      expect(isSerializable070(dataClass)).assertTrue();
    });

  });
}

