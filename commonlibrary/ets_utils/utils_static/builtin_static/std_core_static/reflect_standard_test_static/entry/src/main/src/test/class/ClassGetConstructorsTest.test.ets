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

interface ComplexTypes051Obj {
  x: int;
}

interface Service077Config {
  name: string;
}

function constructorsToArray(cls: Class): Array<reflect.Constructor> {
  return cls.getConstructors() as Array<reflect.Constructor>;
}

class MyClass001 {
      public name: string = 'test';
  }

class MyClass003 {
      public name: string = '';
      public constructor(name?: string) {
        if (name !== undefined) {
          this.name = name;
        }
      }
  }

class AllPrivateConstructors004 {
      private constructor() {}
  }

class SingleConstructor005 {
      public constructor() {}
  }

class MultipleConstructors006 {
      public name: string = '';
      public age: int = 0;
      public constructor(name?: string, age?: int) {
        if (name !== undefined && age !== undefined) {
          this.name = name;
          this.age = age;
        } else if (name !== undefined) {
          this.name = name;
        } else {
          this.name = 'default';
        }
      }
  }

class TestClass007 {
      public constructor(name: string) {}
  }

class TestClass008 {
      public constructor(x?: int) {}
  }

class TestClass009 {
      public constructor() {}
  }

class TestClass010 {
      public constructor() {}
  }

class NormalClass011 {
      public constructor() {}
  }

abstract class AbstractClass012 {
      public constructor() {}
      public abstract method(): void;
  }

final class FinalClass013 {
      public constructor() {}
  }

interface MyInterface014 {
      name: string;
  }

enum TestEnum015 {
      VALUE1,
      VALUE2
  }

class ChildClass017 extends ParentClass017 {
      public constructor(name: string) {
          super();
      }
  }

class ParentClass017 {
      public constructor() {}
  }

class Child018 extends Parent018 {
      public constructor(x: int, y: int) {
          super(x);
      }
  }

class Parent018 extends GrandParent018 {
      public constructor(x: int) {
          super();
      }
  }

class GrandParent018 {
      public constructor() {}
  }

class Child019 extends Parent019 {
      // 无显式构造函数
  }

class Parent019 {
      public constructor() {}
  }

class PublicConstructor020 {
      public constructor() {}
  }

class MultiplePublic021 {
      public constructor(x?: int | string) {}
  }

class OnlyPrivate022 {
      private constructor() {}
  }

class MixedAccess023 {
      public constructor(x: int) {}
  }

class AllPrivate024 {
      private constructor(x?: int | string) {}
  }

class ProtectedConstructor025 {
      protected constructor() {}
  }

class MixedProtected026 {
      public constructor(x: int) {}
  }

class OverloadByCount027 {
      public value: int = 0;
      public constructor(x?: int) {
        this.value = x ?? 0;
      }
  }

class MultipleOverloads028 {
      public constructor(x?: int, y?: int, z?: int) {}
  }

class OverloadByType029 {
      public constructor(x: int | string | boolean) {}
  }

class MixedTypes030 {
      public constructor(x: int | string, y: int | string) {}
  }

class OptionalParams031 {
      public constructor(x?: int) {
          this.value = x ?? 0;
      }
      public value: int = 0;
  }

class MultipleOptional032 {
      public constructor(x?: int, y?: string, z?: boolean) {}
  }

class VarArgsConstructor033 {
      public constructor(...items: int[]) {
          this.items = items;
      }
      public items: int[] = [];
  }

class NoExplicitConstructor034 {
      public name: string = 'test';
  }

class Singleton035 {
      private static instance: Singleton035 = new Singleton035();
      private constructor() {}
      public static getInstance(): Singleton035 {
          return Singleton035.instance;
      }
  }

class ProtectedOnly036 {
      protected constructor() {}
  }

class ComplexParams037 {
      public constructor(map: Map<string, int[]>, callback: (x: int) => string) {}
  }

class GenericClass038<T> {
      public constructor(value: T) {
          this.value = value;
      }
      public value: T;
  }

class UnionParamConstructor039 {
      public constructor(value: int | string) {}
  }

class ManyOverloads040 {
      public constructor(x1?: int, x2?: int, x3?: int, x4?: int, x5?: int) {}
  }

class TestClass041 {
      public constructor(x?: int, y?: int) {}
  }

class UninitializedClass042 {
      public constructor() {
          this.initialized = true;
      }
      public initialized: boolean = false;
  }

class InitFailClass043 {
      public constructor() {
          throw new Error('Initialization failed');
      }
  }

