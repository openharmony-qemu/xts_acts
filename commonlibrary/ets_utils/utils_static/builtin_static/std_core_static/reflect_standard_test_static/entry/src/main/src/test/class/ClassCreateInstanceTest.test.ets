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
import Utils from '../Util.test';
import { looseReflect } from './VoidFn.test';

class MyClass001 {
  public name = 'test';
}

class MyClass002 {
  public name = 'test';
}

class NormalClass003 {
  public value: int = 100;
}

final class FinalClass004 {
  public data: string = 'final';
}

class GenericClass005<T> {
  public data: T = '' as T;
}

class ChildClass006 extends ParentClass006 {
  public childField: int = 200;
}

class ParentClass006 {
  public parentField: string = 'parent';
}

class MyClass007 {
  public name: string = 'default';
  public age: int = 0;
}

class MyClass008 {
  public value = 100;
}

class MyClass009 {
  public id: int = 0;
}

class MyClass010 {
  public strValue: string = 'default';
  public numValue: int = 42;
  public boolValue: boolean = true;
  public nullValue: string | null = null;
}

class MyClass011 {
  public arr: Array<int> = [1, 2, 3];
  public map: Map<string, int> = new Map<string, int>();
  public set: Set<int> = new Set<int>();
}

class MyClass012 {
  public value = 'test';
}

class MyClass013 {
  public data = 'data';
}

class LargeClass014 {
  public field1: int = 1;
  public field2: int = 2;
  public field3: int = 3;
  public field4: int = 4;
  public field5: int = 5;
  public field6: int = 6;
  public field7: int = 7;
  public field8: int = 8;
  public field9: int = 9;
  public field10: int = 10;
  public field11: int = 11;
  public field12: int = 12;
  public field13: int = 13;
  public field14: int = 14;
  public field15: int = 15;
  public field16: int = 16;
  public field17: int = 17;
  public field18: int = 18;
  public field19: int = 19;
  public field20: int = 20;
  public field21: int = 21;
  public field22: int = 22;
  public field23: int = 23;
  public field24: int = 24;
  public field25: int = 25;
  public field26: int = 26;
  public field27: int = 27;
  public field28: int = 28;
  public field29: int = 29;
  public field30: int = 30;
  public field31: int = 31;
  public field32: int = 32;
  public field33: int = 33;
  public field34: int = 34;
  public field35: int = 35;
  public field36: int = 36;
  public field37: int = 37;
  public field38: int = 38;
  public field39: int = 39;
  public field40: int = 40;
  public field41: int = 41;
  public field42: int = 42;
  public field43: int = 43;
  public field44: int = 44;
  public field45: int = 45;
  public field46: int = 46;
  public field47: int = 47;
  public field48: int = 48;
  public field49: int = 49;
  public field50: int = 50;
  public field51: int = 51;
  public field52: int = 52;
  public field53: int = 53;
  public field54: int = 54;
  public field55: int = 55;
  public field56: int = 56;
  public field57: int = 57;
  public field58: int = 58;
  public field59: int = 59;
  public field60: int = 60;
  public field61: int = 61;
  public field62: int = 62;
  public field63: int = 63;
  public field64: int = 64;
  public field65: int = 65;
  public field66: int = 66;
  public field67: int = 67;
  public field68: int = 68;
  public field69: int = 69;
  public field70: int = 70;
  public field71: int = 71;
  public field72: int = 72;
  public field73: int = 73;
  public field74: int = 74;
  public field75: int = 75;
  public field76: int = 76;
  public field77: int = 77;
  public field78: int = 78;
  public field79: int = 79;
  public field80: int = 80;
  public field81: int = 81;
  public field82: int = 82;
  public field83: int = 83;
  public field84: int = 84;
  public field85: int = 85;
  public field86: int = 86;
  public field87: int = 87;
  public field88: int = 88;
  public field89: int = 89;
  public field90: int = 90;
  public field91: int = 91;
  public field92: int = 92;
  public field93: int = 93;
  public field94: int = 94;
  public field95: int = 95;
  public field96: int = 96;
  public field97: int = 97;
  public field98: int = 98;
  public field99: int = 99;
  public field100: int = 100;
}

class OuterClass015 {
  public inner: InnerClass015 = new InnerClass015();
  public name: string = 'outer';
}

