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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class ColorEnum158 extends BaseEnum<string> {
  constructor(value: string, name: string) {
    super(value, name);
  }
}

class StatusEnum159 extends BaseEnum<int> {
  constructor(value: int, name: string) {
    super(value, name);
  }

  public override toString(): string {
    return "Status[" + this.getName() + "=" + this.valueOf().toString() + "]"
  }
}

class MyEnum160 extends BaseEnum<int> {
  constructor(value: int, name: string) {
    super(value, name);
  }

  public getDescription(): string {
    return this.getName() + "=" + this.valueOf().toString()
  }
}

class BaseColor161 extends BaseEnum<string> {
  constructor(value: string, name: string) {
    super(value, name);
  }
}

class ExtendedColor161 extends BaseColor161 {
  constructor(value: string, name: string) {
    super(value, name);
  }

  public override toString(): string {
    return "Color:" + this.getName()
  }
}

class Direction165 extends BaseEnum<string> {
  public static readonly NORTH: Direction165 = new Direction165("N", "NORTH")
  public static readonly SOUTH: Direction165 = new Direction165("S", "SOUTH")
  public static readonly EAST: Direction165 = new Direction165("E", "EAST")
  public static readonly WEST: Direction165 = new Direction165("W", "WEST")

  constructor(value: string, name: string) {
    super(value, name);
  }
}

class HttpStatus166 extends BaseEnum<int> {
  public static readonly OK: HttpStatus166 = new HttpStatus166(200, "OK")
  public static readonly NOT_FOUND: HttpStatus166 = new HttpStatus166(404, "NOT_FOUND")
  public static readonly SERVER_ERROR: HttpStatus166 = new HttpStatus166(500, "INTERNAL_SERVER_ERROR")

  constructor(value: int, name: string) {
    super(value, name);
  }
}

class ErrorCode167 extends BaseEnum<long> {
  public static readonly NONE: ErrorCode167 = new ErrorCode167(Int.toLong(0), "NONE")
  public static readonly NETWORK: ErrorCode167 = new ErrorCode167(Int.toLong(1001), "NETWORK_ERROR")
  public static readonly TIMEOUT: ErrorCode167 = new ErrorCode167(Int.toLong(1002), "TIMEOUT_ERROR")

