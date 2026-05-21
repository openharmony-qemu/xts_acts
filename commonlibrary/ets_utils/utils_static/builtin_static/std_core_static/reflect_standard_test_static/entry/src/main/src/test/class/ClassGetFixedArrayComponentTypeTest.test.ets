'use static'
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

class MyClass014 {
    public name: string = "";
  }

interface JsonSerializable015 {
    toJSON(): string;
  }

class MyClass023 {
    public name: string = "";
  }

abstract class AbstractClass024 {
    public abstract method(): void;
  }

final class FinalClass025 {
    public value: int = 0;
  }

interface MyInterface026 {
    method(): void;
  }

enum TestEnum033 {
    VALUE1,
    VALUE2
  }

function checkAndGetComponent049(cls: Class): Class | undefined {
    if (!cls.isFixedArray()) {
      return undefined;
    }
    return cls.getFixedArrayComponentType();
  }

function isFixedArrayOf056(cls: Class, componentTypeName: string): boolean {
    if (!cls.isFixedArray()) {
      return false;
    }
    let componentType = cls.getFixedArrayComponentType();
    if (componentType === undefined || componentType === null) {
      return false;
    }
    const n = componentType!.getName();
    if (componentTypeName === "std.core.String" || componentTypeName === "std.core.Boolean" || componentTypeName === "std.core.Char") {
      return n === componentTypeName;
    }
    return Utils.reflectScalarTypeNameMatches(n, componentTypeName);
  }

class ReflectionUtils057 {
    public static getTypeInfo(cls: Class): string {
      if (cls.isFixedArray()) {
        let componentType = cls.getFixedArrayComponentType();
        return `FixedArray<${componentType!.getName()}>`;
      } else if (cls.isUnion()) {
        return `Union<${cls.getName()}>`;
      } else {
        return cls.getName();
      }
    }
  }

function createFixedArrayFromType058(componentType: Class, size: int): Object {
    const n = componentType.getName();
    if (Utils.reflectScalarTypeNameMatches(n, "i32")) {
      let out: FixedArray<int> = new FixedArray<int>(size);
      return out;
    } else if (n === "std.core.String") {
      let out2: FixedArray<string> = new FixedArray<string>(size);
      return out2;
    }
    throw new Error("Unsupported component type");
  }

function getComponentTypeName055<T>(arr: FixedArray<T>): string {
  let cls = Class.of(arr);
  let componentType = cls.getFixedArrayComponentType();
  const n = componentType!.getName();
  if (Utils.reflectScalarTypeNameMatches(n, "i32")) {
    return "i32";
  }
  return n;
}

