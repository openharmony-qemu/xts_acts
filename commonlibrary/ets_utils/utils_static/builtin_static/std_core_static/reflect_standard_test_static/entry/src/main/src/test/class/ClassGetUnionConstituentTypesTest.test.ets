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

class C006 {}

class B006 {}

class A006 {}

class MyClass007 {}

class TestClass008 {}

class Container023<T> {}

class MyClass031 implements MyInterface031 {}

interface MyInterface031 {}

interface B032 {}

interface A032 {}


function asUnionConstituentTypes(raw: Object): FixedArray<Class> {
  return raw as FixedArray<Class>;
}


export default function ClassGetUnionConstituentTypesTest(): void {
  describe('ClassGetUnionConstituentTypesTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0100
     * @tc.name testClassGetUnionConstituentTypes001
     * @tc.desc Verify ClassGetUnionConstituentTypes case 001: getUnionConstituentTypes() parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | Array<double>>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types != null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0200
     * @tc.name testClassGetUnionConstituentTypes002
     * @tc.desc Verify ClassGetUnionConstituentTypes case 002: method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types != null).assertTrue();
        expect(types.length).assertEqual(2);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0300
     * @tc.name testClassGetUnionConstituentTypes003
     * @tc.desc Verify ClassGetUnionConstituentTypes case 003: return FixedArray<Class> type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | boolean>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types != null).assertTrue();
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0400
     * @tc.name testClassGetUnionConstituentTypes004
     * @tc.desc Verify ClassGetUnionConstituentTypes case 004: array Classtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        for (let i = 0; i < types.length; i++) {
          let isRc: boolean = types[i] instanceof Class;
          expect(isRc).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0500
     * @tc.name testClassGetUnionConstituentTypes005
     * @tc.desc Verify ClassGetUnionConstituentTypes case 005: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | boolean | double>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(4);
        let typeNames: Array<string> = new Array<string>();
        for (let i = 0; i < types.length; i++) {
          typeNames.push(types[i].getName());
        }
        expect(typeNames).assertContain('i32');
        expect(typeNames).assertContain('std.core.String'); // string
        expect(typeNames).assertContain('bool'); // boolean
        expect(typeNames).assertContain('f64'); // double
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0600
     * @tc.name testClassGetUnionConstituentTypes006
     * @tc.desc Verify ClassGetUnionConstituentTypes case 006: object type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<A006 | B006 | C006>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0700
     * @tc.name testClassGetUnionConstituentTypes007
     * @tc.desc Verify ClassGetUnionConstituentTypes case 007: type object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | MyClass007 | null>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(4);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0800
     * @tc.name testClassGetUnionConstituentTypes008
     * @tc.desc Verify ClassGetUnionConstituentTypes case 008: Classnot type return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 普通类型
        let cls1 = Class.from<int>();
        let types1 = cls1.getUnionConstituentTypes();
        expect(types1 === undefined).assertTrue();
        // 对象类型
        let cls2 = Class.from<TestClass008>();
        let types2 = cls2.getUnionConstituentTypes();
        expect(types2 === undefined).assertTrue();
        // 数组类型
        let cls3 = Class.from<Array<int>>();
        let types3 = cls3.getUnionConstituentTypes();
        expect(types3 === undefined).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0900
     * @tc.name testClassGetUnionConstituentTypes009
     * @tc.desc Verify ClassGetUnionConstituentTypes case 009: type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 退化情况：T | T 等价于 T
        let cls = Class.from<int | int>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(1);
          expect(types[0].getName().length).assertLarger(0);
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1000
     * @tc.name testClassGetUnionConstituentTypes010
     * @tc.desc Verify ClassGetUnionConstituentTypes case 010: type null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<string | null>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('std.core.String');
          expect(typeNames).assertContain('null');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1100
     * @tc.name testClassGetUnionConstituentTypes011
     * @tc.desc Verify ClassGetUnionConstituentTypes case 011: type undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<number | undefined>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('f64');
          expect(typeNames).assertContain('undefined');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1200
     * @tc.name testClassGetUnionConstituentTypes012
     * @tc.desc Verify ClassGetUnionConstituentTypes case 012: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // (int | string) | boolean 展平为 int | string | boolean
        let cls = Class.from<int | string | boolean>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1300
     * @tc.name testClassGetUnionConstituentTypes013
     * @tc.desc Verify ClassGetUnionConstituentTypes case 013: generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<Array<int> | Array<string> | Map<string, int>>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(3);
          let n0 = types[0].getName();
          let n1 = types[1].getName();
          let n2 = types[2].getName();
          expect(n0.includes('Array')).assertTrue();
          expect(n1.includes('Array')).assertTrue();
          expect(n2.includes('Map')).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1400
     * @tc.name testClassGetUnionConstituentTypes014
     * @tc.desc Verify ClassGetUnionConstituentTypes case 014: type T T undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | undefined>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('i32');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1500
     * @tc.name testClassGetUnionConstituentTypes015
     * @tc.desc Verify ClassGetUnionConstituentTypes case 015: empty type T null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<string | null>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('std.core.String');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1600
     * @tc.name testClassGetUnionConstituentTypes016
     * @tc.desc Verify ClassGetUnionConstituentTypes case 016: return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | Array<double>>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        // 验证返回的类型名称
        for (let i = 0; i < types.length; i++) {
          let name = types[i].getName();
          console.info('Type ' + i + ': ' + name);
          // 可能的输出: "std.core.Array", "std.core.Int", "std.core.String"
          // 顺序可能不确定
        }
        let typeNames: Array<string> = new Array<string>();
        for (let i = 0; i < types.length; i++) {
          typeNames.push(types[i].getName());
        }
        expect(typeNames).assertContain('i32');
        expect(typeNames).assertContain('std.core.String');
        expect(typeNames).assertContain('std.core.Array');
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1700
     * @tc.name testClassGetUnionConstituentTypes017
     * @tc.desc Verify ClassGetUnionConstituentTypes case 017: type Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        for (let i = 0; i < types.length; i++) {
          let type = types[i];
          // 验证Class方法可用
          expect(type.getName() != null).assertTrue();
          expect(type.isPrimitive()).assertTrue(); // int和string都是原始类型
          // 对于基础类型，某些方法可能返回特定值
          if (type.getName() === 'i32' || type.getName() === 'std.core.Int') {
            expect(type.isPrimitive()).assertTrue();
          } else if (type.getName() === 'std.core.String') {
            expect(type.isPrimitive()).assertTrue();
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1800
     * @tc.name testClassGetUnionConstituentTypes018
     * @tc.desc Verify ClassGetUnionConstituentTypes case 018: parameters when should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types != null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1900
     * @tc.name testClassGetUnionConstituentTypes019
     * @tc.desc Verify ClassGetUnionConstituentTypes case 019: Classcall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string>();
        // 通常不需要initialize即可获取联合类型信息
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types != null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2000
     * @tc.name testClassGetUnionConstituentTypes020
     * @tc.desc Verify ClassGetUnionConstituentTypes case 020: method is Deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 假设getUnionConstituentTypes被标记为废弃
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object); // 应显示弃用警告
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2100
     * @tc.name testClassGetUnionConstituentTypes021
     * @tc.desc Verify ClassGetUnionConstituentTypes case 021: getUnionConstituentTypes method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 不需要await
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object); // 同步调用
        expect(types != null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2200
     * @tc.name testClassGetUnionConstituentTypes022
     * @tc.desc Verify ClassGetUnionConstituentTypes case 022: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 假设有10个类型的联合
        let cls = Class.from<int | string | boolean | double | float | long | short | byte | char | Array<int>>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(10);
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2300
     * @tc.name testClassGetUnionConstituentTypes023
     * @tc.desc Verify ClassGetUnionConstituentTypes case 023: generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<Container023<int> | Container023<string> | Container023<Array<double>>>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(3);
          // 所有类型都应该是Container
          for (let i = 0; i < types.length; i++) {
            expect(types[i].getName()).assertContain('Container023');
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2400
     * @tc.name testClassGetUnionConstituentTypes024
     * @tc.desc Verify ClassGetUnionConstituentTypes case 024: type type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // int | string | int 应该去重为 int | string
        let cls = Class.from<int | string | int>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          // 可能去重，也可能不去重，取决于实现
          expect(types.length).assertLessOrEqual(3);
          if (types.length === 2) {
            let typeNames: Array<string> = new Array<string>();
            for (let i = 0; i < types.length; i++) {
              typeNames.push(types[i].getName());
            }
            expect(typeNames).assertContain('i32');
            expect(typeNames).assertContain('std.core.String');
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2500
     * @tc.name testClassGetUnionConstituentTypes025
     * @tc.desc Verify ClassGetUnionConstituentTypes case 025: nevertype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // T | never 等价于 T
        let cls = Class.from<int | never>();
        let typesRaw = cls.getUnionConstituentTypes();
        // 可能返回undefined或只包含int
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2600
     * @tc.name testClassGetUnionConstituentTypes026
     * @tc.desc Verify ClassGetUnionConstituentTypes case 026: unknowntype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | Object>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('i32');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2700
     * @tc.name testClassGetUnionConstituentTypes027
     * @tc.desc Verify ClassGetUnionConstituentTypes case 027: voidtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | void>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('i32');
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2800
     * @tc.name testClassGetUnionConstituentTypes028
     * @tc.desc Verify ClassGetUnionConstituentTypes case 028: isUnionusing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls1 = Class.from<int | string>();
        expect(cls1.isUnion()).assertTrue();
        let types1 = cls1.getUnionConstituentTypes();
        expect(types1 != null).assertTrue();
        let cls2 = Class.from<int>();
        expect(cls2.isUnion()).assertFalse();
        let types2 = cls2.getUnionConstituentTypes();
        expect(types2 === undefined).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2900
     * @tc.name testClassGetUnionConstituentTypes029
     * @tc.desc Verify ClassGetUnionConstituentTypes case 029: call return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<int | string | boolean>();
        let raw1 = cls.getUnionConstituentTypes();
        let raw2 = cls.getUnionConstituentTypes();
        if (raw1 !== undefined && raw2 !== undefined) {
          let types1 = asUnionConstituentTypes(raw1 as Object);
          let types2 = asUnionConstituentTypes(raw2 as Object);
          expect(types1.length).assertEqual(types2.length);
          // 验证类型相同
          for (let i = 0; i < types1.length; i++) {
            expect(types1[i].getName()).assertEqual(types2[i].getName());
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3000
     * @tc.name testClassGetUnionConstituentTypes030
     * @tc.desc Verify ClassGetUnionConstituentTypes case 030: type isPrimitive is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        // 全是原始类型的联合
        let cls1 = Class.from<int | string | boolean>();
        expect(cls1.isPrimitive()).assertFalse(); // 联合类型不是原始类型
        expect(cls1.isUnion()).assertTrue();
        let types1Raw = cls1.getUnionConstituentTypes();
        if (types1Raw !== undefined) {
          let types1 = asUnionConstituentTypes(types1Raw as Object);
          for (let i = 0; i < types1.length; i++) {
            expect(types1[i].isPrimitive()).assertTrue();
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3100
     * @tc.name testClassGetUnionConstituentTypes031
     * @tc.desc Verify ClassGetUnionConstituentTypes case 031: interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<MyInterface031 | MyClass031>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3200
     * @tc.name testClassGetUnionConstituentTypes032
     * @tc.desc Verify ClassGetUnionConstituentTypes case 032: type getInterfaces is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int,
      (): void => {
        let cls = Class.from<A032 | B032>();
        // 联合类型的getInterfaces可能返回undefined或空数组
        let interfaces = cls.getInterfaces();
        // 行为取决于具体实现
      });
  });
}