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

function asConstructorList(cls: Class): Array<reflect.Constructor> {
  return cls.getConstructors() as Array<reflect.Constructor>;
}

class MyClass001 {
    public constructor() {}
  }

class MyClass002 {
    public name: string;
    public constructor(name: string) {
      this.name = name;
    }
  }

class MyClass003 {
    public constructor(a: int, b: string) {}
  }

class MyClass004 {
    public constructor(value: string | null) {}
  }

class MyClass005 {
    public constructor(value?: string) {}
  }

class MyClass006 {
    public constructor(value: int) {}
  }

class MyClass007 {
    public constructor(a: int, b: int) {}
  }

class MyClass008 {
    public constructor(value: int) {}
  }

class MyClass009 {
    public name: string = "default";
    public constructor() {}
  }

class MyClass010 {
    public name: string;
    public constructor(name: string) {
      this.name = name;
    }
  }

class MyClass011 {
    public name: string;
    public age: int;
    public active: boolean;
    public constructor(name: string, age: int, active: boolean) {
      this.name = name;
      this.age = age;
      this.active = active;
    }
  }

class MyClass012 {
    private constructor() {}
    public static create(): MyClass012 {
      let constructors = asConstructorList(Class.from<MyClass012>());
      return constructors[0].createInstance() as MyClass012;
    }
  }

class MyClass013 {
    protected constructor() {}
    public static create(): MyClass013 {
      let constructors = asConstructorList(Class.from<MyClass013>());
      return constructors[0].createInstance() as MyClass013;
    }
  }

class ConcreteClass014 extends AbstractClass014 {
    public constructor() {
      super();
    }
  }

abstract class AbstractClass014 {
    public constructor() {}
  }

class MyClass015 {
    public constructor() {}
  }

class MyClass016 {
    public value: int = 42;
    public constructor() {}
  }

class GenericClass017<T> {
    public value: T;
    public constructor(value: T) {
      this.value = value;
    }
  }

class ChildClass018 extends ParentClass018 {
    public age: int;
    public constructor() {
      super();
      this.age = 10;
    }
  }

class ParentClass018 {
    public name: string;
    public constructor() {
      this.name = "parent";
    }
  }

class MyClass019 {
    public constructor(value: int) {}
  }

class MyClass020 {
    public constructor(a: int, b: int) {}
  }

class MyClass021 {
    public hugeArray: Array<int>;
    public constructor() {
      this.hugeArray = new Array<int>(1000000000);
    }
  }

class MyClass022 {
    public constructor() {
      throw new Error("Construction error");
    }
  }

class MyClass023 {
    public constructor() {}
    public static createPublic(): MyClass023 {
      let ctors = asConstructorList(Class.from<MyClass023>());
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() === 0) {
          return ctors[i].createInstance() as MyClass023;
        }
      }
      return null as MyClass023;
    }
  }

final class FinalClass024 {
    public value: int = 0;
    public constructor() {}
  }

class MyClass025 {
    public name: string = "";
    public age: int = 0;

    public constructor(name?: string, age?: int) {
      if (name !== undefined) {
        this.name = name;
      }
      if (age !== undefined) {
        this.age = age;
      }
    }
  }

class MyClass026 {
    public id: int = 0;
    private static nextId: int = 1;
    public constructor() {
      this.id = MyClass026.nextId++;
    }
  }

class ChildClass027 extends ParentClass027 {
    public childValue: string;
    public constructor() {
      super();
      this.childValue = "child";
    }
  }

class ParentClass027 {
    public parentValue: string;
    public constructor() {
      this.parentValue = "parent";
    }
  }

class MyClass028 {
    public info: string = "";

    public constructor(value?: int | string) {
      if (value === undefined) {
        this.info = "no-arg";
      } else if (typeof value === "string") {
        this.info = "string: " + value;
      } else {
        this.info = "int: " + value;
      }
    }
  }

class MyClass029 {
    public value: int = 0;
    public constructor(value: int) {
      this.value = value;
    }
  }


