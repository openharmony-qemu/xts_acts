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

interface Cloneable052Marker {}

interface Serializable053Marker {}

interface MyInterface003 {
    name: string;
    age: int;
  }

class MyClass005 implements Interface1005, Interface2005 { }

interface Interface2005 { }

interface Interface1005 { }

interface GenericInterface006<T> {
    getValue(): T;
  }

class MyClass007 {
    public name: string = "test";
  }

abstract class AbstractClass008 {
    public abstract method(): void;
  }

class FinalClass009 {
    public value: int = 0;
  }

enum TestEnum010 {
    VALUE1,
    VALUE2
  }

interface ChildInterface018 extends BaseInterface018 {
    childMethod(): void;
  }

interface BaseInterface018 {
    baseMethod(): void;
  }

class MyClass019 implements MyInterface019 {
    public method(): void { }
  }

interface MyInterface019 {
    method(): void;
  }

class Child020 extends Parent020 { }

class Parent020 extends GrandParent020 { }

class GrandParent020 { }

interface EmptyInterface025 { }

interface ReadonlyInterface026 {
    readonly value: int;
  }

interface FunctionInterface027 {
    invoke(value: int): string;
  }

interface IndexSignatureInterface028 {
    getAt(key: string): int;
  }

interface MultiGenericInterface029<K, V> {
    getKey(): K;
    getValue(): V;
  }

interface ConstrainedInterface030<T extends double> {
    getValue(): T;
  }

interface DefaultGenericInterface031<T> {
    getValue(): T;
  }

interface OptionalInterface033 {
    required: string;
    optional: int;
  }

enum TestEnum034 { A, B }

abstract class AbstractClass035 { }

class FinalClass036 { }

class MyClass040 implements MyInterface040 { }

interface MyInterface040 { }

class ChildClass041 extends ParentClass041 { }

class ParentClass041 { }

class MyClass042 implements MyInterface042 { }

interface MyInterface042 { }

interface MyInterface043 { }

interface MyInterface044 { }

class TestClass045 {
    public checkIsInterface(): boolean {
      let cls = Class.current();
      return cls.isInterface();
    }
  }

interface CallableInterface046 {
    call(x: int): string;
  }

interface MyInterface047 { }

interface ConstructableInterface047 {
    create(value: int): MyInterface047;
  }

interface MixedInterface048 {
    property: string;
    method(): int;
  }

class NotInitializedClass055 { }


