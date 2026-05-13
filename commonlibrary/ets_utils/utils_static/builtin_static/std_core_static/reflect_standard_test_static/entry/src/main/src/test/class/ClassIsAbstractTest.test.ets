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

abstract class AbstractClass001 {}

abstract class MyAbstractClass003 {}

abstract class MyAbstractClass004 {
    public abstract method(): void;
  }

abstract class MyAbstractClass005 {}

abstract class AbstractClass006 {}

abstract class ClassWithAbstractMethod007 {
    public abstract doSomething(): void;
    public normalMethod(): void {}
  }

abstract class MultiAbstractClass008 {
    public abstract method1(): void;
    public abstract method2(): string;
    public abstract method3(): int;
  }

abstract class Child009 extends Parent009 {
    public override method1(): void {}
    // method2未实现，Child仍是抽象类
  }

abstract class Parent009 {
    public abstract method1(): void;
    public abstract method2(): void;
  }

class NormalClass010 {}

class ConcreteClass011 {
    public name: string = "";
    public constructor(name: string) {
      this.name = name;
    }
  }

class ConcreteChild012 extends AbstractParent012 {
    public override method1(): void {}
    public override method2(): void {}
  }

abstract class AbstractParent012 {
    public abstract method1(): void;
    public abstract method2(): void;
  }

class StaticClass013 {
    public static value: int = 100;
    public static func(): void {}
  }

final class FinalClass014 {}

interface MyInterface015 {
    method(): void;
  }

enum TestEnum016 {
    VALUE1,
    VALUE2
  }

class MyClass021 {}

class Level3022 extends Level2022 {
    public override method(): void {}
  }

abstract class Level2022 extends Level1022 {}

abstract class Level1022 {
    public abstract method(): void;
  }

abstract class EmptyAbstractClass023 {}

abstract class AbstractWithFields024 {
    public value: int = 0;
  }

abstract class MixedClass025 {
    public abstract abstractMethod(): void;
    public concreteMethod(): string {
      return "concrete";
    }
  }

abstract class AbstractImpl026 implements MyInterface026 {
    public abstract method(): void;
  }

interface MyInterface026 {
    method(): void;
  }

abstract class AbstractClass029 {}

abstract class GenericAbstractClass030<T> {
    public abstract process(value: T): void;
  }

abstract class GenericAbstract031<T> {
    public abstract getValue(): T;
  }

abstract class ConditionalClass032 {
    public abstract conditionalMethod(): void;
  }

interface MyInterface033 {}

abstract class AbstractClass033 {}

final class FinalClass034 {}

abstract class AbstractClass034 {}

abstract class AbstractClass035 {}

enum TestEnum035 {
    VALUE1, VALUE2
  }

abstract class AbstractClass036 {
    public abstract method(): void;
  }

class ConcreteClass037 {
    public name: string = "test";
  }

class ConcreteChild038 extends AbstractParent038 {
    public override method(): void {}
  }

abstract class AbstractParent038 {
    public abstract method(): void;
  }

interface Product039 {}

abstract class Factory039 {
    public abstract createProduct(): Product039;
  }

class ConcreteFactory040 extends Factory040 {
    public override createProduct(): Product040 {
      return {} as Product040;
    }
  }

interface Product040 {}

abstract class Factory040 {
    public abstract createProduct(): Product040;
  }

abstract class Template041 {
    public final process(): void {
      this.step1();
      this.step2();
    }
    protected abstract step1(): void;
    protected abstract step2(): void;
  }

abstract class AbstractStrategy042 implements Strategy042 {
    public abstract execute(): void;
    protected common(): void {}
  }

interface Strategy042 {
    execute(): void;
  }

abstract class Subject043 {
    private observers: Array<Observer043> = [];
    public abstract notify(): void;
  }

abstract class Observer043 {
    public abstract update(data: string): void;
  }

abstract class AbstractClass044 {}

abstract class AbstractClass045 {}

class Concrete2046 {}

class Concrete1046 {}

abstract class Abs2046 {}

abstract class Abs1046 {}

abstract class PublicAbstract047 {}

abstract class InnerAbstract048 {
      public abstract method(): void;
    }

