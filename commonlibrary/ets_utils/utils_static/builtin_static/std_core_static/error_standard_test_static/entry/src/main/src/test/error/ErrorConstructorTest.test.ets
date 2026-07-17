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

class ErrorConstructorCausePayload {
  code: int = 1001;
  detail: string = 'payload-cause';
}

export default function ErrorConstructorTest(): void {
  describe('ErrorConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0010
     * @tc.name testErrorConstructor001
     * @tc.desc Verify Error(0) stores code with default name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0);
      expect(err.code).assertEqual(0);
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
      expect(err.message.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0020
     * @tc.name testErrorConstructor002
     * @tc.desc Verify Error(1) stores minimum positive code and no cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1);
      expect(err.code).assertEqual(1);
      expect(err.name).assertEqual("Error");
      expect(err.cause).assertUndefined();
      expect(err.message).assertEqual("");
      expect(err.message.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0030
     * @tc.name testErrorConstructor003
     * @tc.desc Verify Error(1001) stores business code with default message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1001);
      expect(err.code).assertEqual(1001);
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
      expect(err.code - 1000).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0040
     * @tc.name testErrorConstructor004
     * @tc.desc Verify Error(1000000) stores large code with no cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1000000);
      expect(err.code).assertEqual(1000000);
      expect(err.name).assertEqual("Error");
      expect(err.cause).assertUndefined();
      expect(err.message).assertEqual("");
      expect(err.code + 1).assertEqual(1000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0050
     * @tc.name testErrorConstructor005
     * @tc.desc Verify Error(MAX_INT) stores code with empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(2147483647);
      expect(err.code).assertEqual(2147483647);
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
      expect(err.name.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0060
     * @tc.name testErrorConstructor006
     * @tc.desc Verify Error(-2147483648) stores code and default name Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(-2147483648);
      expect(err.code).assertEqual(-2147483648);
      expect(err.name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0070
     * @tc.name testErrorConstructor007
     * @tc.desc Verify Error(255) stores byte-like code and no cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(255);
      expect(err.code).assertEqual(255);
      expect(err.name).assertEqual("Error");
      expect(err.cause).assertUndefined();
      expect(err.message).assertEqual("");
      expect(err.code - 55).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0080
     * @tc.name testErrorConstructor008
     * @tc.desc Verify Error(10) stores decimal static code with empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(10);
      expect(err.code).assertEqual(10);
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
      expect(err.code + 5).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0090
     * @tc.name testErrorConstructor009
     * @tc.desc Verify Error(1024) stores power-of-two code and no cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1024);
      expect(err.code).assertEqual(1024);
      expect(err.name).assertEqual("Error");
      expect(err.cause).assertUndefined();
      expect(err.message).assertEqual("");
      expect(err.name.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0100
     * @tc.name testErrorConstructor010
     * @tc.desc Verify Error(42, "error msg") stores code and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(42, "error msg");
      expect(err.code).assertEqual(42);
      expect(err.message).assertEqual("error msg");
      expect(err.name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0110
     * @tc.name testErrorConstructor011
     * @tc.desc Verify Error(1001, "") stores code and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1001, "");
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0120
     * @tc.name testErrorConstructor012
     * @tc.desc Verify Error(0, "zero") stores code and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0, "zero");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("zero");
      expect(err.name.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0130
     * @tc.name testErrorConstructor013
     * @tc.desc Verify Error with cause stores cause reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root");
      let err: Error = new Error(1001, "msg", { cause: cause });
      expect(err.cause).assertEqual(cause);
      expect(err.code).assertEqual(1001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0140
     * @tc.name testErrorConstructor014
     * @tc.desc Verify Error empty name and zero code initializes empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("", 0);
      expect(e.name).assertEqual("");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
      expect(e.cause).assertUndefined();
      expect(e.name.length + e.message.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0150
     * @tc.name testErrorConstructor015
     * @tc.desc Verify Error whitespace name and zero code preserves name exactly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("   ", 0);
      expect(e.name).assertEqual("   ");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0160
     * @tc.name testErrorConstructor016
     * @tc.desc Verify Error symbol name and zero code initializes default message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("@#$%", 0);
      expect(e.name).assertEqual("@#$%");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
      expect(e.cause).assertUndefined();
      expect(e.name.indexOf("#")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0170
     * @tc.name testErrorConstructor017
     * @tc.desc Verify Error("名称",0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("名称", 0);
      expect(e.name).assertEqual("名称");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0180
     * @tc.name testErrorConstructor018
     * @tc.desc Verify Error(100-char name,0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "A234567890".repeat(10);
      let e: Error = new Error(n, 0);
      expect(e.name.length).assertEqual(100);
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0190
     * @tc.name testErrorConstructor019
     * @tc.desc Verify Error one-character name and zero code initializes empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("X", 0);
      expect(e.name).assertEqual("X");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(1);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0200
     * @tc.name testErrorConstructor020
     * @tc.desc Verify Error numeric-looking name and zero code is not parsed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("123", 0);
      expect(e.name).assertEqual("123");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(3);
      expect(e.name.indexOf("2")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0210
     * @tc.name testErrorConstructor021
     * @tc.desc Verify Error normal name and zero code initializes no cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyError", 0);
      expect(e.name).assertEqual("MyError");
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0220
     * @tc.name testErrorConstructor022
     * @tc.desc Verify Error empty name and negative code initializes empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("", -1);
      expect(e.name).assertEqual("");
      expect(e.code).assertEqual(-1);
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0230
     * @tc.name testErrorConstructor023
     * @tc.desc Verify Error symbol name and negative code preserves both fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("@#$", -1);
      expect(e.name).assertEqual("@#$");
      expect(e.code).assertEqual(-1);
      expect(e.message).assertEqual("");
      expect(e.name.indexOf("$")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0240
     * @tc.name testErrorConstructor024
     * @tc.desc Verify Error("名称",-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("名称", -1);
      expect(e.name).assertEqual("名称");
      expect(e.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0250
     * @tc.name testErrorConstructor025
     * @tc.desc Verify Error normal name and negative code initializes no cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyError", -1);
      expect(e.name).assertEqual("MyError");
      expect(e.code).assertEqual(-1);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0260
     * @tc.name testErrorConstructor026
     * @tc.desc Verify Error empty name and business code initializes empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("", 1001);
      expect(e.name).assertEqual("");
      expect(e.code).assertEqual(1001);
      expect(e.message).assertEqual("");
      expect(e.code - 1000).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0270
     * @tc.name testErrorConstructor027
     * @tc.desc Verify Error symbol name and business code preserves both fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("@#$", 1001);
      expect(e.name).assertEqual("@#$");
      expect(e.code).assertEqual(1001);
      expect(e.message).assertEqual("");
      expect(e.name.length).assertEqual(3);
      expect(e.code - 1000).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0280
     * @tc.name testErrorConstructor028
     * @tc.desc Verify Error("名称",1001)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("名称", 1001);
      expect(e.name).assertEqual("名称");
      expect(e.code).assertEqual(1001);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0290
     * @tc.name testErrorConstructor029
     * @tc.desc Verify Error(100-char name,1001)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "A234567890".repeat(10);
      let e: Error = new Error(n, 1001);
      expect(e.name.length).assertEqual(100);
      expect(e.code).assertEqual(1001);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0300
     * @tc.name testErrorConstructor030
     * @tc.desc Verify Error one-character name and business code initializes empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("X", 1001);
      expect(e.name).assertEqual("X");
      expect(e.code).assertEqual(1001);
      expect(e.message).assertEqual("");
      expect(e.cause).assertUndefined();
      expect(e.name.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0310
     * @tc.name testErrorConstructor031
     * @tc.desc Verify Error numeric-looking name and business code is not parsed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("123", 1001);
      expect(e.name).assertEqual("123");
      expect(e.code).assertEqual(1001);
      expect(e.message).assertEqual("");
      expect(e.cause).assertUndefined();
      expect(e.name.indexOf("3")).assertEqual(2);
      expect(e.code + e.message.length).assertEqual(1001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0320
     * @tc.name testErrorConstructor032
     * @tc.desc Verify Error normal name and business code initializes no cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyError", 1001);
      expect(e.name).assertEqual("MyError");
      expect(e.code).assertEqual(1001);
      expect(e.cause).assertUndefined();
      expect(e.message).assertEqual("");
      expect(e.code - 1).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0330
     * @tc.name testErrorConstructor033
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(empty name, message) stores empty name message and code
     */
    it('testErrorConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("", "msg");
      expect(e.name).assertEqual("");
      expect(e.message).assertEqual("msg");
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0340
     * @tc.name testErrorConstructor034
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(special name, message) stores special name and message
     */
    it('testErrorConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("@#$", "err");
      expect(e.name).assertEqual("@#$");
      expect(e.message).assertEqual("err");
      expect(e.code).assertEqual(0);
      expect(e.name.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0350
     * @tc.name testErrorConstructor035
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(unicode name, unicode message) preserves both fields
     */
    it('testErrorConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("名称", "消息");
      expect(e.name).assertEqual("名称");
      expect(e.message).assertEqual("消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0360
     * @tc.name testErrorConstructor036
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(long name, message) preserves long name message and code
     */
    it('testErrorConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "N".repeat(100);
      let e: Error = new Error(n, ".");
      expect(e.name.length).assertEqual(100);
      expect(e.message).assertEqual(".");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0370
     * @tc.name testErrorConstructor037
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, empty message) stores name and empty message
     */
    it('testErrorConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyName", "");
      expect(e.name).assertEqual("MyName");
      expect(e.message).assertEqual("");
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
      expect(e.message.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0380
     * @tc.name testErrorConstructor038
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, numeric string message) does not parse message
     */
    it('testErrorConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Err", "42");
      expect(e.name).assertEqual("Err");
      expect(e.message).assertEqual("42");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0390
     * @tc.name testErrorConstructor039
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, whitespace message) preserves length and code
     */
    it('testErrorConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "   ");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("   ");
      expect(e.message.length).assertEqual(3);
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0400
     * @tc.name testErrorConstructor040
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, newline message) preserves line break length
     */
    it('testErrorConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("NL", "a\nb");
      expect(e.name).assertEqual("NL");
      expect(e.message).assertEqual("a\nb");
      expect(e.message.length).assertEqual(3);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0410
     * @tc.name testErrorConstructor041
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, tab message) preserves tab message
     */
    it('testErrorConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Tab", "\t");
      expect(e.name).assertEqual("Tab");
      expect(e.message).assertEqual("\t");
      expect(e.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0420
     * @tc.name testErrorConstructor042
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc Verify new Error(name, message, options) preserves Error cause
     */
    it('testErrorConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error("root");
      let e: Error = new Error("App", "err", { cause: c });
      expect(e.name).assertEqual("App");
      expect(e.message).assertEqual("err");
      expect((e.cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0430
     * @tc.name testErrorConstructor043
     * @tc.desc Verify new Error(1001, 'msg') dispatches to overload 1: name=Error, code=1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1001, "msg");
      expect(err.name).assertEqual("Error");
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0440
     * @tc.name testErrorConstructor044
     * @tc.desc Verify new Error('msg') dispatches to overload 2: name=Error, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("msg");
      expect(err.name).assertEqual("Error");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0450
     * @tc.name testErrorConstructor045
     * @tc.desc Verify new Error() dispatches to overload 2: name=Error, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.name).assertEqual("Error");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0460
     * @tc.name testErrorConstructor046
     * @tc.desc Verify new Error('Custom', 1001, 'msg') dispatches to overload 3: name=Custom, code=1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("Custom", 1001, "msg");
      expect(err.name).assertEqual("Custom");
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0470
     * @tc.name testErrorConstructor047
     * @tc.desc Verify new Error('Custom', 'msg') dispatches to overload 4: name=Custom, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("Custom", "msg");
      expect(err.name).assertEqual("Custom");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0480
     * @tc.name testErrorConstructor048
     * @tc.desc Verify new Error('Custom', 0) dispatches to overload 3: name=Custom, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("Custom", 0);
      expect(err.name).assertEqual("Custom");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0490
     * @tc.name testErrorConstructor049
     * @tc.desc Verify new Error('', 0) creates name empty, code 0, message empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("", 0);
      expect(err.name).assertEqual("");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
      expect(err.name.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0500
     * @tc.name testErrorConstructor050
     * @tc.desc Verify new Error('Name', 100) sets name and code correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("CustomName", 500);
      expect(err.name).assertEqual("CustomName");
      expect(err.code).assertEqual(500);
      expect(err.message).assertEqual("");
      expect(err.code - 400).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0510
     * @tc.name testErrorConstructor051
     * @tc.desc Verify new Error('Name', -1) stores negative code with name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("NegErr", -1);
      expect(err.name).assertEqual("NegErr");
      expect(err.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0520
     * @tc.name testErrorConstructor052
     * @tc.desc Verify new Error('N', 300, 'msg', {cause: c}) sets all four fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error(999, "cause");
      let err: Error = new Error("FullErr", 300, "msg", { cause: cause });
      expect(err.name).assertEqual("FullErr");
      expect(err.code).assertEqual(300);
      expect(err.message).assertEqual("msg");
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0530
     * @tc.name testErrorConstructor053
     * @tc.desc Verify new Error('X', undefined, {cause: c}) sets name and cause, code defaults 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("nested");
      let err: Error = new Error("X", undefined, { cause: cause });
      expect(err.name).assertEqual("X");
      expect(err.cause).assertEqual(cause);
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0540
     * @tc.name testErrorConstructor054
     * @tc.desc Verify no-arg constructor creates Error with name=Error, code=0, message=empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      expect(err.name).assertEqual("Error");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0550
     * @tc.name testErrorConstructor055
     * @tc.desc Verify new Error(email string) sets message and defaults code=0, name=Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("test@example.com");
      expect(err.message).assertEqual("test@example.com");
      expect(err.code).assertEqual(0);
      expect(err.name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0560
     * @tc.name testErrorConstructor056
     * @tc.desc Verify new Error(URL string, {cause: c}) sets message and cause, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root");
      let err: Error = new Error("https://example.com/errors/constructor", { cause: cause });
      expect(err.message).assertEqual("https://example.com/errors/constructor");
      expect(err.cause).assertEqual(cause);
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0570
     * @tc.name testErrorConstructor057
     * @tc.desc Verify new Error(zero-width string, {}) sets message only, cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("\u200B", {});
      expect(err.message).assertEqual("\u200B");
      expect(err.cause).assertUndefined();
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0580
     * @tc.name testErrorConstructor058
     * @tc.desc Verify new Error(400, date string, {cause: c}) dispatches to overload with code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("cause");
      let err: Error = new Error(400, "2026-02-30", { cause: cause });
      expect(err.code).assertEqual(400);
      expect(err.message).assertEqual("2026-02-30");
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0590
     * @tc.name testErrorConstructor059
     * @tc.desc Verify new Error(undefined) sets message=empty, code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(undefined);
      expect(err.message).assertEqual("");
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0600
     * @tc.name testErrorConstructor060
     * @tc.desc Verify new Error(zero-width name, Korean message) stores custom name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("Err\u200BName", "테스트");
      expect(err.name).assertEqual("Err\u200BName");
      expect(err.message).assertEqual("테스트");
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0610
     * @tc.name testErrorConstructor061
     * @tc.desc Verify Error(code,msg,{cause:string})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", { cause: "str_cause" });
      expect(e.code).assertEqual(100);
      expect(e.cause).assertEqual("str_cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0620
     * @tc.name testErrorConstructor062
     * @tc.desc Verify Error(code,msg,{cause:number})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", { cause: 42 });
      expect(e.code).assertEqual(100);
      expect(e.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0630
     * @tc.name testErrorConstructor063
     * @tc.desc Verify Error(code,msg,{cause:boolean})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", { cause: true });
      expect(e.code).assertEqual(100);
      expect(e.cause).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0640
     * @tc.name testErrorConstructor064
     * @tc.desc Verify Error(code,msg,{cause:array})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", { cause: ["a", 1] });
      expect(e.code).assertEqual(100);
      let causeArr: Object[] = e.cause as Object[];
      expect(causeArr[0]).assertEqual("a");
      expect(causeArr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0650
     * @tc.name testErrorConstructor065
     * @tc.desc Verify Error(code,msg,{cause:Error instance})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", { cause: new Error("inner") });
      expect(e.code).assertEqual(100);
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0660
     * @tc.name testErrorConstructor066
     * @tc.desc Verify Error(msg,{cause:string})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: "str_cause" });
      expect(e.cause).assertEqual("str_cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0670
     * @tc.name testErrorConstructor067
     * @tc.desc Verify Error(msg,{cause:number})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: 42 });
      expect(e.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0680
     * @tc.name testErrorConstructor068
     * @tc.desc Verify Error(msg,{cause:boolean})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: true });
      expect(e.cause).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0690
     * @tc.name testErrorConstructor069
     * @tc.desc Verify Error(msg,{cause:array})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: ["a", 1] });
      let causeArr: Object[] = e.cause as Object[];
      expect(causeArr[0]).assertEqual("a");
      expect(causeArr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0700
     * @tc.name testErrorConstructor070
     * @tc.desc Verify Error(msg,{cause:Error instance})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: new Error("inner") });
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0710
     * @tc.name testErrorConstructor071
     * @tc.desc Verify Error(name,code,msg,{cause:string})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Cust", 99, "info", { cause: "str_cause" });
      expect(e.name).assertEqual("Cust");
      expect(e.code).assertEqual(99);
      expect(e.cause).assertEqual("str_cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0720
     * @tc.name testErrorConstructor072
     * @tc.desc Verify Error(name,code,msg,{cause:number})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Cust", 99, "info", { cause: 42 });
      expect(e.name).assertEqual("Cust");
      expect(e.code).assertEqual(99);
      expect(e.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0730
     * @tc.name testErrorConstructor073
     * @tc.desc Verify Error(name,code,msg,{cause:boolean})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Cust", 99, "info", { cause: true });
      expect(e.name).assertEqual("Cust");
      expect(e.code).assertEqual(99);
      expect(e.cause).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0740
     * @tc.name testErrorConstructor074
     * @tc.desc Verify Error(name,code,msg,{cause:array})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Cust", 99, "info", { cause: ["a", 1] });
      expect(e.name).assertEqual("Cust");
      expect(e.code).assertEqual(99);
      let causeArr: Object[] = e.cause as Object[];
      expect(causeArr[0]).assertEqual("a");
      expect(causeArr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0750
     * @tc.name testErrorConstructor075
     * @tc.desc Verify Error(name,code,msg,{cause:Error instance})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Cust", 99, "info", { cause: new Error("inner") });
      expect(e.name).assertEqual("Cust");
      expect(e.code).assertEqual(99);
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0760
     * @tc.name testErrorConstructor076
     * @tc.desc Verify Error(name,msg,{cause:string})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", "info", { cause: "str_cause" });
      expect(e.name).assertEqual("Custom");
      expect(e.message).assertEqual("info");
      expect(e.cause).assertEqual("str_cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0770
     * @tc.name testErrorConstructor077
     * @tc.desc Verify Error(name,msg,{cause:number})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", "info", { cause: 42 });
      expect(e.name).assertEqual("Custom");
      expect(e.message).assertEqual("info");
      expect(e.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0780
     * @tc.name testErrorConstructor078
     * @tc.desc Verify Error(name,msg,{cause:boolean})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", "info", { cause: true });
      expect(e.name).assertEqual("Custom");
      expect(e.message).assertEqual("info");
      expect(e.cause).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0790
     * @tc.name testErrorConstructor079
     * @tc.desc Verify Error(name,msg,{cause:array})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", "info", { cause: ["a", 1] });
      expect(e.name).assertEqual("Custom");
      expect(e.message).assertEqual("info");
      let causeArr: Object[] = e.cause as Object[];
      expect(causeArr[0]).assertEqual("a");
      expect(causeArr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0800
     * @tc.name testErrorConstructor080
     * @tc.desc Verify Error(name,msg,{cause:Error instance})
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", "info", { cause: new Error("inner") });
      expect(e.name).assertEqual("Custom");
      expect(e.message).assertEqual("info");
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0810
     * @tc.name testErrorConstructor081
     * @tc.desc Verify new Error(code, message, empty options) stores code and leaves cause empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, "msg", {});
      expect(e.code).assertEqual(100);
      expect(e.message).assertEqual("msg");
      expect(e.name).assertEqual("Error");
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0820
     * @tc.name testErrorConstructor082
     * @tc.desc Verify new Error(name, message, empty options) stores name and leaves cause empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyName", "msg", {});
      expect(e.name).assertEqual("MyName");
      expect(e.message).assertEqual("msg");
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0830
     * @tc.name testErrorConstructor083
     * @tc.desc Verify UUID single string dispatches to message overload with default fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = '550e8400-e29b-41d4-a716-446655440000';
      let e: Error = new Error(uuid);
      expect(e.message).assertEqual(uuid);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0840
     * @tc.name testErrorConstructor084
     * @tc.desc Verify UUID plus message dispatches to name and message overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';
      let e: Error = new Error(uuid, 'UUID-Error');
      expect(e.name).assertEqual(uuid);
      expect(e.message).assertEqual('UUID-Error');
      expect(e.code).assertEqual(0);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0850
     * @tc.name testErrorConstructor085
     * @tc.desc Verify URL single string initializes message without URL parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://api.example.com/v1/users?id=123&page=1';
      let e: Error = new Error(url);
      expect(e.message).assertEqual(url);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0860
     * @tc.name testErrorConstructor086
     * @tc.desc Verify URL name with message initializes both fields exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let url: string = 'https://example.com/not-found';
      let e: Error = new Error(url, 'resource missing');
      expect(e.name).assertEqual(url);
      expect(e.message).assertEqual('resource missing');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0870
     * @tc.name testErrorConstructor087
     * @tc.desc Verify zero-width string single argument initializes message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroWidth: string = 'id\u200Bhidden';
      let e: Error = new Error(zeroWidth);
      expect(e.message).assertEqual(zeroWidth);
      expect(e.code).assertEqual(0);
      expect(e.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0880
     * @tc.name testErrorConstructor088
     * @tc.desc Verify Japanese string first argument with message initializes name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let japaneseName: string = 'テスト';
      let e: Error = new Error(japaneseName, 'memory error');
      expect(e.name).assertEqual(japaneseName);
      expect(e.message).assertEqual('memory error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0890
     * @tc.name testErrorConstructor089
     * @tc.desc Verify replacement character string single argument initializes message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacement: string = '\uFFFD\uFFFD';
      let e: Error = new Error(replacement);
      expect(e.message).assertEqual(replacement);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0900
     * @tc.name testErrorConstructor090
     * @tc.desc Verify Arabic string first argument initializes name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arabicName: string = 'الاختبار';
      let e: Error = new Error(arabicName, 'localized error');
      expect(e.name).assertEqual(arabicName);
      expect(e.message).assertEqual('localized error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0910
     * @tc.name testErrorConstructor091
     * @tc.desc Verify numeric string as Error message is stored as string not number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numStr: string = '12345678901234567890';
      let e: Error = new Error(numStr);
      expect(e.message).assertEqual(numStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0920
     * @tc.name testErrorConstructor092
     * @tc.desc Verify numeric string as Error name is stored as string not number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numName: string = '404';
      let e: Error = new Error(numName, 'not found');
      expect(e.name).assertEqual(numName);
      expect(e.message).assertEqual('not found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0930
     * @tc.name testErrorConstructor093
     * @tc.desc Verify new Error(code, undefined) keeps code and defaults message to empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(100, undefined);
      expect(e.code).assertEqual(100);
      expect(e.message).assertEqual('');
      expect(e.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0940
     * @tc.name testErrorConstructor094
     * @tc.desc Verify new Error(name, code, undefined) keeps name and code with empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", 200, undefined);
      expect(e.name).assertEqual("Custom");
      expect(e.code).assertEqual(200);
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0950
     * @tc.name testErrorConstructor095
     * @tc.desc Verify Error constructor preserves 65535 character message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'm'.repeat(65535);
      let e: Error = new Error(message);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
      expect(e.message.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0960
     * @tc.name testErrorConstructor096
     * @tc.desc Verify Error constructor accepts undefined message with explicit cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: TypeError = new TypeError('omitted-message-cause');
      let e: Error = new Error(undefined, { cause: cause });
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual('');
      expect((e.cause as TypeError).message).assertEqual('omitted-message-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0970
     * @tc.name testErrorConstructor097
     * @tc.desc Verify Error constructor stores custom payload object as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorConstructorCausePayload = new ErrorConstructorCausePayload();
      let e: Error = new Error('payload-error', { cause: payload });
      let cause: ErrorConstructorCausePayload = e.cause as ErrorConstructorCausePayload;
      expect(e.message).assertEqual('payload-error');
      expect(cause.code).assertEqual(1001);
      expect(cause.detail).assertEqual('payload-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0980
     * @tc.name testErrorConstructor098
     * @tc.desc Verify Error constructor with undefined cause option leaves cause unset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let options: ErrorOptions = { cause: undefined };
      let e: Error = new Error('undefined-cause-options', options);
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('undefined-cause-options');
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_0990
     * @tc.name testErrorConstructor099
     * @tc.desc Verify separate Error constructor results keep independent mutable fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('first');
      let second: Error = new Error('second');
      first.name = 'FirstOnly';
      first.code = 77;
      first.message = 'changed-first';
      first.cause = new Error('first-cause');
      expect(second.name).assertEqual('Error');
      expect(second.code).assertEqual(0);
      expect(second.message).assertEqual('second');
      expect(second.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1000
     * @tc.name testErrorConstructor100
     * @tc.desc Verify Error constructor stores cause payload by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorConstructorCausePayload = new ErrorConstructorCausePayload();
      let e: Error = new Error('payload-reference', { cause: payload });
      payload.detail = 'payload-updated';
      let cause: ErrorConstructorCausePayload = e.cause as ErrorConstructorCausePayload;
      expect(cause).assertEqual(payload);
      expect(cause.code).assertEqual(1001);
      expect(cause.detail).assertEqual('payload-updated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1010
     * @tc.name testErrorConstructor101
     * @tc.desc Verify Error constructor preserves escaped newline and tab message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'line\nbreak\tmessage';
      let e: Error = new Error(message);
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual(message);
      expect(e.message.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1020
     * @tc.name testErrorConstructor102
     * @tc.desc Verify Error constructor preserves nested cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root-cause');
      let middle: Error = new Error('middle-cause', { cause: root });
      let top: Error = new Error('top-cause', { cause: middle });
      let resolvedMiddle: Error = top.cause as Error;
      let resolvedRoot: Error = resolvedMiddle.cause as Error;
      expect(top.message).assertEqual('top-cause');
      expect(resolvedMiddle.message).assertEqual('middle-cause');
      expect(resolvedRoot.message).assertEqual('root-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1030
     * @tc.name testErrorConstructor103
     * @tc.desc Verify Error constructor preserves template literal message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: int = 404;
      let message: string = `constructor-${code}`;
      let e: Error = new Error(message);
      expect(e.message).assertEqual('constructor-404');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1040
     * @tc.name testErrorConstructor104
     * @tc.desc Verify Error constructor preserves JSON-like message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '{"code":500,"message":"failed"}';
      let e: Error = new Error(message);
      expect(e.message).assertEqual(message);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1050
     * @tc.name testErrorConstructor105
     * @tc.desc Verify Error constructor preserves leading and trailing spaces in message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '  padded message  ';
      let e: Error = new Error(message);
      expect(e.message).assertEqual(message);
      expect(e.message.length).assertEqual(18);
      expect(e.name).assertEqual('Error');
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1060
     * @tc.name testErrorConstructor106
     * @tc.desc Verify Error constructor preserves CRLF message boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'line1\r\nline2';
      let e: Error = new Error(message);
      expect(e.message).assertEqual(message);
      expect(e.message.length).assertEqual(12);
      expect(e.name).assertEqual('Error');
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1070
     * @tc.name testErrorConstructor107
     * @tc.desc Verify Error constructor preserves surrogate pair message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\uD83D\uDE80';
      let e: Error = new Error(message);
      expect(e.message).assertEqual(message);
      expect(e.message.length).assertEqual(2);
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1080
     * @tc.name testErrorConstructor108
     * @tc.desc Verify Error constructor preserves RTL marker message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\u202Eabc';
      let e: Error = new Error(message);
      expect(e.message).assertEqual(message);
      expect(e.message.length).assertEqual(4);
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1090
     * @tc.name testErrorConstructor109
     * @tc.desc Verify Error constructor stores hex literal code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0x7F, 'hex-code-message');
      expect(e.code).assertEqual(127);
      expect(e.message).assertEqual('hex-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1100
     * @tc.name testErrorConstructor110
     * @tc.desc Verify Error constructor stores binary literal code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0b1111, 'binary-code-message');
      expect(e.code).assertEqual(15);
      expect(e.message).assertEqual('binary-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1110
     * @tc.name testErrorConstructor111
     * @tc.desc Verify Error constructor stores octal literal code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0o77, 'octal-code-message');
      expect(e.code).assertEqual(63);
      expect(e.message).assertEqual('octal-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1120
     * @tc.name testErrorConstructor112
     * @tc.desc Verify Error constructor stores expression code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error((1 << 8) + 1, 'expression-code-message');
      expect(e.code).assertEqual(257);
      expect(e.message).assertEqual('expression-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1130
     * @tc.name testErrorConstructor113
     * @tc.desc Verify Error constructor stores negative code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-404, 'negative-code-message');
      expect(e.code).assertEqual(-404);
      expect(e.message).assertEqual('negative-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1140
     * @tc.name testErrorConstructor114
     * @tc.desc Verify Error constructor stores near max int code with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483646, 'near-max-code-message');
      expect(e.code).assertEqual(2147483646);
      expect(e.message).assertEqual('near-max-code-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1150
     * @tc.name testErrorConstructor115
     * @tc.desc Verify Error constructor stores custom name with hex code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('HexName', 0x2A, 'hex-name-message');
      expect(e.name).assertEqual('HexName');
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual('hex-name-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1160
     * @tc.name testErrorConstructor116
     * @tc.desc Verify Error constructor stores computed name message and cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('computed-cause');
      let e: Error = new Error('Name' + 7, 'Msg' + 8, { cause: cause });
      expect(e.name).assertEqual('Name7');
      expect(e.message).assertEqual('Msg8');
      expect(e.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1170
     * @tc.name testErrorConstructor117
     * @tc.desc Verify Error constructor preserves Map cause reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause: Map<string, Error> = new Map<string, Error>();
      mapCause.set('inner', new Error('map-inner'));
      let e: Error = new Error('map-cause', { cause: mapCause });
      let resolved: Map<string, Error> = e.cause as Map<string, Error>;
      expect(resolved).assertEqual(mapCause);
      expect(resolved.get('inner')?.message).assertEqual('map-inner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1180
     * @tc.name testErrorConstructor118
     * @tc.desc Verify Error constructor preserves Set cause reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let element: Error = new Error('set-inner');
      let setCause: Set<Error> = new Set<Error>();
      setCause.add(element);
      let e: Error = new Error('set-cause', { cause: setCause });
      let resolved: Set<Error> = e.cause as Set<Error>;
      expect(resolved).assertEqual(setCause);
      expect(resolved.has(element)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1190
     * @tc.name testErrorConstructor119
     * @tc.desc Verify Error constructor preserves Date cause reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateCause: Date = new Date(0);
      let e: Error = new Error('date-cause', { cause: dateCause });
      let resolved: Date = e.cause as Date;
      expect(resolved).assertEqual(dateCause);
      expect(resolved.getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1200
     * @tc.name testErrorConstructor120
     * @tc.desc Verify Error constructor preserves Error array cause identities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('first-array-cause');
      let second: Error = new Error('second-array-cause');
      let causes: Error[] = [first, second];
      let e: Error = new Error('array-cause', { cause: causes });
      let resolved: Error[] = e.cause as Error[];
      expect(resolved[0]).assertEqual(first);
      expect(resolved[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1210
     * @tc.name testErrorConstructor121
     * @tc.desc Verify Error constructor snapshots reused options cause reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstCause: Error = new Error('first-options-cause');
      let secondCause: Error = new Error('second-options-cause');
      let options: ErrorOptions = { cause: firstCause };
      let first: Error = new Error('first-options', options);
      options.cause = secondCause;
      let second: Error = new Error('second-options', options);
      expect(first.cause).assertEqual(firstCause);
      expect(second.cause).assertEqual(secondCause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1220
     * @tc.name testErrorConstructor122
     * @tc.desc Verify Error constructor message is stable after source variable reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = 'source-message';
      let e: Error = new Error(source);
      source = 'changed-message';
      expect(e.message).assertEqual('source-message');
      expect(source).assertEqual('changed-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1230
     * @tc.name testErrorConstructor123
     * @tc.desc Verify Error constructor preserves false boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('false-cause', { cause: false });
      expect(e.message).assertEqual('false-cause');
      expect(e.cause).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1240
     * @tc.name testErrorConstructor124
     * @tc.desc Verify Error constructor preserves negative numeric cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('negative-cause', { cause: -1 });
      expect(e.message).assertEqual('negative-cause');
      expect(e.cause).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1250
     * @tc.name testErrorConstructor125
     * @tc.desc Verify Error constructor preserves Number.MAX_VALUE cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('max-value-cause', { cause: Number.MAX_VALUE });
      expect(e.message).assertEqual('max-value-cause');
      expect(e.cause).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1260
     * @tc.name testErrorConstructor126
     * @tc.desc Verify thrown constructed Error preserves cause after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('throw-constructor-cause');
      try {
        throw new Error('throw-constructor', { cause: cause });
      } catch (e) {
        expect((e as Error).message).assertEqual('throw-constructor');
        expect((e as Error).cause).assertEqual(cause);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1270
     * @tc.name testErrorConstructor127
     * @tc.desc Verify constructed Error fields remain stable across repeated reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('StableName', 321, 'stable-message');
      let summary: string = '';
      for (let i: int = 0; i < 20; i++) {
        summary = e.name + ':' + e.code + ':' + e.message;
      }
      expect(summary).assertEqual('StableName:321:stable-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1280
     * @tc.name testErrorConstructor128
     * @tc.desc Verify Error constructor stores empty message with explicit cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('empty-message-cause');
      let e: Error = new Error(0, '', { cause: cause });
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual('');
      expect(e.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1290
     * @tc.name testErrorConstructor129
     * @tc.desc Verify Error constructor with undefined cause option leaves custom name intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let options: ErrorOptions = { cause: undefined };
      let e: Error = new Error('NoCauseName', 'no-cause-message', options);
      expect(e.name).assertEqual('NoCauseName');
      expect(e.message).assertEqual('no-cause-message');
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1300
     * @tc.name testErrorConstructor130
     * @tc.desc Verify Error constructor stores hex max int code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0x7FFFFFFF, 'hex-max-int-code');
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1310
     * @tc.name testErrorConstructor131
     * @tc.desc Verify Error constructor stores ordinary hex code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0x1234, 'hex-code');
      expect(e.code).assertEqual(4660);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1320
     * @tc.name testErrorConstructor132
     * @tc.desc Verify Error constructor stores ordinary octal code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0o123, 'octal-code');
      expect(e.code).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1330
     * @tc.name testErrorConstructor133
     * @tc.desc Verify Error constructor stores ordinary binary code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0b1010, 'binary-code');
      expect(e.code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1340
     * @tc.name testErrorConstructor134
     * @tc.desc Verify Error constructor stores near min int code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-2147483647, 'near-min-int-code');
      expect(e.code).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1350
     * @tc.name testErrorConstructor135
     * @tc.desc Verify Error constructor stores min int code with custom name overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('MinIntName', -2147483648, 'min-int-name-code');
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1360
     * @tc.name testErrorConstructor136
     * @tc.desc Verify Error constructor throws ClassCastError for null cause option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let e: Error = new Error('constructor-null-cause', { cause: null as Object });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_CONSTRUCTOR_1370
     * @tc.name testErrorConstructor137
     * @tc.desc Verify Error constructor throws ClassCastError for Date value as name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorConstructor137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateName: Date = new Date(0);
      try {
        let e: Error = new Error(dateName as Object as string, 'date-name-message');
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}
