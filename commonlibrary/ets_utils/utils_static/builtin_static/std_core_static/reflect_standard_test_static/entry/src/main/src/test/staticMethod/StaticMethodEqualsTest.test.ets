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


// All test classes extracted here with numbered suffixes

class StaticMethodEqualsSingleTestClass001 {
  public static test(): void {}
}

class StaticMethodEqualsTwoDistinctStaticClass002 {
  public static method1(): void {}
  public static method2(): void {}
}

class StaticMethodEqualsCrossAClass003 {
  public static test(): void {}
}

class StaticMethodEqualsCrossBClass003 {
  public static test(): void {}
}

class StaticMethodEqualsOverloadParamClass004 {
  public static test(value: int): void {}
  public static test(value: string): void {}
}

class StaticMethodEqualsOverloadArityClass005 {
  public static test(): void {}
  public static test(value: int): void {}
}

class StaticMethodEqualsDifferentReturnClass006 {
  public static testReturnString(): string {
    return '';
  }
  public static testReturnInt(): number {
    return 0;
  }
}

class StaticMethodEqualsSyncAsyncClass007 {
  public static syncMethod(): void {}
  public static async asyncMethod(): Promise<void> {
    return;
  }
}

abstract class StaticMethodEqualsAbstractTargetClass008 {
  public static test(): void {}
}

final class StaticMethodEqualsFinalTargetClass009 {
  public static test(): void {}
}

class StaticMethodEqualsGetterSetterClass010 {
  private static _userName: string = '';
  public static get userName(): string {
    return StaticMethodEqualsGetterSetterClass010._userName;
  }
  public static set userName(value: string) {
    StaticMethodEqualsGetterSetterClass010._userName = value;
  }
}

class StaticMethodEqualsMultiMethodClass011 {
  public static method1(): void {}
  public static method2(): void {}
  public static method3(): void {}
}

class StaticMethodEqualsUniqueClass012 {
  public static test(): void {}
}

class StaticMethodEqualsSetClassA013 {
  public static commonMethod(): void {}
  public static methodA(): void {}
}

class StaticMethodEqualsSetClassB013 {
  public static commonMethod(): void {}
  public static methodB(): void {}
}

