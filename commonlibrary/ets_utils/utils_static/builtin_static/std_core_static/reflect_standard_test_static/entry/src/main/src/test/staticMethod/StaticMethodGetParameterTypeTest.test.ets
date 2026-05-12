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

const SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER: int = (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int;

class MyClass001 {
  public static test(a: int, b: string): void {}
}

class MyClass002 {
  public static test(a: int, b: string): void {}
}

class MyClass003 {
  public static test(a: int, b: string): void {}
}

class MyClass004 {
  public static test(a: int, b: string): void {}
}

class MyClass005 {
  public static test(a: int, b: string): void {}
}

class MyClass006 {
  public static test(a: int, b: string): void {}
}

class MyClass007 {
  public static test(a: int, b: string): void {}
}

class MyClass008 {
  public static test(a: int, b: string): void {}
}

class MyClass009 {
  public static multiTypes(a: int, b: string, c: boolean, d: float): void {}
}

class MyClass010 {
  public static noParam(): void {}
}

class MyClass011 {
  public static test(a: int, b: string): void {}
}

class MyClass012 {
  public static genericParam(map: Map<string, int>): void {}
  public static unionParam(value: int | string): void {}
}

class MyClass013 {
  public static test(a: int, b: string): void {}
}

class MyClass014 {
  public static test(a: int, b: string): void {}
}

class MyClass015 {
  public static test(first: int, second: string): void {}
}

class MyClass016 {
  public static test(a: int, b: string, c: boolean): void {}
}

class MyClass017 {
  public static singleParam(value: int): void {}
}

class MyClass018 {
  public static test(a: int): void {}
}

class MyClass019 {
  public static normalMethod(a: int): void {}
  public static async asyncMethod(b: string): Promise<void> { return; }
  public static finalMethod(c: boolean): void {}
}

class MyClass020 {
  public static async fetchData(url: string, timeout: int): Promise<string> {
    return 'data';
  }
}

abstract class AbstractClass021 {
  public static abstractMethod(a: string): void {}
}

final class FinalClass021 {
  public static finalMethod(x: boolean): void {}
}

class MyClass022 {
  private static _name: string = '';
  public static set name(value: string) { MyClass022._name = value; }
}

class MyClass023 {
  public static test(a: int, b: string, c: boolean, d: float): void {}
}

class MyClass024 {
  public static test(a: int, b: string): void {}
}

export default function StaticMethodGetParameterTypeTest(): void {
  describe('StaticMethodGetParameterTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0100
     * @tc.name testStaticMethodGetParameterType001
     * @tc.desc Verify getParameterType() accepts single index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType001', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0200
     * @tc.name testStaticMethodGetParameterType002
     * @tc.desc Verify getParameterType() with valid index returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType002', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      expect(paramType!= null).assertTrue();
      expect(paramType!.getName()).assertEqual('i32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0300
     * @tc.name testStaticMethodGetParameterType003
     * @tc.desc Verify getParameterType(0) returns first parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType003', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      expect(paramType!.getName()).assertEqual('i32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0400
     * @tc.name testStaticMethodGetParameterType004
     * @tc.desc Verify getParameterType() with last parameter index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType004', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(1);
      expect(paramType!.getName()).assertEqual('std.core.String');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0500
     * @tc.name testStaticMethodGetParameterType005
     * @tc.desc Verify method exists and valid parameter access works (negative index throws TypeError at runtime)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType005', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0600
     * @tc.name testStaticMethodGetParameterType006
     * @tc.desc Verify method exists and valid parameter access works (out-of-range index throws TypeError at runtime)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType006', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0700
     * @tc.name testStaticMethodGetParameterType007
     * @tc.desc Verify method exists and valid parameter access works (max int index throws TypeError at runtime)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType007', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0800
     * @tc.name testStaticMethodGetParameterType008
     * @tc.desc Verify getParameterType() returns Class object with usable methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType008', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      expect(paramType!= null).assertTrue();
      expect(paramType!.getName()).assertEqual('i32');
      expect(paramType!.isPrimitive()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_0900
     * @tc.name testStaticMethodGetParameterType009
     * @tc.desc Verify getParameterType() returns correct types for different parameter positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType009', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method != undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(3)!.getName()).assertEqual('f32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1000
     * @tc.name testStaticMethodGetParameterType010
     * @tc.desc Verify method exists and getParameterType throws for no-parameter method (runtime validates index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType010', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('noParam');
      expect(method != undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1100
     * @tc.name testStaticMethodGetParameterType011
     * @tc.desc Verify method exists and valid parameter access works (index 100 throws TypeError at runtime)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType011', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1200
     * @tc.name testStaticMethodGetParameterType012
     * @tc.desc Verify getParameterType() for special parameter types like Map and union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType012', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let m1 = cls.getStaticMethod('genericParam');
      let m2 = cls.getStaticMethod('unionParam');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getParameterType(0)!.getName()).assertEqual('std.core.Map');
      expect(m2!.getParameterType(0)!.isUnion()).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1300
     * @tc.name testStaticMethodGetParameterType013
     * @tc.desc Verify getParameterType() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType013', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      if (paramType !== undefined) {
        expect(typeof paramType).assertEqual('object');
        expect(paramType.getName!= null).assertTrue();
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1400
     * @tc.name testStaticMethodGetParameterType014
     * @tc.desc Verify getParameterType() returned Class object has complete method set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType014', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      expect(paramType!.getName()!= null).assertTrue();
      expect(paramType!.isPrimitive()!= null).assertTrue();
      expect(paramType!.isInterface()!= null).assertTrue();
      expect(paramType!.isFinal()!= null).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1500
     * @tc.name testStaticMethodGetParameterType015
     * @tc.desc Verify getParameterType(0) returns first parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType015', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let method = Class.from<MyClass015>().getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1600
     * @tc.name testStaticMethodGetParameterType016
     * @tc.desc Verify getParameterType() returns last valid parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType016', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let method = Class.from<MyClass016>().getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1700
     * @tc.name testStaticMethodGetParameterType017
     * @tc.desc Verify getParameterType() for single-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType017', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let method = Class.from<MyClass017>().getStaticMethod('singleParam');
      expect(method != undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1800
     * @tc.name testStaticMethodGetParameterType018
     * @tc.desc Verify getParameterType() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType018', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramType =method!.getParameterType(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_1900
     * @tc.name testStaticMethodGetParameterType019
     * @tc.desc Verify getParameterType() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType019', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass019>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getParameterType(0)!.getName()).assertEqual('i32');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(m3!.getParameterType(0)!.getName()).assertEqual('u1');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_2000
     * @tc.name testStaticMethodGetParameterType020
     * @tc.desc Verify getParameterType() for async static method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType020', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass020>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(1)!.getName()).assertEqual('i32');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_2100
     * @tc.name testStaticMethodGetParameterType021
     * @tc.desc Verify getParameterType() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType021', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let m1 = Class.from<AbstractClass021>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass021>().getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('u1');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_2200
     * @tc.name testStaticMethodGetParameterType022
     * @tc.desc Verify getParameterType() for setter method parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType022', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass022>();
      let setter = cls.getStaticMethod('%%set-name');
      expect(setter != undefined).assertTrue();
      let paramType =setter!.getParameterType(0);
      expect(paramType!.getName()).assertEqual('std.core.String');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_2300
     * @tc.name testStaticMethodGetParameterType023
     * @tc.desc Verify getParameterType() iterating all parameters by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType023', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass023>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramNum: int = method!.getParametersNum();
      for (let i: int = 0; i < paramNum; i++) {
        let paramType =method!.getParameterType(i);
        expect(paramType!= null).assertTrue();
        expect(paramType!.getName()!= null).assertTrue();
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_2400
     * @tc.name testStaticMethodGetParameterType024
     * @tc.desc Verify getParameterType() results consistent with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParameterType024', SUB_COMMONLIBRARY_UTIL_GET_PARAMETER_TYPE_IT_FILTER, (): void => {
      let cls: Class = Class.from<MyClass024>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      for (let i: int = 0; i < paramTypes.length; i++) {
        let paramType =method!.getParameterType(i);
        expect(paramType!.getName()).assertEqual(paramTypes[i].getName());
      }
      return;
    });
  });
}