export default function ClassGetFixedArrayComponentTypeTest(): void {
  describe('ClassGetFixedArrayComponentTypeTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0100
     * @tc.name testClassGetFixedArrayComponentType001
     * @tc.desc Verify ClassGetFixedArrayComponentType case 001: getFixedArrayComponentType instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArray<int>>();
        let result = cls.getFixedArrayComponentType();
        expect(result !== undefined && result !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(result!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0200
     * @tc.name testClassGetFixedArrayComponentType002
     * @tc.desc Verify ClassGetFixedArrayComponentType case 002: FixedArray<int> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0300
     * @tc.name testClassGetFixedArrayComponentType003
     * @tc.desc Verify ClassGetFixedArrayComponentType case 003: FixedArray<double> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<double> = [1.5, 2.5, 3.5];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "double")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0400
     * @tc.name testClassGetFixedArrayComponentType004
     * @tc.desc Verify ClassGetFixedArrayComponentType case 004: FixedArray<boolean> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<boolean> = [true, false, true];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.Boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0500
     * @tc.name testClassGetFixedArrayComponentType005
     * @tc.desc Verify ClassGetFixedArrayComponentType case 005: FixedArray<char> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<char> = [c'A', c'B', c'C'];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.Char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0600
     * @tc.name testClassGetFixedArrayComponentType006
     * @tc.desc Verify ClassGetFixedArrayComponentType case 006: FixedArray<string> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<string> = ["hello", "world"];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0700
     * @tc.name testClassGetFixedArrayComponentType007
     * @tc.desc Verify ClassGetFixedArrayComponentType case 007: FixedArray<long> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<long> = [100000 as long, 200000 as long];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "long")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0800
     * @tc.name testClassGetFixedArrayComponentType008
     * @tc.desc Verify ClassGetFixedArrayComponentType case 008: FixedArray<float> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<float> = [1.5f, 2.5f];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "float")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_0900
     * @tc.name testClassGetFixedArrayComponentType009
     * @tc.desc Verify ClassGetFixedArrayComponentType case 009: FixedArray<byte> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [0x01, 0x02, 0x03];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "byte")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1000
     * @tc.name testClassGetFixedArrayComponentType010
     * @tc.desc Verify ClassGetFixedArrayComponentType case 010: FixedArray<short> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<short> = [100, 200, 300];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "short")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1100
     * @tc.name testClassGetFixedArrayComponentType011
     * @tc.desc Verify ClassGetFixedArrayComponentType case 011: FixedArray<Array<int>> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<Array<int>> = [[1, 2], [3, 4]];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1200
     * @tc.name testClassGetFixedArrayComponentType012
     * @tc.desc Verify ClassGetFixedArrayComponentType case 012: FixedArray<Map<string, int>> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map1 = new Map<string, int>();
        let map2 = new Map<string, int>();
        let arr: FixedArray<Map<string, int>> = [map1, map2];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1300
     * @tc.name testClassGetFixedArrayComponentType013
     * @tc.desc Verify ClassGetFixedArrayComponentType case 013: FixedArray<Set<int>> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<int>();
        let set2 = new Set<int>();
        let arr: FixedArray<Set<int>> = [set1, set2];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType!.getName()).assertEqual("std.core.Set");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1400
     * @tc.name testClassGetFixedArrayComponentType014
     * @tc.desc Verify ClassGetFixedArrayComponentType case 014: FixedArray<MyClass> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass014();
        let obj2 = new MyClass014();
        let arr: FixedArray<MyClass014> = [obj1, obj2];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.classNameMatches(componentType!.getName(), "MyClass014")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1500
     * @tc.name testClassGetFixedArrayComponentType015
     * @tc.desc Verify ClassGetFixedArrayComponentType case 015: FixedArray<JsonSerializable> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<JsonSerializable015> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.classNameMatches(componentType!.getName(), "JsonSerializable015")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1600
     * @tc.name testClassGetFixedArrayComponentType016
     * @tc.desc Verify ClassGetFixedArrayComponentType case 016: Array<int>return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1700
     * @tc.name testClassGetFixedArrayComponentType017
     * @tc.desc Verify ClassGetFixedArrayComponentType case 017: Array<string>return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<string> = ["a", "b", "c"];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1800
     * @tc.name testClassGetFixedArrayComponentType018
     * @tc.desc Verify ClassGetFixedArrayComponentType case 018: empty Array<int>return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_1900
     * @tc.name testClassGetFixedArrayComponentType019
     * @tc.desc Verify ClassGetFixedArrayComponentType case 019: Class.from<int>()return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2000
     * @tc.name testClassGetFixedArrayComponentType020
     * @tc.desc Verify ClassGetFixedArrayComponentType case 020: Class.PRIMITIVE_INTreturn undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let componentType = Class.PRIMITIVE_INT.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2100
     * @tc.name testClassGetFixedArrayComponentType021
     * @tc.desc Verify ClassGetFixedArrayComponentType case 021: Class.from<string>()return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let componentType = Class.from<string>().getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2200
     * @tc.name testClassGetFixedArrayComponentType022
     * @tc.desc Verify ClassGetFixedArrayComponentType case 022: Class.PRIMITIVE_BOOLEANreturn undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let componentType = Class.PRIMITIVE_BOOLEAN.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2300
     * @tc.name testClassGetFixedArrayComponentType023
     * @tc.desc Verify ClassGetFixedArrayComponentType case 023: return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2400
     * @tc.name testClassGetFixedArrayComponentType024
     * @tc.desc Verify ClassGetFixedArrayComponentType case 024: abstract class return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass024>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2500
     * @tc.name testClassGetFixedArrayComponentType025
     * @tc.desc Verify ClassGetFixedArrayComponentType case 025: final return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass025>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2600
     * @tc.name testClassGetFixedArrayComponentType026
     * @tc.desc Verify ClassGetFixedArrayComponentType case 026: interface return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface026>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2700
     * @tc.name testClassGetFixedArrayComponentType027
     * @tc.desc Verify ClassGetFixedArrayComponentType case 027: JsonSerializableinterface return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<JsonSerializable>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2800
     * @tc.name testClassGetFixedArrayComponentType028
     * @tc.desc Verify ClassGetFixedArrayComponentType case 028: ArrayLike<T>interface return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayLike<int>>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_2900
     * @tc.name testClassGetFixedArrayComponentType029
     * @tc.desc Verify ClassGetFixedArrayComponentType case 029: Map<K, V>return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<int, string>();
        let cls = Class.of(map);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3000
     * @tc.name testClassGetFixedArrayComponentType030
     * @tc.desc Verify ClassGetFixedArrayComponentType case 030: Set<T>return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
        let cls = Class.of(set);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3100
     * @tc.name testClassGetFixedArrayComponentType031
     * @tc.desc Verify ClassGetFixedArrayComponentType case 031: type return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3200
     * @tc.name testClassGetFixedArrayComponentType032
     * @tc.desc Verify ClassGetFixedArrayComponentType case 032: type return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | Array<double>>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3300
     * @tc.name testClassGetFixedArrayComponentType033
     * @tc.desc Verify ClassGetFixedArrayComponentType case 033: return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum033>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3400
     * @tc.name testClassGetFixedArrayComponentType034
     * @tc.desc Verify ClassGetFixedArrayComponentType case 034: empty FixedArray<int> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3500
     * @tc.name testClassGetFixedArrayComponentType035
     * @tc.desc Verify ClassGetFixedArrayComponentType case 035: 1000 FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = new FixedArray<int>(1000);
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3600
     * @tc.name testClassGetFixedArrayComponentType036
     * @tc.desc Verify ClassGetFixedArrayComponentType case 036: FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3700
     * @tc.name testClassGetFixedArrayComponentType037
     * @tc.desc Verify ClassGetFixedArrayComponentType case 037: FixedArray<FixedArray<int>> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner1: FixedArray<int> = [1, 2];
        let inner2: FixedArray<int> = [3, 4];
        let arr: FixedArray<FixedArray<int>> = [inner1, inner2];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== undefined && componentType !== null).assertTrue();
        expect(componentType!.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3800
     * @tc.name testClassGetFixedArrayComponentType038
     * @tc.desc Verify ClassGetFixedArrayComponentType case 038: array return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== undefined && componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_3900
     * @tc.name testClassGetFixedArrayComponentType039
     * @tc.desc Verify ClassGetFixedArrayComponentType case 039: array return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4000
     * @tc.name testClassGetFixedArrayComponentType040
     * @tc.desc Verify ClassGetFixedArrayComponentType case 040: primitive FixedArray component types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArr: FixedArray<byte> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(byteArr).getFixedArrayComponentType()!.getName(), "byte")).assertTrue();
        let shortArr: FixedArray<short> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(shortArr).getFixedArrayComponentType()!.getName(), "short")).assertTrue();
        let intArr: FixedArray<int> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(intArr).getFixedArrayComponentType()!.getName(), "i32")).assertTrue();
        let longArr: FixedArray<long> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(longArr).getFixedArrayComponentType()!.getName(), "long")).assertTrue();
        let floatArr: FixedArray<float> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(floatArr).getFixedArrayComponentType()!.getName(), "float")).assertTrue();
        let doubleArr: FixedArray<double> = [];
        let doubleType = Class.of(doubleArr).getFixedArrayComponentType();
        expect(doubleType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(doubleType!.getName(), "double")).assertTrue();
        let boolArr: FixedArray<boolean> = [];
        expect(Class.of(boolArr).getFixedArrayComponentType()!.getName()).assertEqual("std.core.Boolean");
        let charArr: FixedArray<char> = [];
        expect(Class.of(charArr).getFixedArrayComponentType()!.getName()).assertEqual("std.core.Char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4100
     * @tc.name testClassGetFixedArrayComponentType041
     * @tc.desc Verify ClassGetFixedArrayComponentType case 041: return Classobject call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== undefined && componentType !== null).assertTrue();

        let name = componentType!.getName();
        expect(name.length).assertLarger(0);

        let isPrim = componentType!.isPrimitive();
        expect(typeof isPrim).assertEqual("boolean");

        let superCls = componentType!.getSuper();
        expect(superCls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4200
     * @tc.name testClassGetFixedArrayComponentType042
     * @tc.desc Verify ClassGetFixedArrayComponentType case 042: using return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new MyClass014();
        let arr: FixedArray<MyClass014> = [m];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== undefined && componentType !== null).assertTrue();

        let methods = componentType!.getInstanceMethods();
        expect(methods.length).assertEqual(0);

        let fields = componentType!.getInstanceFields();
        expect(fields.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4300
     * @tc.name testClassGetFixedArrayComponentType043
     * @tc.desc Verify ClassGetFixedArrayComponentType case 043: Map<string, Array<int>> is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<Map<string, Array<int>>> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        let name = componentType!.getName();
        expect(name).assertContain("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4400
     * @tc.name testClassGetFixedArrayComponentType044
     * @tc.desc Verify ClassGetFixedArrayComponentType case 044: type is type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4500
     * @tc.name testClassGetFixedArrayComponentType045
     * @tc.desc Verify ClassGetFixedArrayComponentType case 045: array call method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4600
     * @tc.name testClassGetFixedArrayComponentType046
     * @tc.desc Verify ClassGetFixedArrayComponentType case 046: array call method return undefined not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4700
     * @tc.name testClassGetFixedArrayComponentType047
     * @tc.desc Verify ClassGetFixedArrayComponentType case 047: Classobject call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
        let componentType = cls.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(componentType)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4800
     * @tc.name testClassGetFixedArrayComponentType048
     * @tc.desc Verify ClassGetFixedArrayComponentType case 048: multiple when call getFixedArrayComponentType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let t1 = cls.getFixedArrayComponentType();
        let t2 = cls.getFixedArrayComponentType();
        expect(t1 === t2).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(t1!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_4900
     * @tc.name testClassGetFixedArrayComponentType049
     * @tc.desc Verify ClassGetFixedArrayComponentType case 049: using isFixedArray() after call getFixedArrayComponentType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: FixedArray<int> = [1, 2, 3];
        let cls1 = Class.of(arr1);
        let type1 = checkAndGetComponent049(cls1);
        expect(type1 !== undefined && type1 !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(type1!.getName(), "i32")).assertTrue();

        let arr2: Array<int> = [1, 2, 3];
        let cls2 = Class.of(arr2);
        let type2 = checkAndGetComponent049(cls2);
        expect(Utils.isAbsentReflectOptional(type2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5000
     * @tc.name testClassGetFixedArrayComponentType050
     * @tc.desc Verify ClassGetFixedArrayComponentType case 050: Classobject call getFixedArrayComponentType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let type1 = cls.getFixedArrayComponentType();
        let type2 = cls.getFixedArrayComponentType();
        expect(type1!.getName()).assertEqual(type2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5100
     * @tc.name testClassGetFixedArrayComponentType051
     * @tc.desc Verify ClassGetFixedArrayComponentType case 051: same type different FixedArrayinstance type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: FixedArray<int> = [1, 2, 3];
        let arr2: FixedArray<int> = [4, 5, 6];
        let cls1 = Class.of(arr1);
        let cls2 = Class.of(arr2);
        let type1 = cls1.getFixedArrayComponentType();
        let type2 = cls2.getFixedArrayComponentType();
        expect(type1!.getName()).assertEqual(type2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5200
     * @tc.name testClassGetFixedArrayComponentType052
     * @tc.desc Verify ClassGetFixedArrayComponentType case 052: get type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<string> = ["a", "b"];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();

        let superCls = componentType!.getSuper();
        expect(superCls !== null).assertTrue();
        expect(superCls!.getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5300
     * @tc.name testClassGetFixedArrayComponentType053
     * @tc.desc Verify ClassGetFixedArrayComponentType case 053: FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArr: FixedArray<int> = new FixedArray<int>(10000);
        let cls = Class.of(largeArr);
        let startTime = Date.now();
        let componentType = cls.getFixedArrayComponentType();
        let endTime = Date.now();
        expect(componentType !== null).assertTrue();
        console.info(`getFixedArrayComponentType perf: ${endTime - startTime}ms`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5400
     * @tc.name testClassGetFixedArrayComponentType054
     * @tc.desc Verify ClassGetFixedArrayComponentType case 054: Classobject call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);

        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5500
     * @tc.name testClassGetFixedArrayComponentType055
     * @tc.desc Verify ClassGetFixedArrayComponentType case 055: generic method type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intArr: FixedArray<int> = [1, 2, 3];
        let strArr: FixedArray<string> = ["a", "b"];

        expect(getComponentTypeName055(intArr)).assertEqual("i32");
        expect(getComponentTypeName055(strArr)).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5600
     * @tc.name testClassGetFixedArrayComponentType056
     * @tc.desc Verify ClassGetFixedArrayComponentType case 056: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intArr: FixedArray<int> = [1, 2, 3];
        let strArr: FixedArray<string> = ["a", "b"];
        let cls1 = Class.of(intArr);
        let cls2 = Class.of(strArr);

        expect(isFixedArrayOf056(cls1, "i32")).assertTrue();
        expect(isFixedArrayOf056(cls1, "std.core.String")).assertFalse();
        expect(isFixedArrayOf056(cls2, "std.core.String")).assertTrue();
        expect(isFixedArrayOf056(cls2, "i32")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5700
     * @tc.name testClassGetFixedArrayComponentType057
     * @tc.desc Verify ClassGetFixedArrayComponentType case 057: in using method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let typeInfo = ReflectionUtils057.getTypeInfo(cls);
        expect(typeInfo.startsWith("FixedArray<")).assertTrue();
        expect(typeInfo.endsWith(">")).assertTrue();
        const inner = typeInfo.substring("FixedArray<".length, typeInfo.length - 1);
        expect(Utils.reflectScalarTypeNameMatches(inner, "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5800
     * @tc.name testClassGetFixedArrayComponentType058
     * @tc.desc Verify ClassGetFixedArrayComponentType case 058: type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        let newArr = createFixedArrayFromType058(componentType!, 10);
        expect(newArr !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_5900
     * @tc.name testClassGetFixedArrayComponentType059
     * @tc.desc Verify ClassGetFixedArrayComponentType case 059: byte long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArr: FixedArray<byte> = [0 as byte, 127 as byte];
        let longArr: FixedArray<long> = [0 as long, 9223372036854775807 as long];

        let byteComponentType = Class.of(byteArr).getFixedArrayComponentType();
        let longComponentType = Class.of(longArr).getFixedArrayComponentType();
        expect(Utils.reflectScalarTypeNameMatches(byteComponentType!.getName(), "byte")).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(longComponentType!.getName(), "long")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6000
     * @tc.name testClassGetFixedArrayComponentType060
     * @tc.desc Verify ClassGetFixedArrayComponentType case 060: null undefined NaN array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: FixedArray<int> = [1, 2, 3];
        let cls1 = Class.of(arr1);
        let type1 = cls1.getFixedArrayComponentType();
        expect(type1 !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(type1!.getName(), "i32")).assertTrue();

        let arr2: FixedArray<double> = [1.5, 2.5, 3.5];
        let cls2 = Class.of(arr2);
        let type2 = cls2.getFixedArrayComponentType();
        expect(type2 !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(type2!.getName(), "double")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6100
     * @tc.name testClassGetFixedArrayComponentType061
     * @tc.desc Verify ClassGetFixedArrayComponentType case 061: type after array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let anyArr: Any = arr;
        let cls = Class.ofAny(anyArr);
        let componentType = cls!.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6200
     * @tc.name testClassGetFixedArrayComponentType062
     * @tc.desc Verify ClassGetFixedArrayComponentType case 062: method in different API is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6300
     * @tc.name testClassGetFixedArrayComponentType063
     * @tc.desc Verify ClassGetFixedArrayComponentType case 063: different type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        let arr: FixedArray<int> = [];
        let cls = Class.of(arr);
        let componentType = cls.getFixedArrayComponentType();
        expect(componentType !== null).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(componentType!.getName(), "i32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6400
     * @tc.name testClassGetFixedArrayComponentType064
     * @tc.desc Verify ClassGetFixedArrayComponentType case 064: isFixedArray is true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedArr: FixedArray<int> = [1, 2, 3];
        let normalArr: Array<int> = [1, 2, 3];

        let cls1 = Class.of(fixedArr);
        let cls2 = Class.of(normalArr);

        expect(cls1.isFixedArray()).assertTrue();
        let type1 = cls1.getFixedArrayComponentType();
        expect(type1 !== null).assertTrue();

        expect(cls2.isFixedArray()).assertFalse();
        let type2 = cls2.getFixedArrayComponentType();
        expect(Utils.isAbsentReflectOptional(type2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETFIXEDARRAYCOMPONENTTYPE_6500
     * @tc.name testClassGetFixedArrayComponentType065
     * @tc.desc Verify ClassGetFixedArrayComponentType case 065: primitive FixedArray component type names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetFixedArrayComponentType065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: FixedArray<byte> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b1).getFixedArrayComponentType()!.getName(), "byte")).assertTrue();
        let b2: FixedArray<short> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b2).getFixedArrayComponentType()!.getName(), "short")).assertTrue();
        let b3: FixedArray<int> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b3).getFixedArrayComponentType()!.getName(), "i32")).assertTrue();
        let b4: FixedArray<long> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b4).getFixedArrayComponentType()!.getName(), "long")).assertTrue();
        let b5: FixedArray<float> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b5).getFixedArrayComponentType()!.getName(), "float")).assertTrue();
        let b6: FixedArray<double> = [];
        expect(Utils.reflectScalarTypeNameMatches(Class.of(b6).getFixedArrayComponentType()!.getName(), "double")).assertTrue();
        let boolArr: FixedArray<boolean> = [];
        expect(Class.of(boolArr).getFixedArrayComponentType()!.getName()).assertEqual("std.core.Boolean");
        let charArr: FixedArray<char> = [];
        expect(Class.of(charArr).getFixedArrayComponentType()!.getName()).assertEqual("std.core.Char");
        let strArr: FixedArray<string> = [];
        expect(Class.of(strArr).getFixedArrayComponentType()!.getName()).assertEqual("std.core.String");
    });

  });
}
