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

class BaseSingleMethodClass {
  public static process(value: int): string {
    return value.toString();
  }
}

class GrandParentEqClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentEqClass extends GrandParentEqClass {
  public static parentOwn(): int {
    return 1;
  }
}

class ChildEqClass extends ParentEqClass {
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
  public static childOwn(): int {
    return 2;
  }
}

class GenericEqClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class UniqueNameClass {
  public static convert(value: int): string {
    return value.toString();
  }
}

class ZeroArgMethodsClass {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class DifferentReturnTypeClass {
  public static process(value: int): int {
    return value;
  }
  public static process(value: string): string {
    return value;
  }
}

class MultipleParamsClass {
  public static calculate(a: int, b: int): int {
    return a + b;
  }
  public static calculate(a: int, b: int, c: int): int {
    return a + b + c;
  }
}

class NoParamMethodsClass {
  public static method1(): int {
    return 1;
  }
  public static method2(): int {
    return 2;
  }
}

class CrossEqualsGetNameClass {
  public static run(): int {
    return 1;
  }
  public static walk(): string {
    return 'walk';
  }
  public static runEx(): int {
    return 2;
  }
}

class CrossEqualsOwnerClass {
  public static fetch(): int {
    return 1;
  }
}

class CrossEqualsReturnClass {
  public static compute(): int {
    return 42;
  }
  public static computeEx(): string {
    return 'ex';
  }
}

class CrossEqualsParamClass {
  public static handle(x: int): int {
    return x;
  }
  public static handle(x: string): string {
    return x;
  }
}

class L4GrandParentEqClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentEqClass extends L4GrandParentEqClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildEqClass extends L4ParentEqClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildEqClass extends L4ChildEqClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseEqClass {
  public static baseMethod(): int {
    return 0;
  }
}

class L5D1EqClass extends L5BaseEqClass {
  public static d1Method(): string {
    return 'd1';
  }
}

class L5D2EqClass extends L5D1EqClass {
  public static d2Method(): boolean {
    return true;
  }
}

class L5D3EqClass extends L5D2EqClass {
  public static d3Method(): int {
    return 3;
  }
}

class L5D4EqClass extends L5D3EqClass {
  public static d4Method(): string {
    return 'd4';
  }
}

class HeavyOverloadEqClass {
  public static process(): void {}
  public static process(x: int): int {
    return x;
  }
  public static process(x: int, y: string): string {
    return y;
  }
  public static process(x: int, y: string, z: boolean): boolean {
    return z;
  }
  public static process(x: string): string {
    return x;
  }
  public static process(x: string, y: int): boolean {
    return x.length > y;
  }
}

class AllReturnTypeEqClass {
  public static getInt(): int {
    return 1;
  }
  public static getStr(): string {
    return 's';
  }
  public static getBool(): boolean {
    return true;
  }
}

class TripleCrossEqClass {
  public static execute(cmd: string): int {
    return cmd.length;
  }
  public static execute(): string {
    return 'empty';
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum DecimalStrEnum: string { X = '1.5', Y = '2.5', Z = '3.5' }
enum StringEnum: string { SA = "hello", SB = "world" }
enum ByteEnum: byte { BA = 0, BB = 1 }
enum LargeIntEnum: int { LA = 100, LB = 200 }

class NumericParamEqClass {
  public static methodByte(x: byte): void {}
  public static methodShort(x: short): void {}
  public static methodInt(x: int): void {}
  public static methodLong(x: long): void {}
  public static methodFloat(x: float): void {}
  public static methodDouble(x: double): void {}
}

class NumericReturnEqClass {
  public static methodByte(): byte { return 0; }
  public static methodShort(): short { return 0; }
  public static methodIntX(): int { return 0; }
  public static methodLong(): long { return 0; }
  public static methodFloat(): float { return 0; }
  public static methodDouble(): double { return 0.0; }
}

class FixedArrayEqClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faStringParam(x: FixedArray<string>): void {}
  public static faBooleanParam(x: FixedArray<boolean>): void {}
  public static faReturnInt(): FixedArray<int> { return new FixedArray<int>(0); }
}

class MultiFixedArrayEqClass {
  public static faTwoParams(a: FixedArray<int>, b: FixedArray<string>): void {}
}

class EnumMethodEqClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramDecimalStrEnum(e: DecimalStrEnum): void {}
  public static paramStringEnum(e: StringEnum): void {}
  public static paramByteEnum(e: ByteEnum): void {}
  public static paramLargeIntEnum(e: LargeIntEnum): void {}
  public static paramTwoEnums(a: IntEnum, b: StringEnum): void {}
  public static returnIntEnum(): IntEnum { return IntEnum.A; }
}

class ModifierBaseEqClass {
  public static baseOverrideMethod(): void {}
}

class ModifierChildEqClass extends ModifierBaseEqClass {
  public static overrideMethod(): void {}
}

class FinalMethodEqClass {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class NamedMethodEqClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class InterfaceImplEqClass {
  public static interfaceMethod(): string { return "class"; }
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassEqClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
}

class SelfReflexiveEqClass {
  public static compute(x: int): int { return x; }
}

class SymmetricEqClass {
  public static process(x: int): void {}
}

class TransitiveEqClass {
  public static execute(): void {}
}

class EmptyBodyEqClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyEqClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayEqClass {
  public static processArray(arr: string[]): int { return arr.length; }
  public static processNumbers(arr: number[]): int { return arr.length; }
}

class ResizableReturnEqClass {
  public static getFlags(): boolean[] {
    let arr: boolean[] = [];
    arr.push(true);
    arr.push(false);
    arr.push(true);
    return arr;
  }
}

class MultiResizableEqClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayEqClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class MixedMethodTypesEqClass {
  public static alpha(): int { return 1; }
  public static beta(): string { return 'b'; }
  public static gamma(): boolean { return true; }
  public static delta(): void {}
}

class SiblingBaseEq {
  public static shared(): string { return 'base'; }
}

class SiblingAEq extends SiblingBaseEq {
  public static shared(): string { return 'A'; }
}

class SiblingBEq extends SiblingBaseEq {
  public static shared(): string { return 'B'; }
}

class OverloadReturnEqClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadEqClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
  public static processBool(x: boolean): void {}
}

class CrossClassEqA {
  public static process(): string { return 'A'; }
}

class CrossClassEqB {
  public static process(): string { return 'B'; }
}

class CrossClassEqC {
  public static process(): string { return 'C'; }
}

class NestedFixedArrayEqClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedEqClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class MixedNestedEqClass {
  public static complexMethod(arr: FixedArray<int>, matrix: FixedArray<FixedArray<string>>, flag: boolean): void {}
}

class ConflictBaseEqClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildEqClass extends ConflictBaseEqClass {
  public static run(): string { return 'child static'; }
  public run(): string { return 'child instance'; }
}

class OverloadConflictEqClass {
  public static process(): string { return 'static no param'; }
  public static processWithInt(x: int): string { return 'static int'; }
  public process(y: string): string { return 'instance string'; }
}

export default function StaticMethodEquals2Test(): void {
  describe('StaticMethodEquals2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0010
     * @tc.name testStaticMethodEquals2_001
     * @tc.desc Verify equals(null) throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BaseSingleMethodClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      try {
        method!.equals(null!);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0020
     * @tc.name testStaticMethodEquals2_002
     * @tc.desc Verify equals(undefined) throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BaseSingleMethodClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      try {
        method!.equals(undefined!);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0030
     * @tc.name testStaticMethodEquals2_003
     * @tc.desc Verify child class hiding parent static method returns false (different owners)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<GrandParentEqClass>();
      let childCls = Class.from<ChildEqClass>();
      let parentGreet = parentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(parentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      expect(parentGreet!.equals(childGreet!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0040
     * @tc.name testStaticMethodEquals2_004
     * @tc.desc Verify static methods from different generic type parameter instantiations are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericEqClass<int>>();
      let clsStr = Class.from<GenericEqClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.equals(methodStr!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0050
     * @tc.name testStaticMethodEquals2_005
     * @tc.desc Verify getStaticMethod result equals corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UniqueNameClass>();
      let method = cls.getStaticMethod('convert');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'convert') {
          expect(method!.equals(methods[i])).assertTrue();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0060
     * @tc.name testStaticMethodEquals2_006
     * @tc.desc Verify getStaticMethod without param types equals explicit getStaticMethod with empty param types for same zero-arg method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroArgMethodsClass>();
      let methodSimple = cls.getStaticMethod('alpha');
      let methodExplicit = cls.getStaticMethod('alpha', []);
      expect(methodSimple !== undefined).assertTrue();
      expect(methodExplicit !== undefined).assertTrue();
      expect(methodSimple!.equals(methodExplicit!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0070
     * @tc.name testStaticMethodEquals2_007
     * @tc.desc Verify equals() for overloaded methods with different parameter types returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DifferentReturnTypeClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0080
     * @tc.name testStaticMethodEquals2_008
     * @tc.desc Verify equals() for different zero-arg methods returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParamMethodsClass>();
      let method1 = cls.getStaticMethod('method1');
      let method2 = cls.getStaticMethod('method2');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0090
     * @tc.name testStaticMethodEquals2_009
     * @tc.desc Verify equals() and getName() cross-consistency: different instances same method equals true and getName same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossEqualsGetNameClass>();
      let cls2 = Class.from<CrossEqualsGetNameClass>();
      let method1 = cls1.getStaticMethod('run');
      let method2 = cls2.getStaticMethod('run');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('run');
      expect(method2!.getName()).assertEqual('run');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0100
     * @tc.name testStaticMethodEquals2_010
     * @tc.desc Verify equals() and getName() cross-consistency: two different methods in same class have different names and equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossEqualsGetNameClass>();
      let methodRun = cls.getStaticMethod('run');
      let methodWalk = cls.getStaticMethod('walk');
      expect(methodRun !== undefined).assertTrue();
      expect(methodWalk !== undefined).assertTrue();
      expect(methodRun!.getName()).assertEqual('run');
      expect(methodWalk!.getName()).assertEqual('walk');
      expect(methodRun!.equals(methodWalk!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0110
     * @tc.name testStaticMethodEquals2_011
     * @tc.desc Verify equals() and getOwner() cross-consistency: same method from different Class.from has same owner and equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossEqualsOwnerClass>();
      let cls2 = Class.from<CrossEqualsOwnerClass>();
      let method1 = cls1.getStaticMethod('fetch');
      let method2 = cls2.getStaticMethod('fetch');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getOwner().getName()).assertEqual(method2!.getOwner().getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0120
     * @tc.name testStaticMethodEquals2_012
     * @tc.desc Verify equals() and getOwner() cross-consistency: different classes fetch vs run have different owners and equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<CrossEqualsGetNameClass>();
      let clsB = Class.from<CrossEqualsOwnerClass>();
      let methodA = clsA.getStaticMethod('run');
      let methodB = clsB.getStaticMethod('fetch');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getOwner().getName() === methodB!.getOwner().getName()).assertFalse();
      expect(methodA!.equals(methodB!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0130
     * @tc.name testStaticMethodEquals2_013
     * @tc.desc Verify equals() and getReturnType() cross-consistency: methods with same name and same return type equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossEqualsReturnClass>();
      let cls2 = Class.from<CrossEqualsReturnClass>();
      let method1 = cls1.getStaticMethod('compute');
      let method2 = cls2.getStaticMethod('compute');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType().getName()).assertEqual(method2!.getReturnType().getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0140
     * @tc.name testStaticMethodEquals2_014
     * @tc.desc Verify equals() and getReturnType() cross-consistency: different methods have different return types and equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossEqualsReturnClass>();
      let methodC = cls.getStaticMethod('compute');
      let methodE = cls.getStaticMethod('computeEx');
      expect(methodC !== undefined).assertTrue();
      expect(methodE !== undefined).assertTrue();
      expect(methodC!.getReturnType().getName() === methodE!.getReturnType().getName()).assertFalse();
      expect(methodC!.equals(methodE!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0150
     * @tc.name testStaticMethodEquals2_015
     * @tc.desc Verify equals() and getParametersNum() cross-consistency: same method same param count equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<BaseSingleMethodClass>();
      let cls2 = Class.from<BaseSingleMethodClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(method2!.getParametersNum());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0160
     * @tc.name testStaticMethodEquals2_016
     * @tc.desc Verify equals() and getParametersNum() cross-consistency: overloads with 1 vs 2 params equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultipleParamsClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getParametersNum()).assertEqual(2);
      expect(methods[1].getParametersNum()).assertEqual(3);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0170
     * @tc.name testStaticMethodEquals2_017
     * @tc.desc Verify equals() for CrossEqualsParamClass handle(int) vs handle(string): different param types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossEqualsParamClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0180
     * @tc.name testStaticMethodEquals2_018
     * @tc.desc Verify equals() for L4 hierarchy: L4GrandParentEqClass greet vs L4ChildEqClass greet: different owners equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<L4GrandParentEqClass>();
      let childCls = Class.from<L4ChildEqClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(gpGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      expect(gpGreet!.equals(childGreet!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0190
     * @tc.name testStaticMethodEquals2_019
     * @tc.desc Verify equals() for L4ParentEqClass greet vs L4GrandChildEqClass greet: different owners equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<L4ParentEqClass>();
      let gcCls = Class.from<L4GrandChildEqClass>();
      let parentGreet = parentCls.getStaticMethod('greet');
      let gcGreet = gcCls.getStaticMethod('greet');
      expect(parentGreet !== undefined).assertTrue();
      expect(gcGreet !== undefined).assertTrue();
      expect(parentGreet!.equals(gcGreet!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0200
     * @tc.name testStaticMethodEquals2_020
     * @tc.desc Verify equals() and getName() cross-consistency for L4GrandParentEqClass: same name equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<L4GrandParentEqClass>();
      let cls2 = Class.from<L4GrandParentEqClass>();
      let method1 = cls1.getStaticMethod('greet');
      let method2 = cls2.getStaticMethod('greet');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('greet');
      expect(method2!.getName()).assertEqual('greet');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0210
     * @tc.name testStaticMethodEquals2_021
     * @tc.desc Verify equals() for L5BaseEqClass baseMethod vs L5D4EqClass d4Method: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseEqClass>();
      let d4Cls = Class.from<L5D4EqClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      let d4Method = d4Cls.getStaticMethod('d4Method');
      expect(baseMethod !== undefined).assertTrue();
      expect(d4Method !== undefined).assertTrue();
      expect(baseMethod!.equals(d4Method!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0220
     * @tc.name testStaticMethodEquals2_022
     * @tc.desc Verify equals() for HeavyOverloadEqClass process(x: int) from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<HeavyOverloadEqClass>();
      let cls2 = Class.from<HeavyOverloadEqClass>();
      let methods1 = cls1.getStaticMethods();
      let methods2 = cls2.getStaticMethods();
      let found1: boolean = false;
      let idx1: int = -1;
      let found2: boolean = false;
      let idx2: int = -1;
      for (let i: int = 0; i < methods1.length; i++) {
        if (methods1[i].getName() === 'process' && methods1[i].getParametersNum() === 1) {
          idx1 = i;
          found1 = true;
          break;
        }
      }
      for (let i: int = 0; i < methods2.length; i++) {
        if (methods2[i].getName() === 'process' && methods2[i].getParametersNum() === 1) {
          idx2 = i;
          found2 = true;
          break;
        }
      }
      expect(found1).assertTrue();
      expect(found2).assertTrue();
      expect(methods1[idx1].getParametersNum()).assertEqual(1);
      expect(methods2[idx2].getParametersNum()).assertEqual(1);
      expect(methods1[idx1].equals(methods2[idx2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0230
     * @tc.name testStaticMethodEquals2_023
     * @tc.desc Verify equals() and getParametersNum() cross-consistency for HeavyOverloadEqClass: different param counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadEqClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let foundDiff: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        for (let j: int = i + 1; j < methods.length; j++) {
          if (methods[i].getParametersNum() !== methods[j].getParametersNum()) {
            expect(methods[i].equals(methods[j])).assertFalse();
            foundDiff = true;
          }
        }
      }
      expect(foundDiff).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0240
     * @tc.name testStaticMethodEquals2_024
     * @tc.desc Verify equals() for HeavyOverloadEqClass process() vs process(x: int): different param count equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadEqClass>();
      let methods = cls.getStaticMethods();
      let idx0: int = -1;
      let idx1: int = -1;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 0) {
          idx0 = i;
        }
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 1 && idx1 === -1) {
          idx1 = i;
        }
      }
      expect(idx0 >= 0).assertTrue();
      expect(idx1 >= 0).assertTrue();
      expect(methods[idx0].equals(methods[idx1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0250
     * @tc.name testStaticMethodEquals2_025
     * @tc.desc Verify equals() for HeavyOverloadEqClass process(x: int, y: string) vs process(x: int, y: string, z: boolean): diff param count equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadEqClass>();
      let methods = cls.getStaticMethods();
      let idx2: int = -1;
      let idx3: int = -1;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 2) {
          idx2 = i;
        }
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 3) {
          idx3 = i;
        }
      }
      expect(idx2 >= 0).assertTrue();
      expect(idx3 >= 0).assertTrue();
      expect(methods[idx2].equals(methods[idx3])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0260
     * @tc.name testStaticMethodEquals2_026
     * @tc.desc Verify equals() for AllReturnTypeEqClass getInt vs getStr: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeEqClass>();
      let methodInt = cls.getStaticMethod('getInt');
      let methodStr = cls.getStaticMethod('getStr');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.equals(methodStr!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0270
     * @tc.name testStaticMethodEquals2_027
     * @tc.desc Verify equals() for AllReturnTypeEqClass getInt from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<AllReturnTypeEqClass>();
      let cls2 = Class.from<AllReturnTypeEqClass>();
      let method1 = cls1.getStaticMethod('getInt');
      let method2 = cls2.getStaticMethod('getInt');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0280
     * @tc.name testStaticMethodEquals2_028
     * @tc.desc Verify equals() for AllReturnTypeEqClass getStr vs getBool: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeEqClass>();
      let methodStr = cls.getStaticMethod('getStr');
      let methodBool = cls.getStaticMethod('getBool');
      expect(methodStr !== undefined).assertTrue();
      expect(methodBool !== undefined).assertTrue();
      expect(methodStr!.equals(methodBool!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0290
     * @tc.name testStaticMethodEquals2_029
     * @tc.desc Verify equals() for TripleCrossEqClass execute(cmd) vs execute(): different param count equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossEqClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let methodWithParam = methods[0];
      let methodNoParam = methods[0];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getParametersNum() === 1) {
          methodWithParam = methods[i];
        }
        if (methods[i].getParametersNum() === 0) {
          methodNoParam = methods[i];
        }
      }
      expect(methodWithParam.getParametersNum()).assertEqual(1);
      expect(methodNoParam.getParametersNum()).assertEqual(0);
      expect(methodWithParam.equals(methodNoParam)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0300
     * @tc.name testStaticMethodEquals2_030
     * @tc.desc Verify equals() and getName() cross-consistency for TripleCrossEqClass execute: same name equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<TripleCrossEqClass>();
      let cls2 = Class.from<TripleCrossEqClass>();
      let method1 = cls1.getStaticMethod('execute', [Class.from<string>()]);
      let method2 = cls2.getStaticMethod('execute', [Class.from<string>()]);
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('execute');
      expect(method2!.getName()).assertEqual('execute');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0310
     * @tc.name testStaticMethodEquals2_031
     * @tc.desc Verify equals() for CrossEqualsParamClass handle(int) from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossEqualsParamClass>();
      let cls2 = Class.from<CrossEqualsParamClass>();
      let methods1 = cls1.getStaticMethods();
      let methods2 = cls2.getStaticMethods();
      let found1: boolean = false;
      let idx1: int = -1;
      let found2: boolean = false;
      let idx2: int = -1;
      for (let i: int = 0; i < methods1.length; i++) {
        if (methods1[i].getName() === 'handle' && methods1[i].getParametersNum() === 1) {
          idx1 = i;
          found1 = true;
          break;
        }
      }
      for (let i: int = 0; i < methods2.length; i++) {
        if (methods2[i].getName() === 'handle' && methods2[i].getParametersNum() === 1) {
          idx2 = i;
          found2 = true;
          break;
        }
      }
      expect(found1).assertTrue();
      expect(found2).assertTrue();
      expect(methods1[idx1].getParametersNum()).assertEqual(1);
      expect(methods2[idx2].getParametersNum()).assertEqual(1);
      expect(methods1[idx1].equals(methods2[idx2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0320
     * @tc.name testStaticMethodEquals2_032
     * @tc.desc Verify equals() and getParameterType() cross-consistency for MultipleParamsClass calculate: same param type equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MultipleParamsClass>();
      let cls2 = Class.from<MultipleParamsClass>();
      let methods1 = cls1.getStaticMethods();
      let methods2 = cls2.getStaticMethods();
      let found1: boolean = false;
      let idx1: int = -1;
      let found2: boolean = false;
      let idx2: int = -1;
      for (let i: int = 0; i < methods1.length; i++) {
        if (methods1[i].getName() === 'calculate' && methods1[i].getParametersNum() === 2) {
          idx1 = i;
          found1 = true;
          break;
        }
      }
      for (let i: int = 0; i < methods2.length; i++) {
        if (methods2[i].getName() === 'calculate' && methods2[i].getParametersNum() === 2) {
          idx2 = i;
          found2 = true;
          break;
        }
      }
      expect(found1).assertTrue();
      expect(found2).assertTrue();
      expect(methods1[idx1].getParametersNum()).assertEqual(2);
      expect(methods2[idx2].getParametersNum()).assertEqual(2);
      expect(methods1[idx1].getParameterType(0)!.getName()).assertEqual(methods2[idx2].getParameterType(0)!.getName());
      expect(methods1[idx1].getParameterType(1)!.getName()).assertEqual(methods2[idx2].getParameterType(1)!.getName());
      expect(methods1[idx1].equals(methods2[idx2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0330
     * @tc.name testStaticMethodEquals2_033
     * @tc.desc Verify equals() for NoParamMethodsClass methods with same param count but different names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParamMethodsClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getParametersNum()).assertEqual(0);
      expect(methods[1].getParametersNum()).assertEqual(0);
      expect(methods[0].getName() !== methods[1].getName()).assertTrue();
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0340
     * @tc.name testStaticMethodEquals2_034
     * @tc.desc Verify equals() for ZeroArgMethodsClass beta and gamma: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroArgMethodsClass>();
      let methodB = cls.getStaticMethod('beta');
      let methodG = cls.getStaticMethod('gamma');
      expect(methodB !== undefined).assertTrue();
      expect(methodG !== undefined).assertTrue();
      expect(methodB!.equals(methodG!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0350
     * @tc.name testStaticMethodEquals2_035
     * @tc.desc Verify equals() for BaseSingleMethodClass process with different Class.from and getName check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<BaseSingleMethodClass>();
      let cls2 = Class.from<BaseSingleMethodClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('process');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0360
     * @tc.name testStaticMethodEquals2_036
     * @tc.desc Verify equals() for GrandParentEqClass greet vs ParentEqClass parentOwn: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<GrandParentEqClass>();
      let pCls = Class.from<ParentEqClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let pOwn = pCls.getStaticMethod('parentOwn');
      expect(gpGreet !== undefined).assertTrue();
      expect(pOwn !== undefined).assertTrue();
      expect(gpGreet!.equals(pOwn!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0370
     * @tc.name testStaticMethodEquals2_037
     * @tc.desc Verify equals() for NumericParamEqClass methodByte: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<NumericParamEqClass>();
      let cls2 = Class.from<NumericParamEqClass>();
      let method1 = cls1.getStaticMethod('methodByte');
      let method2 = cls2.getStaticMethod('methodByte');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0380
     * @tc.name testStaticMethodEquals2_038
     * @tc.desc Verify equals() for NumericParamEqClass methodInt vs methodShort: different numeric param types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamEqClass>();
      let methodInt = cls.getStaticMethod('methodInt');
      let methodShort = cls.getStaticMethod('methodShort');
      expect(methodInt !== undefined).assertTrue();
      expect(methodShort !== undefined).assertTrue();
      expect(methodInt!.equals(methodShort!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0390
     * @tc.name testStaticMethodEquals2_039
     * @tc.desc Verify equals() for NumericParamEqClass methodDouble vs methodFloat: different numeric param types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamEqClass>();
      let methodDouble = cls.getStaticMethod('methodDouble');
      let methodFloat = cls.getStaticMethod('methodFloat');
      expect(methodDouble !== undefined).assertTrue();
      expect(methodFloat !== undefined).assertTrue();
      expect(methodDouble!.equals(methodFloat!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0400
     * @tc.name testStaticMethodEquals2_040
     * @tc.desc Verify equals() for NumericReturnEqClass methodByte vs NumericParamEqClass methodByte: different owners equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsReturn = Class.from<NumericReturnEqClass>();
      let clsParam = Class.from<NumericParamEqClass>();
      let methodReturn = clsReturn.getStaticMethod('methodByte');
      let methodParam = clsParam.getStaticMethod('methodByte');
      expect(methodReturn !== undefined).assertTrue();
      expect(methodParam !== undefined).assertTrue();
      expect(methodReturn!.equals(methodParam!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0410
     * @tc.name testStaticMethodEquals2_041
     * @tc.desc Verify equals() for NumericParamEqClass methodInt vs methodByte: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamEqClass>();
      let methodInt = cls.getStaticMethod('methodInt');
      let methodByte = cls.getStaticMethod('methodByte');
      expect(methodInt !== undefined).assertTrue();
      expect(methodByte !== undefined).assertTrue();
      expect(methodInt!.equals(methodByte!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0420
     * @tc.name testStaticMethodEquals2_042
     * @tc.desc Verify equals() for FixedArrayEqClass faIntParam vs faStringParam: different FixedArray types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayEqClass>();
      let methodInt = cls.getStaticMethod('faIntParam');
      let methodStr = cls.getStaticMethod('faStringParam');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.equals(methodStr!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0430
     * @tc.name testStaticMethodEquals2_043
     * @tc.desc Verify equals() for FixedArrayEqClass faReturnInt vs faIntParam: different signatures equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayEqClass>();
      let methodRet = cls.getStaticMethod('faReturnInt');
      let methodParam = cls.getStaticMethod('faIntParam');
      expect(methodRet !== undefined).assertTrue();
      expect(methodParam !== undefined).assertTrue();
      expect(methodRet!.equals(methodParam!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0440
     * @tc.name testStaticMethodEquals2_044
     * @tc.desc Verify equals() for MultiFixedArrayEqClass faTwoParams from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MultiFixedArrayEqClass>();
      let cls2 = Class.from<MultiFixedArrayEqClass>();
      let method1 = cls1.getStaticMethod('faTwoParams');
      let method2 = cls2.getStaticMethod('faTwoParams');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0450
     * @tc.name testStaticMethodEquals2_045
     * @tc.desc Verify equals() for FixedArrayEqClass faReturnInt from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<FixedArrayEqClass>();
      let cls2 = Class.from<FixedArrayEqClass>();
      let method1 = cls1.getStaticMethod('faReturnInt');
      let method2 = cls2.getStaticMethod('faReturnInt');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0460
     * @tc.name testStaticMethodEquals2_046
     * @tc.desc Verify equals() for FixedArrayEqClass faIntParam vs faBooleanParam: different FixedArray types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayEqClass>();
      let methodInt = cls.getStaticMethod('faIntParam');
      let methodBool = cls.getStaticMethod('faBooleanParam');
      expect(methodInt !== undefined).assertTrue();
      expect(methodBool !== undefined).assertTrue();
      expect(methodInt!.equals(methodBool!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0470
     * @tc.name testStaticMethodEquals2_047
     * @tc.desc Verify equals() for EnumMethodEqClass paramIntEnum vs paramDecimalStrEnum: different enum types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodEqClass>();
      let methodInt = cls.getStaticMethod('paramIntEnum');
      let methodDouble = cls.getStaticMethod('paramDecimalStrEnum');
      expect(methodInt !== undefined).assertTrue();
      expect(methodDouble !== undefined).assertTrue();
      expect(methodInt!.equals(methodDouble!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0480
     * @tc.name testStaticMethodEquals2_048
     * @tc.desc Verify equals() for EnumMethodEqClass paramStringEnum vs paramByteEnum: different enum types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodEqClass>();
      let methodStr = cls.getStaticMethod('paramStringEnum');
      let methodByte = cls.getStaticMethod('paramByteEnum');
      expect(methodStr !== undefined).assertTrue();
      expect(methodByte !== undefined).assertTrue();
      expect(methodStr!.equals(methodByte!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0490
     * @tc.name testStaticMethodEquals2_049
     * @tc.desc Verify equals() for EnumMethodEqClass paramIntEnum vs paramLargeIntEnum: different enum types equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodEqClass>();
      let methodInt = cls.getStaticMethod('paramIntEnum');
      let methodLong = cls.getStaticMethod('paramLargeIntEnum');
      expect(methodInt !== undefined).assertTrue();
      expect(methodLong !== undefined).assertTrue();
      expect(methodInt!.equals(methodLong!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0500
     * @tc.name testStaticMethodEquals2_050
     * @tc.desc Verify equals() for EnumMethodEqClass paramTwoEnums vs paramIntEnum: different param count equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodEqClass>();
      let methodTwo = cls.getStaticMethod('paramTwoEnums');
      let methodOne = cls.getStaticMethod('paramIntEnum');
      expect(methodTwo !== undefined).assertTrue();
      expect(methodOne !== undefined).assertTrue();
      expect(methodTwo!.equals(methodOne!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0510
     * @tc.name testStaticMethodEquals2_051
     * @tc.desc Verify equals() for EnumMethodEqClass returnIntEnum vs paramIntEnum: different signature equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodEqClass>();
      let methodRet = cls.getStaticMethod('returnIntEnum');
      let methodParam = cls.getStaticMethod('paramIntEnum');
      expect(methodRet !== undefined).assertTrue();
      expect(methodParam !== undefined).assertTrue();
      expect(methodRet!.equals(methodParam!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0520
     * @tc.name testStaticMethodEquals2_052
     * @tc.desc Verify equals() for ModifierBaseEqClass baseOverrideMethod from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ModifierBaseEqClass>();
      let cls2 = Class.from<ModifierBaseEqClass>();
      let method1 = cls1.getStaticMethod('baseOverrideMethod');
      let method2 = cls2.getStaticMethod('baseOverrideMethod');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0530
     * @tc.name testStaticMethodEquals2_053
     * @tc.desc Verify equals() for ModifierChildEqClass overrideMethod vs ModifierBaseEqClass baseOverrideMethod: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ModifierChildEqClass>();
      let baseCls = Class.from<ModifierBaseEqClass>();
      let methodChild = childCls.getStaticMethod('overrideMethod');
      let methodBase = baseCls.getStaticMethod('baseOverrideMethod');
      expect(methodChild !== undefined).assertTrue();
      expect(methodBase !== undefined).assertTrue();
      expect(methodChild!.equals(methodBase!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0540
     * @tc.name testStaticMethodEquals2_054
     * @tc.desc Verify equals() for FinalMethodEqClass final methodA from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<FinalMethodEqClass>();
      let cls2 = Class.from<FinalMethodEqClass>();
      let method1 = cls1.getStaticMethod('methodA');
      let method2 = cls2.getStaticMethod('methodA');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0550
     * @tc.name testStaticMethodEquals2_055
     * @tc.desc Verify equals() for FinalMethodEqClass methodB vs methodA: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodEqClass>();
      let methodB = cls.getStaticMethod('methodB');
      let methodA = cls.getStaticMethod('methodA');
      expect(methodB !== undefined).assertTrue();
      expect(methodA !== undefined).assertTrue();
      expect(methodB!.equals(methodA!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0560
     * @tc.name testStaticMethodEquals2_056
     * @tc.desc Verify equals() for NamedMethodEqClass specialGet vs specialSet: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodEqClass>();
      let methodGet = cls.getStaticMethod('specialGet');
      let methodSet = cls.getStaticMethod('specialSet');
      expect(methodGet !== undefined).assertTrue();
      expect(methodSet !== undefined).assertTrue();
      expect(methodGet!.equals(methodSet!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0570
     * @tc.name testStaticMethodEquals2_057
     * @tc.desc Verify equals() for NamedMethodEqClass specialGet from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<NamedMethodEqClass>();
      let cls2 = Class.from<NamedMethodEqClass>();
      let method1 = cls1.getStaticMethod('specialGet');
      let method2 = cls2.getStaticMethod('specialGet');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0580
     * @tc.name testStaticMethodEquals2_058
     * @tc.desc Verify equals() for InterfaceImplEqClass interfaceMethod from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<InterfaceImplEqClass>();
      let cls2 = Class.from<InterfaceImplEqClass>();
      let method1 = cls1.getStaticMethod('interfaceMethod');
      let method2 = cls2.getStaticMethod('interfaceMethod');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0590
     * @tc.name testStaticMethodEquals2_059
     * @tc.desc Verify equals() for InterfaceImplEqClass classOnlyMethod vs interfaceMethod: different names equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplEqClass>();
      let methodClass = cls.getStaticMethod('classOnlyMethod');
      let methodInterface = cls.getStaticMethod('interfaceMethod');
      expect(methodClass !== undefined).assertTrue();
      expect(methodInterface !== undefined).assertTrue();
      expect(methodClass!.equals(methodInterface!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0600
     * @tc.name testStaticMethodEquals2_060
     * @tc.desc Verify equals() for GenericClassEqClass<string> methodString from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<GenericClassEqClass<string>>();
      let cls2 = Class.from<GenericClassEqClass<string>>();
      let method1 = cls1.getStaticMethod('methodString');
      let method2 = cls2.getStaticMethod('methodString');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0610
     * @tc.name testStaticMethodEquals2_061
     * @tc.desc Verify equals() for GenericClassEqClass<int> methodIntBool from two Class.from: same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<GenericClassEqClass<int>>();
      let cls2 = Class.from<GenericClassEqClass<int>>();
      let method1 = cls1.getStaticMethod('methodIntBool');
      let method2 = cls2.getStaticMethod('methodIntBool');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0620
     * @tc.name testStaticMethodEquals2_062
     * @tc.desc Verify equals() for GenericClassEqClass<string> methodString vs GenericClassEqClass<int> methodString: different T same method equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsStr = Class.from<GenericClassEqClass<string>>();
      let clsInt = Class.from<GenericClassEqClass<int>>();
      let methodStr = clsStr.getStaticMethod('methodString');
      let methodInt = clsInt.getStaticMethod('methodString');
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr!.equals(methodInt!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0630
     * @tc.name testStaticMethodEquals2_063
     * @tc.desc Verify equals() for InterfaceImplEqClass interfaceMethod vs GenericClassEqClass<string> methodString: different methods equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInterface = Class.from<InterfaceImplEqClass>();
      let clsGeneric = Class.from<GenericClassEqClass<string>>();
      let methodInterface = clsInterface.getStaticMethod('interfaceMethod');
      let methodGeneric = clsGeneric.getStaticMethod('methodString');
      expect(methodInterface !== undefined).assertTrue();
      expect(methodGeneric !== undefined).assertTrue();
      expect(methodInterface!.equals(methodGeneric!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0640
     * @tc.name testStaticMethodEquals2_064
     * @tc.desc Verify equals() and getReturnType() cross-consistency for NumericReturnEqClass methodIntX: same return type equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<NumericReturnEqClass>();
      let cls2 = Class.from<NumericReturnEqClass>();
      let method1 = cls1.getStaticMethod('methodIntX');
      let method2 = cls2.getStaticMethod('methodIntX');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType().getName()).assertEqual(method2!.getReturnType().getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0650
     * @tc.name testStaticMethodEquals2_065
     * @tc.desc Verify equals() and getParametersNum() cross-consistency for NumericParamEqClass methodInt: same param count equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<NumericParamEqClass>();
      let cls2 = Class.from<NumericParamEqClass>();
      let method1 = cls1.getStaticMethod('methodInt');
      let method2 = cls2.getStaticMethod('methodInt');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(method2!.getParametersNum());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0660
     * @tc.name testStaticMethodEquals2_066
     * @tc.desc Verify equals() and getParameterType() cross-consistency for FixedArrayEqClass faIntParam: same param type equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<FixedArrayEqClass>();
      let cls2 = Class.from<FixedArrayEqClass>();
      let method1 = cls1.getStaticMethod('faIntParam');
      let method2 = cls2.getStaticMethod('faIntParam');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParameterType(0)!.getName()).assertEqual(method2!.getParameterType(0)!.getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0670
     * @tc.name testStaticMethodEquals2_067
     * @tc.desc Verify equals() and getOwner() cross-consistency for EnumMethodEqClass: same owner name equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<EnumMethodEqClass>();
      let cls2 = Class.from<EnumMethodEqClass>();
      let method1 = cls1.getStaticMethod('paramIntEnum');
      let method2 = cls2.getStaticMethod('paramIntEnum');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getOwner().getName()).assertEqual(method2!.getOwner().getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0680
     * @tc.name testStaticMethodEquals2_068
     * @tc.desc Verify equals() and getName() cross-consistency for FinalMethodEqClass methodB: same name equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<FinalMethodEqClass>();
      let cls2 = Class.from<FinalMethodEqClass>();
      let method1 = cls1.getStaticMethod('methodB');
      let method2 = cls2.getStaticMethod('methodB');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('methodB');
      expect(method2!.getName()).assertEqual('methodB');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0690
     * @tc.name testStaticMethodEquals2_069
     * @tc.desc Verify equals() self-reflexive for SelfReflexiveEqClass.compute: method.equals(method) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SelfReflexiveEqClass>();
      let cls2 = Class.from<SelfReflexiveEqClass>();
      let method1 = cls1.getStaticMethod('compute');
      let method2 = cls2.getStaticMethod('compute');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0700
     * @tc.name testStaticMethodEquals2_070
     * @tc.desc Verify equals() symmetric for SymmetricEqClass.process: cross-instance equals works both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SymmetricEqClass>();
      let cls2 = Class.from<SymmetricEqClass>();
      let m1 = cls1.getStaticMethod('process');
      let m2 = cls2.getStaticMethod('process');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m1!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0710
     * @tc.name testStaticMethodEquals2_071
     * @tc.desc Verify equals() transitive for TransitiveEqClass.execute: m1=m2 and m2=m3 implies m1=m3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<TransitiveEqClass>();
      let cls2 = Class.from<TransitiveEqClass>();
      let cls3 = Class.from<TransitiveEqClass>();
      let m1 = cls1.getStaticMethod('execute');
      let m2 = cls2.getStaticMethod('execute');
      let m3 = cls3.getStaticMethod('execute');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      expect(m2!.equals(m3!)).assertTrue();
      expect(m1!.equals(m3!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0720
     * @tc.name testStaticMethodEquals2_072
     * @tc.desc Verify equals() for EmptyBodyEqClass.emptyMethod: empty method equals(self) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<EmptyBodyEqClass>();
      let cls2 = Class.from<EmptyBodyEqClass>();
      let method1 = cls1.getStaticMethod('emptyMethod');
      let method2 = cls2.getStaticMethod('emptyMethod');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0730
     * @tc.name testStaticMethodEquals2_073
     * @tc.desc Verify equals() for MultiEmptyBodyEqClass: multiple empty methods self-equal but distinct from each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MultiEmptyBodyEqClass>();
      let cls2 = Class.from<MultiEmptyBodyEqClass>();
      let m1 = cls1.getStaticMethod('empty1');
      let m2 = cls1.getStaticMethod('empty2');
      let m3 = cls1.getStaticMethod('empty3');
      let m1b = cls2.getStaticMethod('empty1');
      let m2b = cls2.getStaticMethod('empty2');
      let m3b = cls2.getStaticMethod('empty3');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1b !== undefined).assertTrue();
      expect(m2b !== undefined).assertTrue();
      expect(m3b !== undefined).assertTrue();
      expect(m1!.equals(m1b!)).assertTrue();
      expect(m2!.equals(m2b!)).assertTrue();
      expect(m3!.equals(m3b!)).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
      expect(m2!.equals(m3!)).assertFalse();
      expect(m1!.equals(m3!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0740
     * @tc.name testStaticMethodEquals2_074
     * @tc.desc Verify equals() for ResizableArrayEqClass.processArray: resizable array param method equals(self) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ResizableArrayEqClass>();
      let cls2 = Class.from<ResizableArrayEqClass>();
      let m1 = cls1.getStaticMethod('processArray');
      let m2 = cls2.getStaticMethod('processArray');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_TWO_0750
     * @tc.name testStaticMethodEquals2_075
     * @tc.desc Verify equals() for ResizableReturnEqClass.getFlags: resizable return type method equals(self) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ResizableReturnEqClass>();
      let cls2 = Class.from<ResizableReturnEqClass>();
      let m1 = cls1.getStaticMethod('getFlags');
      let m2 = cls2.getStaticMethod('getFlags');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });
