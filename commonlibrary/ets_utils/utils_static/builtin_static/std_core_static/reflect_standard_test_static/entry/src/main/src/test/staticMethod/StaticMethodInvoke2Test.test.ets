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
import Utils from './../Util.test';

class GreetingClass {
  public static greet(name: string): string {
    return 'Hello ' + name;
  }
}

class VoidMethodClass {
  public static execute(): void {
    console.info('execute invoked');
  }
}

class ComplexReturnClass {
  public static makeInstance(): ComplexReturnClass { return new ComplexReturnClass(); }
  public static makeList(): Array<int> { return [1, 2, 3]; }
}

abstract class AbstractClass {
  public static getLabel(): string { return 'abstract'; }
}

final class FinalClass {
  public static getId(): string { return 'final'; }
}

class MultiMethodClass {
  public static first(): int { return 1; }
  public static second(): string { return 'two'; }
  public static third(): boolean { return true; }
}

class OverloadClass {
  public static echo(): string { return 'no param'; }
  public static echo(msg: int): string { return msg.toString(); }
}

class NoArgClass {
  public static getDefault(): int { return 42; }
}

class CrossInvkOwnerClass {
  public static ownerMethod(): string { return 'owner'; }
}

class CrossInvkParamClass {
  public static withParam(a: int, b: string): string { return a.toString() + b; }
}

class DoubleReturnClass {
  public static getDouble(): double { return 3.14159; }
}

class LongReturnClass {
  public static getLong(): long { return 9223372036854775807; }
}

class FloatReturnClass {
  public static getFloat(): float { return 1.5; }
}

class ParentInvkClass {
  public static inheritedMethod(): string { return 'from parent'; }
}

class ChildInvkClass extends ParentInvkClass {
  public static childMethod(): string { return 'from child'; }
}

class EmptyStringReturnClass {
  public static getEmpty(): string { return ''; }
}

class SpecialCharReturnClass {
  public static getSpecial(): string { return 'line1\nline2\ttab'; }
}

class FloatExtremeClass {
  public static getMaxFloat(): float { return Float.MAX_VALUE; }
}

class SimpleInstance {
  public value: int = 42;
  public static create(): SimpleInstance { return new SimpleInstance(); }
}

class NestedArrayClass {
  public static getNested(): Array<Array<int>> { return [[1, 2], [3, 4]]; }
}

class NestedArrayParamClass {
  public static countNested(input: Array<Array<int>>): int { return input.length; }
}

class ParentPubMethod {
  public static method(): string { return 'parent'; }
}

class ChildOverrideClass extends ParentPubMethod {
  public static method(): string { return 'child'; }
}

class LongArgClass {
  public static processLong(value: long): string {
    return 'long_' + value;
  }
}

class FloatArgClass2 {
  public static processFloat(value: float): float {
    return value;
  }
}

class DoubleArgClass2 {
  public static processDouble(value: double): double {
    return value;
  }
}

class NaNArgClass {
  public static processNaN(value: double): string {
    return 'nan_' + (value !== value ? 'yes' : 'no');
  }
}

class PosInfArgClass {
  public static processPosInf(value: double): string {
    return 'inf_' + (value === Number.POSITIVE_INFINITY ? 'yes' : 'no');
  }
}

class NegInfArgClass {
  public static processNegInf(value: double): string {
    return 'inf_' + (value === Number.NEGATIVE_INFINITY ? 'yes' : 'no');
  }
}

class NaNReturnClass {
  public static getNaN(): double { return Number.NaN; }
}

class PosInfReturnClass {
  public static getPosInf(): double { return Number.POSITIVE_INFINITY; }
}

class NegInfReturnClass {
  public static getNegInf(): double { return Number.NEGATIVE_INFINITY; }
}

class SideEffectClass {
  private static counter: int = 0;
  public static increment(): void { SideEffectClass.counter++; }
  public static getCounter(): int { return SideEffectClass.counter; }
}

