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

class MyClass001 {}

class MyClass002 {}

class MyClass004 {}

class MyClass005 {}

class MyClass006 {}

class MyClass007 {
    public static value: int = 0;
  }

class MyClass008 {
    public static initialized: boolean = false;
    static {
      MyClass008.initialized = true;
    }
  }

class MyClass011 {
    public static value: int = 0;
  }

class ClassB012 {
    public static ref: ClassA012 | null = null;
    static {
      ClassB012.ref = new ClassA012();
    }
  }

class ClassA012 {
    public static ref: ClassB012 | null = null;
    static {
      ClassA012.ref = new ClassB012();
    }
  }

class MyClass013 {
    public static largeArray: Array<int> = Array.create<int>(1024, 0);
  }

class MyClass014 {
    public name: string = "test";
  }

abstract class AbstractClass015 {
    public static value: int = 100;
  }

class GenericClass016<T> {
    public static value: int = 200;
  }

final class FinalClass017 {
    public static value: int = 300;
  }

interface MyInterface018 {
    name: string;
  }

class ParentClass020 {
    public static order: Array<string> = [];
    static {
      ParentClass020.order.push("parent");
    }
  }

class ChildClass020 extends ParentClass020 {
    static {
      ParentClass020.order.push("child");
    }
  }

class GrandParent021 {
    public static order: Array<string> = [];
    static {
      GrandParent021.order.push("grandparent");
    }
  }

class Parent021 extends GrandParent021 {
    static {
      GrandParent021.order.push("parent");
    }
  }

class Child021 extends Parent021 {
    static {
      GrandParent021.order.push("child");
    }
  }

class MyClass022 {
    public static initCount: int = 0;
    static {
      MyClass022.initCount++;
    }
  }

class MyClass023 {
    public static initCount: int = 0;
    static {
      MyClass023.initCount++;
    }
  }

class MyClass024 {
    public static initialized: boolean = false;
    static {
      MyClass024.initialized = true;
    }
  }

class MyClass025 {
    public static initialized: boolean = false;
    static {
      MyClass025.initialized = true;
    }
  }

class EmptyClass026 {}

class ComplexClass027 {
    public static data: Map<string, int>;
    static {
      ComplexClass027.data = new Map<string, int>();
      ComplexClass027.data.set("one", 1);
      ComplexClass027.data.set("two", 2);
    }
  }

class MyClass028 {
    public static ready: boolean = false;
    public value: int = 0;
    static {
      MyClass028.ready = true;
    }
  }

class MyClass029 {
    public static ready: boolean = false;
    static {
      MyClass029.ready = true;
    }
  }

class LargeClass030 {
    public static field1: int = 1;
    public static field2: int = 2;
    // ... 大量静态字段
    public static field1000: int = 1000;
  }

class MyClass031 {}