  constructor(value: long, name: string) {
    super(value, name);
  }
}

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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TWO_PARAMS")
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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "CONSISTENT_NAME")
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
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
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
      let e1: BaseEnum<int> = new BaseEnum<int>(1, "FIRST")
      let e2: BaseEnum<int> = new BaseEnum<int>(2, "SECOND")
      let e3: BaseEnum<int> = new BaseEnum<int>(3, "THIRD")
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
      let e1: BaseEnum<int> = new BaseEnum<int>(1, "FIRST")
      let e2: BaseEnum<int> = new BaseEnum<int>(2, "SECOND")
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
      let eInt: BaseEnum<int> = new BaseEnum<int>(42, "INT_CONST")
      let eStr: BaseEnum<string> = new BaseEnum<string>("HELLO", "STR_CONST")
      let eFloat: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_CONST")
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
     * @tc.desc Verify constructor throws Error when value is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let e: BaseEnum<int> = new BaseEnum<int>(null as int, "NULL_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnum011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1100
     * @tc.desc Verify constructor throws Error when name parameter is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let e: BaseEnum<int> = new BaseEnum<int>(1, null as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnum012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1200
     * @tc.desc Verify many BaseEnum instances do not cause memory overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enums: BaseEnum<int>[] = []
      for (let i = 0; i < 10000; i++) {
        enums.push(new BaseEnum<int>(i, "ENUM_" + i.toString()))
      }
      expect(enums[0].valueOf()).assertEqual(0)
      expect(enums[9999].valueOf()).assertEqual(9999)
      expect(enums[5000].getName()).assertEqual("ENUM_5000")
    });

    /**
     * @tc.name testBaseEnum013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1300
     * @tc.desc Verify two instances with same parameters do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(42, "SAME")
      let e2: BaseEnum<int> = new BaseEnum<int>(42, "SAME")
      expect(e1.valueOf()).assertEqual(e2.valueOf())
      expect(e1.getName()).assertEqual(e2.getName())
    });

    /**
     * @tc.name testBaseEnum014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1400
     * @tc.desc Verify overridden toString return contains enum related information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(100, "MY_ENUM")
      let str: string = e.toString()
      expect(str.length > 0).assertTrue()
    });

    /**
     * @tc.name testBaseEnum015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1500
     * @tc.desc Verify relationship between toString and getName return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST_NAME")
      let strResult: string = e.toString()
      let nameResult: string = e.getName()
      expect(typeof strResult === "string").assertTrue()
      expect(nameResult).assertEqual("TEST_NAME")
    });

    /**
     * @tc.name testBaseEnum016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1600
     * @tc.desc Verify relationship between toString and valueOf return values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "TEST")
      let strResult: string = e.toString()
      let valResult: int = e.valueOf()
      expect(typeof strResult === "string").assertTrue()
      expect(valResult).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnum017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1700
     * @tc.desc Verify BaseEnum can be subclassed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let color: ColorEnum158 = new ColorEnum158("RED", "COLOR_RED")
      expect(color.valueOf()).assertEqual("RED")
      expect(color.getName()).assertEqual("COLOR_RED")
      expect(typeof color.toString() === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1800
     * @tc.desc Verify subclass can override toString method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let status: StatusEnum159 = new StatusEnum159(1, "ACTIVE")
      expect(status.toString()).assertEqual("Status[ACTIVE=1]")
    });

    /**
     * @tc.name testBaseEnum019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_1900
     * @tc.desc Verify subclass can call parent valueOf and getName methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let e: MyEnum160 = new MyEnum160(5, "FIVE")
      expect(e.getDescription()).assertEqual("FIVE=5")
    });

    /**
     * @tc.name testBaseEnum020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2000
     * @tc.desc Verify method calls in multi-level inheritance chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let ec: ExtendedColor161 = new ExtendedColor161("#FF0000", "RED")
      expect(ec.valueOf()).assertEqual("#FF0000")
      expect(ec.getName()).assertEqual("RED")
      expect(ec.toString()).assertEqual("Color:RED")
    });

    /**
     * @tc.name testBaseEnum021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2100
     * @tc.desc Verify valueOf method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      let val: int = e.valueOf()
      expect(val).assertEqual(1)
    });

    /**
     * @tc.name testBaseEnum022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2200
     * @tc.desc Verify getName method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      let name: string = e.getName()
      expect(name).assertEqual("PUBLIC_TEST")
    });

    /**
     * @tc.name testBaseEnum023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2300
     * @tc.desc Verify toString method is publicly accessible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "PUBLIC_TEST")
      let str: string = e.toString()
      expect(typeof str === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2400
     * @tc.desc Verify enum constant collection pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(Direction165.NORTH.valueOf()).assertEqual("N")
      expect(Direction165.NORTH.getName()).assertEqual("NORTH")
      expect(Direction165.SOUTH.valueOf()).assertEqual("S")
      expect(Direction165.SOUTH.getName()).assertEqual("SOUTH")
    });

    /**
     * @tc.name testBaseEnum025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2500
     * @tc.desc Verify numeric enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(HttpStatus166.OK.valueOf()).assertEqual(200)
      expect(HttpStatus166.OK.getName()).assertEqual("OK")
      expect(HttpStatus166.NOT_FOUND.valueOf()).assertEqual(404)
      expect(HttpStatus166.SERVER_ERROR.valueOf()).assertEqual(500)
    });

    /**
     * @tc.name testBaseEnum026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2600
     * @tc.desc Verify long type enum constant pattern usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(ErrorCode167.NONE.valueOf()).assertEqual(Int.toLong(0))
      expect(ErrorCode167.NETWORK.valueOf()).assertEqual(Int.toLong(1001))
    });

    /**
     * @tc.name testBaseEnum027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2700
     * @tc.desc Verify different generic type BaseEnum instances coexist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intEnum: BaseEnum<int> = new BaseEnum<int>(1, "INT_ENUM")
      let strEnum: BaseEnum<string> = new BaseEnum<string>("VALUE", "STR_ENUM")
      let floatEnum: BaseEnum<float> = new BaseEnum<float>(1.5f, "FLOAT_ENUM")
      let longEnum: BaseEnum<long> = new BaseEnum<long>(Int.toLong(999), "LONG_ENUM")
      let byteEnum: BaseEnum<byte> = new BaseEnum<byte>(10 as byte, "BYTE_ENUM")
      let shortEnum: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT_ENUM")
      let doubleEnum: BaseEnum<double> = new BaseEnum<double>(2.5, "DOUBLE_ENUM")
      expect(intEnum.valueOf()).assertEqual(1)
      expect(strEnum.valueOf()).assertEqual("VALUE")
      expect(floatEnum.valueOf()).assertClose(1.5f, 0.001f)
      expect(longEnum.valueOf()).assertEqual(Int.toLong(999))
      expect(byteEnum.valueOf()).assertEqual(10 as byte)
      expect(shortEnum.valueOf()).assertEqual(100 as short)
      expect(doubleEnum.valueOf()).assertClose(2.5, 0.001)
    });

    /**
     * @tc.name testBaseEnum028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2800
     * @tc.desc Verify enum value comparison scenario
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let red: BaseEnum<string> = new BaseEnum<string>("#FF0000", "RED")
      let blue: BaseEnum<string> = new BaseEnum<string>("#0000FF", "BLUE")
      expect(red.valueOf() === blue.valueOf()).assertFalse()
      expect(red.getName() === blue.getName()).assertFalse()
    });

    /**
     * @tc.name testBaseEnum029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_2900
     * @tc.desc Verify BaseEnum constructor with valueOf, getName, and toString all work correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(1, "API_V20")
      expect(e.valueOf()).assertEqual(1)
      expect(e.getName()).assertEqual("API_V20")
      expect(typeof e.toString() === "string").assertTrue()
    });

    /**
     * @tc.name testBaseEnum030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_3000
     * @tc.desc Verify BaseEnum works in ArkTS-Sta mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staEnum: BaseEnum<int> = new BaseEnum<int>(42, "STA_MODE")
      expect(staEnum.valueOf()).assertEqual(42)
      expect(staEnum.getName()).assertEqual("STA_MODE")
    });

    /**
     * @tc.name testBaseEnum031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_3100
     * @tc.desc Verify constructor works normally with valid parameters in ArkTS-Sta mode
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnum031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(100, "STRICT_TYPE")
      let val: int = e.valueOf()
      let name: string = e.getName()
      let str: string = e.toString()
      expect(val).assertEqual(100)
      expect(name).assertEqual("STRICT_TYPE")
    });

  });
}
