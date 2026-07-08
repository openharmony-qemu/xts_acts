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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class FirstParamClass {
  public static getFirst(a: int, b: string): int { return a; }
}

class SecondParamClass {
  public static getSecond(x: float, y: string): string { return y; }
}

class IndexZeroClass {
  public static readZero(p: int, q: string): boolean { return true; }
}

class IndexOneClass {
  public static readOne(a: int, b: string): float { return 1.0; }
}

class NegIdxClass {
  public static atIndex0(m: int, n: string): int { return m; }
}

class OutOfRangeClass {
  public static fetchZero(x: int, s: string): string { return s; }
}

class MaxIntIdxClass {
  public static atMaxIndex(a: int, b: string): boolean { return false; }
}

class UsableParamClass {
  public static typeAtZero(u: int, v: string): int { return u; }
}

class MultiTypeParamClass {
  public static multiTypes(a: int, b: string, c: boolean, d: float): int { return a; }
}

class NoParamTypeClass {
  public static noParam(): string { return ''; }
}

class LargeIdxClass {
  public static readAtLarge(x: int, y: string): string { return y; }
}

class SpecialParamClass {
  public static genericParam(map: Map<string, int>): string { return 'map'; }
  public static unionParam(value: int | string): string { return value.toString(); }
}

class ObjMethodParamClass {
  public static checkParamZero(v: int, w: string): boolean { return true; }
}

class CompleteMethodParamClass {
  public static verifyParamZero(n: int, m: string): int { return n; }
}

class LastParamClass {
  public static lastParamType(first: int, second: string): boolean { return false; }
}

class ThirdParamClass {
  public static paramAtTwo(a: int, b: string, c: boolean): float { return 1.0; }
}

class SingleParamClass {
  public static singleParam(value: int): string { return value.toString(); }
}

class OneIntParamClass {
  public static oneParam(a: int): int { return a; }
}

class DiffModifierParamClass {
  public static normalMethod(a: int): string { return a.toString(); }
  public static async asyncMethod(b: string): Promise<int> { return b.length; }
  public static finalMethod(c: boolean): int { return c ? 1 : 0; }
}

class AsyncFetchParamClass {
  public static async fetchData(url: string, timeout: int): Promise<boolean> {
    return true;
  }
}

abstract class AbstractClass021 {
  public static abstractMethod(a: string): int { return a.length; }
}

final class FinalClass021 {
  public static finalMethod(x: boolean): string { return x.toString(); }
}

class SetterParamClass {
  private static _label: string = '';
  public static set label(value: string) { SetterParamClass._label = value; }
}

class FourParamClass {
  public static fourParams(a: int, b: string, c: boolean, d: float): boolean { return true; }
}

class ConsistencyParamClass {
  public static eachParamType(a: int, b: string): string { return b; }
}