export default function StaticMethodEqualsTest(): void {
  describe('StaticMethodEqualsTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): void => {
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
    it('testStaticMethodEquals001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      let result = method1!.equals(method2!);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0200
     * @tc.name testStaticMethodEquals002
     * @tc.desc Verify same static method from same class returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
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
    it('testStaticMethodEquals003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsTwoDistinctStaticClass002>();
      let m1 = cls.getStaticMethod('method1');
      let m2 = cls.getStaticMethod('method2');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
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
    it('testStaticMethodEquals004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<StaticMethodEqualsCrossAClass003>().getStaticMethod('test');
      let m2 = Class.from<StaticMethodEqualsCrossBClass003>().getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
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
    it('testStaticMethodEquals005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      let result = method1!.equals(method2!);
      expect(result).assertTrue();
      let type: string = typeof result;
      expect(type).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_0600
     * @tc.name testStaticMethodEquals006
     * @tc.desc Verify reflexivity - same object reference equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
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
    it('testStaticMethodEquals007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsOverloadParamClass004>();
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
    it('testStaticMethodEquals008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsOverloadArityClass005>();
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
    it('testStaticMethodEquals009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsDifferentReturnClass006>();
      let m1 = cls.getStaticMethod('testReturnString');
      let m2 = cls.getStaticMethod('testReturnInt');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.equals(m2!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1000
     * @tc.name testStaticMethodEquals010
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      let result = method1!.equals(method2!);
      let type: string = typeof result;
      expect(type).assertEqual('boolean');
      let isBoolean: boolean = (result === true || result === false);
      expect(isBoolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1100
     * @tc.name testStaticMethodEquals011
     * @tc.desc Verify return value has binary nature (true or false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      let result = method1!.equals(method2!);
      let isBoolean: boolean = (result === true || result === false);
      expect(isBoolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1200
     * @tc.name testStaticMethodEquals012
     * @tc.desc Verify reflexivity - x.equals(x) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      expect(method!.equals(method!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1300
     * @tc.name testStaticMethodEquals013
     * @tc.desc Verify symmetry - x.equals(y) equals y.equals(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let m1 = cls.getStaticMethod('test');
      let m2 = cls.getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      let result1 = m1!.equals(m2!);
      let result2 = m2!.equals(m1!);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1400
     * @tc.name testStaticMethodEquals014
     * @tc.desc Verify transitivity - if x.equals(y) and y.equals(z) then x.equals(z)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let m1 = cls.getStaticMethod('test');
      let m2 = cls.getStaticMethod('test');
      let m3 = cls.getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      let eq12 = m1!.equals(m2!);
      let eq23 = m2!.equals(m3!);
      if (eq12 && eq23) {
        let result = m1!.equals(m3!);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1500
     * @tc.name testStaticMethodEquals015
     * @tc.desc Verify consistency - multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let m1 = cls.getStaticMethod('test');
      let m2 = cls.getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      let result1 = m1!.equals(m2!);
      let result2 = m1!.equals(m2!);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1600
     * @tc.name testStaticMethodEquals016
     * @tc.desc Verify equals method does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSingleTestClass001>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      try {
        let result = method1!.equals(method2!);
        expect(result).assertTrue();
        expect(typeof result).assertEqual('boolean');
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1700
     * @tc.name testStaticMethodEquals017
     * @tc.desc Verify sync and async method comparison returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsSyncAsyncClass007>();
      let syncMethod = cls.getStaticMethod('syncMethod');
      let asyncMethod = cls.getStaticMethod('asyncMethod');
      if (syncMethod !== undefined && asyncMethod !== undefined) {
        let result = syncMethod.equals(asyncMethod);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1800
     * @tc.name testStaticMethodEquals018
     * @tc.desc Verify abstract class static method equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<StaticMethodEqualsAbstractTargetClass008>().getStaticMethod('test');
      let m2 = Class.from<StaticMethodEqualsAbstractTargetClass008>().getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_1900
     * @tc.name testStaticMethodEquals019
     * @tc.desc Verify final class static method equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<StaticMethodEqualsFinalTargetClass009>().getStaticMethod('test');
      let m2 = Class.from<StaticMethodEqualsFinalTargetClass009>().getStaticMethod('test');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2000
     * @tc.name testStaticMethodEquals020
     * @tc.desc Verify getter/setter method equals comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsGetterSetterClass010>();
      let getter1 = cls.getStaticMethod('%%get-userName');
      let getter2 = cls.getStaticMethod('%%get-userName');
      let setter = cls.getStaticMethod('%%set-userName');
      if (getter1 !== undefined && getter2 !== undefined && setter !== undefined) {
        expect(getter1.equals(getter2)).assertTrue();
        expect(getter1.equals(setter)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2100
     * @tc.name testStaticMethodEquals021
     * @tc.desc Verify method list comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<StaticMethodEqualsMultiMethodClass011>();
      let cls2 = Class.from<StaticMethodEqualsMultiMethodClass011>();
      let methods1 = cls1.getStaticMethods();
      let methods2 = cls2.getStaticMethods();
      expect(methods1.length).assertEqual(methods2.length);
      for (let i: int = 0; i < methods1.length; i++) {
        let result = methods1[i].equals(methods2[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2200
     * @tc.name testStaticMethodEquals022
     * @tc.desc Verify deduplication using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticMethodEqualsUniqueClass012>();
      let method1 = cls.getStaticMethod('test');
      let method2 = cls.getStaticMethod('test');
      let method3 = cls.getStaticMethod('test');
      expect(method1 != undefined).assertTrue();
      expect(method2 != undefined).assertTrue();
      expect(method3 != undefined).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_EQUALS_2300
     * @tc.name testStaticMethodEquals023
     * @tc.desc Verify set operations (intersection) using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodEquals023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methodsA = Class.from<StaticMethodEqualsSetClassA013>().getStaticMethods();
      let methodsB = Class.from<StaticMethodEqualsSetClassB013>().getStaticMethods();
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

  });
}
