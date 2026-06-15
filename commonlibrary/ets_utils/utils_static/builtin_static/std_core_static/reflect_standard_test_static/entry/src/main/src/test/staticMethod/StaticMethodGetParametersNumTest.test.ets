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

class GetNumClass {
  public static getNum(): string { return "b"; }
}

class ReadCountClass {
  public static readCount(x: int, y: string): int { return x; }
}

class ZeroParamClass {
  public static noParam(): string { return 'none'; }
}

class OneParamNumClass {
  public static singleParam(value: int): string { return value.toString(); }
}

class MultiTypeNumClass {
  public static multiTypes(a: int, b: string, c: boolean, d: float): boolean { return true; }
}

class OptionalNumClass {
  public static optionalParam(required: int, optional?: string): string { return optional ?? ''; }
}

class VarArgsNumClass {
  public static varArgs(required: int, ...args: string[]): int { return args.length; }
}

class GenericNumClass {
  public static genericParam(map: Map<string, int>, arr: Array<boolean>): int { return map.size; }
}

class SetterNumClass {
  private static _attr: string = '';
  public static set attr(value: string) {
    SetterNumClass._attr = value;
  }
}

class GetterNumClass {
  private static _tag: string = '';
  public static get tag(): string {
    return GetterNumClass._tag;
  }
}

class VerifyCountClass {
  public static verifyCount(a: int, b: string): boolean { return false; }
}

class SingleIntNumClass {
  public static oneParam(a: int): string { return a.toString(); }
}

class ZeroParamNumClass {
  public static zeroParam(): int { return 0; }
}

class ManyParamsNumClass {
  public static manyParams(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ): int { return p1; }
}

class AllPrimitiveNumClass {
  public static allPrimitives(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ): string { return 'done'; }
}

class SingleCheckNumClass {
  public static singleInt(a: int): boolean { return a > 0; }
}

class AsyncFetchNumClass {
  public static async fetchData(url: string, timeout: int): Promise<boolean> {
    return true;
  }
}

abstract class AbstractClass019 {
  public static abstractMethod(a: string, b: int): boolean { return true; }
}

final class FinalClass019 {
  public static finalMethod(x: boolean, y: float, z: double): string { return x.toString(); }
}

class GetterSetterNumClass {
  private static _x: string = '';
  private static _y: int = 0;
  public static get x(): string { return GetterSetterNumClass._x; }
  public static set x(value: string) { GetterSetterNumClass._x = value; }
  public static get y(): int { return GetterSetterNumClass._y; }
  public static set y(value: int) { GetterSetterNumClass._y = value; }
}

class MultiMethodNumClass {
  public static m0(): string { return 'zero'; }
  public static m1(a: int): boolean { return a > 0; }
  public static m2(a: int, b: string): float { return 1.0; }
  public static m3(a: int, b: string, c: boolean): int { return a; }
}

class ThreeParamsNumClass {
  public static threeParams(a: int, b: string, c: boolean): string { return b; }
}

