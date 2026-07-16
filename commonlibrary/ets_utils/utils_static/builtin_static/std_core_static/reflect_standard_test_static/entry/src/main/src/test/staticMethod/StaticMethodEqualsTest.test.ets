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

class SingleTestClass001 {
  public static sayHello(name: string): string {
    return 'Hello ' + name;
  }
}

class TwoDistinctStaticClass002 {
  public static add(a: int, b: int): int {
    return a + b;
  }
  public static concat(x: string, y: string): string {
    return x + y;
  }
}

class CrossAClass003 {
  public static getVersion(): int {
    return 1;
  }
}

class CrossBClass003 {
  public static getVersion(): string {
    return 'v1.0';
  }
}

class OverloadParamClass004 {
  public static format(value: int): string {
    return value.toString();
  }
  public static format(value: boolean): int {
    return value ? 1 : 0;
  }
}

class OverloadArityClass005 {
  public static greet(): string {
    return 'Hello';
  }
  public static greet(name: string): int {
    return name.length;
  }
}

class DifferentReturnClass006 {
  public static fetchName(): string {
    return 'Alice';
  }

  public static fetchAge(): int {
    return 30;
  }
}

class SyncAsyncClass007 {
  public static computeSync(n: int): int {
    return n * 2;
  }
  public static async computeAsync(n: float): Promise<string> {
    return n.toString();
  }
}

abstract class AbstractTargetClass008 {
  public static getAbstractLabel(): string {
    return 'abstract';
  }
}

final class FinalTargetClass009 {
  public static getFinalId(): int {
    return 999;
  }
}

class GetterSetterClass010 {
  private static _fullName: string = '';
  public static get fullName(): string {
    return GetterSetterClass010._fullName;
  }
  public static set fullName(value: string) {
    GetterSetterClass010._fullName = value;
  }
}