class InnerClass015 {
  public value: string = 'inner';
}

abstract class AbstractClass016 {
  public abstract method(): void;
}

interface MyInterface017 {
  method(): void;
}

enum TestEnum018 {
  VALUE1,
  VALUE2
}

class NoDefaultConstructor020 {
  public value: string;
  public constructor(value: string) {
    this.value = value;
  }
}

class PrivateConstructor021 {
  private static instance: PrivateConstructor021 = new PrivateConstructor021();
  private constructor() {}
  public static getInstance(): PrivateConstructor021 {
    return PrivateConstructor021.instance;
  }
}

class ProtectedConstructor022 {
  protected constructor() {}
}

class InitFailClass023 {
  static {
    if (true) {
      throw new Error('static field init failed');
    }
  }
  public static readonly value: int = 1;
}

class StaticInitFailClass024 {
  static {
    if (true) {
      throw new Error('static init failed');
    }
  }
}

class ConstructorErrorClass025 {
  public constructor() {
    throw new Error('constructor error');
  }
}

class CustomError026 extends Error {
  public errorCode: int;
  constructor(message: string, errCode: int) {
    super(message);
    this.name = 'CustomError026';
    this.errorCode = errCode;
  }
}

class CustomConstructorError026 {
  public constructor() {
    throw new CustomError026('custom error', 500);
  }
}

class ConditionalConstructorError027 {
  private static shouldFail: boolean = true;
  public constructor() {
    if (ConditionalConstructorError027.shouldFail) {
      throw new Error('conditional error');
    }
  }
}

class LargeMemoryClass028 {
  public constructor() {
    throw new Error('constructor allocation failed');
  }
}

class HugeClass029 {
  public constructor() {
    throw new Error('huge object construction failed');
  }
}

class DeprecatedClass030 {
  public value: string = 'deprecated';
}

class AnnotatedClass031 {
  public data: string = 'annotated';
}

class ConcurrentClass038 {
  public value: int = 0;
}

class EmptyClass039 {}

class ReadonlyFieldsClass040 {
  public readonly readonlyField: string = 'readonly';
  public normalField: int = 100;
}

class StaticFieldsClass041 {
  public static staticValue: int = 999;
  public instanceValue: string = 'instance';
}

class SpecialCharClass042 {
  public 中文字段: string = '中文';
  public _privateField: string = 'private';
  public $dollarField: string = 'dollar';
}

class TestClass043 {
  public data: string = 'test';
}

class TestClass044 {
  public static initialized: boolean = false;
  static {
    TestClass044.initialized = true;
  }
}

class TestClass045 {
  public value: int = 100;
}

class ChildClass046 extends ParentClass046 {
  public childField: int = 100;
}

class ParentClass046 {
  public parentField: string = 'parent';
}

class ChildClass047 extends ParentClass047 {
  public childData: int = 200;
}

class ParentClass047 {
  public parentData: string = 'parent data';
}

class PerformanceTest048 {
  public id: int = 0;
  public value: string = 'performance test';
}

class MemoryTest049 {
  public data: Array<int> = [1, 2, 3, 4, 5];
}

class Factory050 {
  public static createProduct<T>(productClass: Class, ...args: Array<Object>): T {
    return productClass.createInstance() as T;
  }
}

class ProductB050 implements Product050 {
  public getName(): string {
    return 'ProductB050';
  }
}

class ProductA050 implements Product050 {
  public getName(): string {
    return 'ProductA050';
  }
}

interface Product050 {
  getName(): string;
}

class Controller051 {
  private service: Service051 = new Service051();
  public execute(): string {
    return this.service.doWork();
  }
}

class Service051 {
  public doWork(): string {
    return 'work done';
  }
}

class PluginManager052 {
  public static loadPlugin<T>(pluginClass: Class): T {
    let plugin = pluginClass.createInstance() as T;
    return plugin;
  }
}

class MyPlugin052 implements Plugin052 {
  public initialize(): void {
  }
  public execute(): string {
    return 'plugin executed';
  }
}

interface Plugin052 {
  initialize(): void;
  execute(): string;
}

class TypedClass053 {
  public value: string = 'typed';
}

class ClassB054 {
  public fieldB: int = 100;
}

