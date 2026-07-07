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
import Utils from './../Util.test';

export default function RuntimeLinkerFindLoadedClassTest(): void {
  describe('RuntimeLinkerFindLoadedClassTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0010
     * @tc.name testRuntimeLinkerFindLoadedClass001
     * @tc.desc Verify findLoadedClass with valid loaded class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const loaded = linker.findLoadedClass("std.core.String")
      expect(loaded).assertEqual(loadedClass)
      expect(loaded!.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0020
     * @tc.name testRuntimeLinkerFindLoadedClass002
     * @tc.desc Verify findLoadedClass returns undefined when passing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loaded = linker.findLoadedClass("")
      expect(loaded).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0030
     * @tc.name testRuntimeLinkerFindLoadedClass003
     * @tc.desc Verify findLoadedClass returns undefined for nonexistent class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loaded = linker.findLoadedClass("non.existent.Class")
      expect(loaded).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0040
     * @tc.name testRuntimeLinkerFindLoadedClass004
     * @tc.desc Verify findLoadedClass returns valid Class objects for different loaded classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedObjectClass = linker.loadClass("std.core.Object", false)
      const stringClass = linker.findLoadedClass("std.core.String")
      const objectClass = linker.findLoadedClass("std.core.Object")
      expect(stringClass!.getName()).assertEqual("std.core.String")
      expect(objectClass).assertEqual(loadedObjectClass)
      expect(objectClass!.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0050
     * @tc.name testRuntimeLinkerFindLoadedClass005
     * @tc.desc Verify findLoadedClass remains undefined after failed class lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.NotLoadedClassForTest")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0060
     * @tc.name testRuntimeLinkerFindLoadedClass006
     * @tc.desc Verify findLoadedClass returns undefined when passing tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loaded = linker.findLoadedClass("\t")
      expect(loaded).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0070
     * @tc.name testRuntimeLinkerFindLoadedClass007
     * @tc.desc Verify findLoadedClass returns valid Class after getType is called for same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeObj = linker.getType("std.core.String")
      const foundClass = linker.findLoadedClass("std.core.String")
      expect(typeObj!.toString()).assertEqual("string")
      expect(foundClass!.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0080
     * @tc.name testRuntimeLinkerFindLoadedClass008
     * @tc.desc Verify findLoadedClass returns valid Class for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.Boolean", false)
      const booleanType = linker.getType("std.core.Boolean")
      const loaded = linker.findLoadedClass("std.core.Boolean")
      expect(loaded).assertEqual(loadedClass)
      expect(loaded!.getName()).assertEqual("std.core.Boolean")
      expect(booleanType!.toString()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0090
     * @tc.name testRuntimeLinkerFindLoadedClass009
     * @tc.desc Verify findLoadedClass returns consistent Class identity across ten repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const firstLoaded = linker.findLoadedClass("std.core.String")
      expect(firstLoaded).assertEqual(loadedClass)
      for (let i = 0; i < 10; i++) {
        const loaded = linker.findLoadedClass("std.core.String")
        expect(loaded).assertEqual(firstLoaded)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0100
     * @tc.name testRuntimeLinkerFindLoadedClass010
     * @tc.desc Verify findLoadedClass handles alternating valid and invalid class names correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const valid1 = linker.findLoadedClass("std.core.String")
      expect(valid1).assertEqual(loadedClass)
      const invalid1 = linker.findLoadedClass("fake.class.name.test.alternating")
      expect(invalid1).assertEqual(undefined)
      const valid2 = linker.findLoadedClass("std.core.String")
      expect(valid2).assertEqual(valid1)
      const invalid2 = linker.findLoadedClass("another.fake.name.test.alternating")
      expect(invalid2).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0110
     * @tc.name testRuntimeLinkerFindLoadedClass011
     * @tc.desc Verify findLoadedClass returns undefined when passing single character a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loaded = linker.findLoadedClass("a")
      expect(loaded).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0120
     * @tc.name testRuntimeLinkerFindLoadedClass012
     * @tc.desc Verify bulk findLoadedClass workflows across standard class descriptors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classNames: Array<string> = [
        "std.core.String",
        "std.core.Object",
        "std.core.Boolean",
        "std.core.Byte",
        "std.core.Short",
        "std.core.Char",
        "std.core.Long",
        "std.core.Float",
        "std.core.Double",
        "std.core.Array"
      ]
      const linker = getBootRuntimeLinker()
      for (let classIndex: int = 0; classIndex < classNames.length; classIndex++) {
        const currentClass = classNames[classIndex]
        const nextClass = classNames[(classIndex + 1) % classNames.length]
        const loaded = linker.loadClass(currentClass, false)
        const found = linker.findLoadedClass(currentClass)
        expect(found).assertEqual(loaded)
        const secondFound = linker.findLoadedClass(currentClass)
        expect(secondFound).assertEqual(found)
        const initLoaded = linker.loadClass(currentClass, true)
        expect(linker.findLoadedClass(currentClass)).assertEqual(initLoaded)
        linker.loadClass(nextClass, false)
        const nextFound = linker.findLoadedClass(nextClass)
        expect(found!.getName()).assertEqual(currentClass)
        expect(nextFound!.getName()).assertEqual(nextClass)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0130
     * @tc.name testRuntimeLinkerFindLoadedClass013
     * @tc.desc Verify failed loadClass does not make missing class visible to findLoadedClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core.NotExistingFindLoadedClass", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const found = linker.findLoadedClass("std.core.NotExistingFindLoadedClass")
      expect(found).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0140
     * @tc.name testRuntimeLinkerFindLoadedClass014
     * @tc.desc Verify invalid lookup between valid lookups does not alter loaded String identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const firstFound = linker.findLoadedClass("std.core.String")
      const invalidFound = linker.findLoadedClass("runtime.linker.MissingBetweenValidLookups")
      const secondFound = linker.findLoadedClass("std.core.String")
      expect(invalidFound).assertEqual(undefined)
      expect(secondFound).assertEqual(firstFound)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0150
     * @tc.name testRuntimeLinkerFindLoadedClass015
     * @tc.desc Verify getType can load Char before findLoadedClass returns Char class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Char")
      const found = linker.findLoadedClass("std.core.Char")
      expect(type!.toString()).assertEqual("std.core.Char")
      expect(found!.getName()).assertEqual("std.core.Char")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0160
     * @tc.name testRuntimeLinkerFindLoadedClass016
     * @tc.desc Verify findLoadedClass returns distinct identities for Byte and Short after both are loaded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const byteClass = linker.loadClass("std.core.Byte", false)
      const shortClass = linker.loadClass("std.core.Short", false)
      const foundByte = linker.findLoadedClass("std.core.Byte")
      const foundShort = linker.findLoadedClass("std.core.Short")
      expect(foundByte).assertEqual(byteClass)
      expect(foundShort).assertEqual(shortClass)
      expect(foundByte === foundShort).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0170
     * @tc.name testRuntimeLinkerFindLoadedClass017
     * @tc.desc Verify getType and loadClass prepare consistent findLoadedClass result for std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Array")
      const cls = linker.loadClass("std.core.Array", false)
      const found = linker.findLoadedClass("std.core.Array")
      expect(type!.toString()).assertEqual("std.core.Array")
      expect(found).assertEqual(cls)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0180
     * @tc.name testRuntimeLinkerFindLoadedClass018
     * @tc.desc Verify invalid lookup runtime.linker.FindBefore0 does not affect findLoadedClass result for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeLoad = linker.findLoadedClass("runtime.linker.FindBefore0")
      const loadedClass = linker.loadClass("std.core.String", false)
      const afterLoad = linker.findLoadedClass("std.core.String")
      expect(beforeLoad).assertEqual(undefined)
      expect(afterLoad).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0190
     * @tc.name testRuntimeLinkerFindLoadedClass019
     * @tc.desc Verify findLoadedClass after init true load returns std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", true)
      const foundClass = linker.findLoadedClass("std.core.String")
      expect(foundClass).assertEqual(loadedClass)
      expect(foundClass!.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0200
     * @tc.name testRuntimeLinkerFindLoadedClass020
     * @tc.desc Verify invalid lookup does not hide already loaded std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const invalidFound = linker.findLoadedClass("runtime.linker.FindInvalid0")
      const validFound = linker.findLoadedClass("std.core.String")
      expect(invalidFound).assertEqual(undefined)
      expect(validFound).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0210
     * @tc.name testRuntimeLinkerFindLoadedClass021
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name std.core.Byte.extra
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Byte.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0220
     * @tc.name testRuntimeLinkerFindLoadedClass022
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name std.core.Long.extra
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Long.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0230
     * @tc.name testRuntimeLinkerFindLoadedClass023
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name std.core.Float.extra
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Float.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0240
     * @tc.name testRuntimeLinkerFindLoadedClass024
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name std.core.Double.extra
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Double.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0250
     * @tc.name testRuntimeLinkerFindLoadedClass025
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name std.core.Array.extra
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Array.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0260
     * @tc.name testRuntimeLinkerFindLoadedClass026
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime/linker/FindSlash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime/linker/FindSlash")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0270
     * @tc.name testRuntimeLinkerFindLoadedClass027
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime\linker\FindBackslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime\\linker\\FindBackslash")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0280
     * @tc.name testRuntimeLinkerFindLoadedClass028
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime:linker:FindColon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime:linker:FindColon")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0290
     * @tc.name testRuntimeLinkerFindLoadedClass029
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime;linker;FindSemi
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime;linker;FindSemi")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0300
     * @tc.name testRuntimeLinkerFindLoadedClass030
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime,linker,FindComma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime,linker,FindComma")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0310
     * @tc.name testRuntimeLinkerFindLoadedClass031
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime linker FindSpace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime linker FindSpace")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0320
     * @tc.name testRuntimeLinkerFindLoadedClass032
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime.linker.Find[Bracket]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime.linker.Find[Bracket]")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0330
     * @tc.name testRuntimeLinkerFindLoadedClass033
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime.linker.Find{Brace}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime.linker.Find{Brace}")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0340
     * @tc.name testRuntimeLinkerFindLoadedClass034
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime.linker.Find(Paren)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime.linker.Find(Paren)")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0350
     * @tc.name testRuntimeLinkerFindLoadedClass035
     * @tc.desc Verify findLoadedClass returns undefined for static invalid name runtime.linker.Find=Equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("runtime.linker.Find=Equal")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0360
     * @tc.name testRuntimeLinkerFindLoadedClass036
     * @tc.desc Verify findLoadedClass returns undefined when passing spaces only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("   ")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0370
     * @tc.name testRuntimeLinkerFindLoadedClass037
     * @tc.desc Verify findLoadedClass returns undefined for class name with surrounding spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass(" std.core.String ")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0380
     * @tc.name testRuntimeLinkerFindLoadedClass038
     * @tc.desc Verify findLoadedClass returns undefined when passing zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\u200B")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0390
     * @tc.name testRuntimeLinkerFindLoadedClass039
     * @tc.desc Verify findLoadedClass returns undefined for class name containing newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core\nString")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0400
     * @tc.name testRuntimeLinkerFindLoadedClass040
     * @tc.desc Verify findLoadedClass returns undefined for class name containing carriage return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core\rString")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0410
     * @tc.name testRuntimeLinkerFindLoadedClass041
     * @tc.desc Verify findLoadedClass returns undefined for class name containing CRLF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core\r\nString")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0420
     * @tc.name testRuntimeLinkerFindLoadedClass042
     * @tc.desc Verify findLoadedClass returns undefined for class name containing tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core\t\nString")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0430
     * @tc.name testRuntimeLinkerFindLoadedClass043
     * @tc.desc Verify findLoadedClass returns undefined when passing vertical tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\u000B")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0440
     * @tc.name testRuntimeLinkerFindLoadedClass044
     * @tc.desc Verify findLoadedClass returns undefined when passing form feed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\f")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0450
     * @tc.name testRuntimeLinkerFindLoadedClass045
     * @tc.desc Verify findLoadedClass returns undefined when passing backspace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\b")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0460
     * @tc.name testRuntimeLinkerFindLoadedClass046
     * @tc.desc Verify findLoadedClass returns undefined when passing null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\u0000")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0470
     * @tc.name testRuntimeLinkerFindLoadedClass047
     * @tc.desc Verify findLoadedClass returns undefined when passing replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\uFFFD")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0480
     * @tc.name testRuntimeLinkerFindLoadedClass048
     * @tc.desc Verify findLoadedClass returns undefined when passing isolated surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("\udc04")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0490
     * @tc.name testRuntimeLinkerFindLoadedClass049
     * @tc.desc Verify findLoadedClass returns undefined when passing Chinese class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("测试")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0500
     * @tc.name testRuntimeLinkerFindLoadedClass050
     * @tc.desc Verify findLoadedClass returns undefined when passing Japanese class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("テスト")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0510
     * @tc.name testRuntimeLinkerFindLoadedClass051
     * @tc.desc Verify findLoadedClass returns undefined when passing Korean class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("테스트")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0520
     * @tc.name testRuntimeLinkerFindLoadedClass052
     * @tc.desc Verify findLoadedClass returns undefined when passing Arabic class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("الاختبار")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0530
     * @tc.name testRuntimeLinkerFindLoadedClass053
     * @tc.desc Verify findLoadedClass returns undefined when passing emoji class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("😀")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0540
     * @tc.name testRuntimeLinkerFindLoadedClass054
     * @tc.desc Verify findLoadedClass returns undefined when passing special symbol class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("!@#$%^&*()")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0550
     * @tc.name testRuntimeLinkerFindLoadedClass055
     * @tc.desc Verify findLoadedClass returns undefined when passing script-like class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("<script>alert(1)</script>")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0560
     * @tc.name testRuntimeLinkerFindLoadedClass056
     * @tc.desc Verify findLoadedClass returns undefined when passing very long class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longClassName = "runtime.linker.FindLongName"
      for (let repeatIndex: int = 0; repeatIndex < 200; repeatIndex++) {
        longClassName += "Segment"
      }
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass(longClassName)
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0570
     * @tc.name testRuntimeLinkerFindLoadedClass057
     * @tc.desc Verify findLoadedClass returns undefined when passing pure numeric class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("12345")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0580
     * @tc.name testRuntimeLinkerFindLoadedClass058
     * @tc.desc Verify findLoadedClass returns undefined when passing hexadecimal-style class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("0x123")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0590
     * @tc.name testRuntimeLinkerFindLoadedClass059
     * @tc.desc Verify findLoadedClass returns undefined when passing date-style class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("2026-02-30")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0600
     * @tc.name testRuntimeLinkerFindLoadedClass060
     * @tc.desc Verify findLoadedClass returns undefined when passing email-style class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("test@example.com")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0610
     * @tc.name testRuntimeLinkerFindLoadedClass061
     * @tc.desc Verify findLoadedClass returns undefined when passing phone-style class name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("13800138000")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0620
     * @tc.name testRuntimeLinkerFindLoadedClass062
     * @tc.desc Verify findLoadedClass returns undefined when passing single dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass(".")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0630
     * @tc.name testRuntimeLinkerFindLoadedClass063
     * @tc.desc Verify findLoadedClass returns undefined for class name with leading dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass(".std.core.String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0640
     * @tc.name testRuntimeLinkerFindLoadedClass064
     * @tc.desc Verify findLoadedClass returns undefined for class name with trailing dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.String.")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0650
     * @tc.name testRuntimeLinkerFindLoadedClass065
     * @tc.desc Verify findLoadedClass returns undefined for class name with repeated dots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std..core..String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0660
     * @tc.name testRuntimeLinkerFindLoadedClass066
     * @tc.desc Verify findLoadedClass returns undefined for hyphen-separated class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std-core-String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0670
     * @tc.name testRuntimeLinkerFindLoadedClass067
     * @tc.desc Verify findLoadedClass returns undefined for underscore-separated class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std_core_String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0680
     * @tc.name testRuntimeLinkerFindLoadedClass068
     * @tc.desc Verify findLoadedClass returns undefined for lowercase standard class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.string")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0690
     * @tc.name testRuntimeLinkerFindLoadedClass069
     * @tc.desc Verify findLoadedClass returns undefined when standard package name is omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0700
     * @tc.name testRuntimeLinkerFindLoadedClass070
     * @tc.desc Verify findLoadedClass returns undefined for wrong package name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.String")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0710
     * @tc.name testRuntimeLinkerFindLoadedClass071
     * @tc.desc Verify findLoadedClass returns undefined for String class name with invalid suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.String.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0720
     * @tc.name testRuntimeLinkerFindLoadedClass072
     * @tc.desc Verify findLoadedClass returns undefined for Object class name with invalid suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Object.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0730
     * @tc.name testRuntimeLinkerFindLoadedClass073
     * @tc.desc Verify findLoadedClass returns undefined for Boolean class name with invalid suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Boolean.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0740
     * @tc.name testRuntimeLinkerFindLoadedClass074
     * @tc.desc Verify findLoadedClass returns undefined for Short class name with invalid suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Short.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0750
     * @tc.name testRuntimeLinkerFindLoadedClass075
     * @tc.desc Verify findLoadedClass returns undefined for Char class name with invalid suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Char.extra")
      expect(foundClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0760
     * @tc.name testRuntimeLinkerFindLoadedClass076
     * @tc.desc Verify findLoadedClass returns loaded std.core.Date class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Date")
      expect(foundClass!.getName()).assertEqual("std.core.Date")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0770
     * @tc.name testRuntimeLinkerFindLoadedClass077
     * @tc.desc Verify findLoadedClass returns loaded std.core.Error class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Error")
      expect(foundClass!.getName()).assertEqual("std.core.Error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0780
     * @tc.name testRuntimeLinkerFindLoadedClass078
     * @tc.desc Verify findLoadedClass returns loaded std.core.Map class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Map")
      expect(foundClass!.getName()).assertEqual("std.core.Map")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_FIND_LOADED_CLASS_0790
     * @tc.name testRuntimeLinkerFindLoadedClass079
     * @tc.desc Verify findLoadedClass returns loaded std.core.Promise class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerFindLoadedClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const foundClass = linker.findLoadedClass("std.core.Promise")
      expect(foundClass!.getName()).assertEqual("std.core.Promise")
    });


  });
}
