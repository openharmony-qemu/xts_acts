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

class MyClass001 {
  public static test(): void {
    console.info('test called');
  }
}

class MyClass002 {
  public static test(msg: string): string {
    return 'Hello ' + msg;
  }
}

class MyClass003 {
  public static add(a: int, b: int): int {
    return a + b;
  }
}

class MyClass004 {
  public static test(value: string | null): void {}
}

class MyClass005 {
  public static test(value?: string): void {}
}

class MyClass006 {
  public static test(value: int): void {}
}

class MyClass007 {
  public static test(a: int, b: int): void {}
}

class MyClass008 {
  public static test(value: int): void {}
}

class MyClass009 {
  public static returnInt(): int { return 42; }
  public static returnString(): string { return 'test'; }
  public static returnBoolean(): boolean { return true; }
}

class MyClass010 {
  public static voidMethod(): void {
    console.info('void method');
  }
}

class MyClass011 {
  public static returnObject(): MyClass011 { return new MyClass011(); }
  public static returnArray(): Array<int> { return [1, 2, 3]; }
}

class MyClass012 {
  public static async asyncMethod(): Promise<string> { return 'async result'; }
}

class MyClass013 {
  public static returnNull(): string | null { return null; }
}

class MyClass014 {
  public static returnUndefined(): int | undefined { return undefined; }
}

class MyClass015 {
  public static returnZero(): int { return 0; }
  public static returnFalse(): boolean { return false; }
}

class MyClass016 {
  public static test(): string { return 'test'; }
}

class MyClass017 {
  public static test(): int { return 42; }
}

class MyClass018 {
  public static maxInt(): int { return 2147483647; }
  public static minInt(): int { return -2147483648; }
}

class MyClass019 {
  public static returnLargeObject(): Map<string, Array<int>> {
    let map: Map<string, Array<int>> = new Map<string, Array<int>>();
    map.set('key1', [1, 2, 3]);
    map.set('key2', [4, 5, 6]);
    return map;
  }
}

class MyClass020 {
  public static test(value: int): void {}
}

class MyClass021 {
  public static test(a: int, b: int): void {}
}

class MyClass022 {
  public static throwError(): void {
    throw new Error('Method error');
  }
}

class MyClass023 {
  public static publicMethod(): string { return 'public'; }
}

class MyClass024 {
  public static async fetchData(): Promise<string> { return 'data'; }
}

class MyClass025 {
  public static async fetchWithParam(url: string): Promise<string> {
    return 'data from ' + url;
  }
}

class MyClass026 {
  public static async asyncError(): Promise<string> {
    throw new Error('async error');
  }
}

abstract class AbstractClass027 {
  public static abstractStatic(): string { return 'abstract'; }
}

final class FinalClass028 {
  public static finalStatic(): string { return 'final'; }
}

class MyClass029 {
  private static _name: string = '';
  public static get name(): string { return MyClass029._name; }
  public static set name(value: string) { MyClass029._name = value; }
}

class MyClass030 {
  public static m1(): int { return 1; }
  public static m2(): int { return 2; }
  public static m3(): int { return 3; }
}

class MyClass031 {
  private static _value: int = 0;
  public static setValue(val: int): MyClass031 {
    MyClass031._value = val;
    return new MyClass031();
  }
  public static getValue(): int { return MyClass031._value; }
}

class MyClass032 {
  public static test(): int { return 42; }
}

class MyClass033 {
  public static test(): string { return 'no param'; }
  public static test(msg: string): string { return msg; }
}

class MyClass034 {
  public static noParam(): int { return 42; }
}