class MultiMethodClass011 {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class UniqueClass012 {
  public static theOnly(): float {
    return Double.toFloat(3.14);
  }
}

class SetClassA013 {
  public static shared(): string { return 'A'; }
  public static extraA(): int { return 1; }
}

class SetClassB013 {
  public static shared(): string { return 'B'; }
  public static extraB(): boolean { return true; }
}

export default function StaticMethodEqualsTest(): void {
  describe('StaticMethodEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0100
     * @tc.name testStaticMethodEquals001
     * @tc.desc Verify equals method accepts one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleTestClass001>();
      let method1 = cls.getStaticMethod('sayHello');
      let method2 = cls.getStaticMethod('sayHello');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let result = method1!.equals(method2!);
      let resultType = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0200
     * @tc.name testStaticMethodEquals002
     * @tc.desc Verify same static method from same class returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleTestClass001>();
      let method1 = cls.getStaticMethod('sayHello');
      let method2 = cls.getStaticMethod('sayHello');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0300
     * @tc.name testStaticMethodEquals003
     * @tc.desc Verify different static methods return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoDistinctStaticClass002>();
      let m1 = cls.getStaticMethod('add');
      let m2 = cls.getStaticMethod('concat');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0400
     * @tc.name testStaticMethodEquals004
     * @tc.desc Verify static methods with same name from different classes return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<CrossAClass003>();
      let clsB = Class.from<CrossBClass003>();
      let m1 = clsA.getStaticMethod('getVersion');
      let m2 = clsB.getStaticMethod('getVersion');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0500
     * @tc.name testStaticMethodEquals005
     * @tc.desc Verify equals returns boolean type for standard return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DifferentReturnClass006>();
      let method1 = cls.getStaticMethod('fetchName');
      let method2 = cls.getStaticMethod('fetchName');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let result = method1!.equals(method2!);
      expect(result).assertTrue();
      let resultType = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0600
     * @tc.name testStaticMethodEquals006
     * @tc.desc Verify reflexivity - same object reference equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleTestClass001>();
      let method = cls.getStaticMethod('sayHello');
      expect(method !== undefined).assertTrue();
      expect(method!.equals(method!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0700
     * @tc.name testStaticMethodEquals007
     * @tc.desc Verify overloaded methods with different parameter types return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadParamClass004>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0800
     * @tc.name testStaticMethodEquals008
     * @tc.desc Verify overloaded methods with different parameter counts return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadArityClass005>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].equals(methods[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0900
     * @tc.name testStaticMethodEquals009
     * @tc.desc Verify methods with different return types return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DifferentReturnClass006>();
      let m1 = cls.getStaticMethod('fetchName');
      let m2 = cls.getStaticMethod('fetchAge');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1000
     * @tc.name testStaticMethodEquals010
     * @tc.desc Verify symmetry - x.equals(y) equals y.equals(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleTestClass001>();
      let m1 = cls.getStaticMethod('sayHello');
      let m2 = cls.getStaticMethod('sayHello');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let result1 = m1!.equals(m2!);
      let result2 = m2!.equals(m1!);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1100
     * @tc.name testStaticMethodEquals011
     * @tc.desc Verify transitivity - if x.equals(y) and y.equals(z) then x.equals(z)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleTestClass001>();
      let m1 = cls.getStaticMethod('sayHello');
      let m2 = cls.getStaticMethod('sayHello');
      let m3 = cls.getStaticMethod('sayHello');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let eq12 = m1!.equals(m2!);
      let eq23 = m2!.equals(m3!);
      if (eq12 && eq23) {
        let result = m1!.equals(m3!);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1200
     * @tc.name testStaticMethodEquals012
     * @tc.desc Verify consistency - multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalTargetClass009>();
      let m1 = cls.getStaticMethod('getFinalId');
      let m2 = cls.getStaticMethod('getFinalId');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      let result1 = m1!.equals(m2!);
      let result2 = m1!.equals(m2!);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1300
     * @tc.name testStaticMethodEquals013
     * @tc.desc Verify equals method does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalTargetClass009>();
      let method1 = cls.getStaticMethod('getFinalId');
      let method2 = cls.getStaticMethod('getFinalId');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      let result = method1!.equals(method2!);
      expect(result).assertTrue();
      let resultType = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1400
     * @tc.name testStaticMethodEquals014
     * @tc.desc Verify sync and async method comparison returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SyncAsyncClass007>();
      let syncMethod = cls.getStaticMethod('computeSync');
      let asyncMethod = cls.getStaticMethod('computeAsync');
      let bothDefined = syncMethod !== undefined && asyncMethod !== undefined;
      expect(bothDefined).assertTrue();
      let result = syncMethod!.equals(asyncMethod!);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1500
     * @tc.name testStaticMethodEquals015
     * @tc.desc Verify abstract class static method equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractTargetClass008>();
      let m1 = clsAbs.getStaticMethod('getAbstractLabel');
      let m2 = clsAbs.getStaticMethod('getAbstractLabel');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1600
     * @tc.name testStaticMethodEquals016
     * @tc.desc Verify final class static method equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFin = Class.from<FinalTargetClass009>();
      let m1 = clsFin.getStaticMethod('getFinalId');
      let m2 = clsFin.getStaticMethod('getFinalId');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1700
     * @tc.name testStaticMethodEquals017
     * @tc.desc Verify getter/setter method equals comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetterSetterClass010>();
      let getter1 = cls.getStaticMethod('%%get-fullName');
      let getter2 = cls.getStaticMethod('%%get-fullName');
      let setter = cls.getStaticMethod('%%set-fullName');
      let allDefined = getter1 !== undefined && getter2 !== undefined && setter !== undefined;
      expect(allDefined).assertTrue();
      expect(getter1!.equals(getter2!)).assertTrue();
      expect(getter1!.equals(setter!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1800
     * @tc.name testStaticMethodEquals018
     * @tc.desc Verify method list comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MultiMethodClass011>();
      let cls2 = Class.from<MultiMethodClass011>();
      let methods1 = cls1.getStaticMethods();
      let methods2 = cls2.getStaticMethods();
      expect(methods1.length).assertEqual(methods2.length);
      for (let i: int = 0; i < methods1.length; i++) {
        let result = methods1[i].equals(methods2[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1900
     * @tc.name testStaticMethodEquals019
     * @tc.desc Verify deduplication using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UniqueClass012>();
      let method1 = cls.getStaticMethod('theOnly');
      let method2 = cls.getStaticMethod('theOnly');
      let method3 = cls.getStaticMethod('theOnly');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method3 !== undefined).assertTrue();
      let dupCount: int = 0;
      if (!method2!.equals(method1!)) {
        dupCount++;
      }
      if (!method3!.equals(method1!)) {
        dupCount++;
      }
      expect(dupCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2000
     * @tc.name testStaticMethodEquals020
     * @tc.desc Verify set operations (intersection) using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<SetClassA013>();
      let clsB = Class.from<SetClassB013>();
      let methodsA = clsA.getStaticMethods();
      let methodsB = clsB.getStaticMethods();
      let hit: int = 0;
      for (let i: int = 0; i < methodsA.length; i++) {
        for (let j: int = 0; j < methodsB.length; j++) {
          if (methodsA[i].equals(methodsB[j])) {
            hit++;
            break;
          }
        }
      }
      expect(hit).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2100
     * @tc.name testStaticMethodEquals021
     * @tc.desc Verify equals with methods having different parameter counts returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<OverloadArityClass005>();
      let clsB = Class.from<SingleTestClass001>();
      let mGreet = clsA.getStaticMethod('greet', []);
      let mHello = clsB.getStaticMethod('sayHello');
      expect(mGreet !== undefined).assertTrue();
      expect(mHello !== undefined).assertTrue();
      let result = mGreet!.equals(mHello!);
      let resultType = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.Boolean');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2200
     * @tc.name testStaticMethodEquals022
     * @tc.desc Verify cross-class equals symmetry with different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<CrossAClass003>();
      let clsB = Class.from<CrossBClass003>();
      let mA = clsA.getStaticMethod('getVersion');
      let mB = clsB.getStaticMethod('getVersion');
      expect(mA !== undefined).assertTrue();
      expect(mB !== undefined).assertTrue();
      let resultAB = mA!.equals(mB!);
      let resultBA = mB!.equals(mA!);
      expect(resultAB).assertEqual(resultBA);
      expect(resultAB).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2300
     * @tc.name testStaticMethodEquals023
     * @tc.desc Verify equals consistency across repeated getStaticMethod lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodClass011>();
      let methodBase = cls.getStaticMethod('alpha');
      expect(methodBase !== undefined).assertTrue();
      for (let i: int = 0; i < 10; i++) {
        let methodNext = cls.getStaticMethod('alpha');
        let eq = methodBase!.equals(methodNext!);
        expect(eq).assertTrue();
      }
    });

  });
}
