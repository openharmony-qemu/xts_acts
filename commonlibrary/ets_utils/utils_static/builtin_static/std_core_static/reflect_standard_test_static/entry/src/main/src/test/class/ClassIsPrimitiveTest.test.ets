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

class MyClass {}

class FinalClass007 {}

abstract class AbstractClass007 {
    public abstract test(): void;
  }

class EmptyClass007 {}

class MyClass007 {
    public name: string = "test";
  }

interface MyInterface008 {
    name: string;
    test(): void;
  }

enum TestEnum009 {
    VALUE1,
    VALUE2,
    VALUE3
  }

class GenericClass013<T> {
    public value: T;
  }

class MyClass022 {
    public name: string = "test";
  }

class MyClass023 {
    public name: string = "test";
  }

function processClass031(cls: Class): void {
    if (cls.isPrimitive()) {
      // 基本类型的特殊处理
      console.info("Processing primitive type: " + cls.getName());
    } else {
      // 非基本类型的处理
      console.info("Processing non-primitive type: " + cls.getName());
    }
  }

function getTypeInfo032(cls: Class): string {
    if (cls.isPrimitive()) {
      return "Primitive Type: " + cls.getName();
    } else if (cls.isInterface()) {
      return "Interface: " + cls.getName();
    } else if (cls.isEnum()) {
      return "Enum: " + cls.getName();
    } else {
      return "Class: " + cls.getName();
    }
  }

function serialize033(cls: Class): string {
    if (cls.isPrimitive()) {
      // 基本类型直接序列化
      return "PRIMITIVE:" + cls.getName();
    } else {
      // 复杂类型需要递归序列化
      return "COMPLEX:" + cls.getName();
    }
  }

function testIsPrimitiveConsistency037(): void {
    let primitives: Array<Class> = new Array<Class>();
    primitives.push(Class.PRIMITIVE_BOOLEAN);
    primitives.push(Class.PRIMITIVE_BYTE);
    primitives.push(Class.PRIMITIVE_CHAR);
    primitives.push(Class.PRIMITIVE_SHORT);
    primitives.push(Class.PRIMITIVE_INT);
    primitives.push(Class.PRIMITIVE_LONG);
    primitives.push(Class.PRIMITIVE_FLOAT);
    primitives.push(Class.PRIMITIVE_DOUBLE);
    primitives.push(Class.PRIMITIVE_NUMBER);
    primitives.push(Class.PRIMITIVE_VOID);

    for (let i = 0; i < primitives.length; i++) {
      expect(primitives[i].isPrimitive()).assertTrue();
    }
  }


