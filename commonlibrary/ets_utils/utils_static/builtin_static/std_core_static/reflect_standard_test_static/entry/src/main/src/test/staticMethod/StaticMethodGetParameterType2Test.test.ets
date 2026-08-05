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

class ConsistentParamTypeClass {
  public static getValue(a: int, b: string): string {
    return b;
  }
}

class SameParamTypeClass {
  public static process(name: string): string {
    return name.toUpperCase();
  }
}

class GenericParamTypeClass<T> {
  public static process(input: string): string {
    return 'generic';
  }
}

class MultiParamMethodClass {
  public static withArgs(x: int, y: string): boolean { return true; }
  public static withNoArgs(): string { return 'done'; }
  public static withFlag(flag: boolean): boolean { return flag; }
}

class GrandParentGetParamTypeClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentGetParamTypeClass extends GrandParentGetParamTypeClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildGetParamTypeClass extends ParentGetParamTypeClass {
  public static childOwn(): int {
    return 1;
  }
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class BasicTypeParamClass {
  public static processInt(value: int): int {
    return value;
  }
  public static processString(value: string): string {
    return value;
  }
  public static processBoolean(value: boolean): boolean {
    return value;
  }
}

class MultiParamTypeClass {
  public static process(a: int, b: string, c: boolean): boolean {
    return c;
  }
}

class ArrayParamTypeClass {
  public static processArray(arr: int[]): int {
    return arr.length;
  }
}

class CrossParamTypeGetNameClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(a: string, b: boolean): int {
    return a.length;
  }
}

class CrossParamTypeGetNumClass {
  public static handle(value: string): int {
    return value.length;
  }
  public static transform(x: int, y: string, z: boolean): boolean {
    return z;
  }
}

class CrossParamTypeGetTypesClass {
  public static execute(a: int, b: string): boolean {
    return true;
  }
  public static run(x: string): void {}
}

class L4GrandParentParamTypeClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentParamTypeClass extends L4GrandParentParamTypeClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildParamTypeClass extends L4ParentParamTypeClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildParamTypeClass extends L4ChildParamTypeClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseParamTypeClass {
  public static baseMethod(x: int): int {
    return x;
  }
}

class L5D1ParamTypeClass extends L5BaseParamTypeClass {
  public static d1Method(x: string): string {
    return x;
  }
}

class L5D2ParamTypeClass extends L5D1ParamTypeClass {
  public static d2Method(x: boolean): boolean {
    return x;
  }
}

class L5D3ParamTypeClass extends L5D2ParamTypeClass {
  public static d3Method(x: int, y: string): string {
    return y;
  }
}

class L5D4ParamTypeClass extends L5D3ParamTypeClass {
  public static d4Method(x: string, y: boolean, z: int): boolean {
    return y;
  }
}

class HeavyOverloadParamTypeClass {
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
}

class TripleCrossParamTypeClass {
  public static execute(cmd: string, flag: boolean): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum DecimalStrEnum: string { X = '1.5', Y = '2.5', Z = '3.5' }
enum StringEnum: string { SA = "hello", SB = "world" }
enum ByteEnum: byte { BA = 0, BB = 1 }
enum LargeIntEnum: int { LA = 100, LB = 200 }

class NumericParamPTClass {
  public static methodByte(x: byte): void {}
  public static methodShort(x: short): void {}
  public static methodInt(x: int): void {}
  public static methodLong(x: long): void {}
  public static methodFloat(x: float): void {}
  public static methodDouble(x: double): void {}
}

class MixedNumericPTClass {
  public static mixed1(a: byte, b: short): void {}
  public static mixed2(a: int, b: long, c: float): void {}
  public static mixed3(a: double, b: byte): void {}
}

class FixedArrayPTClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faStringParam(x: FixedArray<string>): void {}
  public static faBooleanParam(x: FixedArray<boolean>): void {}
  public static faDoubleParam(x: FixedArray<double>): void {}
}

class MultiFixedArrayPTClass {
  public static faTwoParams(a: FixedArray<int>, b: FixedArray<string>): void {}
}

class EnumMethodPTClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramDecimalStrEnum(e: DecimalStrEnum): void {}
  public static paramStringEnum(e: StringEnum): void {}
  public static paramByteEnum(e: ByteEnum): void {}
  public static paramLargeIntEnum(e: LargeIntEnum): void {}
  public static paramTwoEnums(a: IntEnum, b: StringEnum): void {}
}

class NamedMethodPTClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
}

class InterfaceImplPTClass {
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassPTClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
  public static methodMultiParams(a: int, b: string, c: boolean): void {}
}

