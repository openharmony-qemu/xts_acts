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

class ErrorInvokeCausePayload {
  code: int = 2002;
  detail: string = 'invoke-payload';
}

export default function ErrorDollarInvokeTest(): void {
  describe('ErrorDollarInvokeTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0010
     * @tc.name testErrorDollarInvoke001
     * @tc.desc Verify Error.$_invoke() creates instance with default name Error, code 0 and empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke();
      expect(err.name).assertEqual("Error");
      expect(err.code).assertEqual(0);
      expect(err.message).assertEqual("");
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0020
     * @tc.name testErrorDollarInvoke002
     * @tc.desc Verify Error.$_invoke(email string) stores the message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke("test@example.com");
      expect(err.message).assertEqual("test@example.com");
      expect(err.name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0030
     * @tc.name testErrorDollarInvoke003
     * @tc.desc Verify Error.$_invoke('') stores empty string message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke("");
      expect(err.message).assertEqual("");
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0040
     * @tc.name testErrorDollarInvoke004
     * @tc.desc Verify Error.$_invoke('!@#$%') handles special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke("!@#$%");
      expect(err.message).assertEqual("!@#$%");
      expect(err.message.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0050
     * @tc.name testErrorDollarInvoke005
     * @tc.desc Verify Error.$_invoke() result is instanceof Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke();
      expect(err.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0060
     * @tc.name testErrorDollarInvoke006
     * @tc.desc Verify Error.$_invoke() returns default Error fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke();
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("");
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0070
     * @tc.name testErrorDollarInvoke007
     * @tc.desc Verify Error.$_invoke().stack is a non-empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke();
      expect(err.stack).not().assertUndefined();
      expect((err.stack as String).indexOf("Error")).not().assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0080
     * @tc.name testErrorDollarInvoke008
     * @tc.desc Verify Error.$_invoke() has undefined cause by default
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0090
     * @tc.name testErrorDollarInvoke009
     * @tc.desc Verify Error.$_invoke with number cause set via property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = 42;
      expect(e.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0100
     * @tc.name testErrorDollarInvoke010
     * @tc.desc Verify Error.$_invoke with string cause set via property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = "https://example.com/cause";
      expect(e.cause).assertEqual("https://example.com/cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0110
     * @tc.name testErrorDollarInvoke011
     * @tc.desc Verify Error.$_invoke with boolean cause set via property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = true;
      expect(e.cause).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0120
     * @tc.name testErrorDollarInvoke012
     * @tc.desc Verify Error.$_invoke with Error cause set via property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("inner");
      let e: Error = Error.$_invoke();
      e.cause = inner;
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0130
     * @tc.name testErrorDollarInvoke013
     * @tc.desc Verify Error.$_invoke(replacement character string, {}) has undefined cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke("\uFFFD", {});
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0140
     * @tc.name testErrorDollarInvoke014
     * @tc.desc Verify Error.$_invoke(Japanese string, {cause: URL}) stores cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke("テスト", { cause: "https://example.com/cause" });
      expect(e.cause).assertEqual("https://example.com/cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0150
     * @tc.name testErrorDollarInvoke015
     * @tc.desc Verify Error.$_invoke can form nested cause via Error chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = Error.$_invoke("inner");
      let outer: Error = Error.$_invoke("outer", { cause: inner });
      expect((outer.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0160
     * @tc.name testErrorDollarInvoke016
     * @tc.desc Verify modifying the cause Error is reflected
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("original");
      let e: Error = Error.$_invoke("msg", { cause: inner });
      inner.message = "modified";
      expect((e.cause as Error).message).assertEqual("modified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0170
     * @tc.name testErrorDollarInvoke017
     * @tc.desc Verify cause can be reassigned via property after creation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = 1;
      expect(e.cause).assertEqual(1);
      e.cause = "updated";
      expect(e.cause).assertEqual("updated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0180
     * @tc.name testErrorDollarInvoke018
     * @tc.desc Verify shared cause object reflects mutation across $_invoke calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error("shared");
      let e1: Error = Error.$_invoke("first", { cause: shared });
      let e2: Error = Error.$_invoke("second", { cause: shared });
      shared.message = "mutated";
      expect((e1.cause as Error).message).assertEqual("mutated");
      expect((e2.cause as Error).message).assertEqual("mutated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0190
     * @tc.name testErrorDollarInvoke019
     * @tc.desc Verify cause can be reset to undefined after being set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = 1;
      e.cause = undefined;
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0200
     * @tc.name testErrorDollarInvoke020
     * @tc.desc Verify Error.$_invoke forms cause chain via Error property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = Error.$_invoke("root");
      let mid: Error = Error.$_invoke("mid", { cause: root });
      let top: Error = Error.$_invoke("top", { cause: mid });
      expect(top.message).assertEqual("top");
      expect((top.cause as Error).message).assertEqual("mid");
      expect(((top.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0210
     * @tc.name testErrorDollarInvoke021
     * @tc.desc Verify array can be used as cause with type assertion
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "b", "c"];
      let e: Error = Error.$_invoke("array", { cause: arr });
      let strE0: string[] = e.cause as string[];
      expect(strE0[0]).assertEqual("a");
      expect(strE0[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0220
     * @tc.name testErrorDollarInvoke022
     * @tc.desc Verify cause can hold different types sequentially
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = Error.$_invoke();
      e.cause = 1;
      expect(e.cause).assertEqual(1);
      e.cause = "str";
      expect(e.cause).assertEqual("str");
      e.cause = undefined;
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0230
     * @tc.name testErrorDollarInvoke023
     * @tc.desc Verify $_invoke preserves message when cause is set via options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("inner");
      let e: Error = Error.$_invoke("outer msg", { cause: inner });
      expect(e.message).assertEqual("outer msg");
      expect((e.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0240
     * @tc.name testErrorDollarInvoke024
     * @tc.desc Verify $_invoke Error with cause thrown and caught preserves properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("root");
      let e: Error = Error.$_invoke("wrapped", { cause: inner });
      try {
        throw e;
        expect().assertFail();
      } catch (ex) {
        expect((ex as Error).message).assertEqual("wrapped");
        expect((ex.cause as Error).message).assertEqual("root");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0250
     * @tc.name testErrorDollarInvoke025
     * @tc.desc Verify $_invoke() and new Error() produce same name/code/message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke();
      let newErr: Error = new Error();
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.code).assertEqual(newErr.code);
      expect(staticErr.message).assertEqual(newErr.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0260
     * @tc.name testErrorDollarInvoke026
     * @tc.desc Verify $_invoke(URL string) and new Error(URL string) message fields match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("https://example.com/invoke");
      let newErr: Error = new Error("https://example.com/invoke");
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.code).assertEqual(newErr.code);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0270
     * @tc.name testErrorDollarInvoke027
     * @tc.desc Verify $_invoke("") and new Error("") message/toString match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("");
      let newErr: Error = new Error("");
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.code).assertEqual(newErr.code);
      expect(staticErr.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0280
     * @tc.name testErrorDollarInvoke028
     * @tc.desc Verify $_invoke(undefined) and new Error(undefined) fields match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke(undefined);
      let newErr: Error = new Error(undefined);
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.code).assertEqual(newErr.code);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0290
     * @tc.name testErrorDollarInvoke029
     * @tc.desc Verify $_invoke and new Error message equality for chinese
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("中文消息");
      let newErr: Error = new Error("中文消息");
      expect(staticErr.message).assertEqual(newErr.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0300
     * @tc.name testErrorDollarInvoke030
     * @tc.desc Verify $_invoke and new Error message equality for special
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("special!@#$%");
      let newErr: Error = new Error("special!@#$%");
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.message.length).assertEqual(newErr.message.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0310
     * @tc.name testErrorDollarInvoke031
     * @tc.desc Verify $_invoke and new Error message equality for long
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("x".repeat(100));
      let newErr: Error = new Error("x".repeat(100));
      expect(staticErr.message).assertEqual(newErr.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0320
     * @tc.name testErrorDollarInvoke032
     * @tc.desc Verify $_invoke(zero-width message) and new Error(zero-width message) both have undefined cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("\u200B");
      let newErr: Error = new Error("\u200B");
      expect(staticErr.cause).assertUndefined();
      expect(newErr.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0330
     * @tc.name testErrorDollarInvoke033
     * @tc.desc Verify $_invoke(invalid date string, {}) and new Error(invalid date string, {}) equivalence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("2026-02-30", {});
      let newErr: Error = new Error("2026-02-30", {});
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0340
     * @tc.name testErrorDollarInvoke034
     * @tc.desc Verify $_invoke(msg, { cause: XSS string }) and new Error(msg, { cause: XSS string }) equivalence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("msg", { cause: "<script>alert(1)</script>" });
      let newErr: Error = new Error("msg", { cause: "<script>alert(1)</script>" });
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.cause).assertEqual(newErr.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0350
     * @tc.name testErrorDollarInvoke035
     * @tc.desc Verify $_invoke(msg, { cause: 999 }) and new Error(msg, { cause: 999 }) equivalence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke("msg", { cause: 999 });
      let newErr: Error = new Error("msg", { cause: 999 });
      expect(staticErr.name).assertEqual(newErr.name);
      expect(staticErr.message).assertEqual(newErr.message);
      expect(staticErr.cause).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0360
     * @tc.name testErrorDollarInvoke036
     * @tc.desc Verify $_invoke() result has correct prototype chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticErr: Error = Error.$_invoke();
      let newErr: Error = new Error();
      expect(staticErr.name).assertEqual('Error');
      expect(newErr.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0370
     * @tc.name testErrorDollarInvoke037
     * @tc.desc Verify $_invoke() result has code=0 same as new Error()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Error.$_invoke().code).assertEqual(0);
      expect((new Error()).code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0380
     * @tc.name testErrorDollarInvoke038
     * @tc.desc Verify Error.$_invoke with explicit undefined cause option leaves cause unset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let options: ErrorOptions = { cause: undefined };
      let err: Error = Error.$_invoke('explicit-undefined-cause', options);
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('explicit-undefined-cause');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0390
     * @tc.name testErrorDollarInvoke039
     * @tc.desc Verify Error.$_invoke with undefined message preserves explicit cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('invoke-cause');
      let err: Error = Error.$_invoke(undefined, { cause: cause });
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('');
      expect((err.cause as RangeError).message).assertEqual('invoke-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0400
     * @tc.name testErrorDollarInvoke040
     * @tc.desc Verify Error.$_invoke preserves 65535 character message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'i'.repeat(65535);
      let err: Error = Error.$_invoke(message);
      expect(err.name).assertEqual('Error');
      expect(err.message.length).assertEqual(65535);
      expect(err.message).assertEqual(message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0410
     * @tc.name testErrorDollarInvoke041
     * @tc.desc Verify Error.$_invoke preserves escaped newline and tab message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'line\nbreak\tinvoke';
      let err: Error = Error.$_invoke(message);
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual(message);
      expect(err.message.indexOf('\n')).assertEqual(4);
      expect(err.message.indexOf('\t')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0420
     * @tc.name testErrorDollarInvoke042
     * @tc.desc Verify Error.$_invoke reuses ErrorOptions cause reference without mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('shared-options-cause');
      let options: ErrorOptions = { cause: cause };
      let first: Error = Error.$_invoke('first-options', options);
      let second: Error = Error.$_invoke('second-options', options);
      cause.message = 'updated-options-cause';
      expect((first.cause as Error).message).assertEqual('updated-options-cause');
      expect((second.cause as Error).message).assertEqual('updated-options-cause');
      expect(options.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0430
     * @tc.name testErrorDollarInvoke043
     * @tc.desc Verify Error.$_invoke stores custom payload object as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorInvokeCausePayload = new ErrorInvokeCausePayload();
      let err: Error = Error.$_invoke('payload-invoke', { cause: payload });
      let cause: ErrorInvokeCausePayload = err.cause as ErrorInvokeCausePayload;
      expect(err.message).assertEqual('payload-invoke');
      expect(cause.code).assertEqual(2002);
      expect(cause.detail).assertEqual('invoke-payload');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0440
     * @tc.name testErrorDollarInvoke044
     * @tc.desc Verify Error.$_invoke preserves whitespace-only message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '    ';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
      expect(err.message.length).assertEqual(4);
      expect(err.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0450
     * @tc.name testErrorDollarInvoke045
     * @tc.desc Verify Error.$_invoke preserves business format messages with default initialization
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuidErr: Error = Error.$_invoke('550e8400-e29b-41d4-a716-446655440000');
      let urlErr: Error = Error.$_invoke('https://example.com/invoke?id=42');
      let xssErr: Error = Error.$_invoke('<script>alert(1)</script>');
      let zeroWidthErr: Error = Error.$_invoke('id\u200Bhidden');
      expect(uuidErr.message).assertEqual('550e8400-e29b-41d4-a716-446655440000');
      expect(uuidErr.name).assertEqual('Error');
      expect(urlErr.message).assertEqual('https://example.com/invoke?id=42');
      expect(urlErr.code).assertEqual(0);
      expect(xssErr.message).assertEqual('<script>alert(1)</script>');
      expect(xssErr.code).assertEqual(0);
      expect(zeroWidthErr.message).assertEqual('id\u200Bhidden');
      expect(zeroWidthErr.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0460
     * @tc.name testErrorDollarInvoke046
     * @tc.desc Verify Error.$_invoke treats JSON-like message as plain text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '{"type":"invoke","code":42,"ok":false}';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
      expect(err.name).assertEqual('Error');
      expect(err.code).assertEqual(0);
      expect(err.message.length).assertEqual(38);
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0470
     * @tc.name testErrorDollarInvoke047
     * @tc.desc Verify Error.$_invoke repeated calls return independent latest result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke('loop-0');
      let last: Error = first;
      for (let i: int = 1; i <= 20; i++) {
        last = Error.$_invoke('loop-' + i);
      }
      first.message = 'first-mutated';
      expect(last.message).assertEqual('loop-20');
      expect(last.name).assertEqual('Error');
      expect(last.code).assertEqual(0);
      expect(first.message).assertEqual('first-mutated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0480
     * @tc.name testErrorDollarInvoke048
     * @tc.desc Verify separate Error.$_invoke results keep independent mutable fields
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke('first');
      let second: Error = Error.$_invoke('second');
      first.name = 'FirstInvokeOnly';
      first.code = 88;
      first.message = 'changed-first';
      first.cause = new Error('first-cause');
      expect(second.name).assertEqual('Error');
      expect(second.code).assertEqual(0);
      expect(second.message).assertEqual('second');
      expect(second.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0490
     * @tc.name testErrorDollarInvoke049
     * @tc.desc Verify Error.$_invoke result message is writable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('before-update');
      err.message = 'after-update';
      expect(err.message).assertEqual('after-update');
      expect(err.name).assertEqual('Error');
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0500
     * @tc.name testErrorDollarInvoke050
     * @tc.desc Verify Error.$_invoke result name mutation preserves message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('named-message');
      err.name = 'InvokeName';
      expect(err.name).assertEqual('InvokeName');
      expect(err.message).assertEqual('named-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0510
     * @tc.name testErrorDollarInvoke051
     * @tc.desc Verify Error.$_invoke result code can be reassigned
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('code-update');
      err.code = 12345;
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('code-update');
      expect(err.code).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0520
     * @tc.name testErrorDollarInvoke052
     * @tc.desc Verify Error.$_invoke options cause can be cleared after creation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('clear-options-cause', { cause: new Error('inner') });
      expect((err.cause as Error).message).assertEqual('inner');
      err.cause = undefined;
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0530
     * @tc.name testErrorDollarInvoke053
     * @tc.desc Verify Error.$_invoke snapshots current ErrorOptions cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstCause: Error = new Error('first-cause');
      let secondCause: Error = new Error('second-cause');
      let options: ErrorOptions = { cause: firstCause };
      let first: Error = Error.$_invoke('first-result', options);
      options.cause = secondCause;
      let second: Error = Error.$_invoke('second-result', options);
      expect((first.cause as Error).message).assertEqual('first-cause');
      expect((second.cause as Error).message).assertEqual('second-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0540
     * @tc.name testErrorDollarInvoke054
     * @tc.desc Verify Error.$_invoke custom payload cause reflects mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorInvokeCausePayload = new ErrorInvokeCausePayload();
      let err: Error = Error.$_invoke('payload-mutation', { cause: payload });
      payload.detail = 'invoke-payload-updated';
      let cause: ErrorInvokeCausePayload = err.cause as ErrorInvokeCausePayload;
      expect(cause.code).assertEqual(2002);
      expect(cause.detail).assertEqual('invoke-payload-updated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0550
     * @tc.name testErrorDollarInvoke055
     * @tc.desc Verify Error.$_invoke preserves Map cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause: Map<string, string> = new Map<string, string>();
      mapCause.set('kind', 'map-cause');
      let err: Error = Error.$_invoke('map-invoke', { cause: mapCause });
      expect(err.cause).assertEqual(mapCause);
      expect((err.cause as Map<string, string>).get('kind')).assertEqual('map-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0560
     * @tc.name testErrorDollarInvoke056
     * @tc.desc Verify Error.$_invoke preserves Set cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setCause: Set<string> = new Set<string>();
      setCause.add('set-cause');
      let err: Error = Error.$_invoke('set-invoke', { cause: setCause });
      expect(err.cause).assertEqual(setCause);
      expect((err.cause as Set<string>).has('set-cause')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0570
     * @tc.name testErrorDollarInvoke057
     * @tc.desc Verify Error.$_invoke preserves Date cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateCause: Date = new Date(123456);
      let err: Error = Error.$_invoke('date-invoke', { cause: dateCause });
      expect(err.cause).assertEqual(dateCause);
      expect((err.cause as Date).getTime()).assertEqual(123456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0580
     * @tc.name testErrorDollarInvoke058
     * @tc.desc Verify Error.$_invoke preserves false boolean cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('false-cause', { cause: false });
      expect(err.message).assertEqual('false-cause');
      expect(err.cause).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0590
     * @tc.name testErrorDollarInvoke059
     * @tc.desc Verify Error.$_invoke preserves negative numeric cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('negative-cause', { cause: -2147483648 });
      expect(err.message).assertEqual('negative-cause');
      expect(err.cause).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0600
     * @tc.name testErrorDollarInvoke060
     * @tc.desc Verify Error.$_invoke preserves NaN cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('nan-cause', { cause: Number.NaN });
      expect(err.message).assertEqual('nan-cause');
      expect(isNaN(err.cause as number)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0610
     * @tc.name testErrorDollarInvoke061
     * @tc.desc Verify Error.$_invoke preserves positive infinity cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('infinity-cause', { cause: Number.POSITIVE_INFINITY });
      expect(err.message).assertEqual('infinity-cause');
      expect(err.cause).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0620
     * @tc.name testErrorDollarInvoke062
     * @tc.desc Verify Error.$_invoke array cause reflects source mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['before'];
      let err: Error = Error.$_invoke('array-mutation', { cause: arr });
      arr[0] = 'after';
      expect((err.cause as string[])[0]).assertEqual('after');
      expect((err.cause as string[]).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0630
     * @tc.name testErrorDollarInvoke063
     * @tc.desc Verify Error.$_invoke builds six-level cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let current: Error = Error.$_invoke('level-0');
      for (let i: int = 1; i <= 5; i++) {
        current = Error.$_invoke('level-' + i, { cause: current });
      }
      let cursor: Error = current;
      for (let i: int = 5; i > 0; i--) {
        expect(cursor.message).assertEqual('level-' + i);
        cursor = cursor.cause as Error;
      }
      expect(cursor.message).assertEqual('level-0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0640
     * @tc.name testErrorDollarInvoke064
     * @tc.desc Verify Error.$_invoke instances can form circular cause references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke('circle-first');
      let second: Error = Error.$_invoke('circle-second');
      first.cause = second;
      second.cause = first;
      expect((first.cause as Error).message).assertEqual('circle-second');
      expect(((first.cause as Error).cause as Error).message).assertEqual('circle-first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0650
     * @tc.name testErrorDollarInvoke065
     * @tc.desc Verify thrown Error.$_invoke result preserves message after catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw Error.$_invoke('throw-invoke');
        expect().assertFail();
      } catch (e) {
        expect((e as Error).message).assertEqual('throw-invoke');
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0660
     * @tc.name testErrorDollarInvoke066
     * @tc.desc Verify thrown mutated Error.$_invoke result preserves updates after catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('before-throw');
      err.message = 'after-throw';
      err.name = 'InvokeThrown';
      try {
        throw err;
      } catch (e) {
        expect((e as Error).name).assertEqual('InvokeThrown');
        expect((e as Error).message).assertEqual('after-throw');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0670
     * @tc.name testErrorDollarInvoke067
     * @tc.desc Verify Error.$_invoke result is stable after later ErrorOptions mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let options: ErrorOptions = {};
      let err: Error = Error.$_invoke('late-options-mutation', options);
      options.cause = new Error('late-cause');
      expect(err.message).assertEqual('late-options-mutation');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0680
     * @tc.name testErrorDollarInvoke068
     * @tc.desc Verify Error.$_invoke results can be stored in array preserving order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [Error.$_invoke('first-array'), Error.$_invoke('second-array')];
      expect(errors.length).assertEqual(2);
      expect(errors[0].message).assertEqual('first-array');
      expect(errors[1].message).assertEqual('second-array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0690
     * @tc.name testErrorDollarInvoke069
     * @tc.desc Verify Error.$_invoke with empty message and zero cause preserves both
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('', { cause: 0 });
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('');
      expect(err.cause).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0700
     * @tc.name testErrorDollarInvoke070
     * @tc.desc Verify Error.$_invoke preserves escaped Unicode message sequences
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\uD83D\uDE00-\u05D0-\uFF21-\u221E';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0710
     * @tc.name testErrorDollarInvoke071
     * @tc.desc Verify Error.$_invoke stores computed concatenated message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = 'invoke';
      let suffix: string = 'computed';
      let err: Error = Error.$_invoke(prefix + '-' + suffix + '-' + (20 + 6));
      expect(err.message).assertEqual('invoke-computed-26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0720
     * @tc.name testErrorDollarInvoke072
     * @tc.desc Verify Error.$_invoke message is stable after source variable reassignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = 'source-before';
      let err: Error = Error.$_invoke(source);
      source = 'source-after';
      expect(err.message).assertEqual('source-before');
      expect(source).assertEqual('source-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0730
     * @tc.name testErrorDollarInvoke073
     * @tc.desc Verify Error.$_invoke cause is stable after source variable reassignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = Error.$_invoke('source-cause');
      let err: Error = Error.$_invoke('outer-cause-source', { cause: cause });
      cause = Error.$_invoke('replacement-cause');
      expect((err.cause as Error).message).assertEqual('source-cause');
      expect(cause.message).assertEqual('replacement-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0740
     * @tc.name testErrorDollarInvoke074
     * @tc.desc Verify repeated Error.$_invoke no-argument calls return distinct instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke();
      let second: Error = Error.$_invoke();
      first.message = 'first-only';
      expect(first === second).assertFalse();
      expect(second.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0750
     * @tc.name testErrorDollarInvoke075
     * @tc.desc Verify Error.$_invoke with reused empty ErrorOptions creates independent results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let options: ErrorOptions = {};
      let first: Error = Error.$_invoke('first-empty-options', options);
      let second: Error = Error.$_invoke('second-empty-options', options);
      first.cause = 'first-cause';
      expect(second.cause).assertUndefined();
      expect(first.message).assertEqual('first-empty-options');
      expect(second.message).assertEqual('second-empty-options');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0760
     * @tc.name testErrorDollarInvoke076
     * @tc.desc Verify Error.$_invoke and new Error are equivalent values but distinct references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invoked: Error = Error.$_invoke('distinct-equivalent');
      let constructed: Error = new Error('distinct-equivalent');
      expect(invoked === constructed).assertFalse();
      expect(invoked.name).assertEqual(constructed.name);
      expect(invoked.message).assertEqual(constructed.message);
      expect(invoked.code).assertEqual(constructed.code);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0770
     * @tc.name testErrorDollarInvoke077
     * @tc.desc Verify Error.$_invoke Object.keys count matches new Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invokedKeys: string[] = Object.keys(Error.$_invoke('keys-count'));
      let constructedKeys: string[] = Object.keys(new Error('keys-count'));
      expect(invokedKeys.length).assertEqual(constructedKeys.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0780
     * @tc.name testErrorDollarInvoke078
     * @tc.desc Verify Error.$_invoke own property name count matches new Error with cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invokedNames: string[] = Object.getOwnPropertyNames(Error.$_invoke('names-count', { cause: 'cause' }));
      let constructedNames: string[] = Object.getOwnPropertyNames(new Error('names-count', { cause: 'cause' }));
      expect(invokedNames.length).assertEqual(constructedNames.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0790
     * @tc.name testErrorDollarInvoke079
     * @tc.desc Verify Error.$_invoke message is not reported as own property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('own-message-check');
      expect(err.hasOwnProperty('message')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0800
     * @tc.name testErrorDollarInvoke080
     * @tc.desc Verify Error.$_invoke cause is not reported as own property when provided
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('own-cause-check', { cause: 'own-cause' });
      expect(err.hasOwnProperty('cause')).assertFalse();
      expect(err.cause).assertEqual('own-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0810
     * @tc.name testErrorDollarInvoke081
     * @tc.desc Verify Error.$_invoke stack property is writable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('manual-stack');
      err.stack = 'manual-invoke-stack';
      expect(err.stack).assertEqual('manual-invoke-stack');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0820
     * @tc.name testErrorDollarInvoke082
     * @tc.desc Verify Error.$_invoke stack assignment stays isolated per instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke('first-stack');
      let second: Error = Error.$_invoke('second-stack');
      first.stack = 'first-stack-only';
      expect(first.stack).assertEqual('first-stack-only');
      expect(second.stack === 'first-stack-only').assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0830
     * @tc.name testErrorDollarInvoke083
     * @tc.desc Verify Error.$_invoke result message can reset to empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('will-clear');
      err.message = '';
      expect(err.message).assertEqual('');
      expect(err.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0840
     * @tc.name testErrorDollarInvoke084
     * @tc.desc Verify Error.$_invoke result name can reset to Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('reset-name-message');
      err.name = 'TemporaryName';
      err.name = 'Error';
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('reset-name-message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0850
     * @tc.name testErrorDollarInvoke085
     * @tc.desc Verify Error.$_invoke cause created by $_invoke reflects later mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = Error.$_invoke('invoke-cause-before');
      let err: Error = Error.$_invoke('invoke-cause-holder', { cause: cause });
      cause.message = 'invoke-cause-after';
      expect((err.cause as Error).message).assertEqual('invoke-cause-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0860
     * @tc.name testErrorDollarInvoke086
     * @tc.desc Verify Error.$_invoke preserves empty array cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: string[] = [];
      let err: Error = Error.$_invoke('empty-array-cause', { cause: cause });
      expect(err.cause === cause).assertTrue();
      expect(cause.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0870
     * @tc.name testErrorDollarInvoke087
     * @tc.desc Verify Error.$_invoke preserves Error array cause element identity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = Error.$_invoke('array-error-first');
      let second: Error = Error.$_invoke('array-error-second');
      let causes: Error[] = [first, second];
      let err: Error = Error.$_invoke('array-error-holder', { cause: causes });
      expect(err.cause === causes).assertTrue();
      expect(causes[0] === first).assertTrue();
      expect(causes[1].message).assertEqual('array-error-second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0880
     * @tc.name testErrorDollarInvoke088
     * @tc.desc Verify Error.$_invoke can store ErrorOptions-shaped object as cause payload
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorOptions = { cause: 'nested-payload-cause' };
      let err: Error = Error.$_invoke('options-payload-holder', { cause: payload });
      expect(err.cause === payload).assertTrue();
      expect(payload.cause).assertEqual('nested-payload-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0890
     * @tc.name testErrorDollarInvoke089
     * @tc.desc Verify Error.$_invoke preserves Number.MAX_VALUE cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('max-value-cause', { cause: Number.MAX_VALUE });
      expect(err.cause).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0900
     * @tc.name testErrorDollarInvoke090
     * @tc.desc Verify Error.$_invoke preserves one character message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('x');
      expect(err.message).assertEqual('x');
      expect(err.message.length).assertEqual(1);
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0910
     * @tc.name testErrorDollarInvoke091
     * @tc.desc Verify Error.$_invoke preserves 1000 character message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'i'.repeat(1000);
      let err: Error = Error.$_invoke(message);
      expect(err.message.length).assertEqual(1000);
      expect(err.message).assertEqual(message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0920
     * @tc.name testErrorDollarInvoke092
     * @tc.desc Verify Error.$_invoke preserves template literal message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: int = 12;
      let err: Error = Error.$_invoke(`invoke-template-${index}`);
      expect(err.message).assertEqual('invoke-template-12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0930
     * @tc.name testErrorDollarInvoke093
     * @tc.desc Verify Error.$_invoke preserves CRLF message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'invoke-line1\r\ninvoke-line2';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
      expect(err.message.length).assertEqual(26);
      expect(err.name).assertEqual('Error');
      expect(err.message.indexOf('\r\n')).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0940
     * @tc.name testErrorDollarInvoke094
     * @tc.desc Verify Error.$_invoke preserves surrogate pair message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\uD83D\uDD25';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
      expect(err.message.length).assertEqual(2);
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0950
     * @tc.name testErrorDollarInvoke095
     * @tc.desc Verify Error.$_invoke preserves RTL marker message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = '\u202Einvoke';
      let err: Error = Error.$_invoke(message);
      expect(err.message).assertEqual(message);
      expect(err.message.length).assertEqual(7);
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0960
     * @tc.name testErrorDollarInvoke096
     * @tc.desc Verify Error.$_invoke with undefined message and empty options defaults message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0970
     * @tc.name testErrorDollarInvoke097
     * @tc.desc Verify Error.$_invoke preserves RangeError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('range-cause');
      let err: Error = Error.$_invoke('range-holder', { cause: cause });
      expect((err.cause as RangeError).name).assertEqual('RangeError');
      expect((err.cause as RangeError).message).assertEqual('range-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0980
     * @tc.name testErrorDollarInvoke098
     * @tc.desc Verify Error.$_invoke preserves TypeError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: TypeError = new TypeError('type-cause');
      let err: Error = Error.$_invoke('type-holder', { cause: cause });
      expect((err.cause as TypeError).name).assertEqual('TypeError');
      expect((err.cause as TypeError).message).assertEqual('type-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_0990
     * @tc.name testErrorDollarInvoke099
     * @tc.desc Verify Error.$_invoke preserves SyntaxError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: SyntaxError = new SyntaxError('syntax-cause');
      let err: Error = Error.$_invoke('syntax-holder', { cause: cause });
      expect((err.cause as SyntaxError).name).assertEqual('SyntaxError');
      expect((err.cause as SyntaxError).message).assertEqual('syntax-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1000
     * @tc.name testErrorDollarInvoke100
     * @tc.desc Verify Error.$_invoke preserves ReferenceError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: ReferenceError = new ReferenceError('reference-cause');
      let err: Error = Error.$_invoke('reference-holder', { cause: cause });
      expect((err.cause as ReferenceError).name).assertEqual('ReferenceError');
      expect((err.cause as ReferenceError).message).assertEqual('reference-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1010
     * @tc.name testErrorDollarInvoke101
     * @tc.desc Verify Error.$_invoke preserves URIError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: URIError = new URIError('uri-cause');
      let err: Error = Error.$_invoke('uri-holder', { cause: cause });
      expect((err.cause as URIError).name).assertEqual('URIError');
      expect((err.cause as URIError).message).assertEqual('uri-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1020
     * @tc.name testErrorDollarInvoke102
     * @tc.desc Verify Error.$_invoke preserves EvalError cause type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: EvalError = new EvalError('eval-cause');
      let err: Error = Error.$_invoke('eval-holder', { cause: cause });
      expect((err.cause as EvalError).name).assertEqual('EvalError');
      expect((err.cause as EvalError).message).assertEqual('eval-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1030
     * @tc.name testErrorDollarInvoke103
     * @tc.desc Verify Error.$_invoke preserves nested built-in cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = Error.$_invoke('root-invoke');
      let middle: TypeError = new TypeError('middle-type', { cause: root });
      let top: Error = Error.$_invoke('top-invoke', { cause: middle });
      let resolvedMiddle: TypeError = top.cause as TypeError;
      let resolvedRoot: Error = resolvedMiddle.cause as Error;
      expect(resolvedMiddle.name).assertEqual('TypeError');
      expect(resolvedRoot.message).assertEqual('root-invoke');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1040
     * @tc.name testErrorDollarInvoke104
     * @tc.desc Verify thrown Error.$_invoke preserves RangeError cause after catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('caught-range');
      try {
        throw Error.$_invoke('caught-invoke', { cause: cause });
      } catch (e) {
        expect((e as Error).message).assertEqual('caught-invoke');
        expect(((e as Error).cause as RangeError).message).assertEqual('caught-range');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1050
     * @tc.name testErrorDollarInvoke105
     * @tc.desc Verify Error.$_invoke metadata fields remain stable across repeated reads
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('metadata-stable');
      let summary: string = '';
      for (let i: int = 0; i < 100; i++) {
        summary = err.name + ':' + err.code + ':' + err.message;
      }
      expect(summary).assertEqual('Error:0:metadata-stable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1060
     * @tc.name testErrorDollarInvoke106
     * @tc.desc Verify Error.$_invoke Map cause reflects later mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause: Map<string, Error> = new Map<string, Error>();
      let err: Error = Error.$_invoke('map-mutation-holder', { cause: mapCause });
      mapCause.set('late', Error.$_invoke('late-map-error'));
      let resolved: Map<string, Error> = err.cause as Map<string, Error>;
      expect(resolved.get('late')?.message).assertEqual('late-map-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1070
     * @tc.name testErrorDollarInvoke107
     * @tc.desc Verify Error.$_invoke Set cause reflects later mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setCause: Set<Error> = new Set<Error>();
      let element: Error = Error.$_invoke('late-set-error');
      let err: Error = Error.$_invoke('set-mutation-holder', { cause: setCause });
      setCause.add(element);
      let resolved: Set<Error> = err.cause as Set<Error>;
      expect(resolved.has(element)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1080
     * @tc.name testErrorDollarInvoke108
     * @tc.desc Verify Error.$_invoke Date cause reflects later time mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateCause: Date = new Date(0);
      let err: Error = Error.$_invoke('date-mutation-holder', { cause: dateCause });
      dateCause.setTime(1000);
      let resolved: Date = err.cause as Date;
      expect(resolved.getTime()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1090
     * @tc.name testErrorDollarInvoke109
     * @tc.desc Verify Error.$_invoke preserves empty Map cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCause: Map<string, Error> = new Map<string, Error>();
      let err: Error = Error.$_invoke('empty-map-cause', { cause: mapCause });
      let resolved: Map<string, Error> = err.cause as Map<string, Error>;
      expect(resolved).assertEqual(mapCause);
      expect(resolved.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1100
     * @tc.name testErrorDollarInvoke110
     * @tc.desc Verify Error.$_invoke preserves empty Set cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setCause: Set<Error> = new Set<Error>();
      let err: Error = Error.$_invoke('empty-set-cause', { cause: setCause });
      let resolved: Set<Error> = err.cause as Set<Error>;
      expect(resolved).assertEqual(setCause);
      expect(resolved.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1110
     * @tc.name testErrorDollarInvoke111
     * @tc.desc Verify Error.$_invoke preserves nested array cause identity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf: Error = Error.$_invoke('nested-array-leaf');
      let nested: Error[][] = [[leaf]];
      let err: Error = Error.$_invoke('nested-array-holder', { cause: nested });
      let resolved: Error[][] = err.cause as Error[][];
      expect(resolved[0][0]).assertEqual(leaf);
      expect(resolved[0][0].message).assertEqual('nested-array-leaf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1120
     * @tc.name testErrorDollarInvoke112
     * @tc.desc Verify Error.$_invoke preserves custom payload inside Map cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorInvokeCausePayload = new ErrorInvokeCausePayload();
      let mapCause: Map<string, ErrorInvokeCausePayload> = new Map<string, ErrorInvokeCausePayload>();
      mapCause.set('payload', payload);
      let err: Error = Error.$_invoke('payload-map-holder', { cause: mapCause });
      let resolved: Map<string, ErrorInvokeCausePayload> = err.cause as Map<string, ErrorInvokeCausePayload>;
      expect(resolved.get('payload')?.detail).assertEqual('invoke-payload');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1130
     * @tc.name testErrorDollarInvoke113
     * @tc.desc Verify Error.$_invoke preserves custom payload inside Set cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorInvokeCausePayload = new ErrorInvokeCausePayload();
      let setCause: Set<ErrorInvokeCausePayload> = new Set<ErrorInvokeCausePayload>();
      setCause.add(payload);
      let err: Error = Error.$_invoke('payload-set-holder', { cause: setCause });
      let resolved: Set<ErrorInvokeCausePayload> = err.cause as Set<ErrorInvokeCausePayload>;
      expect(resolved.has(payload)).assertTrue();
      expect(payload.code).assertEqual(2002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1140
     * @tc.name testErrorDollarInvoke114
     * @tc.desc Verify Error.$_invoke result remains readable after cause reassignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('cause-reassign-readable', { cause: 'first' });
      err.cause = new Error('second-cause');
      expect(err.message).assertEqual('cause-reassign-readable');
      expect((err.cause as Error).message).assertEqual('second-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1150
     * @tc.name testErrorDollarInvoke115
     * @tc.desc Verify Error.$_invoke with empty message and Error cause preserves both
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = Error.$_invoke('empty-with-cause');
      let err: Error = Error.$_invoke('', { cause: cause });
      expect(err.message).assertEqual('');
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1160
     * @tc.name testErrorDollarInvoke116
     * @tc.desc Verify Error.$_invoke options with custom payload and message are independent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: ErrorInvokeCausePayload = new ErrorInvokeCausePayload();
      let err: Error = Error.$_invoke('payload-independent', { cause: payload });
      err.message = 'payload-message-updated';
      expect((err.cause as ErrorInvokeCausePayload).detail).assertEqual('invoke-payload');
      expect(err.message).assertEqual('payload-message-updated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1170
     * @tc.name testErrorDollarInvoke117
     * @tc.desc Verify built-in Error subclass $_invoke zero-argument defaults
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypeError.$_invoke().name).assertEqual('TypeError');
      expect(RangeError.$_invoke().name).assertEqual('RangeError');
      expect(SyntaxError.$_invoke().name).assertEqual('SyntaxError');
      expect(ReferenceError.$_invoke().message).assertEqual('');
      expect(EvalError.$_invoke().message).assertEqual('');
      expect(URIError.$_invoke().code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1180
     * @tc.name testErrorDollarInvoke118
     * @tc.desc Verify built-in Error subclass $_invoke one-argument messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErr: Error = TypeError.$_invoke('type');
      let rangeErr: Error = RangeError.$_invoke('range');
      let syntaxErr: Error = SyntaxError.$_invoke('syntax');
      let referenceErr: Error = ReferenceError.$_invoke('reference');
      let evalErr: Error = EvalError.$_invoke('eval');
      let uriErr: Error = URIError.$_invoke('uri');
      expect(typeErr.name).assertEqual('TypeError');
      expect(typeErr.message).assertEqual('type');
      expect(rangeErr.name).assertEqual('RangeError');
      expect(rangeErr.message).assertEqual('range');
      expect(syntaxErr.name).assertEqual('SyntaxError');
      expect(syntaxErr.message).assertEqual('syntax');
      expect(referenceErr.name).assertEqual('ReferenceError');
      expect(referenceErr.message).assertEqual('reference');
      expect(evalErr.name).assertEqual('EvalError');
      expect(evalErr.message).assertEqual('eval');
      expect(uriErr.name).assertEqual('URIError');
      expect(uriErr.message).assertEqual('uri');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1190
     * @tc.name testErrorDollarInvoke119
     * @tc.desc Verify built-in Error subclass $_invoke options preserve cause references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('invoke-subclass-cause');
      expect(TypeError.$_invoke('type', { cause: cause }).cause).assertEqual(cause);
      expect(RangeError.$_invoke('range', { cause: cause }).cause).assertEqual(cause);
      expect(SyntaxError.$_invoke('syntax', { cause: cause }).cause).assertEqual(cause);
      expect(ReferenceError.$_invoke('reference', { cause: cause }).cause).assertEqual(cause);
      expect(EvalError.$_invoke('eval', { cause: cause }).cause).assertEqual(cause);
      expect(URIError.$_invoke('uri', { cause: cause }).cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1200
     * @tc.name testErrorDollarInvoke120
     * @tc.desc Verify runtime Error subclass $_invoke name and message results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let format: Error = FormatError.$_invoke('format');
      let nonIntegral: Error = NonIntegralIndexError.$_invoke('index');
      let assertion: Error = AssertionError.$_invoke('assert');
      let json: Error = JSONTypeError.$_invoke('json');
      expect(format.name).assertEqual('FormatError');
      expect(format.message).assertEqual('format');
      expect(nonIntegral.name).assertEqual('NonIntegralIndexError');
      expect(nonIntegral.message).assertEqual('index');
      expect(assertion.name).assertEqual('Error');
      expect(assertion.message).assertEqual('assert');
      expect(json.message).assertEqual('json');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1210
     * @tc.name testErrorDollarInvoke121
     * @tc.desc Verify Error $_invoke throws ClassCastError for null cause option
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err: Error = Error.$_invoke('invoke-null-cause', { cause: null as Object });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1220
     * @tc.name testErrorDollarInvoke122
     * @tc.desc Verify Error $_invoke throws ClassCastError for Map value as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMessage: Map<string, string> = new Map<string, string>();
      mapMessage.set('id', '310101199001011234');
      try {
        let err: Error = Error.$_invoke(mapMessage as Object as string);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1230
     * @tc.name testErrorDollarInvoke123
     * @tc.desc Verify Error.$_invoke with valid message and explicit undefined options defaults cause to undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = Error.$_invoke('invoke-null-cause', undefined);
      expect(err.message).assertEqual('invoke-null-cause');
      expect(err.cause).assertEqual(undefined);
      expect(err.name).assertEqual('Error');
      expect(err.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1240
     * @tc.name testErrorDollarInvoke124
     * @tc.desc Verify Error.$_invoke throws ClassCastError when null is passed as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err: Error = Error.$_invoke(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_DOLLAR_INVOKE_1250
     * @tc.name testErrorDollarInvoke125
     * @tc.desc Verify Error.$_invoke throws ClassCastError when undefined cast through Object is passed as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorDollarInvoke125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err: Error = Error.$_invoke(undefined as Object as string);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

  });
}