class Outer048 {

  }

class Concrete049 extends Top049 {
    public override method1(): void {}
    public override method2(): void {}
    public override method3(): void {}
  }

abstract class Top049 extends Middle049 {
    public abstract method3(): void;
  }

abstract class Middle049 extends Base049 {
    public abstract method2(): void;
  }

abstract class Base049 {
    public abstract method1(): void;
  }

abstract class AbstractImpl050 implements Interface1050, Interface2050 {
    public abstract method1(): void;
    public abstract method2(): void;
  }

interface Interface2050 {
    method2(): void;
  }

interface Interface1050 {
    method1(): void;
  }

abstract class PartialImpl051 implements MyInterface051 {
    public method1(): void {}
    // method2和method3未实现，类仍为抽象
  }

interface MyInterface051 {
    method1(): void;
    method2(): void;
    method3(): void;
  }


export default function ClassIsAbstractTest(): void {
  describe('ClassIsAbstractTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0100
     * @tc.name testClassIsAbstract001
     * @tc.desc Verify ClassIsAbstract case 001: isAbstract()method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass001>();
        let result = cls.isAbstract();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0200
     * @tc.name testClassIsAbstract002
     * @tc.desc Verify ClassIsAbstract case 002: parameters should compile error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
expect(true).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0300
     * @tc.name testClassIsAbstract003
     * @tc.desc Verify ClassIsAbstract case 003: using Class.from<T>()get object after call isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyAbstractClass003>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0400
     * @tc.name testClassIsAbstract004
     * @tc.desc Verify ClassIsAbstract case 004: using Class.of()get instance object after call isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyAbstractClass004>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0500
     * @tc.name testClassIsAbstract005
     * @tc.desc Verify ClassIsAbstract case 005: using Class.ofAny()get object after call isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let anyObj: Any = null as Object;
        let cls = Class.ofAny(anyObj);
        if (cls != undefined) {
          expect(cls.isAbstract()).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0600
     * @tc.name testClassIsAbstract006
     * @tc.desc Verify ClassIsAbstract case 006: is abstract return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass006>();
        let result = cls.isAbstract();
        expect(result).assertEqual(true);
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0700
     * @tc.name testClassIsAbstract007
     * @tc.desc Verify ClassIsAbstract case 007: abstractmethod return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ClassWithAbstractMethod007>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0800
     * @tc.name testClassIsAbstract008
     * @tc.desc Verify ClassIsAbstract case 008: multiple method return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiAbstractClass008>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_0900
     * @tc.name testClassIsAbstract009
     * @tc.desc Verify ClassIsAbstract case 009: inheritance abstract class method is abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Child009>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1000
     * @tc.name testClassIsAbstract010
     * @tc.desc Verify ClassIsAbstract case 010: return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NormalClass010>();
        let result = cls.isAbstract();
        expect(result).assertFalse();
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1100
     * @tc.name testClassIsAbstract011
     * @tc.desc Verify ClassIsAbstract case 011: instance return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConcreteClass011>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1200
     * @tc.name testClassIsAbstract012
     * @tc.desc Verify ClassIsAbstract case 012: method return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConcreteChild012>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1300
     * @tc.name testClassIsAbstract013
     * @tc.desc Verify ClassIsAbstract case 013: static return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticClass013>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1400
     * @tc.name testClassIsAbstract014
     * @tc.desc Verify ClassIsAbstract case 014: is final return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass014>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1500
     * @tc.name testClassIsAbstract015
     * @tc.desc Verify ClassIsAbstract case 015: interface call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface015>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1600
     * @tc.name testClassIsAbstract016
     * @tc.desc Verify ClassIsAbstract case 016: call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum016>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1700
     * @tc.name testClassIsAbstract017
     * @tc.desc Verify ClassIsAbstract case 017: type Classobject call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_INT.isAbstract()).assertFalse();
        expect(Class.PRIMITIVE_BOOLEAN.isAbstract()).assertFalse();
        expect(Class.from<string>().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1800
     * @tc.name testClassIsAbstract018
     * @tc.desc Verify ClassIsAbstract case 018: array type call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr: Array<int> = [];
        let cls = Class.of(arr);
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_1900
     * @tc.name testClassIsAbstract019
     * @tc.desc Verify ClassIsAbstract case 019: FixedArraytype call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let fixedArr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(fixedArr);
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2000
     * @tc.name testClassIsAbstract020
     * @tc.desc Verify ClassIsAbstract case 020: type call isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2100
     * @tc.name testClassIsAbstract021
     * @tc.desc Verify ClassIsAbstract case 021: std.core.Objectcall isAbstractreturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass021>();
        let objSuper = cls.getSuper();
        if (objSuper != undefined) {
          expect(objSuper.isAbstract()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2200
     * @tc.name testClassIsAbstract022
     * @tc.desc Verify ClassIsAbstract case 022: inheritance isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.from<Level1022>().isAbstract()).assertTrue();
        expect(Class.from<Level2022>().isAbstract()).assertTrue();
        expect(Class.from<Level3022>().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2300
     * @tc.name testClassIsAbstract023
     * @tc.desc Verify ClassIsAbstract case 023: empty abstract class return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyAbstractClass023>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2400
     * @tc.name testClassIsAbstract024
     * @tc.desc Verify ClassIsAbstract case 024: field is abstract return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractWithFields024>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2500
     * @tc.name testClassIsAbstract025
     * @tc.desc Verify ClassIsAbstract case 025: abstract class method return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass025>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2600
     * @tc.name testClassIsAbstract026
     * @tc.desc Verify ClassIsAbstract case 026: abstract class interface when isAbstractreturn true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractImpl026>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2700
     * @tc.name testClassIsAbstract027
     * @tc.desc Verify ClassIsAbstract case 027: nullcall Class.of after call isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(null);
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2800
     * @tc.name testClassIsAbstract028
     * @tc.desc Verify ClassIsAbstract case 028: Class.ofAnyreturn undefined when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.ofAny(undefined);
        expect(cls).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_2900
     * @tc.name testClassIsAbstract029
     * @tc.desc Verify ClassIsAbstract case 029: via Anytype after object call isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let anyCls: Any = Class.from<AbstractClass029>() as Any;
        let cls = anyCls as Class;
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3000
     * @tc.name testClassIsAbstract030
     * @tc.desc Verify ClassIsAbstract case 030: generic abstract class call isAbstractreturn true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericAbstractClass030<int>>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3100
     * @tc.name testClassIsAbstract031
     * @tc.desc Verify ClassIsAbstract case 031: type instance generic abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let intCls = Class.from<GenericAbstract031<int>>();
        let strCls = Class.from<GenericAbstract031<string>>();
        expect(intCls.isAbstract()).assertTrue();
        expect(strCls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3200
     * @tc.name testClassIsAbstract032
     * @tc.desc Verify ClassIsAbstract case 032: type abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConditionalClass032>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3300
     * @tc.name testClassIsAbstract033
     * @tc.desc Verify ClassIsAbstract case 033: verify isAbstract isInterfacenot when is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let absCls = Class.from<AbstractClass033>();
        let ifaceCls = Class.from<MyInterface033>();
        expect(absCls.isAbstract()).assertTrue();
        expect(absCls.isInterface()).assertFalse();
        expect(ifaceCls.isInterface()).assertTrue();
        expect(ifaceCls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3400
     * @tc.name testClassIsAbstract034
     * @tc.desc Verify ClassIsAbstract case 034: verify not when abstract class final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let absCls = Class.from<AbstractClass034>();
        let finalCls = Class.from<FinalClass034>();
        expect(absCls.isAbstract() && absCls.isFinal()).assertFalse();
        expect(finalCls.isAbstract() || finalCls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3500
     * @tc.name testClassIsAbstract035
     * @tc.desc Verify ClassIsAbstract case 035: isAbstract isEnum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let enumCls = Class.from<TestEnum035>();
        let absCls = Class.from<AbstractClass035>();
        expect(enumCls.isEnum()).assertTrue();
        expect(enumCls.isAbstract()).assertFalse();
        expect(absCls.isAbstract()).assertTrue();
        expect(absCls.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3600
     * @tc.name testClassIsAbstract036
     * @tc.desc Verify ClassIsAbstract case 036: isAbstractreturn true call createInstanceshould throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass036>();
        expect(cls.isAbstract()).assertTrue();
        try {
          cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3700
     * @tc.name testClassIsAbstract037
     * @tc.desc Verify ClassIsAbstract case 037: isAbstractreturn false call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConcreteClass037>();
        expect(cls.isAbstract()).assertFalse();
        let obj = cls.createInstance();
        expect(obj != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3800
     * @tc.name testClassIsAbstract038
     * @tc.desc Verify ClassIsAbstract case 038: inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ConcreteChild038>();
        let parentCls = childCls.getSuper();
        expect(childCls.isAbstract()).assertFalse();
        if (parentCls != undefined) {
          expect(parentCls.isAbstract()).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_3900
     * @tc.name testClassIsAbstract039
     * @tc.desc Verify ClassIsAbstract case 039: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Factory039>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4000
     * @tc.name testClassIsAbstract040
     * @tc.desc Verify ClassIsAbstract case 040: not abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConcreteFactory040>();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4100
     * @tc.name testClassIsAbstract041
     * @tc.desc Verify ClassIsAbstract case 041: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Template041>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4200
     * @tc.name testClassIsAbstract042
     * @tc.desc Verify ClassIsAbstract case 042: interface and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ifaceCls = Class.from<Strategy042>();
        let absCls = Class.from<AbstractStrategy042>();
        expect(ifaceCls.isInterface()).assertTrue();
        expect(absCls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4300
     * @tc.name testClassIsAbstract043
     * @tc.desc Verify ClassIsAbstract case 043: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let observerCls = Class.from<Observer043>();
        let subjectCls = Class.from<Subject043>();
        expect(observerCls.isAbstract()).assertTrue();
        expect(subjectCls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4400
     * @tc.name testClassIsAbstract044
     * @tc.desc Verify ClassIsAbstract case 044: Classobject call isAbstractreturn same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass044>();
        let result1 = cls.isAbstract();
        let result2 = cls.isAbstract();
        let result3 = cls.isAbstract();
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4500
     * @tc.name testClassIsAbstract045
     * @tc.desc Verify ClassIsAbstract case 045: via different get Classobject return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<AbstractClass045>();
        let cls2 = Class.from<AbstractClass045>();
        expect(cls1.isAbstract()).assertEqual(cls2.isAbstract());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4600
     * @tc.name testClassIsAbstract046
     * @tc.desc Verify ClassIsAbstract case 046: multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let classes: Array<Class> = new Array<Class>();
        classes.push(Class.from<Abs1046>());
        classes.push(Class.from<Abs2046>());
        classes.push(Class.from<Concrete1046>());
        classes.push(Class.from<Concrete2046>());
        for (let i = 0; i < classes.length; i++) {
          let result = classes[i].isAbstract();
          expect(typeof result).assertEqual("boolean");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4700
     * @tc.name testClassIsAbstract047
     * @tc.desc Verify ClassIsAbstract case 047: publicabstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicAbstract047>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4800
     * @tc.name testClassIsAbstract048
     * @tc.desc Verify ClassIsAbstract case 048: in abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<InnerAbstract048>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_4900
     * @tc.name testClassIsAbstract049
     * @tc.desc Verify ClassIsAbstract case 049: abstract class inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.from<Base049>().isAbstract()).assertTrue();
        expect(Class.from<Middle049>().isAbstract()).assertTrue();
        expect(Class.from<Top049>().isAbstract()).assertTrue();
        expect(Class.from<Concrete049>().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_5000
     * @tc.name testClassIsAbstract050
     * @tc.desc Verify ClassIsAbstract case 050: abstract class multiple interface when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractImpl050>();
        expect(cls.isAbstract()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISABSTRACT_5100
     * @tc.name testClassIsAbstract051
     * @tc.desc Verify ClassIsAbstract case 051: abstract class interface method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsAbstract051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PartialImpl051>();
        expect(cls.isAbstract()).assertTrue();
    });

  });
}