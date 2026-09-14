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

class ConsistentOwnerClass {
  public static getValue(): int {
    return 42;
  }
}

class SameOwnerClass {
  public static process(name: string): string {
    return name.toUpperCase();
  }
}

class GenericOwnerClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class MultiMethodOwner2Class {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class GrandParentOwnerClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentOwnerClass extends GrandParentOwnerClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildOwnerClass extends ParentOwnerClass {
  public static childOwn(): int {
    return 1;
  }
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class NestedOwnerClass {
  public static getValue(): int {
    return 1;
  }
  public static innerMethod(): string {
    return 'inner';
  }
}

class BuiltInTypeOwnerClass {
  public static getInt(): int {
    return 1;
  }
  public static getString(): string {
    return 'test';
  }
  public static getBoolean(): boolean {
    return true;
  }
}

class MultipleOwnerMethodsClass {
  public static method1(): int {
    return 1;
  }
  public static method2(): string {
    return 'method2';
  }
  public static method3(): boolean {
    return false;
  }
}

class CrossOwnerGetNameClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(): int {
    return 0;
  }
}

class CrossOwnerReturnClass {
  public static process(): string {
    return 'done';
  }
  public static calculate(a: int, b: int): int {
    return a + b;
  }
}

class CrossOwnerParamClass {
  public static handle(value: string): boolean {
    return value.length > 0;
  }
  public static transform(x: int, y: string): void {}
}

class L4GrandParentOwnerClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentOwnerClass extends L4GrandParentOwnerClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildOwnerClass extends L4ParentOwnerClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildOwnerClass extends L4ChildOwnerClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseOwnerClass {
  public static baseMethod(): int {
    return 0;
  }
}

class L5D1OwnerClass extends L5BaseOwnerClass {
  public static d1Method(): string {
    return 'd1';
  }
}

class L5D2OwnerClass extends L5D1OwnerClass {
  public static d2Method(): boolean {
    return true;
  }
}

class L5D3OwnerClass extends L5D2OwnerClass {
  public static d3Method(): int {
    return 3;
  }
}

class L5D4OwnerClass extends L5D3OwnerClass {
  public static d4Method(): string {
    return 'd4';
  }
}

class HeavyOverloadOwnerClass {
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

class AllReturnTypeOwnerClass {
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

class TripleCrossOwnerClass {
  public static execute(cmd: string): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum StringEnum: string { SA = "hello", SB = "world" }

class NumericParamOwnerClass {
  public static methodByte(x: byte): void {}
  public static methodShort(x: short): void {}
  public static methodInt(x: int): void {}
  public static methodLong(x: long): void {}
  public static methodFloat(x: float): void {}
  public static methodDouble(x: double): void {}
}

class NumericReturnOwnerClass {
  public static methodByte(): byte { return 0; }
  public static methodShort(): short { return 0; }
  public static methodIntX(): int { return 0; }
  public static methodLong(): long { return 0; }
  public static methodFloat(): float { return 0; }
  public static methodDouble(): double { return 0.0; }
}

class FixedArrayOwnerClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faStringParam(x: FixedArray<string>): void {}
  public static faReturnInt(): FixedArray<int> { return new FixedArray<int>(0, 0); }
}

class EnumMethodOwnerClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramStringEnum(e: StringEnum): void {}
  public static returnIntEnum(): IntEnum { return IntEnum.A; }
}

class ModifierChildOwnerClass {
  public static overrideMethod(): void {}
  public static protectedMethod(): void {}
}

class InterfaceImplOwnerClass {
  public static interfaceMethod(): string { return "class"; }
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassOwnerClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
}

class EmptyBodyOwnerClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyOwnerClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayOwnerClass {
  public static processArray(arr: string[]): int { return arr.length; }
}

class ResizableReturnOwnerClass {
  public static getFlags(): boolean[] {
    let arr: boolean[] = [];
    arr.push(true);
    arr.push(false);
    return arr;
  }
}

class MultiResizableOwnerClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayOwnerClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class MixedMethodTypesOwnerClass {
  public static alpha(): int { return 1; }
  public static beta(): string { return 'b'; }
}

class EnumOwnerOwnerClass {
  public static getValue(): int { return 42; }
}

class SiblingBaseOwner {
  public static shared(): string { return 'base'; }
}

class SiblingAOwner extends SiblingBaseOwner {
  public static shared(): string { return 'A'; }
}

class SiblingBOwner extends SiblingBaseOwner {
  public static shared(): string { return 'B'; }
}

class OverloadReturnOwnerClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadOwnerClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
}

class ArrayOverloadOwnerClass {
  public static processInt(arr: int[]): int { return arr.length; }
  public static processString(arr: string[]): int { return arr.length; }
}

class CrossClassOwnerA {
  public static process(): string { return 'A'; }
}

class CrossClassOwnerB {
  public static process(): string { return 'B'; }
}

class FinalMethodOwnerClass2 {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class SpecialNameOwnerClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class NestedFixedArrayOwnerClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedOwnerClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class ConflictBaseOwnerClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildOwnerClass extends ConflictBaseOwnerClass {
  public static run(): string { return 'child static'; }
  public instanceRun(): string { return 'child instance'; }
}

export default function StaticMethodGetOwner2Test(): void {
  describe('StaticMethodGetOwner2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      try {
        await Utils.msSleep(30);
      } catch (err) {
        console.error('beforeEach msSleep failed: ' + err);
      }
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0100
     * @tc.name testStaticMethodGetOwner2_001
     * @tc.desc Verify multiple getOwner() calls on the same StaticMethod return identical owner name matching the expected fully qualified class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentOwnerClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let owner1: Class = method!.getOwner();
      let owner2: Class = method!.getOwner();
      let owner3: Class = method!.getOwner();
      expect(owner1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.ConsistentOwnerClass');
      expect(owner2.getName()).assertEqual(owner1.getName());
      expect(owner3.getName()).assertEqual(owner1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0200
     * @tc.name testStaticMethodGetOwner2_002
     * @tc.desc Verify getOwner() returns same owner from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameOwnerClass>();
      let cls2 = Class.from<SameOwnerClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let owner1 = method1!.getOwner();
      let owner2 = method2!.getOwner();
      expect(owner1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.SameOwnerClass');
      expect(owner2.getName()).assertEqual(owner1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0300
     * @tc.name testStaticMethodGetOwner2_003
     * @tc.desc Verify getOwner() returns same owner from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericOwnerClass<int>>();
      let clsStr = Class.from<GenericOwnerClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      let ownerInt = methodInt!.getOwner();
      let ownerStr = methodStr!.getOwner();
      expect(ownerInt.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.GenericOwnerClass');
      expect(ownerStr.getName()).assertEqual(ownerInt.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0400
     * @tc.name testStaticMethodGetOwner2_004
     * @tc.desc Verify getOwner() from getStaticMethod matches getOwner() from getStaticMethods entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodOwner2Class>();
      let method = cls.getStaticMethod('beta');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'beta') {
          expect(method!.getOwner().getName()).assertEqual(methods[i].getOwner().getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0500
     * @tc.name testStaticMethodGetOwner2_005
     * @tc.desc Verify getOwner() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentOwnerClass>();
      let childCls = Class.from<ChildOwnerClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      let grandParentOwner = grandParentGreet!.getOwner();
      let childOwner = childGreet!.getOwner();
      expect(grandParentOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.GrandParentOwnerClass');
      expect(childOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.ChildOwnerClass');
      expect(grandParentOwner.getName() === childOwner.getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0600
     * @tc.name testStaticMethodGetOwner2_006
     * @tc.desc Verify getOwner() for methods with different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BuiltInTypeOwnerClass>();
      let methodInt = cls.getStaticMethod('getInt');
      let methodStr = cls.getStaticMethod('getString');
      let methodBool = cls.getStaticMethod('getBoolean');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodBool !== undefined).assertTrue();
      expect(methodInt!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.BuiltInTypeOwnerClass');
      expect(methodStr!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.BuiltInTypeOwnerClass');
      expect(methodBool!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.BuiltInTypeOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0700
     * @tc.name testStaticMethodGetOwner2_007
     * @tc.desc Verify getOwner() for multiple methods from same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultipleOwnerMethodsClass>();
      let method1 = cls.getStaticMethod('method1');
      let method2 = cls.getStaticMethod('method2');
      let method3 = cls.getStaticMethod('method3');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      expect(method1!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.MultipleOwnerMethodsClass');
      expect(method2!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.MultipleOwnerMethodsClass');
      expect(method3!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.MultipleOwnerMethodsClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0800
     * @tc.name testStaticMethodGetOwner2_008
     * @tc.desc Verify getOwner() and getName() cross-consistency: compute method owner contains CrossOwnerGetNameClass and name is 'compute'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerGetNameClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossOwnerGetNameClass') >= 0).assertTrue();
      expect(method!.getName()).assertEqual('compute');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_0900
     * @tc.name testStaticMethodGetOwner2_009
     * @tc.desc Verify getOwner() and getName() cross-consistency: different methods compute and merge from same class have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerGetNameClass>();
      let methodC = cls.getStaticMethod('compute');
      let methodM = cls.getStaticMethod('merge');
      expect(methodC !== undefined).assertTrue();
      expect(methodM !== undefined).assertTrue();
      expect(methodC!.getOwner().getName()).assertEqual(methodM!.getOwner().getName());
      expect(methodC!.getName()).assertEqual('compute');
      expect(methodM!.getName()).assertEqual('merge');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1000
     * @tc.name testStaticMethodGetOwner2_010
     * @tc.desc Verify getOwner() and getReturnType() cross-consistency: process method owner and return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerReturnClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossOwnerReturnClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1100
     * @tc.name testStaticMethodGetOwner2_011
     * @tc.desc Verify getOwner() and getReturnType() cross-consistency: two methods from same class same owner different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerReturnClass>();
      let methodP = cls.getStaticMethod('process');
      let methodC = cls.getStaticMethod('calculate');
      expect(methodP !== undefined).assertTrue();
      expect(methodC !== undefined).assertTrue();
      expect(methodP!.getOwner().getName()).assertEqual(methodC!.getOwner().getName());
      expect(methodP!.getReturnType().getName()).assertEqual('std.core.String');
      expect(methodC!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1200
     * @tc.name testStaticMethodGetOwner2_012
     * @tc.desc Verify getOwner() and getParametersNum() cross-consistency: handle method has 1 param and owner correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerParamClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossOwnerParamClass') >= 0).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1300
     * @tc.name testStaticMethodGetOwner2_013
     * @tc.desc Verify getOwner() and getParameterTypes() cross-consistency: transform method has 2 params and owner correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerParamClass>();
      let method = cls.getStaticMethod('transform');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossOwnerParamClass') >= 0).assertTrue();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1400
     * @tc.name testStaticMethodGetOwner2_014
     * @tc.desc Verify getOwner() and equals() cross-consistency: two methods from different Class.from same class have same owner and equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossOwnerGetNameClass>();
      let cls2 = Class.from<CrossOwnerGetNameClass>();
      let method1 = cls1.getStaticMethod('compute');
      let method2 = cls2.getStaticMethod('compute');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getOwner().getName()).assertEqual(method2!.getOwner().getName());
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1500
     * @tc.name testStaticMethodGetOwner2_015
     * @tc.desc Verify getOwner() and equals() cross-consistency: different methods from different classes have different owners and equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<CrossOwnerGetNameClass>();
      let clsB = Class.from<CrossOwnerReturnClass>();
      let methodA = clsA.getStaticMethod('compute');
      let methodB = clsB.getStaticMethod('process');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getOwner().getName() === methodB!.getOwner().getName()).assertFalse();
      expect(methodA!.equals(methodB!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1600
     * @tc.name testStaticMethodGetOwner2_016
     * @tc.desc Verify getOwner() for int return type method: same owner across all return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeOwnerClass>();
      let method = cls.getStaticMethod('getInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('AllReturnTypeOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1700
     * @tc.name testStaticMethodGetOwner2_017
     * @tc.desc Verify getOwner() for string return type method: same owner as int method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeOwnerClass>();
      let methodInt = cls.getStaticMethod('getInt');
      let methodStr = cls.getStaticMethod('getStr');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.getOwner().getName()).assertEqual(methodStr!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1800
     * @tc.name testStaticMethodGetOwner2_018
     * @tc.desc Verify getOwner() for boolean return type method: same owner as other methods in class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeOwnerClass>();
      let methodBool = cls.getStaticMethod('getBool');
      let methodInt = cls.getStaticMethod('getInt');
      expect(methodBool !== undefined).assertTrue();
      expect(methodInt !== undefined).assertTrue();
      expect(methodBool!.getOwner().getName()).assertEqual(methodInt!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_1900
     * @tc.name testStaticMethodGetOwner2_019
     * @tc.desc Verify getOwner() for 4-layer hiding: L4GrandParent greet owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4GrandParentOwnerClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L4GrandParentOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2000
     * @tc.name testStaticMethodGetOwner2_020
     * @tc.desc Verify getOwner() for 4-layer hiding: L4Parent greet owner is L4ParentOwnerClass, not L4GrandParentOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4ParentOwnerClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L4ParentOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2100
     * @tc.name testStaticMethodGetOwner2_021
     * @tc.desc Verify getOwner() for 4-layer hiding: L4Child greet owner is L4ChildOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4ChildOwnerClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L4ChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2200
     * @tc.name testStaticMethodGetOwner2_022
     * @tc.desc Verify getOwner() for 4-layer hiding: L4GrandChild greet owner is L4GrandChildOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4GrandChildOwnerClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L4GrandChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2300
     * @tc.name testStaticMethodGetOwner2_023
     * @tc.desc Verify getOwner() for 5-layer non-hiding: L5Base baseMethod owner is L5BaseOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5BaseOwnerClass>();
      let method = cls.getStaticMethod('baseMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L5BaseOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2400
     * @tc.name testStaticMethodGetOwner2_024
     * @tc.desc Verify getOwner() for 5-layer non-hiding: L5D1 d1Method owner is L5D1OwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D1OwnerClass>();
      let method = cls.getStaticMethod('d1Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L5D1OwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2500
     * @tc.name testStaticMethodGetOwner2_025
     * @tc.desc Verify getOwner() for 5-layer non-hiding: L5D2 d2Method owner is L5D2OwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D2OwnerClass>();
      let method = cls.getStaticMethod('d2Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L5D2OwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2600
     * @tc.name testStaticMethodGetOwner2_026
     * @tc.desc Verify getOwner() for 5-layer non-hiding: L5D3 d3Method owner is L5D3OwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3OwnerClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L5D3OwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2700
     * @tc.name testStaticMethodGetOwner2_027
     * @tc.desc Verify getOwner() for 5-layer non-hiding: L5D4 d4Method owner is L5D4OwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4OwnerClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('L5D4OwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2800
     * @tc.name testStaticMethodGetOwner2_028
     * @tc.desc Verify getOwner() for overload via getStaticMethod matches getStaticMethods entry owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadOwnerClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      let ownerName: string = '';
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 1) {
          ownerName = methods[i].getOwner().getName();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
      expect(ownerName.indexOf('HeavyOverloadOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_2900
     * @tc.name testStaticMethodGetOwner2_029
     * @tc.desc Verify getOwner() with explicit empty param types matches no-param call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentOwnerClass>();
      let methodSimple = cls.getStaticMethod('getValue');
      let methodExplicit = cls.getStaticMethod('getValue', []);
      expect(methodSimple !== undefined).assertTrue();
      expect(methodExplicit !== undefined).assertTrue();
      expect(methodSimple!.getOwner().getName()).assertEqual(methodExplicit!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3000
     * @tc.name testStaticMethodGetOwner2_030
     * @tc.desc Verify getOwner() for inherited non-hidden method from 3-layer chain: ParentOwnerClass parentOnly owned by ParentOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentOwnerClass>();
      let method = cls.getStaticMethod('parentOnly');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ParentOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3100
     * @tc.name testStaticMethodGetOwner2_031
     * @tc.desc Verify getOwner() for parent method accessed via child class: childOwn owned by ChildOwnerClass, greet owned by ChildOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildOwnerClass>();
      let methodChild = cls.getStaticMethod('childOwn');
      let methodGreet = cls.getStaticMethod('greet');
      expect(methodChild !== undefined).assertTrue();
      expect(methodGreet !== undefined).assertTrue();
      expect(methodChild!.getOwner().getName()).assertEqual(methodGreet!.getOwner().getName());
      expect(methodChild!.getOwner().getName().indexOf('ChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3200
     * @tc.name testStaticMethodGetOwner2_032
     * @tc.desc Verify getOwner() cross-consistency: TripleCrossOwnerClass execute method owner and return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossOwnerClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('TripleCrossOwnerClass') >= 0).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3300
     * @tc.name testStaticMethodGetOwner2_033
     * @tc.desc Verify getOwner() for cross-API with getParameterType: handle method param type and owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossOwnerParamClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossOwnerParamClass') >= 0).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3400
     * @tc.name testStaticMethodGetOwner2_034
     * @tc.desc Verify getOwner() for class with multiple methods: NestedOwnerClass both methods same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedOwnerClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length >= 2).assertTrue();
      let ownerRef: string = methods[0].getOwner().getName();
      for (let i: int = 1; i < methods.length; i++) {
        expect(methods[i].getOwner().getName()).assertEqual(ownerRef);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3500
     * @tc.name testStaticMethodGetOwner2_035
     * @tc.desc Verify getOwner() for GrandParentOwnerClass: greet method owner still GrandParentOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandParentOwnerClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('GrandParentOwnerClass') >= 0).assertTrue();
      expect(method!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3600
     * @tc.name testStaticMethodGetOwner2_036
     * @tc.desc Verify getOwner() for numeric param methods: all param methods share same owner NumericParamOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamOwnerClass>();
      let methodByte = cls.getStaticMethod('methodByte');
      let methodInt = cls.getStaticMethod('methodInt');
      expect(methodByte !== undefined).assertTrue();
      expect(methodInt !== undefined).assertTrue();
      expect(methodByte!.getOwner().getName()).assertEqual(methodInt!.getOwner().getName());
      expect(methodByte!.getOwner().getName().indexOf('NumericParamOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3700
     * @tc.name testStaticMethodGetOwner2_037
     * @tc.desc Verify getOwner() for numeric return methods: all return methods share same owner NumericReturnOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnOwnerClass>();
      let methodByte = cls.getStaticMethod('methodByte');
      let methodInt = cls.getStaticMethod('methodIntX');
      expect(methodByte !== undefined).assertTrue();
      expect(methodInt !== undefined).assertTrue();
      expect(methodByte!.getOwner().getName()).assertEqual(methodInt!.getOwner().getName());
      expect(methodByte!.getOwner().getName().indexOf('NumericReturnOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3800
     * @tc.name testStaticMethodGetOwner2_038
     * @tc.desc Verify getOwner() for FixedArray param method: faIntParam owner is FixedArrayOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayOwnerClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('FixedArrayOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_3900
     * @tc.name testStaticMethodGetOwner2_039
     * @tc.desc Verify getOwner() for enum methods: param and return methods same owner EnumMethodOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodOwnerClass>();
      let methodParam = cls.getStaticMethod('paramIntEnum');
      let methodReturn = cls.getStaticMethod('returnIntEnum');
      expect(methodParam !== undefined).assertTrue();
      expect(methodReturn !== undefined).assertTrue();
      expect(methodParam!.getOwner().getName()).assertEqual(methodReturn!.getOwner().getName());
      expect(methodParam!.getOwner().getName().indexOf('EnumMethodOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4000
     * @tc.name testStaticMethodGetOwner2_040
     * @tc.desc Verify getOwner() for override static method: overrideMethod owner is ModifierChildOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierChildOwnerClass>();
      let method = cls.getStaticMethod('overrideMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ModifierChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4100
     * @tc.name testStaticMethodGetOwner2_041
     * @tc.desc Verify getOwner() for protected static method: protectedMethod owner is ModifierChildOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierChildOwnerClass>();
      let method = cls.getStaticMethod('protectedMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ModifierChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4200
     * @tc.name testStaticMethodGetOwner2_042
     * @tc.desc Verify getOwner() for InterfaceImplOwnerClass method: interfaceMethod owner is InterfaceImplOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplOwnerClass>();
      let method = cls.getStaticMethod('interfaceMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('InterfaceImplOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4300
     * @tc.name testStaticMethodGetOwner2_043
     * @tc.desc Verify getOwner() for GenericClassOwnerClass: methodString owner contains GenericClassOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassOwnerClass<string>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('GenericClassOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4400
     * @tc.name testStaticMethodGetOwner2_044
     * @tc.desc Verify getOwner() cross-class: InterfaceImplOwnerClass and GenericClassOwnerClass have different owners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsIF = Class.from<InterfaceImplOwnerClass>();
      let clsGC = Class.from<GenericClassOwnerClass<string>>();
      let methodIF = clsIF.getStaticMethod('interfaceMethod');
      let methodGC = clsGC.getStaticMethod('methodString');
      expect(methodIF !== undefined).assertTrue();
      expect(methodGC !== undefined).assertTrue();
      expect(methodIF!.getOwner().getName() === methodGC!.getOwner().getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4500
     * @tc.name testStaticMethodGetOwner2_045
     * @tc.desc Verify getOwner()+getName() cross-consistency: NumericReturnOwnerClass methodByte owner and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnOwnerClass>();
      let method = cls.getStaticMethod('methodByte');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('NumericReturnOwnerClass') >= 0).assertTrue();
      expect(method!.getName()).assertEqual('methodByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4600
     * @tc.name testStaticMethodGetOwner2_046
     * @tc.desc Verify getOwner()+getReturnType() cross-consistency: FixedArrayOwnerClass faReturnInt owner and return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayOwnerClass>();
      let method = cls.getStaticMethod('faReturnInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('FixedArrayOwnerClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.Int[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4700
     * @tc.name testStaticMethodGetOwner2_047
     * @tc.desc Verify getOwner()+getParametersNum() cross-consistency: FixedArrayOwnerClass faStringParam owner and param count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayOwnerClass>();
      let method = cls.getStaticMethod('faStringParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('FixedArrayOwnerClass') >= 0).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4800
     * @tc.name testStaticMethodGetOwner2_048
     * @tc.desc Verify getOwner() for EmptyBodyOwnerClass.emptyMethod: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyBodyOwnerClass>();
      let method = cls.getStaticMethod('emptyMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('EmptyBodyOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_4900
     * @tc.name testStaticMethodGetOwner2_049
     * @tc.desc Verify getOwner() for MultiEmptyBodyOwnerClass: all three empty methods have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiEmptyBodyOwnerClass>();
      let m1 = cls.getStaticMethod('empty1');
      let m2 = cls.getStaticMethod('empty2');
      let m3 = cls.getStaticMethod('empty3');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
      expect(m2!.getOwner().getName()).assertEqual(m3!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5000
     * @tc.name testStaticMethodGetOwner2_050
     * @tc.desc Verify getOwner() for ResizableArrayOwnerClass.processArray: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayOwnerClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ResizableArrayOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5100
     * @tc.name testStaticMethodGetOwner2_051
     * @tc.desc Verify getOwner() for ResizableReturnOwnerClass.getFlags: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableReturnOwnerClass>();
      let method = cls.getStaticMethod('getFlags');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ResizableReturnOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5200
     * @tc.name testStaticMethodGetOwner2_052
     * @tc.desc Verify getOwner() for MultiResizableOwnerClass.mergeArrays: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizableOwnerClass>();
      let method = cls.getStaticMethod('mergeArrays');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('MultiResizableOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5300
     * @tc.name testStaticMethodGetOwner2_053
     * @tc.desc Verify getOwner() for MixedArrayOwnerClass.complexProcess: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayOwnerClass>();
      let method = cls.getStaticMethod('complexProcess');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('MixedArrayOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5400
     * @tc.name testStaticMethodGetOwner2_054
     * @tc.desc Verify getOwner() for MixedMethodTypesOwnerClass: alpha and beta have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedMethodTypesOwnerClass>();
      let m1 = cls.getStaticMethod('alpha');
      let m2 = cls.getStaticMethod('beta');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5500
     * @tc.name testStaticMethodGetOwner2_055
     * @tc.desc Verify getOwner() for sibling classes SiblingAOwner and SiblingBOwner: shared method owners differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SiblingAOwner>();
      let cls2 = Class.from<SiblingBOwner>();
      let m1 = cls1.getStaticMethod('shared');
      let m2 = cls2.getStaticMethod('shared');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.SiblingAOwner');
      expect(m2!.getOwner().getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwner2Test.test.SiblingBOwner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5600
     * @tc.name testStaticMethodGetOwner2_056
     * @tc.desc Verify getOwner() for MixedOverloadOwnerClass: processInt and processString have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedOverloadOwnerClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5700
     * @tc.name testStaticMethodGetOwner2_057
     * @tc.desc Verify getOwner() for ArrayOverloadOwnerClass: processInt and processString have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayOverloadOwnerClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5800
     * @tc.name testStaticMethodGetOwner2_058
     * @tc.desc Verify getOwner() for cross-class methods CrossClassOwnerA/B: process owners are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossClassOwnerA>();
      let cls2 = Class.from<CrossClassOwnerB>();
      let m1 = cls1.getStaticMethod('process');
      let m2 = cls2.getStaticMethod('process');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName() === m2!.getOwner().getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_5900
     * @tc.name testStaticMethodGetOwner2_059
     * @tc.desc Verify getOwner() for FinalMethodOwnerClass2 methodA and methodB: same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodOwnerClass2>();
      let m1 = cls.getStaticMethod('methodA');
      let m2 = cls.getStaticMethod('methodB');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6000
     * @tc.name testStaticMethodGetOwner2_060
     * @tc.desc Verify getOwner() for SpecialNameOwnerClass: specialGet, specialSet, specialInvoke have same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameOwnerClass>();
      let m1 = cls.getStaticMethod('specialGet');
      let m2 = cls.getStaticMethod('specialSet');
      let m3 = cls.getStaticMethod('specialInvoke');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.getOwner().getName()).assertEqual(m2!.getOwner().getName());
      expect(m2!.getOwner().getName()).assertEqual(m3!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6100
     * @tc.name testStaticMethodGetOwner2_061
     * @tc.desc Verify getOwner() for NestedFixedArrayOwnerClass.processMatrix: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedFixedArrayOwnerClass>();
      let method = cls.getStaticMethod('processMatrix');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('NestedFixedArrayOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6200
     * @tc.name testStaticMethodGetOwner2_062
     * @tc.desc Verify getOwner() for TripleNestedOwnerClass.process3D: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleNestedOwnerClass>();
      let method = cls.getStaticMethod('process3D');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('TripleNestedOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6300
     * @tc.name testStaticMethodGetOwner2_063
     * @tc.desc Verify getOwner() for ConflictChildOwnerClass.run: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictChildOwnerClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('ConflictChildOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6400
     * @tc.name testStaticMethodGetOwner2_064
     * @tc.desc Verify getOwner() for EnumOwnerOwnerClass.getValue: owner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumOwnerOwnerClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('EnumOwnerOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6500
     * @tc.name testStaticMethodGetOwner2_065
     * @tc.desc Verify getOwner() via getStaticMethods() on OverloadReturnOwnerClass: three methods share same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnOwnerClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let ownerName: string = methods[0].getOwner().getName();
      for (let i: int = 1; i < methods.length; i++) {
        expect(methods[i].getOwner().getName()).assertEqual(ownerName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6600
     * @tc.name testStaticMethodGetOwner2_066
     * @tc.desc Verify getOwner() via getStaticMethods() on FinalMethodOwnerClass2: two methods share same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodOwnerClass2>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let ownerName: string = methods[0].getOwner().getName();
      for (let i: int = 1; i < methods.length; i++) {
        expect(methods[i].getOwner().getName()).assertEqual(ownerName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6700
     * @tc.name testStaticMethodGetOwner2_067
     * @tc.desc Verify getOwner() via getStaticMethods() on SpecialNameOwnerClass: three methods share same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameOwnerClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let ownerName: string = methods[0].getOwner().getName();
      for (let i: int = 1; i < methods.length; i++) {
        expect(methods[i].getOwner().getName()).assertEqual(ownerName);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6800
     * @tc.name testStaticMethodGetOwner2_068
     * @tc.desc Verify getStaticMethod with empty param types resolves zero-arg overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadOwnerClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      let ownerName: string = '';
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 0) {
          ownerName = methods[i].getOwner().getName();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
      expect(ownerName.indexOf('HeavyOverloadOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_6900
     * @tc.name testStaticMethodGetOwner2_069
     * @tc.desc Verify getStaticMethod with string+int param types resolves two-param overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadOwnerClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      let ownerName: string = '';
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 2) {
          ownerName = methods[i].getOwner().getName();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
      expect(ownerName.indexOf('HeavyOverloadOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_TWO_7000
     * @tc.name testStaticMethodGetOwner2_070
     * @tc.desc Verify getStaticMethods on MultipleOwnerMethodsClass returns length 3 with same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultipleOwnerMethodsClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let ownerName: string = methods[0].getOwner().getName();
      expect(methods[1].getOwner().getName()).assertEqual(ownerName);
      expect(methods[2].getOwner().getName()).assertEqual(ownerName);
    });

  });
}