export default function StaticMethodGetParameterTypeTest(): void {
  describe('StaticMethodGetParameterTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0100
     * @tc.name testStaticMethodGetParameterType001
     * @tc.desc Verify getParameterType() accepts single index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FirstParamClass>();
      let method = cls.getStaticMethod('getFirst');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0200
     * @tc.name testStaticMethodGetParameterType002
     * @tc.desc Verify getParameterType() with valid index returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SecondParamClass>();
      let method = cls.getStaticMethod('getSecond');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== null).assertTrue();
      let paramName = paramType!.getName();
      expect(paramName).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0300
     * @tc.name testStaticMethodGetParameterType003
     * @tc.desc Verify getParameterType(0) returns first parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<IndexZeroClass>();
      let method = cls.getStaticMethod('readZero');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0400
     * @tc.name testStaticMethodGetParameterType004
     * @tc.desc Verify getParameterType() with last parameter index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<IndexOneClass>();
      let method = cls.getStaticMethod('readOne');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(1);
      expect(paramType!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0500
     * @tc.name testStaticMethodGetParameterType005
     * @tc.desc Verify getParameterType() with negative index throws TypeError (negative index throws TypeError at runtime)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NegIdxClass>();
      let method = cls.getStaticMethod('atIndex0');
      expect(method !== undefined).assertTrue();
      try {
        method!.getParameterType(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0600
     * @tc.name testStaticMethodGetParameterType006
     * @tc.desc Verify getParameterType() with out-of-range index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OutOfRangeClass>();
      let method = cls.getStaticMethod('fetchZero');
      expect(method !== undefined).assertTrue();
      try {
        method!.getParameterType(10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0700
     * @tc.name testStaticMethodGetParameterType007
     * @tc.desc Verify getParameterType() with max int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MaxIntIdxClass>();
      let method = cls.getStaticMethod('atMaxIndex');
      expect(method !== undefined).assertTrue();
      try {
        method!.getParameterType(2147483647);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0800
     * @tc.name testStaticMethodGetParameterType008
     * @tc.desc Verify getParameterType() returns Class object with usable methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<UsableParamClass>();
      let method = cls.getStaticMethod('typeAtZero');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== null).assertTrue();
      expect(paramType!.getName()).assertEqual('i32');
      expect(paramType!.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_0900
     * @tc.name testStaticMethodGetParameterType009
     * @tc.desc Verify getParameterType() returns correct types for different parameter positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiTypeParamClass>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method !== undefined).assertTrue();
      let param0 = method!.getParameterType(0)!.getName();
      expect(param0).assertEqual('i32');
      let param1 = method!.getParameterType(1)!.getName();
      expect(param1).assertEqual('std.core.String');
      let param2 = method!.getParameterType(2)!.getName();
      expect(param2).assertEqual('u1');
      let param3 = method!.getParameterType(3)!.getName();
      expect(param3).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1000
     * @tc.name testStaticMethodGetParameterType010
     * @tc.desc Verify method exists and getParameterType throws for no-parameter method (runtime validates index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoParamTypeClass>();
      let method = cls.getStaticMethod('noParam');
      expect(method !== undefined).assertTrue();
      try {
        method!.getParameterType(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1100
     * @tc.name testStaticMethodGetParameterType011
     * @tc.desc Verify getParameterType(100) throws TypeError for out-of-range index on method with 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LargeIdxClass>();
      let method = cls.getStaticMethod('readAtLarge');
      expect(method !== undefined).assertTrue();
      try {
        method!.getParameterType(100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1200
     * @tc.name testStaticMethodGetParameterType012
     * @tc.desc Verify getParameterType() for special parameter types like Map and union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SpecialParamClass>();
      let m1 = cls.getStaticMethod('genericParam');
      let m2 = cls.getStaticMethod('unionParam');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let paramName = m1!.getParameterType(0)!.getName();
      expect(paramName).assertEqual('std.core.Map');
      let isUnion = m2!.getParameterType(0)!.isUnion();
      expect(isUnion).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1300
     * @tc.name testStaticMethodGetParameterType013
     * @tc.desc Verify getParameterType() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ObjMethodParamClass>();
      let method = cls.getStaticMethod('checkParamZero');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      if (paramType !== undefined) {
        let paramTypeName = Class.of(paramType).getName();
        expect(paramTypeName !== null).assertTrue();
        expect(paramType.getName !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1400
     * @tc.name testStaticMethodGetParameterType014
     * @tc.desc Verify getParameterType() returned Class object has complete method set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CompleteMethodParamClass>();
      let method = cls.getStaticMethod('verifyParamZero');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType!.getName() !== null).assertTrue();
      expect(paramType!.isPrimitive() !== null).assertTrue();
      expect(paramType!.isInterface() !== null).assertTrue();
      expect(paramType!.isFinal() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1500
     * @tc.name testStaticMethodGetParameterType015
     * @tc.desc Verify getParameterType() returns last valid parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<ThirdParamClass>();
      let method = cls016.getStaticMethod('paramAtTwo');
      expect(method !== undefined).assertTrue();
      let paramName = method!.getParameterType(2)!.getName();
      expect(paramName).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1600
     * @tc.name testStaticMethodGetParameterType016
     * @tc.desc Verify getParameterType() for single-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<SingleParamClass>();
      let method = cls017.getStaticMethod('singleParam');
      expect(method !== undefined).assertTrue();
      let paramName = method!.getParameterType(0)!.getName();
      expect(paramName).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1700
     * @tc.name testStaticMethodGetParameterType017
     * @tc.desc Verify getParameterType() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<OneIntParamClass>();
      let method = cls.getStaticMethod('oneParam');
      expect(method !== undefined).assertTrue();
      let paramType = method!.getParameterType(0);
      expect(paramType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1800
     * @tc.name testStaticMethodGetParameterType018
     * @tc.desc Verify getParameterType() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DiffModifierParamClass>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let param0 = m1!.getParameterType(0)!.getName();
      expect(param0).assertEqual('i32');
      let param1 = m2!.getParameterType(0)!.getName();
      expect(param1).assertEqual('std.core.String');
      let param2 = m3!.getParameterType(0)!.getName();
      expect(param2).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_1900
     * @tc.name testStaticMethodGetParameterType019
     * @tc.desc Verify getParameterType() for async static method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncFetchParamClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      let param0 = method!.getParameterType(0)!.getName();
      expect(param0).assertEqual('std.core.String');
      let param1 = method!.getParameterType(1)!.getName();
      expect(param1).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_2000
     * @tc.name testStaticMethodGetParameterType020
     * @tc.desc Verify getParameterType() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass021>();
      let clsFin = Class.from<FinalClass021>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let param0 = m1!.getParameterType(0)!.getName();
      expect(param0).assertEqual('std.core.String');
      let param1 = m2!.getParameterType(0)!.getName();
      expect(param1).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_2100
     * @tc.name testStaticMethodGetParameterType021
     * @tc.desc Verify getParameterType() for setter method parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetterParamClass>();
      let setter = cls.getStaticMethod('%%set-label');
      expect(setter !== undefined).assertTrue();
      let paramType = setter!.getParameterType(0);
      expect(paramType!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_2200
     * @tc.name testStaticMethodGetParameterType022
     * @tc.desc Verify getParameterType() iterating all parameters by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourParamClass>();
      let method = cls.getStaticMethod('fourParams');
      expect(method !== undefined).assertTrue();
      let paramNum: int = method!.getParametersNum();
      for (let i: int = 0; i < paramNum; i++) {
        let paramType = method!.getParameterType(i);
        expect(paramType !== null).assertTrue();
        expect(paramType!.getName() !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_PARAMETER_TYPE_2300
     * @tc.name testStaticMethodGetParameterType023
     * @tc.desc Verify getParameterType() results consistent with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ConsistencyParamClass>();
      let method = cls.getStaticMethod('eachParamType');
      expect(method !== undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      for (let i: int = 0; i < paramTypes.length; i++) {
        let paramType = method!.getParameterType(i);
        expect(paramType!.getName()).assertEqual(paramTypes[i].getName());
      }
    });
  });
}