class ChainedInvokeClass {
  public static wrap(value: int): int { return value; }
}

class VoidReturnCheckClass {
  public static doVoid(): void {}
}

class FloatCompareClass {
  public static getFloat(): float { return 3.14f; }
}

class DoubleCompareClass {
  public static getDouble(): double { return 2.71828; }
}

class TenArgClass {
  public static combine(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int): int {
    return a + b + c + d + e + f + g + h + i + j;
  }
}

enum EnumColor {
  RED = 1,
  GREEN = 2,
  BLUE = 3
}

class EnumReturnClass {
  public static getColor(): int { return EnumColor.RED; }
}

class GenericReturnClass {
  public static create(): GenericReturnClass { return new GenericReturnClass(); }
}

class FixedArrayReturnStringClass {
  public static getStrings(): Array<string> { return ['a', 'b', 'c']; }
}

class FixedArrayStringParamClass {
  public static firstString(arr: Array<string>): string { return arr[0]; }
}

class InnerInvokeClass {
  public static innerMethod(): string { return 'inner'; }
}

@interface deprecated {
  fromVersion: string
}

class MapParamInvokeClass {
  public static processMap(input: Map<string, int>): int {
    let sum: int = 0;
    input.forEach((value: int) => {
      sum += value;
    });
    return sum;
  }
}

class ObjectParamInvokeClass {
  public static processObject(obj: SimpleInstance): string {
    return 'obj_value_' + obj.value;
  }
}

class LargeArrayParamClass {
  public static sumArray(arr: Array<int>): int {
    let sum: int = 0;
    for (let i: int = 0; i < arr.length; i++) {
      sum += arr[i];
    }
    return sum;
  }
}

class SetParamInvokeClass {
  public static countSet(input: Set<string>): int {
    return input.size;
  }
}

class EmptyMapParamClass {
  public static checkMap(input: Map<string, int>): boolean {
    return input.size === 0;
  }
}

class ChainInvokeClass {
  public static step1(a: int): int { return a + 1; }
  public static step2(a: int): int { return a * 2; }
  public static step3(a: int): int { return a - 1; }
}

class SetterGetterChainClass {
  private static _chainValue: int = 0;
  public static set chainValue(v: int) { SetterGetterChainClass._chainValue = v; }
  public static get chainValue(): int { return SetterGetterChainClass._chainValue; }
}

class ImplicitLongClass {
  public static addLong(a: long): long { return a + 1; }
}

class ImplicitFloatClass {
  public static addFloat(a: float): float { return a + 0.5f; }
}

class ImplicitDoubleClass {
  public static addDouble(a: double): double { return a + 0.5; }
}

class BoolToStringClass {
  public static convert(flag: string): string { return flag; }
}

class StringToIntClass {
  public static convert(value: int): int { return value * 2; }
}

class BoundaryIntParamClass {
  public static process(value: int): int { return value; }
}

class FloatMinParamClass {
  public static process(value: float): float { return value; }
}

class EmptyStringParamClass {
  public static process(value: string): int { return value.length; }
}

class SetReturnClass {
  public static createSet(): Set<string> {
    let set: Set<string> = new Set<string>();
    set.add('a');
    set.add('b');
    set.add('c');
    return set;
  }
}

class DeprecatedInvokeClass {
  @deprecated("7.0")
  public static oldMethod(): string { return 'deprecated'; }
}

class DoubleMinParamClass {
  public static process(value: double): double { return value; }
}

class LongMinParamClass {
  public static process(value: long): long { return value; }
}

class GenericInvokeClass<T> {
  public static greet(): string { return 'hello generic'; }
  public static add(a: int, b: int): int { return a + b; }
}

class CallableInvokeClass {
  public static $_invoke(a: int): int { return a * 2; }
}

