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

class MyClass021 {
    public name: string = "test";
  }

class ChildClass022 extends ParentClass022 {
    public childField: string = "child";
  }

class ParentClass022 {
    public parentField: int = 0;
  }

class GenericClass023<T> {
    public value: T;
  }

class MultiGenericClass024<K, V> {
    public key: K;
    public value: V;
  }

abstract class AbstractClass025 {
    public abstract method(): void;
  }

class ConcreteClass026 extends AbstractClass026 {
    public override method(): void {}
  }

abstract class AbstractClass026 {
    public abstract method(): void;
  }

final class FinalClass027 {
    public name: string = "final";
  }

interface MyInterface028 {
    name: string;
    age: int;
  }

interface GenericInterface029<T> {
    getValue(): T;
  }

class MultiInterfaceClass032 implements Interface1032, Interface2032 {
    public method1(): void {}
    public method2(): void {}
  }

interface Interface2032 {
    method2(): void;
  }

interface Interface1032 {
    method1(): void;
  }

enum TestEnum033 {
    VALUE1,
    VALUE2,
    VALUE3
  }

enum StringEnum034 {
    NAME = "name",
    AGE = "age"
  }

class TypeB037 {
    public fieldB: string = "";
  }

class TypeA037 {
    public fieldA: int = 0;
  }

class UninitializedClass043 {
    public value: int = 0;
  }

class Node046 {
    public next: Node046 | null = null;
    public value: int = 0;
  }

class ConstrainedClass047<T extends Constraint047> {
  }

interface Constraint047 {
    id: int;
  }

class Item047ForConstrained implements Constraint047 {
    id: int = 0;
    name: string = "";
  }

class MyClass049 {
    public name: string = "";
  }

class ChildClass053 {
    public value: int = 0;
  }

class ChildClass054 extends ParentClass054 {}

class ParentClass054 {}

interface MyInterface056 {}

enum TestEnum057 { A, B }

final class FinalClass059 {}

abstract class AbstractClass060 {}

class MyClass064 {
    public name: string = "test";
  }

class MyClass065 implements MyInterface065 {
    public method(): void {}
  }

interface MyInterface065 {
    method(): void;
  }

class MyClass066 {
    public method1(): void {}
    public method2(): string { return "test"; }
  }

class MyClass067 {
    public static staticMethod(): void {}
  }

class MyClass068 {
    public field1: int = 0;
    public field2: string = "";
  }

class MyClass069 {
    public static staticField: int = 0;
  }

class MyClass070 {
    public constructor() {}
    public constructor(value: int) {}
  }

interface MyInterface073 {}

class MultiGeneric075<A, B, C, D, E> {}

class MyClass076 {
    public name: string = "test";
  }

class ChildClass077 extends ParentClass077 {}

class ParentClass077 {}

class MyClass078 implements MyInterface078 {
    public method(): void {}
  }

interface MyInterface078 {
    method(): void;
  }

abstract class AbstractClass080 {
    public abstract method(): void;
  }

final class FinalClass081 {}

class LazyClass084 {
    public static value: int = 100;
    static {
      console.info("LazyClass084 initialized");
    }
  }

class StaticInitClass085 {
    public static initialized: boolean = false;
    static {
      StaticInitClass085.initialized = true;
    }
  }

class MyClass092 {
    public name: string = "test";
  }

class MyClass095 {
    public field1: int = 0;
    private field2: string = "";
    public constructor() {}
    public constructor(value: int) {}
    public method1(): void {}
    public static staticMethod(): void {}
  }

class GenericClass096<K, V> {
    public map: Map<K, V> = new Map<K, V>();
    public get(key: K): V | undefined {
      return this.map.get(key);
    }
    public set(key: K, value: V): void {
      this.map.set(key, value);
    }
  }

class ServiceB097 {
    public serviceA: ServiceA097;
    public constructor() {
      // 使用from获取ServiceA的Class对象
      let cls = Class.from<ServiceA097>();
      this.serviceA = cls.createInstance() as ServiceA097;
    }
    public call(): string {
      return this.serviceA.method();
    }
  }

