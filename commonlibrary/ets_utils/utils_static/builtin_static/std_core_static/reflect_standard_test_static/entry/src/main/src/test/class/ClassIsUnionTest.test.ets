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

class MyClass001 {}

class MyClass008 {}

interface MyInterface009 {}

enum TestEnum012 {
  VALUE1,
  VALUE2
}

function getValue044(): int | string {
  return 42;
}

function acceptUnion043(_v: int | string): void {
}

class MyClass045 {
  public value: int | string = 0
}

export default function ClassIsUnionTest(): void {
  describe('ClassIsUnionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0100
     * @tc.name testClassIsUnion001
     * @tc.desc Verify ClassIsUnion case 001: Class.of(instance), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: int | string = 42;
      let cls = Class.of(obj);
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0200
     * @tc.name testClassIsUnion002
     * @tc.desc Verify ClassIsUnion case 002: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let result = cls.isUnion();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0300
     * @tc.name testClassIsUnion003
     * @tc.desc Verify ClassIsUnion case 003: Class.from<int | string | boolean>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0400
     * @tc.name testClassIsUnion004
     * @tc.desc Verify ClassIsUnion case 004: Class.from<Array<int> | Map<string, int> | Set<double>>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int> | Map<string, int> | Set<double>>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0500
     * @tc.name testClassIsUnion005
     * @tc.desc Verify ClassIsUnion case 005: Class.from<int>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0600
     * @tc.name testClassIsUnion006
     * @tc.desc Verify ClassIsUnion case 006: Class.from<MyClass008>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0700
     * @tc.name testClassIsUnion007
     * @tc.desc Verify ClassIsUnion case 007: Class.from<MyInterface009>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface009>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0800
     * @tc.name testClassIsUnion008
     * @tc.desc Verify ClassIsUnion case 008: Class.from<Array<int>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int>>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_0900
     * @tc.name testClassIsUnion009
     * @tc.desc Verify ClassIsUnion case 009: Class.from<Map<string, int>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<string, int>>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1000
     * @tc.name testClassIsUnion010
     * @tc.desc Verify ClassIsUnion case 010: Class.from<TestEnum012>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum012>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1100
     * @tc.name testClassIsUnion011
     * @tc.desc Verify ClassIsUnion case 011: Class.from<int | int>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | int>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1200
     * @tc.name testClassIsUnion012
     * @tc.desc Verify ClassIsUnion case 012: Class.from<int | null>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | null>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1300
     * @tc.name testClassIsUnion013
     * @tc.desc Verify ClassIsUnion case 013: Class.from<string | undefined>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<string | undefined>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1400
     * @tc.name testClassIsUnion014
     * @tc.desc Verify ClassIsUnion case 014: Class.from<int | undefined>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | undefined>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1500
     * @tc.name testClassIsUnion015
     * @tc.desc Verify ClassIsUnion case 015: Class.from<int | string>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let result = cls.isUnion();
      expect(typeof result).assertEqual("boolean");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1600
     * @tc.name testClassIsUnion016
     * @tc.desc Verify ClassIsUnion case 016: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let name = cls.getName();
      expect(name).assertEqual(Class.from<int | string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1700
     * @tc.name testClassIsUnion017
     * @tc.desc Verify ClassIsUnion case 017: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let name1 = cls.getName();
      let name2 = cls.getName();
      expect(name1).assertEqual(name2);
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1800
     * @tc.name testClassIsUnion018
     * @tc.desc Verify ClassIsUnion case 018: Class.from<int | string>(), isUnion returns true, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      cls.initialize();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_1900
     * @tc.name testClassIsUnion019
     * @tc.desc Verify ClassIsUnion case 019: Class.from<int | long>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int | long>();
      expect(cls1.isUnion()).assertTrue();

      let cls2 = Class.from<byte | short>();
      expect(cls2.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2000
     * @tc.name testClassIsUnion020
     * @tc.desc Verify ClassIsUnion case 020: Class.from<float | double>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<float | double>();
      expect(cls1.isUnion()).assertTrue();

      let cls2 = Class.from<number | double>();
      expect(cls2.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2100
     * @tc.name testClassIsUnion021
     * @tc.desc Verify ClassIsUnion case 021: Class.from<boolean | int>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<boolean | int>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2200
     * @tc.name testClassIsUnion022
     * @tc.desc Verify ClassIsUnion case 022: Class.from<Array<int> | Array<string>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int> | Array<string>>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2300
     * @tc.name testClassIsUnion023
     * @tc.desc Verify ClassIsUnion case 023: Class.from<Map<int, string> | Map<string, int>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<int, string> | Map<string, int>>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2400
     * @tc.name testClassIsUnion024
     * @tc.desc Verify ClassIsUnion case 024: Class.from<Set<int> | Set<double>>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<int> | Set<double>>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2500
     * @tc.name testClassIsUnion025
     * @tc.desc Verify ClassIsUnion case 025: Class.from<int | Array<string>>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int | Array<string>>();
      expect(cls1.isUnion()).assertTrue();

      let cls2 = Class.from<string | Map<int, double>>();
      expect(cls2.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2600
     * @tc.name testClassIsUnion026
     * @tc.desc Verify ClassIsUnion case 026: Class.from<(int | string) | boolean>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<(int | string) | boolean>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2700
     * @tc.name testClassIsUnion027
     * @tc.desc Verify ClassIsUnion case 027: Class.from<int | string | Array<int> | Map<string, double>>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | Array<int> | Map<string, double>>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2800
     * @tc.name testClassIsUnion028
     * @tc.desc Verify ClassIsUnion case 028: Class.from<int | string | boolean>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean>();
      expect(cls.isUnion()).assertTrue();
      let types = cls.getUnionConstituentTypes();
      expect(types !== undefined).assertTrue();
      expect(types!.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_2900
     * @tc.name testClassIsUnion029
     * @tc.desc Verify ClassIsUnion case 029: Class.from<int>(), isUnion returns false, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getUnionConstituentTypes()).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3000
     * @tc.name testClassIsUnion030
     * @tc.desc Verify ClassIsUnion case 030: Class.from<int | string>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let types = cls.getUnionConstituentTypes();
      expect(types !== undefined).assertTrue();
      expect(types!.length).assertEqual(2);
      expect(types![0].getName()).assertEqual(Class.from<int>().getName());
      expect(types![1].getName()).assertEqual(Class.from<string>().getName());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3100
     * @tc.name testClassIsUnion031
     * @tc.desc Verify ClassIsUnion case 031: Class.from<int>(), isUnion returns false, getName returns "std.core.Int"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      expect(cls.isUnion()).assertFalse();
      expect(cls.getName()).assertEqual("std.core.Int");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3200
     * @tc.name testClassIsUnion032
     * @tc.desc Verify ClassIsUnion case 032: Class.from<int | string>(), isUnion returns true, isEnum returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      expect(cls.isEnum()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3300
     * @tc.name testClassIsUnion033
     * @tc.desc Verify ClassIsUnion case 033: Class.from<int | string>(), isUnion returns true, isPrimitive returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      expect(cls.isPrimitive()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3400
     * @tc.name testClassIsUnion034
     * @tc.desc Verify ClassIsUnion case 034: Class.from<int | string>(), isUnion returns true, isFixedArray returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      expect(cls.isFixedArray()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3500
     * @tc.name testClassIsUnion035
     * @tc.desc Verify ClassIsUnion case 035: Class.from<int | string | boolean | double | float | long | byte | short>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean | double | float | long | byte | short>();
      expect(cls.isUnion()).assertTrue();
      let types = cls.getUnionConstituentTypes();
      expect(types !== undefined).assertTrue();
      expect(types!.length).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3600
     * @tc.name testClassIsUnion036
     * @tc.desc Verify ClassIsUnion case 036: Class.from<int | string>(), isUnion returns true, getUnionConstituentTypes() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
      let types = cls.getUnionConstituentTypes();
      expect(types !== undefined).assertTrue();
      expect(types!.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3700
     * @tc.name testClassIsUnion037
     * @tc.desc Verify ClassIsUnion case 037: Class.from<int | void>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | void>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3800
     * @tc.name testClassIsUnion038
     * @tc.desc Verify ClassIsUnion case 038: Class.from<int | never>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | never>();
      expect(cls.isUnion()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_3900
     * @tc.name testClassIsUnion039
     * @tc.desc Verify ClassIsUnion case 039: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      acceptUnion043(1);
      let cls = Class.from<int | string>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4000
     * @tc.name testClassIsUnion040
     * @tc.desc Verify ClassIsUnion case 040: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(getValue044()).assertEqual(42);
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4100
     * @tc.name testClassIsUnion041
     * @tc.desc Verify ClassIsUnion case 041: Class.from<int | string>(), isUnion returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass045();
      expect(Class.of(obj).isUnion()).assertFalse();
      expect(Class.from<int | string>().isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4200
     * @tc.name testClassIsUnion042
     * @tc.desc Verify ClassIsUnion case 042: Class.from<int | string>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let result1 = cls.isUnion();
      let result2 = cls.isUnion();
      let result3 = cls.isUnion();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4300
     * @tc.name testClassIsUnion043
     * @tc.desc Verify ClassIsUnion case 043: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int | string>();
      let cls2 = Class.from<boolean | double>();
      let cls3 = Class.from<Array<int> | Map<string, int>>();

      expect(cls1.isUnion()).assertTrue();
      expect(cls2.isUnion()).assertTrue();
      expect(cls3.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4400
     * @tc.name testClassIsUnion044
     * @tc.desc Verify ClassIsUnion case 044: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int | string = 42;
      let cls = Class.from<int | string>();
      expect(value).assertEqual(42);
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4500
     * @tc.name testClassIsUnion045
     * @tc.desc Verify ClassIsUnion case 045: Class.from<string | boolean>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<string | boolean>();
      expect(cls.isUnion()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4600
     * @tc.name testClassIsUnion046
     * @tc.desc Verify ClassIsUnion case 046: Class.from<int | string>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unionCls = Class.from<int | string>();
      let intCls = Class.from<int>();
      let stringCls = Class.from<string>();

      expect(intCls.isSubtypeOf(unionCls)).assertTrue();
      expect(stringCls.isSubtypeOf(unionCls)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4700
     * @tc.name testClassIsUnion047
     * @tc.desc Verify ClassIsUnion case 047: Class.from<int | string>(), isSubtypeOf relationship verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<int | string>();
      let cls2 = Class.from<int | string | boolean>();

      expect(cls1.isSubtypeOf(cls2)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISUNION_4800
     * @tc.name testClassIsUnion048
     * @tc.desc Verify ClassIsUnion case 048: Class.from<int | string>(), isUnion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsUnion048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<int | string>().isUnion()).assertTrue();
      expect(Class.from<boolean | double>().isUnion()).assertTrue();
      expect(Class.from<Array<int> | Map<string, int>>().isUnion()).assertTrue();
      expect(Class.from<int>().isUnion()).assertFalse();
      expect(Class.from<MyClass001>().isUnion()).assertFalse();
    });

  });
}