export default function ConstructorCreateInstanceTest(): void {
  describe('ConstructorCreateInstanceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0100
     * @tc.name testConstructorCreateInstance001
     * @tc.desc Verify ConstructorCreateInstance case 001: createInstance()method no parameters call constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = asConstructorList(cls);
        let instance = constructors[0].createInstance();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0200
     * @tc.name testConstructorCreateInstance002
     * @tc.desc Verify ConstructorCreateInstance case 002: createInstance()method parameters array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass002>();
        let constructors = asConstructorList(cls);
        let instance = constructors[0].createInstance(["test"]) as MyClass002;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0300
     * @tc.name testConstructorCreateInstance003
     * @tc.desc Verify ConstructorCreateInstance case 003: type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass003>())[0];
        let instance = ctor.createInstance([1, "test"]);
        expect(instance != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0400
     * @tc.name testConstructorCreateInstance004
     * @tc.desc Verify ConstructorCreateInstance case 004: null is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass004>())[0];
        let instance = ctor.createInstance([null]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0500
     * @tc.name testConstructorCreateInstance005
     * @tc.desc Verify ConstructorCreateInstance case 005: undefined is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass005>())[0];
        let instance = ctor.createInstance([undefined]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0600
     * @tc.name testConstructorCreateInstance006
     * @tc.desc Verify ConstructorCreateInstance case 006: error type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass006>())[0];
        try {
          ctor.createInstance(["string instead of int"]);
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0700
     * @tc.name testConstructorCreateInstance007
     * @tc.desc Verify ConstructorCreateInstance case 007: error parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass007>())[0];
        try {
          ctor.createInstance([1]); // 参数不足
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0800
     * @tc.name testConstructorCreateInstance008
     * @tc.desc Verify ConstructorCreateInstance case 008: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass008>())[0];
        try {
          ctor.createInstance([1, 2]); // 参数过多
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_0900
     * @tc.name testConstructorCreateInstance009
     * @tc.desc Verify ConstructorCreateInstance case 009: success instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass009>())[0];
        let instance = ctor.createInstance() as MyClass009;
        expect(instance != null).assertTrue();
        expect(instance.name).assertEqual("default");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1000
     * @tc.name testConstructorCreateInstance010
     * @tc.desc Verify ConstructorCreateInstance case 010: using parameters instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass010>())[0];
        let instance = ctor.createInstance(["test"]) as MyClass010;
        expect(instance.name).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1100
     * @tc.name testConstructorCreateInstance011
     * @tc.desc Verify ConstructorCreateInstance case 011: using multiple parameters instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass011>())[0];
        let instance = ctor.createInstance(["Alice", 30, true]) as MyClass011;
        expect(instance.name).assertEqual("Alice");
        expect(instance.age).assertEqual(30);
        expect(instance.active).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1200
     * @tc.name testConstructorCreateInstance012
     * @tc.desc Verify ConstructorCreateInstance case 012: via privateconstructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let instance = MyClass012.create();
        expect(instance != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1300
     * @tc.name testConstructorCreateInstance013
     * @tc.desc Verify ConstructorCreateInstance case 013: via protectedconstructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let instance = MyClass013.create();
        expect(instance != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1400
     * @tc.name testConstructorCreateInstance014
     * @tc.desc Verify ConstructorCreateInstance case 014: abstract class constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<ConcreteClass014>())[0];
        let instance = ctor.createInstance() as ConcreteClass014;
        expect(instance != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1500
     * @tc.name testConstructorCreateInstance015
     * @tc.desc Verify ConstructorCreateInstance case 015: verify return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass015>())[0];
        let instance = ctor.createInstance() as MyClass015;
        expect(instance != null).assertTrue();
        expect(instance instanceof MyClass015).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1600
     * @tc.name testConstructorCreateInstance016
     * @tc.desc Verify ConstructorCreateInstance case 016: verify instance property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass016>())[0];
        let instance = ctor.createInstance() as MyClass016;
        expect(instance.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1700
     * @tc.name testConstructorCreateInstance017
     * @tc.desc Verify ConstructorCreateInstance case 017: generic instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<GenericClass017<int>>())[0];
        let instance = ctor.createInstance([100]) as GenericClass017<int>;
        expect(instance.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1800
     * @tc.name testConstructorCreateInstance018
     * @tc.desc Verify ConstructorCreateInstance case 018: instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<ChildClass018>())[0];
        let instance = ctor.createInstance() as ChildClass018;
        expect(instance.name).assertEqual("parent");
        expect(instance.age).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_1900
     * @tc.name testConstructorCreateInstance019
     * @tc.desc Verify ConstructorCreateInstance case 019: error type parameters throw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass019>())[0];
        try {
          ctor.createInstance(["string"]);
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2000
     * @tc.name testConstructorCreateInstance020
     * @tc.desc Verify ConstructorCreateInstance case 020: parameters not throw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass020>())[0];
        try {
          ctor.createInstance([1]); // 缺少参数
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2100
     * @tc.name testConstructorCreateInstance021
     * @tc.desc Verify ConstructorCreateInstance case 021: not when throw OutOfMemoryError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass021>())[0];
        try {
          ctor.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2200
     * @tc.name testConstructorCreateInstance022
     * @tc.desc Verify ConstructorCreateInstance case 022: call constructor throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass022>())[0];
        try {
          ctor.createInstance();
          expect().assertFail();
        } catch (error) {
          expect(error.message).assertEqual("Construction error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2300
     * @tc.name testConstructorCreateInstance023
     * @tc.desc Verify ConstructorCreateInstance case 023: via different constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let instance = MyClass023.createPublic();
        expect(instance != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2400
     * @tc.name testConstructorCreateInstance024
     * @tc.desc Verify ConstructorCreateInstance case 024: verify different type constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<FinalClass024>())[0];
        let instance = ctor.createInstance() as FinalClass024;
        expect(instance.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2500
     * @tc.name testConstructorCreateInstance025
     * @tc.desc Verify ConstructorCreateInstance case 025: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass025>();
        let constructors = asConstructorList(cls);
        expect(constructors.length).assertLarger(0);
        let ctor = constructors[0];

        let obj1 = ctor.createInstance() as MyClass025;
        expect(obj1.name).assertEqual("");
        expect(obj1.age).assertEqual(0);

        let obj2 = ctor.createInstance(["Alice"]) as MyClass025;
        expect(obj2.name).assertEqual("Alice");
        expect(obj2.age).assertEqual(0);

        let obj3 = ctor.createInstance(["Bob", 30]) as MyClass025;
        expect(obj3.name).assertEqual("Bob");
        expect(obj3.age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2600
     * @tc.name testConstructorCreateInstance026
     * @tc.desc Verify ConstructorCreateInstance case 026: using constructor multiple instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<MyClass026>())[0];

        let instance1 = ctor.createInstance() as MyClass026;
        let instance2 = ctor.createInstance() as MyClass026;
        let instance3 = ctor.createInstance() as MyClass026;

        expect(instance1.id).assertEqual(1);
        expect(instance2.id).assertEqual(2);
        expect(instance3.id).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2700
     * @tc.name testConstructorCreateInstance027
     * @tc.desc Verify ConstructorCreateInstance case 027: verify constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asConstructorList(Class.from<ChildClass027>())[0];
        let instance = ctor.createInstance() as ChildClass027;
        expect(instance.parentValue).assertEqual("parent");
        expect(instance.childValue).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2800
     * @tc.name testConstructorCreateInstance028
     * @tc.desc Verify ConstructorCreateInstance case 028: verify parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass028>();
        let constructors = asConstructorList(cls);
        expect(constructors.length).assertLarger(0);

        let c0 = constructors[0];
        let obj1 = c0.createInstance() as MyClass028;
        let obj2 = c0.createInstance([42]) as MyClass028;
        let obj3 = c0.createInstance(["test"]) as MyClass028;

        expect(obj1.info).assertEqual("no-arg");
        expect(obj2.info).assertEqual("int: 42");
        expect(obj3.info).assertEqual("string: test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_2900
     * @tc.name testConstructorCreateInstance029
     * @tc.desc Verify ConstructorCreateInstance case 029: Constructor.createInstance() Class.createInstance()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorCreateInstance029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 方式1：通过Constructor.createInstance()
        let ctor = asConstructorList(Class.from<MyClass029>())[0];
        let instance1 = ctor.createInstance([42]) as MyClass029;

        let instance2 = ctor.createInstance([42]) as MyClass029;

        expect(instance1.value).assertEqual(42);
        expect(instance2.value).assertEqual(42);
        expect(instance1.value).assertEqual(instance2.value);
    });

  });
}