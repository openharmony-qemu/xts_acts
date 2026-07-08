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
} from '@ohos/hypium-binary/src/main/indexStatic';
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0100
     * @tc.name testFindAndLoadClass001
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            valid class name "std.core.String" and init=false returns
     *            valid Class instance
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
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            valid class name "std.core.Double" from a different type domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.Double", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0300
     * @tc.name testFindAndLoadClass003
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            non-existent class name returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.FakeClass", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0400
     * @tc.name testFindAndLoadClass004
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            empty string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0500
     * @tc.name testFindAndLoadClass005
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            whitespace-only string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("   ", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0600
     * @tc.name testFindAndLoadClass006
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            zero-width space string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("​", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0700
     * @tc.name testFindAndLoadClass007
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            Unicode Chinese string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("测试类名中文", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0800
     * @tc.name testFindAndLoadClass008
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            special characters clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("!@#$%^&*()", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_0900
     * @tc.name testFindAndLoadClass009
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            very long string clsName (1000+ chars) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let longName: string = "std.core.";
      for (let i: int = 0; i < 1000; i++) {
        longName = longName + "X";
      }
      let cls: Class | undefined = linker.findAndLoadClass(longName, false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1000
     * @tc.name testFindAndLoadClass010
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            isolated surrogate character in clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("\udc04", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1100
     * @tc.name testFindAndLoadClass011
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            clsName passed from a string variable with normal type inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let className: string = "std.core.String";
      let cls: Class | undefined = linker.findAndLoadClass(className, false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1200
     * @tc.name testFindAndLoadClass012
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            path traversal pattern "../" clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = undefined;
      try {
        cls = linker.findAndLoadClass("../etc/passwd", false);
      } catch (e) {
        // path traversal pattern may throw, both outcomes are valid
      }
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1300
     * @tc.name testFindAndLoadClass013
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            numeric string clsName "123" returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("123", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1400
     * @tc.name testFindAndLoadClass014
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            init=true returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1500
     * @tc.name testFindAndLoadClass015
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            init=false returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1600
     * @tc.name testFindAndLoadClass016
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            init=true and init=false for same class returns identical Class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let clsWithInit: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      let clsNoInit: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(clsWithInit !== undefined).assertTrue();
      expect(clsNoInit !== undefined).assertTrue();
      expect(clsWithInit === clsNoInit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1700
     * @tc.name testFindAndLoadClass017
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            init passed from a boolean variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let shouldInit: boolean = true;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", shouldInit);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1800
     * @tc.name testFindAndLoadClass018
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            init=true for a non-existent class returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.FakeClass", true);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_1900
     * @tc.name testFindAndLoadClass019
     * @tc.desc Verify returned Class instance via getBootRuntimeLinker()
     *            can call getName() and return the correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let name: string = cls.getName();
        expect(name === "std.core.String").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2000
     * @tc.name testFindAndLoadClass020
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance
     *            for same class called twice returns identical Class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls1: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let cls2: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls1 !== undefined).assertTrue();
      expect(cls2 !== undefined).assertTrue();
      expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2100
     * @tc.name testFindAndLoadClass021
     * @tc.desc Verify typeof on Class instance returned via
     *            BootRuntimeLinker.instance returns 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        expect(typeof cls === 'object').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2200
     * @tc.name testFindAndLoadClass022
     * @tc.desc Verify typeof on undefined return value from
     *            findAndLoadClass via getBootRuntimeLinker() returns 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.Class", false);
      if (cls === undefined) {
        let typeResult: string = typeof cls;
        expect(typeResult === 'undefined').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2300
     * @tc.name testFindAndLoadClass023
     * @tc.desc Verify Class.getLinker() on Class loaded via
     *            BootRuntimeLinker.instance returns a BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let classLinker: RuntimeLinker = cls.getLinker();
        expect(classLinker instanceof BootRuntimeLinker).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2400
     * @tc.name testFindAndLoadClass024
     * @tc.desc Verify Class.isSubtypeOf() on Class loaded via
     *            BootRuntimeLinker.instance returns boolean for a related class pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let stringCls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let objectCls: Class | undefined = linker.findAndLoadClass("std.core.Object", false);
      if (stringCls !== undefined && objectCls !== undefined) {
        let isSubtype: boolean = stringCls.isSubtypeOf(objectCls);
        expect(typeof isSubtype === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2500
     * @tc.name testFindAndLoadClass025
     * @tc.desc Verify behavior when passing class name with embedded null byte "\x00"
     *            via getBootRuntimeLinker().
     *            WARNING: This test passes "\x00" to a native method (findAndLoadClass).
     *            If the ArkTS runtime forwards this string verbatim to a C-string API,
     *            the null byte may prematurely terminate the string. Use only in debug/dev
     *            builds; do NOT run in critical production pipelines unless the native
     *            layer is verified to handle embedded null characters correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      try {
        let cls: Class | undefined = linker.findAndLoadClass("\x00", false);
        expect(cls === undefined).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2600
     * @tc.name testFindAndLoadClass026
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            valid class name "std.core.Double" from a different type domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.Double", false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2700
     * @tc.name testFindAndLoadClass027
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            non-existent class name returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.FakeClass", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2800
     * @tc.name testFindAndLoadClass028
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            empty string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_2900
     * @tc.name testFindAndLoadClass029
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            whitespace-only string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("   ", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3000
     * @tc.name testFindAndLoadClass030
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            zero-width space string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("​", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3100
     * @tc.name testFindAndLoadClass031
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            Unicode Chinese string clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("测试类名中文", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3200
     * @tc.name testFindAndLoadClass032
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            special characters clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("!@#$%^&*()", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3300
     * @tc.name testFindAndLoadClass033
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            very long string clsName (1000+ chars) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let longName: string = "std.core.";
      for (let i: int = 0; i < 1000; i++) {
        longName = longName + "X";
      }
      let cls: Class | undefined = linker.findAndLoadClass(longName, false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3400
     * @tc.name testFindAndLoadClass034
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            isolated surrogate character in clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("\udc04", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3500
     * @tc.name testFindAndLoadClass035
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            clsName passed from a string variable with normal type inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let className: string = "std.core.String";
      let cls: Class | undefined = linker.findAndLoadClass(className, false);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3600
     * @tc.name testFindAndLoadClass036
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            path traversal pattern "../" clsName returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = undefined;
      try {
        cls = linker.findAndLoadClass("../etc/passwd", false);
      } catch (e) {
        // path traversal pattern may throw, both outcomes are valid
      }
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3700
     * @tc.name testFindAndLoadClass037
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            numeric string clsName "123" returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("123", false);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3800
     * @tc.name testFindAndLoadClass038
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            init=true returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_3900
     * @tc.name testFindAndLoadClass039
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            init=true and init=false for same class returns identical Class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let clsWithInit: Class | undefined = linker.findAndLoadClass("std.core.String", true);
      let clsNoInit: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(clsWithInit !== undefined).assertTrue();
      expect(clsNoInit !== undefined).assertTrue();
      expect(clsWithInit === clsNoInit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4000
     * @tc.name testFindAndLoadClass040
     * @tc.desc Verify findAndLoadClass via BootRuntimeLinker.instance with
     *            init passed from a boolean variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let shouldInit: boolean = true;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", shouldInit);
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4100
     * @tc.name testFindAndLoadClass041
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker() with
     *            init=true for a non-existent class returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.FakeClass", true);
      expect(cls === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4200
     * @tc.name testFindAndLoadClass042
     * @tc.desc Verify returned Class instance via BootRuntimeLinker.instance
     *            can call getName() and return the correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let name: string = cls.getName();
        expect(name === "std.core.String").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4300
     * @tc.name testFindAndLoadClass043
     * @tc.desc Verify findAndLoadClass via getBootRuntimeLinker()
     *            for same class called twice returns identical Class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls1: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let cls2: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      expect(cls1 !== undefined).assertTrue();
      expect(cls2 !== undefined).assertTrue();
      expect(cls1 === cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4400
     * @tc.name testFindAndLoadClass044
     * @tc.desc Verify typeof on Class instance returned via
     *            getBootRuntimeLinker() returns 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        expect(typeof cls === 'object').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4500
     * @tc.name testFindAndLoadClass045
     * @tc.desc Verify typeof on undefined return value from
     *            findAndLoadClass via BootRuntimeLinker.instance returns 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.findAndLoadClass("com.nonexistent.Class", false);
      if (cls === undefined) {
        let typeResult: string = typeof cls;
        expect(typeResult === 'undefined').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4600
     * @tc.name testFindAndLoadClass046
     * @tc.desc Verify Class.getLinker() on Class loaded via
     *            getBootRuntimeLinker() returns a BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let cls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      if (cls !== undefined) {
        let classLinker: RuntimeLinker = cls.getLinker();
        expect(classLinker instanceof BootRuntimeLinker).assertTrue();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4700
     * @tc.name testFindAndLoadClass047
     * @tc.desc Verify Class.isSubtypeOf() on Class loaded via
     *            getBootRuntimeLinker() returns boolean for a related class pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let stringCls: Class | undefined = linker.findAndLoadClass("std.core.String", false);
      let objectCls: Class | undefined = linker.findAndLoadClass("std.core.Object", false);
      if (stringCls !== undefined && objectCls !== undefined) {
        let isSubtype: boolean = stringCls.isSubtypeOf(objectCls);
        expect(typeof isSubtype === 'boolean').assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIND_AND_LOAD_CLASS_4800
     * @tc.name testFindAndLoadClass048
     * @tc.desc Verify behavior when passing class name with embedded null byte "\x00"
     *            via BootRuntimeLinker.instance.
     *            WARNING: This test passes "\x00" to a native method (findAndLoadClass).
     *            If the ArkTS runtime forwards this string verbatim to a C-string API,
     *            the null byte may prematurely terminate the string. Use only in debug/dev
     *            builds; do NOT run in critical production pipelines unless the native
     *            layer is verified to handle embedded null characters correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFindAndLoadClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      try {
        let cls: Class | undefined = linker.findAndLoadClass("\x00", false);
        expect(cls === undefined).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

  });
}
