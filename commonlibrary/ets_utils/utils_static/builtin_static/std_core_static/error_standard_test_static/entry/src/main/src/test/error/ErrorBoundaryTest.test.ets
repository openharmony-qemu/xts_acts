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
import Utils from '../Util.test';
import { BusinessError } from '@kit.BasicServicesKit';

export default function ErrorBoundaryTest(): void {
  describe('ErrorBoundaryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0010
     * @tc.name testErrorBoundary001
     * @tc.desc Verify Error code from hex literal 0xFF = 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0xFF);
      expect(err.code).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0020
     * @tc.name testErrorBoundary002
     * @tc.desc Verify Error code from binary literal 0b1010 = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0b1010);
      expect(err.code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0030
     * @tc.name testErrorBoundary003
     * @tc.desc Verify Error code from octal literal 0o77 = 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0o77);
      expect(err.code).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0040
     * @tc.name testErrorBoundary004
     * @tc.desc Verify Error code from INT16 maximum boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(32767);
      expect(err.code).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0050
     * @tc.name testErrorBoundary005
     * @tc.desc Verify Error code from large bitwise shift boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1 << 30);
      expect(err.code).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0060
     * @tc.name testErrorBoundary006
     * @tc.desc Verify Error(100, undefined) sets code=100, message=''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(100, undefined);
      expect(err.code).assertEqual(100);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0070
     * @tc.name testErrorBoundary007
     * @tc.desc Verify Error('N', 100, undefined) sets name='N', code=100, message=''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("N", 100, undefined);
      expect(err.name).assertEqual("N");
      expect(err.code).assertEqual(100);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0080
     * @tc.name testErrorBoundary008
     * @tc.desc Verify Error('N', 0) triggers name+code overload setting name='N' code=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("N", 0);
      expect(err.name).assertEqual("N");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0090
     * @tc.name testErrorBoundary009
     * @tc.desc Verify ErrorOptions cause preserves empty string boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("empty cause", { cause: "" });
      expect(err.cause).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0100
     * @tc.name testErrorBoundary010
     * @tc.desc Verify setting cause to self does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ran: boolean = false;
      let c: Error = new Error("self");
      c.cause = c;
      ran = true;
      expect(ran).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0110
     * @tc.name testErrorBoundary011
     * @tc.desc Verify manually setting multiline stack then reading back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.stack = "Error: test\n    at foo (test.ts:10:5)\n    at bar (test.ts:20:3)";
      expect(err.stack).assertEqual("Error: test\n    at foo (test.ts:10:5)\n    at bar (test.ts:20:3)");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0120
     * @tc.name testErrorBoundary012
     * @tc.desc Verify name property returns full ~100 char name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string =
        "A234567890B234567890C234567890D234567890E234567890F234567890G234567890H234567890I234567890J234567890";
      let err: Error = new Error(longName, 0);
      expect(err.name).assertEqual(longName);
      expect(err.name.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0130
     * @tc.name testErrorBoundary013
     * @tc.desc Verify Error with 10000 char name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "A".repeat(10000);
      let err: Error = new Error(longStr, 0);
      expect(err.name.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0140
     * @tc.name testErrorBoundary014
     * @tc.desc Verify Error with 10000 char message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "M".repeat(10000);
      let err: Error = new Error(1, longStr);
      expect(err.message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0150
     * @tc.name testErrorBoundary015
     * @tc.desc Verify Error with long name and message toString works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: string = "N".repeat(5000);
      let m: string = "M".repeat(5000);
      let err: Error = new Error(n, 0, m);
      expect(err.name.length).assertEqual(5000);
      expect(err.message.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0160
     * @tc.name testErrorBoundary016
     * @tc.desc Verify all properties set to extreme values simultaneously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("X".repeat(100), 2147483647, "Y".repeat(100));
      err.cause = "extreme_cause";
      err.stack = "extreme_stack";
      expect(err.name.length).assertEqual(100);
      expect(err.code).assertEqual(2147483647);
      expect(err.message.length).assertEqual(100);
      expect(err.cause).assertEqual("extreme_cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0170
     * @tc.name testErrorBoundary017
     * @tc.desc Verify mutual cause references a.cause=b, b.cause=a does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Error = new Error("A");
      let b: Error = new Error("B");
      a.cause = b;
      b.cause = a;
      expect((a.cause as Error).message).assertEqual("B");
      expect(((a.cause as Error).cause as Error).message).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0180
     * @tc.name testErrorBoundary018
     * @tc.desc Verify stack can be assigned undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.stack = undefined;
      expect(err.stack === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0190
     * @tc.name testErrorBoundary019
     * @tc.desc Verify stack can store long repeated boundary string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      let stackValue: string = "S".repeat(1024);
      err.stack = stackValue;
      expect(err.stack).assertEqual(stackValue);
      expect((err.stack as string).length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0200
     * @tc.name testErrorBoundary020
     * @tc.desc Verify Error with MAX_INT code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(2147483647);
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0210
     * @tc.name testErrorBoundary021
     * @tc.desc Verify Error with MIN_INT code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(-2147483648);
      expect(err.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0220
     * @tc.name testErrorBoundary022
     * @tc.desc Verify Error(name, 0) triggers correct overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("MyName", 0);
      expect(err.name).assertEqual("MyName");
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0230
     * @tc.name testErrorBoundary023
     * @tc.desc Verify ErrorOptions cause preserves MIN_INT numeric boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("min cause", { cause: -2147483648 });
      expect(err.cause).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0240
     * @tc.name testErrorBoundary024
     * @tc.desc Verify Error(undefined) behaves as no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(undefined);
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0250
     * @tc.name testErrorBoundary025
     * @tc.desc Verify Error message with punctuation special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = "!@#$%^&*()_+-=[]{}|;:,.<>?/~`";
      let err: Error = new Error(msg);
      expect(err.message).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0260
     * @tc.name testErrorBoundary026
     * @tc.desc Verify Error code = 1 (minimum positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(1);
      expect(err.code).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0270
     * @tc.name testErrorBoundary027
     * @tc.desc Verify ErrorOptions cause preserves empty object special value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Object = {};
      let err: Error = new Error("object cause", { cause: cause });
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0280
     * @tc.name testErrorBoundary028
     * @tc.desc Verify Error(msg, {}) has undefined cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", {});
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0290
     * @tc.name testErrorBoundary029
     * @tc.desc Verify Error name with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("@#$%^&*", 0);
      expect(err.name).assertEqual("@#$%^&*");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0300
     * @tc.name testErrorBoundary030
     * @tc.desc Verify Error message with null byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("msg\u0000with_null");
      expect(err.message.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0310
     * @tc.name testErrorBoundary031
     * @tc.desc Verify Error code -1 (common business error marker)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(-1);
      expect(err.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0320
     * @tc.name testErrorBoundary032
     * @tc.desc Verify stack can be set to empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      err.stack = "";
      expect(err.stack).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0330
     * @tc.name testErrorBoundary033
     * @tc.desc Verify cause set to number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: 0 });
      expect(e.cause).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0340
     * @tc.name testErrorBoundary034
     * @tc.desc Verify cause set to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: false });
      expect(e.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0350
     * @tc.name testErrorBoundary035
     * @tc.desc Verify Error name with Unicode characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("????", 0);
      expect(err.name).assertEqual("????");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0360
     * @tc.name testErrorBoundary036
     * @tc.desc Verify cause set to undefined explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg", { cause: undefined });
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0370
     * @tc.name testErrorBoundary037
     * @tc.desc Verify Boundary A2 Chinese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("错误消息");
      expect(e.message).assertEqual("错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0380
     * @tc.name testErrorBoundary038
     * @tc.desc Verify Boundary A2 Japanese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("エラー");
      expect(e.message).assertEqual("エラー");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0390
     * @tc.name testErrorBoundary039
     * @tc.desc Verify Boundary A2 Arabic
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("رسالة");
      expect(e.message).assertEqual("رسالة");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0400
     * @tc.name testErrorBoundary040
     * @tc.desc Verify Boundary A2 Russian
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Сообщение");
      expect(e.message).assertEqual("Сообщение");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0410
     * @tc.name testErrorBoundary041
     * @tc.desc Verify Boundary A2 Emoji
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("❌⚠️");
      expect(e.message).assertEqual("❌⚠️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0420
     * @tc.name testErrorBoundary042
     * @tc.desc Verify Boundary A2 Space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("   ");
      expect(e.message).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0430
     * @tc.name testErrorBoundary043
     * @tc.desc Verify Boundary A2 Tab
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("\t");
      expect(e.message).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0440
     * @tc.name testErrorBoundary044
     * @tc.desc Verify Boundary A2 Newline
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("a\nb");
      expect(e.message).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0450
     * @tc.name testErrorBoundary045
     * @tc.desc Verify Boundary A2 Zero Width Space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("a​b");
      expect(e.message.includes("a")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0460
     * @tc.name testErrorBoundary046
     * @tc.desc Verify Boundary A2 Mixed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Hello世界");
      expect(e.message).assertEqual("Hello世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0470
     * @tc.name testErrorBoundary047
     * @tc.desc Verify Boundary A2 XSS
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("<script>");
      expect(e.message).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0480
     * @tc.name testErrorBoundary048
     * @tc.desc Verify Boundary A2 Repeat
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("�");
      expect(e.message).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0490
     * @tc.name testErrorBoundary049
     * @tc.desc Verify Boundary A2 Scientific
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("x²+y²");
      expect(e.message).assertEqual("x²+y²");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0500
     * @tc.name testErrorBoundary050
     * @tc.desc Verify Boundary A2 RTL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("טסט");
      expect(e.message).assertEqual("טסט");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0510
     * @tc.name testErrorBoundary051
     * @tc.desc Verify Boundary A2 Null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("msg\u0000null");
      expect(e.message.includes("msg")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0520
     * @tc.name testErrorBoundary052
     * @tc.desc Verify Boundary A1 Chinese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "错误消息");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0530
     * @tc.name testErrorBoundary053
     * @tc.desc Verify Boundary A1 Japanese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "エラー");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("エラー");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0540
     * @tc.name testErrorBoundary054
     * @tc.desc Verify Boundary A1 Arabic
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "رسالة");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("رسالة");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0550
     * @tc.name testErrorBoundary055
     * @tc.desc Verify Boundary A1 Russian
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "Сообщение");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("Сообщение");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0560
     * @tc.name testErrorBoundary056
     * @tc.desc Verify Boundary A1 Emoji
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "❌⚠️");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("❌⚠️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0570
     * @tc.name testErrorBoundary057
     * @tc.desc Verify Boundary A1 Space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "   ");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0580
     * @tc.name testErrorBoundary058
     * @tc.desc Verify Boundary A1 Tab
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "\t");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0590
     * @tc.name testErrorBoundary059
     * @tc.desc Verify Boundary A1 Newline
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "a\nb");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0600
     * @tc.name testErrorBoundary060
     * @tc.desc Verify Boundary A1 Zero Width Space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "a​b");
      expect(e.code).assertEqual(42);
      expect(e.message.includes("a")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0610
     * @tc.name testErrorBoundary061
     * @tc.desc Verify Boundary A1 Mixed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "Hello世界");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("Hello世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0620
     * @tc.name testErrorBoundary062
     * @tc.desc Verify Boundary A1 XSS
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "<script>");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0630
     * @tc.name testErrorBoundary063
     * @tc.desc Verify Boundary A1 Repeat
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "�");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0640
     * @tc.name testErrorBoundary064
     * @tc.desc Verify Boundary A1 Scientific
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "x²+y²");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("x²+y²");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0650
     * @tc.name testErrorBoundary065
     * @tc.desc Verify Boundary A1 RTL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "טסט");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("טסט");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0660
     * @tc.name testErrorBoundary066
     * @tc.desc Verify Boundary A1 Null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "msg\u0000null");
      expect(e.code).assertEqual(42);
      expect(e.message.includes("msg")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0670
     * @tc.name testErrorBoundary067
     * @tc.desc Verify Boundary A4 Chinese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "错误消息");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0680
     * @tc.name testErrorBoundary068
     * @tc.desc Verify Boundary A4 Japanese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "エラー");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("エラー");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0690
     * @tc.name testErrorBoundary069
     * @tc.desc Verify Boundary A4 Arabic
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "رسالة");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("رسالة");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0700
     * @tc.name testErrorBoundary070
     * @tc.desc Verify Boundary A4 Russian
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "Сообщение");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("Сообщение");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0710
     * @tc.name testErrorBoundary071
     * @tc.desc Verify Boundary A4 Emoji
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "❌⚠️");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("❌⚠️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0720
     * @tc.name testErrorBoundary072
     * @tc.desc Verify Boundary A4 Tab
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "\t");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0730
     * @tc.name testErrorBoundary073
     * @tc.desc Verify Boundary A4 Newline
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "a\nb");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0740
     * @tc.name testErrorBoundary074
     * @tc.desc Verify Boundary A4 Zero Width Space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "a​b");
      expect(e.name).assertEqual("B");
      expect(e.message.includes("a")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0750
     * @tc.name testErrorBoundary075
     * @tc.desc Verify Boundary A4 Mixed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "Hello世界");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("Hello世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0760
     * @tc.name testErrorBoundary076
     * @tc.desc Verify Boundary A4 XSS
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "<script>");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0770
     * @tc.name testErrorBoundary077
     * @tc.desc Verify Boundary A4 Repeat
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "�");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0780
     * @tc.name testErrorBoundary078
     * @tc.desc Verify Boundary A4 Scientific
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "x²+y²");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("x²+y²");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0790
     * @tc.name testErrorBoundary079
     * @tc.desc Verify Boundary A4 RTL
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "טסט");
      expect(e.name).assertEqual("B");
      expect(e.message).assertEqual("טסט");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0800
     * @tc.name testErrorBoundary080
     * @tc.desc Verify Boundary A4 Null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("B", "msg\u0000null");
      expect(e.name).assertEqual("B");
      expect(e.message.includes("msg")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0810
     * @tc.name testErrorBoundary081
     * @tc.desc Verify -0 as code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-0);
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0820
     * @tc.name testErrorBoundary082
     * @tc.desc Verify -0 in A3 constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("NZ", -0);
      expect(e.name).assertEqual("NZ");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0830
     * @tc.name testErrorBoundary083
     * @tc.desc Verify MAX_INT+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483646 + 1);
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0840
     * @tc.name testErrorBoundary084
     * @tc.desc Verify MIN_INT with name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Min", -2147483648);
      expect(e.name).assertEqual("Min");
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0850
     * @tc.name testErrorBoundary085
     * @tc.desc Verify overflow wraps
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2000000000 + 2000000000);
      expect(e.code).assertEqual(-294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0860
     * @tc.name testErrorBoundary086
     * @tc.desc Verify negative overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-2147483647 - 1);
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0870
     * @tc.name testErrorBoundary087
     * @tc.desc Verify ~0 = -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(~0);
      expect(e.code).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0880
     * @tc.name testErrorBoundary088
     * @tc.desc Verify ~MAX_INT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(~2147483647);
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0890
     * @tc.name testErrorBoundary089
     * @tc.desc Verify Error code from high byte mask boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0xFFFF & 0xFF);
      expect(e.code).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0900
     * @tc.name testErrorBoundary090
     * @tc.desc Verify 1<<31
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(1 << 31);
      let c: int = e.code;
      expect(c === -2147483648 || c === 0 || c === 2147483648).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0910
     * @tc.name testErrorBoundary091
     * @tc.desc Verify numeric MAX_INT string dispatches message overload
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("2147483647");
      expect(e.message).assertEqual("2147483647");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0920
     * @tc.name testErrorBoundary092
     * @tc.desc Verify numeric MIN_INT string dispatches message overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("-2147483648");
      expect(e.message).assertEqual("-2147483648");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0930
     * @tc.name testErrorBoundary093
     * @tc.desc Verify Error code from MAX_INT division boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483647 / 1);
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0940
     * @tc.name testErrorBoundary094
     * @tc.desc Verify Error code from octal literal 0o777 = 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0o777);
      expect(e.code).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0950
     * @tc.name testErrorBoundary095
     * @tc.desc Verify A3 Error(name, hex code, msg) stores code from hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("HexErr", 0x100, "msg");
      expect(e.code).assertEqual(256);
      expect(e.name).assertEqual("HexErr");
      expect(e.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0960
     * @tc.name testErrorBoundary096
     * @tc.desc Verify A3 Error(name, binary code, msg) stores code from binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("BinErr", 0b1111, "msg");
      expect(e.code).assertEqual(15);
      expect(e.name).assertEqual("BinErr");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0970
     * @tc.name testErrorBoundary097
     * @tc.desc Verify A3 Error(name, octal code, msg) stores code from octal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorBoundary097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("OctErr", 0o77, "msg");
      expect(e.code).assertEqual(63);
      expect(e.name).assertEqual("OctErr");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0980
     * @tc.name testErrorBoundary098
     * @tc.desc Verify null passed as Error message throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err: Error = new Error(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_0990
     * @tc.name testErrorBoundary099
     * @tc.desc Verify Map object passed as Error message throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg: Map<string, string> = new Map<string, string>();
      try {
        let err: Error = new Error(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1000
     * @tc.name testErrorBoundary100
     * @tc.desc Verify Set object passed as TypeError message throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg: Set<string> = new Set<string>();
      try {
        let err: TypeError = new TypeError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1010
     * @tc.name testErrorBoundary101
     * @tc.desc Verify Date object passed as RangeError message throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg: Date = new Date();
      try {
        let err: RangeError = new RangeError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1020
     * @tc.name testErrorBoundary102
     * @tc.desc Verify BusinessError with MAX_INT, MIN_INT and zero code boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxCode: BusinessError = new BusinessError(2147483647, 'max int');
      expect(maxCode.code).assertEqual(2147483647);
      let minCode: BusinessError = new BusinessError(-2147483648, 'min int');
      expect(minCode.code).assertEqual(-2147483648);
      let zeroCode: BusinessError = new BusinessError(0, 'zero');
      expect(zeroCode.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1030
     * @tc.name testErrorBoundary103
     * @tc.desc Verify BusinessError with empty string data keeps data and leaves cause empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("root");
      let data: BusinessError<string> = new BusinessError<string>(401, "", err);
      expect(data.code).assertEqual(401);
      expect(data.data).assertEqual("");
      expect(data.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1040
     * @tc.name testErrorBoundary104
     * @tc.desc Verify BusinessError with code and message stores correctly with undefined data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: BusinessError = new BusinessError(403, 'forbidden');
      expect(err.code).assertEqual(403);
      expect(err.message).assertEqual('forbidden');
      expect(err.data).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1050
     * @tc.name testErrorBoundary105
     * @tc.desc Verify Error with undefined argument defaults to empty string message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(undefined);
      expect(err.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1060
     * @tc.name testErrorBoundary106
     * @tc.desc Verify Error and TypeError store whitespace-only strings as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg: string = '   ';
      let err: Error = new Error(wsMsg);
      expect(err.message).assertEqual(wsMsg);
      let typeErr: TypeError = new TypeError(wsMsg);
      expect(typeErr.message).assertEqual(wsMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1070
     * @tc.name testErrorBoundary107
     * @tc.desc Verify Error stores tab and newline characters in message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tabMsg: string = '\t\t';
      let err: Error = new Error(tabMsg);
      expect(err.message).assertEqual(tabMsg);
      let nlMsg: string = '\nline2\nline3';
      let err2: Error = new Error(nlMsg);
      expect(err2.message).assertEqual(nlMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1080
     * @tc.name testErrorBoundary108
     * @tc.desc Verify Error stores long repeated string (1000 chars) as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg: string = 'A'.repeat(1000);
      let err: Error = new Error(longMsg);
      expect(err.message).assertEqual(longMsg);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1090
     * @tc.name testErrorBoundary109
     * @tc.desc Verify Error and RangeError store CJK/Unicode strings as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnMsg: string = '中文错误消息测试';
      let err: Error = new Error(cnMsg);
      expect(err.message).assertEqual(cnMsg);
      let rangeErr: RangeError = new RangeError(cnMsg);
      expect(rangeErr.message).assertEqual(cnMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1100
     * @tc.name testErrorBoundary110
     * @tc.desc Verify Error stores emoji characters in message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg: string = '😀😁🔥🚀';
      let err: Error = new Error(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1110
     * @tc.name testErrorBoundary111
     * @tc.desc Verify Error stores special punctuation characters in message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punctMsg: string = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err: Error = new Error(punctMsg);
      expect(err.message).assertEqual(punctMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1120
     * @tc.name testErrorBoundary112
     * @tc.desc Verify Error stores XSS payload string in message without sanitization
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg: string = '<script>alert(1)</script>';
      let err: Error = new Error(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1130
     * @tc.name testErrorBoundary113
     * @tc.desc Verify Error stores numerical string representation (Number.MAX_VALUE) as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr: string = Number.MAX_VALUE.toString();
      let err: Error = new Error(maxStr);
      expect(err.message).assertEqual(maxStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1140
     * @tc.name testErrorBoundary114
     * @tc.desc Verify Error stores mixed CJK/Latin characters in message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = 'Error: 中文 テスト 테스트';
      let err: Error = new Error(mixed);
      expect(err.message).assertEqual(mixed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1150
     * @tc.name testErrorBoundary115
     * @tc.desc Verify Error code from MAX_INT minus zero expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(2147483647 - 0);
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1160
     * @tc.name testErrorBoundary116
     * @tc.desc Verify Error code from large multiplication near INT boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(46340 * 46340);
      expect(err.code).assertEqual(2147395600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1170
     * @tc.name testErrorBoundary117
     * @tc.desc Verify Error code from bitwise OR 0xF0 | 0x0F = 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(0xF0 | 0x0F);
      expect(err.code).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1180
     * @tc.name testErrorBoundary118
     * @tc.desc Verify Error code from MAX_INT grouped arithmetic expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error((2000000000 + 147483647));
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1190
     * @tc.name testErrorBoundary119
     * @tc.desc Verify Error code from MIN_INT modulo boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(-2147483648 % 1);
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1200
     * @tc.name testErrorBoundary120
     * @tc.desc Verify Error code from MIN_INT expression stores boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(-2147483647 - 1);
      expect(err.code).assertEqual(-2147483648);
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1210
     * @tc.name testErrorBoundary121
     * @tc.desc Verify Error code from nested MAX_INT boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exprCode: int = (2147483600 + 47);
      let err: Error = new Error(exprCode);
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1220
     * @tc.name testErrorBoundary122
     * @tc.desc Verify Error code from hex MAX_INT boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexSum: int = 0x7ffffffe + 1;
      let err: Error = new Error(hexSum);
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1230
     * @tc.name testErrorBoundary123
     * @tc.desc Verify Error code from bitwise MAX_INT boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: int = (0x7FFF << 16) | 0xFFFF;
      let err: Error = new Error(code);
      expect(err.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1240
     * @tc.name testErrorBoundary124
     * @tc.desc Verify Error code from MAX_INT modulo boundary expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let modCode: int = 2147483647 % 2;
      let err: Error = new Error(modCode);
      expect(err.code).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1250
     * @tc.name testErrorBoundary125
     * @tc.desc Verify Error code from shift expression minimum positive boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shiftCode: int = 0x1000 >> 12;
      let err: Error = new Error(shiftCode);
      expect(err.code).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1260
     * @tc.name testErrorBoundary126
     * @tc.desc Verify Error with empty name and empty message returns empty toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("");
      err.name = "";
      expect(err.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1270
     * @tc.name testErrorBoundary127
     * @tc.desc Verify TypeError preserves empty string message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: TypeError = new TypeError("");
      expect(err.name).assertEqual("TypeError");
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1280
     * @tc.name testErrorBoundary128
     * @tc.desc Verify RangeError preserves long message boundary length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = "R".repeat(1000);
      let err: RangeError = new RangeError(msg);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1290
     * @tc.name testErrorBoundary129
     * @tc.desc Verify Chinese characters as Error name via constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("错误名称", 0);
      expect(e.name).assertEqual("错误名称");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1300
     * @tc.name testErrorBoundary130
     * @tc.desc Verify Korean characters as Error name via constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("오류 이름", 0);
      expect(e.name).assertEqual("오류 이름");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1310
     * @tc.name testErrorBoundary131
     * @tc.desc Verify Thai characters as Error name via constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("ชื่อข้อผิดพลาด", 0);
      expect(e.name).assertEqual("ชื่อข้อผิดพลาด");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1320
     * @tc.name testErrorBoundary132
     * @tc.desc Verify Hindi characters as Error name via constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("त्रुटि नाम", 0);
      expect(e.name).assertEqual("त्रुटि नाम");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1330
     * @tc.name testErrorBoundary133
     * @tc.desc Verify mixed script Error name via constructor
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Error名称エラー오류", 0);
      expect(e.name).assertEqual("Error名称エラー오류");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1340
     * @tc.name testErrorBoundary134
     * @tc.desc Verify Chinese name set after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "中文名称";
      expect(e.name).assertEqual("中文名称");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1350
     * @tc.name testErrorBoundary135
     * @tc.desc Verify Korean name set after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "한글 이름";
      expect(e.name).assertEqual("한글 이름");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1360
     * @tc.name testErrorBoundary136
     * @tc.desc Verify Thai and Hindi mixed name set after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "ไทยत्रुटि";
      expect(e.name).assertEqual("ไทยत्रुटि");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1370
     * @tc.name testErrorBoundary137
     * @tc.desc Verify Chinese string as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("w", { cause: "中文原因" });
      expect(e.cause).assertEqual("中文原因");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1380
     * @tc.name testErrorBoundary138
     * @tc.desc Verify Korean string as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("w", { cause: "한국어 원인" });
      expect(e.cause).assertEqual("한국어 원인");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1390
     * @tc.name testErrorBoundary139
     * @tc.desc Verify emoji string as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("w", { cause: "❌ 원인 ⚠️" });
      expect(e.cause).assertEqual("❌ 원인 ⚠️");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1400
     * @tc.name testErrorBoundary140
     * @tc.desc Verify mixed script string as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("w", { cause: "cause: 原因 (原因) causa" });
      expect(e.cause).assertEqual("cause: 原因 (原因) causa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1410
     * @tc.name testErrorBoundary141
     * @tc.desc Verify BusinessError exposes Error-compatible name message and code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: BusinessError = new BusinessError(500, 'business failed');
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('business failed');
      expect(err.code).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1420
     * @tc.name testErrorBoundary142
     * @tc.desc Verify BusinessError constructor wraps base Error message with code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root-error');
      let err: BusinessError = new BusinessError(700, root);
      expect(err.code).assertEqual(700);
      expect(err.message).assertEqual('root-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_1430
     * @tc.name testErrorBoundary143
     * @tc.desc Verify BusinessError constructor wraps TypeError message with code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: TypeError = new TypeError('typed-root');
      let err: BusinessError = new BusinessError(701, root);
      expect(err.code).assertEqual(701);
      expect(err.message).assertEqual('typed-root');
    });

  });
}
