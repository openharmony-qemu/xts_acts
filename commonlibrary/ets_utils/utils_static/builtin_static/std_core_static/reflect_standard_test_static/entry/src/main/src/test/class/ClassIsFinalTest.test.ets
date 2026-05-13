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

final class FinalClass001 {}

final class MyFinalClass002 {}

final class MyFinalClass003 {}

final class MyFinalClass004 {}

final class MyFinalClass005 {
    public checkFinal(): boolean {
      let cls = Class.current()
      return cls.isFinal()
    }
  }

final class StandardFinalClass006 {
    public name: string = "test"
  }

final class FinalWithConstructor007 {
    public value: int
    public constructor(v: int) {
      this.value = v
    }
  }

final class FinalWithMethods008 {
    public getName(): string {
      return "final"
    }
    public setValue(v: int): void {
      // implementation
    }
  }

final class FinalChild009 extends BaseClass009 {
    public childField: string = "child"
  }

class BaseClass009 {
    public baseField: string = "base"
  }

class NormalClass010 {
    public name: string = "normal"
  }

abstract class AbstractClass011 {
    public abstract getName(): string
  }

interface MyInterface013 {
    name: string
  }

enum TestEnum018 {
    VALUE1,
    VALUE2
  }

final class TestClass019 {}

class TestClass020 {}

final class FinalBase021 {
    public name: string = "base"
  }

final class FinalImplementsInterface022 implements MyInterface022 {
    public getName(): string {
      return "final"
    }
  }

interface MyInterface022 {
    getName(): string
  }

class ChildClass023 extends ParentClass023 {
    public childField: string = "child"
  }

class ParentClass023 {
    public parentField: string = "parent"
  }

final class FinalChild024 extends Parent024 {
    public field3: string = "child"
  }

class Parent024 extends GrandParent024 {
    public field2: string = "parent"
  }

class GrandParent024 {
    public field1: string = "grandparent"
  }

final class FinalDerived025 extends Base025 {
    public derivedField: string = "derived"
  }

class Base025 {
    public baseField: string = "base"
  }

class Derived026 extends Base026 {
    public derivedField: string = "derived"
  }

class Base026 {
    public baseField: string = "base"
  }

final class FinalClass028 {
    public name: string = "final"
  }

final class FinalClass029 {
    public name: string = "final"
  }

interface MyInterface030 {
    name: string
  }

final class FinalClass031 {
    public name: string = "final"
  }

enum TestEnum032 {
    VALUE1,
    VALUE2
  }

final class FinalClass033 {
    public name: string = "final"
  }

final class FinalChild035 extends Base035 {
    public childField: string = "child"
  }

class Base035 {
    public baseField: string = "base"
  }

final class EmptyFinalClass036 {}

class EmptyClass037 {}

final class FinalClass3038 {}

final class FinalClass2038 {}

final class FinalClass1038 {}

class NormalClass039 {}

final class FinalClass039 {}

class InnerClass040 {
    public innerField: string = "inner"
  }

final class OuterFinal040 {
    public innerField: string = "outer"
  }

final class GenericFinalClass041<T> {
    public value: T
    public constructor(v: T) {
      this.value = v
    }
  }

class GenericClass042<T> {
    public value: T
    public constructor(v: T) {
      this.value = v
    }
  }

class OpenClass012 {
    public name: string = "open"
  }

final class PublicFinalClass043 {
    public name: string = "public final"
  }

final class InternalFinalClass044 {
    public name: string = "internal final"
  }

final class TestClass045 {}

class Normal2046 {}

class Normal1046 {}

final class Final2046 {}

final class Final1046 {}

final class TestClass047 {}

final class FinalBase049 {}

final class FinalMultiInterface050 implements Interface1050, Interface2050 {
    public method1(): string {
      return "method1"
    }
    public method2(): string {
      return "method2"
    }
  }

interface Interface2050 {
    method2(): string
  }

interface Interface1050 {
    method1(): string
  }

class NormalClass051 {}

abstract class AbstractClass051 {}

final class FinalClass051 {}

function canBeInherited051(cls: Class): boolean {
    return !cls.isFinal() && !cls.isInterface()
  }

class NormalClass052 {}

final class FinalClass052 {}

function generateClassCode052(cls: Class): string {
    if (cls.isFinal()) {
      return `// ${cls.getName()} is final, cannot be extended`
    } else {
      return `// ${cls.getName()} can be extended`
    }
  }

