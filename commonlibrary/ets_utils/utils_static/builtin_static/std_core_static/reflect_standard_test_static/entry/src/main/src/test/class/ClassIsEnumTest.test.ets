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

function asStaticFieldEnum(fields: FixedArray<reflect.StaticField>): Array<reflect.StaticField> {
  return Utils.fixedArrayToArray(fields);
}

function asInstanceMethodEnum(methods: FixedArray<reflect.InstanceMethod>): Array<reflect.InstanceMethod> {
  return Utils.fixedArrayToArray(methods);
}

enum TestEnum001 {
  CLASS,
  METHOD
}

enum TestEnum003 {
  CLASS,
  METHOD
}

enum StringEnum004 {
  FIRST = "first",
  SECOND = "second"
}

enum MixedEnum005 {
  FIRST = 1,
  SECOND = 2,
  THIRD = 3
}

enum ConstEnum006 {
  A = 1,
  B = 2
}

enum EmptyEnum007 {
}

class MyClass008 {
  public name: string = "test";
}

interface MyInterface009 {
  name: string;
}

abstract class AbstractClass016 {
  public abstract method(): void;
}

class FinalClass017 {
  public name: string = "test";
}

enum BaseEnum018 {
  VALUE1
}

enum TestEnum019 {
  VALUE1,
  VALUE2
}

enum TestEnum020 {
  CLASS,
  METHOD
}

enum TestEnum021 {
  CLASS,
  METHOD
}

enum TestEnum022 {
  CLASS,
  METHOD
}

class MyClass023 {}

enum TestEnum023 {
  CLASS,
  METHOD
}

enum TestEnum024 {
  CLASS,
  METHOD
}

enum TestEnum025 {
  CLASS,
  METHOD
}

enum TestEnum026 {
  CLASS,
  METHOD
}

enum TestEnum027 {
  CLASS,
  METHOD
}

enum TestEnum028 {
  CLASS,
  METHOD
}

interface MyInterface029 {
  name: string;
}

enum TestEnum030 {
  CLASS,
  METHOD
}

enum TestEnum031 {
  CLASS,
  METHOD
}

enum TestEnum032 {
  CLASS,
  METHOD
}

enum TestEnum033 {
  CLASS,
  METHOD
}

enum TestEnum034 {
  CLASS,
  METHOD
}

enum TestEnum035 {
  CLASS,
  METHOD
}

enum TestEnum036 {
  CLASS,
  METHOD
}

enum TestEnum037 {
  CLASS,
  METHOD
}

enum TestEnum038 {
  CLASS,
  METHOD
}

enum TestEnum039 {
  CLASS,
  METHOD
}

class MyClass040 {}

enum TestEnum040 {
  CLASS,
  METHOD
}

function isEnumType040(cls: Class): boolean {
  return cls.isEnum();
}

class MyClass041 {}

enum TestEnum041 {
  CLASS,
  METHOD
}

function processClass041(cls: Class): string {
  if (cls.isEnum()) {
    return "This is an enum type";
  } else {
    return "This is not an enum type";
  }
}

class MyClass042 {}

enum TestEnum042 {
  CLASS,
  METHOD
}

function isEnumValue042(value: Any): boolean {
  let cls = Class.ofAny(value);
  if (cls !== undefined) {
    return cls.isEnum();
  }
  return false;
}

enum TestEnum043 {
  CLASS,
  METHOD
}

enum TestEnum044 {
  CLASS,
  METHOD
}

enum TestEnum045 {
  CLASS,
  METHOD
}