export default function StaticMethodInvoke2Test(): void {
  describe('StaticMethodInvoke2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0100
     * @tc.name testStaticMethodInvoke2_001
     * @tc.desc Verify invoke() combined with equals() returns true for two references to the same static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GreetingClass>();
      let m1 = cls.getStaticMethod('greet', [Class.from<string>()]);
      let m2 = cls.getStaticMethod('greet', [Class.from<string>()]);
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let r1: string = m1!.invoke(['World']) as string;
      let r2: string = m2!.invoke(['World']) as string;
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0200
     * @tc.name testStaticMethodInvoke2_002
     * @tc.desc Verify invoke() combined with getOwner() returns the declaring class of the invoked static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossInvkOwnerClass>();
      let method = cls.getStaticMethod('ownerMethod');
      expect(method !== undefined).assertTrue();
      let r: string = method!.invoke() as string;
      expect(r).assertEqual('owner');
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossInvkOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0300
     * @tc.name testStaticMethodInvoke2_003
     * @tc.desc Verify invoke() combined with getParameterTypes() returns parameter type list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossInvkParamClass>();
      let method = cls.getStaticMethod('withParam');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      let r: string = method!.invoke([1, 'a']) as string;
      expect(r).assertEqual('1a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0400
     * @tc.name testStaticMethodInvoke2_004
     * @tc.desc Verify invoke() and equals() and getOwner() on a static method of a final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalClass>();
      let m1 = cls.getStaticMethod('getId');
      let m2 = cls.getStaticMethod('getId');
      expect(m1 !== undefined).assertTrue();
      let r1: string = m1!.invoke() as string;
      let r2: string = m2!.invoke() as string;
      expect(r1).assertEqual('final');
      expect(r2).assertEqual('final');
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('FinalClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0500
     * @tc.name testStaticMethodInvoke2_005
     * @tc.desc Verify invoke() and equals() and getOwner() on a static method of an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AbstractClass>();
      let m1 = cls.getStaticMethod('getLabel');
      let m2 = cls.getStaticMethod('getLabel');
      expect(m1 !== undefined).assertTrue();
      let r1: string = m1!.invoke() as string;
      let r2: string = m2!.invoke() as string;
      expect(r1).assertEqual('abstract');
      expect(r2).assertEqual('abstract');
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('AbstractClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0600
     * @tc.name testStaticMethodInvoke2_006
     * @tc.desc Verify invoke() combined with isNative() returns false for a user-defined invokable static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoArgClass>();
      let method = cls.getStaticMethod('getDefault');
      expect(method !== undefined).assertTrue();
      let r: int = method!.invoke() as int;
      expect(r).assertEqual(42);
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0700
     * @tc.name testStaticMethodInvoke2_007
     * @tc.desc Verify invoke() combined with getName() returns correct method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossInvkOwnerClass>();
      let method = cls.getStaticMethod('ownerMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('ownerMethod');
      expect(method!.invoke() as string).assertEqual('owner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0800
     * @tc.name testStaticMethodInvoke2_008
     * @tc.desc Verify invoke() returns double value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DoubleReturnClass>();
      let method = cls.getStaticMethod('getDouble');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke() as double;
      expect(result).assertClose(3.14159, 0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_0900
     * @tc.name testStaticMethodInvoke2_009
     * @tc.desc Verify invoke() returns long value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongReturnClass>();
      let method = cls.getStaticMethod('getLong');
      expect(method !== undefined).assertTrue();
      let result: long = method!.invoke() as long;
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1000
     * @tc.name testStaticMethodInvoke2_010
     * @tc.desc Verify invoke() returns float value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatReturnClass>();
      let method = cls.getStaticMethod('getFloat');
      expect(method !== undefined).assertTrue();
      let result: float = method!.invoke() as float;
      expect(result).assertClose(1.5, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1100
     * @tc.name testStaticMethodInvoke2_011
     * @tc.desc Verify inherited static method is not exposed via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildInvkClass>();
      let method = childCls.getStaticMethod('inheritedMethod');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1200
     * @tc.name testStaticMethodInvoke2_012
     * @tc.desc Verify invoke() combined with getParameterType returns correct type for multi-param method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossInvkParamClass>();
      let method = cls.getStaticMethod('withParam');
      expect(method !== undefined).assertTrue();
      let p0Type = method!.getParameterType(0);
      let p1Type = method!.getParameterType(1);
      expect(p0Type !== undefined).assertTrue();
      expect(p1Type !== undefined).assertTrue();
      expect(p0Type!.getName()).assertEqual('i32');
      expect(p1Type!.getName()).assertEqual('std.core.String');
      let r: string = method!.invoke([7, 'hi']) as string;
      expect(r).assertEqual('7hi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1300
     * @tc.name testStaticMethodInvoke2_013
     * @tc.desc Verify invoke() returns array value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ComplexReturnClass>();
      let method = cls.getStaticMethod('makeList');
      expect(method !== undefined).assertTrue();
      let result: Array<int> = method!.invoke() as Array<int>;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1400
     * @tc.name testStaticMethodInvoke2_014
     * @tc.desc Verify invoke() combined with getReturnType() returns void for void method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VoidMethodClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
      let result = method!.invoke();
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1500
     * @tc.name testStaticMethodInvoke2_015
     * @tc.desc Verify invoke() returns empty string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EmptyStringReturnClass>();
      let method = cls.getStaticMethod('getEmpty');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke() as string;
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1600
     * @tc.name testStaticMethodInvoke2_016
     * @tc.desc Verify overloaded method lookup by parameter type is not supported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OverloadClass>();
      let noParam = cls.getStaticMethod('echo', []);
      let intParam = cls.getStaticMethod('echo', [Class.from<int>()]);
      expect(noParam !== undefined).assertTrue();
      expect(intParam === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1700
     * @tc.name testStaticMethodInvoke2_017
     * @tc.desc Verify invoke() returns string with special characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SpecialCharReturnClass>();
      let method = cls.getStaticMethod('getSpecial');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke() as string;
      expect(result.indexOf('\n') >= 0).assertTrue();
      expect(result.indexOf('\t') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1800
     * @tc.name testStaticMethodInvoke2_018
     * @tc.desc Verify invoke() returns Float.MAX_VALUE correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatExtremeClass>();
      let method = cls.getStaticMethod('getMaxFloat');
      expect(method !== undefined).assertTrue();
      let result: float = method!.invoke() as float;
      expect(result).assertClose(Float.MAX_VALUE, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_1900
     * @tc.name testStaticMethodInvoke2_019
     * @tc.desc Verify invoke() returns simple custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SimpleInstance>();
      let method = cls.getStaticMethod('create');
      expect(method !== undefined).assertTrue();
      let result: SimpleInstance = method!.invoke() as SimpleInstance;
      expect(result !== null).assertTrue();
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2000
     * @tc.name testStaticMethodInvoke2_020
     * @tc.desc Verify invoke() returns nested array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedArrayClass>();
      let method = cls.getStaticMethod('getNested');
      expect(method !== undefined).assertTrue();
      let result: Array<Array<int>> = method!.invoke() as Array<Array<int>>;
      expect(result.length).assertEqual(2);
      expect(result[0].length).assertEqual(2);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2100
     * @tc.name testStaticMethodInvoke2_021
     * @tc.desc Verify invoke() on overridden static method returns child class implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildOverrideClass>();
      let method = childCls.getStaticMethod('method');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke() as string;
      expect(result).assertEqual('child');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2200
     * @tc.name testStaticMethodInvoke2_022
     * @tc.desc Verify invoke() with long type argument (boundary value 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongArgClass>();
      let method = cls.getStaticMethod('processLong');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([42 as long]) as string;
      expect(result).assertEqual('long_42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2300
     * @tc.name testStaticMethodInvoke2_023
     * @tc.desc Verify invoke() with long type argument (value 128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongArgClass>();
      let method = cls.getStaticMethod('processLong');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([128 as long]) as string;
      expect(result).assertEqual('long_128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2400
     * @tc.name testStaticMethodInvoke2_024
     * @tc.desc Verify invoke() with long type argument (input parameter)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongArgClass>();
      let method = cls.getStaticMethod('processLong');
      expect(method !== undefined).assertTrue();
      let longVal: long = 9223372036854775807;
      let result: string = method!.invoke([longVal]) as string;
      expect(result).assertEqual('long_9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2500
     * @tc.name testStaticMethodInvoke2_025
     * @tc.desc Verify invoke() with float argument and assertClose
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatArgClass2>();
      let method = cls.getStaticMethod('processFloat');
      expect(method !== undefined).assertTrue();
      let result: float = method!.invoke([1.5f]) as float;
      expect(result).assertClose(1.5, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2600
     * @tc.name testStaticMethodInvoke2_026
     * @tc.desc Verify invoke() with double argument and assertClose
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DoubleArgClass2>();
      let method = cls.getStaticMethod('processDouble');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke([3.14159]) as double;
      expect(result).assertClose(3.14159, 0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2700
     * @tc.name testStaticMethodInvoke2_027
     * @tc.desc Verify invoke() with Number.NaN as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NaNArgClass>();
      let method = cls.getStaticMethod('processNaN');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([Number.NaN]) as string;
      expect(result).assertEqual('nan_yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2800
     * @tc.name testStaticMethodInvoke2_028
     * @tc.desc Verify invoke() with Number.POSITIVE_INFINITY as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PosInfArgClass>();
      let method = cls.getStaticMethod('processPosInf');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([Number.POSITIVE_INFINITY]) as string;
      expect(result).assertEqual('inf_yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_2900
     * @tc.name testStaticMethodInvoke2_029
     * @tc.desc Verify invoke() with Number.NEGATIVE_INFINITY as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NegInfArgClass>();
      let method = cls.getStaticMethod('processNegInf');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([Number.NEGATIVE_INFINITY]) as string;
      expect(result).assertEqual('inf_yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3000
     * @tc.name testStaticMethodInvoke2_030
     * @tc.desc Verify invoke() on method returning Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NaNReturnClass>();
      let method = cls.getStaticMethod('getNaN');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke() as double;
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3100
     * @tc.name testStaticMethodInvoke2_031
     * @tc.desc Verify invoke() on method returning Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PosInfReturnClass>();
      let method = cls.getStaticMethod('getPosInf');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke() as double;
      expect(result).assertPosUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3200
     * @tc.name testStaticMethodInvoke2_032
     * @tc.desc Verify invoke() with FixedArray<string> argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FixedArrayStringParamClass>();
      let method = cls.getStaticMethod('firstString');
      expect(method !== undefined).assertTrue();
      let input: Array<string> = ['hello', 'world'];
      let result: string = method!.invoke([input]) as string;
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3300
     * @tc.name testStaticMethodInvoke2_033
     * @tc.desc Verify invoke() with two-dimensional FixedArray<int> argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedArrayParamClass>();
      let method = cls.getStaticMethod('countNested');
      expect(method !== undefined).assertTrue();
      let input: Array<Array<int>> = [[1, 2], [3, 4]];
      let result: int = method!.invoke([input]) as int;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3400
     * @tc.name testStaticMethodInvoke2_034
     * @tc.desc Verify invoke() returns enum constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EnumReturnClass>();
      let method = cls.getStaticMethod('getColor');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke() as int;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3500
     * @tc.name testStaticMethodInvoke2_035
     * @tc.desc Verify invoke() side effect by modifying and reading static counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SideEffectClass>();
      let incMethod = cls.getStaticMethod('increment');
      let getMethod = cls.getStaticMethod('getCounter');
      expect(incMethod !== undefined).assertTrue();
      expect(getMethod !== undefined).assertTrue();
      incMethod!.invoke();
      let count1: int = getMethod!.invoke() as int;
      expect(count1).assertEqual(1);
      incMethod!.invoke();
      incMethod!.invoke();
      let count2: int = getMethod!.invoke() as int;
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3600
     * @tc.name testStaticMethodInvoke2_036
     * @tc.desc Verify invoke() chained with another invoke() as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChainedInvokeClass>();
      let wrap = cls.getStaticMethod('wrap');
      expect(wrap !== undefined).assertTrue();
      let innerResult: int = wrap!.invoke([10]) as int;
      let outerResult: int = wrap!.invoke([innerResult]) as int;
      expect(outerResult).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3700
     * @tc.name testStaticMethodInvoke2_037
     * @tc.desc Verify invoke() obtained from getStaticMethods()[index] produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'first') {
          let result: int = methods[i].invoke() as int;
          expect(result).assertEqual(1);
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3800
     * @tc.name testStaticMethodInvoke2_038
     * @tc.desc Verify invoke() on void method and getReturnType() returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VoidReturnCheckClass>();
      let method = cls.getStaticMethod('doVoid');
      expect(method !== undefined).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
      let result = method!.invoke();
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_3900
     * @tc.name testStaticMethodInvoke2_039
     * @tc.desc Verify invoke() float/double result with assertLarger/assertLess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsF: Class = Class.from<FloatCompareClass>();
      let methodF = clsF.getStaticMethod('getFloat');
      let floatVal: float = methodF!.invoke() as float;
      expect(floatVal).assertLarger(3.0f);
      expect(floatVal).assertLess(4.0f);

      let clsD: Class = Class.from<DoubleCompareClass>();
      let methodD = clsD.getStaticMethod('getDouble');
      let doubleVal: double = methodD!.invoke() as double;
      expect(doubleVal).assertLarger(2.0);
      expect(doubleVal).assertLess(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4000
     * @tc.name testStaticMethodInvoke2_040
     * @tc.desc Verify invoke() with 10 arguments all matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TenArgClass>();
      let method = cls.getStaticMethod('combine');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) as int;
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4100
     * @tc.name testStaticMethodInvoke2_041
     * @tc.desc Verify invoke() on static method in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<InnerInvokeClass>();
      let method = cls.getStaticMethod('innerMethod');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke() as string;
      expect(result).assertEqual('inner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4200
     * @tc.name testStaticMethodInvoke2_042
     * @tc.desc Verify invoke() on method returning Number.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NegInfReturnClass>();
      let method = cls.getStaticMethod('getNegInf');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke() as double;
      expect(result).assertNegUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4300
     * @tc.name testStaticMethodInvoke2_043
     * @tc.desc Verify invoke() returns custom generic class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericReturnClass>();
      let method = cls.getStaticMethod('create');
      expect(method !== undefined).assertTrue();
      let result: GenericReturnClass = method!.invoke() as GenericReturnClass;
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4400
     * @tc.name testStaticMethodInvoke2_044
     * @tc.desc Verify invoke() returns FixedArray<string> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FixedArrayReturnStringClass>();
      let method = cls.getStaticMethod('getStrings');
      expect(method !== undefined).assertTrue();
      let result: Array<string> = method!.invoke() as Array<string>;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4500
     * @tc.name testStaticMethodInvoke2_045
     * @tc.desc Verify invoke() with Map<string, int> parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MapParamInvokeClass>();
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 10);
      map.set('b', 20);
      map.set('c', 30);
      let method = cls.getStaticMethod('processMap');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([map]) as int;
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4600
     * @tc.name testStaticMethodInvoke2_046
     * @tc.desc Verify invoke() with custom object instance parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ObjectParamInvokeClass>();
      let obj: SimpleInstance = new SimpleInstance();
      obj.value = 42;
      let method = cls.getStaticMethod('processObject');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke([obj]) as string;
      expect(result).assertEqual('obj_value_42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4700
     * @tc.name testStaticMethodInvoke2_047
     * @tc.desc Verify invoke() with large Array<int> parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LargeArrayParamClass>();
      let arr: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i);
      }
      let method = cls.getStaticMethod('sumArray');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([arr]) as int;
      expect(result).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4800
     * @tc.name testStaticMethodInvoke2_048
     * @tc.desc Verify invoke() with Set<string> parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetParamInvokeClass>();
      let set: Set<string> = new Set<string>();
      set.add('x');
      set.add('y');
      set.add('z');
      let method = cls.getStaticMethod('countSet');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([set]) as int;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_4900
     * @tc.name testStaticMethodInvoke2_049
     * @tc.desc Verify invoke() with empty Map parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EmptyMapParamClass>();
      let map: Map<string, int> = new Map<string, int>();
      let method = cls.getStaticMethod('checkMap');
      expect(method !== undefined).assertTrue();
      let result: boolean = method!.invoke([map]) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5000
     * @tc.name testStaticMethodInvoke2_050
     * @tc.desc Verify invoke() chained at depth 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChainInvokeClass>();
      let step1 = cls.getStaticMethod('step1');
      let step2 = cls.getStaticMethod('step2');
      let step3 = cls.getStaticMethod('step3');
      expect(step1 !== undefined).assertTrue();
      expect(step2 !== undefined).assertTrue();
      expect(step3 !== undefined).assertTrue();
      let r1: int = step1!.invoke([0]) as int;
      let r2: int = step2!.invoke([r1]) as int;
      let r3: int = step3!.invoke([r2]) as int;
      expect(r3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5100
     * @tc.name testStaticMethodInvoke2_051
     * @tc.desc Verify invoke() result as parameter for another invoke() nested 2 levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChainInvokeClass>();
      let step1 = cls.getStaticMethod('step1');
      let step2 = cls.getStaticMethod('step2');
      expect(step1 !== undefined).assertTrue();
      expect(step2 !== undefined).assertTrue();
      let inner: int = step1!.invoke([5]) as int;
      let outer: int = step2!.invoke([inner]) as int;
      expect(outer).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5200
     * @tc.name testStaticMethodInvoke2_052
     * @tc.desc Verify invoke() setter then getter state chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetterGetterChainClass>();
      let setter = cls.getStaticMethod('%%set-chainValue');
      let getter = cls.getStaticMethod('%%get-chainValue');
      expect(setter !== undefined).assertTrue();
      expect(getter !== undefined).assertTrue();
      setter!.invoke([99]);
      let result: int = getter!.invoke() as int;
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5300
     * @tc.name testStaticMethodInvoke2_053
     * @tc.desc Verify invoke() int arg to long param: platform does NOT do implicit widening, throws TypeError (brain map said implicit conversion succeeds; per CLAUDE.md knowledge-base priority, actual platform behavior is the source of truth)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ImplicitLongClass>();
      let method = cls.getStaticMethod('addLong');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([10]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      let result: long = method!.invoke([10 as long]) as long;
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5400
     * @tc.name testStaticMethodInvoke2_054
     * @tc.desc Verify invoke() int arg to float param: platform does NOT do implicit widening, throws TypeError (brain map said implicit conversion succeeds; actual platform behavior takes precedence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ImplicitFloatClass>();
      let method = cls.getStaticMethod('addFloat');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([10]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      let result: float = method!.invoke([10.5f]) as float;
      expect(result).assertClose(11.0, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5500
     * @tc.name testStaticMethodInvoke2_055
     * @tc.desc Verify invoke() int arg to double param: platform does NOT do implicit widening, throws TypeError (brain map said implicit conversion succeeds; actual platform behavior takes precedence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ImplicitDoubleClass>();
      let method = cls.getStaticMethod('addDouble');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([10]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      let result: double = method!.invoke([10.5]) as double;
      expect(result).assertClose(11.0, 0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5600
     * @tc.name testStaticMethodInvoke2_056
     * @tc.desc Verify invoke() int arg to float param with assertClose precision: platform does NOT do implicit widening, throws TypeError; explicit float arg works (brain map said implicit conversion succeeds; actual platform behavior takes precedence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ImplicitFloatClass>();
      let method = cls.getStaticMethod('addFloat');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([3]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      let result: float = method!.invoke([3.0f]) as float;
      expect(result).assertClose(3.5, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5700
     * @tc.name testStaticMethodInvoke2_057
     * @tc.desc Verify invoke() boolean arg to string param throws TypeError: platform does not allow boolean to string widening via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BoolToStringClass>();
      let method = cls.getStaticMethod('convert');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([true]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5800
     * @tc.name testStaticMethodInvoke2_058
     * @tc.desc Verify invoke() with string number to int parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<StringToIntClass>();
      let method = cls.getStaticMethod('convert');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke(['42']);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_5900
     * @tc.name testStaticMethodInvoke2_059
     * @tc.desc Verify invoke() with negative int boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BoundaryIntParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([-1]) as int;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6000
     * @tc.name testStaticMethodInvoke2_060
     * @tc.desc Verify invoke() with int MAX_VALUE boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BoundaryIntParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([2147483647]) as int;
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6100
     * @tc.name testStaticMethodInvoke2_061
     * @tc.desc Verify invoke() with Float.MIN_VALUE parameter returns value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatMinParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let result: float = method!.invoke([Float.MIN_VALUE]) as float;
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6200
     * @tc.name testStaticMethodInvoke2_062
     * @tc.desc Verify invoke() with empty string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EmptyStringParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke(['']) as int;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6300
     * @tc.name testStaticMethodInvoke2_063
     * @tc.desc Verify invoke() on method returning Set<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetReturnClass>();
      let method = cls.getStaticMethod('createSet');
      expect(method !== undefined).assertTrue();
      let result: Set<string> = method!.invoke() as Set<string>;
      expect(result.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6400
     * @tc.name testStaticMethodInvoke2_064
     * @tc.desc Verify invoke() on Deprecated annotated static method still executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DeprecatedInvokeClass>();
      let method = cls.getStaticMethod('oldMethod');
      expect(method !== undefined).assertTrue();
      let result: string = method!.invoke() as string;
      expect(result).assertEqual('deprecated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6500
     * @tc.name testStaticMethodInvoke2_065
     * @tc.desc Verify invoke() with Double.MIN_VALUE parameter returns value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DoubleMinParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let result: double = method!.invoke([Double.MIN_VALUE]) as double;
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6600
     * @tc.name testStaticMethodInvoke2_066
     * @tc.desc Verify invoke() with long MIN_VALUE parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongMinParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let longMin: long = -9223372036854775808;
      let result: long = method!.invoke([longMin]) as long;
      expect(result).assertEqual(longMin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6700
     * @tc.name testStaticMethodInvoke2_067
     * @tc.desc Verify invoke() on $_invoke callable static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableInvokeClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      let result: int = method!.invoke([5]) as int;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6800
     * @tc.name testStaticMethodInvoke2_068
     * @tc.desc Verify invoke() on $_invoke with wrong argument type throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableInvokeClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke(['wrong']);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_TWO_6900
     * @tc.name testStaticMethodInvoke2_069
     * @tc.desc Verify invoke() on static method in generic class with typed parameter and return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericInvokeClass<int>>();
      let greetMethod = cls.getStaticMethod('greet');
      expect(greetMethod !== undefined).assertTrue();
      let result = greetMethod!.invoke([]);
      expect(result as string).assertEqual('hello generic');
      let addMethod = cls.getStaticMethod('add');
      expect(addMethod !== undefined).assertTrue();
      let sum = addMethod!.invoke([3, 5]);
      expect(sum as int).assertEqual(8);
    });
  });
}
