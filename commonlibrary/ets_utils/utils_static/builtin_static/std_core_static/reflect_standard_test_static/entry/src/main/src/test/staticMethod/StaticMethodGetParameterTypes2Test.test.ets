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

class ConsistentParamTypesClass {
  public static getValue(): int {
    return 42;
  }
}

class SameParamTypesClass {
  public static process(name: string): string {
    return name.toUpperCase();
  }
  public static getValue(): int {
    return 42;
  }
}

class GenericGetParamTypesClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class MultiMethodGetParamTypesClass {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class GrandParentGetParamTypesClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentGetParamTypesClass extends GrandParentGetParamTypesClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildGetParamTypesClass extends ParentGetParamTypesClass {
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class MultiParamTypesClass {
  public static process(a: int, b: string, c: boolean): boolean {
    return c;
  }
  public static processTwo(a: int, b: string): string {
    return b;
  }
  public static processOne(x: boolean): boolean {
    return x;
  }
}

class SingleParamTypesClass {
  public static getValue(x: int): int {
    return x;
  }
}

class NoParamTypesClass {
  public static noParams(): int {
    return 0;
  }
}

class OverloadedParamTypesClass {
  public static process(value: int): int {
    return value;
  }
  public static process(value: string): string {
    return value;
  }
}

class CrossTypesGetTypeClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(a: string, b: boolean): int {
    return a.length;
  }
}

class CrossTypesGetNumClass {
  public static handle(value: string): int {
    return value.length;
  }
  public static transform(x: int, y: string, z: boolean): boolean {
    return z;
  }
}

class L4GrandParentParamTypesClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentParamTypesClass extends L4GrandParentParamTypesClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildParamTypesClass extends L4ParentParamTypesClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildParamTypesClass extends L4ChildParamTypesClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseParamTypesClass {
  public static baseMethod(x: int): int {
    return x;
  }
}

class L5D1ParamTypesClass extends L5BaseParamTypesClass {
  public static d1Method(x: string): string {
    return x;
  }
}

class L5D2ParamTypesClass extends L5D1ParamTypesClass {
  public static d2Method(x: boolean): boolean {
    return x;
  }
}

class L5D3ParamTypesClass extends L5D2ParamTypesClass {
  public static d3Method(x: int, y: string): string {
    return y;
  }
}

class L5D4ParamTypesClass extends L5D3ParamTypesClass {
  public static d4Method(x: string, y: boolean, z: int): boolean {
    return y;
  }
}

class HeavyOverloadParamTypesClass {
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

class AllTypesParamClass {
  public static methodInt(a: int): int {
    return a;
  }
  public static methodStr(a: string): string {
    return a;
  }
  public static methodBool(a: boolean): boolean {
    return a;
  }
  public static methodMulti(a: int, b: string, c: boolean): boolean {
    return c;
  }
}

class TripleCrossTypesClass {
  public static execute(cmd: string, flag: boolean): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum StringEnum: string { SA = "hello", SB = "world" }

class NumericParamTypesClass {
  public static methodByte(x: byte): void {}
  public static methodShort(x: short): void {}
  public static methodInt(x: int): void {}
  public static methodLong(x: long): void {}
  public static methodFloat(x: float): void {}
  public static methodDouble(x: double): void {}
}

class MixedNumericParamTypesClass {
  public static mixed1(a: byte, b: short): void {}
  public static mixed2(a: int, b: long, c: float): void {}
  public static mixed3(a: double, b: byte): void {}
}

class FixedArrayParamTypesClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faStringParam(x: FixedArray<string>): void {}
  public static faBooleanParam(x: FixedArray<boolean>): void {}
}

class MultiFixedArrayParamTypesClass {
  public static faTwoParams(a: FixedArray<int>, b: FixedArray<string>): void {}
}

class EnumMethodParamTypesClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramStringEnum(e: StringEnum): void {}
  public static paramTwoEnums(a: IntEnum, b: StringEnum): void {}
}

class ModifierParamTypesClass {
  public static protectedMethod(): void {}
}

class NamedMethodParamTypesClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
}

class InterfaceImplParamTypesClass {
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassParamTypesClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
  public static methodMultiParams(a: int, b: string, c: boolean): void {}
}

class EmptyBodyParamTypesClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyParamTypesClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayParamTypesClass {
  public static processArray(arr: string[]): int { return arr.length; }
}

