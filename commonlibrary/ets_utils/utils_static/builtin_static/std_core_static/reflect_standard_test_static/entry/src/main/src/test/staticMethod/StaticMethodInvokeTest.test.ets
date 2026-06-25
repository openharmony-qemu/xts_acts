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

class VoidNoArgClass {
  public static call(): void {
    console.info('call invoked');
  }
}

class GreetingClass {
  public static greet(name: string): string {
    return 'Hello ' + name;
  }
}

class CalculatorClass {
  public static sum(a: int, b: int): int {
    return a + b;
  }
}

class NullableParamClass {
  public static logMessage(value: string | null): void {}
}

class OptionalParamClass {
  public static show(value?: string): void {}
}

class IntArgClass {
  public static process(value: int): void {}
}

class TwoArgClass {
  public static combine(a: int, b: int): void {}
}

class FloatArgClass {
  public static accept(value: float): boolean {
    return value > 0.0;
  }
}

class BasicReturnClass {
  public static getInt(): int { return 42; }
  public static getText(): string { return 'test'; }
  public static getFlag(): boolean { return true; }
}

class VoidMethodClass {
  public static execute(): void {
    console.info('execute invoked');
  }
}

class ComplexReturnClass {
  public static makeInstance(): ComplexReturnClass { return new ComplexReturnClass(); }
  public static makeList(): Array<int> { return [1, 2, 3]; }
}

class AsyncMethodClass {
  public static async fetch(): Promise<string> { return 'async result'; }
}

class NullReturnClass {
  public static getNullable(): string | null { return null; }
}

class UndefinedReturnClass {
  public static getOptional(): int | undefined { return undefined; }
}

class ZeroFalseClass {
  public static getZero(): int { return 0; }
  public static getFalse(): boolean { return false; }
}

class StringReturnClass {
  public static getMessage(): string { return 'test'; }
}

class IntReturnClass {
  public static getNumber(): int { return 42; }
}

class BoundaryIntClass {
  public static getMax(): int { return 2147483647; }
  public static getMin(): int { return -2147483648; }
}

class LargeObjectClass {
  public static buildMap(): Map<string, Array<int>> {
    let map: Map<string, Array<int>> = new Map<string, Array<int>>();
    map.set('key1', [1, 2, 3]);
    map.set('key2', [4, 5, 6]);
    return map;
  }
}

class BoolArgClass {
  public static check(flag: boolean): string {
    return flag ? 'yes' : 'no';
  }
}

class DualStringClass {
  public static merge(x: string, y: string): string {
    return x + y;
  }
}

class ErrorThrowingClass {
  public static raise(): void {
    throw new Error('Method error');
  }
}

class PublicMethodClass {
  public static publish(): string { return 'public'; }
}

class FetchDataClass {
  public static async load(): Promise<string> { return 'data'; }
}

class FetchWithParamClass {
  public static async request(url: string): Promise<string> {
    return 'data from ' + url;
  }
}

class AsyncErrorClass {
  public static async reject(): Promise<string> {
    throw new Error('async error');
  }
}

abstract class AbstractClass {
  public static getLabel(): string { return 'abstract'; }
}

final class FinalClass {
  public static getId(): string { return 'final'; }
}

class PropertyClass {
  private static _title: string = '';
  public static get title(): string { return PropertyClass._title; }
  public static set title(value: string) { PropertyClass._title = value; }
}

class MultiMethodClass {
  public static first(): int { return 1; }
  public static second(): string { return 'two'; }
  public static third(): boolean { return true; }
}

class ChainClass {
  private static _value: int = 0;
  public static store(val: int): ChainClass {
    ChainClass._value = val;
    return new ChainClass();
  }
  public static read(): int { return ChainClass._value; }
}

class ConsistencyClass {
  public static getFixed(): int { return 42; }
}

class OverloadClass {
  public static echo(): string { return 'no param'; }
  public static echo(msg: int): string { return msg.toString(); }
}

