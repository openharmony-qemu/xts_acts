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
import Utils from '../Util.test';
import { looseReflect } from '../voidFn';

function asStaticMethodArray(o: Object): Array<reflect.StaticMethod> {
  return o as Array<reflect.StaticMethod>;
}

class MyClass001 {
      public static test(): string {
          return "no param";
      }
  }

class MyClass002 {
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass004 {
      public static hello(): string {
          return "hello";
      }
  }

class MyClass006 {
      public static method006(): string {
          return "name";
      }
  }

class MyClass007 {
      public static 测试方法(): string {
          return "测试";
      }
  }

class MyClass013 {
      public static noParam(): string {
          return "no param";
      }
  }

class MyClass014 {
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass015 {
      public static test(a: int, b: string, c: boolean): void {
          // 方法实现
      }
  }

class MyClass017 {
      public static testByte(b: byte): void {}
      public static testShort(s: short): void {}
      public static testInt(i: int): void {}
      public static testLong(l: long): void {}
      public static testFloat(f: float): void {}
      public static testDouble(d: double): void {}
      public static testChar(c: char): void {}
      public static testBoolean(b: boolean): void {}
  }

class MyClass018 {
      public static testGeneric(arr: Array<int>): void {}
      public static testMap(map: Map<string, int>): void {}
  }

class MyClass019 {
      public static testUnion(value: int | string): void {}
  }

class MyClass020 {
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass022 {
      public static singleMethod(): string {
          return "single";
      }
  }

class MyClass023 {
      public static test(): string {
          return "no param";
      }
      public static test(msg: string): string {
          return msg;
      }
      public static test(a: int, b: int): string {
          return (a + b).toString();
      }
  }

class MyClass024 {
      public static test(): string {
          return "no param";
      }
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass025 {
      public static test(a: int, b: int): string {
          return (a + b).toString();
      }
  }

class MyClass026 {
      public static publicMethod(): string {
          return "public";
      }
  }

class MyClass027 {
      private static privateMethod(): string {
          return "private";
      }
  }

class MyClass028 {
      protected static protectedMethod(): string {
          return "protected";
      }
  }

class MyClass029 {
      public static myMethod(): string {
          return "myClass";
      }
  }

class MyClass030 extends ParentClass030 {}

class ParentClass030 {
      public static parentMethod(): string {
          return "parent";
      }
  }

class MyClass031 extends ParentClass031 {
      public static overrideMethod(): string {
          return "child";
      }
  }

class ParentClass031 {
      public static overrideMethod(): string {
          return "parent";
      }
  }

class MyClass032 {
      public static async asyncMethod(): Promise<string> {
          return "async";
      }
  }

class MyClass033 {
      private static _name: string = '';
      public static get name(): string {
          return MyClass033._name;
      }
  }

class MyClass034 {
      private static _name: string = '';
      public static set name(value: string) {
          MyClass034._name = value;
      }
  }

class MyClass036 {
      public static test(): string {
          return "test";
      }
  }

class MyClass037 {
      public static test(a: int, b: string): void {}
  }

class MyClass038 {
      public static existingMethod(): string {
          return "exists";
      }
  }

class MyClass039 extends ParentClass039 {}

class ParentClass039 {
      public static parentMethod(): string {
          return "parent";
      }
  }

class MyClass041 {
      public static test(a: int, b: string): string {
          return a.toString() + b;
      }
  }

class MyClass042 {
      public static add(a: int, b: int): int {
          return a + b;
      }
  }

class MyClass043 {
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass044 {
      public static test(): string {
          return "no param";
      }
      public static test(msg: string): string {
          return msg;
      }
  }

class MyClass045 {
      public static overloadedMethod(): string {
          return "a";
      }
      public static overloadedMethod(a: int): string {
          return "b";
      }
  }

class MyClass046 {
      public static test(): string {
          return "test";
      }
  }

class MyClass047 {
      public static fieldName: int = 100;
  }

class MyClass048 {
      public static test(): string { return "0"; }
      public static test(a: int): string { return "1"; }
      public static test(a: int, b: int): string { return "2"; }
      public static test(a: int, b: int, c: int): string { return "3"; }
      public static test(a: string): string { return "s1"; }
      public static test(a: string, b: string): string { return "s2"; }
  }

interface MyClass049Opts {
      enabled: boolean;
      config: Object;
  }

class MyClass049 {
      public static complexMethod(
          map: Map<string, Array<int>>,
          sink: int,
          options: MyClass049Opts
      ): void {}
  }

class MyClass050 {
          public static test(): string {
              return "test";
          }
      }

function testGetMethod050(): string {

      let cls = Class.from<MyClass050>();
      let method = cls.getStaticMethod('test');
      return method !== undefined ? "success" : "fail";
  }

class MyClass051 {
      public static publicMethod(): string {
          return "public";
      }
  }

class MyClass052 {
      public static async asyncMethod(): Promise<string> {
          return "async";
      }
      public static syncMethod(): string {
          return "sync";
      }
  }

class MyClass053 {
      private static _value: int = 0;
      public static get value(): int { return MyClass053._value; }
      public static set value(v: int) { MyClass053._value = v; }
  }

class MyClass054 {
      public static test(a: int, b: string, c: boolean): void {}
  }

class MyClass055 {
      public static intMethod(): int { return 0; }
      public static stringMethod(): string { return "test"; }
      public static voidMethod(): void {}
  }

class MyClass056 {
      public static test(): string {
          return "test";
      }
  }

class MyClass057 {
      public static test(msg: string): string {
          return msg;
      }
  }

class StringUtils058 {
      public static toUpperCase(str: string): string {
          return str.toUpperCase();
      }
      public static toLowerCase(str: string): string {
          return str.toLowerCase();
      }
      public static trim(str: string): string {
          return str.trim();
      }
  }

class MyPlugin059 {
      public static initialize(): void {
          console.info('Plugin059 initialized');
      }
      public static execute(config: Object): void {
          console.info('Plugin059 executed');
      }
      public static cleanup(): void {
          console.info('Plugin059 cleaned up');
      }
  }

function executeCommand060(commandName: string): string | undefined {
      let cls = Class.from<CommandHandler060>();
      let method = cls.getStaticMethod(commandName);
      if (method) {
          return method!.invoke() as string;
      }
      return undefined;
  }

class CommandHandler060 {
      public static help(): string {
          return 'Available commands: help, version, status';
      }
      public static version(): string {
          return 'v1.0.0';
      }
      public static status(): string {
          return 'Running';
      }
  }

class LargeClass061 {
      // 假设有100个静态方法
      public static method001(): int { return 1; }
      public static method002(): int { return 2; }
      // ... 更多方法
      public static method100(): int { return 100; }
  }

class MyClass062 {
      public static test(): string {
          return "test";
      }
  }

class MyClass063 {
      public static method1(): string { return "1"; }
      public static method2(): string { return "2"; }
      public static method3(): string { return "3"; }
  }

class Calculator064 {
      public static add(a: int, b: int): int {
          return a + b;
      }
      public static multiply(a: int, b: int): int {
          return a * b;
      }
  }

class MyClass065 {
      public static dataField: int = 100;
      public static data(): string {
          return "method";
      }
  }

class SystemClass {
      public static nativeMethod(): void {}
  }


export default function ClassGetStaticMethodTest(): void {
  describe('ClassGetStaticMethodTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0100
     * @tc.name testClassGetStaticMethod001
     * @tc.desc Verify ClassGetStaticMethod case 001: nameparameters parameters signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('test');
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0200
     * @tc.name testClassGetStaticMethod002
     * @tc.desc Verify ClassGetStaticMethod case 002: name signature parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass002>();
        let method = cls.getStaticMethod('test', [Class.from<string>()]);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0300
     * @tc.name testClassGetStaticMethod003
     * @tc.desc Verify ClassGetStaticMethod case 003: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 额外参数应被忽略或报错
        let method = looseReflect(cls as Object).getStaticMethod('test', [Class.from<string>()] as Object, Class.from<number>() as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0400
     * @tc.name testClassGetStaticMethod004
     * @tc.desc Verify ClassGetStaticMethod case 004: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
        let method = cls.getStaticMethod('hello');
        expect(method!.getName()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0500
     * @tc.name testClassGetStaticMethod005
     * @tc.desc Verify ClassGetStaticMethod case 005: method is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('');
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0600
     * @tc.name testClassGetStaticMethod006
     * @tc.desc Verify ClassGetStaticMethod case 006: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass006>();
        let method = cls.getStaticMethod('method006');
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0700
     * @tc.name testClassGetStaticMethod007
     * @tc.desc Verify ClassGetStaticMethod case 007: Unicode method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        let method = cls.getStaticMethod('测试方法');
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0800
     * @tc.name testClassGetStaticMethod008
     * @tc.desc Verify ClassGetStaticMethod case 008: string is method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let longName = 'a'.repeat(10000);
        let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod(longName);
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_0900
     * @tc.name testClassGetStaticMethod009
     * @tc.desc Verify ClassGetStaticMethod case 009: XSS method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('<script>alert(1)</script>');
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1000
     * @tc.name testClassGetStaticMethod010
     * @tc.desc Verify ClassGetStaticMethod case 010: empty method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('test\u200Bmethod');
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1100
     * @tc.name testClassGetStaticMethod011
     * @tc.desc Verify ClassGetStaticMethod case 011: using string is method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methodName = `test${123}`;
        let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod(methodName);
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1200
     * @tc.name testClassGetStaticMethod012
     * @tc.desc Verify ClassGetStaticMethod case 012: stringtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 应该在编译时报错，但测试运行时行为
        let method = looseReflect(cls as Object).getStaticMethod(123 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1300
     * @tc.name testClassGetStaticMethod013
     * @tc.desc Verify ClassGetStaticMethod case 013: no parameters method signature is empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass013>();
        let method = cls.getStaticMethod('test', []);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1400
     * @tc.name testClassGetStaticMethod014
     * @tc.desc Verify ClassGetStaticMethod case 014: parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass014>();
        let method = cls.getStaticMethod('test', [Class.from<string>()]);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1500
     * @tc.name testClassGetStaticMethod015
     * @tc.desc Verify ClassGetStaticMethod case 015: multiple parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass015>();
        let method = cls.getStaticMethod('test', [Class.from<int>(), Class.from<string>(), Class.from<boolean>()]);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1600
     * @tc.name testClassGetStaticMethod016
     * @tc.desc Verify ClassGetStaticMethod case 016: empty FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let emptyArray: FixedArray<Class> = [];
        let method = cls.getStaticMethod('test', emptyArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1700
     * @tc.name testClassGetStaticMethod017
     * @tc.desc Verify ClassGetStaticMethod case 017: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass017>();
        let m1 = cls.getStaticMethod('testByte', [Class.PRIMITIVE_BYTE]);
        let m2 = cls.getStaticMethod('testShort', [Class.PRIMITIVE_SHORT]);
        let m3 = cls.getStaticMethod('testInt', [Class.PRIMITIVE_INT]);
        let m4 = cls.getStaticMethod('testLong', [Class.PRIMITIVE_LONG]);
        let m5 = cls.getStaticMethod('testFloat', [Class.PRIMITIVE_FLOAT]);
        let m6 = cls.getStaticMethod('testDouble', [Class.PRIMITIVE_DOUBLE]);
        let m7 = cls.getStaticMethod('testChar', [Class.PRIMITIVE_CHAR]);
        let m8 = cls.getStaticMethod('testBoolean', [Class.PRIMITIVE_BOOLEAN]);
        let allOk: boolean = m1 != null && m2 != null && m3 != null && m4 != null && m5 != null && m6 != null && m7 != null && m8 != null;
        expect(allOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1800
     * @tc.name testClassGetStaticMethod018
     * @tc.desc Verify ClassGetStaticMethod case 018: generic type is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass018>();
        let m1 = cls.getStaticMethod('testGeneric', [Class.from<Array<int>>()]);
        let m2 = cls.getStaticMethod('testMap', [Class.from<Map<string, int>>()]);
        expect(m1 && m2 != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_1900
     * @tc.name testClassGetStaticMethod019
     * @tc.desc Verify ClassGetStaticMethod case 019: type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass019>();
        let method = cls.getStaticMethod('testUnion', [Class.from<int | string>()]);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2000
     * @tc.name testClassGetStaticMethod020
     * @tc.desc Verify ClassGetStaticMethod case 020: signature Class and method parameters type not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass020>();
        let method = cls.getStaticMethod('test', [Class.from<int>()]);
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2100
     * @tc.name testClassGetStaticMethod021
     * @tc.desc Verify ClassGetStaticMethod case 021: signature is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('test', null as FixedArray<Class>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2200
     * @tc.name testClassGetStaticMethod022
     * @tc.desc Verify ClassGetStaticMethod case 022: call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass022>();
        let method1 = cls.getStaticMethod('singleMethod');
        let method2 = cls.getStaticMethod('singleMethod', []);
        expect(method1 && method2 != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2300
     * @tc.name testClassGetStaticMethod023
     * @tc.desc Verify ClassGetStaticMethod case 023: when signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass023>();
        let m1 = cls.getStaticMethod('test', []);
        let m2 = cls.getStaticMethod('test', [Class.from<string>()]);
        let m3 = cls.getStaticMethod('test', [Class.from<int>(), Class.from<int>()]);
        expect(m1 && m2 && m3 != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2400
     * @tc.name testClassGetStaticMethod024
     * @tc.desc Verify ClassGetStaticMethod case 024: in multiple when signatureshould throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass024>();
        try {
            let method = cls.getStaticMethod('test');
            expect().assertFail(); // 应该抛出Error
        } catch (error) {
            expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2500
     * @tc.name testClassGetStaticMethod025
     * @tc.desc Verify ClassGetStaticMethod case 025: signatureparameters and not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass025>();
        let method = cls.getStaticMethod('test', [Class.from<int>()]);
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2600
     * @tc.name testClassGetStaticMethod026
     * @tc.desc Verify ClassGetStaticMethod case 026: get publicstatic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass026>();
        let method = cls.getStaticMethod('publicMethod');
        expect(method != null).assertTrue();
        expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2700
     * @tc.name testClassGetStaticMethod027
     * @tc.desc Verify ClassGetStaticMethod case 027: static method not via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass027>();
        let method = cls.getStaticMethod('privateMethod');
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2800
     * @tc.name testClassGetStaticMethod028
     * @tc.desc Verify ClassGetStaticMethod case 028: protectedstatic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass028>();
        let method = cls.getStaticMethod('protectedMethod');
        // protected方法不能通过反射获取
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_2900
     * @tc.name testClassGetStaticMethod029
     * @tc.desc Verify ClassGetStaticMethod case 029: get static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass029>();
        let method = cls.getStaticMethod('myMethod');
        expect(method != null).assertTrue();
        expect(method!.getOwner().getName()).assertEqual('MyClass029');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3000
     * @tc.name testClassGetStaticMethod030
     * @tc.desc Verify ClassGetStaticMethod case 030: getStaticMethod method not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass030>();
        let method = cls.getStaticMethod('parentMethod');
        expect(method).assertNull(); // 不应该获取父类方法
        
        let parentCls = cls.getSuper()!;
        let parentMethod = parentCls.getStaticMethod('parentMethod');
        expect(parentMethod != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3100
     * @tc.name testClassGetStaticMethod031
     * @tc.desc Verify ClassGetStaticMethod case 031: static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass031>();
        let method = cls.getStaticMethod('overrideMethod');
        expect(method != null).assertTrue();
        expect(method!.invoke() as string).assertEqual('child');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3200
     * @tc.name testClassGetStaticMethod032
     * @tc.desc Verify ClassGetStaticMethod case 032: static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass032>();
        let method = cls.getStaticMethod('asyncMethod');
        expect(method != null).assertTrue();
        expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3300
     * @tc.name testClassGetStaticMethod033
     * @tc.desc Verify ClassGetStaticMethod case 033: static property getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass033>();
        let method = cls.getStaticMethod('%%get-name');
        expect(method != null).assertTrue();
        expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3400
     * @tc.name testClassGetStaticMethod034
     * @tc.desc Verify ClassGetStaticMethod case 034: static property setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass034>();
        let method = cls.getStaticMethod('%%set-name');
        expect(method != null).assertTrue();
        expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3500
     * @tc.name testClassGetStaticMethod035
     * @tc.desc Verify ClassGetStaticMethod case 035: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 假设有一个包含native方法的类
        let cls = Class.from<SystemClass>();
        let method = cls.getStaticMethod('nativeMethod');
        if (method) {
            expect(method.isNative()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3600
     * @tc.name testClassGetStaticMethod036
     * @tc.desc Verify ClassGetStaticMethod case 036: to method return StaticMethodobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass036>();
        let method = cls.getStaticMethod('test');
        expect(method != null).assertTrue();
        let isSm: boolean = method instanceof reflect.StaticMethod;
        expect(isSm).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3700
     * @tc.name testClassGetStaticMethod037
     * @tc.desc Verify ClassGetStaticMethod case 037: return StaticMethodobject property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass037>();
        let method = cls.getStaticMethod('test', [Class.from<int>(), Class.from<string>()]);
        expect(method!.getName()).assertEqual('test');
        expect(method!.getOwner().getName()).assertEqual('MyClass037');
        expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3800
     * @tc.name testClassGetStaticMethod038
     * @tc.desc Verify ClassGetStaticMethod case 038: not in method return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass038>();
        let method = cls.getStaticMethod('nonExistentMethod');
        expect(method).assertNull();
        expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_3900
     * @tc.name testClassGetStaticMethod039
     * @tc.desc Verify ClassGetStaticMethod case 039: not get method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass039>();
        let method = cls.getStaticMethod('parentMethod');
        expect(method).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4000
     * @tc.name testClassGetStaticMethod040
     * @tc.desc Verify ClassGetStaticMethod case 040: return is StaticMethod or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getStaticMethod('test');
        if (method !== undefined) {
            let isSm: boolean = method instanceof reflect.StaticMethod;
            expect(isSm).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4100
     * @tc.name testClassGetStaticMethod041
     * @tc.desc Verify ClassGetStaticMethod case 041: StaticMethodobject method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass041>();
        let method = cls.getStaticMethod('test', [Class.from<int>(), Class.from<string>()]);
        
        // 验证返回对象的所有方法
        expect(method!.getName() != null).assertTrue();
        expect(method!.getOwner() != null).assertTrue();
        expect(method!.getReturnType() != null).assertTrue();
        expect(method!.getParameterTypes() != null).assertTrue();
        expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4200
     * @tc.name testClassGetStaticMethod042
     * @tc.desc Verify ClassGetStaticMethod case 042: via return StaticMethodcall method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass042>();
        let method = cls.getStaticMethod('add', [Class.from<int>(), Class.from<int>()]);
        let result = method!.invoke([10, 20]);
        expect(result as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4300
     * @tc.name testClassGetStaticMethod043
     * @tc.desc Verify ClassGetStaticMethod case 043: invoke when parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass043>();
        let method = cls.getStaticMethod('test', [Class.from<string>()]);
        
        // 正确调用
        let result1 = method!.invoke(['hello']);
        expect(result1 as string).assertEqual('hello');
        
        // 类型不匹配应该抛出TypeError
        try {
            method!.invoke([123]);
            expect().assertFail();
        } catch (error) {
            let isTe: boolean = error instanceof TypeError;
            expect(isTe).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4400
     * @tc.name testClassGetStaticMethod044
     * @tc.desc Verify ClassGetStaticMethod case 044: in multiple when signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass044>();
        try {
            let method = cls.getStaticMethod('test');
            expect().assertFail();
        } catch (error) {
            let isErr: boolean = error instanceof Error;
            expect(isErr).assertTrue();
            expect(error.message).assertContain('signature');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4500
     * @tc.name testClassGetStaticMethod045
     * @tc.desc Verify ClassGetStaticMethod case 045: Errorobject name messageproperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass045>();
        try {
            let method = cls.getStaticMethod('overloadedMethod');
            expect().assertFail();
        } catch (error) {
            expect(error.name).assertEqual('Error');
            expect(error.message != null).assertTrue();
            expect(error.stack != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4600
     * @tc.name testClassGetStaticMethod046
     * @tc.desc Verify ClassGetStaticMethod case 046: when call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass046>();
        // 类未显式初始化，但首次使用时会自动初始化
        let method = cls.getStaticMethod('test');
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4700
     * @tc.name testClassGetStaticMethod047
     * @tc.desc Verify ClassGetStaticMethod case 047: static field not method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass047>();
        let method = cls.getStaticMethod('fieldName');
        expect(method).assertNull(); // 应该使用getStaticField而不是getStaticMethod
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4800
     * @tc.name testClassGetStaticMethod048
     * @tc.desc Verify ClassGetStaticMethod case 048: multiple method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass048>();

        let methods: Array<reflect.StaticMethod | undefined> = new Array<reflect.StaticMethod | undefined>();
        methods.push(cls.getStaticMethod('test', []));
        methods.push(cls.getStaticMethod('test', [Class.from<int>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<int>(), Class.from<int>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<int>(), Class.from<int>(), Class.from<int>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<string>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<string>(), Class.from<string>()]));

        for (let i = 0; i < methods.length; i++) {
            expect(methods[i] != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_4900
     * @tc.name testClassGetStaticMethod049
     * @tc.desc Verify ClassGetStaticMethod case 049: parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass049>();
        let method = cls.getStaticMethod('complexMethod', [
            Class.from<Map<string, Array<int>>>(),
            Class.from<int>(),
            Class.from<MyClass049Opts>()
        ]);
        expect(method != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5000
     * @tc.name testClassGetStaticMethod050
     * @tc.desc Verify ClassGetStaticMethod case 050: call getStaticMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        let r1 = testGetMethod050();
        let r2 = testGetMethod050();
        expect(r1).assertEqual("success");
        expect(r2).assertEqual("success");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5100
     * @tc.name testClassGetStaticMethod051
     * @tc.desc Verify ClassGetStaticMethod case 051: verify return method isPublicproperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass051>();
        let method = cls.getStaticMethod('publicMethod');
        expect(method!.isPublic()).assertTrue();
        expect(method!.isPrivate()).assertFalse();
        expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5200
     * @tc.name testClassGetStaticMethod052
     * @tc.desc Verify ClassGetStaticMethod case 052: verify asyncmethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass052>();
        let asyncMethod = cls.getStaticMethod('asyncMethod');
        let syncMethod = cls.getStaticMethod('syncMethod');
        expect(asyncMethod!.isAsync()).assertTrue();
        expect(syncMethod!.isAsync()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5300
     * @tc.name testClassGetStaticMethod053
     * @tc.desc Verify ClassGetStaticMethod case 053: verify property method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass053>();
        let getter = cls.getStaticMethod('%%get-value');
        let setter = cls.getStaticMethod('%%set-value');
        expect(getter!.isGetter()).assertTrue();
        expect(setter!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5400
     * @tc.name testClassGetStaticMethod054
     * @tc.desc Verify ClassGetStaticMethod case 054: verify return method parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass054>();
        let method = cls.getStaticMethod('test', [
            Class.from<int>(),
            Class.from<string>(),
            Class.from<boolean>()
        ]);
        expect(method!.getParametersNum()).assertEqual(3);
        expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
        expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
        expect(method!.getParameterType(2)!.getName()).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5500
     * @tc.name testClassGetStaticMethod055
     * @tc.desc Verify ClassGetStaticMethod case 055: verify return method return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass055>();
        
        let m1 = cls.getStaticMethod('intMethod');
        let m2 = cls.getStaticMethod('stringMethod');
        let m3 = cls.getStaticMethod('voidMethod');
        
        expect(m1!.getReturnType().getName()).assertEqual('i32');
        expect(m2!.getReturnType().getName()).assertEqual('std.core.String');
        expect(m3!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5600
     * @tc.name testClassGetStaticMethod056
     * @tc.desc Verify ClassGetStaticMethod case 056: verify StaticMethod equalsmethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass056>();
        let method1 = cls.getStaticMethod('test');
        let method2 = cls.getStaticMethod('test', []);
        
        expect(method1!.equals(method2!)).assertTrue();
        expect(method1 === method2).assertFalse(); // 不同对象但相等
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5700
     * @tc.name testClassGetStaticMethod057
     * @tc.desc Verify ClassGetStaticMethod case 057: get method return object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass057>();
        let methods: Array<reflect.StaticMethod | undefined> = new Array<reflect.StaticMethod | undefined>();
        methods.push(cls.getStaticMethod('test', [Class.from<string>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<string>()]));
        methods.push(cls.getStaticMethod('test', [Class.from<string>()]));

        expect(methods[0]!.equals(methods[1]!)).assertTrue();
        expect(methods[1]!.equals(methods[2]!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5800
     * @tc.name testClassGetStaticMethod058
     * @tc.desc Verify ClassGetStaticMethod case 058: using scenario - call static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 动态调用
        let cls = Class.from<StringUtils058>();
        let methodName = 'toUpperCase';
        let method = cls.getStaticMethod(methodName, [Class.from<string>()]);
        let result = method!.invoke(['hello world']);
        expect(result as string).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_5900
     * @tc.name testClassGetStaticMethod059
     * @tc.desc Verify ClassGetStaticMethod case 059: call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 动态发现并调用插件方法
        let pluginCls = Class.from<MyPlugin059>();
        let initMethod = pluginCls.getStaticMethod('initialize');
        let execMethod = pluginCls.getStaticMethod('execute', [Class.from<Object>()]);
        let cleanupMethod = pluginCls.getStaticMethod('cleanup');
        
        initMethod!.invoke();
        execMethod!.invoke([{} as Object]);
        cleanupMethod!.invoke();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6000
     * @tc.name testClassGetStaticMethod060
     * @tc.desc Verify ClassGetStaticMethod case 060: name should static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(executeCommand060('help')).assertContain('Available commands');
        expect(executeCommand060('version')).assertEqual('v1.0.0');
        expect(executeCommand060('status')).assertEqual('Running');
        expect(executeCommand060('unknown')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6100
     * @tc.name testClassGetStaticMethod061
     * @tc.desc Verify ClassGetStaticMethod case 061: getStaticMethod in method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass061>();
        let startTime = Date.now();
        
        for (let i = 1; i <= 100; i++) {
            let methodName = `method${i.toString().padStart(3, '0')}`;
            let method = cls.getStaticMethod(methodName);
            expect(method != null).assertTrue();
        }
        
        let endTime = Date.now();
        let duration = endTime - startTime;
        // 验证查找时间在可接受范围内
        expect(duration).assertLess(1000); // 小于1秒
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6200
     * @tc.name testClassGetStaticMethod062
     * @tc.desc Verify ClassGetStaticMethod case 062: method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass062>();
        let startTime = Date.now();
        
        for (let i = 0; i < 10000; i++) {
            let method = cls.getStaticMethod('test');
            expect(method != null).assertTrue();
        }
        
        let endTime = Date.now();
        let duration = endTime - startTime;
        // 验证重复查找的性能
        expect(duration).assertLess(100); // 应该很快
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6300
     * @tc.name testClassGetStaticMethod063
     * @tc.desc Verify ClassGetStaticMethod case 063: from getStaticMethodsget after getStaticMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass063>();
        let allMethods = asStaticMethodArray(cls.getStaticMethods());
        
        let n = allMethods.length;
        for (let i = 0; i < n; i++) {
            let m = allMethods[i];
            let methodName = m.getName();
            let foundMethod = cls.getStaticMethod(methodName);
            expect(foundMethod != null).assertTrue();
            expect(foundMethod!.equals(m)).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6400
     * @tc.name testClassGetStaticMethod064
     * @tc.desc Verify ClassGetStaticMethod case 064: get method after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Calculator064>();
        
        // 链式调用：获取方法并执行
        let addMethod = cls.getStaticMethod('add', [Class.from<int>(), Class.from<int>()]);
        let result1 = addMethod!.invoke([10, 20]);
        expect(result1 as int).assertEqual(30);
        
        let mulMethod = cls.getStaticMethod('multiply', [Class.from<int>(), Class.from<int>()]);
        let result2 = mulMethod!.invoke([5, 6]);
        expect(result2 as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHOD_6500
     * @tc.name testClassGetStaticMethod065
     * @tc.desc Verify ClassGetStaticMethod case 065: verify method field name not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticMethod065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass065>();
        
        // 获取字段
        let field = cls.getStaticField('dataField');
        expect(field != null).assertTrue();
        expect(field!.getValue(cls) as int).assertEqual(100);
        
        // 获取方法（虽然同名但不同）
        let method = cls.getStaticMethod('data');
        expect(method != null).assertTrue();
        expect(method!.invoke() as string).assertEqual('method');
    });

  });
}