class ResizableReturnParamTypesClass {
  public static getFlags(): boolean[] {
    let arr: boolean[] = [];
    arr.push(true);
    arr.push(false);
    return arr;
  }
}

class MultiResizableParamTypesClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayParamTypesClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class SiblingBaseParamTypes {
  public static shared(): string { return 'base'; }
}

class SiblingAParamTypes extends SiblingBaseParamTypes {
  public static shared(): string { return 'A'; }
}

class OverloadReturnParamTypesClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadParamTypesClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
}

class ArrayOverloadParamTypesClass {
  public static processInt(arr: int[]): int { return arr.length; }
  public static processString(arr: string[]): int { return arr.length; }
}

class FinalMethodParamTypesClass2 {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class SpecialNameParamTypesClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class NestedFixedArrayParamTypesClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedParamTypesClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class ConflictBaseParamTypesClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildParamTypesClass extends ConflictBaseParamTypesClass {
  public static run(): string { return 'child static'; }
  public instanceRun(): string { return 'child instance'; }
}

export default function StaticMethodGetParameterTypes2Test(): void {
  describe('StaticMethodGetParameterTypes2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0100
     * @tc.name testStaticMethodGetParameterTypes2_001
     * @tc.desc Verify multiple getParameterTypes() calls on the same StaticMethod return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypesClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let types1: FixedArray<Class> = method!.getParameterTypes();
      let types2: FixedArray<Class> = method!.getParameterTypes();
      let types3: FixedArray<Class> = method!.getParameterTypes();
      expect(types1.length).assertEqual(0);
      expect(types2.length).assertEqual(types1.length);
      expect(types3.length).assertEqual(types1.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0200
     * @tc.name testStaticMethodGetParameterTypes2_002
     * @tc.desc Verify getParameterTypes() returns same types from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameParamTypesClass>();
      let cls2 = Class.from<SameParamTypesClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let types1 = method1!.getParameterTypes();
      let types2 = method2!.getParameterTypes();
      expect(types1.length).assertEqual(1);
      expect(types2.length).assertEqual(types1.length);
      expect(types1[0].getName()).assertEqual('std.core.String');
      expect(types2[0].getName()).assertEqual(types1[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0300
     * @tc.name testStaticMethodGetParameterTypes2_003
     * @tc.desc Verify getParameterTypes() returns same types from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericGetParamTypesClass<int>>();
      let clsStr = Class.from<GenericGetParamTypesClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      let typesInt = methodInt!.getParameterTypes();
      let typesStr = methodStr!.getParameterTypes();
      expect(typesInt.length).assertEqual(0);
      expect(typesStr.length).assertEqual(typesInt.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0400
     * @tc.name testStaticMethodGetParameterTypes2_004
     * @tc.desc Verify getStaticMethod result's getParameterTypes() matches corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetParamTypesClass>();
      let method = cls.getStaticMethod('beta');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'beta') {
          let refTypes = method!.getParameterTypes();
          let arrTypes = methods[i].getParameterTypes();
          expect(refTypes.length).assertEqual(arrTypes.length);
          for (let j: int = 0; j < refTypes.length; j++) {
            expect(refTypes[j].getName()).assertEqual(arrTypes[j].getName());
          }
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0500
     * @tc.name testStaticMethodGetParameterTypes2_005
     * @tc.desc Verify getParameterTypes() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentGetParamTypesClass>();
      let childCls = Class.from<ChildGetParamTypesClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      let grandParentTypes = grandParentGreet!.getParameterTypes();
      let childTypes = childGreet!.getParameterTypes();
      expect(grandParentTypes.length).assertEqual(1);
      expect(childTypes.length).assertEqual(1);
      expect(grandParentTypes[0].getName()).assertEqual('std.core.String');
      expect(childTypes[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0600
     * @tc.name testStaticMethodGetParameterTypes2_006
     * @tc.desc Verify getParameterTypes() for overloaded methods returns correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let types0 = methods[0].getParameterTypes();
      let types1 = methods[1].getParameterTypes();
      expect(types0.length).assertEqual(1);
      expect(types1.length).assertEqual(1);
      expect(types0[0].getName()).assertEqual('i32');
      expect(types1[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0700
     * @tc.name testStaticMethodGetParameterTypes2_007
     * @tc.desc Verify getParameterTypes() and getParameterType() cross-consistency: each index matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetTypeClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(1);
      let single = method!.getParameterType(0);
      expect(single !== undefined).assertTrue();
      expect(all[0].getName()).assertEqual(single!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0800
     * @tc.name testStaticMethodGetParameterTypes2_008
     * @tc.desc Verify getParameterTypes() and getParameterType() cross-consistency for merge: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetTypeClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(2);
      expect(all[0].getName()).assertEqual('std.core.String');
      expect(all[1].getName()).assertEqual('u1');
      let s0 = method!.getParameterType(0);
      let s1 = method!.getParameterType(1);
      expect(s0 !== undefined).assertTrue();
      expect(s1 !== undefined).assertTrue();
      expect(all[0].getName()).assertEqual(s0!.getName());
      expect(all[1].getName()).assertEqual(s1!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_0900
     * @tc.name testStaticMethodGetParameterTypes2_009
     * @tc.desc Verify getParameterTypes().length equals getParametersNum(): compute has 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetTypeClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(method!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1000
     * @tc.name testStaticMethodGetParameterTypes2_010
     * @tc.desc Verify getParameterTypes().length equals getParametersNum(): getValue has 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypesClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(method!.getParametersNum());
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1100
     * @tc.name testStaticMethodGetParameterTypes2_011
     * @tc.desc Verify getParameterTypes() length equals getParametersNum(): transform has 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetNumClass>();
      let method = cls.getStaticMethod('transform');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(method!.getParametersNum());
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(types[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1200
     * @tc.name testStaticMethodGetParameterTypes2_012
     * @tc.desc Verify getParameterTypes() for 4-layer hiding: all layers have same param type [string]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<L4GrandParentParamTypesClass>();
      let pCls = Class.from<L4ParentParamTypesClass>();
      let cCls = Class.from<L4ChildParamTypesClass>();
      let gcCls = Class.from<L4GrandChildParamTypesClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let pGreet = pCls.getStaticMethod('greet');
      let cGreet = cCls.getStaticMethod('greet');
      let gcGreet = gcCls.getStaticMethod('greet');
      expect(gpGreet !== undefined).assertTrue();
      expect(pGreet !== undefined).assertTrue();
      expect(cGreet !== undefined).assertTrue();
      expect(gcGreet !== undefined).assertTrue();
      expect(gpGreet!.getParameterTypes().length).assertEqual(1);
      expect(pGreet!.getParameterTypes().length).assertEqual(1);
      expect(cGreet!.getParameterTypes().length).assertEqual(1);
      expect(gcGreet!.getParameterTypes().length).assertEqual(1);
      expect(gpGreet!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(pGreet!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(cGreet!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(gcGreet!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1300
     * @tc.name testStaticMethodGetParameterTypes2_013
     * @tc.desc Verify getParameterTypes() for 5-layer non-hiding: each layer method param types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseParamTypesClass>();
      let d1Cls = Class.from<L5D1ParamTypesClass>();
      let d2Cls = Class.from<L5D2ParamTypesClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      let d1Method = d1Cls.getStaticMethod('d1Method');
      let d2Method = d2Cls.getStaticMethod('d2Method');
      expect(baseMethod !== undefined).assertTrue();
      expect(d1Method !== undefined).assertTrue();
      expect(d2Method !== undefined).assertTrue();
      expect(baseMethod!.getParameterTypes().length).assertEqual(1);
      expect(d1Method!.getParameterTypes().length).assertEqual(1);
      expect(d2Method!.getParameterTypes().length).assertEqual(1);
      expect(baseMethod!.getParameterTypes()[0].getName()).assertEqual('i32');
      expect(d1Method!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(d2Method!.getParameterTypes()[0].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1400
     * @tc.name testStaticMethodGetParameterTypes2_014
     * @tc.desc Verify getParameterTypes() for L5D3: 2 params [int, string]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3ParamTypesClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1500
     * @tc.name testStaticMethodGetParameterTypes2_015
     * @tc.desc Verify getParameterTypes() for L5D4: 3 params [string, boolean, int]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4ParamTypesClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(types[1].getName()).assertEqual('u1');
      expect(types[2].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1600
     * @tc.name testStaticMethodGetParameterTypes2_016
     * @tc.desc Verify getParameterTypes() for 6-overload class: process(int) has [int]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processInt' && methods[i].getParametersNum() === 1) {
          let types = methods[i].getParameterTypes();
          if (types.length === 1 && types[0].getName() === 'i32') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1700
     * @tc.name testStaticMethodGetParameterTypes2_017
     * @tc.desc Verify getParameterTypes() for 6-overload class: process(int, string) has [int, string]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processIntStr' && methods[i].getParametersNum() === 2) {
          let types = methods[i].getParameterTypes();
          if (types.length === 2 && types[0].getName() === 'i32' && types[1].getName() === 'std.core.String') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1800
     * @tc.name testStaticMethodGetParameterTypes2_018
     * @tc.desc Verify getParameterTypes() for 6-overload class: process(int, string, boolean) has [int, string, boolean]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processIntStrBool' && methods[i].getParametersNum() === 3) {
          let types = methods[i].getParameterTypes();
          if (types.length === 3 && types[0].getName() === 'i32' && types[1].getName() === 'std.core.String' && types[2].getName() === 'u1') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_1900
     * @tc.name testStaticMethodGetParameterTypes2_019
     * @tc.desc Verify getParameterTypes() for 6-overload class: process(string) has [string]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let method = cls.getStaticMethod('processString');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2000
     * @tc.name testStaticMethodGetParameterTypes2_020
     * @tc.desc Verify getParameterTypes() for 6-overload class: process(string, int) has [string, int]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processStringInt' && methods[i].getParametersNum() === 2) {
          let types = methods[i].getParameterTypes();
          if (types.length === 2 && types[0].getName() === 'std.core.String' && types[1].getName() === 'i32') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2100
     * @tc.name testStaticMethodGetParameterTypes2_021
     * @tc.desc Verify getParameterTypes() for all basic types: methodInt param [int], methodStr [string], methodBool [boolean]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let mInt = cls.getStaticMethod('methodInt');
      let mStr = cls.getStaticMethod('methodStr');
      let mBool = cls.getStaticMethod('methodBool');
      expect(mInt !== undefined).assertTrue();
      expect(mStr !== undefined).assertTrue();
      expect(mBool !== undefined).assertTrue();
      expect(mInt!.getParameterTypes()[0].getName()).assertEqual('i32');
      expect(mStr!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
      expect(mBool!.getParameterTypes()[0].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2200
     * @tc.name testStaticMethodGetParameterTypes2_022
     * @tc.desc Verify getParameterTypes() for methodMulti: [int, string, boolean]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let method = cls.getStaticMethod('methodMulti');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(types[2].getName()).assertEqual('u1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2300
     * @tc.name testStaticMethodGetParameterTypes2_023
     * @tc.desc Verify getParameterTypes() cross-consistency with getName and getOwner for TripleCrossTypesClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossTypesClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getOwner().getName().endsWith('TripleCrossTypesClass')).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(types[1].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2400
     * @tc.name testStaticMethodGetParameterTypes2_024
     * @tc.desc Verify getParameterTypes() for generic<boolean> instantiation returns same as <string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsBool = Class.from<GenericGetParamTypesClass<boolean>>();
      let clsStr = Class.from<GenericGetParamTypesClass<string>>();
      let methodBool = clsBool.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodBool !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodBool!.getParameterTypes().length).assertEqual(methodStr!.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2500
     * @tc.name testStaticMethodGetParameterTypes2_025
     * @tc.desc Verify getParameterTypes() for process from SameParamTypesClass: single string param via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameParamTypesClass>();
      let ref = cls.getStaticMethod('process');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getName()).assertEqual('process');
      let refTypes = ref!.getParameterTypes();
      let arrTypes = methods[0].getParameterTypes();
      expect(refTypes.length).assertEqual(arrTypes.length);
      expect(refTypes[0].getName()).assertEqual(arrTypes[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2600
     * @tc.name testStaticMethodGetParameterTypes2_026
     * @tc.desc Verify getParameterTypes() for MultiParamTypesClass: process has 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamTypesClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(types[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2700
     * @tc.name testStaticMethodGetParameterTypes2_027
     * @tc.desc Verify getParameterTypes() for OverloadedParamTypesClass via getStaticMethods all entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let paramTypes: string[] = [];
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getName()).assertEqual('process');
        let types = methods[i].getParameterTypes();
        expect(types.length).assertEqual(1);
        paramTypes.push(types[0].getName());
      }
      let distinct: boolean = paramTypes[0] !== paramTypes[1];
      expect(distinct).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2800
     * @tc.name testStaticMethodGetParameterTypes2_028
     * @tc.desc Verify getParameterTypes() for L5BaseParamTypesClass baseMethod from L5D4: same param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseParamTypesClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      expect(baseMethod !== undefined).assertTrue();
      let baseTypes = baseMethod!.getParameterTypes();
      expect(baseTypes.length).assertEqual(1);
      expect(baseTypes[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_2900
     * @tc.name testStaticMethodGetParameterTypes2_029
     * @tc.desc Verify getParameterTypes() for GrandParentGetParamTypesClass greet: single string param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandParentGetParamTypesClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3000
     * @tc.name testStaticMethodGetParameterTypes2_030
     * @tc.desc Verify getParameterTypes() for ChildGetParamTypesClass greet: hidden method still string param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildGetParamTypesClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3100
     * @tc.name testStaticMethodGetParameterTypes2_031
     * @tc.desc Verify getParameterTypes() for ParentGetParamTypesClass parentOnly: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentGetParamTypesClass>();
      let method = cls.getStaticMethod('parentOnly');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3200
     * @tc.name testStaticMethodGetParameterTypes2_032
     * @tc.desc Verify getParameterTypes() for NoParamTypesClass: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParamTypesClass>();
      let method = cls.getStaticMethod('noParams');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3300
     * @tc.name testStaticMethodGetParameterTypes2_033
     * @tc.desc Verify getParameterTypes() for handle from CrossTypesGetNumClass: single string param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetNumClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(types.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3400
     * @tc.name testStaticMethodGetParameterTypes2_034
     * @tc.desc Verify getParameterTypes() for HeavyOverloadParamTypesClass process() with 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let method = cls.getStaticMethod('processNoArg');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3500
     * @tc.name testStaticMethodGetParameterTypes2_035
     * @tc.desc Verify getParameterTypes() for AllTypesParamClass methodMulti via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let ref = cls.getStaticMethod('methodMulti');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'methodMulti') {
          let refTypes = ref!.getParameterTypes();
          let arrTypes = methods[i].getParameterTypes();
          expect(refTypes.length).assertEqual(arrTypes.length);
          expect(refTypes[0].getName()).assertEqual(arrTypes[0].getName());
          expect(refTypes[1].getName()).assertEqual(arrTypes[1].getName());
          expect(refTypes[2].getName()).assertEqual(arrTypes[2].getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3600
     * @tc.name testStaticMethodGetParameterTypes2_036
     * @tc.desc Verify getParameterTypes() for SingleParamTypesClass getValue: single int param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleParamTypesClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3700
     * @tc.name testStaticMethodGetParameterTypes2_037
     * @tc.desc Verify getParameterTypes() for HeavyOverloadParamTypesClass all overloads via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let found0: boolean = false;
      let found1: boolean = false;
      let found3: boolean = false;
      let foundS: boolean = false;
      let foundSI: boolean = false;
      let foundIS: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let types = methods[i].getParameterTypes();
        if (types.length === 0) { found0 = true; }
        if (types.length === 1 && types[0].getName() === 'i32') { found1 = true; }
        if (types.length === 3) { found3 = true; }
        if (types.length === 1 && types[0].getName() === 'std.core.String') { foundS = true; }
        if (types.length === 2 && types[0].getName() === 'std.core.String' && types[1].getName() === 'i32') { foundSI = true; }
        if (types.length === 2 && types[0].getName() === 'i32' && types[1].getName() === 'std.core.String') { foundIS = true; }
      }
      expect(found0).assertTrue();
      expect(found1).assertTrue();
      expect(found3).assertTrue();
      expect(foundS).assertTrue();
      expect(foundSI).assertTrue();
      expect(foundIS).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3800
     * @tc.name testStaticMethodGetParameterTypes2_038
     * @tc.desc Verify getParameterTypes() for MultiMethodGetParamTypesClass alpha: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetParamTypesClass>();
      let method = cls.getStaticMethod('alpha');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_3900
     * @tc.name testStaticMethodGetParameterTypes2_039
     * @tc.desc Verify getParameterTypes() for OverloadedParamTypesClass: getStaticMethod with int signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedParamTypesClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 1) {
          let types = methods[i].getParameterTypes();
          if (types.length === 1 && types[0].getName() === 'i32') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4000
     * @tc.name testStaticMethodGetParameterTypes2_040
     * @tc.desc Verify getParameterTypes() for CrossTypesGetTypeClass compute: [int] via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossTypesGetTypeClass>();
      let ref = cls.getStaticMethod('compute');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'compute') {
          let refTypes = ref!.getParameterTypes();
          let arrTypes = methods[i].getParameterTypes();
          expect(refTypes.length).assertEqual(arrTypes.length);
          expect(refTypes[0].getName()).assertEqual(arrTypes[0].getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4100
     * @tc.name testStaticMethodGetParameterTypes2_041
     * @tc.desc Verify getParameterTypes() for NumericParamTypesClass methodShort: short param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodShort');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4200
     * @tc.name testStaticMethodGetParameterTypes2_042
     * @tc.desc Verify getParameterTypes() for NumericParamTypesClass methodInt: int param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodInt');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4300
     * @tc.name testStaticMethodGetParameterTypes2_043
     * @tc.desc Verify getParameterTypes() for NumericParamTypesClass methodLong: long param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodLong');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4400
     * @tc.name testStaticMethodGetParameterTypes2_044
     * @tc.desc Verify getParameterTypes() for NumericParamTypesClass methodFloat: float param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodFloat');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4500
     * @tc.name testStaticMethodGetParameterTypes2_045
     * @tc.desc Verify getParameterTypes() for NumericParamTypesClass methodDouble: double param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodDouble');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4600
     * @tc.name testStaticMethodGetParameterTypes2_046
     * @tc.desc Verify getParameterTypes() for FixedArrayParamTypesClass faStringParam: FixedArray<string> param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('faStringParam');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4700
     * @tc.name testStaticMethodGetParameterTypes2_047
     * @tc.desc Verify getParameterTypes() for FixedArrayParamTypesClass faBooleanParam: FixedArray<boolean> param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('faBooleanParam');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.Boolean[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4800
     * @tc.name testStaticMethodGetParameterTypes2_048
     * @tc.desc Verify getParameterTypes() for MultiFixedArrayParamTypesClass faTwoParams: two FixedArray params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('faTwoParams');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.Int[]');
      expect(types[1].getName()).assertEqual('std.core.String[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_4900
     * @tc.name testStaticMethodGetParameterTypes2_049
     * @tc.desc Verify getParameterTypes() for EnumMethodParamTypesClass paramIntEnum: IntEnum param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodParamTypesClass>();
      let method = cls.getStaticMethod('paramIntEnum');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName().endsWith('.IntEnum')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5000
     * @tc.name testStaticMethodGetParameterTypes2_050
     * @tc.desc Verify getParameterTypes() for EnumMethodParamTypesClass paramStringEnum: StringEnum param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodParamTypesClass>();
      let method = cls.getStaticMethod('paramStringEnum');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName().endsWith('.StringEnum')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5100
     * @tc.name testStaticMethodGetParameterTypes2_051
     * @tc.desc Verify getParameterTypes() for EnumMethodParamTypesClass paramTwoEnums: two enum params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodParamTypesClass>();
      let method = cls.getStaticMethod('paramTwoEnums');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName().endsWith('.IntEnum')).assertTrue();
      expect(types[1].getName().endsWith('.StringEnum')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5200
     * @tc.name testStaticMethodGetParameterTypes2_052
     * @tc.desc Verify getParameterTypes() for ModifierParamTypesClass protectedMethod: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierParamTypesClass>();
      let method = cls.getStaticMethod('protectedMethod');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5300
     * @tc.name testStaticMethodGetParameterTypes2_053
     * @tc.desc Verify getParameterTypes() for NamedMethodParamTypesClass specialGet and specialSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodParamTypesClass>();
      let getMethod = cls.getStaticMethod('specialGet');
      let setMethod = cls.getStaticMethod('specialSet');
      expect(getMethod !== undefined).assertTrue();
      expect(setMethod !== undefined).assertTrue();
      let getTypes = getMethod!.getParameterTypes();
      let setTypes = setMethod!.getParameterTypes();
      expect(getTypes.length).assertEqual(1);
      expect(getTypes[0].getName()).assertEqual('i32');
      expect(setTypes.length).assertEqual(2);
      expect(setTypes[0].getName()).assertEqual('i32');
      expect(setTypes[1].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5400
     * @tc.name testStaticMethodGetParameterTypes2_054
     * @tc.desc Verify getParameterTypes() for InterfaceImplParamTypesClass classOnlyMethod: int param returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplParamTypesClass>();
      let method = cls.getStaticMethod('classOnlyMethod');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5500
     * @tc.name testStaticMethodGetParameterTypes2_055
     * @tc.desc Verify getParameterTypes() for GenericClassParamTypesClass methodIntBool: int and boolean params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassParamTypesClass<Object>>();
      let method = cls.getStaticMethod('methodIntBool');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5600
     * @tc.name testStaticMethodGetParameterTypes2_056
     * @tc.desc Verify getParameterTypes() for GenericClassParamTypesClass methodMultiParams: int, string, boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassParamTypesClass<Object>>();
      let method = cls.getStaticMethod('methodMultiParams');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
      expect(types[2].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5700
     * @tc.name testStaticMethodGetParameterTypes2_057
     * @tc.desc Verify cross-API: getParameterTypes + getName + getParametersNum + getReturnType for NumericParamTypesClass methodByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamTypesClass>();
      let method = cls.getStaticMethod('methodByte');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodByte');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i8');
      expect(method!.getParametersNum()).assertEqual(types.length);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5800
     * @tc.name testStaticMethodGetParameterTypes2_058
     * @tc.desc Verify cross-API: getParameterTypes + getName + getParametersNum + getReturnType for FixedArray faIntParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('faIntParam');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.Int[]');
      expect(method!.getParametersNum()).assertEqual(types.length);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_5900
     * @tc.name testStaticMethodGetParameterTypes2_059
     * @tc.desc Verify cross-API: getParameterTypes + getName + getParametersNum + getReturnType for EnumMethod paramIntEnum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodParamTypesClass>();
      let method = cls.getStaticMethod('paramIntEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('paramIntEnum');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetParameterTypes2Test.test.IntEnum');
      expect(method!.getParametersNum()).assertEqual(types.length);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6000
     * @tc.name testStaticMethodGetParameterTypes2_060
     * @tc.desc Verify cross-API: getParameterTypes + getName + getParametersNum + getReturnType for GenericClass methodString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassParamTypesClass<Object>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodString');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(types.length);
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6100
     * @tc.name testStaticMethodGetParameterTypes2_061
     * @tc.desc Verify cross-API: getParameterTypes + getName + getParametersNum + getReturnType for MixedNumeric mixed1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericParamTypesClass>();
      let method = cls.getStaticMethod('mixed1');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('mixed1');
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i8');
      expect(types[1].getName()).assertEqual('i16');
      expect(method!.getParametersNum()).assertEqual(types.length);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6200
     * @tc.name testStaticMethodGetParameterTypes2_062
     * @tc.desc Verify getParameterTypes() for ResizableArrayParamTypesClass processArray: array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayParamTypesClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6300
     * @tc.name testStaticMethodGetParameterTypes2_063
     * @tc.desc Verify getParameterTypes() for ResizableReturnParamTypesClass getFlags: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableReturnParamTypesClass>();
      let method = cls.getStaticMethod('getFlags');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6400
     * @tc.name testStaticMethodGetParameterTypes2_064
     * @tc.desc Verify getParameterTypes() for MultiResizableParamTypesClass mergeArrays: two array params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizableParamTypesClass>();
      let method = cls.getStaticMethod('mergeArrays');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.Array');
      expect(types[1].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6500
     * @tc.name testStaticMethodGetParameterTypes2_065
     * @tc.desc Verify getParameterTypes() for MixedArrayParamTypesClass complexProcess: fixed+dynamic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('complexProcess');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.Int[]');
      expect(types[1].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6600
     * @tc.name testStaticMethodGetParameterTypes2_066
     * @tc.desc Verify getParameterTypes() for SiblingAParamTypes shared: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SiblingAParamTypes>();
      let m1 = cls.getStaticMethod('shared');
      expect(m1 !== undefined).assertTrue();
      let types = m1!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6700
     * @tc.name testStaticMethodGetParameterTypes2_067
     * @tc.desc Verify getParameterTypes() for OverloadReturnParamTypesClass computeNoArg/OneArg/TwoArgs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnParamTypesClass>();
      let m1 = cls.getStaticMethod('computeNoArg');
      let m2 = cls.getStaticMethod('computeOneArg');
      let m3 = cls.getStaticMethod('computeTwoArgs');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.getParameterTypes().length).assertEqual(0);
      expect(m2!.getParameterTypes().length).assertEqual(1);
      expect(m3!.getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6800
     * @tc.name testStaticMethodGetParameterTypes2_068
     * @tc.desc Verify getParameterTypes() for MixedOverloadParamTypesClass processInt/processString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedOverloadParamTypesClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getParameterTypes()[0].getName()).assertEqual('i32');
      expect(m2!.getParameterTypes()[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_6900
     * @tc.name testStaticMethodGetParameterTypes2_069
     * @tc.desc Verify getParameterTypes() for ArrayOverloadParamTypesClass processInt/processString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayOverloadParamTypesClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getParameterTypes()[0].getName()).assertEqual('std.core.Array');
      expect(m2!.getParameterTypes()[0].getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7000
     * @tc.name testStaticMethodGetParameterTypes2_070
     * @tc.desc Verify getParameterTypes() for NestedFixedArrayParamTypesClass processMatrix: 2D array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedFixedArrayParamTypesClass>();
      let method = cls.getStaticMethod('processMatrix');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.Int[][]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7100
     * @tc.name testStaticMethodGetParameterTypes2_071
     * @tc.desc Verify getParameterTypes() for TripleNestedParamTypesClass process3D: 3D array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleNestedParamTypesClass>();
      let method = cls.getStaticMethod('process3D');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('std.core.Int[][][]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7200
     * @tc.name testStaticMethodGetParameterTypes2_072
     * @tc.desc Verify getParameterTypes() for EmptyBodyParamTypesClass: single method zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyBodyParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7300
     * @tc.name testStaticMethodGetParameterTypes2_073
     * @tc.desc Verify getParameterTypes() for MultiEmptyBodyParamTypesClass: three methods zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiEmptyBodyParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getParameterTypes().length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7400
     * @tc.name testStaticMethodGetParameterTypes2_074
     * @tc.desc Verify getParameterTypes() for SpecialNameParamTypesClass specialGet/specialSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameParamTypesClass>();
      let m1 = cls.getStaticMethod('specialGet');
      let m2 = cls.getStaticMethod('specialSet');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getParameterTypes().length).assertEqual(1);
      expect(m2!.getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7500
     * @tc.name testStaticMethodGetParameterTypes2_075
     * @tc.desc Verify getParameterTypes() for FinalMethodParamTypesClass2 methodA/methodB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodParamTypesClass2>();
      let m1 = cls.getStaticMethod('methodA');
      let m2 = cls.getStaticMethod('methodB');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getParameterTypes().length).assertEqual(0);
      expect(m2!.getParameterTypes().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7600
     * @tc.name testStaticMethodGetParameterTypes2_076
     * @tc.desc Verify getParameterTypes() for ConflictChildParamTypesClass run: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictChildParamTypesClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7700
     * @tc.name testStaticMethodGetParameterTypes2_077
     * @tc.desc Verify getParameterTypes on zero-parameter method returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length > 0).assertTrue();
      expect(methods[0].getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7800
     * @tc.name testStaticMethodGetParameterTypes2_078
     * @tc.desc Verify getParameterTypes on HeavyOverloadParamTypesClass 3-param version returns length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let method = cls.getStaticMethod('processIntStrBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterTypes().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_7900
     * @tc.name testStaticMethodGetParameterTypes2_079
     * @tc.desc Verify getParameterTypes returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamTypesClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let types1 = method!.getParameterTypes();
      let types2 = method!.getParameterTypes();
      expect(types1.length).assertEqual(types2.length);
      for (let i: int = 0; i < types1.length; i++) {
        expect(types1[i].getName()).assertEqual(types2[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_8000
     * @tc.name testStaticMethodGetParameterTypes2_080
     * @tc.desc [getParameterTypes] Verify getStaticMethod with int param type resolves single-int overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let method = cls.getStaticMethod('processInt');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_8100
     * @tc.name testStaticMethodGetParameterTypes2_081
     * @tc.desc [getParameterTypes] Verify getStaticMethod with string+int param types resolves two-param overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypesClass>();
      let method = cls.getStaticMethod('processStringInt');
      expect(method !== undefined).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(types[1].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPES_TWO_8200
     * @tc.name testStaticMethodGetParameterTypes2_082
     * @tc.desc [getParameterTypes] Verify getStaticMethods on dual-method class returns length 2 with distinct methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterTypes2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameParamTypesClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

  });
}
