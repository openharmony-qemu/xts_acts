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
} from  '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function ErrorToStringTest(): void {
  describe('ErrorToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0100
     * @tc.name testErrorToString001
     * @tc.desc Verify default toString returns 'Error' for no-arg Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.toString()).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0200
     * @tc.name testErrorToString002
     * @tc.desc Verify toString returns 'Error: msg' for Error with message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("something broke");
      expect(err.toString()).assertEqual("Error: something broke");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0300
     * @tc.name testErrorToString003
     * @tc.desc Verify toString reflects custom name with message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "CustomError";
      err.message = "custom msg";
      expect(err.toString()).assertEqual("CustomError: custom msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0400
     * @tc.name testErrorToString004
     * @tc.desc Verify toString with empty name shows only the message (no colon)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "";
      err.message = "msg";
      expect(err.toString()).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0500
     * @tc.name testErrorToString005
     * @tc.desc Verify toString with empty message shows just the name (no colon)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "Test";
      err.message = "";
      expect(err.toString()).assertEqual("Test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0600
     * @tc.name testErrorToString006
     * @tc.desc Verify toString reflects latest name and message after mutations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "RangeError";
      err.message = "out of range";
      err.code = 500;
      expect(err.toString()).assertEqual("RangeError: out of range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0700
     * @tc.name testErrorToString007
     * @tc.desc Verify toString returns empty string when name and message are both empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "";
      err.message = "";
      expect(err.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0800
     * @tc.name testErrorToString008
     * @tc.desc Verify toString handles name with special characters and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "Err-1_2$";
      err.message = "msg";
      expect(err.toString()).assertEqual("Err-1_2$: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0900
     * @tc.name testErrorToString009
     * @tc.desc Verify toString handles ASCII name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "ErrorTest";
      err.message = "test message";
      expect(err.toString()).assertEqual("ErrorTest: test message");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1000
     * @tc.name testErrorToString010
     * @tc.desc Verify toString with short name and long message preserves full message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "E";
      err.message = "A relatively long error message for testing toString";
      expect(err.toString()).assertEqual("E: A relatively long error message for testing toString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1100
     * @tc.name testErrorToString011
     * @tc.desc Verify toString preserves special characters in message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.message = "err<tag>&val";
      expect(err.toString()).assertEqual("Error: err<tag>&val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1200
     * @tc.name testErrorToString012
     * @tc.desc Verify multiple toString calls on same instance return consistent value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "Stable";
      err.message = "test";
      let first: string = err.toString();
      let second: string = err.toString();
      expect(first).assertEqual(second);
      expect(first).assertEqual("Stable: test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1300
     * @tc.name testErrorToString013
     * @tc.desc Verify code doesn't affect toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("hello");
      let s1: string = e.toString();
      e.code = 999;
      expect(e.toString()).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1400
     * @tc.name testErrorToString014
     * @tc.desc Verify cause doesn't affect toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("hello");
      let s1: string = e.toString();
      e.cause = new Error("inner");
      expect(e.toString()).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1500
     * @tc.name testErrorToString015
     * @tc.desc Verify stack doesn't affect toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("hello");
      let s1: string = e.toString();
      e.stack = "custom";
      expect(e.toString()).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1600
     * @tc.name testErrorToString016
     * @tc.desc Verify Special chars in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "@#$%^";
      e.message = "msg";
      expect(e.toString()).assertEqual("@#$%^: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1700
     * @tc.name testErrorToString017
     * @tc.desc Verify ASCII name and message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "ABC";
      e.message = "XYZ";
      expect(e.toString()).assertEqual("ABC: XYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1800
     * @tc.name testErrorToString018
     * @tc.desc Verify Large code doesn't leak
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483647, "msg");
      expect(e.toString()).assertEqual("Error: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_1900
     * @tc.name testErrorToString019
     * @tc.desc Verify Mutation sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "A";
      e.message = "1";
      expect(e.toString()).assertEqual("A: 1");
      e.name = "B";
      e.message = "2";
      expect(e.toString()).assertEqual("B: 2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2000
     * @tc.name testErrorToString020
     * @tc.desc Verify Name with colon
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "Err:N";
      e.message = "t";
      expect(e.toString()).assertEqual("Err:N: t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2100
     * @tc.name testErrorToString021
     * @tc.desc Verify Code=0 toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, "zero");
      expect(e.toString()).assertEqual("Error: zero");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2200
     * @tc.name testErrorToString022
     * @tc.desc Verify Long name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = "E".repeat(200);
      let e: Error = new Error(longStr, "m");
      expect(e.toString()).assertEqual(longStr + ": m");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2300
     * @tc.name testErrorToString023
     * @tc.desc Verify Long message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg: String = "M".repeat(200);
      let e: Error = new Error("E", longMsg);
      expect(e.toString()).assertEqual("E: " + longMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2400
     * @tc.name testErrorToString024
     * @tc.desc Verify Empty name toString shows only message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "";
      e.message = "msg";
      expect(e.name).assertEqual("");
      expect(e.toString()).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2500
     * @tc.name testErrorToString025
     * @tc.desc Verify UUID as name in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = '550e8400-e29b-41d4-a716-446655440000';
      let e: Error = new Error(uuid, 'op failed');
      expect(e.toString()).assertEqual(uuid + ': op failed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2600
     * @tc.name testErrorToString026
     * @tc.desc Verify UUID as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';
      let e: Error = new Error('UUID-Error', uuid);
      expect(e.toString()).assertEqual('UUID-Error: ' + uuid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2700
     * @tc.name testErrorToString027
     * @tc.desc Verify URL as name in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://api.example.com/v1/users';
      let e: Error = new Error(url, 'timeout');
      expect(e.toString()).assertEqual(url + ': timeout');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2800
     * @tc.name testErrorToString028
     * @tc.desc Verify URL as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://example.com/not-found';
      let e: Error = new Error('HttpError', url);
      expect(e.toString()).assertEqual('HttpError: ' + url);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2900
     * @tc.name testErrorToString029
     * @tc.desc Verify hex string as name in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexName: string = '0xDEADBEEF';
      let e: Error = new Error(hexName, 'memory fault');
      expect(e.toString()).assertEqual(hexName + ': memory fault');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3000
     * @tc.name testErrorToString030
     * @tc.desc Verify hex string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexMsg: string = '0xA1B2C3D4';
      let e: Error = new Error('HexErr', hexMsg);
      expect(e.toString()).assertEqual('HexErr: ' + hexMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3100
     * @tc.name testErrorToString031
     * @tc.desc Verify binary string as name in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binName: string = '101010111100';
      let e: Error = new Error(binName, 'bit error');
      expect(e.toString()).assertEqual(binName + ': bit error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3200
     * @tc.name testErrorToString032
     * @tc.desc Verify binary string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binMsg: string = '110011001100';
      let e: Error = new Error('BinErr', binMsg);
      expect(e.toString()).assertEqual('BinErr: ' + binMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3300
     * @tc.name testErrorToString033
     * @tc.desc Verify numeric string as name in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numName: string = '404';
      let e: Error = new Error(numName, 'not found');
      expect(e.toString()).assertEqual(numName + ': not found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3400
     * @tc.name testErrorToString034
     * @tc.desc Verify numeric string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numMsg: string = '12345678901234567890';
      let e: Error = new Error('NumErr', numMsg);
      expect(e.toString()).assertEqual('NumErr: ' + numMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3500
     * @tc.name testErrorToString035
     * @tc.desc Verify toString with name and message both being "0" returns "0: 0"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("0", "0");
      expect(e.toString()).assertEqual("0: 0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3600
     * @tc.name testErrorToString036
     * @tc.desc Verify A1 constructor(code) toString returns 'Error' with empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(429);
      expect(e.toString()).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3700
     * @tc.name testErrorToString037
     * @tc.desc Verify A3 constructor(name, code, msg) toString formats as 'name: msg'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyErr", 403, "msg");
      expect(e.toString()).assertEqual("MyErr: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3800
     * @tc.name testErrorToString038
     * @tc.desc Verify A3 constructor(name, code) with no message toString returns just name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyErr", 500);
      expect(e.toString()).assertEqual("MyErr");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3900
     * @tc.name testErrorToString039
     * @tc.desc Verify A3 constructor(name, code, empty msg) toString returns just name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyErr", 42, "");
      expect(e.toString()).assertEqual("MyErr");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4000
     * @tc.name testErrorToString040
     * @tc.desc Verify multi-language mixed characters as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'اختبارтестテスト';
      let e: Error = new Error('Multi', msg);
      expect(e.toString()).assertEqual('Multi: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4100
     * @tc.name testErrorToString041
     * @tc.desc Verify email format string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'test@example.com';
      let e: Error = new Error('Email', msg);
      expect(e.toString()).assertEqual('Email: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4200
     * @tc.name testErrorToString042
     * @tc.desc Verify phone format string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '13800138000';
      let e: Error = new Error('Phone', msg);
      expect(e.toString()).assertEqual('Phone: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4300
     * @tc.name testErrorToString043
     * @tc.desc Verify date format string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '2026-03-05';
      let e: Error = new Error('Date', msg);
      expect(e.toString()).assertEqual('Date: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4400
     * @tc.name testErrorToString044
     * @tc.desc Verify floating point number string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '123.456';
      let e: Error = new Error('Float', msg);
      expect(e.toString()).assertEqual('Float: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4500
     * @tc.name testErrorToString045
     * @tc.desc Verify scientific notation string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '1.0e6';
      let e: Error = new Error('Sci', msg);
      expect(e.toString()).assertEqual('Sci: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4600
     * @tc.name testErrorToString046
     * @tc.desc Verify XSS payload string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '<script>alert(1)</script>';
      let e: Error = new Error('Xss', msg);
      expect(e.toString()).assertEqual('Xss: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4700
     * @tc.name testErrorToString047
     * @tc.desc Verify null character embedded in name for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'Err\0or';
      let e: Error = new Error(name, 'msg');
      expect(e.toString()).assertEqual(name + ': msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4800
     * @tc.name testErrorToString048
     * @tc.desc Verify control characters tab and newline in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'a\tb\nc';
      let e: Error = new Error('Ctrl', msg);
      expect(e.toString()).assertEqual('Ctrl: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4900
     * @tc.name testErrorToString049
     * @tc.desc Verify zero-width space in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'a​b';
      let e: Error = new Error('ZW', msg);
      expect(e.toString()).assertEqual('ZW: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5000
     * @tc.name testErrorToString050
     * @tc.desc Verify encoding garbage string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'æµè¯';
      let e: Error = new Error('Enc', msg);
      expect(e.toString()).assertEqual('Enc: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5100
     * @tc.name testErrorToString051
     * @tc.desc Verify literal unicode escape string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '\\u4e2d\\u6587';
      let e: Error = new Error('Uni', msg);
      expect(e.toString()).assertEqual('Uni: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5200
     * @tc.name testErrorToString052
     * @tc.desc Verify all punctuation special characters as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let e: Error = new Error('Punct', msg);
      expect(e.toString()).assertEqual('Punct: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5300
     * @tc.name testErrorToString053
     * @tc.desc Verify invalid Unicode U+FFFE in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before￾during\xFFFFafter';
      let e: Error = new Error('BadUni', msg);
      expect(e.toString()).assertEqual('BadUni: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5400
     * @tc.name testErrorToString054
     * @tc.desc Verify replacement char U+FFFD in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'replacement�char';
      let e: Error = new Error('Repl', msg);
      expect(e.toString()).assertEqual('Repl: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5500
     * @tc.name testErrorToString055
     * @tc.desc Verify lone surrogate in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'lone\uD800surrogate';
      let e: Error = new Error('Surr', msg);
      expect(e.toString()).assertEqual('Surr: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5600
     * @tc.name testErrorToString056
     * @tc.desc Verify full-width dash and half-width dash in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '—–-';
      let e: Error = new Error('Dash', msg);
      expect(e.toString()).assertEqual('Dash: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5700
     * @tc.name testErrorToString057
     * @tc.desc Verify Japanese Korean Russian as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'テスト테스트АБВГД';
      let e: Error = new Error('Lang', msg);
      expect(e.toString()).assertEqual('Lang: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5800
     * @tc.name testErrorToString058
     * @tc.desc Verify math symbols in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '∑π√∞≤±';
      let e: Error = new Error('Math', msg);
      expect(e.toString()).assertEqual('Math: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5900
     * @tc.name testErrorToString059
     * @tc.desc Verify NaN string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'NaN';
      let e: Error = new Error('Num', msg);
      expect(e.toString()).assertEqual('Num: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6000
     * @tc.name testErrorToString060
     * @tc.desc Verify Infinity string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'Infinity';
      let e: Error = new Error('Num', msg);
      expect(e.toString()).assertEqual('Num: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6100
     * @tc.name testErrorToString061
     * @tc.desc Verify ID card format string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '310101199001011234';
      let e: Error = new Error('Id', msg);
      expect(e.toString()).assertEqual('Id: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6200
     * @tc.name testErrorToString062
     * @tc.desc Verify Unicode max U+FFFF in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'max￿char';
      let e: Error = new Error('Umax', msg);
      expect(e.toString()).assertEqual('Umax: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6300
     * @tc.name testErrorToString063
     * @tc.desc Verify emoji as unicode escape in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '🌟test😀';
      let e: Error = new Error('Emoji', msg);
      expect(e.toString()).assertEqual('Emoji: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6400
     * @tc.name testErrorToString064
     * @tc.desc Verify invalid UTF-8 sequence as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'ä?­';
      let e: Error = new Error('Utf8', msg);
      expect(e.toString()).assertEqual('Utf8: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6500
     * @tc.name testErrorToString065
     * @tc.desc Verify octal format string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '0123';
      let e: Error = new Error('Oct', msg);
      expect(e.toString()).assertEqual('Oct: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6600
     * @tc.name testErrorToString066
     * @tc.desc Verify long string (5000 chars) as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'M'.repeat(5000);
      let e: Error = new Error('Long', msg);
      expect(e.toString()).assertEqual('Long: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6700
     * @tc.name testErrorToString067
     * @tc.desc Verify single char name and message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('a', 'a');
      expect(e.toString()).assertEqual('a: a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6800
     * @tc.name testErrorToString068
     * @tc.desc Verify negative zero string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '-0.0';
      let e: Error = new Error('Neg', msg);
      expect(e.toString()).assertEqual('Neg: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6900
     * @tc.name testErrorToString069
     * @tc.desc Verify JSON object string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '{"key":"value","num":42}';
      let e: Error = new Error('Json', msg);
      expect(e.toString()).assertEqual('Json: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7000
     * @tc.name testErrorToString070
     * @tc.desc Verify JSON array string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '[1,2,3]';
      let e: Error = new Error('Json', msg);
      expect(e.toString()).assertEqual('Json: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7100
     * @tc.name testErrorToString071
     * @tc.desc Verify nested JSON string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '{"error":{"code":500,"message":"internal"}}';
      let e: Error = new Error('Nest', msg);
      expect(e.toString()).assertEqual('Nest: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7200
     * @tc.name testErrorToString072
     * @tc.desc Verify toString with unicode name and empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("त्रुटि", "");
      expect(e.toString()).assertEqual("त्रुटि");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7300
     * @tc.name testErrorToString073
     * @tc.desc Verify toString with Chinese name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("错误", "消息");
      expect(e.toString()).assertEqual("错误: 消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7400
     * @tc.name testErrorToString074
     * @tc.desc Verify toString with Korean name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("오류", "메시지");
      expect(e.toString()).assertEqual("오류: 메시지");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7500
     * @tc.name testErrorToString075
     * @tc.desc Verify toString with mixed script name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Error오류", "ข้อความ消息");
      expect(e.toString()).assertEqual("Error오류: ข้อความ消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7600
     * @tc.name testErrorToString076
     * @tc.desc Verify toString with emoji in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("⚠️Error", "test");
      expect(e.toString()).assertEqual("⚠️Error: test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7700
     * @tc.name testErrorToString077
     * @tc.desc Verify toString with empty name and unicode message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "";
      e.message = "ข้อความผิดพลาด";
      expect(e.toString()).assertEqual("ข้อความผิดพลาด");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7800
     * @tc.name testErrorToString078
     * @tc.desc Verify built-in Error subclass toString outputs type names and messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new TypeError('type msg').toString()).assertEqual('TypeError: type msg');
      expect(new RangeError('range msg').toString()).assertEqual('RangeError: range msg');
      expect(new SyntaxError('syntax msg').toString()).assertEqual('SyntaxError: syntax msg');
      expect(new ReferenceError('ref msg').toString()).assertEqual('ReferenceError: ref msg');
      expect(new EvalError('eval msg').toString()).assertEqual('EvalError: eval msg');
      expect(new URIError('uri msg').toString()).assertEqual('URIError: uri msg');
      let aggErr: AggregateError = new AggregateError([new Error('inner')], 'agg msg');
      expect(aggErr.toString()).assertEqual('AggregateError: agg msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7900
     * @tc.name testErrorToString079
     * @tc.desc Verify Arabic RTL string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'اختبار';
      let e: Error = new Error('Arab', msg);
      expect(e.toString()).assertEqual('Arab: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8000
     * @tc.name testErrorToString080
     * @tc.desc Verify real emoji character as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before😀after';
      let e: Error = new Error('Emoji', msg);
      expect(e.toString()).assertEqual('Emoji: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8100
     * @tc.name testErrorToString081
     * @tc.desc Verify device symbol emoji in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'call📱now';
      let e: Error = new Error('Device', msg);
      expect(e.toString()).assertEqual('Device: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8200
     * @tc.name testErrorToString082
     * @tc.desc Verify isolated surrogate in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'solo\udc04end';
      let e: Error = new Error('Surr', msg);
      expect(e.toString()).assertEqual('Surr: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8300
     * @tc.name testErrorToString083
     * @tc.desc Verify overlong UTF-8 encoding sequence in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'bad\xc0\x81seq';
      let e: Error = new Error('OL', msg);
      expect(e.toString()).assertEqual('OL: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8400
     * @tc.name testErrorToString084
     * @tc.desc Verify GBK to UTF-8 mojibake string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'mojibake æµè¯';
      let e: Error = new Error('GBK', msg);
      expect(e.toString()).assertEqual('GBK: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8500
     * @tc.name testErrorToString085
     * @tc.desc Verify masked bank card number string as message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '622202********1234';
      let e: Error = new Error('Card', msg);
      expect(e.toString()).assertEqual('Card: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8600
     * @tc.name testErrorToString086
     * @tc.desc Verify form feed character in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before\fafter';
      let e: Error = new Error('FF', msg);
      expect(e.toString()).assertEqual('FF: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8700
     * @tc.name testErrorToString087
     * @tc.desc Verify vertical tab character in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before\vafter';
      let e: Error = new Error('VT', msg);
      expect(e.toString()).assertEqual('VT: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8800
     * @tc.name testErrorToString088
     * @tc.desc Verify carriage return character in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before\rafter';
      let e: Error = new Error('CR', msg);
      expect(e.toString()).assertEqual('CR: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8900
     * @tc.name testErrorToString089
     * @tc.desc Verify null character in message for toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'null\0char';
      let e: Error = new Error('Nul', msg);
      expect(e.toString()).assertEqual('Nul: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9000
     * @tc.name testErrorToString090
     * @tc.desc Verify hex string name with emoji message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = '0xDEAD';
      let msg: string = 'error😀occurred';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9100
     * @tc.name testErrorToString091
     * @tc.desc Verify unicode name with binary format message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'Err中文';
      let msg: string = '0b10100101';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9200
     * @tc.name testErrorToString092
     * @tc.desc Verify emoji name with XSS payload message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'Error🔥';
      let msg: string = '<img src=x onerror=alert(1)>';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9300
     * @tc.name testErrorToString093
     * @tc.desc Verify null char in name with JSON object message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'Err\0Name';
      let msg: string = '{"code":500,"ok":false}';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9400
     * @tc.name testErrorToString094
     * @tc.desc Verify long name with RTL Arabic message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'E'.repeat(200);
      let msg: string = 'رسالة خطأ';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });
  });
}