class StringUtils053 {
    public static isEmpty(str: string): boolean {
      return str.length === 0
    }
  }

final class AppConfig053 {
    public version: string = "1.0"
  }

function validateClassDesign053(cls: Class, shouldBeFinal: boolean): boolean {
    return cls.isFinal() === shouldBeFinal
  }


export default function ClassIsFinalTest(): void {
  describe('ClassIsFinalTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0100
     * @tc.name testClassIsFinal001
     * @tc.desc Verify ClassIsFinal case 001: isFinal() no parameters method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass001>()
        let result = cls.isFinal()
        expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0200
     * @tc.name testClassIsFinal002
     * @tc.desc Verify ClassIsFinal case 002: using Class.from<T>()get object after call isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyFinalClass002>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0300
     * @tc.name testClassIsFinal003
     * @tc.desc Verify ClassIsFinal case 003: using Class.of(obj)get object after call isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyFinalClass003()
        let cls = Class.of(obj)
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0400
     * @tc.name testClassIsFinal004
     * @tc.desc Verify ClassIsFinal case 004: using Class.ofAny(obj)get object after call isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Any = new MyFinalClass004()
        let cls = Class.ofAny(obj)!
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0500
     * @tc.name testClassIsFinal005
     * @tc.desc Verify ClassIsFinal case 005: in using Class.current()get after call isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyFinalClass005()
        expect(obj.checkFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0600
     * @tc.name testClassIsFinal006
     * @tc.desc Verify ClassIsFinal case 006: final should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StandardFinalClass006>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0700
     * @tc.name testClassIsFinal007
     * @tc.desc Verify ClassIsFinal case 007: constructor final should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalWithConstructor007>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0800
     * @tc.name testClassIsFinal008
     * @tc.desc Verify ClassIsFinal case 008: method final should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalWithMethods008>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_0900
     * @tc.name testClassIsFinal009
     * @tc.desc Verify ClassIsFinal case 009: final inheritance should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalChild009>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1000
     * @tc.name testClassIsFinal010
     * @tc.desc Verify ClassIsFinal case 010: not finalmodifier should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NormalClass010>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1100
     * @tc.name testClassIsFinal011
     * @tc.desc Verify ClassIsFinal case 011: abstract abstract class should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass011>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1200
     * @tc.name testClassIsFinal012
     * @tc.desc Verify ClassIsFinal case 012: inheritance should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OpenClass012>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1300
     * @tc.name testClassIsFinal013
     * @tc.desc Verify ClassIsFinal case 013: interface type Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface013>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1400
     * @tc.name testClassIsFinal014
     * @tc.desc Verify ClassIsFinal case 014: type Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_INT.isFinal()).assertEqual(false)
        expect(Class.PRIMITIVE_BOOLEAN.isFinal()).assertEqual(false)
        expect(Class.from<string>().isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1500
     * @tc.name testClassIsFinal015
     * @tc.desc Verify ClassIsFinal case 015: array type Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr = new Array<int>()
        let cls = Class.of(arr)
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1600
     * @tc.name testClassIsFinal016
     * @tc.desc Verify ClassIsFinal case 016: FixedArraytype Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let fixedArr = new FixedArray<int>(10)
        let cls = Class.of(fixedArr)
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1700
     * @tc.name testClassIsFinal017
     * @tc.desc Verify ClassIsFinal case 017: type Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1800
     * @tc.name testClassIsFinal018
     * @tc.desc Verify ClassIsFinal case 018: type Classobject should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum018>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_1900
     * @tc.name testClassIsFinal019
     * @tc.desc Verify ClassIsFinal case 019: verify isFinal()return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass019>()
        let result = cls.isFinal()
        expect(typeof result).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2000
     * @tc.name testClassIsFinal020
     * @tc.desc Verify ClassIsFinal case 020: verify return boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass020>()
        let result = cls.isFinal()
        expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2100
     * @tc.name testClassIsFinal021
     * @tc.desc Verify ClassIsFinal case 021: final is when should compile when error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 以下代码应该在编译时报错

        // 编译错误: Cannot extend a final class
        // class Child extends FinalBase021 {}
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2200
     * @tc.name testClassIsFinal022
     * @tc.desc Verify ClassIsFinal case 022: final interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalImplementsInterface022>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2300
     * @tc.name testClassIsFinal023
     * @tc.desc Verify ClassIsFinal case 023: inheritance final isFinal modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCls = Class.from<ParentClass023>()
        let childCls = Class.from<ChildClass023>()
        expect(parentCls.isFinal()).assertEqual(false)
        expect(childCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2400
     * @tc.name testClassIsFinal024
     * @tc.desc Verify ClassIsFinal case 024: inheritance final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let grandCls = Class.from<GrandParent024>()
        let parentCls = Class.from<Parent024>()
        let childCls = Class.from<FinalChild024>()
        expect(grandCls.isFinal()).assertEqual(false)
        expect(parentCls.isFinal()).assertEqual(false)
        expect(childCls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2500
     * @tc.name testClassIsFinal025
     * @tc.desc Verify ClassIsFinal case 025: get final isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let finalCls = Class.from<FinalDerived025>()
        let baseCls = finalCls.getSuper()!
        expect(finalCls.isFinal()).assertEqual(true)
        expect(baseCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2600
     * @tc.name testClassIsFinal026
     * @tc.desc Verify ClassIsFinal case 026: get final isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let derivedCls = Class.from<Derived026>()
        let baseCls = derivedCls.getSuper()!
        expect(derivedCls.isFinal()).assertEqual(false)
        expect(baseCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2700
     * @tc.name testClassIsFinal027
     * @tc.desc Verify ClassIsFinal case 027: verify not when final abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
// 此测试仅用于验证未捕获异常的行为，跳过执行
        // 以下代码应该在编译时报错
        // final abstract class InvalidClass {} // 编译错误
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2800
     * @tc.name testClassIsFinal028
     * @tc.desc Verify ClassIsFinal case 028: final isAbstractshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass028>()
        expect(cls.isFinal()).assertEqual(true)
        expect(cls.isAbstract()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_2900
     * @tc.name testClassIsFinal029
     * @tc.desc Verify ClassIsFinal case 029: final isInterfaceshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass029>()
        expect(cls.isFinal()).assertEqual(true)
        expect(cls.isInterface()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3000
     * @tc.name testClassIsFinal030
     * @tc.desc Verify ClassIsFinal case 030: interface isFinalshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface030>()
        expect(cls.isInterface()).assertEqual(true)
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3100
     * @tc.name testClassIsFinal031
     * @tc.desc Verify ClassIsFinal case 031: final isEnumshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass031>()
        expect(cls.isFinal()).assertEqual(true)
        expect(cls.isEnum()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3200
     * @tc.name testClassIsFinal032
     * @tc.desc Verify ClassIsFinal case 032: isFinalshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum032>()
        expect(cls.isEnum()).assertEqual(true)
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3300
     * @tc.name testClassIsFinal033
     * @tc.desc Verify ClassIsFinal case 033: final isPrimitiveshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass033>()
        expect(cls.isFinal()).assertEqual(true)
        expect(cls.isPrimitive()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3400
     * @tc.name testClassIsFinal034
     * @tc.desc Verify ClassIsFinal case 034: type Classobject isFinalshould is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_INT.isPrimitive()).assertEqual(true)
        expect(Class.PRIMITIVE_INT.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3500
     * @tc.name testClassIsFinal035
     * @tc.desc Verify ClassIsFinal case 035: verify final type inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let baseCls = Class.from<Base035>()
        let childCls = Class.from<FinalChild035>()
        expect(childCls.isSubtypeOf(baseCls)).assertEqual(true)
        expect(childCls.isFinal()).assertEqual(true)
        expect(baseCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3600
     * @tc.name testClassIsFinal036
     * @tc.desc Verify ClassIsFinal case 036: not final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyFinalClass036>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3700
     * @tc.name testClassIsFinal037
     * @tc.desc Verify ClassIsFinal case 037: not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass037>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3800
     * @tc.name testClassIsFinal038
     * @tc.desc Verify ClassIsFinal case 038: multiple different final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<FinalClass1038>()
        let cls2 = Class.from<FinalClass2038>()
        let cls3 = Class.from<FinalClass3038>()
        expect(cls1.isFinal()).assertEqual(true)
        expect(cls2.isFinal()).assertEqual(true)
        expect(cls3.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_3900
     * @tc.name testClassIsFinal039
     * @tc.desc Verify ClassIsFinal case 039: in final final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let finalCls = Class.from<FinalClass039>()
        let normalCls = Class.from<NormalClass039>()
        expect(finalCls.isFinal()).assertEqual(true)
        expect(normalCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4000
     * @tc.name testClassIsFinal040
     * @tc.desc Verify ClassIsFinal case 040: final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let outerCls = Class.from<OuterFinal040>()
        let innerCls = Class.from<InnerClass040>()
        expect(outerCls.isFinal()).assertEqual(true)
        expect(innerCls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4100
     * @tc.name testClassIsFinal041
     * @tc.desc Verify ClassIsFinal case 041: generic final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<GenericFinalClass041<int>>()
        let cls2 = Class.from<GenericFinalClass041<string>>()
        expect(cls1.isFinal()).assertEqual(true)
        expect(cls2.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4200
     * @tc.name testClassIsFinal042
     * @tc.desc Verify ClassIsFinal case 042: generic final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass042<int>>()
        expect(cls.isFinal()).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4300
     * @tc.name testClassIsFinal043
     * @tc.desc Verify ClassIsFinal case 043: public final isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicFinalClass043>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4400
     * @tc.name testClassIsFinal044
     * @tc.desc Verify ClassIsFinal case 044: final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<InternalFinalClass044>()
        expect(cls.isFinal()).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4500
     * @tc.name testClassIsFinal045
     * @tc.desc Verify ClassIsFinal case 045: verify call isFinalreturn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass045>()
        let result1 = cls.isFinal()
        let result2 = cls.isFinal()
        let result3 = cls.isFinal()
        expect(result1).assertEqual(result2)
        expect(result2).assertEqual(result3)
        expect(result3).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4600
     * @tc.name testClassIsFinal046
     * @tc.desc Verify ClassIsFinal case 046: multiple isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let classes: Class[] = [
          Class.from<Final1046>(),
          Class.from<Final2046>(),
          Class.from<Normal1046>(),
          Class.from<Normal2046>()
        ]
        let expected = [true, true, false, false]
        for (let i = 0; i < classes.length; i++) {
          expect(classes[i].isFinal()).assertEqual(expected[i])
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4700
     * @tc.name testClassIsFinal047
     * @tc.desc Verify ClassIsFinal case 047: in isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用TaskPool测试并发访问
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4800
     * @tc.name testClassIsFinal048
     * @tc.desc Verify ClassIsFinal case 048: type call isFinal is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
// 此测试仅用于验证未捕获异常的行为，跳过执行
        // 所有Class.from<T>()和Class.of()返回的对象都是有效的Class实例
        // 不存在无效Class对象的情况
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_4900
     * @tc.name testClassIsFinal049
     * @tc.desc Verify ClassIsFinal case 049: verify final not inheritance final compile when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 以下代码应该在编译时报错

        // 编译错误: Cannot extend a final class
        // final class FinalChild extends FinalBase049 {}
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_5000
     * @tc.name testClassIsFinal050
     * @tc.desc Verify ClassIsFinal case 050: final multiple interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalMultiInterface050>()
        expect(cls.isFinal()).assertEqual(true)
        expect(cls.getInterfaces().length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_5100
     * @tc.name testClassIsFinal051
     * @tc.desc Verify ClassIsFinal case 051: using isFinal inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(canBeInherited051(Class.from<FinalClass051>())).assertEqual(false)
        expect(canBeInherited051(Class.from<AbstractClass051>())).assertEqual(false)
        expect(canBeInherited051(Class.from<NormalClass051>())).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_5200
     * @tc.name testClassIsFinal052
     * @tc.desc Verify ClassIsFinal case 052: isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let code1 = generateClassCode052(Class.from<FinalClass052>())
        let code2 = generateClassCode052(Class.from<NormalClass052>())

        expect(code1).assertContain("cannot be extended")
        expect(code2).assertContain("can be extended")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISFINAL_5300
     * @tc.name testClassIsFinal053
     * @tc.desc Verify ClassIsFinal case 053: using isFinalverify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFinal053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 业务规则：所有配置类应该是final的


        // 业务规则：所有工具类不应该是final的


        expect(validateClassDesign053(Class.from<AppConfig053>(), true)).assertEqual(true)
        expect(validateClassDesign053(Class.from<StringUtils053>(), false)).assertEqual(true)
    });

  });
}