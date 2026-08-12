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

class ConsistentNumClass {
  public static getValue(): int {
    return 42;
  }
}

class SameNumClass {
  public static process(name: string): string {
    return name.toUpperCase();
  }
  public static getValue(name: string): int {
    return 42;
  }
}

class GenericGetNumClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class MultiMethodGetNumClass {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class GrandParentGetNumClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentGetNumClass extends GrandParentGetNumClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildGetNumClass extends ParentGetNumClass {
  public static childOwn(): int {
    return 1;
  }
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class MultiParamsNumClass {
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

class SingleParamNumClass {
  public static getValue(x: int): int {
    return x;
  }
}

class NoParamNumClass {
  public static noParams(): int {
    return 0;
  }
}

class OverloadedNumClass {
  public static process(value: int): int {
    return value;
  }
  public static process(value: string): string {
    return value;
  }
}

class CrossNumGetTypesClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(a: string, b: boolean): int {
    return a.length;
  }
}

class CrossNumGetTypeClass {
  public static handle(value: string): int {
    return value.length;
  }
  public static transform(x: int, y: string, z: boolean): boolean {
    return z;
  }
}

class L4GrandParentNumClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentNumClass extends L4GrandParentNumClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildNumClass extends L4ParentNumClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildNumClass extends L4ChildNumClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseNumClass {
  public static baseMethod(x: int): int {
    return x;
  }
}

class L5D1NumClass extends L5BaseNumClass {
  public static d1Method(x: string): string {
    return x;
  }
}

class L5D2NumClass extends L5D1NumClass {
  public static d2Method(x: boolean): boolean {
    return x;
  }
}

class L5D3NumClass extends L5D2NumClass {
  public static d3Method(x: int, y: string): string {
    return y;
  }
}

class L5D4NumClass extends L5D3NumClass {
  public static d4Method(x: string, y: boolean, z: int): boolean {
    return y;
  }
}

class HeavyOverloadNumClass {
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

class AllTypesNumClass {
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

class TripleCrossNumClass {
  public static execute(cmd: string, flag: boolean): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum StringEnum: string { SA = "hello", SB = "world" }

class MixedNumericNumClass {
  public static mixed1(a: byte, b: short): void {}
  public static mixed2(a: int, b: long, c: float): void {}
  public static mixed3(a: double, b: byte): void {}
}

class FixedArrayNumClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faTwoParams(a: FixedArray<int>, b: FixedArray<string>): void {}
  public static faInt2D(x: FixedArray<FixedArray<int>>): void {}
}

class EnumMethodNumClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramTwoEnums(a: IntEnum, b: StringEnum): void {}
  public static returnIntEnum(): IntEnum { return IntEnum.A; }
}

class NamedMethodNumClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class InterfaceImplNumClass {
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassNumClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
  public static methodMultiParams(a: int, b: string, c: boolean): void {}
}

class EmptyBodyNumClass {
  public static emptyMethod(): void {}
}

class MultiEmptyBodyNumClass {
  public static empty1(): void {}
  public static empty2(): void {}
  public static empty3(): void {}
}

class ResizableArrayNumClass {
  public static processArray(arr: string[]): int { return arr.length; }
}

class ResizableReturnNumClass {
  public static getFlags(): boolean[] {
    let arr: boolean[] = [];
    arr.push(true);
    arr.push(false);
    return arr;
  }
}

class MultiResizableNumClass {
  public static mergeArrays(a: int[], b: string[]): void {}
}

class MixedArrayNumClass {
  public static complexProcess(fixed: FixedArray<int>, resizable: string[]): boolean { return fixed.length > 0; }
}

class SiblingBaseNum {
  public static shared(): string { return 'base'; }
}

class SiblingANum extends SiblingBaseNum {
  public static shared(): string { return 'A'; }
}

class OverloadReturnNumClass {
  public static computeNoArg(): int { return 0; }
  public static computeOneArg(x: int): int { return x; }
  public static computeTwoArgs(x: int, y: int): int { return x + y; }
}

class MixedOverloadNumClass {
  public static processInt(x: int): string { return x.toString(); }
  public static processString(x: string): int { return x.length; }
}

class ArrayOverloadNumClass {
  public static processInt(arr: int[]): int { return arr.length; }
  public static processString(arr: string[]): int { return arr.length; }
}

class FinalMethodNumClass2 {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class NestedFixedArrayNumClass {
  public static processMatrix(matrix: FixedArray<FixedArray<int>>): int {
    return matrix.length;
  }
}

class TripleNestedNumClass {
  public static process3D(data: FixedArray<FixedArray<FixedArray<int>>>): int {
    return data.length;
  }
}

class ConflictBaseNumClass {
  public static run(): string { return 'base static'; }
}

class ConflictChildNumClass extends ConflictBaseNumClass {
  public static run(): string { return 'child static'; }
  public run(): string { return 'child instance'; }
}

export default function StaticMethodGetParametersNum2Test(): void {
  describe('StaticMethodGetParametersNum2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0100
     * @tc.name testStaticMethodGetParametersNum2_001
     * @tc.desc Verify multiple getParametersNum() calls on the same StaticMethod return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNumClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let num1: int = method!.getParametersNum();
      let num2: int = method!.getParametersNum();
      let num3: int = method!.getParametersNum();
      expect(num1).assertEqual(0);
      expect(num2).assertEqual(num1);
      expect(num3).assertEqual(num1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0200
     * @tc.name testStaticMethodGetParametersNum2_002
     * @tc.desc Verify getParametersNum() returns same value from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameNumClass>();
      let cls2 = Class.from<SameNumClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(1);
      expect(method2!.getParametersNum()).assertEqual(method1!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0300
     * @tc.name testStaticMethodGetParametersNum2_003
     * @tc.desc Verify getParametersNum() returns same value from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericGetNumClass<int>>();
      let clsStr = Class.from<GenericGetNumClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.getParametersNum()).assertEqual(0);
      expect(methodStr!.getParametersNum()).assertEqual(methodInt!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0400
     * @tc.name testStaticMethodGetParametersNum2_004
     * @tc.desc Verify getStaticMethod result's getParametersNum() matches corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetNumClass>();
      let method = cls.getStaticMethod('beta');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'beta') {
          expect(method!.getParametersNum()).assertEqual(methods[i].getParametersNum());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0500
     * @tc.name testStaticMethodGetParametersNum2_005
     * @tc.desc Verify getParametersNum() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentGetNumClass>();
      let childCls = Class.from<ChildGetNumClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      let grandParentNum = grandParentGreet!.getParametersNum();
      let childNum = childGreet!.getParametersNum();
      expect(grandParentNum).assertEqual(1);
      expect(childNum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0600
     * @tc.name testStaticMethodGetParametersNum2_006
     * @tc.desc Verify getParametersNum() for overloaded methods with different parameter counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getParametersNum()).assertEqual(1);
      expect(methods[1].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0700
     * @tc.name testStaticMethodGetParametersNum2_007
     * @tc.desc Verify getParametersNum() equals getParameterTypes().length: compute has 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypesClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0800
     * @tc.name testStaticMethodGetParametersNum2_008
     * @tc.desc Verify getParametersNum() equals getParameterTypes().length: merge has 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypesClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_0900
     * @tc.name testStaticMethodGetParametersNum2_009
     * @tc.desc Verify getParametersNum() equals getParameterTypes().length: handle has 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypeClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1000
     * @tc.name testStaticMethodGetParametersNum2_010
     * @tc.desc Verify getParametersNum() and getName() cross-consistency: compute has name 'compute' and 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypesClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('compute');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1100
     * @tc.name testStaticMethodGetParametersNum2_011
     * @tc.desc Verify getParametersNum() and getName() cross-consistency: merge has name 'merge' and 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypesClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('merge');
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1200
     * @tc.name testStaticMethodGetParametersNum2_012
     * @tc.desc Verify getParametersNum() for 4-layer hiding: all layers have 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<L4GrandParentNumClass>();
      let pCls = Class.from<L4ParentNumClass>();
      let cCls = Class.from<L4ChildNumClass>();
      let gcCls = Class.from<L4GrandChildNumClass>();
      let gpGreet = gpCls.getStaticMethod('greet');
      let pGreet = pCls.getStaticMethod('greet');
      let cGreet = cCls.getStaticMethod('greet');
      let gcGreet = gcCls.getStaticMethod('greet');
      expect(gpGreet !== undefined).assertTrue();
      expect(pGreet !== undefined).assertTrue();
      expect(cGreet !== undefined).assertTrue();
      expect(gcGreet !== undefined).assertTrue();
      expect(gpGreet!.getParametersNum()).assertEqual(1);
      expect(pGreet!.getParametersNum()).assertEqual(1);
      expect(cGreet!.getParametersNum()).assertEqual(1);
      expect(gcGreet!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1300
     * @tc.name testStaticMethodGetParametersNum2_013
     * @tc.desc Verify getParametersNum() for 5-layer non-hiding: baseMethod 1 param, d1Method 1 param, d2Method 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls = Class.from<L5BaseNumClass>();
      let d1Cls = Class.from<L5D1NumClass>();
      let d2Cls = Class.from<L5D2NumClass>();
      let baseMethod = baseCls.getStaticMethod('baseMethod');
      let d1Method = d1Cls.getStaticMethod('d1Method');
      let d2Method = d2Cls.getStaticMethod('d2Method');
      expect(baseMethod !== undefined).assertTrue();
      expect(d1Method !== undefined).assertTrue();
      expect(d2Method !== undefined).assertTrue();
      expect(baseMethod!.getParametersNum()).assertEqual(1);
      expect(d1Method!.getParametersNum()).assertEqual(1);
      expect(d2Method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1400
     * @tc.name testStaticMethodGetParametersNum2_014
     * @tc.desc Verify getParametersNum() for L5D3: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3NumClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1500
     * @tc.name testStaticMethodGetParametersNum2_015
     * @tc.desc Verify getParametersNum() for L5D4: 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4NumClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1600
     * @tc.name testStaticMethodGetParametersNum2_016
     * @tc.desc Verify getParametersNum() for all basic types: int param 1, string param 1, boolean param 1, multi 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesNumClass>();
      let mInt = cls.getStaticMethod('methodInt');
      let mStr = cls.getStaticMethod('methodStr');
      let mBool = cls.getStaticMethod('methodBool');
      let mMulti = cls.getStaticMethod('methodMulti');
      expect(mInt !== undefined).assertTrue();
      expect(mStr !== undefined).assertTrue();
      expect(mBool !== undefined).assertTrue();
      expect(mMulti !== undefined).assertTrue();
      expect(mInt!.getParametersNum()).assertEqual(1);
      expect(mStr!.getParametersNum()).assertEqual(1);
      expect(mBool!.getParametersNum()).assertEqual(1);
      expect(mMulti!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1700
     * @tc.name testStaticMethodGetParametersNum2_017
     * @tc.desc Verify getParametersNum() cross-consistency with getName and getOwner for TripleCrossNumClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossNumClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getOwner().getName().indexOf('TripleCrossNumClass') >= 0).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1800
     * @tc.name testStaticMethodGetParametersNum2_018
     * @tc.desc Verify getParametersNum() for generic<boolean> instantiation returns same as <string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsBool = Class.from<GenericGetNumClass<boolean>>();
      let clsStr = Class.from<GenericGetNumClass<string>>();
      let methodBool = clsBool.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodBool !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodBool!.getParametersNum()).assertEqual(methodStr!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_1900
     * @tc.name testStaticMethodGetParametersNum2_019
     * @tc.desc Verify getParametersNum() for OverloadedNumClass overloads: both have 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadedNumClass>();
      let methods = cls.getStaticMethods();
      let count: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'process' && methods[i].getParametersNum() === 1) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2000
     * @tc.name testStaticMethodGetParametersNum2_020
     * @tc.desc Verify getParametersNum() for all overloads via getStaticMethods: verify each param count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let count0: int = 0;
      let count1: int = 0;
      let count2: int = 0;
      let count3: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let n: int = methods[i].getParametersNum();
        if (n === 0) { count0++; }
        if (n === 1) { count1++; }
        if (n === 2) { count2++; }
        if (n === 3) { count3++; }
      }
      expect(count0).assertEqual(1);
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(2);
      expect(count3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2100
     * @tc.name testStaticMethodGetParametersNum2_021
     * @tc.desc Verify getParametersNum() for ParentGetNumClass parentOnly: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentGetNumClass>();
      let method = cls.getStaticMethod('parentOnly');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2200
     * @tc.name testStaticMethodGetParametersNum2_022
     * @tc.desc Verify getParametersNum() for ChildGetNumClass childOwn: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildGetNumClass>();
      let method = cls.getStaticMethod('childOwn');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2300
     * @tc.name testStaticMethodGetParametersNum2_023
     * @tc.desc Verify getParametersNum() for NoParamNumClass noParams: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoParamNumClass>();
      let method = cls.getStaticMethod('noParams');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2400
     * @tc.name testStaticMethodGetParametersNum2_024
     * @tc.desc Verify getParametersNum() for SingleParamNumClass getValue: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleParamNumClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2500
     * @tc.name testStaticMethodGetParametersNum2_025
     * @tc.desc Verify getParametersNum() for MultiParamsNumClass process: 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamsNumClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2600
     * @tc.name testStaticMethodGetParametersNum2_026
     * @tc.desc Verify getParametersNum() for ConsistentNumClass getValue via getStaticMethod with explicit empty signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNumClass>();
      let method = cls.getStaticMethod('getValue', []);
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2700
     * @tc.name testStaticMethodGetParametersNum2_027
     * @tc.desc Verify getParametersNum() for CrossNumGetTypesClass compute via getStaticMethods matches direct access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypesClass>();
      let ref = cls.getStaticMethod('compute');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'compute') {
          expect(ref!.getParametersNum()).assertEqual(methods[i].getParametersNum());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2800
     * @tc.name testStaticMethodGetParametersNum2_028
     * @tc.desc Verify getParametersNum() for SameNumClass process via getStaticMethod with string signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameNumClass>();
      let method = cls.getStaticMethod('process', [Class.from<string>()]);
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_2900
     * @tc.name testStaticMethodGetParametersNum2_029
     * @tc.desc Verify getParametersNum() for CrossNumGetTypeClass transform: 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossNumGetTypeClass>();
      let method = cls.getStaticMethod('transform');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3000
     * @tc.name testStaticMethodGetParametersNum2_030
     * @tc.desc Verify getParametersNum() for GrandParentGetNumClass greet: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandParentGetNumClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3100
     * @tc.name testStaticMethodGetParametersNum2_031
     * @tc.desc Verify getParametersNum() for CrossNumGetTypesClass compute from different Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossNumGetTypesClass>();
      let cls2 = Class.from<CrossNumGetTypesClass>();
      let method1 = cls1.getStaticMethod('compute');
      let method2 = cls2.getStaticMethod('compute');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(method2!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3200
     * @tc.name testStaticMethodGetParametersNum2_032
     * @tc.desc Verify getParametersNum() for AllTypesNumClass methodMulti via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllTypesNumClass>();
      let ref = cls.getStaticMethod('methodMulti');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'methodMulti') {
          expect(ref!.getParametersNum()).assertEqual(methods[i].getParametersNum());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3300
     * @tc.name testStaticMethodGetParametersNum2_033
     * @tc.desc Verify getParametersNum() for MixedNumericNumClass.mixed1: byte + short = 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericNumClass>();
      let method = cls.getStaticMethod('mixed1');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3400
     * @tc.name testStaticMethodGetParametersNum2_034
     * @tc.desc Verify getParametersNum() for MixedNumericNumClass.mixed2: int + long + float = 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericNumClass>();
      let method = cls.getStaticMethod('mixed2');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3500
     * @tc.name testStaticMethodGetParametersNum2_035
     * @tc.desc Verify getParametersNum() for MixedNumericNumClass.mixed3: double + byte = 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericNumClass>();
      let method = cls.getStaticMethod('mixed3');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3600
     * @tc.name testStaticMethodGetParametersNum2_036
     * @tc.desc Verify getParametersNum() for FixedArrayNumClass.faIntParam: FixedArray<int> = 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNumClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3700
     * @tc.name testStaticMethodGetParametersNum2_037
     * @tc.desc Verify getParametersNum() for FixedArrayNumClass.faTwoParams: FixedArray<int> + FixedArray<string> = 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNumClass>();
      let method = cls.getStaticMethod('faTwoParams');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3800
     * @tc.name testStaticMethodGetParametersNum2_038
     * @tc.desc Verify getParametersNum() for FixedArrayNumClass.faInt2D: FixedArray<FixedArray<int>> = 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNumClass>();
      let method = cls.getStaticMethod('faInt2D');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_3900
     * @tc.name testStaticMethodGetParametersNum2_039
     * @tc.desc Verify getParametersNum() for EnumMethodNumClass.paramIntEnum: IntEnum = 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNumClass>();
      let method = cls.getStaticMethod('paramIntEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4000
     * @tc.name testStaticMethodGetParametersNum2_040
     * @tc.desc Verify getParametersNum() for EnumMethodNumClass.paramTwoEnums: IntEnum + StringEnum = 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNumClass>();
      let method = cls.getStaticMethod('paramTwoEnums');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4100
     * @tc.name testStaticMethodGetParametersNum2_041
     * @tc.desc Verify getParametersNum() for EnumMethodNumClass.returnIntEnum: no params = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNumClass>();
      let method = cls.getStaticMethod('returnIntEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4200
     * @tc.name testStaticMethodGetParametersNum2_042
     * @tc.desc Verify getParametersNum() for NamedMethodNumClass.specialGet: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodNumClass>();
      let method = cls.getStaticMethod('specialGet');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4300
     * @tc.name testStaticMethodGetParametersNum2_043
     * @tc.desc Verify getParametersNum() for NamedMethodNumClass.specialSet: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodNumClass>();
      let method = cls.getStaticMethod('specialSet');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4400
     * @tc.name testStaticMethodGetParametersNum2_044
     * @tc.desc Verify getParametersNum() for NamedMethodNumClass.specialInvoke: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodNumClass>();
      let method = cls.getStaticMethod('specialInvoke');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4500
     * @tc.name testStaticMethodGetParametersNum2_045
     * @tc.desc Verify getParametersNum() for InterfaceImplNumClass.classOnlyMethod: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplNumClass>();
      let method = cls.getStaticMethod('classOnlyMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4600
     * @tc.name testStaticMethodGetParametersNum2_046
     * @tc.desc Verify getParametersNum() for GenericClassNumClass<string>.methodString: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassNumClass<string>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4700
     * @tc.name testStaticMethodGetParametersNum2_047
     * @tc.desc Verify getParametersNum() for GenericClassNumClass<int>.methodIntBool: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassNumClass<int>>();
      let method = cls.getStaticMethod('methodIntBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4800
     * @tc.name testStaticMethodGetParametersNum2_048
     * @tc.desc Verify getParametersNum() for GenericClassNumClass<boolean>.methodMultiParams: 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassNumClass<boolean>>();
      let method = cls.getStaticMethod('methodMultiParams');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_4900
     * @tc.name testStaticMethodGetParametersNum2_049
     * @tc.desc Verify getParametersNum() equals getParameterTypes().length for MixedNumericNumClass.mixed2: 3 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedNumericNumClass>();
      let method = cls.getStaticMethod('mixed2');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5000
     * @tc.name testStaticMethodGetParametersNum2_050
     * @tc.desc Verify getParametersNum() equals getParameterTypes().length for EnumMethodNumClass.paramTwoEnums: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNumClass>();
      let method = cls.getStaticMethod('paramTwoEnums');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5100
     * @tc.name testStaticMethodGetParametersNum2_051
     * @tc.desc Verify getParametersNum() from getStaticMethods matches direct access for NamedMethodNumClass.specialGet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodNumClass>();
      let ref = cls.getStaticMethod('specialGet');
      expect(ref !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'specialGet') {
          expect(ref!.getParametersNum()).assertEqual(methods[i].getParametersNum());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5200
     * @tc.name testStaticMethodGetParametersNum2_052
     * @tc.desc Verify getParametersNum() for InterfaceImplNumClass.classOnlyMethod via multiple Class.from instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<InterfaceImplNumClass>();
      let cls2 = Class.from<InterfaceImplNumClass>();
      let method1 = cls1.getStaticMethod('classOnlyMethod');
      let method2 = cls2.getStaticMethod('classOnlyMethod');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getParametersNum()).assertEqual(method2!.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5300
     * @tc.name testStaticMethodGetParametersNum2_053
     * @tc.desc Verify getParametersNum() for ResizableArrayNumClass.processArray: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableArrayNumClass>();
      let method = cls.getStaticMethod('processArray');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5400
     * @tc.name testStaticMethodGetParametersNum2_054
     * @tc.desc Verify getParametersNum() for ResizableReturnNumClass.getFlags: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ResizableReturnNumClass>();
      let method = cls.getStaticMethod('getFlags');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5500
     * @tc.name testStaticMethodGetParametersNum2_055
     * @tc.desc Verify getParametersNum() for MultiResizableNumClass.mergeArrays: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiResizableNumClass>();
      let method = cls.getStaticMethod('mergeArrays');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5600
     * @tc.name testStaticMethodGetParametersNum2_056
     * @tc.desc Verify getParametersNum() for MixedArrayNumClass.complexProcess: 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedArrayNumClass>();
      let method = cls.getStaticMethod('complexProcess');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5700
     * @tc.name testStaticMethodGetParametersNum2_057
     * @tc.desc Verify getParametersNum() for SiblingANum.shared: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SiblingANum>();
      let m1 = cls.getStaticMethod('shared');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5800
     * @tc.name testStaticMethodGetParametersNum2_058
     * @tc.desc Verify getParametersNum() for OverloadReturnNumClass overloads: computeNoArg=0, computeOneArg=1, computeTwoArgs=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadReturnNumClass>();
      let m1 = cls.getStaticMethod('computeNoArg');
      let m2 = cls.getStaticMethod('computeOneArg');
      let m3 = cls.getStaticMethod('computeTwoArgs');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(0);
      expect(m2!.getParametersNum()).assertEqual(1);
      expect(m3!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_5900
     * @tc.name testStaticMethodGetParametersNum2_059
     * @tc.desc Verify getParametersNum() for MixedOverloadNumClass overloads: processInt=1, processString=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedOverloadNumClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1!.getParametersNum()).assertEqual(1);
      expect(m2!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6000
     * @tc.name testStaticMethodGetParametersNum2_060
     * @tc.desc Verify getParametersNum() for ArrayOverloadNumClass overloads: processInt=1, processString=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayOverloadNumClass>();
      let m1 = cls.getStaticMethod('processInt');
      let m2 = cls.getStaticMethod('processString');
      expect(m1!.getParametersNum()).assertEqual(1);
      expect(m2!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6100
     * @tc.name testStaticMethodGetParametersNum2_061
     * @tc.desc Verify getParametersNum() for NestedFixedArrayNumClass.processMatrix: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NestedFixedArrayNumClass>();
      let method = cls.getStaticMethod('processMatrix');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6200
     * @tc.name testStaticMethodGetParametersNum2_062
     * @tc.desc Verify getParametersNum() for TripleNestedNumClass.process3D: 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleNestedNumClass>();
      let method = cls.getStaticMethod('process3D');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6300
     * @tc.name testStaticMethodGetParametersNum2_063
     * @tc.desc Verify getParametersNum() via getStaticMethods() on EmptyBodyNumClass: 1 method, 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyBodyNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6400
     * @tc.name testStaticMethodGetParametersNum2_064
     * @tc.desc Verify getParametersNum() via getStaticMethods() on MultiEmptyBodyNumClass: 3 methods, all 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiEmptyBodyNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getParametersNum()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6500
     * @tc.name testStaticMethodGetParametersNum2_065
     * @tc.desc Verify getParametersNum() for SpecialNameNumClass: specialGet=1, specialSet=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NamedMethodNumClass>();
      let m1 = cls.getStaticMethod('specialGet');
      let m2 = cls.getStaticMethod('specialSet');
      expect(m1!.getParametersNum()).assertEqual(1);
      expect(m2!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6600
     * @tc.name testStaticMethodGetParametersNum2_066
     * @tc.desc Verify getParametersNum() for FinalMethodNumClass2: methodA=0, methodB=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodNumClass2>();
      let m1 = cls.getStaticMethod('methodA');
      let m2 = cls.getStaticMethod('methodB');
      expect(m1!.getParametersNum()).assertEqual(0);
      expect(m2!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6700
     * @tc.name testStaticMethodGetParametersNum2_067
     * @tc.desc Verify getParametersNum() for ConflictChildNumClass.run: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictChildNumClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6800
     * @tc.name testStaticMethodGetParametersNum2_068
     * @tc.desc Verify getParametersNum on HeavyOverloadNumClass 3-param version returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNumClass>();
      let method = cls.getStaticMethod('processIntStrBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_6900
     * @tc.name testStaticMethodGetParametersNum2_069
     * @tc.desc Verify getParametersNum returns consistent results across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamsNumClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      let num1: int = method!.getParametersNum();
      let num2: int = method!.getParametersNum();
      expect(num1).assertEqual(num2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7000
     * @tc.name testStaticMethodGetParametersNum2_070
     * @tc.desc [getParametersNum] Verify getStaticMethod('processInt') returns method with 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNumClass>();
      let method = cls.getStaticMethod('processInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7100
     * @tc.name testStaticMethodGetParametersNum2_071
     * @tc.desc [getParametersNum] Verify getStaticMethod('processStringInt') returns method with 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNumClass>();
      let method = cls.getStaticMethod('processStringInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7200
     * @tc.name testStaticMethodGetParametersNum2_072
     * @tc.desc [getParametersNum] Verify getStaticMethods on single-method class returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7300
     * @tc.name testStaticMethodGetParametersNum2_073
     * @tc.desc Verify getStaticMethods on dual-method class returns length 2 with same param count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getParametersNum()).assertEqual(methods[1].getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7400
     * @tc.name testStaticMethodGetParametersNum2_074
     * @tc.desc [getParametersNum] Verify getStaticMethods returns 3 methods with param counts 3, 2, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamsNumClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let foundThree: boolean = false;
      let foundTwo: boolean = false;
      let foundOne: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let num: int = methods[i].getParametersNum();
        if (num === 3) { foundThree = true; }
        if (num === 2) { foundTwo = true; }
        if (num === 1) { foundOne = true; }
      }
      expect(foundThree).assertTrue();
      expect(foundTwo).assertTrue();
      expect(foundOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_TWO_7500
     * @tc.name testStaticMethodGetParametersNum2_075
     * @tc.desc Verify getParametersNum() for ConflictBaseNumClass.run: 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConflictBaseNumClass>();
      let method = cls.getStaticMethod('run');
      expect(method !== undefined).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

  });
}