class MultiInterfacePTClass {
  public static methodA(): int { return 2; }
  public static methodB(): string { return "c"; }
  public static methodAB(x: int, y: string): boolean { return true; }
}

class EmptyBodyPTClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyPTClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayPTClass {
  public static processArray(arr: string[]): int { return arr.length; }
}

class MultiResizablePTClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayPTClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class EnumOwnerPTClass {
  public static getValue(): int { return 42; }
}

class SiblingBasePT {
  public static shared(): string { return 'base'; }
}

class SiblingAPT extends SiblingBasePT {
  public static shared(): string { return 'A'; }
}

class OverloadReturnPTClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadPTClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
}

class ArrayOverloadPTClass {
  public static processInt(arr: int[]): int { return arr.length; }
  public static processString(arr: string[]): int { return arr.length; }
}

class FinalMethodPTClass2 {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class SpecialNamePTClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class NestedFixedArrayPTClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedPTClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class ConflictBasePTClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildPTClass extends ConflictBasePTClass {
  public static run(): string { return 'child static'; }
  public instanceRun(): string { return 'child instance'; }
}

export default function StaticMethodGetParameterType2Test(): void {
  describe('StaticMethodGetParameterType2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0100
     * @tc.name testStaticMethodGetParameterType2_001
     * @tc.desc Verify multiple getParameterType() calls at same index return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypeClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let type1 = method!.getParameterType(1);
      let type2 = method!.getParameterType(1);
      let type3 = method!.getParameterType(1);
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
      expect(type3 !== undefined).assertTrue();
      expect(type1!.getName()).assertEqual('std.core.String');
      expect(type2!.getName()).assertEqual(type1!.getName());
      expect(type3!.getName()).assertEqual(type1!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0200
     * @tc.name testStaticMethodGetParameterType2_002
     * @tc.desc Verify getParameterType() returns same type from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameParamTypeClass>();
      let cls2 = Class.from<SameParamTypeClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let type1 = method1!.getParameterType(0);
      let type2 = method2!.getParameterType(0);
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
      expect(type1!.getName()).assertEqual('std.core.String');
      expect(type2!.getName()).assertEqual(type1!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0300
     * @tc.name testStaticMethodGetParameterType2_003
     * @tc.desc Verify getParameterType() returns same type from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericParamTypeClass<int>>();
      let clsStr = Class.from<GenericParamTypeClass<string>>();
      let methodInt = clsInt.getStaticMethod('process');
      let methodStr = clsStr.getStaticMethod('process');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      let typeInt = methodInt!.getParameterType(0);
      let typeStr = methodStr!.getParameterType(0);
      expect(typeInt !== undefined).assertTrue();
      expect(typeStr !== undefined).assertTrue();
      expect(typeInt!.getName()).assertEqual(typeStr!.getName());
      expect(typeInt!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0400
     * @tc.name testStaticMethodGetParameterType2_004
     * @tc.desc Verify getStaticMethod result's getParameterType() matches corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamMethodClass>();
      let method = cls.getStaticMethod('withArgs');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'withArgs') {
          let refType = method!.getParameterType(1);
          let arrType = methods[i].getParameterType(1);
          expect(refType !== undefined).assertTrue();
          expect(arrType !== undefined).assertTrue();
          expect(refType!.getName()).assertEqual(arrType!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0500
     * @tc.name testStaticMethodGetParameterType2_005
     * @tc.desc Verify getParameterType() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentGetParamTypeClass>();
      let childCls = Class.from<ChildGetParamTypeClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      let grandParentType = grandParentGreet!.getParameterType(0);
      let childType = childGreet!.getParameterType(0);
      expect(grandParentType !== undefined).assertTrue();
      expect(childType !== undefined).assertTrue();
      expect(grandParentType!.getName()).assertEqual('std.core.String');
      expect(childType!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0600
     * @tc.name testStaticMethodGetParameterType2_006
     * @tc.desc Verify getParameterType() for basic types (int, string, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicTypeParamClass>();
      let methodInt = cls.getStaticMethod('processInt');
      let methodStr = cls.getStaticMethod('processString');
      let methodBool = cls.getStaticMethod('processBoolean');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodBool !== undefined).assertTrue();
      expect(methodInt!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(methodStr!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(methodBool!.getParameterType(0)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0700
     * @tc.name testStaticMethodGetParameterType2_007
     * @tc.desc Verify getParameterType() for multiple parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamTypeClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0800
     * @tc.name testStaticMethodGetParameterType2_008
     * @tc.desc Verify getParameterType() for array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayParamTypeClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_0900
     * @tc.name testStaticMethodGetParameterType2_009
     * @tc.desc Verify getParameterType() and getParameterTypes() cross-consistency: index 0 matches first element of types array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetTypesClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      let single0 = method!.getParameterType(0);
      let single1 = method!.getParameterType(1);
      expect(single0 !== undefined).assertTrue();
      expect(single1 !== undefined).assertTrue();
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(2);
      expect(single0!.getName()).assertEqual(all[0].getName());
      expect(single1!.getName()).assertEqual(all[1].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1000
     * @tc.name testStaticMethodGetParameterType2_010
     * @tc.desc Verify getParameterType() and getParametersNum() cross-consistency: transform method has 3 params, all accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetNumClass>();
      let method = cls.getStaticMethod('transform');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1100
     * @tc.name testStaticMethodGetParameterType2_011
     * @tc.desc Verify getParameterType() and getName() cross-consistency: compute method name and param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetNameClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('compute');
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1200
     * @tc.name testStaticMethodGetParameterType2_012
     * @tc.desc Verify getParameterType() and getName() cross-consistency: merge method name and param types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetNameClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('merge');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1300
     * @tc.name testStaticMethodGetParameterType2_013
     * @tc.desc Verify getParameterType() for 4-layer hiding: each layer greet param type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<L4GrandParentParamTypeClass>();
      let pCls = Class.from<L4ParentParamTypeClass>();
      let cCls = Class.from<L4ChildParamTypeClass>();
      let gcCls = Class.from<L4GrandChildParamTypeClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let pGreet = pCls.getStaticMethod('greet');
      let cGreet = cCls.getStaticMethod('greet');
      let gcGreet = gcCls.getStaticMethod('greet');
      expect(gpGreet !== undefined).assertTrue();
      expect(pGreet !== undefined).assertTrue();
      expect(cGreet !== undefined).assertTrue();
      expect(gcGreet !== undefined).assertTrue();
      expect(gpGreet!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(pGreet!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(cGreet!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(gcGreet!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1400
     * @tc.name testStaticMethodGetParameterType2_014
     * @tc.desc Verify getParameterType() for 5-layer non-hiding: each layer method param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseParamTypeClass>();
      let d1Cls = Class.from<L5D1ParamTypeClass>();
      let d2Cls = Class.from<L5D2ParamTypeClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      let d1Method = d1Cls.getStaticMethod('d1Method');
      let d2Method = d2Cls.getStaticMethod('d2Method');
      expect(baseMethod !== undefined).assertTrue();
      expect(d1Method !== undefined).assertTrue();
      expect(d2Method !== undefined).assertTrue();
      expect(baseMethod!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(d1Method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(d2Method!.getParameterType(0)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1500
     * @tc.name testStaticMethodGetParameterType2_015
     * @tc.desc Verify getParameterType() for 5-layer L5D3 method with 2 params: int and string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3ParamTypeClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1600
     * @tc.name testStaticMethodGetParameterType2_016
     * @tc.desc Verify getParameterType() for 5-layer L5D4 method with 3 params: string, boolean, int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4ParamTypeClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(2)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1700
     * @tc.name testStaticMethodGetParameterType2_017
     * @tc.desc Verify getParameterType() for 6-overload class: process(int, string) params types int and string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processIntStr' && methods[i].getParametersNum() === 2) {
          if (methods[i].getParameterType(0)!.getName() === 'i32' && methods[i].getParameterType(1)!.getName() === 'std.core.String') {
            found = true;
            break;
          }
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1800
     * @tc.name testStaticMethodGetParameterType2_018
     * @tc.desc Verify getParameterType() for 6-overload class: process(string) param type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let method = cls.getStaticMethod('processString');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_1900
     * @tc.name testStaticMethodGetParameterType2_019
     * @tc.desc Verify getParameterType() for AllTypesParamClass: methodInt param is i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let method = cls.getStaticMethod('methodInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2000
     * @tc.name testStaticMethodGetParameterType2_020
     * @tc.desc Verify getParameterType() for AllTypesParamClass: methodStr param is std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let method = cls.getStaticMethod('methodStr');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2100
     * @tc.name testStaticMethodGetParameterType2_021
     * @tc.desc Verify getParameterType() for AllTypesParamClass: methodBool param is u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesParamClass>();
      let method = cls.getStaticMethod('methodBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2200
     * @tc.name testStaticMethodGetParameterType2_022
     * @tc.desc Verify getParameterType() and getReturnType() cross-consistency: execute method param types and return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossParamTypeClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('u1');
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2300
     * @tc.name testStaticMethodGetParameterType2_023
     * @tc.desc Verify getParameterType() and getOwner() cross-consistency: execute method owner and param types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossParamTypeClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('TripleCrossParamTypeClass') >= 0).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2400
     * @tc.name testStaticMethodGetParameterType2_024
     * @tc.desc Verify getParameterType() for run method from CrossParamTypeGetTypesClass: single string param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetTypesClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2500
     * @tc.name testStaticMethodGetParameterType2_025
     * @tc.desc Verify getParameterType() and getParametersNum() for handle method: 1 param string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetNumClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(1);
      expect(all[0].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2600
     * @tc.name testStaticMethodGetParameterType2_026
     * @tc.desc Verify getParameterType() for CrossParamTypeGetNameClass compute via getStaticMethods matches direct access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossParamTypeGetNameClass>();
      let ref = cls.getStaticMethod('compute');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'compute') {
          expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[i].getParameterType(0)!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2700
     * @tc.name testStaticMethodGetParameterType2_027
     * @tc.desc Verify getParameterType() for GrandParentGetParamTypeClass greet: single string param from different Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<GrandParentGetParamTypeClass>();
      let cls2 = Class.from<GrandParentGetParamTypeClass>();
      let method1 = cls1.getStaticMethod('greet');
      let method2 = cls2.getStaticMethod('greet');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParameterType(0)!.getName()).assertEqual(method2!.getParameterType(0)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2800
     * @tc.name testStaticMethodGetParameterType2_028
     * @tc.desc Verify getParameterType() for ConsistentParamTypeClass getValue via explicit getStaticMethod with type signatures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypeClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'getValue' && methods[i].getParametersNum() === 2) {
          expect(methods[i].getParameterType(0)!.getName()).assertEqual('i32');
          expect(methods[i].getParameterType(1)!.getName()).assertEqual('std.core.String');
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_2900
     * @tc.name testStaticMethodGetParameterType2_029
     * @tc.desc Verify getParameterType() for BasicTypeParamClass processString via getStaticMethod with string signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicTypeParamClass>();
      let method = cls.getStaticMethod('processString', [Class.from<string>()]);
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3000
     * @tc.name testStaticMethodGetParameterType2_030
     * @tc.desc Verify getParameterType() for BasicTypeParamClass processBoolean via getStaticMethod with boolean signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicTypeParamClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processBoolean' && methods[i].getParametersNum() === 1) {
          expect(methods[i].getParameterType(0)!.getName()).assertEqual('u1');
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3100
     * @tc.name testStaticMethodGetParameterType2_031
     * @tc.desc Verify getParameterType() for L5BaseParamTypeClass baseMethod from L5D4: still has int param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5BaseParamTypeClass>();
      let method = cls.getStaticMethod('baseMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3200
     * @tc.name testStaticMethodGetParameterType2_032
     * @tc.desc Verify getParameterType() for GrandParentGetParamTypeClass greet via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandParentGetParamTypeClass>();
      let ref = cls.getStaticMethod('greet');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[0].getParameterType(0)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3300
     * @tc.name testStaticMethodGetParameterType2_033
     * @tc.desc Verify getParameterType() for ParentGetParamTypeClass parentOnly: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentGetParamTypeClass>();
      let method = cls.getStaticMethod('parentOnly');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3400
     * @tc.name testStaticMethodGetParameterType2_034
     * @tc.desc Verify getParameterType() for ChildGetParamTypeClass childOwn: zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildGetParamTypeClass>();
      let method = cls.getStaticMethod('childOwn');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3500
     * @tc.name testStaticMethodGetParameterType2_035
     * @tc.desc Verify getParameterType() for ConsistentParamTypeClass getValue all indices via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypeClass>();
      let ref = cls.getStaticMethod('getValue');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(ref!.getParametersNum()).assertEqual(methods[0].getParametersNum());
      expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[0].getParameterType(0)!.getName());
      expect(ref!.getParameterType(1)!.getName()).assertEqual(methods[0].getParameterType(1)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3600
     * @tc.name testStaticMethodGetParameterType2_036
     * @tc.desc Verify getParameterType() cross-instance for SameParamTypeClass process
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameParamTypeClass>();
      let cls2 = Class.from<SameParamTypeClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParameterType(0)!.getName()).assertEqual(method2!.getParameterType(0)!.getName());
      expect(method1!.getParametersNum()).assertEqual(method2!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3700
     * @tc.name testStaticMethodGetParameterType2_037
     * @tc.desc Verify getParameterType() for MultiParamTypeClass process all indices from getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamTypeClass>();
      let ref = cls.getStaticMethod('process');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(ref!.getParametersNum()).assertEqual(3);
      expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[0].getParameterType(0)!.getName());
      expect(ref!.getParameterType(1)!.getName()).assertEqual(methods[0].getParameterType(1)!.getName());
      expect(ref!.getParameterType(2)!.getName()).assertEqual(methods[0].getParameterType(2)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3800
     * @tc.name testStaticMethodGetParameterType2_038
     * @tc.desc Verify getParameterType() for withArgs from MultiParamMethodClass: first param i32, second string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamMethodClass>();
      let method = cls.getStaticMethod('withArgs');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_3900
     * @tc.name testStaticMethodGetParameterType2_039
     * @tc.desc Verify getParameterType() for getValue from ConsistentParamTypeClass: multiple calls different indices correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentParamTypeClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(2);
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(method!.getParameterType(0)!.getName()).assertEqual(types[0].getName());
      expect(method!.getParameterType(1)!.getName()).assertEqual(types[1].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4000
     * @tc.name testStaticMethodGetParameterType2_040
     * @tc.desc Verify getParameterType() for NumericParamPTClass methodShort param type is 'i16'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodShort');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4100
     * @tc.name testStaticMethodGetParameterType2_041
     * @tc.desc Verify getParameterType() for NumericParamPTClass methodLong param type is 'i64'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodLong');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4200
     * @tc.name testStaticMethodGetParameterType2_042
     * @tc.desc Verify getParameterType() for NumericParamPTClass methodDouble param type is 'f64'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodDouble');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4300
     * @tc.name testStaticMethodGetParameterType2_043
     * @tc.desc Verify getParameterType() for MixedNumericPTClass mixed3(double, byte) types f64, i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericPTClass>();
      let method = cls.getStaticMethod('mixed3');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4400
     * @tc.name testStaticMethodGetParameterType2_044
     * @tc.desc Verify getParameterType() consistency: repeated calls to methodByte return same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodByte');
      expect(method !== undefined).assertTrue();
      let type1 = method!.getParameterType(0);
      let type2 = method!.getParameterType(0);
      let type3 = method!.getParameterType(0);
      expect(type1 !== undefined).assertTrue();
      expect(type2 !== undefined).assertTrue();
      expect(type3 !== undefined).assertTrue();
      expect(type1!.getName()).assertEqual('i8');
      expect(type2!.getName()).assertEqual(type1!.getName());
      expect(type3!.getName()).assertEqual(type1!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4500
     * @tc.name testStaticMethodGetParameterType2_045
     * @tc.desc Verify getParameterType() consistency: methodDouble from getStaticMethod matches getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let ref = cls.getStaticMethod('methodDouble');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'methodDouble') {
          expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[i].getParameterType(0)!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4600
     * @tc.name testStaticMethodGetParameterType2_046
     * @tc.desc Verify getParameterType() and getParameterTypes() cross-consistency: methodShort index 0 matches first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodShort');
      expect(method !== undefined).assertTrue();
      let single = method!.getParameterType(0);
      expect(single !== undefined).assertTrue();
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(1);
      expect(single!.getName()).assertEqual(all[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4700
     * @tc.name testStaticMethodGetParameterType2_047
     * @tc.desc Verify getParameterType() and getParametersNum() cross-consistency: mixed2 has 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericPTClass>();
      let method = cls.getStaticMethod('mixed2');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i64');
      expect(method!.getParameterType(2)!.getName()).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4800
     * @tc.name testStaticMethodGetParameterType2_048
     * @tc.desc Verify getParameterType() and getOwner() cross-consistency: methodFloat owner and param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamPTClass>();
      let method = cls.getStaticMethod('methodFloat');
      expect(method !== undefined).assertTrue();
      expect(method!.getOwner().getName().indexOf('NumericParamPTClass') >= 0).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_4900
     * @tc.name testStaticMethodGetParameterType2_049
     * @tc.desc Verify getParameterType() and getParametersNum() for mixed1: 2 params i8, i16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericPTClass>();
      let method = cls.getStaticMethod('mixed1');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.getParameterType(0)!.getName()).assertEqual('i8');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5000
     * @tc.name testStaticMethodGetParameterType2_050
     * @tc.desc Verify getParameterType() for FixedArray<int> param from FixedArrayPTClass faIntParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5100
     * @tc.name testStaticMethodGetParameterType2_051
     * @tc.desc Verify getParameterType() for FixedArray<string> param from FixedArrayPTClass faStringParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let method = cls.getStaticMethod('faStringParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5200
     * @tc.name testStaticMethodGetParameterType2_052
     * @tc.desc Verify getParameterType() for FixedArray<boolean> param from FixedArrayPTClass faBooleanParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let method = cls.getStaticMethod('faBooleanParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5300
     * @tc.name testStaticMethodGetParameterType2_053
     * @tc.desc Verify getParameterType() for FixedArray<double> param from FixedArrayPTClass faDoubleParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let method = cls.getStaticMethod('faDoubleParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5400
     * @tc.name testStaticMethodGetParameterType2_054
     * @tc.desc Verify getParameterType() consistency: faIntParam from getStaticMethod matches getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let ref = cls.getStaticMethod('faIntParam');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'faIntParam') {
          expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[i].getParameterType(0)!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5500
     * @tc.name testStaticMethodGetParameterType2_055
     * @tc.desc Verify getParameterType() and getParameterTypes() cross-consistency: faIntParam index 0 matches first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayPTClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      let single = method!.getParameterType(0);
      expect(single !== undefined).assertTrue();
      let all: FixedArray<Class> = method!.getParameterTypes();
      expect(all.length).assertEqual(1);
      expect(single!.getName()).assertEqual(all[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5600
     * @tc.name testStaticMethodGetParameterType2_056
     * @tc.desc Verify getParameterType() and getParameterTypes() for faTwoParams: 2 params, types array length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFixedArrayPTClass>();
      let method = cls.getStaticMethod('faTwoParams');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5700
     * @tc.name testStaticMethodGetParameterType2_057
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramIntEnum param with IntEnum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramIntEnum');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
      expect(paramType!.getName().indexOf('IntEnum') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5800
     * @tc.name testStaticMethodGetParameterType2_058
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramDecimalStrEnum param with DecimalStrEnum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramDecimalStrEnum');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
      expect(paramType!.getName().indexOf('DecimalStrEnum') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_5900
     * @tc.name testStaticMethodGetParameterType2_059
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramStringEnum param with StringEnum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramStringEnum');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
      expect(paramType!.getName().indexOf('StringEnum') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6000
     * @tc.name testStaticMethodGetParameterType2_060
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramByteEnum param with ByteEnum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramByteEnum');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
      expect(paramType!.getName().indexOf('ByteEnum') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6100
     * @tc.name testStaticMethodGetParameterType2_061
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramLargeIntEnum param with LargeIntEnum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramLargeIntEnum');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== undefined).assertTrue();
      expect(paramType!.getName().indexOf('LargeIntEnum') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6200
     * @tc.name testStaticMethodGetParameterType2_062
     * @tc.desc Verify getParameterType() for EnumMethodPTClass paramTwoEnums with IntEnum and StringEnum params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramTwoEnums');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.getParameterType(0) !== undefined).assertTrue();
      expect(method!.getParameterType(1) !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6300
     * @tc.name testStaticMethodGetParameterType2_063
     * @tc.desc Verify getParameterType() consistency: paramIntEnum from getStaticMethod matches getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let ref = cls.getStaticMethod('paramIntEnum');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'paramIntEnum') {
          expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[i].getParameterType(0)!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6400
     * @tc.name testStaticMethodGetParameterType2_064
     * @tc.desc Verify getParameterType() cross-consistency: paramTwoEnums getParametersNum is 2, getParameterTypes length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let method = cls.getStaticMethod('paramTwoEnums');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6500
     * @tc.name testStaticMethodGetParameterType2_065
     * @tc.desc Verify getParameterType() for NamedMethodPTClass specialGet param type is i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodPTClass>();
      let method = cls.getStaticMethod('specialGet');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6600
     * @tc.name testStaticMethodGetParameterType2_066
     * @tc.desc Verify getParameterType() for NamedMethodPTClass specialSet params both i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodPTClass>();
      let method = cls.getStaticMethod('specialSet');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6700
     * @tc.name testStaticMethodGetParameterType2_067
     * @tc.desc Verify getParameterType() for InterfaceImplPTClass classOnlyMethod param type is i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplPTClass>();
      let method = cls.getStaticMethod('classOnlyMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6800
     * @tc.name testStaticMethodGetParameterType2_068
     * @tc.desc Verify getParameterType() for GenericClassPTClass methodString param type is std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassPTClass<string>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_6900
     * @tc.name testStaticMethodGetParameterType2_069
     * @tc.desc Verify getParameterType() for GenericClassPTClass methodIntBool params i32 and u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassPTClass<int>>();
      let method = cls.getStaticMethod('methodIntBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7000
     * @tc.name testStaticMethodGetParameterType2_070
     * @tc.desc Verify getParameterType() for GenericClassPTClass methodMultiParams: i32, String, u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassPTClass<string>>();
      let method = cls.getStaticMethod('methodMultiParams');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7100
     * @tc.name testStaticMethodGetParameterType2_071
     * @tc.desc Verify getParameterType() for MultiInterfacePTClass methodAB params i32 and std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterfacePTClass>();
      let method = cls.getStaticMethod('methodAB');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7200
     * @tc.name testStaticMethodGetParameterType2_072
     * @tc.desc Verify getParameterType() for MultiInterfacePTClass methodA and methodB both have zero params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterfacePTClass>();
      let methodA = cls.getStaticMethod('methodA');
      let methodB = cls.getStaticMethod('methodB');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getParametersNum()).assertEqual(0);
      expect(methodB!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7300
     * @tc.name testStaticMethodGetParameterType2_073
     * @tc.desc Verify getParameterType() and getParametersNum() across different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsN = Class.from<NumericParamPTClass>();
      let clsF = Class.from<FixedArrayPTClass>();
      let mN = clsN.getStaticMethod('methodByte');
      let mF = clsF.getStaticMethod('faIntParam');
      expect(mN !== undefined).assertTrue();
      expect(mF !== undefined).assertTrue();
      expect(mN!.getParameterType(0)!.getName()).assertEqual('i8');
      expect(mF!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7400
     * @tc.name testStaticMethodGetParameterType2_074
     * @tc.desc Verify cross-API: paramIntEnum via getStaticMethods returns valid param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodPTClass>();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'paramIntEnum') {
          expect(methods[i].getParameterType(0) !== undefined).assertTrue();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7500
     * @tc.name testStaticMethodGetParameterType2_075
     * @tc.desc Verify cross-API: classOnlyMethod from getStaticMethod matches getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplPTClass>();
      let ref = cls.getStaticMethod('classOnlyMethod');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'classOnlyMethod') {
          expect(ref!.getParameterType(0)!.getName()).assertEqual(methods[i].getParameterType(0)!.getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7600
     * @tc.name testStaticMethodGetParameterType2_076
     * @tc.desc Verify cross-API: methodAB and mixed1 both have 2 params with their respective types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsM = Class.from<MultiInterfacePTClass>();
      let clsN = Class.from<MixedNumericPTClass>();
      let mAB = clsM.getStaticMethod('methodAB');
      let mM1 = clsN.getStaticMethod('mixed1');
      expect(mAB !== undefined).assertTrue();
      expect(mM1 !== undefined).assertTrue();
      expect(mAB!.getParametersNum()).assertEqual(2);
      expect(mM1!.getParametersNum()).assertEqual(2);
      expect(mAB!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(mAB!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(mM1!.getParameterType(0)!.getName()).assertEqual('i8');
      expect(mM1!.getParameterType(1)!.getName()).assertEqual('i16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7700
     * @tc.name testStaticMethodGetParameterType2_077
     * @tc.desc Verify cross-API: methodString from different generic instantiations return same param type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsStr = Class.from<GenericClassPTClass<string>>();
      let clsInt = Class.from<GenericClassPTClass<int>>();
      let methodStr = clsStr.getStaticMethod('methodString');
      let methodInt = clsInt.getStaticMethod('methodString');
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr!.getParameterType(0)!.getName()).assertEqual(methodInt!.getParameterType(0)!.getName());
      expect(methodStr!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7800
     * @tc.name testStaticMethodGetParameterType2_078
     * @tc.desc Verify getParameterType() for ResizableArrayPTClass.processArray: param 0 is Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayPTClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_7900
     * @tc.name testStaticMethodGetParameterType2_079
     * @tc.desc Verify getParameterType() for MultiResizablePTClass.mergeArrays: both params are Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizablePTClass>();
      let method = cls.getStaticMethod('mergeArrays');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8000
     * @tc.name testStaticMethodGetParameterType2_080
     * @tc.desc Verify getParameterType() for MixedArrayPTClass.complexProcess: param 0 is Int[], param 1 is Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayPTClass>();
      let method = cls.getStaticMethod('complexProcess');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Int[]');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8100
     * @tc.name testStaticMethodGetParameterType2_081
     * @tc.desc Verify getParametersNum() for SiblingAPT.shared: 0 params (no parameter types)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SiblingAPT>();
      let m1 = cls.getStaticMethod('shared');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8200
     * @tc.name testStaticMethodGetParameterType2_082
     * @tc.desc Verify getParametersNum() for OverloadReturnPTClass overloads: computeNoArg=0, computeOneArg=1, computeTwoArgs=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnPTClass>();
      let m1 = cls.getStaticMethod('computeNoArg');
      let m2 = cls.getStaticMethod('computeOneArg');
      let m3 = cls.getStaticMethod('computeTwoArgs');
      expect(m1!.getParametersNum()).assertEqual(0);
      expect(m2!.getParametersNum()).assertEqual(1);
      expect(m3!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8300
     * @tc.name testStaticMethodGetParameterType2_083
     * @tc.desc Verify getParameterType() for MixedOverloadPTClass: processInt param=i32, processString param=String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedOverloadPTClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8400
     * @tc.name testStaticMethodGetParameterType2_084
     * @tc.desc Verify getParameterType() for ArrayOverloadPTClass: both processInt and processString have Array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayOverloadPTClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8500
     * @tc.name testStaticMethodGetParameterType2_085
     * @tc.desc Verify getParameterType() for NestedFixedArrayPTClass.processMatrix: param 0 is Int[][]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedFixedArrayPTClass>();
      let method = cls.getStaticMethod('processMatrix');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Int[][]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8600
     * @tc.name testStaticMethodGetParameterType2_086
     * @tc.desc Verify getParameterType() for TripleNestedPTClass.process3D: param 0 is Int[][][]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleNestedPTClass>();
      let method = cls.getStaticMethod('process3D');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Int[][][]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8700
     * @tc.name testStaticMethodGetParameterType2_087
     * @tc.desc Verify getParametersNum() for EmptyBodyPTClass: single method returns 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyBodyPTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8800
     * @tc.name testStaticMethodGetParameterType2_088
     * @tc.desc Verify getParametersNum() for MultiEmptyBodyPTClass: 3 methods all return 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiEmptyBodyPTClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getParametersNum()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_8900
     * @tc.name testStaticMethodGetParameterType2_089
     * @tc.desc Verify getParameterType() for SpecialNamePTClass: specialGet param0=i32, specialSet params are i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNamePTClass>();
      let m1 = cls.getStaticMethod('specialGet');
      let m2 = cls.getStaticMethod('specialSet');
      expect(m1!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(m2!.getParameterType(1)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9000
     * @tc.name testStaticMethodGetParameterType2_090
     * @tc.desc Verify getParameterType() for FinalMethodPTClass2: methodA 0 params, methodB param0=i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodPTClass2>();
      let m1 = cls.getStaticMethod('methodA');
      let m2 = cls.getStaticMethod('methodB');
      expect(m1!.getParametersNum()).assertEqual(0);
      expect(m2!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9100
     * @tc.name testStaticMethodGetParameterType2_091
     * @tc.desc Verify getParametersNum() for EnumOwnerPTClass.getValue: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumOwnerPTClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9200
     * @tc.name testStaticMethodGetParameterType2_092
     * @tc.desc Verify getParametersNum() for ConflictChildPTClass.run: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictChildPTClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9300
     * @tc.name testStaticMethodGetParameterType2_093
     * @tc.desc Verify getParameterType(0) on single-parameter method returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicTypeParamClass>();
      let method = cls.getStaticMethod('processInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9400
     * @tc.name testStaticMethodGetParameterType2_094
     * @tc.desc Verify getParameterType on IntStrBool method returns correct types for i32, String, u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let method = cls.getStaticMethod('processIntStrBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9500
     * @tc.name testStaticMethodGetParameterType2_095
     * @tc.desc Verify getStaticMethod with empty param types resolves zero-arg overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let method = cls.getStaticMethod('processNoArg');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9600
     * @tc.name testStaticMethodGetParameterType2_096
     * @tc.desc Verify getStaticMethod with int param type resolves single-int overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let method = cls.getStaticMethod('processInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9700
     * @tc.name testStaticMethodGetParameterType2_097
     * @tc.desc Verify getStaticMethod with string+int param types resolves two-param overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadParamTypeClass>();
      let method = cls.getStaticMethod('processStringInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_TWO_9800
     * @tc.name testStaticMethodGetParameterType2_098
     * @tc.desc Verify getStaticMethods on dual-method class returns length 2 with distinct params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnPTClass>();
      let m1 = cls.getStaticMethod('computeNoArg');
      let m2 = cls.getStaticMethod('computeOneArg');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
    });

  });
}
