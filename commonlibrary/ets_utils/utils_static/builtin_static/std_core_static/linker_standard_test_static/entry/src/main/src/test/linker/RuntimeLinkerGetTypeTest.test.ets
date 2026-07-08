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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function RuntimeLinkerGetTypeTest(): void {
  describe('RuntimeLinkerGetTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0010
     * @tc.name testRuntimeLinkerGetType001
     * @tc.desc Verify getType with required type descriptor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.String")
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0020
     * @tc.name testRuntimeLinkerGetType002
     * @tc.desc Verify getType with Object type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Object")
      expect(type!.toString()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0030
     * @tc.name testRuntimeLinkerGetType003
     * @tc.desc Verify runtime linker handles empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0040
     * @tc.name testRuntimeLinkerGetType004
     * @tc.desc Verify getType returns consistent Type after class is loaded repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.String", false)
      const type1 = linker.getType("std.core.String")
      const type2 = linker.getType("std.core.String")
      expect(type1).assertEqual(type2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0050
     * @tc.name testRuntimeLinkerGetType005
     * @tc.desc Verify getType resolves std.core.Boolean type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Boolean")
      expect(type!.toString()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0060
     * @tc.name testRuntimeLinkerGetType006
     * @tc.desc Verify getType resolves std.core.Long type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Long")
      expect(type!.toString()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0070
     * @tc.name testRuntimeLinkerGetType007
     * @tc.desc Verify getType resolves std.core.Float type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Float")
      expect(type!.toString()).assertEqual("std.core.Float")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0080
     * @tc.name testRuntimeLinkerGetType008
     * @tc.desc Verify getType resolves std.core.Double type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Double")
      expect(type!.toString()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0090
     * @tc.name testRuntimeLinkerGetType009
     * @tc.desc Verify getType resolves std.core.Byte type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Byte")
      expect(type!.toString()).assertEqual("std.core.Byte")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0100
     * @tc.name testRuntimeLinkerGetType010
     * @tc.desc Verify runtime linker handles control characters embedded in descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core\t\nString")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0110
     * @tc.name testRuntimeLinkerGetType011
     * @tc.desc Verify getType resolves Type after loadClass with init set to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.String", true)
      const type = linker.getType("std.core.String")
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0120
     * @tc.name testRuntimeLinkerGetType012
     * @tc.desc Verify getType resolves std.core.Char type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Char")
      expect(type!.toString()).assertEqual("std.core.Char")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0130
     * @tc.name testRuntimeLinkerGetType013
     * @tc.desc Verify getType resolves std.core.Short type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Short")
      expect(type!.toString()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0140
     * @tc.name testRuntimeLinkerGetType014
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const first = linker.getType("std.core.String")
      const second = linker.getType("std.core.String")
      const third = linker.getType("std.core.String")
      expect(first).assertEqual(second)
      expect(first).assertEqual(third)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0150
     * @tc.name testRuntimeLinkerGetType015
     * @tc.desc Verify getType returns undefined for descriptor containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std. core .String")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0160
     * @tc.name testRuntimeLinkerGetType016
     * @tc.desc Verify runtime linker handles vertical tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("\u000B")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0170
     * @tc.name testRuntimeLinkerGetType017
     * @tc.desc Verify bulk getType workflows across standard class descriptors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const typeNames: Array<string> = [
        "string",
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
        const currentTypeName = typeNames[classIndex]
        const nextTypeName = typeNames[(classIndex + 1) % typeNames.length]
        const type = linker.getType(currentClass)
        expect(type!.toString()).assertEqual(currentTypeName)
        linker.loadClass(currentClass, false)
        const loadedType = linker.getType(currentClass)
        expect(loadedType!.toString()).assertEqual(currentTypeName)
        const nextType = linker.getType(nextClass)
        expect(nextType!.toString()).assertEqual(nextTypeName)
        expect(loadedType === nextType).assertFalse()
        linker.loadClass(nextClass, false)
        expect(linker.getType(nextClass)!.toString()).assertEqual(nextTypeName)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0180
     * @tc.name testRuntimeLinkerGetType018
     * @tc.desc Verify getType with Array type descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Array")
      expect(type!.toString()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0190
     * @tc.name testRuntimeLinkerGetType019
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.String")
      linker.loadClass("std.core.String", false)
      const typeAfter = linker.getType("std.core.String")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0200
     * @tc.name testRuntimeLinkerGetType020
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.String")
      linker.loadClass("std.core.String", true)
      const typeAfter = linker.getType("std.core.String")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0210
     * @tc.name testRuntimeLinkerGetType021
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.String")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid0")
      const typeAfter = linker.getType("std.core.String")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0220
     * @tc.name testRuntimeLinkerGetType022
     * @tc.desc Verify getType before and after loadClass false keeps std.core.Object descriptor stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Object")
      linker.loadClass("std.core.Object", false)
      const typeAfter = linker.getType("std.core.Object")
      expect(typeAfter!.toString()).assertEqual(typeBefore!.toString())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0230
     * @tc.name testRuntimeLinkerGetType023
     * @tc.desc Verify getType before and after loadClass true keeps std.core.Object descriptor stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Object")
      linker.loadClass("std.core.Object", true)
      const typeAfter = linker.getType("std.core.Object")
      expect(typeAfter!.toString()).assertEqual(typeBefore!.toString())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0240
     * @tc.name testRuntimeLinkerGetType024
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid1")
      const validType = linker.getType("std.core.Object")
      expect(invalidType).assertEqual(undefined)
      expect(validType!.toString()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0250
     * @tc.name testRuntimeLinkerGetType025
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Object")
      const secondType = linker.getType("std.core.Object")
      const thirdType = linker.getType("std.core.Object")
      expect(secondType!.toString()).assertEqual(firstType!.toString())
      expect(thirdType!.toString()).assertEqual(firstType!.toString())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0260
     * @tc.name testRuntimeLinkerGetType026
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Boolean")
      linker.loadClass("std.core.Boolean", false)
      const typeAfter = linker.getType("std.core.Boolean")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0270
     * @tc.name testRuntimeLinkerGetType027
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Boolean")
      linker.loadClass("std.core.Boolean", true)
      const typeAfter = linker.getType("std.core.Boolean")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0280
     * @tc.name testRuntimeLinkerGetType028
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Boolean")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid2")
      const typeAfter = linker.getType("std.core.Boolean")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0290
     * @tc.name testRuntimeLinkerGetType029
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Boolean")
      const secondType = linker.getType("std.core.Boolean")
      const thirdType = linker.getType("std.core.Boolean")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0300
     * @tc.name testRuntimeLinkerGetType030
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Byte")
      linker.loadClass("std.core.Byte", false)
      const typeAfter = linker.getType("std.core.Byte")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0310
     * @tc.name testRuntimeLinkerGetType031
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Byte")
      linker.loadClass("std.core.Byte", true)
      const typeAfter = linker.getType("std.core.Byte")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0320
     * @tc.name testRuntimeLinkerGetType032
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Byte")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid3")
      const typeAfter = linker.getType("std.core.Byte")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0330
     * @tc.name testRuntimeLinkerGetType033
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Byte")
      const secondType = linker.getType("std.core.Byte")
      const thirdType = linker.getType("std.core.Byte")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0340
     * @tc.name testRuntimeLinkerGetType034
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Short")
      linker.loadClass("std.core.Short", false)
      const typeAfter = linker.getType("std.core.Short")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0350
     * @tc.name testRuntimeLinkerGetType035
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Short")
      linker.loadClass("std.core.Short", true)
      const typeAfter = linker.getType("std.core.Short")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0360
     * @tc.name testRuntimeLinkerGetType036
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Short")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid4")
      const typeAfter = linker.getType("std.core.Short")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0370
     * @tc.name testRuntimeLinkerGetType037
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Short")
      const secondType = linker.getType("std.core.Short")
      const thirdType = linker.getType("std.core.Short")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0380
     * @tc.name testRuntimeLinkerGetType038
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Char")
      linker.loadClass("std.core.Char", false)
      const typeAfter = linker.getType("std.core.Char")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0390
     * @tc.name testRuntimeLinkerGetType039
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Char")
      linker.loadClass("std.core.Char", true)
      const typeAfter = linker.getType("std.core.Char")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0400
     * @tc.name testRuntimeLinkerGetType040
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Char")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid5")
      const typeAfter = linker.getType("std.core.Char")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0410
     * @tc.name testRuntimeLinkerGetType041
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Char")
      const secondType = linker.getType("std.core.Char")
      const thirdType = linker.getType("std.core.Char")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0420
     * @tc.name testRuntimeLinkerGetType042
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Long")
      linker.loadClass("std.core.Long", false)
      const typeAfter = linker.getType("std.core.Long")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0430
     * @tc.name testRuntimeLinkerGetType043
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Long")
      linker.loadClass("std.core.Long", true)
      const typeAfter = linker.getType("std.core.Long")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0440
     * @tc.name testRuntimeLinkerGetType044
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Long")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid6")
      const typeAfter = linker.getType("std.core.Long")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0450
     * @tc.name testRuntimeLinkerGetType045
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Long")
      const secondType = linker.getType("std.core.Long")
      const thirdType = linker.getType("std.core.Long")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0460
     * @tc.name testRuntimeLinkerGetType046
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Float")
      linker.loadClass("std.core.Float", false)
      const typeAfter = linker.getType("std.core.Float")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0470
     * @tc.name testRuntimeLinkerGetType047
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Float")
      linker.loadClass("std.core.Float", true)
      const typeAfter = linker.getType("std.core.Float")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0480
     * @tc.name testRuntimeLinkerGetType048
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Float")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid7")
      const typeAfter = linker.getType("std.core.Float")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0490
     * @tc.name testRuntimeLinkerGetType049
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Float")
      const secondType = linker.getType("std.core.Float")
      const thirdType = linker.getType("std.core.Float")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0500
     * @tc.name testRuntimeLinkerGetType050
     * @tc.desc Verify getType before and after loadClass false returns same Type for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Double")
      linker.loadClass("std.core.Double", false)
      const typeAfter = linker.getType("std.core.Double")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0510
     * @tc.name testRuntimeLinkerGetType051
     * @tc.desc Verify getType before and after loadClass true returns same Type for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Double")
      linker.loadClass("std.core.Double", true)
      const typeAfter = linker.getType("std.core.Double")
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0520
     * @tc.name testRuntimeLinkerGetType052
     * @tc.desc Verify invalid descriptor does not affect subsequent getType result for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Double")
      const invalidType = linker.getType("runtime.linker.GetTypeInvalid8")
      const typeAfter = linker.getType("std.core.Double")
      expect(invalidType).assertEqual(undefined)
      expect(typeAfter).assertEqual(typeBefore)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0530
     * @tc.name testRuntimeLinkerGetType053
     * @tc.desc Verify repeated getType calls keep stable Type identity for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const firstType = linker.getType("std.core.Double")
      const secondType = linker.getType("std.core.Double")
      const thirdType = linker.getType("std.core.Double")
      expect(secondType).assertEqual(firstType)
      expect(thirdType).assertEqual(firstType)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0540
     * @tc.name testRuntimeLinkerGetType054
     * @tc.desc Verify getType before and after loadClass false keeps std.core.Array descriptor stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBefore = linker.getType("std.core.Array")
      linker.loadClass("std.core.Array", false)
      const typeAfter = linker.getType("std.core.Array")
      expect(typeAfter!.toString()).assertEqual(typeBefore!.toString())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0550
     * @tc.name testRuntimeLinkerGetType055
     * @tc.desc Verify getType distinguishes std.core.String and std.core.Boolean after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Boolean", true)
      const leftType = linker.getType("std.core.String")
      const rightType = linker.getType("std.core.Boolean")
      linker.loadClass("std.core.String", false)
      const leftTypeAfterLoad = linker.getType("std.core.String")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0560
     * @tc.name testRuntimeLinkerGetType056
     * @tc.desc Verify getType distinguishes std.core.String and std.core.Float after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Float", true)
      const leftType = linker.getType("std.core.String")
      const rightType = linker.getType("std.core.Float")
      linker.loadClass("std.core.String", false)
      const leftTypeAfterLoad = linker.getType("std.core.String")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0570
     * @tc.name testRuntimeLinkerGetType057
     * @tc.desc Verify getType descriptor strings distinguish std.core.Object and std.core.Byte after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Byte", true)
      const leftType = linker.getType("std.core.Object")
      const rightType = linker.getType("std.core.Byte")
      linker.loadClass("std.core.Object", false)
      const leftTypeAfterLoad = linker.getType("std.core.Object")
      expect(leftTypeAfterLoad!.toString()).assertEqual(leftType!.toString())
      expect(leftType!.toString() === rightType!.toString()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0580
     * @tc.name testRuntimeLinkerGetType058
     * @tc.desc Verify getType descriptor strings distinguish std.core.Object and std.core.Float after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Float", true)
      const leftType = linker.getType("std.core.Object")
      const rightType = linker.getType("std.core.Float")
      linker.loadClass("std.core.Object", false)
      const leftTypeAfterLoad = linker.getType("std.core.Object")
      expect(leftTypeAfterLoad!.toString()).assertEqual(leftType!.toString())
      expect(leftType!.toString() === rightType!.toString()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0590
     * @tc.name testRuntimeLinkerGetType059
     * @tc.desc Verify getType descriptor strings distinguish std.core.Object and std.core.Double after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Double", true)
      const leftType = linker.getType("std.core.Object")
      const rightType = linker.getType("std.core.Double")
      linker.loadClass("std.core.Object", false)
      const leftTypeAfterLoad = linker.getType("std.core.Object")
      expect(leftTypeAfterLoad!.toString()).assertEqual(leftType!.toString())
      expect(leftType!.toString() === rightType!.toString()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0600
     * @tc.name testRuntimeLinkerGetType060
     * @tc.desc Verify getType descriptor strings distinguish std.core.Object and std.core.Array after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Array", true)
      const leftType = linker.getType("std.core.Object")
      const rightType = linker.getType("std.core.Array")
      linker.loadClass("std.core.Object", false)
      const leftTypeAfterLoad = linker.getType("std.core.Object")
      expect(leftTypeAfterLoad!.toString()).assertEqual(leftType!.toString())
      expect(leftType!.toString() === rightType!.toString()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0610
     * @tc.name testRuntimeLinkerGetType061
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.String after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.String", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.String")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0620
     * @tc.name testRuntimeLinkerGetType062
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Object after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Object", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Object")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0630
     * @tc.name testRuntimeLinkerGetType063
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Byte after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Byte", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Byte")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0640
     * @tc.name testRuntimeLinkerGetType064
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Short after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Short", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Short")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0650
     * @tc.name testRuntimeLinkerGetType065
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Char after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Char", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Char")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0660
     * @tc.name testRuntimeLinkerGetType066
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Long after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Long", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Long")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0670
     * @tc.name testRuntimeLinkerGetType067
     * @tc.desc Verify getType distinguishes std.core.Boolean and std.core.Float after mixed load order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.Float", true)
      const leftType = linker.getType("std.core.Boolean")
      const rightType = linker.getType("std.core.Float")
      linker.loadClass("std.core.Boolean", false)
      const leftTypeAfterLoad = linker.getType("std.core.Boolean")
      expect(leftTypeAfterLoad).assertEqual(leftType)
      expect(leftType === rightType).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0680
     * @tc.name testRuntimeLinkerGetType068
     * @tc.desc Verify getType resolves std.core.Date type descriptor from standard library
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Date")
      expect(type!.toString()).assertEqual("std.core.Date")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0690
     * @tc.name testRuntimeLinkerGetType069
     * @tc.desc Verify getType resolves std.core.Error type descriptor from standard library
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Error")
      expect(type!.toString()).assertEqual("std.core.Error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0700
     * @tc.name testRuntimeLinkerGetType070
     * @tc.desc Verify getType resolves std.core.RangeError type descriptor from Error hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.RangeError")
      expect(type!.toString()).assertEqual("std.core.RangeError")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0710
     * @tc.name testRuntimeLinkerGetType071
     * @tc.desc Verify getType returns undefined for std.core.Number descriptor not exposed to runtime linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Number")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0720
     * @tc.name testRuntimeLinkerGetType072
     * @tc.desc Verify getType resolves std.core.BigInt type descriptor from standard library
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.BigInt")
      expect(type!.toString()).assertEqual("std.core.BigInt")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0730
     * @tc.name testRuntimeLinkerGetType073
     * @tc.desc Verify getType resolves std.core.Promise type descriptor without generic arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Promise")
      expect(type!.toString()).assertEqual("std.core.Promise")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0740
     * @tc.name testRuntimeLinkerGetType074
     * @tc.desc Verify getType resolves std.core.Map erased generic class descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Map")
      expect(type!.toString()).assertEqual("std.core.Map")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0750
     * @tc.name testRuntimeLinkerGetType075
     * @tc.desc Verify getType resolves std.core.Set erased generic class descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Set")
      expect(type!.toString()).assertEqual("std.core.Set")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0760
     * @tc.name testRuntimeLinkerGetType076
     * @tc.desc Verify getType returns undefined when descriptor omits package name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("String")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0770
     * @tc.name testRuntimeLinkerGetType077
     * @tc.desc Verify getType returns undefined for descriptor with lowercase class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.string")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0780
     * @tc.name testRuntimeLinkerGetType078
     * @tc.desc Verify getType returns undefined for descriptor with leading and trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType(" std.core.String ")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0790
     * @tc.name testRuntimeLinkerGetType079
     * @tc.desc Verify getType returns undefined for descriptor using repeated dot separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core..String")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0800
     * @tc.name testRuntimeLinkerGetType080
     * @tc.desc Verify getType returns undefined for descriptor string containing generic arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Map<std.core.String,std.core.String>")
      expect(type).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_GET_TYPE_0810
     * @tc.name testRuntimeLinkerGetType081
     * @tc.desc Verify getType returns undefined for descriptor containing zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerGetType081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.\u200BString")
      expect(type).assertEqual(undefined)
    });
  });
}