class TestClass044 {
      public constructor(x?: int) {}
  }

class TestClass045 {
      public constructor() {}
  }

class Child2046 extends Parent046 {
      public constructor() {
          super();
      }
  }

class Child1046 extends Parent046 {
      public constructor() {
          super();
      }
  }

class Parent046 {
      public constructor() {}
  }

class TestClass047 {
      public constructor() {}
  }

class NoParams048 {
      public constructor() {}
  }

class OneParam049 {
      public constructor(x: int) {}
  }

class MultiParams050 {
      public constructor(x: int, y: string, z: boolean) {}
  }

class ComplexTypes051 {
      public constructor(arr: Array<int>, obj: ComplexTypes051Obj, map: Map<string, int>) {}
  }

class TestClass052 {
      public constructor(x: int, y: string) {}
  }

class TestClass053 {
      public constructor(x: int, y: string) {}
  }

class TestClass054 {
      public constructor(x: int) {}
  }

class TestClass055 {
      public constructor(x: int) {}
  }

class NoParams056 {
      public constructor() {}
  }

class OneParam057 {
      public constructor(x: int) {}
  }

class MultiParams058 {
      public constructor(a: int, b: string, c: boolean, d: float) {}
  }

class PublicCtor059 {
      public constructor() {}
  }

class AllPublic060 {
      public constructor(x?: int | string) {}
  }

class PublicCtor061 {
      public constructor() {}
  }

class PublicCtor062 {
      public constructor() {}
  }

class UserDefined063 {
      public constructor() {}
  }

class TestClass064 {
      public name: string = 'default';
      public constructor() {}
  }

class TestClass065 {
      public name: string;
      public constructor(name: string) {
          this.name = name;
      }
  }

class TestClass066 {
      public name: string;
      public age: int;
      public constructor(name: string, age: int) {
          this.name = name;
          this.age = age;
      }
  }

class OverloadedClass067 {
      public name: string = '';
      public age: int = 0;
      public constructor(name?: string, age?: int) {
        if (name !== undefined && age !== undefined) {
          this.name = name;
          this.age = age;
        } else if (name !== undefined) {
          this.name = name;
        } else {
          this.name = 'default';
        }
      }
  }

class TestClass068 {
      public constructor() {}
  }

class TestClass069 {
      public constructor(x?: int) {}
  }

class TestClass070 {
      public constructor() {}
  }

class ManyConstructors071 {
      public constructor(x1?: int, x2?: int, x3?: int, x4?: int, x5?: int, x6?: int, x7?: int, x8?: int, x9?: int) {}
  }

class TestClass072 {
      public constructor(x?: int) {}
  }

class TestClass073 {
      public constructor(x?: int) {}
  }

class TestClass074 {
      public constructor() {}
  }

export class CustomClass076 {
          public constructor() {}
      }

class Service077 {
      public mode: string = '';
      public config?: Service077Config;
      public constructor(config?: Service077Config) {
        if (config !== undefined) {
          this.mode = 'configured';
          this.config = config;
        } else {
          this.mode = 'default';
        }
      }
  }

class Serializable078 {
      public data: string = '';
      public constructor(data?: string) {
        if (data !== undefined) {
          this.data = data;
        }
      }
  }

class Factory079 {
      public static createInstance<T>(cls: Class, id?: int): T {
          let ctors = cls.getConstructors() as Array<reflect.Constructor>;
          if (id != undefined) {
              return ctors[0].createInstance([id]) as T;
          }
          return ctors[0].createInstance() as T;
      }
  }

class Product079 {
      public id: int = 0;
      public constructor(id?: int) {
        if (id !== undefined) {
          this.id = id;
        }
      }
  }