export default function ClassIsEnumTest(): void {
  describe('ClassIsEnumTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0100
     * @tc.name testClassIsEnum001
     * @tc.desc Verify ClassIsEnum case 001: Class.from<TestEnum001>(), isEnum returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum001>();
      let result = cls.isEnum();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0200
     * @tc.name testClassIsEnum002
     * @tc.desc Verify ClassIsEnum case 002: Class.from<TestEnum003>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum003>();
      expect(cls.isEnum()).assertEqual(true);
      expect(cls.isInterface()).assertEqual(false);
      expect(cls.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0300
     * @tc.name testClassIsEnum003
     * @tc.desc Verify ClassIsEnum case 003: Class.from<StringEnum004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringEnum004>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0400
     * @tc.name testClassIsEnum004
     * @tc.desc Verify ClassIsEnum case 004: Class.from<MixedEnum005>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedEnum005>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0500
     * @tc.name testClassIsEnum005
     * @tc.desc Verify ClassIsEnum case 005: Class.from<ConstEnum006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstEnum006>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0600
     * @tc.name testClassIsEnum006
     * @tc.desc Verify ClassIsEnum case 006: Class.from<EmptyEnum007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyEnum007>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0700
     * @tc.name testClassIsEnum007
     * @tc.desc Verify ClassIsEnum case 007: Class.from<MyClass008>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0800
     * @tc.name testClassIsEnum008
     * @tc.desc Verify ClassIsEnum case 008: Class.from<MyInterface009>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface009>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_0900
     * @tc.name testClassIsEnum009
     * @tc.desc Verify ClassIsEnum case 009: Class.from<Object>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Object>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1000
     * @tc.name testClassIsEnum010
     * @tc.desc Verify ClassIsEnum case 010: Class.from<Array<string>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<string>>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1100
     * @tc.name testClassIsEnum011
     * @tc.desc Verify ClassIsEnum case 011: Class.from<FixedArray<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArray<int>>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1200
     * @tc.name testClassIsEnum012
     * @tc.desc Verify ClassIsEnum case 012: Class.from<Map<string, int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<string, int>>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1300
     * @tc.name testClassIsEnum013
     * @tc.desc Verify ClassIsEnum case 013: Class.from<Set<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<int>>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1400
     * @tc.name testClassIsEnum014
     * @tc.desc Verify ClassIsEnum case 014: Class.from<int>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1500
     * @tc.name testClassIsEnum015
     * @tc.desc Verify ClassIsEnum case 015: Class.from<AbstractClass016>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass016>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1600
     * @tc.name testClassIsEnum016
     * @tc.desc Verify ClassIsEnum case 016: Class.from<FinalClass017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass017>();
      let result = cls.isEnum();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1700
     * @tc.name testClassIsEnum017
     * @tc.desc Verify ClassIsEnum case 017: Class.from<BaseEnum018>(), isEnum returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<BaseEnum018>().isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1800
     * @tc.name testClassIsEnum018
     * @tc.desc Verify ClassIsEnum case 018: Class.from<TestEnum019>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum019>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_1900
     * @tc.name testClassIsEnum019
     * @tc.desc Verify ClassIsEnum case 019: Class.of(instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumValue = TestEnum020.CLASS;
      let cls = Class.of(enumValue);
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2000
     * @tc.name testClassIsEnum020
     * @tc.desc Verify ClassIsEnum case 020: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumValue: Any = TestEnum021.METHOD;
      let cls = Class.ofAny(enumValue);
      expect(cls !== undefined).assertTrue();
      expect(cls!.isEnum()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2100
     * @tc.name testClassIsEnum021
     * @tc.desc Verify ClassIsEnum case 021: Class.from<TestEnum022>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum022>();
      let result = cls.isEnum();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2200
     * @tc.name testClassIsEnum022
     * @tc.desc Verify ClassIsEnum case 022: Class.from<TestEnum023>(), isEnum returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum023>();
      let result = cls.isEnum();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertTrue();

      let cls2 = Class.from<MyClass023>();
      let result2 = cls2.isEnum();
      expect(typeof result2).assertEqual('boolean');
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2300
     * @tc.name testClassIsEnum023
     * @tc.desc Verify ClassIsEnum case 023: Class.from<TestEnum024>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum024>();
      let result1 = cls.isEnum();
      let result2 = cls.isEnum();
      let result3 = cls.isEnum();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2400
     * @tc.name testClassIsEnum024
     * @tc.desc Verify ClassIsEnum case 024: Class.from<MyClass023>(), isEnum returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      expect(cls.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2500
     * @tc.name testClassIsEnum025
     * @tc.desc Verify ClassIsEnum case 025: Class.from<TestEnum026>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum026>();
      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2600
     * @tc.name testClassIsEnum026
     * @tc.desc Verify ClassIsEnum case 026: Class.from<TestEnum027>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.PRIMITIVE_INT.isEnum()).assertEqual(false);
      let cls = Class.from<TestEnum027>();
      cls.initialize();
      expect(cls.isEnum()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2700
     * @tc.name testClassIsEnum027
     * @tc.desc Verify ClassIsEnum case 027: Class.from<TestEnum028>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum028>();
      expect(cls.isEnum()).assertEqual(true);
      expect(cls.isInterface()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2800
     * @tc.name testClassIsEnum028
     * @tc.desc Verify ClassIsEnum case 028: Class.from<MyInterface029>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface029>();
      expect(cls.isInterface()).assertEqual(true);
      expect(cls.isEnum()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_2900
     * @tc.name testClassIsEnum029
     * @tc.desc Verify ClassIsEnum case 029: Class.from<int | string>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      expect(cls.isEnum()).assertEqual(false);
      expect(cls.isPrimitive()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3000
     * @tc.name testClassIsEnum030
     * @tc.desc Verify ClassIsEnum case 030: Class.from<TestEnum031>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum031>();
      expect(cls.isEnum()).assertEqual(true);
      let isFinal = cls.isFinal();
      console.info(`Enum isFinal: ${isFinal}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3100
     * @tc.name testClassIsEnum031
     * @tc.desc Verify ClassIsEnum case 031: Class.from<TestEnum032>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum032>();
      expect(cls.isEnum()).assertEqual(true);
      expect(cls.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3200
     * @tc.name testClassIsEnum032
     * @tc.desc Verify ClassIsEnum case 032: Class.from<Array<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int>>();
      expect(cls.isEnum()).assertEqual(false);
      expect(cls.isFixedArray()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3300
     * @tc.name testClassIsEnum033
     * @tc.desc Verify ClassIsEnum case 033: Class.from<int | string | boolean>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean>();
      expect(cls.isEnum()).assertEqual(false);
      expect(cls.isUnion()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3400
     * @tc.name testClassIsEnum034
     * @tc.desc Verify ClassIsEnum case 034: Class.from<TestEnum035>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum035>();
      expect(cls.isEnum()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3500
     * @tc.name testClassIsEnum035
     * @tc.desc Verify ClassIsEnum case 035: Class.from<FixedArray<TestEnum036>>(), getFixedArrayComponentType() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedArrCls = Class.from<FixedArray<TestEnum036>>();
      let componentCls = fixedArrCls.getFixedArrayComponentType();
      expect(Utils.isAbsentReflectOptional(componentCls)).assertFalse();
      expect(componentCls!.isEnum()).assertEqual(true);

      let resizableArr: Array<TestEnum036> = [TestEnum036.CLASS, TestEnum036.METHOD];
      expect(Utils.isAbsentReflectOptional(Class.of(resizableArr).getFixedArrayComponentType())).assertTrue();

      expect(Class.from<TestEnum036>().isEnum()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3600
     * @tc.name testClassIsEnum036
     * @tc.desc Verify ClassIsEnum case 036: Class.from<TestEnum037>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum037>();
      expect(cls.isEnum()).assertEqual(true);
      let fields = asStaticFieldEnum(cls.getStaticFields());
      expect(fields.length).assertLarger(0);
      for (let i = 0; i < fields.length; i++) {
        console.info(fields[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3700
     * @tc.name testClassIsEnum037
     * @tc.desc Verify ClassIsEnum case 037: Class.from<TestEnum038>(), getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum038>();
      expect(cls.isEnum()).assertEqual(true);
      let methods = asInstanceMethodEnum(cls.getInstanceMethods());
      expect(methods.length).assertLarger(0);
      for (let i = 0; i < methods.length; i++) {
        console.info(methods[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3800
     * @tc.name testClassIsEnum038
     * @tc.desc Verify ClassIsEnum case 038: Class.from<TestEnum039>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum039>();
      expect(cls.isEnum()).assertEqual(true);
      let superCls = cls.getSuper();
      expect(superCls !== undefined && superCls !== null).assertTrue();
      expect(superCls!.isEnum()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_3900
     * @tc.name testClassIsEnum039
     * @tc.desc Verify ClassIsEnum case 039: Class.from<TestEnum040>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isEnumType040(Class.from<TestEnum040>())).assertEqual(true);
      expect(isEnumType040(Class.from<MyClass040>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_4000
     * @tc.name testClassIsEnum040
     * @tc.desc Verify ClassIsEnum case 040: Class.from<TestEnum041>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processClass041(Class.from<TestEnum041>())).assertEqual("This is an enum type");
      expect(processClass041(Class.from<MyClass041>())).assertEqual("This is not an enum type");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_4100
     * @tc.name testClassIsEnum041
     * @tc.desc Verify ClassIsEnum case 041: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isEnumValue042(TestEnum042.CLASS)).assertEqual(true);
      expect(isEnumValue042(new MyClass042())).assertEqual(false);
      expect(isEnumValue042(123)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_4200
     * @tc.name testClassIsEnum042
     * @tc.desc Verify ClassIsEnum case 042: Class.from<TestEnum043>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum043>();
      let startTime = Date.now();
      let result = false;
      for (let i = 0; i < 10000; i++) {
        result = cls.isEnum();
      }
      let endTime = Date.now();
      console.info(`10000 calls took ${endTime - startTime}ms`);
      console.info(`isEnum 10000 calls: ${endTime - startTime}ms`);
      expect(result).assertEqual(true);
      expect(endTime - startTime).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_4300
     * @tc.name testClassIsEnum043
     * @tc.desc Verify ClassIsEnum case 043: Class.from<TestEnum044>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum044>();
      let results: Array<boolean> = [];
      for (let i = 0; i < 100; i++) {
        results.push(cls.isEnum());
      }
      for (let result of results) {
        expect(result).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_ISENUM_4400
     * @tc.name testClassIsEnum044
     * @tc.desc Verify ClassIsEnum case 044: Class.from<TestEnum045>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassIsEnum044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum045>();

      for (let i = 0; i < 1000; i++) {
        let temp = Class.from<string>();
        temp.getName();
      }

      let result = cls.isEnum();
      expect(result).assertEqual(true);
    });

  });
}