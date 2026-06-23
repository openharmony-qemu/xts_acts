/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
import Utils from '../Util.test';

export default function ByteToStringTest(): void {
  describe("ByteToStringTest", () => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0100
     * @tc.name      testByteToStringNoParameter0001
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNoParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(65 as byte);
      let result: string = byteInstance.toString();
      expect(result).assertEqual("65");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0200
     * @tc.name      testByteToStringWithParameter0002
     * @tc.desc      Byte.toString(radix)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringWithParameter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(65 as byte);
      let result: string = byteInstance.toString(10 as int);
      expect(result).assertEqual("65");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0300
     * @tc.name      testByteToStringExtraParameters0003
     * @tc.desc      Byte.toString(radix) with hex radix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringExtraParameters0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(10 as byte);
      let result: string = byteInstance.toString(16 as int);
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0400
     * @tc.name      testByteToStringPositiveValues0004
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringPositiveValues0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byte1: Byte = new Byte(1 as byte);
      expect(byte1.toString()).assertEqual("1");

      let byte50: Byte = new Byte(50 as byte);
      expect(byte50.toString()).assertEqual("50");

      let byte127: Byte = new Byte(127 as byte);
      expect(byte127.toString()).assertEqual("127");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0500
     * @tc.name      testByteToStringNegativeValues0005
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNegativeValues0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteNeg1: Byte = new Byte(-1 as byte);
      expect(byteNeg1.toString()).assertEqual("-1");

      let byteNeg50: Byte = new Byte(-50 as byte);
      expect(byteNeg50.toString()).assertEqual("-50");

      let byteNeg128: Byte = new Byte(-128 as byte);
      expect(byteNeg128.toString()).assertEqual("-128");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0600
     * @tc.name      testByteToStringZeroValue0006
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringZeroValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteZero: Byte = new Byte(0 as byte);
      expect(byteZero.toString()).assertEqual("0");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0700
     * @tc.name      testByteToStringMaxValue0007
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringMaxValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteMax: Byte = new Byte(127 as byte);
      expect(byteMax.toString()).assertEqual("127");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0800
     * @tc.name      testByteToStringMinValue0008
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringMinValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteMin: Byte = new Byte(-128 as byte);
      expect(byteMin.toString()).assertEqual("-128");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_0900
     * @tc.name      testByteToStringReturnType0009
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringReturnType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(65 as byte);
      let result: string = byteInstance.toString();
      expect(typeof result === "string").assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1000
     * @tc.name      testByteToStringMultipleCalls0010
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringMultipleCalls0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(42 as byte);
      let result1: string = byteInstance.toString();
      let result2: string = byteInstance.toString();
      let result3: string = byteInstance.toString();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual("42");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1100
     * @tc.name      testByteToStringDifferentInstances0011
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringDifferentInstances0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byte65: Byte = new Byte(65 as byte);
      let byte66: Byte = new Byte(66 as byte);
      let byte67: Byte = new Byte(67 as byte);
      expect(byte65.toString()).assertEqual("65");
      expect(byte66.toString()).assertEqual("66");
      expect(byte67.toString()).assertEqual("67");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1200
     * @tc.name      testByteToStringImmutability0012
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringImmutability0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(100 as byte);
      let originalValue: string = byteInstance.toString();
      byteInstance.toString();
      byteInstance.toString();
      expect(byteInstance.toString()).assertEqual(originalValue);
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1300
     * @tc.name      testByteToStringNoLeadingZeros0013
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNoLeadingZeros0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byte1: Byte = new Byte(1 as byte);
      let byte10: Byte = new Byte(10 as byte);
      let byte100: Byte = new Byte(100 as byte);
      expect(byte1.toString()).assertEqual("1");
      expect(byte10.toString()).assertEqual("10");
      expect(byte100.toString()).assertEqual("100");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1400
     * @tc.name      testByteToStringNoSpaces0014
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNoSpaces0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(123 as byte);
      let result: string = byteInstance.toString();
      expect(result.indexOf(" ") === -1).assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1500
     * @tc.name      testByteToStringNoDecimalPoint0015
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNoDecimalPoint0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(123 as byte);
      let result: string = byteInstance.toString();
      expect(result.indexOf(".") === -1).assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1600
     * @tc.name      testByteToStringNegativeFormat0016
     * @tc.desc      修复ESE0105 Char和字符串不能===对比
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNegativeFormat0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteNeg: Byte = new Byte(-50 as byte);
      let result: string = byteNeg.toString();
      expect(result.substring(0, 1) === "-").assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1700
     * @tc.name      testByteToStringNegativeSignCount0017
     * @tc.desc      修复Char === 字符串报错
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNegativeSignCount0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteNeg: Byte = new Byte(-50 as byte);
      let result: string = byteNeg.toString();
      let signCount: number = 0;
      for (let i = 0; i < result.length; i++) {
        if (result[i] === "-") {
          signCount++;
        }
      }
      expect(signCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1800
     * @tc.name      testByteToStringStringLength0018
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringStringLength0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byte0: Byte = new Byte(0 as byte);
      expect(byte0.toString().length).assertEqual(1);

      let byte1: Byte = new Byte(1 as byte);
      expect(byte1.toString().length).assertEqual(1);

      let byteNeg1: Byte = new Byte(-1 as byte);
      expect(byteNeg1.toString().length).assertEqual(2);

      let byte127: Byte = new Byte(127 as byte);
      expect(byte127.toString().length).assertEqual(3);

      let byteNeg128: Byte = new Byte(-128 as byte);
      expect(byteNeg128.toString().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_1900
     * @tc.name      testByteToStringAllDigits0019
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringAllDigits0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(123 as byte);
      let result: string = byteInstance.toString();
      let validChars: string = "0123456789-";
      for (let i = 0; i < result.length; i++) {
        expect(validChars.indexOf(result[i]) !== -1).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2000
     * @tc.name      testByteToStringStringComparison0020
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringStringComparison0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byte10: Byte = new Byte(10 as byte);
      let byte20: Byte = new Byte(20 as byte);
      expect(byte10.toString().localeCompare(byte20.toString()) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2100
     * @tc.name      testByteToStringStringConcatenation0021
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringStringConcatenation0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(65 as byte);
      let result: string = "Value: " + byteInstance.toString();
      expect(result).assertEqual("Value: 65");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2200
     * @tc.name      testByteToStringTemplateString0022
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringTemplateString0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(42 as byte);
      let result: string = `Byte value is ${byteInstance.toString()}`;
      expect(result).assertEqual("Byte value is 42");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2300
     * @tc.name      testByteToStringArrayMap0023
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringArrayMap0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: Byte[] = [new Byte(1 as byte), new Byte(2 as byte), new Byte(3 as byte)];
      let stringArray: string[] = byteArray.map((b: Byte): string => b.toString());
      expect(stringArray[0]).assertEqual("1");
      expect(stringArray[1]).assertEqual("2");
      expect(stringArray[2]).assertEqual("3");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2400
     * @tc.name      testByteToStringArrayJoin0024
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringArrayJoin0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: Byte[] = [new Byte(10 as byte), new Byte(20 as byte), new Byte(30 as byte)];
      let joined: string = byteArray.map((b: Byte): string => b.toString()).join(",");
      expect(joined).assertEqual("10,20,30");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2600
     * @tc.name      testByteToStringVsToChar0026
     * @tc.desc      修复ESE0318 Char不能赋值给String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringVsToChar0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteA: Byte = new Byte(65 as byte);
      let toStringResult: string = byteA.toString();
      let toCharResult: string = "A";
      expect(toStringResult).assertEqual("65");
      expect(toCharResult).assertEqual("A");
      expect(toStringResult !== toCharResult).assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2700
     * @tc.name      testByteToStringVsToByte0027
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringVsToByte0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(50 as byte);
      let toStringResult: string = byteInstance.toString();
      let toByteResult: number = 50;
      expect(toStringResult).assertEqual("50");
      expect(toByteResult).assertEqual(50);
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2800
     * @tc.name      testByteToStringNotObjectDescription0028
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringNotObjectDescription0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(65 as byte);
      let result: string = byteInstance.toString();
      expect(result.indexOf("[object") === -1).assertTrue();
      expect(result.indexOf("Object") === -1).assertTrue();
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_2900
     * @tc.name      testByteToStringCompatibleWithNumber0029
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringCompatibleWithNumber0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(42 as byte);
      let number42: number = 42;
      expect(byteInstance.toString()).assertEqual(number42.toString());
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_3100
     * @tc.name      testByteToStringPerformance0031
     * @tc.desc      Byte.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringPerformance0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteInstance: Byte = new Byte(99 as byte);
      let count: number = 10000;
      let lastResult: string = "";
      for (let i = 0; i < count; i++) {
        lastResult = byteInstance.toString();
      }
      expect(lastResult).assertEqual("99");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_3200
     * @tc.name      testByteToStringLargeArray0032
     * @tc.desc      修复循环i类型传给Byte报错
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringLargeArray0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: Byte[] = [];
      for (let i = -128; i <= 127; i++) {
        byteArray.push(new Byte(Int.toByte(i)));
      }
      expect(byteArray.length).assertEqual(256);
      for (let j = 0; j < byteArray.length; j++) {
        let str: string = byteArray[j].toString();
        expect(str !== "").assertTrue();
      }
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_3300
     * @tc.name      testByteToStringZeroByte0033
     * @tc.desc      Verify Byte(0) toString returns "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringZeroByte0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new Byte(0 as byte);
      expect(b.toString()).assertEqual("0");
    });

    /**
     * @tc.number    SUB_BYTE_TOSTRING_TEST_3400
     * @tc.name      testByteToStringOneByte0034
     * @tc.desc      Verify Byte(1) toString returns "1"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToStringOneByte0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new Byte(1 as byte);
      expect(b.toString()).assertEqual("1");
    });
  });
}