class NoArgClass {
  public static getDefault(): int { return 42; }
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
      let cls: Class = Class.from<VoidNoArgClass>();
      let method = cls.getStaticMethod('call');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<GreetingClass>();
      let method = cls.getStaticMethod('greet', [Class.from<string>()]);
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<CalculatorClass>();
      let method = cls.getStaticMethod('sum');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<NullableParamClass>();
      let method = cls.getStaticMethod('logMessage');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<OptionalParamClass>();
      let method = cls.getStaticMethod('show');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<IntArgClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<TwoArgClass>();
      let method = cls.getStaticMethod('combine');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<FloatArgClass>();
      let method = cls.getStaticMethod('accept');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<BasicReturnClass>();
      let method = cls.getStaticMethod('getInt');
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
      let cls: Class = Class.from<BasicReturnClass>();
      let method = cls.getStaticMethod('getText');
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
      let cls: Class = Class.from<BasicReturnClass>();
      let method = cls.getStaticMethod('getFlag');
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
      let cls: Class = Class.from<VoidMethodClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<ComplexReturnClass>();
      let arr: Array<int> = cls.getStaticMethod('makeList')!.invoke() as Array<int>;
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
      let cls: Class = Class.from<AsyncMethodClass>();
      let method = cls.getStaticMethod('fetch');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<NullReturnClass>();
      let method = cls.getStaticMethod('getNullable');
      expect(method !== undefined).assertTrue();
      let result = method!.invoke();
      expect(result === null).assertTrue();
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
      let cls: Class = Class.from<UndefinedReturnClass>();
      let method = cls.getStaticMethod('getOptional');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<ZeroFalseClass>();
      let method = cls.getStaticMethod('getZero');
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
      let cls: Class = Class.from<ZeroFalseClass>();
      let method = cls.getStaticMethod('getFalse');
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
      let cls: Class = Class.from<StringReturnClass>();
      let method = cls.getStaticMethod('getMessage');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<IntReturnClass>();
      let method = cls.getStaticMethod('getNumber');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<BoundaryIntClass>();
      let mMax = cls.getStaticMethod('getMax');
      let mMin = cls.getStaticMethod('getMin');
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
      let cls: Class = Class.from<LargeObjectClass>();
      let method = cls.getStaticMethod('buildMap');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<GreetingClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([42]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_2400
     * @tc.name testStaticMethodInvoke024
     * @tc.desc Verify invoke() catches TypeError for wrong argument types in multi-param method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CalculatorClass>();
      let method = cls.getStaticMethod('sum');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke(['x', 'y']);
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
      let cls: Class = Class.from<ErrorThrowingClass>();
      let method = cls.getStaticMethod('raise');
      expect(method !== undefined).assertTrue();
      let caught: boolean = false;
      try {
        method!.invoke();
      } catch (error) {
        caught = error.name === 'Error';
      }
      expect(caught).assertTrue();
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
      let cls: Class = Class.from<PublicMethodClass>();
      let publicM = cls.getStaticMethod('publish');
      expect(publicM !== undefined).assertTrue();
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
      let cls: Class = Class.from<FetchDataClass>();
      let method = cls.getStaticMethod('load');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<FetchWithParamClass>();
      let method = cls.getStaticMethod('request');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<AsyncErrorClass>();
      let method = cls.getStaticMethod('reject');
      expect(method !== undefined).assertTrue();
      let promise: Promise<string> = method!.invoke() as Promise<string>;
      let hasError: boolean = false;
      try {
        await promise;
      } catch (error) {
        hasError = (error.name === 'Error');
      }
      expect(hasError).assertTrue();
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
      let cls: Class = Class.from<AbstractClass>();
      let method = cls.getStaticMethod('getLabel');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<FinalClass>();
      let method = cls.getStaticMethod('getId');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<PropertyClass>();
      let getter = cls.getStaticMethod('%%get-title');
      let setter = cls.getStaticMethod('%%set-title');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();

      expect(getter!.invoke() as string).assertEqual('');
      setter!.invoke(['hello']);
      expect(getter!.invoke() as string).assertEqual('hello');
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
      let cls: Class = Class.from<MultiMethodClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let invokeCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        methods[i].invoke();
        invokeCount++;
      }
      expect(invokeCount).assertEqual(3);
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
      let cls: Class = Class.from<ChainClass>();
      let store = cls.getStaticMethod('store');
      let read = cls.getStaticMethod('read');
      expect(store !== undefined).assertTrue();
      expect(read !== undefined).assertTrue();

      store!.invoke([42]);
      expect(read!.invoke() as int).assertEqual(42);
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
      let cls: Class = Class.from<ConsistencyClass>();
      let method = cls.getStaticMethod('getFixed');
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<OverloadClass>();
      try {
        cls.getStaticMethod('echo');
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      // With explicit signature, it should work
      let method = cls.getStaticMethod('echo', []);
      expect(method !== undefined).assertTrue();
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
      let cls: Class = Class.from<NoArgClass>();
      let method = cls.getStaticMethod('getDefault');
      expect(method !== undefined).assertTrue();
      let result1: int = method!.invoke() as int;
      let result2: int = method!.invoke([]) as int;
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3800
     * @tc.name testStaticMethodInvoke038
     * @tc.desc Verify invoke() with empty array on method with required param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GreetingClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_3900
     * @tc.name testStaticMethodInvoke039
     * @tc.desc Verify invoke() with excess arguments on multi-param method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TwoArgClass>();
      let method = cls.getStaticMethod('combine');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([1, 2, 3]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_4000
     * @tc.name testStaticMethodInvoke040
     * @tc.desc Verify invoke() with wrong argument type on async method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FetchWithParamClass>();
      let method = cls.getStaticMethod('request');
      expect(method !== undefined).assertTrue();
      try {
        method!.invoke([42]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_INVOKE_4100
     * @tc.name testStaticMethodInvoke041
     * @tc.desc Verify invoke() return value type via Class.of() for int, string, boolean, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt: Class = Class.from<IntReturnClass>();
      let resultInt = clsInt.getStaticMethod('getNumber')!.invoke();
      let intType = Class.of(resultInt as Object).getName();
      expect(intType).assertEqual('std.core.Int');

      let clsStr: Class = Class.from<StringReturnClass>();
      let resultStr = clsStr.getStaticMethod('getMessage')!.invoke();
      let strType = Class.of(resultStr as Object).getName();
      expect(strType).assertEqual('std.core.String');

      let clsBool: Class = Class.from<BasicReturnClass>();
      let resultBool = clsBool.getStaticMethod('getFlag')!.invoke();
      let boolType = Class.of(resultBool as Object).getName();
      expect(boolType).assertEqual('std.core.Boolean');

      let clsArr: Class = Class.from<ComplexReturnClass>();
      let resultArr = clsArr.getStaticMethod('makeList')!.invoke();
      let arrType = Class.of(resultArr as Object).getName();
      expect(arrType).assertEqual('std.core.Array');
    });

  });
}