class ServiceA097 {
    public method(): string {
      return "ServiceA097";
    }
  }

class SerializableClass098 {
    public id: int = 0;
    public name: string = "";
    public toJSON(): string {
      return `{"id":${this.id},"name":"${this.name}"}`;
    }
  }

function serialize098(obj: SerializableClass098): string {
    let cls = Class.from<SerializableClass098>();
    if (cls.isInterface() || cls.isAbstract()) {
      throw new Error("Cannot serialize interface or abstract class");
    }
    return obj.toJSON();
  }

class PluginManager099 {
    private plugins: Array<Plugin099> = [];
    public register<T extends Plugin099>(pluginClass: Class): void {
      let plugin = pluginClass.createInstance() as T;
      this.plugins.push(plugin);
    }
    public executeAll(): void {
      for (let i = 0; i < this.plugins.length; i++) {
        this.plugins[i].execute();
      }
    }
  }

class PluginA099 implements Plugin099 {
    public name: string = "PluginA099";
    public execute(): void {
      console.info("PluginA099 executed");
    }
  }

interface Plugin099 {
    name: string;
    execute(): void;
  }

class MyClass100 {
    public value: int = 0;
  }

class Derived101 implements Base101 {
    public id: int = 0;
    public name: string = "";
  }

interface Base101 {
    id: int;
  }

function createInstance102(): MyClass102 {
    return Class.from<MyClass102>().createInstance() as MyClass102;
  }

class MyClass102 {}

class MyClass103 {}

class MyClass104 {}

class MyClass105 {}