export default function StaticMethodGetParametersNumTest(): void {
  describe('StaticMethodGetParametersNumTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0100
     * @tc.name testStaticMethodGetParametersNum001
     * @tc.desc Verify getParametersNum() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetNumClass>();
      let method = cls.getStaticMethod('getNum');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0200
     * @tc.name testStaticMethodGetParametersNum002
     * @tc.desc Verify getParametersNum() returns correct count for method with multiple parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ReadCountClass>();
      let method = cls.getStaticMethod('readCount');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0300
     * @tc.name testStaticMethodGetParametersNum003
     * @tc.desc Verify getParametersNum() returns 0 for method without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ZeroParamClass>();
      let method = cls.getStaticMethod('noParam');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0400
     * @tc.name testStaticMethodGetParametersNum004
     * @tc.desc Verify getParametersNum() returns 1 for method with single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OneParamNumClass>();
      let method = cls.getStaticMethod('singleParam');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0500
     * @tc.name testStaticMethodGetParametersNum005
     * @tc.desc Verify getParametersNum() for method with multiple different parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiTypeNumClass>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0600
     * @tc.name testStaticMethodGetParametersNum006
     * @tc.desc Verify getParametersNum() for method with optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OptionalNumClass>();
      let method = cls.getStaticMethod('optionalParam');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0700
     * @tc.name testStaticMethodGetParametersNum007
     * @tc.desc Verify getParametersNum() for method with variadic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VarArgsNumClass>();
      let method = cls.getStaticMethod('varArgs');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0800
     * @tc.name testStaticMethodGetParametersNum008
     * @tc.desc Verify getParametersNum() for method with generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericNumClass>();
      let method = cls.getStaticMethod('genericParam');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_0900
     * @tc.name testStaticMethodGetParametersNum009
     * @tc.desc Verify getParametersNum() returns 1 for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetterNumClass>();
      let setter = cls.getStaticMethod('%%set-attr');
      expect(setter !== undefined).assertTrue();
      let num: int = setter!.getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1000
     * @tc.name testStaticMethodGetParametersNum010
     * @tc.desc Verify getParametersNum() returns 0 for getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterNumClass>();
      let getter = cls.getStaticMethod('%%get-tag');
      expect(getter !== undefined).assertTrue();
      let num: int = getter!.getParametersNum();
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1100
     * @tc.name testStaticMethodGetParametersNum011
     * @tc.desc Verify getParametersNum() return type is number and integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<VerifyCountClass>();
      let method = cls.getStaticMethod('verifyCount');
      expect(method !== undefined).assertTrue();
      let num = method!.getParametersNum();
      let numType = Class.of(num).getName();
      expect(numType).assertEqual('std.core.Int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1200
     * @tc.name testStaticMethodGetParametersNum012
     * @tc.desc Verify getParametersNum() return value is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleIntNumClass>();
      let method = cls.getStaticMethod('oneParam');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1300
     * @tc.name testStaticMethodGetParametersNum013
     * @tc.desc Verify getParametersNum() for method with many parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyParamsNumClass>();
      let method = cls.getStaticMethod('manyParams');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1400
     * @tc.name testStaticMethodGetParametersNum014
     * @tc.desc Verify getParametersNum() for method with all primitive type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPrimitiveNumClass>();
      let method = cls.getStaticMethod('allPrimitives');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1500
     * @tc.name testStaticMethodGetParametersNum015
     * @tc.desc Verify getParametersNum() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleCheckNumClass>();
      let method = cls.getStaticMethod('singleInt');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1600
     * @tc.name testStaticMethodGetParametersNum016
     * @tc.desc Verify getParametersNum() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncFetchNumClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1700
     * @tc.name testStaticMethodGetParametersNum017
     * @tc.desc Verify getParametersNum() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass019>();
      let clsFin = Class.from<FinalClass019>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(2);
      expect(m2!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1800
     * @tc.name testStaticMethodGetParametersNum018
     * @tc.desc Verify getParametersNum() for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterSetterNumClass>();
      let getter1 = cls.getStaticMethod('%%get-x');
      let setter1 = cls.getStaticMethod('%%set-x');
      let getter2 = cls.getStaticMethod('%%get-y');
      let setter2 = cls.getStaticMethod('%%set-y');
      expect(getter1 !== undefined).assertTrue();
      expect(setter1 !== undefined).assertTrue();
      expect(getter2 !== undefined).assertTrue();
      expect(setter2 !== undefined).assertTrue();
      expect(getter1!.getParametersNum()).assertEqual(0);
      expect(setter1!.getParametersNum()).assertEqual(1);
      expect(getter2!.getParametersNum()).assertEqual(0);
      expect(setter2!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_1900
     * @tc.name testStaticMethodGetParametersNum019
     * @tc.desc Verify getParametersNum() for multiple static methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodNumClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let expectedLengths: FixedArray<int> = [0, 1, 2, 3];
      for (let i: int = 0; i < methods.length; i++) {
        let num: int = methods[i].getParametersNum();
        expect(num).assertEqual(expectedLengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETERS_NUM_2000
     * @tc.name testStaticMethodGetParametersNum020
     * @tc.desc Verify getParametersNum() is consistent with getParameterTypes().length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ThreeParamsNumClass>();
      let method = cls.getStaticMethod('threeParams');
      expect(method !== undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(paramTypes.length);
    });
  });
}
