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
    // ... 更多字段
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
    public static readonly value: int = (0 as int);
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
    public data: Array<int> = Array.create<int>(1000000000, 0);
  }

class HugeClass029 {
    public field1: int = 0;
    public field2: int = 0;
    // ... 数千个字段
    public field10000: int = 0;
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
    public static createProduct<T>(...args: Array<Object>): T {
      let cls = Class.from<T>();
      return cls.createInstance() as T;
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
      // 初始化逻辑
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
    public field4: float = 3.14;
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
  describe('ClassCreateInstanceTest', () => {
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
     * @tc.desc Verify ClassCreateInstance case 001: createInstancemethod not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let obj = cls.createInstance() as MyClass001;
        expect(obj !== null).assertTrue();
        expect(obj.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0200
     * @tc.name testClassCreateInstance002
     * @tc.desc Verify ClassCreateInstance case 002: parameters createInstanceshould compile error or runtime error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass002>();
        try {
          let obj = looseReflect(cls as Object).createInstance(['extra']) as MyClass002;
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0300
     * @tc.name testClassCreateInstance003
     * @tc.desc Verify ClassCreateInstance case 003: call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NormalClass003>();
        let obj = cls.createInstance() as NormalClass003;
        expect(obj.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0400
     * @tc.name testClassCreateInstance004
     * @tc.desc Verify ClassCreateInstance case 004: final call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass004>();
        let obj = cls.createInstance() as FinalClass004;
        expect(obj.data).assertEqual('final');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0500
     * @tc.name testClassCreateInstance005
     * @tc.desc Verify ClassCreateInstance case 005: generic call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass005<string>>();
        let obj = cls.createInstance() as GenericClass005<string>;
        expect(obj.data).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0600
     * @tc.name testClassCreateInstance006
     * @tc.desc Verify ClassCreateInstance case 006: inheritance call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass006>();
        let obj = cls.createInstance() as ChildClass006;
        expect(obj.parentField).assertEqual('parent');
        expect(obj.childField).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0700
     * @tc.name testClassCreateInstance007
     * @tc.desc Verify ClassCreateInstance case 007: return instance object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 008: verify return Objecttype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass008>();
        let obj = cls.createInstance();
        expect(typeof obj).assertEqual('object');
        expect(obj instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_0900
     * @tc.name testClassCreateInstance009
     * @tc.desc Verify ClassCreateInstance case 009: call createInstancereturn different instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass009>();
        let obj1 = cls.createInstance() as MyClass009;
        let obj2 = cls.createInstance() as MyClass009;
        expect(obj1 !== obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1000
     * @tc.name testClassCreateInstance010
     * @tc.desc Verify ClassCreateInstance case 010: verify field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 011: verify type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 012: using instanceofverify return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass012>();
        let obj = cls.createInstance() as MyClass012;
        expect(obj instanceof MyClass012).assertTrue();
        expect(obj instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1300
     * @tc.name testClassCreateInstance013
     * @tc.desc Verify ClassCreateInstance case 013: using Class.ofverify instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<MyClass013>();
        let obj = cls1.createInstance();
        let cls2 = Class.of(obj);
        expect(cls2.getName()).assertEqual('MyClass013');
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1400
     * @tc.name testClassCreateInstance014
     * @tc.desc Verify ClassCreateInstance case 014: field object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass014>();
        let obj = cls.createInstance() as LargeClass014;
        expect(obj.field1).assertEqual(1);
        expect(obj.field100).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1500
     * @tc.name testClassCreateInstance015
     * @tc.desc Verify ClassCreateInstance case 015: object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OuterClass015>();
        let obj = cls.createInstance() as OuterClass015;
        expect(obj.inner !== null).assertTrue();
        expect(obj.inner.value).assertEqual('inner');
        expect(obj.name).assertEqual('outer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1600
     * @tc.name testClassCreateInstance016
     * @tc.desc Verify ClassCreateInstance case 016: abstract class call createInstancethrow Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass016>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1700
     * @tc.name testClassCreateInstance017
     * @tc.desc Verify ClassCreateInstance case 017: interface type call createInstancethrow Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface017>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1800
     * @tc.name testClassCreateInstance018
     * @tc.desc Verify ClassCreateInstance case 018: type call createInstancethrow Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum018>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_1900
     * @tc.name testClassCreateInstance019
     * @tc.desc Verify ClassCreateInstance case 019: type call createInstancethrow Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2000
     * @tc.name testClassCreateInstance020
     * @tc.desc Verify ClassCreateInstance case 020: parameters constructor when throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoDefaultConstructor020>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2100
     * @tc.name testClassCreateInstance021
     * @tc.desc Verify ClassCreateInstance case 021: constructor when throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PrivateConstructor021>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2200
     * @tc.name testClassCreateInstance022
     * @tc.desc Verify ClassCreateInstance case 022: constructor when throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ProtectedConstructor022>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2300
     * @tc.name testClassCreateInstance023
     * @tc.desc Verify ClassCreateInstance case 023: static field throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<InitFailClass023>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2400
     * @tc.name testClassCreateInstance024
     * @tc.desc Verify ClassCreateInstance case 024: static throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticInitFailClass024>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2500
     * @tc.name testClassCreateInstance025
     * @tc.desc Verify ClassCreateInstance case 025: constructor throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConstructorErrorClass025>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
          expect(error.message).assertEqual('constructor error');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2600
     * @tc.name testClassCreateInstance026
     * @tc.desc Verify ClassCreateInstance case 026: constructor throw error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CustomConstructorError026>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof CustomError026).assertTrue();
          expect((error as CustomError026).errorCode).assertEqual(500);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2700
     * @tc.name testClassCreateInstance027
     * @tc.desc Verify ClassCreateInstance case 027: constructor throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConditionalConstructorError027>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2800
     * @tc.name testClassCreateInstance028
     * @tc.desc Verify ClassCreateInstance case 028: not when throw OutOfMemoryError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 注意：此测试需要特殊环境模拟内存不足

        let cls = Class.from<LargeMemoryClass028>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          // 根据实际环境可能抛出OutOfMemoryError或其他错误
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_2900
     * @tc.name testClassCreateInstance029
     * @tc.desc Verify ClassCreateInstance case 029: object when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<HugeClass029>();
        try {
          let obj = cls.createInstance();
          // 如果成功创建则验证对象
          expect(obj !== null).assertTrue();
        } catch (error) {
          // 可能抛出OutOfMemoryError
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3000
     * @tc.name testClassCreateInstance030
     * @tc.desc Verify ClassCreateInstance case 030: Deprecated call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {

        let cls = Class.from<DeprecatedClass030>();
        let obj = cls.createInstance() as DeprecatedClass030;
        expect(obj.value).assertEqual('deprecated');
        // 可能会有弃用警告
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3100
     * @tc.name testClassCreateInstance031
     * @tc.desc Verify ClassCreateInstance case 031: call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        let cls = Class.from<AnnotatedClass031>();
        let obj = cls.createInstance() as AnnotatedClass031;
        expect(obj.data).assertEqual('annotated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3200
     * @tc.name testClassCreateInstance032
     * @tc.desc Verify ClassCreateInstance case 032: type Classcall createInstanceshould failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_BOOLEAN;
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3300
     * @tc.name testClassCreateInstance033
     * @tc.desc Verify ClassCreateInstance case 033: PRIMITIVE_INTcall createInstanceshould failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3400
     * @tc.name testClassCreateInstance034
     * @tc.desc Verify ClassCreateInstance case 034: PRIMITIVE_VOIDcall createInstanceshould failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_VOID;
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3500
     * @tc.name testClassCreateInstance035
     * @tc.desc Verify ClassCreateInstance case 035: FixedArraytype call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FixedArray<int>>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3600
     * @tc.name testClassCreateInstance036
     * @tc.desc Verify ClassCreateInstance case 036: Maptype call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<int, string>>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3700
     * @tc.name testClassCreateInstance037
     * @tc.desc Verify ClassCreateInstance case 037: Settype call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<int>>();
        try {
          let obj = cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_3800
     * @tc.name testClassCreateInstance038
     * @tc.desc Verify ClassCreateInstance case 038: multiple when call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 039: empty instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass039>();
        let obj = cls.createInstance() as EmptyClass039;
        expect(obj !== null).assertTrue();
        expect(obj instanceof EmptyClass039).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4000
     * @tc.name testClassCreateInstance040
     * @tc.desc Verify ClassCreateInstance case 040: field instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ReadonlyFieldsClass040>();
        let obj = cls.createInstance() as ReadonlyFieldsClass040;
        expect(obj.readonlyField).assertEqual('readonly');
        expect(obj.normalField).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4100
     * @tc.name testClassCreateInstance041
     * @tc.desc Verify ClassCreateInstance case 041: static field instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StaticFieldsClass041>();
        let obj = cls.createInstance() as StaticFieldsClass041;
        expect(obj.instanceValue).assertEqual('instance');
        expect(StaticFieldsClass041.staticValue).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4200
     * @tc.name testClassCreateInstance042
     * @tc.desc Verify ClassCreateInstance case 042: or field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SpecialCharClass042>();
        let obj = cls.createInstance() as SpecialCharClass042;
        expect(obj.中文字段).assertEqual('中文');
        expect(obj._privateField).assertEqual('private');
        expect(obj.$dollarField).assertEqual('dollar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4300
     * @tc.name testClassCreateInstance043
     * @tc.desc Verify ClassCreateInstance case 043: verify Class.from and createInstancewith using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass043>();
        expect(cls.getName()).assertEqual('TestClass043');
        let obj = cls.createInstance() as TestClass043;
        expect(obj.data).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4400
     * @tc.name testClassCreateInstance044
     * @tc.desc Verify ClassCreateInstance case 044: verify initialize after call createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass044>();
        cls.initialize();
        expect(TestClass044.initialized).assertTrue();
        let obj = cls.createInstance() as TestClass044;
        expect(obj !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4500
     * @tc.name testClassCreateInstance045
     * @tc.desc Verify ClassCreateInstance case 045: call initialize createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass045>();
        // 未调用initialize，直接createInstance应该自动初始化
        let obj = cls.createInstance() as TestClass045;
        expect(obj.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4600
     * @tc.name testClassCreateInstance046
     * @tc.desc Verify ClassCreateInstance case 046: using isSubtypeOfverify instance type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 047: using getSuperget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass047>();
        let parentCls = childCls.getSuper();
        expect(parentCls !== null).assertTrue();
        expect(parentCls!.getName()).assertEqual('ParentClass047');
        let obj = childCls.createInstance() as ChildClass047;
        expect(obj.parentData).assertEqual('parent data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4800
     * @tc.name testClassCreateInstance048
     * @tc.desc Verify ClassCreateInstance case 048: call createInstance instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PerformanceTest048>();
        let startTime = Date.now();
        for (let i = 0; i < 10000; i++) {
          let obj = cls.createInstance() as PerformanceTest048;
          obj.id = i;
        }
        let endTime = Date.now();
        let duration = endTime - startTime;
        expect(duration < 1000).assertTrue(); // 应该在1秒内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_4900
     * @tc.name testClassCreateInstance049
     * @tc.desc Verify ClassCreateInstance case 049: verify instance after using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MemoryTest049>();
        let instances: Array<MemoryTest049> = [];
        for (let i = 0; i < 1000; i++) {
          instances.push(cls.createInstance() as MemoryTest049);
        }
        expect(instances.length).assertEqual(1000);
        // 验证所有实例都正确创建
        for (let obj of instances) {
          expect(obj.data.length).assertEqual(5);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5000
     * @tc.name testClassCreateInstance050
     * @tc.desc Verify ClassCreateInstance case 050: via object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let productA = Factory050.createProduct<ProductA050>();
        expect(productA.getName()).assertEqual('ProductA050');
        let productB = Factory050.createProduct<ProductB050>();
        expect(productB.getName()).assertEqual('ProductB050');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5100
     * @tc.name testClassCreateInstance051
     * @tc.desc Verify ClassCreateInstance case 051: using object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let controllerCls = Class.from<Controller051>();
        let controller = controllerCls.createInstance() as Controller051;
        expect(controller.execute()).assertEqual('work done');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5200
     * @tc.name testClassCreateInstance052
     * @tc.desc Verify ClassCreateInstance case 052: using createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let plugin = PluginManager052.loadPlugin<MyPlugin052>(Class.from<MyPlugin052>());
        expect(plugin.execute()).assertEqual('plugin executed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5300
     * @tc.name testClassCreateInstance053
     * @tc.desc Verify ClassCreateInstance case 053: using as type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TypedClass053>();
        let obj = cls.createInstance() as TypedClass053;
        expect(obj.value).assertEqual('typed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5400
     * @tc.name testClassCreateInstance054
     * @tc.desc Verify ClassCreateInstance case 054: error type runtime error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsA = Class.from<ClassA054>();
        let obj = clsA.createInstance() as ClassB054; // 错误的类型转换
        try {
          let value = obj.fieldB;
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CREATEINSTANCE_5500
     * @tc.name testClassCreateInstance055
     * @tc.desc Verify ClassCreateInstance case 055: verify field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassCreateInstance case 056: verify instance after method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCreateInstance056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MethodClass056>();
        let obj = cls.createInstance() as MethodClass056;
        expect(obj.getValue()).assertEqual('method');
        obj.setValue('new value');
        expect(obj.getValue()).assertEqual('new value');
    });

  });
}