export default function ClassIsPrimitiveTest(): void {
  describe('ClassIsPrimitiveTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0100
     * @tc.name testClassIsPrimitive001
     * @tc.desc Verify ClassIsPrimitive case 001: isPrimitive()method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        let result = cls.isPrimitive();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0200
     * @tc.name testClassIsPrimitive002
     * @tc.desc Verify ClassIsPrimitive case 002: using Class.from<T>()get Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<boolean>();
        expect(cls1.isPrimitive()).assertFalse();

        let cls2 = Class.from<string>();
        expect(cls2.isPrimitive()).assertFalse();

        let cls3 = Class.from<MyClass>();
        expect(cls3.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0300
     * @tc.name testClassIsPrimitive003
     * @tc.desc Verify ClassIsPrimitive case 003: using Class.of(obj)get Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass();
        let cls = Class.of(obj);
        expect(cls.isPrimitive()).assertFalse();

        let num = 100;
        let clsNum = Class.of(num);
        expect(clsNum.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0400
     * @tc.name testClassIsPrimitive004
     * @tc.desc Verify ClassIsPrimitive case 004: using Class static type property call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_BOOLEAN.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_BYTE.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_CHAR.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_SHORT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_LONG.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_FLOAT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_DOUBLE.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_NUMBER.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_VOID.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0500
     * @tc.name testClassIsPrimitive005
     * @tc.desc Verify ClassIsPrimitive case 005: using Class.ofAny(obj)get Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Any = 100;
        let cls = Class.ofAny(obj);
        expect(cls!.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0600
     * @tc.name testClassIsPrimitive006
     * @tc.desc Verify ClassIsPrimitive case 006: boolean byte char short int long float doubletype Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 所有基本类型包装类的isPrimitive()都返回false
        let clsBool = Class.from<boolean>();
        expect(clsBool.isPrimitive()).assertFalse();

        let clsByte = Class.from<byte>();
        expect(clsByte.isPrimitive()).assertFalse();

        let clsChar = Class.from<char>();
        expect(clsChar.isPrimitive()).assertFalse();

        let clsShort = Class.from<short>();
        expect(clsShort.isPrimitive()).assertFalse();

        let clsInt = Class.from<int>();
        expect(clsInt.isPrimitive()).assertFalse();

        let clsLong = Class.from<long>();
        expect(clsLong.isPrimitive()).assertFalse();

        let clsFloat = Class.from<float>();
        expect(clsFloat.isPrimitive()).assertFalse();

        let clsDouble = Class.from<double>();
        expect(clsDouble.isPrimitive()).assertFalse();

        let clsNumber = Class.from<number>();
        expect(clsNumber.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0700
     * @tc.name testClassIsPrimitive007
     * @tc.desc Verify ClassIsPrimitive case 007: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.from<MyClass007>().isPrimitive()).assertFalse();
        expect(Class.from<EmptyClass007>().isPrimitive()).assertFalse();
        expect(Class.from<AbstractClass007>().isPrimitive()).assertFalse();
        expect(Class.from<FinalClass007>().isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0800
     * @tc.name testClassIsPrimitive008
     * @tc.desc Verify ClassIsPrimitive case 008: interface type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyInterface008>();
        expect(cls.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_0900
     * @tc.name testClassIsPrimitive009
     * @tc.desc Verify ClassIsPrimitive case 009: type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<TestEnum009>();
        expect(cls.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1000
     * @tc.name testClassIsPrimitive010
     * @tc.desc Verify ClassIsPrimitive case 010: array type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<Array<int>>();
        expect(cls1.isPrimitive()).assertFalse();

        let cls2 = Class.from<Array<string>>();
        expect(cls2.isPrimitive()).assertFalse();

        let cls3 = Class.from<FixedArray<int>>();
        expect(cls3.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1100
     * @tc.name testClassIsPrimitive011
     * @tc.desc Verify ClassIsPrimitive case 011: Map Set type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<Map<int, string>>();
        expect(cls1.isPrimitive()).assertFalse();

        let cls2 = Class.from<Set<int>>();
        expect(cls2.isPrimitive()).assertFalse();

        let cls3 = Class.from<Array<string>>();
        expect(cls3.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1200
     * @tc.name testClassIsPrimitive012
     * @tc.desc Verify ClassIsPrimitive case 012: type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<int | string | boolean>();
        expect(cls.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1300
     * @tc.name testClassIsPrimitive013
     * @tc.desc Verify ClassIsPrimitive case 013: generic type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<GenericClass013<int>>();
        expect(cls1.isPrimitive()).assertFalse();

        let cls2 = Class.from<GenericClass013<string>>();
        expect(cls2.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1400
     * @tc.name testClassIsPrimitive014
     * @tc.desc Verify ClassIsPrimitive case 014: 10 PRIMITIVE_ static property call isPrimitive()return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_BOOLEAN.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_BYTE.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_CHAR.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_SHORT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_LONG.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_FLOAT.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_DOUBLE.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_NUMBER.isPrimitive()).assertTrue();
        expect(Class.PRIMITIVE_VOID.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1500
     * @tc.name testClassIsPrimitive015
     * @tc.desc Verify ClassIsPrimitive case 015: type Classobject call isPrimitive()return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 基本类型包装类
        expect(Class.from<boolean>().isPrimitive()).assertFalse();
        expect(Class.from<int>().isPrimitive()).assertFalse();
        expect(Class.from<number>().isPrimitive()).assertFalse();

        // 自定义类
        expect(Class.from<MyClass>().isPrimitive()).assertFalse();

        // 接口
        expect(Class.from<MyInterface008>().isPrimitive()).assertFalse();

        // 枚举
        expect(Class.from<TestEnum009>().isPrimitive()).assertFalse();

        // 数组
        expect(Class.from<Array<int>>().isPrimitive()).assertFalse();

        // 集合
        expect(Class.from<Map<int, string>>().isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1600
     * @tc.name testClassIsPrimitive016
     * @tc.desc Verify ClassIsPrimitive case 016: PRIMITIVE_VOID isPrimitive()should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.PRIMITIVE_VOID.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1700
     * @tc.name testClassIsPrimitive017
     * @tc.desc Verify ClassIsPrimitive case 017: PRIMITIVE_NUMBER isPrimitive()should return true Class.from<number>()return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // PRIMITIVE_NUMBER是基本类型
        expect(Class.PRIMITIVE_NUMBER.isPrimitive()).assertTrue();

        // 但number作为类型参数时不是基本类型
        expect(Class.from<number>().isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1800
     * @tc.name testClassIsPrimitive018
     * @tc.desc Verify ClassIsPrimitive case 018: isPrimitive()return should is booleantype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        let result = cls.isPrimitive();
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_1900
     * @tc.name testClassIsPrimitive019
     * @tc.desc Verify ClassIsPrimitive case 019: return should is booleaninstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = Class.PRIMITIVE_INT.isPrimitive();
        expect(result instanceof boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2000
     * @tc.name testClassIsPrimitive020
     * @tc.desc Verify ClassIsPrimitive case 020: verify PRIMITIVE_ property isPrimitive() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let primitiveTypes: Array<Class> = new Array<Class>();
        primitiveTypes.push(Class.PRIMITIVE_BOOLEAN);
        primitiveTypes.push(Class.PRIMITIVE_BYTE);
        primitiveTypes.push(Class.PRIMITIVE_CHAR);
        primitiveTypes.push(Class.PRIMITIVE_SHORT);
        primitiveTypes.push(Class.PRIMITIVE_INT);
        primitiveTypes.push(Class.PRIMITIVE_LONG);
        primitiveTypes.push(Class.PRIMITIVE_FLOAT);
        primitiveTypes.push(Class.PRIMITIVE_DOUBLE);
        primitiveTypes.push(Class.PRIMITIVE_NUMBER);
        primitiveTypes.push(Class.PRIMITIVE_VOID);

        for (let i = 0; i < primitiveTypes.length; i++) {
          expect(primitiveTypes[i].isPrimitive()).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2100
     * @tc.name testClassIsPrimitive021
     * @tc.desc Verify ClassIsPrimitive case 021: isPrimitive()not parameters call not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        try {
          let result = cls.isPrimitive();
          expect(result !== null).assertTrue();
        } catch (error) {
          expect().assertFail(); // 不应该抛出异常
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2200
     * @tc.name testClassIsPrimitive022
     * @tc.desc Verify ClassIsPrimitive case 022: Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass022>();
        // 在调用initialize()之前
        let result = cls.isPrimitive();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2300
     * @tc.name testClassIsPrimitive023
     * @tc.desc Verify ClassIsPrimitive case 023: Classobject call isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass023>();
        cls.initialize();
        let result = cls.isPrimitive();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2400
     * @tc.name testClassIsPrimitive024
     * @tc.desc Verify ClassIsPrimitive case 024: isPrimitive()method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<boolean>();
        let result = cls.isPrimitive();
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2500
     * @tc.name testClassIsPrimitive025
     * @tc.desc Verify ClassIsPrimitive case 025: isPrimitive() method not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;
        let result = cls.isPrimitive();
        // 结果立即可用，不需要await
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2600
     * @tc.name testClassIsPrimitive026
     * @tc.desc Verify ClassIsPrimitive case 026: multiple when call isPrimitive()should return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_BOOLEAN;

        // 在实际测试中，需要使用TaskPool或其他并发机制
        // 这里展示基本逻辑
        let results: Array<boolean> = new Array<boolean>();
        for (let i = 0; i < 10; i++) {
          results.push(cls.isPrimitive());
        }

        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2700
     * @tc.name testClassIsPrimitive027
     * @tc.desc Verify ClassIsPrimitive case 027: using Class.of(null)get Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.of(null);
        let result = cls.isPrimitive();
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2800
     * @tc.name testClassIsPrimitive028
     * @tc.desc Verify ClassIsPrimitive case 028: using Class.ofAny(undefined)get Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: Any = undefined;
        let cls = Class.ofAny(obj);
        if (cls !== undefined) {
          let result = cls.isPrimitive();
          expect(result).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_2900
     * @tc.name testClassIsPrimitive029
     * @tc.desc Verify ClassIsPrimitive case 029: isPrimitive() and Classmethod using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;

        // 结合getName()
        if (cls.isPrimitive()) {
          expect(cls.getName()).assertEqual("i32");
        }

        // 结合getDescriptor()
        if (cls.isPrimitive()) {
          let descriptor = cls.getDescriptor();
          expect(descriptor !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3000
     * @tc.name testClassIsPrimitive030
     * @tc.desc Verify ClassIsPrimitive case 030: isPrimitive() and type method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.PRIMITIVE_INT;
        expect(cls1.isPrimitive()).assertTrue();
        expect(cls1.isInterface()).assertFalse();
        expect(cls1.isEnum()).assertFalse();
        expect(cls1.isFinal()).assertFalse();

        let cls2 = Class.from<MyInterface008>();
        expect(cls2.isPrimitive()).assertFalse();
        expect(cls2.isInterface()).assertTrue();

        let cls3 = Class.from<TestEnum009>();
        expect(cls3.isPrimitive()).assertFalse();
        expect(cls3.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3100
     * @tc.name testClassIsPrimitive031
     * @tc.desc Verify ClassIsPrimitive case 031: isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      processClass031(Class.PRIMITIVE_INT); // 处理基本类型
        processClass031(Class.from<MyClass>()); // 处理非基本类型
        expect(Class.PRIMITIVE_INT.isPrimitive()).assertTrue();
        expect(Class.from<MyClass>().isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3200
     * @tc.name testClassIsPrimitive032
     * @tc.desc Verify ClassIsPrimitive case 032: in using isPrimitive() type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(getTypeInfo032(Class.PRIMITIVE_INT)).assertEqual("Primitive Type: i32");
        expect(getTypeInfo032(Class.from<Array<int>>())).assertEqual("Class: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3300
     * @tc.name testClassIsPrimitive033
     * @tc.desc Verify ClassIsPrimitive case 033: when isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(serialize033(Class.PRIMITIVE_BOOLEAN)).assertEqual("PRIMITIVE:boolean");
        expect(serialize033(Class.from<MyClass>())).assertEqual("COMPLEX:MyClass");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3400
     * @tc.name testClassIsPrimitive034
     * @tc.desc Verify ClassIsPrimitive case 034: call isPrimitive()should return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_INT;
        for (let i = 0; i < 1000; i++) {
          expect(cls.isPrimitive()).assertTrue();
        }

        let cls2 = Class.from<MyClass>();
        for (let i = 0; i < 1000; i++) {
          expect(cls2.isPrimitive()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3500
     * @tc.name testClassIsPrimitive035
     * @tc.desc Verify ClassIsPrimitive case 035: verify isPrimitive()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.PRIMITIVE_DOUBLE;
        let result1 = cls.isPrimitive();
        let result2 = cls.isPrimitive();
        expect(result1).assertEqual(result2);
        expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3600
     * @tc.name testClassIsPrimitive036
     * @tc.desc Verify ClassIsPrimitive case 036: verify isPrimitive() in different API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // API version 24+
        let cls = Class.PRIMITIVE_LONG;
        expect(cls.isPrimitive()).assertTrue();

        let cls2 = Class.from<Map<int, string>>();
        expect(cls2.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISPRIMITIVE_3700
     * @tc.name testClassIsPrimitive037
     * @tc.desc Verify ClassIsPrimitive case 037: in different isPrimitive() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsPrimitive037', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      testIsPrimitiveConsistency037();
    });

  });
}