export default function ClassIsInterfaceTest(): void {
  describe('ClassIsInterfaceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0100
     * @tc.name testClassIsInterface001
     * @tc.desc Verify ClassIsInterface case 001: isInterface()method no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0200
     * @tc.name testClassIsInterface002
     * @tc.desc Verify ClassIsInterface case 002: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0300
     * @tc.name testClassIsInterface003
     * @tc.desc Verify ClassIsInterface case 003: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface003>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0400
     * @tc.name testClassIsInterface004
     * @tc.desc Verify ClassIsInterface case 004: std.core interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<JsonSerializable>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0500
     * @tc.name testClassIsInterface005
     * @tc.desc Verify ClassIsInterface case 005: multiple interface return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass005>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0600
     * @tc.name testClassIsInterface006
     * @tc.desc Verify ClassIsInterface case 006: generic interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericInterface006<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0700
     * @tc.name testClassIsInterface007
     * @tc.desc Verify ClassIsInterface case 007: return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0800
     * @tc.name testClassIsInterface008
     * @tc.desc Verify ClassIsInterface case 008: abstract class return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass008>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_0900
     * @tc.name testClassIsInterface009
     * @tc.desc Verify ClassIsInterface case 009: final return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass009>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1000
     * @tc.name testClassIsInterface010
     * @tc.desc Verify ClassIsInterface case 010: return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum010>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1100
     * @tc.name testClassIsInterface011
     * @tc.desc Verify ClassIsInterface case 011: Array return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<int>>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1200
     * @tc.name testClassIsInterface012
     * @tc.desc Verify ClassIsInterface case 012: Map return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<string, int>>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1300
     * @tc.name testClassIsInterface013
     * @tc.desc Verify ClassIsInterface case 013: Set return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<int>>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1400
     * @tc.name testClassIsInterface014
     * @tc.desc Verify ClassIsInterface case 014: type should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1500
     * @tc.name testClassIsInterface015
     * @tc.desc Verify ClassIsInterface case 015: FixedArraytype return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1600
     * @tc.name testClassIsInterface016
     * @tc.desc Verify ClassIsInterface case 016: type return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1700
     * @tc.name testClassIsInterface017
     * @tc.desc Verify ClassIsInterface case 017: PRIMITIVE_BOOLEAN type return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.PRIMITIVE_BOOLEAN.isInterface();
        expect(result).assertFalse();
        
        let result2 = Class.PRIMITIVE_INT.isInterface();
        expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1800
     * @tc.name testClassIsInterface018
     * @tc.desc Verify ClassIsInterface case 018: inheritance interface interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildInterface018>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_1900
     * @tc.name testClassIsInterface019
     * @tc.desc Verify ClassIsInterface case 019: interface return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass019>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2000
     * @tc.name testClassIsInterface020
     * @tc.desc Verify ClassIsInterface case 020: inheritance return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Child020>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2100
     * @tc.name testClassIsInterface021
     * @tc.desc Verify ClassIsInterface case 021: verify return is booleantype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let result = cls.isInterface();
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2200
     * @tc.name testClassIsInterface022
     * @tc.desc Verify ClassIsInterface case 022: not return undefined null or
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2300
     * @tc.name testClassIsInterface023
     * @tc.desc Verify ClassIsInterface case 023: Classobject call return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let result1 = cls.isInterface();
        let result2 = cls.isInterface();
        expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2400
     * @tc.name testClassIsInterface024
     * @tc.desc Verify ClassIsInterface case 024: type different Classinstance return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<ArrayLike<int>>();
        let cls2 = Class.from<ArrayLike<int>>();
        expect(cls1.isInterface()).assertEqual(cls2.isInterface());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2500
     * @tc.name testClassIsInterface025
     * @tc.desc Verify ClassIsInterface case 025: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyInterface025>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2600
     * @tc.name testClassIsInterface026
     * @tc.desc Verify ClassIsInterface case 026: property interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ReadonlyInterface026>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2700
     * @tc.name testClassIsInterface027
     * @tc.desc Verify ClassIsInterface case 027: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FunctionInterface027>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2800
     * @tc.name testClassIsInterface028
     * @tc.desc Verify ClassIsInterface case 028: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<IndexSignatureInterface028>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_2900
     * @tc.name testClassIsInterface029
     * @tc.desc Verify ClassIsInterface case 029: multiple generic parameters interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiGenericInterface029<string, int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3000
     * @tc.name testClassIsInterface030
     * @tc.desc Verify ClassIsInterface case 030: type generic interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConstrainedInterface030<double>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3100
     * @tc.name testClassIsInterface031
     * @tc.desc Verify ClassIsInterface case 031: type parameters interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<DefaultGenericInterface031<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3200
     * @tc.name testClassIsInterface032
     * @tc.desc Verify ClassIsInterface case 032: type type return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<string | int>();
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3300
     * @tc.name testClassIsInterface033
     * @tc.desc Verify ClassIsInterface case 033: property interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OptionalInterface033>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3400
     * @tc.name testClassIsInterface034
     * @tc.desc Verify ClassIsInterface case 034: type isEnumreturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum034>();
        expect(cls.isEnum()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3500
     * @tc.name testClassIsInterface035
     * @tc.desc Verify ClassIsInterface case 035: abstract class isAbstractreturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass035>();
        expect(cls.isAbstract()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3600
     * @tc.name testClassIsInterface036
     * @tc.desc Verify ClassIsInterface case 036: final isFinalreturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass036>();
        expect(cls.isFinal()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3700
     * @tc.name testClassIsInterface037
     * @tc.desc Verify ClassIsInterface case 037: type isPrimitivereturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_INT.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3800
     * @tc.name testClassIsInterface038
     * @tc.desc Verify ClassIsInterface case 038: type isUnionreturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        expect(cls.isUnion()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_3900
     * @tc.name testClassIsInterface039
     * @tc.desc Verify ClassIsInterface case 039: array isFixedArrayreturn true isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        expect(cls.isFixedArray()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4000
     * @tc.name testClassIsInterface040
     * @tc.desc Verify ClassIsInterface case 040: interface interface isInterfacereturn true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass040>();
        let interfaces = cls.getInterfaces();
        expect(interfaces.length).assertEqual(1);
        expect(interfaces[0].isInterface()).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4100
     * @tc.name testClassIsInterface041
     * @tc.desc Verify ClassIsInterface case 041: get isInterfacereturn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass041>();
        let superCls = cls.getSuper();
        if (superCls !== undefined) {
          expect(superCls.isInterface()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4200
     * @tc.name testClassIsInterface042
     * @tc.desc Verify ClassIsInterface case 042: via instance get Class after call isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass042();
        let cls = Class.of(obj);
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4300
     * @tc.name testClassIsInterface043
     * @tc.desc Verify ClassIsInterface case 043: via type get Class after call isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface043>();
        expect(cls.isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4400
     * @tc.name testClassIsInterface044
     * @tc.desc Verify ClassIsInterface case 044: via Anytype get Class after call isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Any = { } as MyInterface044;
        let cls = Class.ofAny(obj);
        expect(cls !== undefined).assertTrue();
        if (cls !== undefined) {
          expect(cls.isInterface()).assertFalse(); // 对象字面量不是接口类型
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4500
     * @tc.name testClassIsInterface045
     * @tc.desc Verify ClassIsInterface case 045: get isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new TestClass045();
        expect(obj.checkIsInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4600
     * @tc.name testClassIsInterface046
     * @tc.desc Verify ClassIsInterface case 046: call interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CallableInterface046>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4700
     * @tc.name testClassIsInterface047
     * @tc.desc Verify ClassIsInterface case 047: interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConstructableInterface047>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4800
     * @tc.name testClassIsInterface048
     * @tc.desc Verify ClassIsInterface case 048: when property method interface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedInterface048>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_4900
     * @tc.name testClassIsInterface049
     * @tc.desc Verify ClassIsInterface case 049: Iterableinterface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Iterable<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5000
     * @tc.name testClassIsInterface050
     * @tc.desc Verify ClassIsInterface case 050: Iteratorinterface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Iterator<int>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5100
     * @tc.name testClassIsInterface051
     * @tc.desc Verify ClassIsInterface case 051: Comparableinterface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Comparable<Object>>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5200
     * @tc.name testClassIsInterface052
     * @tc.desc Verify ClassIsInterface case 052: Cloneableinterface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Cloneable052Marker>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5300
     * @tc.name testClassIsInterface053
     * @tc.desc Verify ClassIsInterface case 053: Serializableinterface return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Serializable053Marker>();
        let result = cls.isInterface();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5400
     * @tc.name testClassIsInterface054
     * @tc.desc Verify ClassIsInterface case 054: isInterfacemethod not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          let cls = Class.from<ArrayLike<int>>();
          let result = cls.isInterface();
          expect(result).assertTrue();
        } catch (error) {
          expect().assertFail(); // 不应该进入这里
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5500
     * @tc.name testClassIsInterface055
     * @tc.desc Verify ClassIsInterface case 055: call isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NotInitializedClass055>();
        // 未调用initialize()，直接调用isInterface
        let result = cls.isInterface();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5600
     * @tc.name testClassIsInterface056
     * @tc.desc Verify ClassIsInterface case 056: when call isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        for (let i = 0; i < 10000; i++) {
          let result = cls.isInterface();
          expect(result).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISINTERFACE_5700
     * @tc.name testClassIsInterface057
     * @tc.desc Verify ClassIsInterface case 057: different type isInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsInterface057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let interfaceCls = Class.from<ArrayLike<int>>();
        let classCls = Class.from<Array<int>>();
        let enumCls = Class.from<TestEnum010>();
        
        for (let i = 0; i < 1000; i++) {
          expect(interfaceCls.isInterface()).assertTrue();
          expect(classCls.isInterface()).assertFalse();
          expect(enumCls.isInterface()).assertFalse();
        }
    });

  });
}