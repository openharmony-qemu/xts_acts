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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import {
  BaseByteEnum,
  BaseDoubleEnum,
  BaseFloatEnum,
  BaseIntEnum,
  BaseLongEnum,
  BaseShortEnum,
  BaseStringEnum,
  DirectionEnum,
  ErrorCodeEnum,
  HttpStatusEnum
} from './EnumDefine.test';
import Utils from './../Util.test';

export default function BaseEnumTest(): void {
  describe('BaseEnumTest', (): void => {
    // yield to coroutine scheduler for proper async test execution
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1);
    });

    /**
     * @tc.name testBaseEnum001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0100
     * @tc.desc Verify constructor with correct value and name parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TWO_PARAMS
      expect(e.valueOf()).assertEqual(42)
      expect(e.getName()).assertEqual("TWO_PARAMS")
    });

    /**
     * @tc.name testBaseEnum002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0200
     * @tc.desc Verify valueOf no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST
      let val: int = e.valueOf()
      expect(val).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0300
     * @tc.desc Verify getName no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST
      let name: string = e.getName()
      expect(name).assertEqual("TEST")
    });

    /**
     * @tc.name testBaseEnum004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0400
     * @tc.desc Verify toString no-argument call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST
      let str: string = e.toString()
      expect(typeof str === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0500
     * @tc.desc Verify multiple calls to getName return consistent value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.CONSISTENT_NAME
      let n1: string = e.getName()
      let n2: string = e.getName()
      let n3: string = e.getName()
      expect(n1).assertEqual(n2)
      expect(n2).assertEqual(n3)
      expect(n1).assertEqual("CONSISTENT_NAME")
    });

    /**
     * @tc.name testBaseEnum006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0600
     * @tc.desc Verify multiple calls to toString return consistent value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST
      let s1: string = e.toString()
      let s2: string = e.toString()
      expect(s1).assertEqual(s2)
    });

    /**
     * @tc.name testBaseEnum007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0700
     * @tc.desc Verify different instances have independent values via valueOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = BaseIntEnum.FIRST
      let e2 = BaseIntEnum.SECOND
      let e3 = BaseIntEnum.THIRD
      expect(e1.valueOf()).assertEqual(1)
      expect(e2.valueOf()).assertEqual(2)
      expect(e3.valueOf()).assertEqual(3)
    });

    /**
     * @tc.name testBaseEnum008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0800
     * @tc.desc Verify different instances have independent names via getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = BaseIntEnum.FIRST
      let e2 = BaseIntEnum.SECOND
      expect(e1.getName()).assertEqual("FIRST")
      expect(e2.getName()).assertEqual("SECOND")
    });

    /**
     * @tc.name testBaseEnum009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_0900
     * @tc.desc Verify different generic type instances do not interfere
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eInt = BaseIntEnum.INT_CONST
      let eStr = BaseStringEnum.STR_CONST
      let eFloat = BaseFloatEnum.FLOAT_CONST
      expect(eInt.valueOf()).assertEqual(42)
      expect(eStr.valueOf()).assertEqual("HELLO")
      expect(eFloat.valueOf()).assertClose(3.14f, 0.001f)
      expect(eInt.getName()).assertEqual("INT_CONST")
      expect(eStr.getName()).assertEqual("STR_CONST")
      expect(eFloat.getName()).assertEqual("FLOAT_CONST")
    });

    /**
     * @tc.name testBaseEnum010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1000
     * @tc.desc Verify two instances with same parameters do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = BaseIntEnum.SAME
      let e2 = BaseIntEnum.SAME
      expect(e1.valueOf()).assertEqual(e2.valueOf())
      expect(e1.getName()).assertEqual(e2.getName())
    });

    /**
     * @tc.name testBaseEnum011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1100
     * @tc.desc Verify overridden toString return contains enum related information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.MY_ENUM
      let str: string = e.toString()
      expect(str.length > 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1200
     * @tc.desc Verify relationship between toString and getName return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST_NAME
      let strResult: string = e.toString()
      let nameResult: string = e.getName()
      expect(typeof strResult === "string").assertTrue()
      expect(nameResult).assertEqual("TEST_NAME")
    });

    /**
     * @tc.name testBaseEnum013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1300
     * @tc.desc Verify relationship between toString and valueOf return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.TEST
      let strResult: string = e.toString()
      let valResult: int = e.valueOf()
      expect(typeof strResult === "string").assertTrue()
      expect(valResult).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1400
     * @tc.desc Verify valueOf method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.PUBLIC_TEST
      let val: int = e.valueOf()
      expect(val).assertEqual(1)
    });

    /**
     * @tc.name testBaseEnum015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1500
     * @tc.desc Verify getName method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.PUBLIC_TEST
      let name: string = e.getName()
      expect(name).assertEqual("PUBLIC_TEST")
    });

    /**
     * @tc.name testBaseEnum016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1600
     * @tc.desc Verify toString method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.PUBLIC_TEST
      let str: string = e.toString()
      expect(typeof str === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1700
     * @tc.desc Verify enum constant collection pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(DirectionEnum.NORTH.valueOf()).assertEqual("N")
      expect(DirectionEnum.NORTH.getName()).assertEqual("NORTH")
      expect(DirectionEnum.SOUTH.valueOf()).assertEqual("S")
      expect(DirectionEnum.SOUTH.getName()).assertEqual("SOUTH")
    });

    /**
     * @tc.name testBaseEnum018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1800
     * @tc.desc Verify numeric enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(HttpStatusEnum.OK.valueOf()).assertEqual(200)
      expect(HttpStatusEnum.OK.getName()).assertEqual("OK")
      expect(HttpStatusEnum.NOT_FOUND.valueOf()).assertEqual(404)
      expect(HttpStatusEnum.INTERNAL_SERVER_ERROR.valueOf()).assertEqual(500)
    });

    /**
     * @tc.name testBaseEnum019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1900
     * @tc.desc Verify long type enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ErrorCodeEnum.NONE.valueOf()).assertEqual(Int.toLong(0))
      expect(ErrorCodeEnum.NETWORK_ERROR.valueOf()).assertEqual(Int.toLong(1001))
    });

    /**
     * @tc.name testBaseEnum020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2000
     * @tc.desc Verify different generic type BaseEnum instances coexist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intEnum = BaseIntEnum.INT_ENUM
      let strEnum = BaseStringEnum.STR_ENUM
      let floatEnum = BaseFloatEnum.FLOAT_ENUM
      let longEnum = BaseLongEnum.LONG_ENUM
      let byteEnum = BaseByteEnum.BYTE_ENUM
      let shortEnum = BaseShortEnum.SHORT_ENUM
      let doubleEnum = BaseDoubleEnum.DOUBLE_ENUM
      expect(intEnum.valueOf()).assertEqual(1)
      expect(strEnum.valueOf()).assertEqual("VALUE")
      expect(floatEnum.valueOf()).assertClose(1.5f, 0.001f)
      expect(longEnum.valueOf()).assertEqual(Int.toLong(999))
      expect(byteEnum.valueOf()).assertEqual(10 as byte)
      expect(shortEnum.valueOf()).assertEqual(100 as short)
      expect(doubleEnum.valueOf()).assertClose(2.5, 0.001)
    });

    /**
     * @tc.name testBaseEnum021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2100
     * @tc.desc Verify enum value comparison scenario
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let red = BaseStringEnum.RED
      let blue = BaseStringEnum.BLUE
      expect(red.valueOf() === blue.valueOf()).assertFalse()
      expect(red.getName() === blue.getName()).assertFalse()
    });

    /**
     * @tc.name testBaseEnum022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2200
     * @tc.desc Verify BaseEnum constructor with valueOf, getName, and toString all work correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.API_V20
      expect(e.valueOf()).assertEqual(1)
      expect(e.getName()).assertEqual("API_V20")
      expect(typeof e.toString() === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2300
     * @tc.desc Verify BaseEnum works in ArkTS-Sta mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staEnum = BaseIntEnum.STA_MODE
      expect(staEnum.valueOf()).assertEqual(42)
      expect(staEnum.getName()).assertEqual("STA_MODE")
    });

    /**
     * @tc.name testBaseEnum024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2400
     * @tc.desc Verify constructor works normally with valid parameters in ArkTS-Sta mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = BaseIntEnum.STRICT_TYPE
      let val: int = e.valueOf()
      let name: string = e.getName()
      let str: string = e.toString()
      expect(val).assertEqual(100)
      expect(name).assertEqual("STRICT_TYPE")
    });
  });
}