export default function ClassGetConstructorsTest(): void {
  describe('ClassGetConstructorsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0100
     * @tc.name testClassGetConstructors001
     * @tc.desc Verify ClassGetConstructors case 001: getConstructors()not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = constructorsToArray(cls);
        expect(constructors != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0200
     * @tc.name testClassGetConstructors002
     * @tc.desc Verify ClassGetConstructors case 002: parameters should
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0300
     * @tc.name testClassGetConstructors003
     * @tc.desc Verify ClassGetConstructors case 003: return FixedArray<reflect.Constructor>type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length >= 0).assertTrue();
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0400
     * @tc.name testClassGetConstructors004
     * @tc.desc Verify ClassGetConstructors case 004: publicconstructor when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AllPrivateConstructors004>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0500
     * @tc.name testClassGetConstructors005
     * @tc.desc Verify ClassGetConstructors case 005: publicconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SingleConstructor005>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0600
     * @tc.name testClassGetConstructors006
     * @tc.desc Verify ClassGetConstructors case 006: multiple publicconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultipleConstructors006>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0700
     * @tc.name testClassGetConstructors007
     * @tc.desc Verify ClassGetConstructors case 007: return Constructorobject method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass007>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        let ctor = constructors[0];
        expect(ctor.getName()).assertEqual('constructor');
        expect(ctor.getOwner()).assertEqual(cls);
        expect(ctor.getParameterTypes() != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0800
     * @tc.name testClassGetConstructors008
     * @tc.desc Verify ClassGetConstructors case 008: constructor name should is constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass008>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        for (let i = 0; i < constructors.length; i++) {
            expect(constructors[i].getName()).assertEqual('constructor');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_0900
     * @tc.name testClassGetConstructors009
     * @tc.desc Verify ClassGetConstructors case 009: return should is voidtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass009>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1000
     * @tc.name testClassGetConstructors010
     * @tc.desc Verify ClassGetConstructors case 010: return array should is FixedArraytype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass010>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length != undefined).assertTrue(); // FixedArray有固定length
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1100
     * @tc.name testClassGetConstructors011
     * @tc.desc Verify ClassGetConstructors case 011: constructor get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NormalClass011>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1200
     * @tc.name testClassGetConstructors012
     * @tc.desc Verify ClassGetConstructors case 012: abstract class publicconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass012>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1300
     * @tc.name testClassGetConstructors013
     * @tc.desc Verify ClassGetConstructors case 013: final constructor get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<FinalClass013>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1400
     * @tc.name testClassGetConstructors014
     * @tc.desc Verify ClassGetConstructors case 014: interface constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface014>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1500
     * @tc.name testClassGetConstructors015
     * @tc.desc Verify ClassGetConstructors case 015: type constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum015>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1600
     * @tc.name testClassGetConstructors016
     * @tc.desc Verify ClassGetConstructors case 016: type Classobject constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0); // 基本类型无构造函数
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1700
     * @tc.name testClassGetConstructors017
     * @tc.desc Verify ClassGetConstructors case 017: getConstructors return constructor not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<ChildClass017>();
        let constructors = constructorsToArray(childCls);
        expect(constructors.length).assertEqual(1); // 只有ChildClass的构造函数
        expect(constructors[0].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1800
     * @tc.name testClassGetConstructors018
     * @tc.desc Verify ClassGetConstructors case 018: inheritance return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<Child018>();
        let constructors = constructorsToArray(childCls);
        expect(constructors.length).assertEqual(1); // 只有Child的构造函数
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_1900
     * @tc.name testClassGetConstructors019
     * @tc.desc Verify ClassGetConstructors case 019: constructor when return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<Child019>();
        let constructors = constructorsToArray(childCls);
        expect(constructors.length).assertEqual(1); // 默认构造函数
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2000
     * @tc.name testClassGetConstructors020
     * @tc.desc Verify ClassGetConstructors case 020: publicconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicConstructor020>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2100
     * @tc.name testClassGetConstructors021
     * @tc.desc Verify ClassGetConstructors case 021: publicconstructor return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiplePublic021>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        for (let i = 0; i < constructors.length; i++) {
            expect(constructors[i].isPublic()).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2200
     * @tc.name testClassGetConstructors022
     * @tc.desc Verify ClassGetConstructors case 022: privateconstructor not return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OnlyPrivate022>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2300
     * @tc.name testClassGetConstructors023
     * @tc.desc Verify ClassGetConstructors case 023: return publicconstructor private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedAccess023>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2400
     * @tc.name testClassGetConstructors024
     * @tc.desc Verify ClassGetConstructors case 024: multiple privateconstructor not return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AllPrivate024>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2500
     * @tc.name testClassGetConstructors025
     * @tc.desc Verify ClassGetConstructors case 025: protectedconstructor not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ProtectedConstructor025>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2600
     * @tc.name testClassGetConstructors026
     * @tc.desc Verify ClassGetConstructors case 026: return publicconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedProtected026>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2700
     * @tc.name testClassGetConstructors027
     * @tc.desc Verify ClassGetConstructors case 027: different parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OverloadByCount027>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getParametersNum()).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2800
     * @tc.name testClassGetConstructors028
     * @tc.desc Verify ClassGetConstructors case 028: 3 different parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultipleOverloads028>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_2900
     * @tc.name testClassGetConstructors029
     * @tc.desc Verify ClassGetConstructors case 029: parameters same type different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OverloadByType029>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3000
     * @tc.name testClassGetConstructors030
     * @tc.desc Verify ClassGetConstructors case 030: multiple parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedTypes030>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3100
     * @tc.name testClassGetConstructors031
     * @tc.desc Verify ClassGetConstructors case 031: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OptionalParams031>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3200
     * @tc.name testClassGetConstructors032
     * @tc.desc Verify ClassGetConstructors case 032: multiple parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultipleOptional032>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getParametersNum()).assertLessOrEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3300
     * @tc.name testClassGetConstructors033
     * @tc.desc Verify ClassGetConstructors case 033: using ... parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<VarArgsConstructor033>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3400
     * @tc.name testClassGetConstructors034
     * @tc.desc Verify ClassGetConstructors case 034: constructor when return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoExplicitConstructor034>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1); // 默认构造函数
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3500
     * @tc.name testClassGetConstructors035
     * @tc.desc Verify ClassGetConstructors case 035: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Singleton035>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3600
     * @tc.name testClassGetConstructors036
     * @tc.desc Verify ClassGetConstructors case 036: protectedconstructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ProtectedOnly036>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3700
     * @tc.name testClassGetConstructors037
     * @tc.desc Verify ClassGetConstructors case 037: constructor parameters is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ComplexParams037>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3800
     * @tc.name testClassGetConstructors038
     * @tc.desc Verify ClassGetConstructors case 038: generic constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors038', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass038<int>>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_3900
     * @tc.name testClassGetConstructors039
     * @tc.desc Verify ClassGetConstructors case 039: parameters type is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors039', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<UnionParamConstructor039>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4000
     * @tc.name testClassGetConstructors040
     * @tc.desc Verify ClassGetConstructors case 040: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors040', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ManyOverloads040>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4100
     * @tc.name testClassGetConstructors041
     * @tc.desc Verify ClassGetConstructors case 041: return array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors041', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass041>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        for (let i = 0; i < constructors.length; i++) {
            let ctor = constructors[i];
            expect(ctor != null).assertTrue();
            expect(ctor.getName()).assertEqual('constructor');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4200
     * @tc.name testClassGetConstructors042
     * @tc.desc Verify ClassGetConstructors case 042: when call getConstructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors042', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<UninitializedClass042>();
        // 类尚未初始化
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4300
     * @tc.name testClassGetConstructors043
     * @tc.desc Verify ClassGetConstructors case 043: constructor throw exception when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors043', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<InitFailClass043>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1); // 反射不受构造函数执行影响
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4400
     * @tc.name testClassGetConstructors044
     * @tc.desc Verify ClassGetConstructors case 044: constructor getName()return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors044', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass044>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        for (let i = 0; i < constructors.length; i++) {
            expect(constructors[i].getName()).assertEqual('constructor');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4500
     * @tc.name testClassGetConstructors045
     * @tc.desc Verify ClassGetConstructors case 045: getOwner()return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors045', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass045>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getOwner()).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4600
     * @tc.name testClassGetConstructors046
     * @tc.desc Verify ClassGetConstructors case 046: different constructor different owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors046', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<Child1046>();
        let cls2 = Class.from<Child2046>();
        let ctor1 = constructorsToArray(cls1)[0];
        let ctor2 = constructorsToArray(cls2)[0];
        expect(ctor1.getOwner()).assertEqual(cls1);
        expect(ctor2.getOwner()).assertEqual(cls2);
        expect(ctor1.getOwner() !== ctor2.getOwner()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4700
     * @tc.name testClassGetConstructors047
     * @tc.desc Verify ClassGetConstructors case 047: constructor return type is void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors047', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass047>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4800
     * @tc.name testClassGetConstructors048
     * @tc.desc Verify ClassGetConstructors case 048: return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors048', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoParams048>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_4900
     * @tc.name testClassGetConstructors049
     * @tc.desc Verify ClassGetConstructors case 049: return type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors049', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OneParam049>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(1);
        expect(constructors[0].getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5000
     * @tc.name testClassGetConstructors050
     * @tc.desc Verify ClassGetConstructors case 050: return multiple parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors050', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiParams050>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(3);
        expect(constructors[0].getParameterType(0)!.getName()).assertEqual('i32');
        expect(constructors[0].getParameterType(1)!.getName()).assertEqual('std.core.String');
        expect(constructors[0].getParameterType(2)!.getName()).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5100
     * @tc.name testClassGetConstructors051
     * @tc.desc Verify ClassGetConstructors case 051: parameters type is array object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors051', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ComplexTypes051>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5200
     * @tc.name testClassGetConstructors052
     * @tc.desc Verify ClassGetConstructors case 052: get parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors052', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass052>();
        let constructors = constructorsToArray(cls);
        let paramType = constructors[0].getParameterType(0);
        expect(paramType != null).assertTrue();
        expect(paramType!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5300
     * @tc.name testClassGetConstructors053
     * @tc.desc Verify ClassGetConstructors case 053: get parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors053', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass053>();
        let constructors = constructorsToArray(cls);
        let paramType = constructors[0].getParameterType(1);
        expect(paramType != null).assertTrue();
        expect(paramType!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5400
     * @tc.name testClassGetConstructors054
     * @tc.desc Verify ClassGetConstructors case 054: when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors054', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass054>();
        let constructors = constructorsToArray(cls);
        let paramType = constructors[0].getParameterType(10); // 超出范围
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5500
     * @tc.name testClassGetConstructors055
     * @tc.desc Verify ClassGetConstructors case 055: return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors055', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass055>();
        let constructors = constructorsToArray(cls);
        let paramType = constructors[0].getParameterType(-1);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5600
     * @tc.name testClassGetConstructors056
     * @tc.desc Verify ClassGetConstructors case 056: return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors056', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<NoParams056>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5700
     * @tc.name testClassGetConstructors057
     * @tc.desc Verify ClassGetConstructors case 057: return 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors057', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OneParam057>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5800
     * @tc.name testClassGetConstructors058
     * @tc.desc Verify ClassGetConstructors case 058: return parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors058', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MultiParams058>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].getParametersNum()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_5900
     * @tc.name testClassGetConstructors059
     * @tc.desc Verify ClassGetConstructors case 059: publicconstructor isPublic()return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors059', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicCtor059>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6000
     * @tc.name testClassGetConstructors060
     * @tc.desc Verify ClassGetConstructors case 060: verify return constructor public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors060', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AllPublic060>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        for (let i = 0; i < constructors.length; i++) {
            expect(constructors[i].isPublic()).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6100
     * @tc.name testClassGetConstructors061
     * @tc.desc Verify ClassGetConstructors case 061: publicconstructor isPrivate()return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors061', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicCtor061>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6200
     * @tc.name testClassGetConstructors062
     * @tc.desc Verify ClassGetConstructors case 062: publicconstructor isProtected()return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors062', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PublicCtor062>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6300
     * @tc.name testClassGetConstructors063
     * @tc.desc Verify ClassGetConstructors case 063: constructor isNative()return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors063', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<UserDefined063>();
        let constructors = constructorsToArray(cls);
        expect(constructors[0].isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6400
     * @tc.name testClassGetConstructors064
     * @tc.desc Verify ClassGetConstructors case 064: using constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors064', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass064>();
        let constructors = constructorsToArray(cls);
        let instance = constructors[0].createInstance() as TestClass064;
        expect(instance.name).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6500
     * @tc.name testClassGetConstructors065
     * @tc.desc Verify ClassGetConstructors case 065: using parameters constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors065', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass065>();
        let constructors = constructorsToArray(cls);
        let instance = constructors[0].createInstance(['test']) as TestClass065;
        expect(instance.name).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6600
     * @tc.name testClassGetConstructors066
     * @tc.desc Verify ClassGetConstructors case 066: using parameters constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors066', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass066>();
        let constructors = constructorsToArray(cls);
        let instance = constructors[0].createInstance(['Alice', 30]) as TestClass066;
        expect(instance.name).assertEqual('Alice');
        expect(instance.age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6700
     * @tc.name testClassGetConstructors067
     * @tc.desc Verify ClassGetConstructors case 067: using constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors067', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<OverloadedClass067>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertLarger(0);
        let foundTwoParam: boolean = false;
        for (let i = 0; i < constructors.length; i++) {
            if (constructors[i].getParametersNum() == 2) {
                let instance = constructors[i].createInstance(['Bob', 25]) as OverloadedClass067;
                expect(instance.name).assertEqual('Bob');
                expect(instance.age).assertEqual(25);
                foundTwoParam = true;
                break;
            }
        }
        expect(foundTwoParam).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6800
     * @tc.name testClassGetConstructors068
     * @tc.desc Verify ClassGetConstructors case 068: get constructor equalsshould return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors068', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass068>();
        let constructors1 = constructorsToArray(cls);
        let constructors2 = constructorsToArray(cls);
        expect(constructors1[0].equals(constructors2[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_6900
     * @tc.name testClassGetConstructors069
     * @tc.desc Verify ClassGetConstructors case 069: different constructor equalsshould return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors069', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c69 = constructorsToArray(Class.from<TestClass069>())[0];
        let c70 = constructorsToArray(Class.from<TestClass070>())[0];
        expect(c69.equals(c70)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7000
     * @tc.name testClassGetConstructors070
     * @tc.desc Verify ClassGetConstructors case 070: equalsreturn true not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors070', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass070>();
        let constructors1 = constructorsToArray(cls);
        let constructors2 = constructorsToArray(cls);
        expect(constructors1[0] === constructors2[0]).assertFalse(); // 不同引用
        expect(constructors1[0].equals(constructors2[0])).assertTrue(); // 但相等
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7100
     * @tc.name testClassGetConstructors071
     * @tc.desc Verify ClassGetConstructors case 071: get constructor performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors071', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ManyConstructors071>();
        let startTime = Date.now();
        let constructors = constructorsToArray(cls);
        let endTime = Date.now();
        let duration = endTime - startTime;
        expect(constructors.length).assertEqual(1);
        expect(duration).assertLess(100); // 应在100ms内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7200
     * @tc.name testClassGetConstructors072
     * @tc.desc Verify ClassGetConstructors case 072: call getConstructors performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors072', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass072>();
        let startTime = Date.now();
        for (let i = 0; i < 1000; i++) {
            let constructors = constructorsToArray(cls);
            expect(constructors.length).assertEqual(1);
        }
        let endTime = Date.now();
        let duration = endTime - startTime;
        expect(duration).assertLess(1000); // 1000次调用应在1秒内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7300
     * @tc.name testClassGetConstructors073
     * @tc.desc Verify ClassGetConstructors case 073: multiple when call getConstructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors073', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestClass073>();
        // 模拟并发访问（如果支持TaskPool）
        let results: Array<int> = new Array<int>();
        for (let i = 0; i < 10; i++) {
            results.push(cls.getConstructors().length);
        }
        expect(results.length).assertEqual(10);
        for (let i = 1; i < results.length; i++) {
            expect(results[0]).assertEqual(results[i]);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7400
     * @tc.name testClassGetConstructors074
     * @tc.desc Verify ClassGetConstructors case 074: verify in API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors074', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 验证接口从API version 24开始支持

        let cls = Class.from<TestClass074>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7500
     * @tc.name testClassGetConstructors075
     * @tc.desc Verify ClassGetConstructors case 075: get constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors075', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let arrayCls = Class.from<Array<int>>();
        let constructors = constructorsToArray(arrayCls);
        // Array类可能有默认构造函数
        expect(constructors.length).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7600
     * @tc.name testClassGetConstructors076
     * @tc.desc Verify ClassGetConstructors case 076: get constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors076', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CustomClass076>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7700
     * @tc.name testClassGetConstructors077
     * @tc.desc Verify ClassGetConstructors case 077: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors077', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Service077>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertEqual(1);
        expect(constructors[0] != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7800
     * @tc.name testClassGetConstructors078
     * @tc.desc Verify ClassGetConstructors case 078: type constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors078', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Serializable078>();
        let constructors = constructorsToArray(cls);
        expect(constructors.length).assertLarger(0);
        // 查找接受string参数的构造函数
        let stringCtor: reflect.Constructor | undefined;
        for (let i = 0; i < constructors.length; i++) {
            let params = constructors[i].getParameterTypes();
            if (params.length == 1 && params[0].isSubtypeOf(Class.from<string>())) {
                stringCtor = constructors[i];
                break;
            }
        }
        expect(stringCtor != null).assertTrue();
        let instance = stringCtor!.createInstance(['serialized data']) as Serializable078;
        expect(instance.data).assertEqual('serialized data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETCONSTRUCTORS_7900
     * @tc.name testClassGetConstructors079
     * @tc.desc Verify ClassGetConstructors case 079: using different type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetConstructors079', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let product1 = Factory079.createInstance<Product079>(Class.from<Product079>());
        let product2 = Factory079.createInstance<Product079>(Class.from<Product079>(), 123);
        expect(product1.id).assertEqual(0);
        expect(product2.id).assertEqual(123);
    });

  });
}