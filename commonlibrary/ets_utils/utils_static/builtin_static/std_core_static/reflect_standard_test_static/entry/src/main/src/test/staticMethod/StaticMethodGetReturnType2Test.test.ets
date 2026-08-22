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

class ConsistentReturnClass {
  public static getValue(): int {
    return 42;
  }
}

class SameReturnClass {
  public static process(): string {
    return 'done';
  }
  public static getValue(): int {
    return 42;
  }
}

class GenericGetReturnClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class MultiMethodGetReturnClass {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class GrandParentGetReturnClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentGetReturnClass extends GrandParentGetReturnClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildGetReturnClass extends ParentGetReturnClass {
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class VoidReturnClass {
  public static doNothing(): void {
  }
}

class BasicReturnTypeClass {
  public static getInt(): int {
    return 42;
  }
  public static getString(): string {
    return 'test';
  }
  public static getBoolean(): boolean {
    return true;
  }
}

class CustomReturnClass {
  public static process(): string {
    return 'custom';
  }
}

class OverloadedReturnClass {
  public static process(value: int): int {
    return value;
  }
  public static process(value: string): string {
    return value;
  }
}

class CrossReturnGetNameClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(): int {
    return 0;
  }
}

class CrossReturnGetOwnerClass {
  public static handle(): string {
    return 'done';
  }
  public static transform(x: int): boolean {
    return x > 0;
  }
}

class CrossReturnGetParamClass {
  public static execute(a: int, b: string): boolean {
    return true;
  }
  public static run(): void {}
}

class L4GrandParentReturnClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentReturnClass extends L4GrandParentReturnClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildReturnClass extends L4ParentReturnClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildReturnClass extends L4ChildReturnClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseReturnClass {
  public static baseMethod(): int {
    return 0;
  }
}

class L5D1ReturnClass extends L5BaseReturnClass {
  public static d1Method(): string {
    return 'd1';
  }
}

class L5D2ReturnClass extends L5D1ReturnClass {
  public static d2Method(): boolean {
    return true;
  }
}

class L5D3ReturnClass extends L5D2ReturnClass {
  public static d3Method(x: int): int {
    return x;
  }
}

class L5D4ReturnClass extends L5D3ReturnClass {
  public static d4Method(): string {
    return 'd4';
  }
}

class HeavyOverloadReturnClass {
  public static processNoArg(): void {}
  public static processInt(x: int): int {
    return x;
  }
  public static processIntStr(x: int, y: string): string {
    return y;
  }
  public static processIntStrBool(x: int, y: string, z: boolean): boolean {
    return z;
  }
  public static processString(x: string): string {
    return x;
  }
  public static processStringInt(x: string, y: int): boolean {
    return x.length > y;
  }
}

class AllReturnTypesClass {
  public static getInt(): int {
    return 1;
  }
  public static getStr(): string {
    return 's';
  }
  public static getBool(): boolean {
    return true;
  }
  public static getVoid(): void {}
}

class TripleCrossReturnClass {
  public static execute(cmd: string): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum DecimalStrEnum: string { X = '1.5', Y = '2.5', Z = '3.5' }
enum StringEnum: string { SA = "hello", SB = "world" }
enum ByteEnum: byte { BA = 0, BB = 1 }
enum LargeIntEnum: int { LA = 100, LB = 200 }

class NumericReturnRTClass {
  public static methodByte(): byte { return 0; }
  public static methodShort(): short { return 0; }
  public static methodInt(): int { return 0; }
  public static methodLong(): long { return 0; }
  public static methodFloat(): float { return 0; }
  public static methodDouble(): double { return 0.0; }
}

class FixedArrayRTClass {
  public static faReturnInt(): FixedArray<int> { return new FixedArray<int>(0, 0); }
  public static faReturnString(): FixedArray<string> { return new FixedArray<string>(0, ''); }
  public static faReturnBoolean(): FixedArray<boolean> { return new FixedArray<boolean>(0, false); }
}

class EnumMethodRTClass {
  public static returnIntEnum(): IntEnum { return IntEnum.A; }
  public static returnDecimalStrEnum(): DecimalStrEnum { return DecimalStrEnum.X; }
  public static returnStringEnum(): StringEnum { return StringEnum.SA; }
  public static returnByteEnum(): ByteEnum { return ByteEnum.BA; }
  public static returnLargeIntEnum(): LargeIntEnum { return LargeIntEnum.LA; }
}

class ModifierRTClass {
  public static overrideMethod(): int { return 1; }
  protected static protectedMethod(): boolean { return true; }
}

class FinalMethodRTClass {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class InterfaceImplRTClass {
  public static interfaceMethod(): string { return "class"; }
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassRTClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
}

class MultiInterfaceRTClass {
  public static methodA(): int { return 2; }
  public static methodB(): string { return "c"; }
  public static methodAB(x: int, y: string): boolean { return true; }
}

class EmptyBodyRTClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyRTClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayRTClass {
  public static processArray(arr: string[]): int { return arr.length; }
}

class ResizableReturnRTClass {
  public static getFlags(): boolean[] {
    let arr: boolean[] = [];
    arr.push(true);
    arr.push(false);
    return arr;
  }
}

class MultiResizableRTClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayRTClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class MixedMethodTypesRTClass {
  public static alpha(): int { return 1; }
  public static beta(): string { return 'b'; }
}

class SiblingBaseRT {
  public static shared(): string { return 'base'; }
}

class SiblingART extends SiblingBaseRT {
  public static shared(): string { return 'A'; }
}

class OverloadReturnRTClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadRTClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
}

class ArrayOverloadRTClass {
  public static processInt(arr: int[]): int { return arr.length; }
  public static processString(arr: string[]): int { return arr.length; }
}

class SpecialNameRTClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class NestedFixedArrayRTClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedRTClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class ConflictBaseRTClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildRTClass extends ConflictBaseRTClass {
  public static run(): string { return 'child static'; }
  public runInstance(): string { return 'child instance'; }
}

export default function StaticMethodGetReturnType2Test(): void {
  describe('StaticMethodGetReturnType2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0100
     * @tc.name testStaticMethodGetReturnType2_001
     * @tc.desc Verify multiple getReturnType() calls on the same StaticMethod return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentReturnClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let type1: Class = method!.getReturnType();
      let type2: Class = method!.getReturnType();
      let type3: Class = method!.getReturnType();
      expect(type1.getName()).assertEqual('i32');
      expect(type2.getName()).assertEqual(type1.getName());
      expect(type3.getName()).assertEqual(type1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0200
     * @tc.name testStaticMethodGetReturnType2_002
     * @tc.desc Verify getReturnType() returns same type from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameReturnClass>();
      let cls2 = Class.from<SameReturnClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let type1 = method1!.getReturnType();
      let type2 = method2!.getReturnType();
      expect(type1.getName()).assertEqual('std.core.String');
      expect(type2.getName()).assertEqual(type1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0300
     * @tc.name testStaticMethodGetReturnType2_003
     * @tc.desc Verify getReturnType() returns same type from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericGetReturnClass<int>>();
      let clsStr = Class.from<GenericGetReturnClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      let typeInt = methodInt!.getReturnType();
      let typeStr = methodStr!.getReturnType();
      expect(typeInt.getName()).assertEqual('std.core.String');
      expect(typeStr.getName()).assertEqual(typeInt.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0400
     * @tc.name testStaticMethodGetReturnType2_004
     * @tc.desc Verify getStaticMethod result's getReturnType() matches corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetReturnClass>();
      let method = cls.getStaticMethod('beta');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'beta') {
          let refType = method!.getReturnType();
          let arrType = methods[i].getReturnType();
          expect(refType.getName()).assertEqual(arrType.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0500
     * @tc.name testStaticMethodGetReturnType2_005
     * @tc.desc Verify getReturnType() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentGetReturnClass>();
      let childCls = Class.from<ChildGetReturnClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      let grandParentType = grandParentGreet!.getReturnType();
      let childType = childGreet!.getReturnType();
      expect(grandParentType.getName()).assertEqual('std.core.String');
      expect(childType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0600
     * @tc.name testStaticMethodGetReturnType2_006
     * @tc.desc Verify getReturnType() for method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameReturnClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0700
     * @tc.name testStaticMethodGetReturnType2_007
     * @tc.desc Verify getReturnType() and getName() cross-consistency: compute name and return type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetNameClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('compute');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0800
     * @tc.name testStaticMethodGetReturnType2_008
     * @tc.desc Verify getReturnType() and getName() cross-consistency: merge name and return type int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetNameClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('merge');
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_0900
     * @tc.name testStaticMethodGetReturnType2_009
     * @tc.desc Verify getReturnType() and getOwner() cross-consistency: handle owner and return type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetOwnerClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('CrossReturnGetOwnerClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1000
     * @tc.name testStaticMethodGetReturnType2_010
     * @tc.desc Verify getReturnType() and getOwner() cross-consistency: transform owner same class, return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetOwnerClass>();
      let methodH = cls.getStaticMethod('handle');
      let methodT = cls.getStaticMethod('transform');
      expect(methodH !== undefined).assertTrue();
      expect(methodT !== undefined).assertTrue();
      expect(methodH!.getOwner().getName()).assertEqual(methodT!.getOwner().getName());
      expect(methodH!.getReturnType().getName()).assertEqual('std.core.String');
      expect(methodT!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1100
     * @tc.name testStaticMethodGetReturnType2_011
     * @tc.desc Verify getReturnType() and getParametersNum() cross-consistency: execute 2 params return boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetParamClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1200
     * @tc.name testStaticMethodGetReturnType2_012
     * @tc.desc Verify getReturnType() and getParametersNum() cross-consistency: run 0 params return void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetParamClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1300
     * @tc.name testStaticMethodGetReturnType2_013
     * @tc.desc Verify getReturnType() and getParameterTypes() cross-consistency: execute params and return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetParamClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1400
     * @tc.name testStaticMethodGetReturnType2_014
     * @tc.desc Verify getReturnType() for 4-layer hiding: all layers return string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<L4GrandParentReturnClass>();
      let pCls = Class.from<L4ParentReturnClass>();
      let cCls = Class.from<L4ChildReturnClass>();
      let gcCls = Class.from<L4GrandChildReturnClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let pGreet = pCls.getStaticMethod('greet');
      let cGreet = cCls.getStaticMethod('greet');
      let gcGreet = gcCls.getStaticMethod('greet');
      expect(gpGreet !== undefined).assertTrue();
      expect(pGreet !== undefined).assertTrue();
      expect(cGreet !== undefined).assertTrue();
      expect(gcGreet !== undefined).assertTrue();
      expect(gpGreet!.getReturnType().getName()).assertEqual('std.core.String');
      expect(pGreet!.getReturnType().getName()).assertEqual('std.core.String');
      expect(cGreet!.getReturnType().getName()).assertEqual('std.core.String');
      expect(gcGreet!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1500
     * @tc.name testStaticMethodGetReturnType2_015
     * @tc.desc Verify getReturnType() for 5-layer non-hiding: baseMethod int, d1Method string, d2Method boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseReturnClass>();
      let d1Cls = Class.from<L5D1ReturnClass>();
      let d2Cls = Class.from<L5D2ReturnClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      let d1Method = d1Cls.getStaticMethod('d1Method');
      let d2Method = d2Cls.getStaticMethod('d2Method');
      expect(baseMethod !== undefined).assertTrue();
      expect(d1Method !== undefined).assertTrue();
      expect(d2Method !== undefined).assertTrue();
      expect(baseMethod!.getReturnType().getName()).assertEqual('i32');
      expect(d1Method!.getReturnType().getName()).assertEqual('std.core.String');
      expect(d2Method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1600
     * @tc.name testStaticMethodGetReturnType2_016
     * @tc.desc Verify getReturnType() for L5D3: return int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3ReturnClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1700
     * @tc.name testStaticMethodGetReturnType2_017
     * @tc.desc Verify getReturnType() for L5D4: return string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4ReturnClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1800
     * @tc.name testStaticMethodGetReturnType2_018
     * @tc.desc Verify getReturnType() for 6-overload class: process() void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let method = cls.getStaticMethod('processNoArg');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_1900
     * @tc.name testStaticMethodGetReturnType2_019
     * @tc.desc Verify getReturnType() for 6-overload class: process(int) int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processInt' && methods[i].getParametersNum() === 1 && methods[i].getReturnType().getName() === 'i32') {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2000
     * @tc.name testStaticMethodGetReturnType2_020
     * @tc.desc Verify getReturnType() for 6-overload class: process(int, string) string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processIntStr' && methods[i].getParametersNum() === 2 && methods[i].getReturnType().getName() === 'std.core.String') {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2100
     * @tc.name testStaticMethodGetReturnType2_021
     * @tc.desc Verify getReturnType() for 6-overload class: process(int, string, boolean) boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processIntStrBool' && methods[i].getParametersNum() === 3 && methods[i].getReturnType().getName() === 'u1') {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2200
     * @tc.name testStaticMethodGetReturnType2_022
     * @tc.desc Verify getReturnType() for AllReturnTypesClass getStr: std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypesClass>();
      let method = cls.getStaticMethod('getStr');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2300
     * @tc.name testStaticMethodGetReturnType2_023
     * @tc.desc Verify getReturnType() for 6-overload class: process(string, int) boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processStringInt' && methods[i].getParametersNum() === 2 && methods[i].getReturnType().getName() === 'u1') {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2400
     * @tc.name testStaticMethodGetReturnType2_024
     * @tc.desc Verify getReturnType() for all return types: int, string, boolean, void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypesClass>();
      let mInt = cls.getStaticMethod('getInt');
      let mStr = cls.getStaticMethod('getStr');
      let mBool = cls.getStaticMethod('getBool');
      let mVoid = cls.getStaticMethod('getVoid');
      expect(mInt !== undefined).assertTrue();
      expect(mStr !== undefined).assertTrue();
      expect(mBool !== undefined).assertTrue();
      expect(mVoid !== undefined).assertTrue();
      expect(mInt!.getReturnType().getName()).assertEqual('i32');
      expect(mStr!.getReturnType().getName()).assertEqual('std.core.String');
      expect(mBool!.getReturnType().getName()).assertEqual('u1');
      expect(mVoid!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2500
     * @tc.name testStaticMethodGetReturnType2_025
     * @tc.desc Verify getReturnType() cross-consistency with getName and getOwner for TripleCrossReturnClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossReturnClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getOwner().getName().indexOf('TripleCrossReturnClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2600
     * @tc.name testStaticMethodGetReturnType2_026
     * @tc.desc Verify getReturnType() for VoidReturnClass doNothing: void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VoidReturnClass>();
      let method = cls.getStaticMethod('doNothing');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2700
     * @tc.name testStaticMethodGetReturnType2_027
     * @tc.desc Verify getReturnType() for MultiMethodGetReturnClass all methods via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetReturnClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let foundInt: boolean = false;
      let foundStr: boolean = false;
      let foundBool: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        let ret: string = methods[i].getReturnType().getName();
        if (name === 'alpha') { expect(ret).assertEqual('i32'); foundInt = true; }
        if (name === 'beta') { expect(ret).assertEqual('std.core.String'); foundStr = true; }
        if (name === 'gamma') { expect(ret).assertEqual('u1'); foundBool = true; }
      }
      expect(foundInt).assertTrue();
      expect(foundStr).assertTrue();
      expect(foundBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2800
     * @tc.name testStaticMethodGetReturnType2_028
     * @tc.desc Verify getReturnType() for ParentGetReturnClass parentOnly: int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentGetReturnClass>();
      let method = cls.getStaticMethod('parentOnly');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_2900
     * @tc.name testStaticMethodGetReturnType2_029
     * @tc.desc Verify getReturnType() for BasicReturnTypeClass getString via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicReturnTypeClass>();
      let ref = cls.getStaticMethod('getString');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'getString') {
          expect(ref!.getReturnType().getName()).assertEqual(methods[i].getReturnType().getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3000
     * @tc.name testStaticMethodGetReturnType2_030
     * @tc.desc Verify getReturnType() for HeavyOverloadReturnClass all overloads via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let foundVoid: boolean = false;
      let foundInt: boolean = false;
      let foundStr: boolean = false;
      let foundBool: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let ret: string = methods[i].getReturnType().getName();
        if (ret === 'void') { foundVoid = true; }
        if (ret === 'i32') { foundInt = true; }
        if (ret === 'std.core.String') { foundStr = true; }
        if (ret === 'u1') { foundBool = true; }
      }
      expect(foundVoid).assertTrue();
      expect(foundInt).assertTrue();
      expect(foundStr).assertTrue();
      expect(foundBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3100
     * @tc.name testStaticMethodGetReturnType2_031
     * @tc.desc Verify getReturnType() for AllReturnTypesClass getInt from different Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<AllReturnTypesClass>();
      let cls2 = Class.from<AllReturnTypesClass>();
      let method1 = cls1.getStaticMethod('getInt');
      let method2 = cls2.getStaticMethod('getInt');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType().getName()).assertEqual(method2!.getReturnType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3200
     * @tc.name testStaticMethodGetReturnType2_032
     * @tc.desc Verify getReturnType() for L5BaseReturnClass baseMethod from L5D4: int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseReturnClass>();
      let method = baseCls.getStaticMethod('baseMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3300
     * @tc.name testStaticMethodGetReturnType2_033
     * @tc.desc Verify getReturnType() for OverloadedReturnClass overloads via getStaticMethod signatures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedReturnClass>();
      let methods = cls.getStaticMethods();
      let foundInt: boolean = false;
      let foundStr: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 1) {
          if (methods[i].getReturnType().getName() === 'i32') {
            foundInt = true;
          }
          if (methods[i].getReturnType().getName() === 'std.core.String') {
            foundStr = true;
          }
        }
      }
      expect(foundInt).assertTrue();
      expect(foundStr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3400
     * @tc.name testStaticMethodGetReturnType2_034
     * @tc.desc Verify getReturnType() for CrossReturnGetNameClass compute via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetNameClass>();
      let ref = cls.getStaticMethod('compute');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'compute') {
          expect(ref!.getReturnType().getName()).assertEqual(methods[i].getReturnType().getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3500
     * @tc.name testStaticMethodGetReturnType2_035
     * @tc.desc Verify getReturnType() for CrossReturnGetOwnerClass transform: boolean return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossReturnGetOwnerClass>();
      let method = cls.getStaticMethod('transform');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('u1');
      expect(method!.getName()).assertEqual('transform');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3600
     * @tc.name testStaticMethodGetReturnType2_036
     * @tc.desc Verify getReturnType() for ConsistentReturnClass getValue via explicit empty signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentReturnClass>();
      let methodSimple = cls.getStaticMethod('getValue');
      let methodExplicit = cls.getStaticMethod('getValue', []);
      expect(methodSimple !== undefined).assertTrue();
      expect(methodExplicit !== undefined).assertTrue();
      expect(methodSimple!.getReturnType().getName()).assertEqual(methodExplicit!.getReturnType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3700
     * @tc.name testStaticMethodGetReturnType2_037
     * @tc.desc Verify getReturnType() for CustomReturnClass process: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomReturnClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3800
     * @tc.name testStaticMethodGetReturnType2_038
     * @tc.desc Verify getReturnType() for BasicReturnTypeClass getInt via getStaticMethod with empty signature: int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicReturnTypeClass>();
      let method = cls.getStaticMethod('getInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_3900
     * @tc.name testStaticMethodGetReturnType2_039
     * @tc.desc Verify getReturnType() for BasicReturnTypeClass getBoolean: boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicReturnTypeClass>();
      let method = cls.getStaticMethod('getBoolean');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4000
     * @tc.name testStaticMethodGetReturnType2_040
     * @tc.desc Verify getReturnType() for AllReturnTypesClass getVoid: void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypesClass>();
      let method = cls.getStaticMethod('getVoid');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4100
     * @tc.name testStaticMethodGetReturnType2_041
     * @tc.desc Verify multiple getReturnType() calls on NumericReturnRTClass methodByte return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let method = cls.getStaticMethod('methodByte');
      expect(method !== undefined).assertTrue();
      let type1: Class = method!.getReturnType();
      let type2: Class = method!.getReturnType();
      let type3: Class = method!.getReturnType();
      expect(type1.getName()).assertEqual('i8');
      expect(type2.getName()).assertEqual(type1.getName());
      expect(type3.getName()).assertEqual(type1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4200
     * @tc.name testStaticMethodGetReturnType2_042
     * @tc.desc Verify getReturnType() for all NumericReturnRTClass methods via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let foundByte: boolean = false;
      let foundShort: boolean = false;
      let foundInt: boolean = false;
      let foundLong: boolean = false;
      let foundFloat: boolean = false;
      let foundDouble: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        let ret: string = methods[i].getReturnType().getName();
        if (name === 'methodByte') { expect(ret).assertEqual('i8'); foundByte = true; }
        if (name === 'methodShort') { expect(ret).assertEqual('i16'); foundShort = true; }
        if (name === 'methodInt') { expect(ret).assertEqual('i32'); foundInt = true; }
        if (name === 'methodLong') { expect(ret).assertEqual('i64'); foundLong = true; }
        if (name === 'methodFloat') { expect(ret).assertEqual('f32'); foundFloat = true; }
        if (name === 'methodDouble') { expect(ret).assertEqual('f64'); foundDouble = true; }
      }
      expect(foundByte).assertTrue();
      expect(foundShort).assertTrue();
      expect(foundInt).assertTrue();
      expect(foundLong).assertTrue();
      expect(foundFloat).assertTrue();
      expect(foundDouble).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4300
     * @tc.name testStaticMethodGetReturnType2_043
     * @tc.desc Verify getReturnType() returns same type from different Class.from() instances of NumericReturnRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<NumericReturnRTClass>();
      let cls2 = Class.from<NumericReturnRTClass>();
      let method1 = cls1.getStaticMethod('methodByte');
      let method2 = cls2.getStaticMethod('methodByte');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let type1 = method1!.getReturnType();
      let type2 = method2!.getReturnType();
      expect(type1.getName()).assertEqual('i8');
      expect(type2.getName()).assertEqual(type1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4400
     * @tc.name testStaticMethodGetReturnType2_044
     * @tc.desc Verify getReturnType() returns different types for byte and short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let mByte = cls.getStaticMethod('methodByte');
      let mShort = cls.getStaticMethod('methodShort');
      expect(mByte !== undefined).assertTrue();
      expect(mShort !== undefined).assertTrue();
      expect(mByte!.getReturnType().getName()).assertEqual('i8');
      expect(mShort!.getReturnType().getName()).assertEqual('i16');
      expect(mByte!.getReturnType().getName() !== mShort!.getReturnType().getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4500
     * @tc.name testStaticMethodGetReturnType2_045
     * @tc.desc Verify getReturnType() returns different types for int and long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let mInt = cls.getStaticMethod('methodInt');
      let mLong = cls.getStaticMethod('methodLong');
      expect(mInt !== undefined).assertTrue();
      expect(mLong !== undefined).assertTrue();
      expect(mInt!.getReturnType().getName()).assertEqual('i32');
      expect(mLong!.getReturnType().getName()).assertEqual('i64');
      expect(mInt!.getReturnType().getName() !== mLong!.getReturnType().getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4600
     * @tc.name testStaticMethodGetReturnType2_046
     * @tc.desc Verify getReturnType() returns different types for float and double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let mFloat = cls.getStaticMethod('methodFloat');
      let mDouble = cls.getStaticMethod('methodDouble');
      expect(mFloat !== undefined).assertTrue();
      expect(mDouble !== undefined).assertTrue();
      expect(mFloat!.getReturnType().getName()).assertEqual('f32');
      expect(mDouble!.getReturnType().getName()).assertEqual('f64');
      expect(mFloat!.getReturnType().getName() !== mDouble!.getReturnType().getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4700
     * @tc.name testStaticMethodGetReturnType2_047
     * @tc.desc Verify getReturnType() consistency with getName for NumericReturnRTClass methodInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let method = cls.getStaticMethod('methodInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodInt');
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4800
     * @tc.name testStaticMethodGetReturnType2_048
     * @tc.desc Verify getReturnType() cross-consistency with getOwner and getName for NumericReturnRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnRTClass>();
      let method = cls.getStaticMethod('methodDouble');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodDouble');
      expect(method!.getOwner().getName().indexOf('NumericReturnRTClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_4900
     * @tc.name testStaticMethodGetReturnType2_049
     * @tc.desc Verify getReturnType() for all FixedArrayRTClass methods via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let foundInt: boolean = false;
      let foundStr: boolean = false;
      let foundBool: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        let ret: string = methods[i].getReturnType().getName();
        if (name === 'faReturnInt') { expect(ret).assertEqual('std.core.Int[]'); foundInt = true; }
        if (name === 'faReturnString') { expect(ret).assertEqual('std.core.String[]'); foundStr = true; }
        if (name === 'faReturnBoolean') { expect(ret).assertEqual('std.core.Boolean[]'); foundBool = true; }
      }
      expect(foundInt).assertTrue();
      expect(foundStr).assertTrue();
      expect(foundBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5000
     * @tc.name testStaticMethodGetReturnType2_050
     * @tc.desc Verify getReturnType() cross-consistency with getName and getOwner for FixedArrayRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayRTClass>();
      let method = cls.getStaticMethod('faReturnInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('faReturnInt');
      expect(method!.getOwner().getName().indexOf('FixedArrayRTClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.Int[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5100
     * @tc.name testStaticMethodGetReturnType2_051
     * @tc.desc Verify getReturnType() consistency from different Class.from instances for FixedArrayRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<FixedArrayRTClass>();
      let cls2 = Class.from<FixedArrayRTClass>();
      let method1 = cls1.getStaticMethod('faReturnString');
      let method2 = cls2.getStaticMethod('faReturnString');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType().getName()).assertEqual(method2!.getReturnType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5200
     * @tc.name testStaticMethodGetReturnType2_052
     * @tc.desc Verify getReturnType() for all EnumMethodRTClass enum methods via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(5);
      let foundInt: boolean = false;
      let foundDouble: boolean = false;
      let foundStr: boolean = false;
      let foundByte: boolean = false;
      let foundLong: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        let ret: string = methods[i].getReturnType().getName();
        if (name === 'returnIntEnum')
        {
          expect(ret.indexOf('IntEnum') >= 0).assertTrue();
          foundInt = true;
        }
        if (name === 'returnDecimalStrEnum')
        {
          expect(ret.indexOf('DecimalStrEnum') >= 0).assertTrue();
          foundDouble = true;
        }
        if (name === 'returnStringEnum')
        {
          expect(ret.indexOf('StringEnum') >= 0).assertTrue();
          foundStr = true;
        }
        if (name === 'returnByteEnum')
        {
          expect(ret.indexOf('ByteEnum') >= 0).assertTrue();
          foundByte = true;
        }
        if (name === 'returnLargeIntEnum')
        {
          expect(ret.indexOf('LargeIntEnum') >= 0).assertTrue();
          foundLong = true;
        }
      }
      expect(foundInt).assertTrue();
      expect(foundDouble).assertTrue();
      expect(foundStr).assertTrue();
      expect(foundByte).assertTrue();
      expect(foundLong).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5300
     * @tc.name testStaticMethodGetReturnType2_053
     * @tc.desc Verify getReturnType() for override method returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierRTClass>();
      let method = cls.getStaticMethod('overrideMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5400
     * @tc.name testStaticMethodGetReturnType2_054
     * @tc.desc Verify getReturnType() for InterfaceImplRTClass interfaceMethod returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplRTClass>();
      let method = cls.getStaticMethod('interfaceMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5500
     * @tc.name testStaticMethodGetReturnType2_055
     * @tc.desc Verify getReturnType() for GenericClassRTClass methodString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassRTClass<string>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5600
     * @tc.name testStaticMethodGetReturnType2_056
     * @tc.desc Verify getReturnType() for MultiInterfaceRTClass methodAB returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterfaceRTClass>();
      let method = cls.getStaticMethod('methodAB');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5700
     * @tc.name testStaticMethodGetReturnType2_057
     * @tc.desc Verify getReturnType() and getParameterTypes() cross-consistency for GenericClassRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassRTClass<int>>();
      let method = cls.getStaticMethod('methodIntBool');
      expect(method !== undefined).assertTrue();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('u1');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5800
     * @tc.name testStaticMethodGetReturnType2_058
     * @tc.desc Verify getReturnType() consistency between getStaticMethod and getStaticMethods for MultiInterfaceRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterfaceRTClass>();
      let ref = cls.getStaticMethod('methodB');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'methodB') {
          expect(ref!.getReturnType().getName()).assertEqual(methods[i].getReturnType().getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_5900
     * @tc.name testStaticMethodGetReturnType2_059
     * @tc.desc Verify getReturnType() consistency from different Class.from instances for InterfaceImplRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<InterfaceImplRTClass>();
      let cls2 = Class.from<InterfaceImplRTClass>();
      let method1 = cls1.getStaticMethod('interfaceMethod');
      let method2 = cls2.getStaticMethod('interfaceMethod');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getReturnType().getName()).assertEqual(method2!.getReturnType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6000
     * @tc.name testStaticMethodGetReturnType2_060
     * @tc.desc Verify getReturnType() cross-consistency with getName and getOwner for MultiInterfaceRTClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterfaceRTClass>();
      let method = cls.getStaticMethod('methodA');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodA');
      expect(method!.getOwner().getName().indexOf('MultiInterfaceRTClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6100
     * @tc.name testStaticMethodGetReturnType2_061
     * @tc.desc Verify getReturnType() for ResizableArrayRTClass.processArray returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayRTClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6200
     * @tc.name testStaticMethodGetReturnType2_062
     * @tc.desc Verify getReturnType() for ResizableReturnRTClass.getFlags returns std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableReturnRTClass>();
      let method = cls.getStaticMethod('getFlags');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6300
     * @tc.name testStaticMethodGetReturnType2_063
     * @tc.desc Verify getReturnType() for MultiResizableRTClass.mergeArrays returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizableRTClass>();
      let method = cls.getStaticMethod('mergeArrays');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6400
     * @tc.name testStaticMethodGetReturnType2_064
     * @tc.desc Verify getReturnType() for MixedArrayRTClass.complexProcess returns u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayRTClass>();
      let method = cls.getStaticMethod('complexProcess');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6500
     * @tc.name testStaticMethodGetReturnType2_065
     * @tc.desc Verify getReturnType() via getStaticMethods() for MultiResizableRTClass: all return void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizableRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getReturnType().getName()).assertEqual('void');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6600
     * @tc.name testStaticMethodGetReturnType2_066
     * @tc.desc Verify getReturnType() via getStaticMethods() for MixedArrayRTClass: all return u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getReturnType().getName()).assertEqual('u1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6700
     * @tc.name testStaticMethodGetReturnType2_067
     * @tc.desc Verify getReturnType() via getStaticMethods() for ResizableArrayRTClass: all return i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getReturnType().getName()).assertEqual('i32');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6800
     * @tc.name testStaticMethodGetReturnType2_068
     * @tc.desc Verify getReturnType() for SiblingART.shared returns std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SiblingART>();
      let m1 = cls.getStaticMethod('shared');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_6900
     * @tc.name testStaticMethodGetReturnType2_069
     * @tc.desc Verify getReturnType() for OverloadReturnRTClass overloads: all return i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnRTClass>();
      let m1 = cls.getStaticMethod('computeNoArg');
      let m2 = cls.getStaticMethod('computeOneArg');
      let m3 = cls.getStaticMethod('computeTwoArgs');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('i32');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
      expect(m3!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7000
     * @tc.name testStaticMethodGetReturnType2_070
     * @tc.desc Verify getReturnType() for MixedOverloadRTClass: processInt returns String, processString returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedOverloadRTClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7100
     * @tc.name testStaticMethodGetReturnType2_071
     * @tc.desc Verify getReturnType() for ArrayOverloadRTClass: both overloads return i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayOverloadRTClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('i32');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7200
     * @tc.name testStaticMethodGetReturnType2_072
     * @tc.desc Verify getReturnType() for NestedFixedArrayRTClass.processMatrix returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedFixedArrayRTClass>();
      let method = cls.getStaticMethod('processMatrix');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7300
     * @tc.name testStaticMethodGetReturnType2_073
     * @tc.desc Verify getReturnType() for TripleNestedRTClass.process3D returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleNestedRTClass>();
      let method = cls.getStaticMethod('process3D');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7400
     * @tc.name testStaticMethodGetReturnType2_074
     * @tc.desc Verify getReturnType() for EmptyBodyRTClass: single empty method returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyBodyRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7500
     * @tc.name testStaticMethodGetReturnType2_075
     * @tc.desc Verify getReturnType() for MultiEmptyBodyRTClass: all 3 empty methods return void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiEmptyBodyRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getReturnType().getName()).assertEqual('void');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7600
     * @tc.name testStaticMethodGetReturnType2_076
     * @tc.desc Verify getReturnType() for ResizableReturnRTClass: single method returns std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableReturnRTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getReturnType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7700
     * @tc.name testStaticMethodGetReturnType2_077
     * @tc.desc Verify getReturnType() for SpecialNameRTClass: specialGet returns i32, specialSet returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameRTClass>();
      let m1 = cls.getStaticMethod('specialGet');
      let m2 = cls.getStaticMethod('specialSet');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('i32');
      expect(m2!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7800
     * @tc.name testStaticMethodGetReturnType2_078
     * @tc.desc Verify getReturnType() for FinalMethodRTClass: methodA returns void, methodB returns i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodRTClass>();
      let m1 = cls.getStaticMethod('methodA');
      let m2 = cls.getStaticMethod('methodB');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('void');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_7900
     * @tc.name testStaticMethodGetReturnType2_079
     * @tc.desc Verify getReturnType() for ConflictChildRTClass.run returns std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictChildRTClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_8000
     * @tc.name testStaticMethodGetReturnType2_080
     * @tc.desc Verify getReturnType() for MixedMethodTypesRTClass: alpha returns i32, beta returns std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedMethodTypesRTClass>();
      let m1 = cls.getStaticMethod('alpha');
      let m2 = cls.getStaticMethod('beta');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('i32');
      expect(m2!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_8100
     * @tc.name testStaticMethodGetReturnType2_081
     * @tc.desc Verify getReturnType on void method returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VoidReturnClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length > 0).assertTrue();
      expect(methods[0].getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_8200
     * @tc.name testStaticMethodGetReturnType2_082
     * @tc.desc Verify getReturnType on HeavyOverloadReturnClass different overloads returns different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadReturnClass>();
      let m1 = cls.getStaticMethod('processNoArg');
      let m2 = cls.getStaticMethod('processInt');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getReturnType().getName()).assertEqual('void');
      expect(m2!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_8300
     * @tc.name testStaticMethodGetReturnType2_083
     * @tc.desc Verify getReturnType returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicReturnTypeClass>();
      let method = cls.getStaticMethod('getInt');
      expect(method !== undefined).assertTrue();
      let type1: string = method!.getReturnType().getName();
      let type2: string = method!.getReturnType().getName();
      expect(type1).assertEqual(type2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_RETURN_TYPE_TWO_8400
     * @tc.name testStaticMethodGetReturnType2_084
     * @tc.desc Verify getStaticMethods on dual-method class returns length 2 with distinct return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetReturnType2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameReturnClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

  });
}
