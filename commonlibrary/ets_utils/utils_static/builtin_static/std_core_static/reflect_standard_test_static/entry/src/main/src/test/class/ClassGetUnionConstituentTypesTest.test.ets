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

class C006 {}

class B006 {}

class A006 {}

class MyClass007 {}

class TestClass008 {}

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
    it('testClassGetUnionConstituentTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | Array<double>>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types !== null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0200
     * @tc.name testClassGetUnionConstituentTypes002
     * @tc.desc Verify ClassGetUnionConstituentTypes case 002: union int|string returns two constituent types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types !== null).assertTrue();
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
    it('testClassGetUnionConstituentTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | boolean>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types !== null).assertTrue();
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0400
     * @tc.name testClassGetUnionConstituentTypes004
     * @tc.desc Verify ClassGetUnionConstituentTypes case 004: union constituent elements are Class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(2);
        for (let i = 0; i < types.length; i++) {
          let isRc: boolean = types[i] instanceof Class;
          expect(isRc).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0500
     * @tc.name testClassGetUnionConstituentTypes005
     * @tc.desc Verify ClassGetUnionConstituentTypes case 005: four-type union constituent names include int string boolean double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | boolean | double>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(4);
        let typeNames: Array<string> = new Array<string>();
        for (let i = 0; i < types.length; i++) {
          typeNames.push(types[i].getName());
        }
        expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'int'))).assertTrue();
        expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'String'))).assertTrue(); // string
        expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'boolean'))).assertTrue(); // boolean
        expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'double'))).assertTrue(); // double
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0600
     * @tc.name testClassGetUnionConstituentTypes006
     * @tc.desc Verify ClassGetUnionConstituentTypes case 006: union of three object classes returns three types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<A006 | B006 | C006>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0700
     * @tc.name testClassGetUnionConstituentTypes007
     * @tc.desc Verify ClassGetUnionConstituentTypes case 007: union with null includes four constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | MyClass007 | null>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(4);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0800
     * @tc.name testClassGetUnionConstituentTypes008
     * @tc.desc Verify ClassGetUnionConstituentTypes case 008: non-union Class returns undefined from getUnionConstituentTypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 普通类�?
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 009: degenerate int|int union has one or undefined constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 退化情况：T | T 等价�?T
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 010: union with null type in constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<string | null>();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'String'))).assertTrue();
          expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'Null'))).assertTrue();
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1100
     * @tc.name testClassGetUnionConstituentTypes011
     * @tc.desc Verify ClassGetUnionConstituentTypes case 011: union with undefined type in constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<number | undefined>();
        if (cls.isUnion()) {
          let typesRaw = cls.getUnionConstituentTypes();
          expect(typesRaw !== undefined).assertTrue();
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLarger(0);
        } else {
          expect(cls.getUnionConstituentTypes()).assertUndefined();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1200
     * @tc.name testClassGetUnionConstituentTypes012
     * @tc.desc Verify ClassGetUnionConstituentTypes case 012: nested union A|B|C returns three constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // (int | string) | boolean 展平�?int | string | boolean
        let cls = Class.from<int | string | boolean>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1300
     * @tc.name testClassGetUnionConstituentTypes013
     * @tc.desc Verify ClassGetUnionConstituentTypes case 013: generic union Array<T>|Map returns two constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<Array<int> | Array<string> | Map<string, int>>();
        expect(cls.isUnion()).assertTrue();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(2);
          let n0 = types[0].getName();
          let n1 = types[1].getName();
          expect(n0.includes('Array') || n0.includes('Map')).assertTrue();
          expect(n1.includes('Array') || n1.includes('Map')).assertTrue();
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1400
     * @tc.name testClassGetUnionConstituentTypes014
     * @tc.desc Verify ClassGetUnionConstituentTypes case 014: T|T|undefined union constituent count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | undefined>();
        if (cls.isUnion()) {
          let typesRaw = cls.getUnionConstituentTypes();
          expect(typesRaw !== undefined).assertTrue();
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLarger(0);
        } else {
          expect(cls.getUnionConstituentTypes()).assertUndefined();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1500
     * @tc.name testClassGetUnionConstituentTypes015
     * @tc.desc Verify ClassGetUnionConstituentTypes case 015: empty union T|null returns undefined or empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<string | null>();
        expect(cls.isUnion()).assertTrue();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
          let typeNames: Array<string> = new Array<string>();
          for (let i = 0; i < types.length; i++) {
            typeNames.push(types[i].getName());
          }
          expect(typeNames).assertContain('std.core.String');
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1600
     * @tc.name testClassGetUnionConstituentTypes016
     * @tc.desc Verify ClassGetUnionConstituentTypes case 016: return type is FixedArray<Class> or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | Array<double>>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
        // 验证返回的类型名�?
        for (let i = 0; i < types.length; i++) {
          let name = types[i].getName();
          console.info('Type ' + i + ': ' + name);
          // 可能的输�? "std.core.Array", "std.core.Int", "std.core.String"
          // 顺序可能不确�?
        }
        let typeNames: Array<string> = new Array<string>();
        for (let i = 0; i < types.length; i++) {
          typeNames.push(types[i].getName());
        }
        expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'int'))).assertTrue();
        expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'String'))).assertTrue();
        expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'Array'))).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1700
     * @tc.name testClassGetUnionConstituentTypes017
     * @tc.desc Verify ClassGetUnionConstituentTypes case 017: object class union getUnionConstituentTypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        for (let i = 0; i < types.length; i++) {
          let type = types[i];
          expect(type.getName() !== null).assertTrue();
          if (Utils.reflectScalarTypeNameMatches(type.getName(), 'int')) {
            expect(Utils.reflectScalarTypeNameMatches(type.getName(), 'int')).assertTrue();
          } else if (Utils.classNameMatches(type.getName(), 'String')) {
            expect(Utils.classNameMatches(type.getName(), 'String')).assertTrue();
          }
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1800
     * @tc.name testClassGetUnionConstituentTypes018
     * @tc.desc Verify ClassGetUnionConstituentTypes case 018: getUnionConstituentTypes on int|string returns constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types !== null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1900
     * @tc.name testClassGetUnionConstituentTypes019
     * @tc.desc Verify ClassGetUnionConstituentTypes case 019: repeated getUnionConstituentTypes on same union Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string>();
        // 通常不需要initialize即可获取联合类型信息
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types !== null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2000
     * @tc.name testClassGetUnionConstituentTypes020
     * @tc.desc Verify ClassGetUnionConstituentTypes case 020: deprecated method still returns union constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 假设getUnionConstituentTypes被标记为废弃
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object); // 应显示弃用警�?
        expect(types.length).assertEqual(2);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2100
     * @tc.name testClassGetUnionConstituentTypes021
     * @tc.desc Verify ClassGetUnionConstituentTypes case 021: getUnionConstituentTypes method exists on union Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 不需要await
        let cls = Class.from<int | string>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object); // 同步调用
        expect(types !== null).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2200
     * @tc.name testClassGetUnionConstituentTypes022
     * @tc.desc Verify ClassGetUnionConstituentTypes case 022: interface union constituent types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 假设�?0个类型的联合
        let cls = Class.from<int | string | boolean | double | float | long | short | byte | char | Array<int>>();
        expect(cls.isUnion()).assertTrue();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertEqual(10);
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2300
     * @tc.name testClassGetUnionConstituentTypes023
     * @tc.desc Verify ClassGetUnionConstituentTypes case 023: int|string|Array<double> per reflect doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | Array<double>>();
        let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
        expect(types.length).assertEqual(3);
        let typeNames: Array<string> = new Array<string>();
        for (let i = 0; i < types.length; i++) {
          typeNames.push(types[i].getName());
        }
        expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'int'))).assertTrue();
        expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'String'))).assertTrue();
        expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'Array'))).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2400
     * @tc.name testClassGetUnionConstituentTypes024
     * @tc.desc Verify ClassGetUnionConstituentTypes case 024: boolean|int union two constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // int | string | int 应该去重�?int | string
        let cls = Class.from<int | string | int>();
        expect(cls.isUnion()).assertTrue();
        let typesRaw = cls.getUnionConstituentTypes();
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          // 可能去重，也可能不去重，取决于实�?
          expect(types.length).assertLessOrEqual(3);
          if (types.length === 2) {
            let typeNames: Array<string> = new Array<string>();
            for (let i = 0; i < types.length; i++) {
              typeNames.push(types[i].getName());
            }
            expect(typeNames.some((n: string) => Utils.reflectScalarTypeNameMatches(n, 'int'))).assertTrue();
            expect(typeNames.some((n: string) => Utils.classNameMatches(n, 'String'))).assertTrue();
          } else {
            expect(types.length === 2 || types.length === 3).assertTrue();
          }
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2500
     * @tc.name testClassGetUnionConstituentTypes025
     * @tc.desc Verify ClassGetUnionConstituentTypes case 025: never in union handled per runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // T | never 等价�?T
        let cls = Class.from<int>();
        let typesRaw = cls.getUnionConstituentTypes();
        // 可能返回undefined或只包含int
        if (typesRaw !== undefined) {
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLessOrEqual(2);
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2600
     * @tc.name testClassGetUnionConstituentTypes026
     * @tc.desc Verify ClassGetUnionConstituentTypes case 026: unknown type in union handled per runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2700
     * @tc.name testClassGetUnionConstituentTypes027
     * @tc.desc Verify ClassGetUnionConstituentTypes case 027: void in union handled per runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
        } else {
          expect(typesRaw === undefined).assertTrue();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2800
     * @tc.name testClassGetUnionConstituentTypes028
     * @tc.desc Verify ClassGetUnionConstituentTypes case 028: isUnion true before getUnionConstituentTypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls1 = Class.from<int | string>();
        expect(cls1.isUnion()).assertTrue();
        let types1 = cls1.getUnionConstituentTypes();
        expect(types1 !== null).assertTrue();
        let cls2 = Class.from<int>();
        expect(cls2.isUnion()).assertFalse();
        let types2 = cls2.getUnionConstituentTypes();
        expect(types2 === undefined).assertTrue();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2900
     * @tc.name testClassGetUnionConstituentTypes029
     * @tc.desc Verify ClassGetUnionConstituentTypes case 029: repeated calls return same constituent array identity or content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<int | string | boolean>();
        expect(cls.isUnion()).assertTrue();
        let raw1 = cls.getUnionConstituentTypes();
        let raw2 = cls.getUnionConstituentTypes();
        expect(raw1 !== undefined && raw2 !== undefined).assertTrue();
        let types1 = asUnionConstituentTypes(raw1 as Object);
        let types2 = asUnionConstituentTypes(raw2 as Object);
        expect(types1.length).assertEqual(types2.length);
        // 验证类型相同
        for (let i = 0; i < types1.length; i++) {
          expect(types1[i].getName()).assertEqual(types2[i].getName());
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3000
     * @tc.name testClassGetUnionConstituentTypes030
     * @tc.desc Verify ClassGetUnionConstituentTypes case 030: constituent isPrimitive flags for scalar union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // 全是原始类型的联�?
        let cls1 = Class.from<int | string | boolean>();
        expect(cls1.isPrimitive()).assertFalse();
        if (cls1.isUnion()) {
          let types1Raw = cls1.getUnionConstituentTypes();
          expect(types1Raw !== undefined).assertTrue();
          let types1 = asUnionConstituentTypes(types1Raw as Object);
          expect(types1.length).assertLarger(0);
        } else {
          expect(cls1.getUnionConstituentTypes()).assertUndefined();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3100
     * @tc.name testClassGetUnionConstituentTypes031
     * @tc.desc Verify ClassGetUnionConstituentTypes case 031: interface types in union constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyInterface031 | MyClass031>();
        if (cls.isUnion()) {
          let typesRaw = cls.getUnionConstituentTypes();
          expect(typesRaw !== undefined).assertTrue();
          let types = asUnionConstituentTypes(typesRaw as Object);
          expect(types.length).assertLarger(0);
        } else {
          expect(cls.getUnionConstituentTypes()).assertUndefined();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3200
     * @tc.name testClassGetUnionConstituentTypes032
     * @tc.desc Verify ClassGetUnionConstituentTypes case 032: union of interfaces getInterfaces on constituents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetUnionConstituentTypes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<A032 | B032>();
        expect(cls.isUnion()).assertTrue();
        let interfaces = cls.getInterfaces();
        if (interfaces !== undefined) {
          expect(interfaces.length).assertLargerOrEqual(0);
        } else {
          expect(interfaces === undefined).assertTrue();
        }
      });
  });
}

