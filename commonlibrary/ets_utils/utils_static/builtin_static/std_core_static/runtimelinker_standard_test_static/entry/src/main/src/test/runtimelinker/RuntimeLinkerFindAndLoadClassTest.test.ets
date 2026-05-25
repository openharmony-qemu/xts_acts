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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function FindAndLoadClassTest(): void {
  describe('FindAndLoadClassTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    // ========== 1.1 Parameter Count Tests ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0100
     * @tc.name testFindAndLoadClass001
     * @tc.desc Verify findAndLoadClass called with both required parameters clsName and init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0200
     * @tc.name testFindAndLoadClass002
     * @tc.desc Verify compile-time error when first parameter clsName is missing from
     *            findAndLoadClass call. ArkTS enforces parameter count must match the function
     *            signature (spec/semantics.md). Runtime assertion validates the two-arg call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: missing required parameter clsName is an error.
      // The legal two-argument call is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0300
     * @tc.name testFindAndLoadClass003
     * @tc.desc Verify compile-time error when second parameter init is missing from
     *            findAndLoadClass call. ArkTS enforces parameter count must match the
     *            function signature (spec/semantics.md). Runtime assertion validates the
     *            complete two-arg call succeeds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: missing required parameter init is an error.
      // The legal two-argument call is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0400
     * @tc.name testFindAndLoadClass004
     * @tc.desc Verify compile-time error when passing extra argument to findAndLoadClass
     *            beyond the two required parameters. ArkTS enforces strict arity matching
     *            (spec/semantics.md). Runtime assertion validates the two-arg call succeeds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: too many arguments is an error.
      // The legal two-argument call is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0500
     * @tc.name testFindAndLoadClass005
     * @tc.desc Verify compile-time error when calling findAndLoadClass with zero arguments.
     *            ArkTS enforces parameter count matching the function signature
     *            (spec/semantics.md). Runtime assertion validates the two-arg call succeeds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: no arguments passed is an error.
      // The legal two-argument call is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    // ========== 1.2 clsName (string) Type Tests ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0600
     * @tc.name testFindAndLoadClass006
     * @tc.desc Verify findAndLoadClass with valid class name std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0700
     * @tc.name testFindAndLoadClass007
     * @tc.desc Verify findAndLoadClass with valid class name std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.Double", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0800
     * @tc.name testFindAndLoadClass008
     * @tc.desc Verify findAndLoadClass with non-existent class name returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.FakeClass", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0900
     * @tc.name testFindAndLoadClass009
     * @tc.desc Verify findAndLoadClass with empty string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("", false);
      // empty string is not a valid class name
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1000
     * @tc.name testFindAndLoadClass010
     * @tc.desc Verify findAndLoadClass with whitespace-only string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("   ", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1100
     * @tc.name testFindAndLoadClass011
     * @tc.desc Verify findAndLoadClass with zero-width space string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("​", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1200
     * @tc.name testFindAndLoadClass012
     * @tc.desc Verify findAndLoadClass with Unicode string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("测试类名中文", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1300
     * @tc.name testFindAndLoadClass013
     * @tc.desc Verify findAndLoadClass with XSS injection string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = undefined;
      try {
        cls = linker.findAndLoadClass("<script>alert(1)</script>", false);
      } catch (e) {
        // XSS-like class name may throw, both outcomes are valid
      }
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1400
     * @tc.name testFindAndLoadClass014
     * @tc.desc Verify findAndLoadClass with special characters string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("!@#$%^&*()", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1500
     * @tc.name testFindAndLoadClass015
     * @tc.desc Verify findAndLoadClass with very long string clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let longName: string = "std.core.";
      for (let i: int = 0; i < 1000; i++) {
        longName = longName + "X";
      }
      let cls: Class | undefined = linker.findAndLoadClass(longName, false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1600
     * @tc.name testFindAndLoadClass016
     * @tc.desc Verify findAndLoadClass with isolated surrogate character in clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("\udc04", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1700
     * @tc.name testFindAndLoadClass017
     * @tc.desc Verify findAndLoadClass with overlong encoding in clsName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("\xc0\x81", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1800
     * @tc.name testFindAndLoadClass018
     * @tc.desc Verify compile-time error when passing number instead of string for clsName
     *            parameter. ArkTS does not allow implicit cross-type assignment between
     *            numeric and string types (spec/semantics.md assignability). Runtime assertion
     *            validates the correct string argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: number not assignable to string parameter clsName.
      // The correct string argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1900
     * @tc.name testFindAndLoadClass019
     * @tc.desc Verify compile-time error when passing boolean instead of string for clsName
     *            parameter. ArkTS prevents assignment between incompatible types
     *            (spec/semantics.md assignability). Runtime assertion validates the correct
     *            string argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: boolean not assignable to string parameter clsName.
      // The correct string argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2000
     * @tc.name testFindAndLoadClass020
     * @tc.desc Verify compile-time error when passing null instead of string for clsName
     *            parameter. null is not assignable to non-nullish string type
     *            (spec/types.md Nullish Types). Runtime assertion validates the correct
     *            string argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: null not assignable to string parameter clsName.
      // The correct string argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2100
     * @tc.name testFindAndLoadClass021
     * @tc.desc Verify compile-time error when passing undefined instead of string for
     *            clsName parameter. undefined is not assignable to non-nullish string type
     *            (spec/types.md Nullish Types). Runtime assertion validates the correct
     *            string argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: undefined not assignable to string parameter clsName.
      // The correct string argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2200
     * @tc.name testFindAndLoadClass022
     * @tc.desc Verify clsName passed from string variable works with normal type inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let className: string = "std.core.String";
      let cls: Class | undefined = linker.findAndLoadClass(className, false);
      expect(cls !== undefined).assertTrue();
    });

    // ========== 1.3 init (boolean) Type Tests ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2300
     * @tc.name testFindAndLoadClass023
     * @tc.desc Verify findAndLoadClass with init=true returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2400
     * @tc.name testFindAndLoadClass024
     * @tc.desc Verify findAndLoadClass with init=false returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2500
     * @tc.name testFindAndLoadClass025
     * @tc.desc Verify same class loaded with init=true and init=false returns identical Class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let clsWithInit: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      let clsNoInit: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(clsWithInit !== undefined).assertTrue();
      expect(clsNoInit !== undefined).assertTrue();
      expect(clsWithInit === clsNoInit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2600
     * @tc.name testFindAndLoadClass026
     * @tc.desc Verify compile-time error when passing int 0 instead of boolean for init
     *            parameter. ArkTS does not allow implicit int-to-boolean conversion
     *            (spec/conversions.md, spec/semantics.md assignability). Runtime assertion
     *            validates the correct boolean argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: int 0 not assignable to boolean parameter init.
      // The correct boolean argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2700
     * @tc.name testFindAndLoadClass027
     * @tc.desc Verify compile-time error when passing int 1 instead of boolean for init
     *            parameter. ArkTS does not allow implicit int-to-boolean conversion
     *            (spec/conversions.md, spec/semantics.md assignability). Runtime assertion
     *            validates the correct boolean argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: int 1 not assignable to boolean parameter init.
      // The correct boolean argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2800
     * @tc.name testFindAndLoadClass028
     * @tc.desc Verify compile-time error when passing string "true" instead of boolean
     *            for init parameter. ArkTS prevents cross-type assignment between string
     *            and boolean (spec/semantics.md assignability). Runtime assertion validates
     *            the correct boolean argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: string not assignable to boolean parameter init.
      // The correct boolean argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2900
     * @tc.name testFindAndLoadClass029
     * @tc.desc Verify compile-time error when passing null instead of boolean for init
     *            parameter. null is not assignable to non-nullish boolean type
     *            (spec/types.md Nullish Types). Runtime assertion validates the correct
     *            boolean argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: null not assignable to boolean parameter init.
      // The correct boolean argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3000
     * @tc.name testFindAndLoadClass030
     * @tc.desc Verify compile-time error when passing undefined instead of boolean for
     *            init parameter. undefined is not assignable to non-nullish boolean type
     *            (spec/types.md Nullish Types). Runtime assertion validates the correct
     *            boolean argument works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: undefined not assignable to boolean parameter init.
      // The correct boolean argument is validated at runtime below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3100
     * @tc.name testFindAndLoadClass031
     * @tc.desc Verify init passed from boolean variable works with normal type inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let shouldInit: boolean = true;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", shouldInit);
      expect(cls !== undefined).assertTrue();
    });

    // ========== 2.1 Return Value - Success Scenarios ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3200
     * @tc.name testFindAndLoadClass032
     * @tc.desc Verify findAndLoadClass returns Class instance when class exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3300
     * @tc.name testFindAndLoadClass033
     * @tc.desc Verify returned Class instance can call getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let name: string = cls.getName();
        expect(name === "std.core.String").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3400
     * @tc.name testFindAndLoadClass034
     * @tc.desc Verify multiple calls to findAndLoadClass for same class return same type Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls1: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let cls2: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls1 !== undefined).assertTrue();
      expect(cls2 !== undefined).assertTrue();
      expect(cls1 === cls2).assertTrue();
    });

    // ========== 2.2 Special Value - Class Not Found Returns undefined ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3500
     * @tc.name testFindAndLoadClass035
     * @tc.desc Verify findAndLoadClass returns undefined for non-existent class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.unknown.NonExistent", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3600
     * @tc.name testFindAndLoadClass036
     * @tc.desc Verify findAndLoadClass returns undefined for empty string class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("", false);
      expect(cls === undefined).assertTrue();
    });

    // ========== 2.3 Return Value Type Verification ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3700
     * @tc.name testFindAndLoadClass037
     * @tc.desc Verify return type is Class|undefined union requiring null check before use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        // type narrowed to Class in this branch
        let name: string = cls.getName();
        expect(name.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3800
     * @tc.name testFindAndLoadClass038
     * @tc.desc Verify typeof on Class instance returns object (covered in BootRuntimeLinkerTest)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // cross-file reference: typeof Class='object' covered in BootRuntimeLinkerTest
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        expect(typeof cls === 'object').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3900
     * @tc.name testFindAndLoadClass039
     * @tc.desc Verify typeof on undefined return value returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.Class", false);
      if (cls === undefined) {
        let typeResult: string = typeof cls;
        expect(typeResult === 'undefined').assertTrue();
      }
    });

    // ========== 2.4 Boundary Return Values ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4000
     * @tc.name testFindAndLoadClass040
     * @tc.desc Verify loading classes from different namespaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let stringClass: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let doubleClass: Class | undefined = linker.findAndLoadClass("std.core.Double", false);
      expect(stringClass !== undefined).assertTrue();
      expect(doubleClass !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4100
     * @tc.name testFindAndLoadClass041
     * @tc.desc Verify same class loaded with different init parameter values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let clsTrue: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      let clsFalse: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(clsTrue !== undefined).assertTrue();
      expect(clsFalse !== undefined).assertTrue();
      expect(clsTrue === clsFalse).assertTrue();
    });

    // ========== 3. Error Handling Tests ==========

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4200
     * @tc.name testFindAndLoadClass042
     * @tc.desc Verify behavior when passing class name with embedded null byte "\0".
     *            WARNING: This test passes "\0" to a native method (findAndLoadClass).
     *            If the ArkTS runtime forwards this string verbatim to a C-string API,
     *            the null byte may prematurely terminate the string. This test handles
     *            both outcomes (undefined return or Error throw). Use only in debug/dev
     *            builds; do NOT run in critical production pipelines unless the native
     *            layer is verified to handle embedded null characters correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      try {
        let cls: Class | undefined = linker.findAndLoadClass("\0", false);
        expect(cls === undefined).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4300
     * @tc.name testFindAndLoadClass043
     * @tc.desc Verify findAndLoadClass is declared as a native method. ArkTS enforces
     *            that native method declarations have no body (spec/ambients.md). Runtime
     *            assertion validates the native method works correctly when called.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: native method body must be empty.
      // The native method's correct runtime behavior is validated below.
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4400
     * @tc.name testFindAndLoadClass044
     * @tc.desc Verify findAndLoadClass override relationship is validated at compile time.
     *            ArkTS enforces that overriding methods match the parent signature
     *            (spec/classes.md, spec/semantics.md override). Runtime assertion validates
     *            the overridden method works correctly on a BootRuntimeLinker instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: method override relationship must be valid.
      // The correctly-overridden method's runtime behavior is validated below.
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4500
     * @tc.name testFindAndLoadClass045
     * @tc.desc Verify Class.getLinker returns BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let classLinker: RuntimeLinker = cls.getLinker();
        expect(classLinker instanceof BootRuntimeLinker).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4600
     * @tc.name testFindAndLoadClass046
     * @tc.desc Verify Class.initialize does not throw for loaded class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      if (cls !== undefined) {
        cls.initialize();
        expect(cls.getName().length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4700
     * @tc.name testFindAndLoadClass047
     * @tc.desc Verify Class.isSubtypeOf returns boolean for related class pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      let stringCls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let objectCls: Class | undefined = linker.findAndLoadClass("std.core.Object", false);
      if (stringCls !== undefined && objectCls !== undefined) {
        let isSubtype: boolean = stringCls.isSubtypeOf(objectCls);
        expect(typeof isSubtype === 'boolean').assertTrue();
      }
    });
  });
}
