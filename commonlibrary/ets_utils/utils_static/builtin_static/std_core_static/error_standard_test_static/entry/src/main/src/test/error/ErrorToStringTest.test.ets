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
} from '../../../../hypium/index';
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
     * @tc.desc Verify toString returns Error prefix with email message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("test@example.com");
      expect(err.toString()).assertEqual("Error: test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_0300
     * @tc.name testErrorToString003
     * @tc.desc Verify toString reflects zero-width custom name with invalid date message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.name = "Custom\u200BError";
      err.message = "2026-13-01";
      expect(err.toString()).assertEqual("Custom\u200BError: 2026-13-01");
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
      err.message = "\u200B";
      expect(err.toString()).assertEqual("\u200B");
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
      err.name = "https://example.com/error";
      err.message = "";
      expect(err.toString()).assertEqual("https://example.com/error");
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
      err.name = "Err\uFFFEName";
      err.message = "테스트";
      expect(err.toString()).assertEqual("Err\uFFFEName: 테스트");
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
      err.name = "テスト";
      err.message = "테스트";
      expect(err.toString()).assertEqual("テスト: 테스트");
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
      err.message = "https://example.com/errors/E-010?type=static";
      expect(err.toString()).assertEqual("E: https://example.com/errors/E-010?type=static");
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
      err.message = "<script>alert(1)</script>";
      expect(err.toString()).assertEqual("Error: <script>alert(1)</script>");
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
     * @tc.desc Verify name with colon and CRLF message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "Err:Name";
      e.message = "line1\r\nline2";
      expect(e.toString()).assertEqual("Err:Name: line1\r\nline2");
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
      expect(e.toString()).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2500
     * @tc.name testErrorToString025
     * @tc.desc Verify UUID name participates only as the toString name segment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = '550e8400-e29b-41d4-a716-446655440000';
      let e: Error = new Error(uuid, 'op failed');
      e.code = 404;
      e.cause = 'ignored-cause';
      expect(e.toString()).assertEqual(uuid + ': op failed');
      e.message = '';
      expect(e.toString()).assertEqual(uuid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2600
     * @tc.name testErrorToString026
     * @tc.desc Verify UUID message remains the message segment after name mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';
      let e: Error = new Error('UUID-Error', uuid);
      expect(e.toString()).assertEqual('UUID-Error: ' + uuid);
      e.name = '';
      expect(e.toString()).assertEqual(uuid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2700
     * @tc.name testErrorToString027
     * @tc.desc Verify URL name is not parsed and is emitted before colon
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://api.example.com/v1/users';
      let e: Error = new Error(url, 'timeout');
      expect(e.toString()).assertEqual(url + ': timeout');
      e.stack = 'stack should not affect toString';
      expect(e.toString()).assertEqual(url + ': timeout');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2800
     * @tc.name testErrorToString028
     * @tc.desc Verify URL message is not parsed and empty name removes colon
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://example.com/not-found';
      let e: Error = new Error('HttpError', url);
      expect(e.toString()).assertEqual('HttpError: ' + url);
      e.name = '';
      expect(e.toString()).assertEqual(url);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_2900
     * @tc.name testErrorToString029
     * @tc.desc Verify zero-width name stays textual and code does not replace it
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hiddenName: string = 'Err\u200BName';
      let e: Error = new Error(hiddenName, 'memory fault');
      e.code = 0xDEAD;
      expect(e.toString()).assertEqual(hiddenName + ': memory fault');
      e.message = '';
      expect(e.toString()).assertEqual(hiddenName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3000
     * @tc.name testErrorToString030
     * @tc.desc Verify replacement character message remains textual after numeric code update
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacementMsg: string = '\uFFFD\uFFFD';
      let e: Error = new Error('ReplaceErr', replacementMsg);
      expect(e.toString()).assertEqual('ReplaceErr: ' + replacementMsg);
      e.code = 0xA1;
      expect(e.toString()).assertEqual('ReplaceErr: ' + replacementMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3100
     * @tc.name testErrorToString031
     * @tc.desc Verify Arabic string name is emitted before toString output
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arabicName: string = 'الاختبار';
      let e: Error = new Error(arabicName, 'localized error');
      expect(e.toString()).assertEqual(arabicName + ': localized error');
      e.message = '';
      expect(e.toString()).assertEqual(arabicName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_3200
     * @tc.name testErrorToString032
     * @tc.desc Verify replacement character message is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacementMsg: string = '\uFFFD\uFFFD';
      let e: Error = new Error('ReplaceErr', replacementMsg);
      expect(e.toString()).assertEqual('ReplaceErr: ' + replacementMsg);
      e.name = 'Err\u200BName';
      expect(e.toString()).assertEqual('Err\u200BName: ' + replacementMsg);
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
     * @tc.desc Verify email message keeps full text and empty name removes prefix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'test@example.com';
      let e: Error = new Error('Email', msg);
      expect(e.toString()).assertEqual('Email: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.cause = new Error('email-cause');
      expect(e.toString()).assertEqual(msg);
      e.code = 41;
      expect(e.toString()).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4200
     * @tc.name testErrorToString042
     * @tc.desc Verify phone message is not converted and code is ignored
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '13800138000';
      let e: Error = new Error('Phone', msg);
      e.code = 138;
      expect(e.toString()).assertEqual('Phone: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4300
     * @tc.name testErrorToString043
     * @tc.desc Verify date message remains text after stack assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '2026-03-05';
      let e: Error = new Error('Date', msg);
      expect(e.toString()).assertEqual('Date: ' + msg);
      e.stack = 'Date stack';
      expect(e.toString()).assertEqual('Date: ' + msg);
      e.name = 'DateText';
      expect(e.toString()).assertEqual('DateText: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4400
     * @tc.name testErrorToString044
     * @tc.desc Verify floating point message remains text after name change
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '123.456';
      let e: Error = new Error('Float', msg);
      expect(e.toString()).assertEqual('Float: ' + msg);
      e.name = 'FloatText';
      expect(e.toString()).assertEqual('FloatText: ' + msg);
      e.code = 44;
      expect(e.toString()).assertEqual('FloatText: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4500
     * @tc.name testErrorToString045
     * @tc.desc Verify scientific notation message is not parsed by toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '1.0e6';
      let e: Error = new Error('Sci', msg);
      expect(e.toString()).assertEqual('Sci: ' + msg);
      e.code = 1000000;
      expect(e.toString()).assertEqual('Sci: ' + msg);
      e.stack = 'scientific-stack';
      expect(e.toString()).assertEqual('Sci: ' + msg);
      e.cause = new Error('scientific-cause');
      expect(e.toString()).assertEqual('Sci: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_4600
     * @tc.name testErrorToString046
     * @tc.desc Verify XSS payload message is emitted without sanitization
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '<script>alert(1)</script>';
      let e: Error = new Error('Xss', msg);
      expect(e.toString()).assertEqual('Xss: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.code = 46;
      expect(e.toString()).assertEqual(msg);
      e.stack = 'xss-stack';
      expect(e.toString()).assertEqual(msg);
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
     * @tc.desc Verify control character message remains stable across repeated toString
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
      let msg: string = 'a鈥媌';
      let e: Error = new Error('ZW', msg);
      expect(e.toString()).assertEqual('ZW: ' + msg);
      e.code = 49;
      expect(e.toString()).assertEqual('ZW: ' + msg);
      e.cause = new Error('zw-cause');
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
      let msg: string = '忙碌猫炉';
      let e: Error = new Error('Enc', msg);
      expect(e.toString()).assertEqual('Enc: ' + msg);
      e.stack = 'encoding-stack';
      expect(e.toString()).assertEqual('Enc: ' + msg);
      e.code = 50;
      expect(e.toString()).assertEqual('Enc: ' + msg);
      e.cause = new Error('encoding-cause');
      expect(e.toString()).assertEqual('Enc: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5100
     * @tc.name testErrorToString051
     * @tc.desc Verify literal unicode escape message is emitted as raw text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '\\u4e2d\\u6587';
      let e: Error = new Error('Uni', msg);
      expect(e.toString()).assertEqual('Uni: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.stack = 'unicode-stack';
      expect(e.toString()).assertEqual(msg);
      e.code = 51;
      expect(e.toString()).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_5200
     * @tc.name testErrorToString052
     * @tc.desc Verify punctuation message remains after cause assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let e: Error = new Error('Punct', msg);
      e.cause = new Error('punct-cause');
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
      let msg: string = 'before锟綿uring\xFFFFafter';
      let e: Error = new Error('BadUni', msg);
      expect(e.toString()).assertEqual('BadUni: ' + msg);
      e.stack = 'bad-unicode-stack';
      expect(e.toString()).assertEqual('BadUni: ' + msg);
      e.cause = new Error('bad-unicode-cause');
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
      let msg: string = 'replacement锟絚har';
      let e: Error = new Error('Repl', msg);
      expect(e.toString()).assertEqual('Repl: ' + msg);
      e.message = msg + '!';
      expect(e.toString()).assertEqual('Repl: ' + msg + '!');
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
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.cause = new Error('surrogate-cause');
      expect(e.toString()).assertEqual(msg);
      e.stack = 'surrogate-empty-name-stack';
      expect(e.toString()).assertEqual(msg);
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
      let msg: string = '鈥斺€?';
      let e: Error = new Error('Dash', msg);
      expect(e.toString()).assertEqual('Dash: ' + msg);
      e.cause = new Error('dash-cause');
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
      let msg: string = '銉嗐偣銉堩厡鞀ろ姼袗袘袙袚袛';
      let e: Error = new Error('Lang', msg);
      expect(e.toString()).assertEqual('Lang: ' + msg);
      e.cause = new Error('lang-cause');
      expect(e.toString()).assertEqual('Lang: ' + msg);
      e.code = 57;
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
     * @tc.desc Verify NaN string message is not treated as numeric NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'NaN';
      let e: Error = new Error('Num', msg);
      expect(e.toString()).assertEqual('Num: ' + msg);
      e.name = 'NumberText';
      expect(e.toString()).assertEqual('NumberText: ' + msg);
      e.code = 59;
      expect(e.toString()).assertEqual('NumberText: ' + msg);
      e.stack = 'nan-stack';
      expect(e.toString()).assertEqual('NumberText: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6000
     * @tc.name testErrorToString060
     * @tc.desc Verify Infinity string message is not treated as numeric Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'Infinity';
      let e: Error = new Error('Num', msg);
      expect(e.toString()).assertEqual('Num: ' + msg);
      e.code = 0;
      expect(e.toString()).assertEqual('Num: ' + msg);
      e.stack = 'infinity-stack';
      expect(e.toString()).assertEqual('Num: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6100
     * @tc.name testErrorToString061
     * @tc.desc Verify ID card format message remains text and code is ignored
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '310101199001011234';
      let e: Error = new Error('Id', msg);
      expect(e.toString()).assertEqual('Id: ' + msg);
      e.code = 310101;
      expect(e.toString()).assertEqual('Id: ' + msg);
      e.stack = 'id-stack';
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
      let msg: string = 'max锟縞har';
      let e: Error = new Error('Umax', msg);
      expect(e.toString()).assertEqual('Umax: ' + msg);
      e.stack = 'umax-stack';
      expect(e.toString()).assertEqual('Umax: ' + msg);
      e.name = 'UmaxText';
      expect(e.toString()).assertEqual('UmaxText: ' + msg);
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
      let msg: string = '馃専test馃榾';
      let e: Error = new Error('Emoji', msg);
      expect(e.toString()).assertEqual('Emoji: ' + msg);
      e.stack = 'emoji-stack';
      expect(e.toString()).assertEqual('Emoji: ' + msg);
      e.code = 63;
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
      let msg: string = '盲?颅';
      let e: Error = new Error('Utf8', msg);
      expect(e.toString()).assertEqual('Utf8: ' + msg);
      e.name = 'Utf8Text';
      expect(e.toString()).assertEqual('Utf8Text: ' + msg);
      e.stack = 'utf8-stack';
      expect(e.toString()).assertEqual('Utf8Text: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6500
     * @tc.name testErrorToString065
     * @tc.desc Verify octal-looking message is not parsed by toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '0123';
      let e: Error = new Error('Oct', msg);
      expect(e.toString()).assertEqual('Oct: ' + msg);
      e.code = 0o123;
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
     * @tc.desc Verify negative zero string message remains textual with empty name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '-0.0';
      let e: Error = new Error('Neg', msg);
      expect(e.toString()).assertEqual('Neg: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_6900
     * @tc.name testErrorToString069
     * @tc.desc Verify JSON object message is not parsed and cause is ignored
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '{"key":"value","num":42}';
      let e: Error = new Error('Json', msg);
      e.cause = 'json-cause';
      expect(e.toString()).assertEqual('Json: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7000
     * @tc.name testErrorToString070
     * @tc.desc Verify JSON array message remains after name update
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '[1,2,3]';
      let e: Error = new Error('Json', msg);
      expect(e.toString()).assertEqual('Json: ' + msg);
      e.name = 'JsonArray';
      expect(e.toString()).assertEqual('JsonArray: ' + msg);
      e.cause = new Error('json-array-cause');
      expect(e.toString()).assertEqual('JsonArray: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_7100
     * @tc.name testErrorToString071
     * @tc.desc Verify nested JSON message keeps full length in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '{"error":{"code":500,"message":"internal"}}';
      let e: Error = new Error('Nest', msg);
      expect(e.toString()).assertEqual('Nest: ' + msg);
      e.cause = new Error('nested-json-cause');
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
      let e: Error = new Error("啶む啶班啶熰た", "");
      expect(e.toString()).assertEqual("啶む啶班啶熰た");
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
      let e: Error = new Error("閿欒", "娑堟伅");
      expect(e.toString()).assertEqual("閿欒: 娑堟伅");
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
      let e: Error = new Error("鞓る", "氅旍嫓歆€");
      expect(e.toString()).assertEqual("鞓る: 氅旍嫓歆€");
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
      let e: Error = new Error("鈿狅笍Error", "test");
      expect(e.toString()).assertEqual("鈿狅笍Error: test");
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
      e.message = "喔傕箟喔竸喔о覆喔∴笢喔脆笖喔炧弗喔侧笖";
      expect(e.toString()).assertEqual("喔傕箟喔竸喔о覆喔∴笢喔脆笖喔炧弗喔侧笖");
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
      let msg: string = '丕禺鬲亘丕乇';
      let e: Error = new Error('Arab', msg);
      expect(e.toString()).assertEqual('Arab: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.code = 79;
      expect(e.toString()).assertEqual(msg);
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
      let msg: string = 'before馃榾after';
      let e: Error = new Error('Emoji', msg);
      expect(e.toString()).assertEqual('Emoji: ' + msg);
      e.name = 'EmojiText';
      expect(e.toString()).assertEqual('EmojiText: ' + msg);
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
      let msg: string = 'call馃摫now';
      let e: Error = new Error('Device', msg);
      expect(e.toString()).assertEqual('Device: ' + msg);
      e.code = 81;
      expect(e.toString()).assertEqual('Device: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
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
      e.stack = 'surrogate-stack';
      expect(e.toString()).assertEqual('Surr: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
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
      let msg: string = 'mojibake 忙碌猫炉';
      let e: Error = new Error('GBK', msg);
      expect(e.toString()).assertEqual('GBK: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8500
     * @tc.name testErrorToString085
     * @tc.desc Verify masked bank card message remains text after name mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '622202********1234';
      let e: Error = new Error('Card', msg);
      expect(e.toString()).assertEqual('Card: ' + msg);
      e.name = 'MaskedCard';
      expect(e.toString()).assertEqual('MaskedCard: ' + msg);
      e.code = 85;
      expect(e.toString()).assertEqual('MaskedCard: ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_8600
     * @tc.name testErrorToString086
     * @tc.desc Verify form feed message remains stable across repeated toString
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
     * @tc.desc Verify vertical tab message is emitted without trimming
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'before\vafter';
      let e: Error = new Error('VT', msg);
      expect(e.toString()).assertEqual('VT: ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.stack = 'binary-name-empty-stack';
      expect(e.toString()).assertEqual(msg);
      e.code = 91;
      expect(e.toString()).assertEqual(msg);
      e.stack = 'vertical-tab-stack';
      expect(e.toString()).assertEqual(msg);
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
      e.cause = new Error('cr-cause');
      expect(e.toString()).assertEqual('CR: ' + msg);
      e.name = 'CRText';
      expect(e.toString()).assertEqual('CRText: ' + msg);
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
      e.name = '';
      expect(e.toString()).assertEqual(msg);
      e.cause = new Error('nul-cause');
      expect(e.toString()).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9000
     * @tc.name testErrorToString090
     * @tc.desc Verify URL name with emoji message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'https://example.com/error';
      let msg: string = 'error馃榾occurred';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
      e.code = 90;
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9100
     * @tc.name testErrorToString091
     * @tc.desc Verify unicode name with Arabic message in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'Err涓枃';
      let msg: string = 'الاختبار';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
      e.name = '';
      expect(e.toString()).assertEqual(msg);
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
      let name: string = 'Error馃敟';
      let msg: string = '<img src=x onerror=alert(1)>';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
      e.stack = 'xss-stack';
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
      e.name = '';
      expect(e.toString()).assertEqual(msg);
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
      let msg: string = '乇爻丕賱丞 禺胤兀';
      let e: Error = new Error(name, msg);
      expect(e.toString()).assertEqual(name + ': ' + msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9500
     * @tc.name testErrorToString095
     * @tc.desc Verify toString preserves whitespace-only message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('SpaceError', '   ');
      expect(e.toString()).assertEqual('SpaceError:    ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9600
     * @tc.name testErrorToString096
     * @tc.desc Verify toString preserves zero-width space in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('Name\u200BHidden', 'visible');
      expect(e.toString()).assertEqual('Name\u200BHidden: visible');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9700
     * @tc.name testErrorToString097
     * @tc.desc Verify toString preserves line separator character
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('LineSep', 'left\u2028right');
      expect(e.toString()).assertEqual('LineSep: left\u2028right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9800
     * @tc.name testErrorToString098
     * @tc.desc Verify toString returns XSS-like name when message is empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = '<script>alert(1)</script>';
      e.message = '';
      expect(e.toString()).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_TO_STRING_9900
     * @tc.name testErrorToString099
     * @tc.desc Verify toString preserves Cyrillic name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorToString099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('АБВГД', 'ошибка');
      expect(e.toString()).assertEqual('АБВГД: ошибка');
    });
  });
}