export default function StaticMethodInvokeTest(): void {
  describe('StaticMethodInvokeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0100
     * @tc.name testStaticMethodInvoke001
     * @tc.desc Verify invoke() call with no arguments on void method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      //   method!.invoke();
      let invokeResult = method!.invoke();
      let isUndefined = invokeResult === undefined;
      expect(isUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0200
     * @tc.name testStaticMethodInvoke002
     * @tc.desc Verify invoke() with arguments on method with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test', [Class.from<string>()]);
      expect(method != undefined).assertTrue();
      let result: string = method!.invoke(['World']) as string;
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0300
     * @tc.name testStaticMethodInvoke003
     * @tc.desc Verify invoke() with correct type and number of arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls003 = Class.from<MyClass003>();
      let method = cls003.getStaticMethod('add');
      expect(method != undefined).assertTrue();
      let result: int = method!.invoke([1, 2]) as int;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0400
     * @tc.name testStaticMethodInvoke004
     * @tc.desc Verify invoke() passing null as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls004 = Class.from<MyClass004>();
      let method = cls004.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      // spec/types.md:1725: string|null is a nullish union and should accept null.
      //   method!.invoke([null]);
      let invokeResult = method!.invoke([null]);
      let isUndefined = invokeResult === undefined;
      expect(isUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0500
     * @tc.name testStaticMethodInvoke005
     * @tc.desc Verify invoke() passing undefined as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<MyClass005>();
      let method = cls005.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      // spec/types.md:1327: optional parameter type is T|undefined (nullish union).
      //   method!.invoke([undefined]);
      let invokeResult = method!.invoke([undefined]);
      let isUndefined = invokeResult === undefined;
      expect(isUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0600
     * @tc.name testStaticMethodInvoke006
     * @tc.desc Verify invoke() throws error for mismatched parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<MyClass006>();
      let method = cls006.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke(['string instead of int']);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0700
     * @tc.name testStaticMethodInvoke007
     * @tc.desc Verify invoke() throws error for insufficient arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<MyClass007>();
      let method = cls007.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke([1]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0800
     * @tc.name testStaticMethodInvoke008
     * @tc.desc Verify invoke() throws error for excess arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls008 = Class.from<MyClass008>();
      let method = cls008.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke([1, 2]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_0900
     * @tc.name testStaticMethodInvoke009
     * @tc.desc Verify invoke() returns int value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('returnInt');
      let result = method!.invoke() as int;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1000
     * @tc.name testStaticMethodInvoke010
     * @tc.desc Verify invoke() returns string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('returnString');
      let result = method!.invoke() as string;
      expect(result).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1100
     * @tc.name testStaticMethodInvoke011
     * @tc.desc Verify invoke() returns boolean value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('returnBoolean');
      let result = method!.invoke() as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1200
     * @tc.name testStaticMethodInvoke012
     * @tc.desc Verify invoke() on void method returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls010 = Class.from<MyClass010>();
      let method = cls010.getStaticMethod('voidMethod');
      expect(method != undefined).assertTrue();
      let result = method!.invoke();
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1300
     * @tc.name testStaticMethodInvoke013
     * @tc.desc Verify invoke() returns object correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let arr: Array<int> = cls.getStaticMethod('returnArray')!.invoke() as Array<int>;
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1400
     * @tc.name testStaticMethodInvoke014
     * @tc.desc Verify invoke() on async method returns Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let cls012 = Class.from<MyClass012>();
      let method = cls012.getStaticMethod('asyncMethod');
      expect(method != undefined).assertTrue();
      let promise: Promise<string> = method!.invoke() as Promise<string>;
      let result: string = await promise;
      expect(result).assertEqual('async result');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1500
     * @tc.name testStaticMethodInvoke015
     * @tc.desc Verify invoke() returns null correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls013 = Class.from<MyClass013>();
      let method = cls013.getStaticMethod('returnNull');
      expect(method != undefined).assertTrue();
      let result = method!.invoke();
      expect(result == null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1600
     * @tc.name testStaticMethodInvoke016
     * @tc.desc Verify invoke() returns undefined correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls014 = Class.from<MyClass014>();
      let method = cls014.getStaticMethod('returnUndefined');
      expect(method != undefined).assertTrue();
      let result = method!.invoke();
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1700
     * @tc.name testStaticMethodInvoke017
     * @tc.desc Verify invoke() returns 0 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let method = cls.getStaticMethod('returnZero');
      let result = method!.invoke() as int;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1800
     * @tc.name testStaticMethodInvoke018
     * @tc.desc Verify invoke() returns false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let method = cls.getStaticMethod('returnFalse');
      let result = method!.invoke() as boolean;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_1900
     * @tc.name testStaticMethodInvoke019
     * @tc.desc Verify invoke() return value type is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<MyClass016>();
      let method = cls016.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let result = method!.invoke();
      let resultType = Class.of(result as Object).getName();
      expect(resultType).assertEqual('std.core.String');
      expect(result as string).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2000
     * @tc.name testStaticMethodInvoke020
     * @tc.desc Verify invoke() return value can be type cast correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<MyClass017>();
      let method = cls017.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let result: int = method!.invoke() as int;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2100
     * @tc.name testStaticMethodInvoke021
     * @tc.desc Verify invoke() returns boundary int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let mMax = cls.getStaticMethod('maxInt');
      let mMin = cls.getStaticMethod('minInt');
      let resultMax = mMax!.invoke() as int;
      let resultMin = mMin!.invoke() as int;
      expect(resultMax).assertEqual(2147483647);
      expect(resultMin).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2200
     * @tc.name testStaticMethodInvoke022
     * @tc.desc Verify invoke() returns large complex object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<MyClass019>();
      let method = cls019.getStaticMethod('returnLargeObject');
      expect(method != undefined).assertTrue();
      let result: Map<string, Array<int>> = method!.invoke() as Map<string, Array<int>>;
      expect(result.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2300
     * @tc.name testStaticMethodInvoke023
     * @tc.desc Verify invoke() catches TypeError for mismatched parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls020 = Class.from<MyClass020>();
      let method = cls020.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke(['string']);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2400
     * @tc.name testStaticMethodInvoke024
     * @tc.desc Verify invoke() catches TypeError for wrong number of arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls021 = Class.from<MyClass021>();
      let method = cls021.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke([1]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2500
     * @tc.name testStaticMethodInvoke025
     * @tc.desc Verify invoke() propagates exception thrown by called method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls022 = Class.from<MyClass022>();
      let method = cls022.getStaticMethod('throwError');
      expect(method != undefined).assertTrue();
      try {
        method!.invoke();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2600
     * @tc.name testStaticMethodInvoke026
     * @tc.desc Verify invoke() on public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass023>();
      let publicM = cls.getStaticMethod('publicMethod');
      expect(publicM != undefined).assertTrue();
      expect(publicM!.invoke() as string).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2700
     * @tc.name testStaticMethodInvoke027
     * @tc.desc Verify invoke() on async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let cls024 = Class.from<MyClass024>();
      let method = cls024.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      let promise: Promise<string> = method!.invoke() as Promise<string>;
      let result: string = await promise;
      expect(result).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2800
     * @tc.name testStaticMethodInvoke028
     * @tc.desc Verify invoke() on async method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let cls025 = Class.from<MyClass025>();
      let method = cls025.getStaticMethod('fetchWithParam');
      expect(method != undefined).assertTrue();
      let promise: Promise<string> = method!.invoke(['http://example.com']) as Promise<string>;
      let result: string = await promise;
      expect(result).assertEqual('data from http://example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2900
     * @tc.name testStaticMethodInvoke029
     * @tc.desc Verify invoke() on async method that throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let cls026 = Class.from<MyClass026>();
      let method = cls026.getStaticMethod('asyncError');
      expect(method != undefined).assertTrue();
      let promise: Promise<string> = method!.invoke() as Promise<string>;
      try {
        await promise;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3000
     * @tc.name testStaticMethodInvoke030
     * @tc.desc Verify invoke() on abstract class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls027 = Class.from<AbstractClass027>();
      let method = cls027.getStaticMethod('abstractStatic');
      expect(method != undefined).assertTrue();
      expect(method!.invoke() as string).assertEqual('abstract');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3100
     * @tc.name testStaticMethodInvoke031
     * @tc.desc Verify invoke() on final class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls028 = Class.from<FinalClass028>();
      let method = cls028.getStaticMethod('finalStatic');
      expect(method != undefined).assertTrue();
      expect(method!.invoke() as string).assertEqual('final');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3200
     * @tc.name testStaticMethodInvoke032
     * @tc.desc Verify invoke() on getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass029>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();

      expect(getter!.invoke() as string).assertEqual('');
      setter!.invoke(['test']);
      expect(getter!.invoke() as string).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3300
     * @tc.name testStaticMethodInvoke033
     * @tc.desc Verify batch invoke of multiple static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass030>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let sum: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        let result: int = methods[i].invoke() as int;
        sum += result;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3400
     * @tc.name testStaticMethodInvoke034
     * @tc.desc Verify chained invoke calls using setValue and getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls031 = Class.from<MyClass031>();
      let setValue = cls031.getStaticMethod('setValue');
      let getValue = cls031.getStaticMethod('getValue');
      expect(setValue != undefined).assertTrue();
      expect(getValue != undefined).assertTrue();

      setValue!.invoke([42]);
      expect(getValue!.invoke() as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3500
     * @tc.name testStaticMethodInvoke035
     * @tc.desc Verify invoke() consistency across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls032 = Class.from<MyClass032>();
      let method = cls032.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      for (let i: int = 0; i < 100; i++) {
        let result: int = method!.invoke() as int;
        expect(result).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3600
     * @tc.name testStaticMethodInvoke036
     * @tc.desc Verify getStaticMethod without signature throws Error when multiple overloads exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass033>();
      // arkts-sta-reflect.md:880 — Error is thrown when signature is omitted and multiple overloads exist
      try {
        cls.getStaticMethod('test');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // With explicit signature, it should work
      let method = cls.getStaticMethod('test', []);
      expect(method != undefined).assertTrue();
      expect(method!.invoke() as string).assertEqual('no param');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3700
     * @tc.name testStaticMethodInvoke037
     * @tc.desc Verify invoke() with empty array behaves equivalently to invoke() without args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MyClass034>();
      let method = cls.getStaticMethod('noParam');
      expect(method != undefined).assertTrue();
      let result1: int = method!.invoke() as int;
      let result2: int = method!.invoke([]) as int;
      expect(result1).assertEqual(result2);
    });
  });
}