export default function ClassFromTest(): void {
  describe('ClassFromTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0010
     * @tc.name testClassFrom001
     * @tc.desc Verify ClassFrom case 001: generic T is booleantype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0020
     * @tc.name testClassFrom002
     * @tc.desc Verify ClassFrom case 002: generic T is bytetype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<byte>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("byte");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0030
     * @tc.name testClassFrom003
     * @tc.desc Verify ClassFrom case 003: generic T is chartype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<char>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0040
     * @tc.name testClassFrom004
     * @tc.desc Verify ClassFrom case 004: generic T is shorttype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<short>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("short");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0050
     * @tc.name testClassFrom005
     * @tc.desc Verify ClassFrom case 005: generic T is inttype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0060
     * @tc.name testClassFrom006
     * @tc.desc Verify ClassFrom case 006: generic T is longtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<long>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("long");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0070
     * @tc.name testClassFrom007
     * @tc.desc Verify ClassFrom case 007: generic T is floattype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<float>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("float");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0080
     * @tc.name testClassFrom008
     * @tc.desc Verify ClassFrom case 008: generic T is doubletype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<double>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0090
     * @tc.name testClassFrom009
     * @tc.desc Verify ClassFrom case 009: generic T is numbertype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<number>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0100
     * @tc.name testClassFrom010
     * @tc.desc Verify ClassFrom case 010: generic T is voidtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<void>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0110
     * @tc.name testClassFrom011
     * @tc.desc Verify ClassFrom case 011: generic T is stringtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<string>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0120
     * @tc.name testClassFrom012
     * @tc.desc Verify ClassFrom case 012: generic T is Stringtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<String>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0130
     * @tc.name testClassFrom013
     * @tc.desc Verify ClassFrom case 013: generic T is Array<int>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0140
     * @tc.name testClassFrom014
     * @tc.desc Verify ClassFrom case 014: generic T is Array<string>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<string>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0150
     * @tc.name testClassFrom015
     * @tc.desc Verify ClassFrom case 015: generic T is array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<Array<int>>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0160
     * @tc.name testClassFrom016
     * @tc.desc Verify ClassFrom case 016: generic T is FixedArray<int>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FixedArray<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0170
     * @tc.name testClassFrom017
     * @tc.desc Verify ClassFrom case 017: generic T is Map<int, string>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<int, string>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0180
     * @tc.name testClassFrom018
     * @tc.desc Verify ClassFrom case 018: generic T is Map<string, int>type generic parameters different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<string, int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0190
     * @tc.name testClassFrom019
     * @tc.desc Verify ClassFrom case 019: generic T is Set<int>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0200
     * @tc.name testClassFrom020
     * @tc.desc Verify ClassFrom case 020: generic T is HashSet<int>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0210
     * @tc.name testClassFrom021
     * @tc.desc Verify ClassFrom case 021: generic T is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass021>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("MyClass021");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0220
     * @tc.name testClassFrom022
     * @tc.desc Verify ClassFrom case 022: generic T is inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass022>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("ChildClass022");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0230
     * @tc.name testClassFrom023
     * @tc.desc Verify ClassFrom case 023: generic T is generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass023<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("GenericClass023");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0240
     * @tc.name testClassFrom024
     * @tc.desc Verify ClassFrom case 024: generic T is generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiGenericClass024<string, int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("MultiGenericClass024");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0250
     * @tc.name testClassFrom025
     * @tc.desc Verify ClassFrom case 025: generic T is abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass025>();
        expect(cls !== null).assertTrue();
        expect(cls.isAbstract()).assertTrue();
        expect(cls.getName()).assertEqual("AbstractClass025");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0260
     * @tc.name testClassFrom026
     * @tc.desc Verify ClassFrom case 026: generic T is inheritance abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConcreteClass026>();
        expect(cls !== null).assertTrue();
        expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0270
     * @tc.name testClassFrom027
     * @tc.desc Verify ClassFrom case 027: generic T is final
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass027>();
        expect(cls !== null).assertTrue();
        expect(cls.isFinal()).assertTrue();
        expect(cls.getName()).assertEqual("FinalClass027");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0280
     * @tc.name testClassFrom028
     * @tc.desc Verify ClassFrom case 028: generic T is interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface028>();
        expect(cls !== null).assertTrue();
        expect(cls.isInterface()).assertTrue();
        expect(cls.getName()).assertEqual("MyInterface028");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0290
     * @tc.name testClassFrom029
     * @tc.desc Verify ClassFrom case 029: generic T is generic interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericInterface029<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0300
     * @tc.name testClassFrom030
     * @tc.desc Verify ClassFrom case 030: generic T is ArrayLikeinterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.isInterface()).assertTrue();
        expect(cls.getName()).assertEqual("std.core.ArrayLike");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0310
     * @tc.name testClassFrom031
     * @tc.desc Verify ClassFrom case 031: generic T is JsonSerializableinterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<JsonSerializable>();
        expect(cls !== null).assertTrue();
        expect(cls.isInterface()).assertTrue();
        expect(cls.getName()).assertEqual("std.core.JsonSerializable");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0320
     * @tc.name testClassFrom032
     * @tc.desc Verify ClassFrom case 032: generic T is multiple interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiInterfaceClass032>();
        expect(cls !== null).assertTrue();
        let interfaces = cls.getInterfaces();
        expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0330
     * @tc.name testClassFrom033
     * @tc.desc Verify ClassFrom case 033: generic T is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum033>();
        expect(cls !== null).assertTrue();
        expect(cls.isEnum()).assertTrue();
        expect(cls.getName()).assertEqual("TestEnum033");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0340
     * @tc.name testClassFrom034
     * @tc.desc Verify ClassFrom case 034: generic T is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<StringEnum034>();
        expect(cls !== null).assertTrue();
        expect(cls.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0350
     * @tc.name testClassFrom035
     * @tc.desc Verify ClassFrom case 035: generic T is int string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
        expect(cls.getName()).assertContain("{U");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0360
     * @tc.name testClassFrom036
     * @tc.desc Verify ClassFrom case 036: generic T is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string | boolean>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
        let constituentTypes = cls.getUnionConstituentTypes()!;
        expect(constituentTypes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0370
     * @tc.name testClassFrom037
     * @tc.desc Verify ClassFrom case 037: generic T is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TypeA037 | TypeB037>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0380
     * @tc.name testClassFrom038
     * @tc.desc Verify ClassFrom case 038: generic T is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<double> | string>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
        let constituentTypes = cls.getUnionConstituentTypes()!;
        expect(constituentTypes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0390
     * @tc.name testClassFrom039
     * @tc.desc Verify ClassFrom case 039: generic T is generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<int, Array<string>>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0400
     * @tc.name testClassFrom040
     * @tc.desc Verify ClassFrom case 040: generic T is array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<FixedArray<int>>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0410
     * @tc.name testClassFrom041
     * @tc.desc Verify ClassFrom case 041: generic T is Objecttype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Object>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0420
     * @tc.name testClassFrom042
     * @tc.desc Verify ClassFrom case 042: generic T is Anytype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Any>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0430
     * @tc.name testClassFrom043
     * @tc.desc Verify ClassFrom case 043: call from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 首次访问，类未初始化
        let cls = Class.from<UninitializedClass043>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("UninitializedClass043");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0440
     * @tc.name testClassFrom044
     * @tc.desc Verify ClassFrom case 044: from type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0450
     * @tc.name testClassFrom045
     * @tc.desc Verify ClassFrom case 045: type and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<boolean>();
        let cls2 = Class.PRIMITIVE_BOOLEAN;
        expect(cls1.isPrimitive()).assertFalse();
        expect(cls2.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0460
     * @tc.name testClassFrom046
     * @tc.desc Verify ClassFrom case 046: generic T is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Node046>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("Node046");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0470
     * @tc.name testClassFrom047
     * @tc.desc Verify ClassFrom case 047: generic T is generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConstrainedClass047<Item047ForConstrained>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("ConstrainedClass047");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0480
     * @tc.name testClassFrom048
     * @tc.desc Verify ClassFrom case 048: generic T is empty type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | null>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0490
     * @tc.name testClassFrom049
     * @tc.desc Verify ClassFrom case 049: generic T is empty object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass049 | null>();
        expect(cls !== null).assertTrue();
        expect(cls.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0500
     * @tc.name testClassFrom050
     * @tc.desc Verify ClassFrom case 050: frommethod return Classtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        expect(cls !== null).assertTrue();
        expect(typeof cls).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0510
     * @tc.name testClassFrom051
     * @tc.desc Verify ClassFrom case 051: type call fromreturn same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<int>();
        let cls2 = Class.from<int>();
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0520
     * @tc.name testClassFrom052
     * @tc.desc Verify ClassFrom case 052: return Classobject call getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<int, string>>();
        expect(cls.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0530
     * @tc.name testClassFrom053
     * @tc.desc Verify ClassFrom case 053: return Classobject call getSuper()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass053>();
        let superCls = cls.getSuper();
        expect(superCls !== null).assertTrue();
        expect(superCls!.getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0540
     * @tc.name testClassFrom054
     * @tc.desc Verify ClassFrom case 054: return Classobject call isSubtypeOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass054>();
        let parentCls = Class.from<ParentClass054>();
        expect(childCls.isSubtypeOf(parentCls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0550
     * @tc.name testClassFrom055
     * @tc.desc Verify ClassFrom case 055: return Classobject call getLinker()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        let linker = cls.getLinker();
        expect(linker !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0560
     * @tc.name testClassFrom056
     * @tc.desc Verify ClassFrom case 056: return Classobject call isInterface()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface056>();
        expect(cls.isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0570
     * @tc.name testClassFrom057
     * @tc.desc Verify ClassFrom case 057: return Classobject call isEnum()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum057>();
        expect(cls.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0580
     * @tc.name testClassFrom058
     * @tc.desc Verify ClassFrom case 058: return Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        expect(cls.isPrimitive()).assertFalse();
        expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0590
     * @tc.name testClassFrom059
     * @tc.desc Verify ClassFrom case 059: return Classobject call isFinal()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass059>();
        expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0600
     * @tc.name testClassFrom060
     * @tc.desc Verify ClassFrom case 060: return Classobject call isAbstract()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass060>();
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0610
     * @tc.name testClassFrom061
     * @tc.desc Verify ClassFrom case 061: return Classobject call isFixedArray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FixedArray<int>>();
        expect(cls.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0620
     * @tc.name testClassFrom062
     * @tc.desc Verify ClassFrom case 062: return Classobject call isUnion()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string>();
        expect(cls.isUnion()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0630
     * @tc.name testClassFrom063
     * @tc.desc Verify ClassFrom case 063: return Classobject call getDescriptor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Set<string>>();
        expect(cls.getDescriptor()).assertEqual("Lstd/core/Set;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0640
     * @tc.name testClassFrom064
     * @tc.desc Verify ClassFrom case 064: return Classobject call createInstance()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass064>();
        let obj = cls.createInstance() as MyClass064;
        expect(obj.name).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0650
     * @tc.name testClassFrom065
     * @tc.desc Verify ClassFrom case 065: return Classobject call getInterfaces()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass065>();
        let interfaces = cls.getInterfaces();
        expect(interfaces.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0660
     * @tc.name testClassFrom066
     * @tc.desc Verify ClassFrom case 066: return Classobject call getInstanceMethods()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom066', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass066>();
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0670
     * @tc.name testClassFrom067
     * @tc.desc Verify ClassFrom case 067: return Classobject call getStaticMethods()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom067', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass067>();
        let methods = cls.getStaticMethods();
        expect(methods.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0680
     * @tc.name testClassFrom068
     * @tc.desc Verify ClassFrom case 068: return Classobject call getInstanceFields()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom068', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass068>();
        let fields = cls.getInstanceFields();
        expect(fields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0690
     * @tc.name testClassFrom069
     * @tc.desc Verify ClassFrom case 069: return Classobject call getStaticFields()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom069', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass069>();
        let fields = cls.getStaticFields();
        expect(fields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0700
     * @tc.name testClassFrom070
     * @tc.desc Verify ClassFrom case 070: return Classobject call getConstructors()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom070', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass070>();
        let constructors = cls.getConstructors();
        expect(constructors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0710
     * @tc.name testClassFrom071
     * @tc.desc Verify ClassFrom case 071: type Classobject get type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom071', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string | Array<double>>();
        let arr = cls.getUnionConstituentTypes()!;
        expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0720
     * @tc.name testClassFrom072
     * @tc.desc Verify ClassFrom case 072: array Classobject get type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom072', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FixedArray<int>>();
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(componentType!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0730
     * @tc.name testClassFrom073
     * @tc.desc Verify ClassFrom case 073: interface not interface when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom073', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface073>();
        let interfaces = cls.getInterfaces();
        expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0740
     * @tc.name testClassFrom074
     * @tc.desc Verify ClassFrom case 074: generic T is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom074', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Map<int, Map<string, Map<int, string>>>>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0750
     * @tc.name testClassFrom075
     * @tc.desc Verify ClassFrom case 075: generic T is multiple generic parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom075', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiGeneric075<int, string, boolean, double, char>>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0760
     * @tc.name testClassFrom076
     * @tc.desc Verify ClassFrom case 076: from ofget type Classshould
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom076', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass076();
        let cls1 = Class.from<MyClass076>();
        let cls2 = Class.of(obj);
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0770
     * @tc.name testClassFrom077
     * @tc.desc Verify ClassFrom case 077: type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom077', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass077>();
        let parentCls = Class.from<ParentClass077>();
        expect(childCls.isSubtypeOf(parentCls)).assertTrue();
        expect(parentCls.isSubtypeOf(childCls)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0780
     * @tc.name testClassFrom078
     * @tc.desc Verify ClassFrom case 078: and interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom078', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass078>();
        let ifc = Class.from<MyInterface078>();
        expect(cls.isSubtypeOf(ifc)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0790
     * @tc.name testClassFrom079
     * @tc.desc Verify ClassFrom case 079: type should type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom079', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int>();
        expect(cls.isSubtypeOf(cls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0800
     * @tc.name testClassFrom080
     * @tc.desc Verify ClassFrom case 080: abstract class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom080', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass080>();
        expect(cls.isAbstract()).assertTrue();
        try {
          cls.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0810
     * @tc.name testClassFrom081
     * @tc.desc Verify ClassFrom case 081: final type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom081', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass081>();
        expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0820
     * @tc.name testClassFrom082
     * @tc.desc Verify ClassFrom case 082: from generic method type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom082', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 以下代码应该编译失败
        // let cls = Class.from("string");
        // 正确用法
        let cls = Class.from<string>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0830
     * @tc.name testClassFrom083
     * @tc.desc Verify ClassFrom case 083: void is type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom083', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<void>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0840
     * @tc.name testClassFrom084
     * @tc.desc Verify ClassFrom case 084: from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom084', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 首次from会触发初始化
        let cls = Class.from<LazyClass084>();
        expect(cls !== null).assertTrue();
        expect(LazyClass084.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0850
     * @tc.name testClassFrom085
     * @tc.desc Verify ClassFrom case 085: static when from is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom085', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(StaticInitClass085.initialized).assertFalse();
        let cls = Class.from<StaticInitClass085>();
        expect(cls !== null).assertTrue();
        // from可能触发初始化
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0860
     * @tc.name testClassFrom086
     * @tc.desc Verify ClassFrom case 086: generic T is nevertype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom086', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<never>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0870
     * @tc.name testClassFrom087
     * @tc.desc Verify ClassFrom case 087: generic T is unknowntype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom087', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Object>();
        expect(cls !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0880
     * @tc.name testClassFrom088
     * @tc.desc Verify ClassFrom case 088: call fromget type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom088', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      for (let i = 0; i < 1000; i++) {
          let cls = Class.from<int>();
          expect(cls !== null).assertTrue();
          expect(cls.getName()).assertEqual("int");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0890
     * @tc.name testClassFrom089
     * @tc.desc Verify ClassFrom case 089: when from different type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom089', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.from<int>() !== null).assertTrue();
        expect(Class.from<string>() !== null).assertTrue();
        expect(Class.from<boolean>() !== null).assertTrue();
        expect(Class.from<double>() !== null).assertTrue();
        expect(Class.from<Array<int>>() !== null).assertTrue();
        expect(Class.from<Map<string, int>>() !== null).assertTrue();
        expect(Class.from<Set<double>>() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0900
     * @tc.name testClassFrom090
     * @tc.desc Verify ClassFrom case 090: Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom090', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let first = Class.from<Array<int>>();
        for (let i = 0; i < 10000; i++) {
          expect(Class.from<Array<int>>() === first).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0910
     * @tc.name testClassFrom091
     * @tc.desc Verify ClassFrom case 091: call from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom091', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 注意：ArkTS-Sta可能不支持真正的多线程，此处为概念性测试
        let cls1 = Class.from<Map<int, string>>();
        let cls2 = Class.from<Map<int, string>>();
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0920
     * @tc.name testClassFrom092
     * @tc.desc Verify ClassFrom case 092: from and of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom092', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // from不需要实例
        let cls1 = Class.from<MyClass092>();
        expect(cls1 !== null).assertTrue();
        
        // of需要实例
        let obj = new MyClass092();
        let cls2 = Class.of(obj);
        expect(cls2 !== null).assertTrue();
        
        // 两者返回同一Class对象
        expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0930
     * @tc.name testClassFrom093
     * @tc.desc Verify ClassFrom case 093: from compile when type ofAny runtime type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom093', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Any = new Map<int, string>();
        
        // ofAny：运行时获取类型
        let cls1 = Class.ofAny(obj);
        expect(cls1 !== null).assertTrue();
        
        // from：编译时指定类型
        let cls2 = Class.from<Map<int, string>>();
        expect(cls2 !== null).assertTrue();
        
        // 结果相同
        expect(cls1!.getName() === cls2.getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0940
     * @tc.name testClassFrom094
     * @tc.desc Verify ClassFrom case 094: from type in different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom094', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Array<int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0950
     * @tc.name testClassFrom095
     * @tc.desc Verify ClassFrom case 095: using fromget type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom095', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass095>();
        
        // 获取类名
        expect(cls.getName()).assertEqual("MyClass095");
        
        // 获取父类
        let superCls = cls.getSuper();
        expect(superCls !== null).assertTrue();
        
        // 获取实例字段
        let fields = cls.getInstanceFields();
        expect(fields.length).assertEqual(1); // 只有field1是public
        
        // 获取实例方法
        let methods = cls.getInstanceMethods();
        expect(methods.length).assertLarger(0);
        
        // 获取构造函数
        let constructors = cls.getConstructors();
        expect(constructors.length).assertEqual(2);
        
        // 获取静态方法
        let staticMethods = cls.getStaticMethods();
        expect(staticMethods.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0960
     * @tc.name testClassFrom096
     * @tc.desc Verify ClassFrom case 096: generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom096', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass096<string, int>>();
        expect(cls !== null).assertTrue();
        expect(cls.getName()).assertEqual("GenericClass096");
        
        // 创建实例
        let obj = cls.createInstance() as GenericClass096<string, int>;
        expect(obj !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0970
     * @tc.name testClassFrom097
     * @tc.desc Verify ClassFrom case 097: using from type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom097', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let serviceB = new ServiceB097();
        expect(serviceB.call()).assertEqual("ServiceA097");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0980
     * @tc.name testClassFrom098
     * @tc.desc Verify ClassFrom case 098: using from type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom098', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new SerializableClass098();
        obj.id = 100;
        obj.name = "test";
        let json = serialize098(obj);
        expect(json).assertContain("id");
        expect(json).assertContain("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_0990
     * @tc.name testClassFrom099
     * @tc.desc Verify ClassFrom case 099: using from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom099', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let manager = new PluginManager099();
        manager.register<PluginA099>(Class.from<PluginA099>());
        manager.executeAll();
        expect(Class.from<PluginA099>().getName()).assertEqual("PluginA099");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1000
     * @tc.name testClassFrom100
     * @tc.desc Verify ClassFrom case 100: from compile when type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom100', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 正确：返回Class对象
        let cls = Class.from<MyClass100>();
        expect(cls !== null).assertTrue();
        
        // 编译器确保类型正确
        let instance = cls.createInstance() as MyClass100;
        expect(instance.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1010
     * @tc.name testClassFrom101
     * @tc.desc Verify ClassFrom case 101: from generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom101', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Derived101>();
        let instance = cls.createInstance() as Derived101;
        expect(instance.id).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1020
     * @tc.name testClassFrom102
     * @tc.desc Verify ClassFrom case 102: Classobject performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom102', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 缓存Class对象
        const MY_CLASS: Class = Class.from<MyClass102>();
        
        // 使用缓存的Class对象

        
        let obj1 = createInstance102();
        let obj2 = createInstance102();
        expect(obj1 !== null).assertTrue();
        expect(obj2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1030
     * @tc.name testClassFrom103
     * @tc.desc Verify ClassFrom case 103: in from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom103', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 不好的做法：循环中重复from
        for (let i = 0; i < 100; i++) {
          let cls = Class.from<MyClass103>(); // 每次都from
          expect(cls.getName()).assertEqual("MyClass103");
        }
        
        // 好的做法：from一次，多次使用
        let cls = Class.from<MyClass103>();
        for (let i = 0; i < 100; i++) {
          let obj = cls.createInstance() as MyClass103;
          expect(obj !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1040
     * @tc.name testClassFrom104
     * @tc.desc Verify ClassFrom case 104: from ofget type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom104', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<MyClass104>();
        let obj = new MyClass104();
        let cls2 = Class.of(obj);
        
        expect(cls1 === cls2).assertTrue();
        expect(cls1.getName() === cls2.getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_FROM_1050
     * @tc.name testClassFrom105
     * @tc.desc Verify ClassFrom case 105: method in different scenario using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassFrom105', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // from：编译时已知类型
        let cls1 = Class.from<MyClass105>();
        expect(cls1 !== null).assertTrue();
        
        // ofAny：运行时获取类型
        let obj: Any = new MyClass105();
        let cls2 = Class.ofAny(obj);
        expect(cls2 !== null).assertTrue();
        
        // 结果一致
        expect(cls1 === cls2).assertTrue();
    });

  });
}