class ClassA054 {
  public fieldA: string = 'A';
}

class AllFieldsClass055 {
  public field1: string = 'field1';
  public field2: int = 2;
  public field3: boolean = true;
  public field4: double = 3.14;
  public field5: Array<int> = [1, 2, 3];
}

class MethodClass056 {
  public value: string = 'method';
  public getValue(): string {
    return this.value;
  }
  public setValue(val: string): void {
    this.value = val;
  }
}

export default function ClassCreateInstanceTest(): void {
  describe('ClassCreateInstanceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0100
     * @tc.name testClassCreateInstance001
     * @tc.desc Verify ClassCreateInstance case 001: Class.from<MyClass001>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let obj = cls.createInstance() as MyClass001;
      expect(obj !== null).assertTrue();
      expect(obj.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0200
     * @tc.name testClassCreateInstance002
     * @tc.desc Verify ClassCreateInstance case 002: invalid input throws ClassCastError, Class.from<MyClass002>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      try {
        let obj = looseReflect(cls as Object).createInstance(['extra']) as MyClass002;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0300
     * @tc.name testClassCreateInstance003
     * @tc.desc Verify ClassCreateInstance case 003: Class.from<NormalClass003>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NormalClass003>();
      let obj = cls.createInstance() as NormalClass003;
      expect(obj.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0400
     * @tc.name testClassCreateInstance004
     * @tc.desc Verify ClassCreateInstance case 004: Class.from<FinalClass004>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass004>();
      let obj = cls.createInstance() as FinalClass004;
      expect(obj.data).assertEqual('final');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0500
     * @tc.name testClassCreateInstance005
     * @tc.desc Verify ClassCreateInstance case 005: Class.from<GenericClass005<string>>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass005<string>>();
      let obj = cls.createInstance() as GenericClass005<string>;
      expect(obj.data).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0600
     * @tc.name testClassCreateInstance006
     * @tc.desc Verify ClassCreateInstance case 006: Class.from<ChildClass006>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass006>();
      let obj = cls.createInstance() as ChildClass006;
      expect(obj.parentField).assertEqual('parent');
      expect(obj.childField).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0700
     * @tc.name testClassCreateInstance007
     * @tc.desc Verify ClassCreateInstance case 007: Class.from<MyClass007>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let obj = cls.createInstance() as MyClass007;
      expect(obj !== null).assertTrue();
      expect(obj instanceof MyClass007).assertTrue();
      expect(obj.name).assertEqual('default');
      expect(obj.age).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0800
     * @tc.name testClassCreateInstance008
     * @tc.desc Verify ClassCreateInstance case 008: Class.from<MyClass008>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let obj = cls.createInstance();
      expect(typeof obj).assertEqual('object');
      expect(obj instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0900
     * @tc.name testClassCreateInstance009
     * @tc.desc Verify ClassCreateInstance case 009: Class.from<MyClass009>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let obj1 = cls.createInstance() as MyClass009;
      let obj2 = cls.createInstance() as MyClass009;
      expect(obj1 !== obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1000
     * @tc.name testClassCreateInstance010
     * @tc.desc Verify ClassCreateInstance case 010: Class.from<MyClass010>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let obj = cls.createInstance() as MyClass010;
      expect(obj.strValue).assertEqual('default');
      expect(obj.numValue).assertEqual(42);
      expect(obj.boolValue).assertTrue();
      expect(obj.nullValue).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1100
     * @tc.name testClassCreateInstance011
     * @tc.desc Verify ClassCreateInstance case 011: Class.from<MyClass011>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let obj = cls.createInstance() as MyClass011;
      expect(obj.arr.length).assertEqual(3);
      let _rowobj: Array<int> = obj.arr;
      expect(_rowobj[0]).assertEqual(1);
      expect(obj.map instanceof Map).assertTrue();
      expect(obj.set instanceof Set).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1200
     * @tc.name testClassCreateInstance012
     * @tc.desc Verify ClassCreateInstance case 012: Class.from<MyClass012>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let obj = cls.createInstance() as MyClass012;
      expect(obj instanceof MyClass012).assertTrue();
      expect(obj instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1300
     * @tc.name testClassCreateInstance013
     * @tc.desc Verify ClassCreateInstance case 013: Class.from<MyClass013>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass013>();
      let obj = cls1.createInstance();
      let cls2 = Class.of(obj);
      expect(cls2.getName()).assertEqual(cls1.getName());
      expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1400
     * @tc.name testClassCreateInstance014
     * @tc.desc Verify ClassCreateInstance case 014: Class.from<LargeClass014>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass014>();
      let obj = cls.createInstance() as LargeClass014;
      expect(obj.field1).assertEqual(1);
      expect(obj.field100).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1500
     * @tc.name testClassCreateInstance015
     * @tc.desc Verify ClassCreateInstance case 015: Class.from<OuterClass015>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass015>();
      let obj = cls.createInstance() as OuterClass015;
      expect(obj.inner !== null).assertTrue();
      expect(obj.inner.value).assertEqual('inner');
      expect(obj.name).assertEqual('outer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1600
     * @tc.name testClassCreateInstance016
     * @tc.desc Verify ClassCreateInstance case 016: invalid call throws Error, Class.from<AbstractClass016>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass016>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1700
     * @tc.name testClassCreateInstance017
     * @tc.desc Verify ClassCreateInstance case 017: invalid call throws Error, Class.from<MyInterface017>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface017>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1800
     * @tc.name testClassCreateInstance018
     * @tc.desc Verify ClassCreateInstance case 018: invalid call throws Error, Class.from<TestEnum018>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum018>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1900
     * @tc.name testClassCreateInstance019
     * @tc.desc Verify ClassCreateInstance case 019: invalid call throws Error, Class.from<int | string>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2000
     * @tc.name testClassCreateInstance020
     * @tc.desc Verify ClassCreateInstance case 020: invalid call throws Error, Class.from<NoDefaultConstructor020>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoDefaultConstructor020>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2100
     * @tc.name testClassCreateInstance021
     * @tc.desc Verify ClassCreateInstance case 021: invalid call throws Error, Class.from<PrivateConstructor021>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateConstructor021>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2200
     * @tc.name testClassCreateInstance022
     * @tc.desc Verify ClassCreateInstance case 022: invalid call throws Error, Class.from<ProtectedConstructor022>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedConstructor022>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2300
     * @tc.name testClassCreateInstance023
     * @tc.desc Verify ClassCreateInstance case 023: invalid call throws Error, Class.from<InitFailClass023>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InitFailClass023>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2400
     * @tc.name testClassCreateInstance024
     * @tc.desc Verify ClassCreateInstance case 024: invalid call throws Error, Class.from<StaticInitFailClass024>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticInitFailClass024>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2500
     * @tc.name testClassCreateInstance025
     * @tc.desc Verify ClassCreateInstance case 025: invalid call throws Error, Class.from<ConstructorErrorClass025>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstructorErrorClass025>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(error.message).assertEqual('constructor error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2600
     * @tc.name testClassCreateInstance026
     * @tc.desc Verify ClassCreateInstance case 026: invalid call throws Error, Class.from<CustomConstructorError026>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomConstructorError026>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError026).assertEqual(true);
        expect((error as CustomError026).errorCode).assertEqual(500);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2700
     * @tc.name testClassCreateInstance027
     * @tc.desc Verify ClassCreateInstance case 027: invalid call throws Error, Class.from<ConditionalConstructorError027>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConditionalConstructorError027>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2800
     * @tc.name testClassCreateInstance028
     * @tc.desc Verify ClassCreateInstance case 028: invalid call throws Error, Class.from<LargeMemoryClass028>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeMemoryClass028>();
      try {
        cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2900
     * @tc.name testClassCreateInstance029
     * @tc.desc Verify ClassCreateInstance case 029: invalid call throws Error, Class.from<HugeClass029>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HugeClass029>();
      try {
        cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3000
     * @tc.name testClassCreateInstance030
     * @tc.desc Verify ClassCreateInstance case 030: Class.from<DeprecatedClass030>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DeprecatedClass030>();
      let obj = cls.createInstance() as DeprecatedClass030;
      expect(obj.value).assertEqual('deprecated');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3100
     * @tc.name testClassCreateInstance031
     * @tc.desc Verify ClassCreateInstance case 031: Class.from<AnnotatedClass031>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AnnotatedClass031>();
      let obj = cls.createInstance() as AnnotatedClass031;
      expect(obj.data).assertEqual('annotated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3200
     * @tc.name testClassCreateInstance032
     * @tc.desc Verify ClassCreateInstance case 032: invalid call throws Error, createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_BOOLEAN;
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3300
     * @tc.name testClassCreateInstance033
     * @tc.desc Verify ClassCreateInstance case 033: invalid call throws Error, createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_INT;
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3400
     * @tc.name testClassCreateInstance034
     * @tc.desc Verify ClassCreateInstance case 034: invalid call throws Error, createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_VOID;
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3500
     * @tc.name testClassCreateInstance035
     * @tc.desc Verify ClassCreateInstance case 035: invalid call throws Error, Class.from<FixedArray<int>>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArray<int>>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3600
     * @tc.name testClassCreateInstance036
     * @tc.desc Verify ClassCreateInstance case 036: invalid call throws Error, Class.from<Map<int, string>>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<int, string>>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3700
     * @tc.name testClassCreateInstance037
     * @tc.desc Verify ClassCreateInstance case 037: invalid call throws Error, Class.from<Set<int>>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<int>>();
      try {
        let obj = cls.createInstance();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3800
     * @tc.name testClassCreateInstance038
     * @tc.desc Verify ClassCreateInstance case 038: Class.from<ConcurrentClass038>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcurrentClass038>();
      let a = cls.createInstance() as ConcurrentClass038;
      a.value = 1;
      let b = cls.createInstance() as ConcurrentClass038;
      b.value = 2;
      expect(a.value).assertEqual(1);
      expect(b.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3900
     * @tc.name testClassCreateInstance039
     * @tc.desc Verify ClassCreateInstance case 039: Class.from<EmptyClass039>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass039>();
      let obj = cls.createInstance() as EmptyClass039;
      expect(obj !== null).assertTrue();
      expect(obj instanceof EmptyClass039).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4000
     * @tc.name testClassCreateInstance040
     * @tc.desc Verify ClassCreateInstance case 040: Class.from<ReadonlyFieldsClass040>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyFieldsClass040>();
      let obj = cls.createInstance() as ReadonlyFieldsClass040;
      expect(obj.readonlyField).assertEqual('readonly');
      expect(obj.normalField).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4100
     * @tc.name testClassCreateInstance041
     * @tc.desc Verify ClassCreateInstance case 041: Class.from<StaticFieldsClass041>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticFieldsClass041>();
      let obj = cls.createInstance() as StaticFieldsClass041;
      expect(obj.instanceValue).assertEqual('instance');
      expect(StaticFieldsClass041.staticValue).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4200
     * @tc.name testClassCreateInstance042
     * @tc.desc Verify ClassCreateInstance case 042: Class.from<SpecialCharClass042>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialCharClass042>();
      let obj = cls.createInstance() as SpecialCharClass042;
      expect(obj.中文字段).assertEqual('中文');
      expect(obj._privateField).assertEqual('private');
      expect(obj.$dollarField).assertEqual('dollar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4300
     * @tc.name testClassCreateInstance043
     * @tc.desc Verify ClassCreateInstance case 043: Class.from<TestClass043>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass043>();
      expect(cls.getName()).assertEqual('entry.src.main.src.test.class.ClassCreateInstanceTest.test.TestClass043');
      let obj = cls.createInstance() as TestClass043;
      expect(obj.data).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4400
     * @tc.name testClassCreateInstance044
     * @tc.desc Verify ClassCreateInstance case 044: Class.from<TestClass044>(), createInstance succeeds, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass044>();
      cls.initialize();
      expect(TestClass044.initialized).assertTrue();
      let obj = cls.createInstance() as TestClass044;
      expect(obj !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4500
     * @tc.name testClassCreateInstance045
     * @tc.desc Verify ClassCreateInstance case 045: Class.from<TestClass045>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass045>();
      let obj = cls.createInstance() as TestClass045;
      expect(obj.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4600
     * @tc.name testClassCreateInstance046
     * @tc.desc Verify ClassCreateInstance case 046: Class.from<ChildClass046>(), isSubtypeOf relationship verified, createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass046>();
      let parentCls = Class.from<ParentClass046>();
      expect(childCls.isSubtypeOf(parentCls)).assertTrue();
      let obj = childCls.createInstance() as ChildClass046;
      expect(obj.parentField).assertEqual('parent');
      expect(obj.childField).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4700
     * @tc.name testClassCreateInstance047
     * @tc.desc Verify ClassCreateInstance case 047: Class.from<ChildClass047>(), getSuper returns expected parent Class, createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass047>();
      let parentCls = childCls.getSuper();
      expect(parentCls !== null).assertTrue();
      expect(parentCls!.getName()).assertEqual(Class.from<ParentClass047>().getName());
      let obj = childCls.createInstance() as ChildClass047;
      expect(obj.parentData).assertEqual('parent data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4800
     * @tc.name testClassCreateInstance048
     * @tc.desc Verify ClassCreateInstance case 048: Class.from<PerformanceTest048>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PerformanceTest048>();
      let startTime = Date.now();
      for (let i = 0; i < 10000; i++) {
        let obj = cls.createInstance() as PerformanceTest048;
        obj.id = i;
      }
      let endTime = Date.now();
      let duration = endTime - startTime;
      console.info(`createInstance 10000 calls: ${duration}ms`);
      expect(duration < 1000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4900
     * @tc.name testClassCreateInstance049
     * @tc.desc Verify ClassCreateInstance case 049: Class.from<MemoryTest049>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MemoryTest049>();
      let instances: Array<MemoryTest049> = [];
      for (let i = 0; i < 1000; i++) {
        instances.push(cls.createInstance() as MemoryTest049);
      }
      expect(instances.length).assertEqual(1000);
      for (let obj of instances) {
        expect(obj.data.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5000
     * @tc.name testClassCreateInstance050
     * @tc.desc Verify ClassCreateInstance case 050: Class.from<ProductA050>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let productA = Factory050.createProduct<ProductA050>(Class.from<ProductA050>());
      expect(productA.getName()).assertEqual('ProductA050');
      let productB = Factory050.createProduct<ProductB050>(Class.from<ProductB050>());
      expect(productB.getName()).assertEqual('ProductB050');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5100
     * @tc.name testClassCreateInstance051
     * @tc.desc Verify ClassCreateInstance case 051: Class.from<Controller051>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let controllerCls = Class.from<Controller051>();
      let controller = controllerCls.createInstance() as Controller051;
      expect(controller.execute()).assertEqual('work done');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5200
     * @tc.name testClassCreateInstance052
     * @tc.desc Verify ClassCreateInstance case 052: Class.from<MyPlugin052>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plugin = PluginManager052.loadPlugin<MyPlugin052>(Class.from<MyPlugin052>());
      expect(plugin.execute()).assertEqual('plugin executed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5300
     * @tc.name testClassCreateInstance053
     * @tc.desc Verify ClassCreateInstance case 053: Class.from<TypedClass053>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypedClass053>();
      let obj = cls.createInstance() as TypedClass053;
      expect(obj.value).assertEqual('typed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5400
     * @tc.name testClassCreateInstance054
     * @tc.desc Verify ClassCreateInstance case 054: invalid input throws ClassCastError, Class.from<ClassA054>(), createInstance failure path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<ClassA054>();
      let instance = clsA.createInstance() as ClassA054;
      expect(instance.fieldA).assertEqual('A');

      try {
        let asB: ClassB054 = instance as ClassB054;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5500
     * @tc.name testClassCreateInstance055
     * @tc.desc Verify ClassCreateInstance case 055: Class.from<AllFieldsClass055>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllFieldsClass055>();
      let obj = cls.createInstance() as AllFieldsClass055;
      expect(obj.field1).assertEqual('field1');
      expect(obj.field2).assertEqual(2);
      expect(obj.field3).assertTrue();
      expect(obj.field4).assertEqual(3.14);
      expect(obj.field5.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5600
     * @tc.name testClassCreateInstance056
     * @tc.desc Verify ClassCreateInstance case 056: Class.from<MethodClass056>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassCreateInstance056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MethodClass056>();
      let obj = cls.createInstance() as MethodClass056;
      expect(obj.getValue()).assertEqual('method');
      obj.setValue('new value');
      expect(obj.getValue()).assertEqual('new value');
    });

  });
}