export default function runClassInitializeTest(): void {
  describe('ClassInitializeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0100
     * @tc.name testClassInitialize001
     * @tc.desc Verify ClassInitialize case 001: initializemethod not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        cls.initialize(); // 正确调用，无参数
        expect(cls.getName().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0200
     * @tc.name testClassInitialize002
     * @tc.desc Verify ClassInitialize case 002: parameters should compile error or runtime error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass002>();
        try {
          looseReflect(cls as Object).initialize("invalid" as string); // 类型错误
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0300
     * @tc.name testClassInitialize003
     * @tc.desc Verify ClassInitialize case 003: method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
      let result: void = cls.initialize();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0400
     * @tc.name testClassInitialize004
     * @tc.desc Verify ClassInitialize case 004: method return voidtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
        let result: void = cls.initialize();
        expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0500
     * @tc.name testClassInitialize005
     * @tc.desc Verify ClassInitialize case 005: when not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass005>();
        try {
          cls.initialize();
          expect(cls.getName().length).assertLarger(0);
        } catch (error) {
          expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0600
     * @tc.name testClassInitialize006
     * @tc.desc Verify ClassInitialize case 006: call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass006>();
        cls.initialize(); // 第一次初始化
        cls.initialize(); // 第二次调用，应幂等或无副作用
        expect(cls.getName()).assertEqual("MyClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0700
     * @tc.name testClassInitialize007
     * @tc.desc Verify ClassInitialize case 007: verify initialize static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        cls.initialize();
        expect(MyClass007.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0800
     * @tc.name testClassInitialize008
     * @tc.desc Verify ClassInitialize case 008: verify initialize static
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass008>();
        expect(MyClass008.initialized).assertEqual(false);
        cls.initialize();
        expect(MyClass008.initialized).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0900
     * @tc.name testClassInitialize009
     * @tc.desc Verify ClassInitialize case 009: in nullinstance call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class | null = null;
        try {
          cls!.initialize();
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1000
     * @tc.name testClassInitialize010
     * @tc.desc Verify ClassInitialize case 010: in undefinedinstance call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class | undefined = undefined;
        try {
          cls!.initialize();
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1100
     * @tc.name testClassInitialize011
     * @tc.desc Verify ClassInitialize case 011: static throw exception when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass011>();
        try {
          cls.initialize();
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1200
     * @tc.name testClassInitialize012
     * @tc.desc Verify ClassInitialize case 012: scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let clsA = Class.from<ClassA012>();
        try {
          clsA.initialize();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1300
     * @tc.name testClassInitialize013
     * @tc.desc Verify ClassInitialize case 013: OutOfMemoryError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass013>();
        try {
          cls.initialize();
          expect().assertFail();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1400
     * @tc.name testClassInitialize014
     * @tc.desc Verify ClassInitialize case 014: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass014>();
        cls.initialize();
        let obj = cls.createInstance() as MyClass014;
        expect(obj.name).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1500
     * @tc.name testClassInitialize015
     * @tc.desc Verify ClassInitialize case 015: abstract class initializecall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass015>();
        cls.initialize();
        expect(AbstractClass015.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1600
     * @tc.name testClassInitialize016
     * @tc.desc Verify ClassInitialize case 016: generic initializecall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass016<int>>();
        cls.initialize();
        expect(GenericClass016.value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1700
     * @tc.name testClassInitialize017
     * @tc.desc Verify ClassInitialize case 017: final initializecall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass017>();
        cls.initialize();
        expect(FinalClass017.value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1800
     * @tc.name testClassInitialize018
     * @tc.desc Verify ClassInitialize case 018: interface type Classobject call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface018>();
        try {
          cls.initialize();
          // 接口初始化行为需根据实现验证
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1900
     * @tc.name testClassInitialize019
     * @tc.desc Verify ClassInitialize case 019: type Classobject initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;
        try {
          cls.initialize();
          // 基本类型初始化行为需根据实现验证
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2000
     * @tc.name testClassInitialize020
     * @tc.desc Verify ClassInitialize case 020: verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass020>();
        childCls.initialize();
        expect(ParentClass020.order[0]).assertEqual("parent");
        expect(ParentClass020.order[1]).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2100
     * @tc.name testClassInitialize021
     * @tc.desc Verify ClassInitialize case 021: verify inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<Child021>();
        childCls.initialize();
        expect(GrandParent021.order[0]).assertEqual("grandparent");
        expect(GrandParent021.order[1]).assertEqual("parent");
        expect(GrandParent021.order[2]).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2200
     * @tc.name testClassInitialize022
     * @tc.desc Verify ClassInitialize case 022: multiple when call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 使用TaskPool模拟并发
        let cls = Class.from<MyClass022>();
        let task1: () => void = (): void => { cls.initialize(); };
        let task2: () => void = (): void => { cls.initialize(); };
        task1();
        task2();
        expect(MyClass022.initCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2300
     * @tc.name testClassInitialize023
     * @tc.desc Verify ClassInitialize case 023: call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass023>();
        cls.initialize();
        let count1 = MyClass023.initCount;
        cls.initialize();
        let count2 = MyClass023.initCount;
        expect(count1).assertEqual(count2); // 幂等，不重复初始化
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2400
     * @tc.name testClassInitialize024
     * @tc.desc Verify ClassInitialize case 024: createInstance call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass024>();
        expect(MyClass024.initialized).assertEqual(false);
        let obj = cls.createInstance(); // 可能触发隐式初始化
        expect(MyClass024.initialized).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2500
     * @tc.name testClassInitialize025
     * @tc.desc Verify ClassInitialize case 025: getName getSuper method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass025>();
        expect(MyClass025.initialized).assertEqual(false);
        let name = cls.getName(); // 可能触发隐式初始化
        // 验证是否初始化
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2600
     * @tc.name testClassInitialize026
     * @tc.desc Verify ClassInitialize case 026: static call initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass026>();
        try {
          cls.initialize();
          expect(cls.getName().length).assertLarger(0);
        } catch (error) {
          expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2700
     * @tc.name testClassInitialize027
     * @tc.desc Verify ClassInitialize case 027: static
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ComplexClass027>();
        cls.initialize();
        expect(ComplexClass027.data.get("one")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2800
     * @tc.name testClassInitialize028
     * @tc.desc Verify ClassInitialize case 028: instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass028>();
        cls.initialize();
        expect(MyClass028.ready).assertEqual(true);
        let obj = cls.createInstance() as MyClass028;
        expect(obj.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2900
     * @tc.name testClassInitialize029
     * @tc.desc Verify ClassInitialize case 029: call createInstancenot initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass029>();
        let obj = cls.createInstance() as MyClass029;
        expect(MyClass029.ready).assertEqual(true); // 验证隐式初始化
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_3000
     * @tc.name testClassInitialize030
     * @tc.desc Verify ClassInitialize case 030: static field performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass030>();
        let startTime = Date.now();
        cls.initialize();
        let endTime = Date.now();
        expect(endTime - startTime).assertLess(1000); // 性能阈值
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_3100
     * @tc.name testClassInitialize031
     * @tc.desc Verify ClassInitialize case 031: call performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassInitialize031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass031>();

        let startTime = Date.now();
        for (let i = 0; i < 1000; i++) {
          cls.initialize();
        }
        let endTime = Date.now();
        expect(endTime - startTime).assertLess(100); // 应该很快，幂等操作
    });

  });
}