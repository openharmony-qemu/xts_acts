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

class MyClass001 {
  public static test(a: int, b: string): void {}
}

class MyClass002 {
  public static test(a: int, b: string): void {}
}

class MyClass003 {
  public static noParam(): void {}
}

class MyClass004 {
  public static singleParam(value: int): void {}
}

class MyClass005 {
  public static multiTypes(a: int, b: string, c: boolean, d: float): void {}
}

class MyClass006 {
  public static optionalParam(required: int, optional?: string): void {}
}

class MyClass007 {
  public static varArgs(required: int, ...args: string[]): void {}
}

class MyClass008 {
  public static genericParam(map: Map<string, int>, arr: Array<boolean>): void {}
}

class MyClass009 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass009._name = value;
  }
}

class MyClass010 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass010._name;
  }
}

class MyClass011 {
  public static test(a: int, b: string): void {}
}

class MyClass012 {
  public static test(a: int): void {}
}

class MyClass013 {
  public static noParam(): void {}
}

class MyClass014 {
  public static manyParams(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ): void {}
}

class MyClass015 {
  public static allPrimitives(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ): void {}
}

class MyClass016 {
  public static test(a: int): void {}
}

class MyClass017 {
  public static normalMethod(a: int): void {}
  public static async asyncMethod(b: string): Promise<void> { return; }
  public static finalMethod(c: boolean): void {}
}

class MyClass018 {
  public static async fetchData(url: string, timeout: int): Promise<string> {
    return 'data';
  }
}

abstract class AbstractClass019 {
  public static abstractMethod(a: string, b: int): void {}
}

final class FinalClass019 {
  public static finalMethod(x: boolean, y: float, z: double): void {}
}

class MyClass020 {
  private static _name: string = '';
  private static _age: int = 0;
  public static get name(): string { return MyClass020._name; }
  public static set name(value: string) { MyClass020._name = value; }
  public static get age(): int { return MyClass020._age; }
  public static set age(value: int) { MyClass020._age = value; }
}

class MyClass021 {
  public static m0(): void {}
  public static m1(a: int): void {}
  public static m2(a: int, b: string): void {}
  public static m3(a: int, b: string, c: boolean): void {}
}

class MyClass022 {
  public static test(a: int, b: string, c: boolean): void {}
}

export default function StaticMethodGetParametersNumTest(): void {
  describe('StaticMethodGetParametersNumTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0100
     * @tc.name testStaticMethodGetParametersNum001
     * @tc.desc Verify getParametersNum() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0200
     * @tc.name testStaticMethodGetParametersNum002
     * @tc.desc Verify getParametersNum() returns correct count for method with multiple parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
      expect(typeof num).assertEqual('int');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0300
     * @tc.name testStaticMethodGetParametersNum003
     * @tc.desc Verify getParametersNum() returns 0 for method without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('noParam');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0400
     * @tc.name testStaticMethodGetParametersNum004
     * @tc.desc Verify getParametersNum() returns 1 for method with single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let method = cls.getStaticMethod('singleParam');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0500
     * @tc.name testStaticMethodGetParametersNum005
     * @tc.desc Verify getParametersNum() for method with multiple different parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let method = cls.getStaticMethod('multiTypes');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(4);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0600
     * @tc.name testStaticMethodGetParametersNum006
     * @tc.desc Verify getParametersNum() for method with optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('optionalParam');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0700
     * @tc.name testStaticMethodGetParametersNum007
     * @tc.desc Verify getParametersNum() for method with variadic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('varArgs');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0800
     * @tc.name testStaticMethodGetParametersNum008
     * @tc.desc Verify getParametersNum() for method with generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('genericParam');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_0900
     * @tc.name testStaticMethodGetParametersNum009
     * @tc.desc Verify getParametersNum() returns 1 for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let setter = cls.getStaticMethod('%%set-name');
      expect(setter != undefined).assertTrue();
      let num: int = setter!.getParametersNum();
      expect(num).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1000
     * @tc.name testStaticMethodGetParametersNum010
     * @tc.desc Verify getParametersNum() returns 0 for getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let getter = cls.getStaticMethod('%%get-name');
      expect(getter != undefined).assertTrue();
      let num: int = getter!.getParametersNum();
      expect(num).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1100
     * @tc.name testStaticMethodGetParametersNum011
     * @tc.desc Verify getParametersNum() return type is number and integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(typeof num).assertEqual('int');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1200
     * @tc.name testStaticMethodGetParametersNum012
     * @tc.desc Verify getParametersNum() return value is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num >= 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1300
     * @tc.name testStaticMethodGetParametersNum013
     * @tc.desc Verify getParametersNum() returns 0 for no-parameter method as boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let num: int = Class.from<MyClass013>().getStaticMethod('noParam')!.getParametersNum();
      expect(num).assertEqual(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1400
     * @tc.name testStaticMethodGetParametersNum014
     * @tc.desc Verify getParametersNum() for method with many parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let method = cls.getStaticMethod('manyParams');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(10);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1500
     * @tc.name testStaticMethodGetParametersNum015
     * @tc.desc Verify getParametersNum() for method with all primitive type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let method = cls.getStaticMethod('allPrimitives');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(9);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1600
     * @tc.name testStaticMethodGetParametersNum016
     * @tc.desc Verify getParametersNum() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass016>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1700
     * @tc.name testStaticMethodGetParametersNum017
     * @tc.desc Verify getParametersNum() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass017>();
      let m1 = cls.getStaticMethod('normalMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(1);
      expect(m2!.getParametersNum()).assertEqual(1);
      expect(m3!.getParametersNum()).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1800
     * @tc.name testStaticMethodGetParametersNum018
     * @tc.desc Verify getParametersNum() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      expect(num).assertEqual(2);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_1900
     * @tc.name testStaticMethodGetParametersNum019
     * @tc.desc Verify getParametersNum() for abstract and final class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass019>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass019>().getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.getParametersNum()).assertEqual(2);
      expect(m2!.getParametersNum()).assertEqual(3);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_2000
     * @tc.name testStaticMethodGetParametersNum020
     * @tc.desc Verify getParametersNum() for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass020>();
      let getter1 = cls.getStaticMethod('%%get-name');
      let setter1 = cls.getStaticMethod('%%set-name');
      let getter2 = cls.getStaticMethod('%%get-age');
      let setter2 = cls.getStaticMethod('%%set-age');
      expect(getter1 != undefined).assertTrue();
      expect(setter1 != undefined).assertTrue();
      expect(getter2 != undefined).assertTrue();
      expect(setter2 != undefined).assertTrue();
      expect(getter1!.getParametersNum()).assertEqual(0);
      expect(setter1!.getParametersNum()).assertEqual(1);
      expect(getter2!.getParametersNum()).assertEqual(0);
      expect(setter2!.getParametersNum()).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_2100
     * @tc.name testStaticMethodGetParametersNum021
     * @tc.desc Verify getParametersNum() for multiple static methods in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass021>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let expectedLengths: FixedArray<int> = [0, 1, 2, 3];
      for (let i: int = 0; i < methods.length; i++) {
        let num: int = methods[i].getParametersNum();
        expect(num).assertEqual(expectedLengths[i]);
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_PARAMETERS_NUM_2200
     * @tc.name testStaticMethodGetParametersNum022
     * @tc.desc Verify getParametersNum() is consistent with getParameterTypes().length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetParametersNum022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass022>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let num: int = method!.getParametersNum();
      let paramTypes: FixedArray<Class> = method!.getParameterTypes();
      expect(num).assertEqual(paramTypes.length);
      return;
    });
  });
}
