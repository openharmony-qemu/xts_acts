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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class C006 {}

class B006 {}

class A006 {}

class MyClass007 {}

class TestClass008 {}

interface B032 {}

interface A032 {}

function asUnionConstituentTypes(raw: Object): FixedArray<Class> {
  return raw as FixedArray<Class>;
}

function unionHasConstituentNamed(types: FixedArray<Class>, name: string): boolean {
  for (let i = 0; i < types.length; i++) {
    if (types[i].getName() === name) {
      return true;
    }
  }
  return false;
}

export default function ClassGetUnionConstituentTypesTest(): void {
  describe('ClassGetUnionConstituentTypesTest', (): void => {
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 001: Class.from<int | string | Array<double>>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 002: Class.from<int | string>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 003: Class.from<int | string | boolean>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 004: Class.from<int | string>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 005: Class.from<int | string | boolean | double>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean | double>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(4);
      expect(unionHasConstituentNamed(types, Class.from<int>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<string>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<boolean>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<double>().getName())).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0600
     * @tc.name testClassGetUnionConstituentTypes006
     * @tc.desc Verify ClassGetUnionConstituentTypes case 006: Class.from<A006 | B006 | C006>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 007: Class.from<int | string | MyClass007 | null>(), getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 008: Class.from<int>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int>();
      let types1 = cls1.getUnionConstituentTypes();
      expect(types1 === undefined).assertTrue();
      let cls2 = Class.from<TestClass008>();
      let types2 = cls2.getUnionConstituentTypes();
      expect(types2 === undefined).assertTrue();
      let cls3 = Class.from<Array<int>>();
      let types3 = cls3.getUnionConstituentTypes();
      expect(types3 === undefined).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_0900
     * @tc.name testClassGetUnionConstituentTypes009
     * @tc.desc Verify ClassGetUnionConstituentTypes case 009: Class.from<int | int>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | int>();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1000
     * @tc.name testClassGetUnionConstituentTypes010
     * @tc.desc Verify ClassGetUnionConstituentTypes case 010: Class.from<string | null>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<string | null>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(unionHasConstituentNamed(types, Class.from<string>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, 'std.core.Null')).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1100
     * @tc.name testClassGetUnionConstituentTypes011
     * @tc.desc Verify ClassGetUnionConstituentTypes case 011: Class.from<number | undefined>(), isUnion returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<number | undefined>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1200
     * @tc.name testClassGetUnionConstituentTypes012
     * @tc.desc Verify ClassGetUnionConstituentTypes case 012: Class.from<int | string | boolean>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1300
     * @tc.name testClassGetUnionConstituentTypes013
     * @tc.desc Verify ClassGetUnionConstituentTypes case 013: Class.from<Array<int> | Array<string> | Map<string, int>>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int> | Array<string> | Map<string, int>>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual(Class.from<Array<int>>().getName());
      expect(types[1].getName()).assertEqual(Class.from<Map<string, int>>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1400
     * @tc.name testClassGetUnionConstituentTypes014
     * @tc.desc Verify ClassGetUnionConstituentTypes case 014: Class.from<int | undefined>(), isUnion returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | undefined>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1500
     * @tc.name testClassGetUnionConstituentTypes015
     * @tc.desc Verify ClassGetUnionConstituentTypes case 015: Class.from<string | null>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<string | null>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(unionHasConstituentNamed(types, Class.from<string>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, 'std.core.Null')).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1600
     * @tc.name testClassGetUnionConstituentTypes016
     * @tc.desc Verify ClassGetUnionConstituentTypes case 016: Class.from<int | string | Array<double>>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | Array<double>>();
      expect(cls.isUnion()).assertTrue();
      let raw1 = cls.getUnionConstituentTypes();
      let raw2 = cls.getUnionConstituentTypes();
      expect(raw1 !== undefined && raw2 !== undefined).assertTrue();
      let types = asUnionConstituentTypes(raw1 as Object);
      expect(types.length).assertEqual(3);
      expect(unionHasConstituentNamed(types, Class.from<int>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<string>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<Array<double>>().getName())).assertTrue();
      let typesAgain = asUnionConstituentTypes(raw2 as Object);
      expect(typesAgain.length).assertEqual(types.length);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1700
     * @tc.name testClassGetUnionConstituentTypes017
     * @tc.desc Verify ClassGetUnionConstituentTypes case 017: Class.from<int | string>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      for (let i = 0; i < types.length; i++) {
        expect(types[i].isUnion()).assertFalse();
      }
      expect(types[0].getName()).assertEqual(Class.from<int>().getName());
      expect(types[1].getName()).assertEqual(Class.from<string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1800
     * @tc.name testClassGetUnionConstituentTypes018
     * @tc.desc Verify ClassGetUnionConstituentTypes case 018: Class.from<int | string>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual(Class.from<int>().getName());
      expect(types[1].getName()).assertEqual(Class.from<string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_1900
     * @tc.name testClassGetUnionConstituentTypes019
     * @tc.desc Verify ClassGetUnionConstituentTypes case 019: Class.from<int | string>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let types1 = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      let types2 = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types1.length).assertEqual(types2.length);
      for (let i = 0; i < types1.length; i++) {
        expect(types1[i].getName()).assertEqual(types2[i].getName());
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2000
     * @tc.name testClassGetUnionConstituentTypes020
     * @tc.desc Verify ClassGetUnionConstituentTypes case 020: Class.from<int | string>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2100
     * @tc.name testClassGetUnionConstituentTypes021
     * @tc.desc Verify ClassGetUnionConstituentTypes case 021: Class.from<int | string>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let typesRaw = cls.getUnionConstituentTypes();
      expect(typesRaw !== undefined && typesRaw !== null).assertTrue();
      let types = asUnionConstituentTypes(typesRaw as Object);
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual(Class.from<int>().getName());
      expect(types[1].getName()).assertEqual(Class.from<string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2200
     * @tc.name testClassGetUnionConstituentTypes022
     * @tc.desc Verify ClassGetUnionConstituentTypes case 022: Class.from<int | string | boolean | double | float | long | short | byte | char | Array<int>>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean | double | float | long | short | byte | char | Array<int>>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2300
     * @tc.name testClassGetUnionConstituentTypes023
     * @tc.desc Verify ClassGetUnionConstituentTypes case 023: Class.from<int | string | Array<double>>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | Array<double>>();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(3);
      expect(unionHasConstituentNamed(types, Class.from<int>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<string>().getName())).assertTrue();
      expect(unionHasConstituentNamed(types, Class.from<Array<double>>().getName())).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2400
     * @tc.name testClassGetUnionConstituentTypes024
     * @tc.desc Verify ClassGetUnionConstituentTypes case 024: Class.from<int | string | int>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | int>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual(Class.from<int>().getName());
      expect(types[1].getName()).assertEqual(Class.from<string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2500
     * @tc.name testClassGetUnionConstituentTypes025
     * @tc.desc Verify ClassGetUnionConstituentTypes case 025: Class.from<int>(), getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2600
     * @tc.name testClassGetUnionConstituentTypes026
     * @tc.desc Verify ClassGetUnionConstituentTypes case 026: Class.from<int | Object>(), isUnion returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | Object>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2700
     * @tc.name testClassGetUnionConstituentTypes027
     * @tc.desc Verify ClassGetUnionConstituentTypes case 027: Class.from<string | void>(), isUnion returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<string | void>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_2800
     * @tc.name testClassGetUnionConstituentTypes028
     * @tc.desc Verify ClassGetUnionConstituentTypes case 028: Class.from<int | string>(), isUnion returns true, getUnionConstituentTypes() result verified
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
     * @tc.desc Verify ClassGetUnionConstituentTypes case 029: Class.from<int | string | boolean>(), isUnion returns true, getUnionConstituentTypes() result verified
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
      for (let i = 0; i < types1.length; i++) {
        expect(types1[i].getName()).assertEqual(types2[i].getName());
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3000
     * @tc.name testClassGetUnionConstituentTypes030
     * @tc.desc Verify ClassGetUnionConstituentTypes case 030: Class.from<int | string | boolean>(), isUnion returns true, isPrimitive returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int | string | boolean>();
      expect(cls1.isPrimitive()).assertFalse();
      expect(cls1.isUnion()).assertTrue();
      let types1 = asUnionConstituentTypes(cls1.getUnionConstituentTypes() as Object);
      expect(types1.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3100
     * @tc.name testClassGetUnionConstituentTypes031
     * @tc.desc Verify ClassGetUnionConstituentTypes case 031: Class.from<A032 | B032>(), isUnion returns true, isInterface returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A032 | B032>();
      expect(cls.isUnion()).assertTrue();
      let types = asUnionConstituentTypes(cls.getUnionConstituentTypes() as Object);
      expect(types.length).assertEqual(2);
      expect(types[0].isInterface()).assertTrue();
      expect(types[1].isInterface()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETUNIONCONSTITUENTTYPES_3200
     * @tc.name testClassGetUnionConstituentTypes032
     * @tc.desc Verify ClassGetUnionConstituentTypes case 032: Class.from<A032 | B032>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetUnionConstituentTypes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A032 | B032>();
      expect(cls.isUnion()).assertTrue();
      let interfaces = cls.getInterfaces();
      expect(interfaces !== undefined).assertTrue();
      expect(interfaces!.length).assertLargerOrEqual(0);
    });
  });
}

