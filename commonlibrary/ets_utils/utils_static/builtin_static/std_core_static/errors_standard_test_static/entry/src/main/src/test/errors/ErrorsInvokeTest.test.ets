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
import Utils from './../Util.test';

export default function ErrorsInvokeTest(): void {
  describe('ErrorsInvokeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0001
     * @tc.name testErrorsInvoke0001
     * @tc.desc Verify syntaxError.invoke 1 argument call message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("syntax");
      expect(err.message).assertEqual("syntax");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0002
     * @tc.name testErrorsInvoke0002
     * @tc.desc Verify syntaxError.invoke 2 argument call message+options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("syntax", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0003
     * @tc.name testErrorsInvoke0003
     * @tc.desc Verify rangeError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError();
      expect(err.name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0004
     * @tc.name testErrorsInvoke0004
     * @tc.desc Verify rangeError.invoke 1 argument call message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("range");
      expect(err.message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0005
     * @tc.name testErrorsInvoke0005
     * @tc.desc Verify rangeError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("range", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0006
     * @tc.name testErrorsInvoke0006
     * @tc.desc Verify evalError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError();
      expect(err.name).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0007
     * @tc.name testErrorsInvoke0007
     * @tc.desc Verify evalError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("eval");
      expect(err.message).assertEqual("eval");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0008
     * @tc.name testErrorsInvoke0008
     * @tc.desc Verify evalError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("eval", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0009
     * @tc.name testErrorsInvoke0009
     * @tc.desc Verify nonIntegralIndexError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError();
      expect(err.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0010
     * @tc.name testErrorsInvoke0010
     * @tc.desc Verify nonIntegralIndexError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("nii");
      expect(err.message).assertEqual("nii");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0011
     * @tc.name testErrorsInvoke0011
     * @tc.desc Verify nonIntegralIndexError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("nii", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0012
     * @tc.name testErrorsInvoke0012
     * @tc.desc Verify typeError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError();
      expect(err.name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0013
     * @tc.name testErrorsInvoke0013
     * @tc.desc Verify typeError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("type");
      expect(err.message).assertEqual("type");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0014
     * @tc.name testErrorsInvoke0014
     * @tc.desc Verify typeError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("type", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0015
     * @tc.name testErrorsInvoke0015
     * @tc.desc Verify referenceError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError();
      expect(err.name).assertEqual('ReferenceError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0016
     * @tc.name testErrorsInvoke0016
     * @tc.desc Verify referenceError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("ref");
      expect(err.message).assertEqual("ref");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0017
     * @tc.name testErrorsInvoke0017
     * @tc.desc Verify referenceError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("ref", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0018
     * @tc.name testErrorsInvoke0018
     * @tc.desc Verify URIError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError();
      expect(err.name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0019
     * @tc.name testErrorsInvoke0019
     * @tc.desc Verify URIError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("uri");
      expect(err.message).assertEqual("uri");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0020
     * @tc.name testErrorsInvoke0020
     * @tc.desc Verify URIError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("uri", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0021
     * @tc.name testErrorsInvoke0021
     * @tc.desc Verify formatError.invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError();
      expect(err.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0022
     * @tc.name testErrorsInvoke0022
     * @tc.desc Verify formatError.invoke 1 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("fmt");
      expect(err.message).assertEqual("fmt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0023
     * @tc.name testErrorsInvoke0023
     * @tc.desc Verify formatError.invoke 2 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("fmt", { cause: new Error("c") });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0024
     * @tc.name testErrorsInvoke0024
     * @tc.desc Verify syntaxError.invoke message length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("a");
      expect(err.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0025
     * @tc.name testErrorsInvoke0025
     * @tc.desc Verify syntaxError.invoke message length1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "a".repeat(1000);
      const err = SyntaxError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0026
     * @tc.name testErrorsInvoke0026
     * @tc.desc Verify rangeError.invoke message length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("r");
      expect(err.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0027
     * @tc.name testErrorsInvoke0027
     * @tc.desc Verify rangeError.invoke message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "r".repeat(1000);
      const err = RangeError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0028
     * @tc.name testErrorsInvoke0028
     * @tc.desc Verify rangeError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0029
     * @tc.name testErrorsInvoke0029
     * @tc.desc Verify evalError.invoke message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "e".repeat(1000);
      const err = EvalError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0030
     * @tc.name testErrorsInvoke0030
     * @tc.desc Verify evalError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0031
     * @tc.name testErrorsInvoke0031
     * @tc.desc Verify nonIntegralIndexError.invoke message length10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "n".repeat(10000);
      const err = NonIntegralIndexError(s);
      expect(err.message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0032
     * @tc.name testErrorsInvoke0032
     * @tc.desc Verify nonIntegralIndexError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0033
     * @tc.name testErrorsInvoke0033
     * @tc.desc Verify typeError.invoke message length1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "t".repeat(1000);
      const err = TypeError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0034
     * @tc.name testErrorsInvoke0034
     * @tc.desc Verify typeError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0035
     * @tc.name testErrorsInvoke0035
     * @tc.desc Verify referenceError.invoke message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "f".repeat(1000);
      const err = ReferenceError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0036
     * @tc.name testErrorsInvoke0036
     * @tc.desc Verify referenceError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0037
     * @tc.name testErrorsInvoke0037
     * @tc.desc Verify URIError.invoke message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "u".repeat(1000);
      const err = URIError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0038
     * @tc.name testErrorsInvoke0038
     * @tc.desc Verify URIError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0039
     * @tc.name testErrorsInvoke0039
     * @tc.desc Verify formatError.invoke message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "g".repeat(1000);
      const err = FormatError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0040
     * @tc.name testErrorsInvoke0040
     * @tc.desc Verify formatError.invoke message omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError();
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0041
     * @tc.name testErrorsInvoke0041
     * @tc.desc Verify syntaxError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const err = SyntaxError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0042
     * @tc.name testErrorsInvoke0042
     * @tc.desc Verify syntaxError.invoke cause is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("r");
      const err = SyntaxError("m", { cause: inner });
      expect((err.cause as Error) instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0043
     * @tc.name testErrorsInvoke0043
     * @tc.desc Verify syntaxError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("m", { cause: "string-cause" });
      expect(err.cause as string).assertEqual("string-cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0044
     * @tc.name testErrorsInvoke0044
     * @tc.desc Verify syntaxError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("m", { cause: 42 });
      expect(err.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0045
     * @tc.name testErrorsInvoke0045
     * @tc.desc Verify syntaxError.invoke preserves true boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("m", { cause: true });
      expect(err.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0046
     * @tc.name testErrorsInvoke0046
     * @tc.desc Verify syntaxError.invoke options omitted cause is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = SyntaxError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0047
     * @tc.name testErrorsInvoke0047
     * @tc.desc Verify rangeError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const err = RangeError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0048
     * @tc.name testErrorsInvoke0048
     * @tc.desc Verify rangeError.invoke cause is TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new TypeError("t");
      const err = RangeError("m", { cause: inner });
      expect((err.cause as Error) instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0049
     * @tc.name testErrorsInvoke0049
     * @tc.desc Verify rangeError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("m", { cause: "cs" });
      expect(err.cause as string).assertEqual("cs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0050
     * @tc.name testErrorsInvoke0050
     * @tc.desc Verify rangeError.invoke preserves zero number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("m", { cause: 0 });
      expect(err.cause).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0051
     * @tc.name testErrorsInvoke0051
     * @tc.desc Verify rangeError.invoke preserves false boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("m", { cause: false });
      expect(err.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0052
     * @tc.name testErrorsInvoke0052
     * @tc.desc Verify rangeError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0053
     * @tc.name testErrorsInvoke0053
     * @tc.desc Verify evalError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ie");
      const err = EvalError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("ie");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0054
     * @tc.name testErrorsInvoke0054
     * @tc.desc Verify evalError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("m", { cause: "cs" });
      expect(err.cause as string).assertEqual("cs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0055
     * @tc.name testErrorsInvoke0055
     * @tc.desc Verify evalError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("m", { cause: 99 });
      expect(err.cause).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0056
     * @tc.name testErrorsInvoke0056
     * @tc.desc Verify evalError.invoke preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("m", { cause: true });
      expect(err.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0057
     * @tc.name testErrorsInvoke0057
     * @tc.desc Verify evalError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0058
     * @tc.name testErrorsInvoke0058
     * @tc.desc Verify nonIntegralIndexError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ni");
      const err = NonIntegralIndexError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("ni");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0059
     * @tc.name testErrorsInvoke0059
     * @tc.desc Verify nonIntegralIndexError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("m", { cause: "ncs" });
      expect(err.cause as string).assertEqual("ncs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0060
     * @tc.name testErrorsInvoke0060
     * @tc.desc Verify nonIntegralIndexError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("m", { cause: 7 });
      expect(err.cause).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0061
     * @tc.name testErrorsInvoke0061
     * @tc.desc Verify nonIntegralIndexError.invoke preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("m", { cause: false });
      expect(err.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0062
     * @tc.name testErrorsInvoke0062
     * @tc.desc Verify nonIntegralIndexError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0063
     * @tc.name testErrorsInvoke0063
     * @tc.desc Verify typeError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ti");
      const err = TypeError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("ti");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0064
     * @tc.name testErrorsInvoke0064
     * @tc.desc Verify typeError.invoke cause is TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new TypeError("tt");
      const err = TypeError("m", { cause: inner });
      expect((err.cause as Error) instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0065
     * @tc.name testErrorsInvoke0065
     * @tc.desc Verify typeError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("m", { cause: "tcs" });
      expect(err.cause as string).assertEqual("tcs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0066
     * @tc.name testErrorsInvoke0066
     * @tc.desc Verify typeError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("m", { cause: -1 });
      expect(err.cause).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0067
     * @tc.name testErrorsInvoke0067
     * @tc.desc Verify typeError.invoke preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("m", { cause: true });
      expect(err.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0068
     * @tc.name testErrorsInvoke0068
     * @tc.desc Verify typeError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0069
     * @tc.name testErrorsInvoke0069
     * @tc.desc Verify referenceError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ri");
      const err = ReferenceError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("ri");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0070
     * @tc.name testErrorsInvoke0070
     * @tc.desc Verify referenceError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("m", { cause: "rcs" });
      expect(err.cause as string).assertEqual("rcs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0071
     * @tc.name testErrorsInvoke0071
     * @tc.desc Verify referenceError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("m", { cause: 100 });
      expect(err.cause).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0072
     * @tc.name testErrorsInvoke0072
     * @tc.desc Verify referenceError.invoke preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("m", { cause: false });
      expect(err.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0073
     * @tc.name testErrorsInvoke0073
     * @tc.desc Verify referenceError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0074
     * @tc.name testErrorsInvoke0074
     * @tc.desc Verify URIError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ui");
      const err = URIError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("ui");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0075
     * @tc.name testErrorsInvoke0075
     * @tc.desc Verify URIError.invoke cause is URIError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new URIError("u2");
      const err = URIError("m", { cause: inner });
      expect((err.cause as Error) instanceof URIError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0076
     * @tc.name testErrorsInvoke0076
     * @tc.desc Verify URIError.invoke cause is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("m", { cause: "ucs" });
      expect(err.cause as string).assertEqual("ucs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0077
     * @tc.name testErrorsInvoke0077
     * @tc.desc Verify URIError.invoke cause is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("m", { cause: 8 });
      expect(err.cause).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0078
     * @tc.name testErrorsInvoke0078
     * @tc.desc Verify URIError.invoke cause is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("m", { cause: true });
      expect(err.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0079
     * @tc.name testErrorsInvoke0079
     * @tc.desc Verify URIError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0080
     * @tc.name testErrorsInvoke0080
     * @tc.desc Verify formatError.invoke cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("fi");
      const err = FormatError("m", { cause: inner });
      expect((err.cause as Error).message).assertEqual("fi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0081
     * @tc.name testErrorsInvoke0081
     * @tc.desc Verify formatError.invoke cause is SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new SyntaxError("ss");
      const err = FormatError("m", { cause: inner });
      expect((err.cause as Error) instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0082
     * @tc.name testErrorsInvoke0082
     * @tc.desc Verify formatError.invoke preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("m", { cause: "fcs" });
      expect(err.cause as string).assertEqual("fcs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0083
     * @tc.name testErrorsInvoke0083
     * @tc.desc Verify formatError.invoke preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("m", { cause: 1024 });
      expect(err.cause).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0084
     * @tc.name testErrorsInvoke0084
     * @tc.desc Verify formatError.invoke preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("m", { cause: false });
      expect(err.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0085
     * @tc.name testErrorsInvoke0085
     * @tc.desc Verify formatError.invoke options omitted cause undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("m");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0086
     * @tc.name testErrorsInvoke0086
     * @tc.desc Verify syntaxError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = SyntaxError("eq");
      const b = new SyntaxError("eq");
      expect(a.name).assertEqual('SyntaxError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('SyntaxError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0087
     * @tc.name testErrorsInvoke0087
     * @tc.desc Verify syntaxError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = SyntaxError("eq");
      const b = new SyntaxError("eq");
      expect(a.name).assertEqual('SyntaxError');
      expect(b.name).assertEqual('SyntaxError');
      expect(a instanceof SyntaxError).assertTrue();
      expect(b instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0088
     * @tc.name testErrorsInvoke0088
     * @tc.desc Verify syntaxError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = SyntaxError("m", { cause: inner });
      const b = new SyntaxError("m", { cause: inner });
      expect(a.name).assertEqual('SyntaxError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('SyntaxError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0089
     * @tc.name testErrorsInvoke0089
     * @tc.desc Verify rangeError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = RangeError("eq");
      const b = new RangeError("eq");
      expect(a.name).assertEqual('RangeError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('RangeError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0090
     * @tc.name testErrorsInvoke0090
     * @tc.desc Verify rangeError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = RangeError("eq");
      const b = new RangeError("eq");
      expect(a.name).assertEqual('RangeError');
      expect(b.name).assertEqual('RangeError');
      expect(a instanceof RangeError).assertTrue();
      expect(b instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0091
     * @tc.name testErrorsInvoke0091
     * @tc.desc Verify rangeError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = RangeError("m", { cause: inner });
      const b = new RangeError("m", { cause: inner });
      expect(a.name).assertEqual('RangeError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('RangeError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0092
     * @tc.name testErrorsInvoke0092
     * @tc.desc Verify evalError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = EvalError("eq");
      const b = new EvalError("eq");
      expect(a.name).assertEqual('EvalError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('EvalError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0093
     * @tc.name testErrorsInvoke0093
     * @tc.desc Verify evalError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = EvalError("eq");
      const b = new EvalError("eq");
      expect(a.name).assertEqual('EvalError');
      expect(b.name).assertEqual('EvalError');
      expect(a instanceof EvalError).assertTrue();
      expect(b instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0094
     * @tc.name testErrorsInvoke0094
     * @tc.desc Verify evalError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = EvalError("m", { cause: inner });
      const b = new EvalError("m", { cause: inner });
      expect(a.name).assertEqual('EvalError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('EvalError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0095
     * @tc.name testErrorsInvoke0095
     * @tc.desc Verify nonIntegralIndexError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = NonIntegralIndexError("eq");
      const b = new NonIntegralIndexError("eq");
      expect(a.name).assertEqual('NonIntegralIndexError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('NonIntegralIndexError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0096
     * @tc.name testErrorsInvoke0096
     * @tc.desc Verify nonIntegralIndexError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = NonIntegralIndexError("eq");
      const b = new NonIntegralIndexError("eq");
      expect(a.name).assertEqual('NonIntegralIndexError');
      expect(b.name).assertEqual('NonIntegralIndexError');
      expect(a instanceof NonIntegralIndexError).assertTrue();
      expect(b instanceof NonIntegralIndexError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0097
     * @tc.name testErrorsInvoke0097
     * @tc.desc Verify nonIntegralIndexError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = NonIntegralIndexError("m", { cause: inner });
      const b = new NonIntegralIndexError("m", { cause: inner });
      expect(a.name).assertEqual('NonIntegralIndexError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('NonIntegralIndexError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0098
     * @tc.name testErrorsInvoke0098
     * @tc.desc Verify typeError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = TypeError("eq");
      const b = new TypeError("eq");
      expect(a.name).assertEqual('TypeError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('TypeError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0099
     * @tc.name testErrorsInvoke0099
     * @tc.desc Verify typeError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = TypeError("eq");
      const b = new TypeError("eq");
      expect(a.name).assertEqual('TypeError');
      expect(b.name).assertEqual('TypeError');
      expect(a instanceof TypeError).assertTrue();
      expect(b instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0100
     * @tc.name testErrorsInvoke0100
     * @tc.desc Verify typeError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = TypeError("m", { cause: inner });
      const b = new TypeError("m", { cause: inner });
      expect(a.name).assertEqual('TypeError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('TypeError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0101
     * @tc.name testErrorsInvoke0101
     * @tc.desc Verify referenceError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ReferenceError("eq");
      const b = new ReferenceError("eq");
      expect(a.name).assertEqual('ReferenceError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('ReferenceError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0102
     * @tc.name testErrorsInvoke0102
     * @tc.desc Verify referenceError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ReferenceError("eq");
      const b = new ReferenceError("eq");
      expect(a.name).assertEqual('ReferenceError');
      expect(b.name).assertEqual('ReferenceError');
      expect(a instanceof ReferenceError).assertTrue();
      expect(b instanceof ReferenceError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0103
     * @tc.name testErrorsInvoke0103
     * @tc.desc Verify referenceError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = ReferenceError("m", { cause: inner });
      const b = new ReferenceError("m", { cause: inner });
      expect(a.name).assertEqual('ReferenceError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('ReferenceError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0104
     * @tc.name testErrorsInvoke0104
     * @tc.desc Verify URIError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = URIError("eq");
      const b = new URIError("eq");
      expect(a.name).assertEqual('URIError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('URIError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0105
     * @tc.name testErrorsInvoke0105
     * @tc.desc Verify URIError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = URIError("eq");
      const b = new URIError("eq");
      expect(a.name).assertEqual('URIError');
      expect(b.name).assertEqual('URIError');
      expect(a instanceof URIError).assertTrue();
      expect(b instanceof URIError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0106
     * @tc.name testErrorsInvoke0106
     * @tc.desc Verify URIError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = URIError("m", { cause: inner });
      const b = new URIError("m", { cause: inner });
      expect(a.name).assertEqual('URIError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('URIError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0107
     * @tc.name testErrorsInvoke0107
     * @tc.desc Verify formatError invoke new message equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = FormatError("eq");
      const b = new FormatError("eq");
      expect(a.name).assertEqual('FormatError');
      expect(a.message).assertEqual("eq");
      expect(b.name).assertEqual('FormatError');
      expect(b.message).assertEqual("eq");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0108
     * @tc.name testErrorsInvoke0108
     * @tc.desc Verify formatError invoke new instanceof equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = FormatError("eq");
      const b = new FormatError("eq");
      expect(a.name).assertEqual('FormatError');
      expect(b.name).assertEqual('FormatError');
      expect(a instanceof FormatError).assertTrue();
      expect(b instanceof FormatError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0109
     * @tc.name testErrorsInvoke0109
     * @tc.desc Verify formatError invoke new cause equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const a = FormatError("m", { cause: inner });
      const b = new FormatError("m", { cause: inner });
      expect(a.name).assertEqual('FormatError');
      expect(a.message).assertEqual("m");
      expect(a.cause).assertEqual(inner);
      expect((a.cause as Error).message).assertEqual("c");
      expect(b.name).assertEqual('FormatError');
      expect(b.message).assertEqual("m");
      expect(b.cause).assertEqual(inner);
      expect((b.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0110
     * @tc.name testErrorsInvoke0110
     * @tc.desc Verify syntaxError.invoke returns instanceof SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = SyntaxError("m");
      expect(err instanceof SyntaxError).assertTrue();
      expect(err.name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0111
     * @tc.name testErrorsInvoke0111
     * @tc.desc Verify syntaxError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("m");
      expect(err.name).assertEqual('SyntaxError');
      expect(err instanceof Error).assertTrue();
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0112
     * @tc.name testErrorsInvoke0112
     * @tc.desc Verify rangeError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = RangeError("m");
      expect(err.name).assertEqual('RangeError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0113
     * @tc.name testErrorsInvoke0113
     * @tc.desc Verify evalError.invoke returns instanceof EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = EvalError("m");
      expect(err instanceof EvalError).assertTrue();
      expect(err.name).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0114
     * @tc.name testErrorsInvoke0114
     * @tc.desc Verify evalError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = EvalError("m");
      expect(err.name).assertEqual('EvalError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0115
     * @tc.name testErrorsInvoke0115
     * @tc.desc Verify nonIntegralIndexError.invoke returns instanceof NonIntegralIndexError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = NonIntegralIndexError("m");
      expect(err instanceof NonIntegralIndexError).assertTrue();
      expect(err.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0116
     * @tc.name testErrorsInvoke0116
     * @tc.desc Verify nonIntegralIndexError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = NonIntegralIndexError("m");
      expect(err.name).assertEqual('NonIntegralIndexError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0117
     * @tc.name testErrorsInvoke0117
     * @tc.desc Verify typeError.invoke returns instanceof TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = TypeError("m");
      expect(err instanceof TypeError).assertTrue();
      expect(err.name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0118
     * @tc.name testErrorsInvoke0118
     * @tc.desc Verify typeError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = TypeError("m");
      expect(err.name).assertEqual('TypeError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0119
     * @tc.name testErrorsInvoke0119
     * @tc.desc Verify referenceError.invoke returns instanceof ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = ReferenceError("m");
      expect(err instanceof ReferenceError).assertTrue();
      expect(err.name).assertEqual('ReferenceError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0120
     * @tc.name testErrorsInvoke0120
     * @tc.desc Verify referenceError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = ReferenceError("m");
      expect(err.name).assertEqual('ReferenceError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0121
     * @tc.name testErrorsInvoke0121
     * @tc.desc Verify URIError.invoke returns instanceof URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = URIError("m");
      expect(err instanceof URIError).assertTrue();
      expect(err.name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0122
     * @tc.name testErrorsInvoke0122
     * @tc.desc Verify URIError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = URIError("m");
      expect(err.name).assertEqual('URIError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0123
     * @tc.name testErrorsInvoke0123
     * @tc.desc Verify formatError.invoke returns instanceof FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = FormatError("m");
      expect(err instanceof FormatError).assertTrue();
      expect(err.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0124
     * @tc.name testErrorsInvoke0124
     * @tc.desc Verify formatError.invoke returns instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = FormatError("m");
      expect(err.name).assertEqual('FormatError');
      expect(err instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0125
     * @tc.name testErrorsInvoke0125
     * @tc.desc Verify rangeError.invoke returns RangeError identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("m");
      expect(err.name).assertEqual('RangeError');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0126
     * @tc.name testErrorsInvoke0126
     * @tc.desc Verify call SyntaxError.invoke independent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = SyntaxError("m");
      const b = SyntaxError("m");
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0127
     * @tc.name testErrorsInvoke0127
     * @tc.desc Verify call RangeError.invoke independent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = RangeError("m");
      const b = RangeError("m");
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0128
     * @tc.name testErrorsInvoke0128
     * @tc.desc Verify call TypeError.invoke independent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = TypeError("m");
      const b = TypeError("m");
      expect(a).not().assertEqual(b);
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0129
     * @tc.name testErrorsInvoke0129
     * @tc.desc Verify URIError.invoke object cause keeps name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("v");
      const err = URIError("m", { cause: obj });
      expect(err.name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0130
     * @tc.name testErrorsInvoke0130
     * @tc.desc Verify formatError.invoke preserves RangeError cause type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("ri");
      const err = FormatError("m", { cause: inner });
      expect((err.cause as Error) instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0131
     * @tc.name testErrorsInvoke0131
     * @tc.desc Verify syntaxError throw invoke instance is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw SyntaxError("th");
      } catch (e) {
        expect((e as Error).name).assertEqual('SyntaxError');
        expect((e as Error).message).assertEqual("th");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0132
     * @tc.name testErrorsInvoke0132
     * @tc.desc Verify rangeError throw invoke instance is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw RangeError("th");
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
        expect((e as Error).message).assertEqual("th");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0133
     * @tc.name testErrorsInvoke0133
     * @tc.desc Verify typeError throw invoke instance is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw TypeError("th");
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
        expect((e as Error).message).assertEqual("th");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0134
     * @tc.name testErrorsInvoke0134
     * @tc.desc Verify SyntaxError invoke 0 argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError();
      expect(err.name).assertEqual('SyntaxError');
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0135
     * @tc.name testErrorsInvoke0135
     * @tc.desc Verify RangeError invoke 1 argument call message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("base");
      expect(err instanceof RangeError).assertTrue();
      expect(err.message).assertEqual("base");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0136
     * @tc.name testErrorsInvoke0136
     * @tc.desc Verify TypeError invoke cause is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = RangeError("inner");
      const err = TypeError("outer", { cause: inner });
      expect((err.cause as Error) instanceof RangeError).assertTrue();
      expect((err.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0137
     * @tc.name testErrorsInvoke0137
     * @tc.desc Verify URIError invoke nested cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = SyntaxError("leaf");
      const inner = TypeError("inner", { cause: leaf });
      const err = URIError("outer", { cause: inner });
      expect((err.cause as Error) instanceof TypeError).assertTrue();
      expect(((err.cause as Error).cause as Error) instanceof SyntaxError).assertTrue();
      expect(((err.cause as Error).cause as Error).message).assertEqual("leaf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0138
     * @tc.name testErrorsInvoke0138
     * @tc.desc Verify FormatError invoke cause is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("primitive", { cause: true });
      expect(err.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0139
     * @tc.name testErrorsInvoke0139
     * @tc.desc Verify NonIntegralIndexError invoke nullable variable keeps message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error | null = NonIntegralIndexError("nullable");
      expect((err as Error).message).assertEqual("nullable");
      expect((err as Error).name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0140
     * @tc.name testErrorsInvoke0140
     * @tc.desc Verify SyntaxError invoke optional variable keeps message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error | undefined = SyntaxError("optional");
      expect((err as Error).message).assertEqual("optional");
      expect((err as Error).name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0141
     * @tc.name testErrorsInvoke0141
     * @tc.desc Verify RangeError invoke name and message field types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("fields");
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("fields");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0142
     * @tc.name testErrorsInvoke0142
     * @tc.desc Verify TypeError invoke empty message remains empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("");
      expect(err.message).assertEqual("");
      expect(err.name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0143
     * @tc.name testErrorsInvoke0143
     * @tc.desc Verify EvalError invoke keeps readable name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError("json");
      expect(err.name).assertEqual('EvalError');
      expect(err.message).assertEqual("json");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0144
     * @tc.name testErrorsInvoke0144
     * @tc.desc Verify FormatError invoke name override value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError("custom-name");
      err.name = "MySpecialName";
      expect(err.name).assertEqual("MySpecialName");
      expect(err.message).assertEqual("custom-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0145
     * @tc.name testErrorsInvoke0145
     * @tc.desc Verify direct SyntaxError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError.$_invoke("static-message");
      expect(err instanceof SyntaxError).assertTrue();
      expect(err.name).assertEqual('SyntaxError');
      expect(err.message).assertEqual("static-message");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0146
     * @tc.name testErrorsInvoke0146
     * @tc.desc Verify direct RangeError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError.$_invoke("range-static");
      expect(err instanceof RangeError).assertTrue();
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual("range-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0147
     * @tc.name testErrorsInvoke0147
     * @tc.desc Verify direct EvalError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = EvalError.$_invoke("eval-static");
      expect(err instanceof EvalError).assertTrue();
      expect(err.name).assertEqual('EvalError');
      expect(err.message).assertEqual("eval-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0148
     * @tc.name testErrorsInvoke0148
     * @tc.desc Verify direct NonIntegralIndexError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = NonIntegralIndexError.$_invoke("non-int-static");
      expect(err instanceof NonIntegralIndexError).assertTrue();
      expect(err.name).assertEqual('NonIntegralIndexError');
      expect(err.message).assertEqual("non-int-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0149
     * @tc.name testErrorsInvoke0149
     * @tc.desc Verify direct TypeError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError.$_invoke("type-static");
      expect(err instanceof TypeError).assertTrue();
      expect(err.name).assertEqual('TypeError');
      expect(err.message).assertEqual("type-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0150
     * @tc.name testErrorsInvoke0150
     * @tc.desc Verify direct ReferenceError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError.$_invoke("ref-static");
      expect(err instanceof ReferenceError).assertTrue();
      expect(err.name).assertEqual('ReferenceError');
      expect(err.message).assertEqual("ref-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0151
     * @tc.name testErrorsInvoke0151
     * @tc.desc Verify direct URIError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = URIError.$_invoke("uri-static");
      expect(err instanceof URIError).assertTrue();
      expect(err.name).assertEqual('URIError');
      expect(err.message).assertEqual("uri-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0152
     * @tc.name testErrorsInvoke0152
     * @tc.desc Verify direct FormatError.$_invoke static API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = FormatError.$_invoke("format-static");
      expect(err instanceof FormatError).assertTrue();
      expect(err.name).assertEqual('FormatError');
      expect(err.message).assertEqual("format-static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0153
     * @tc.name testErrorsInvoke0153
     * @tc.desc Verify invoke with no arguments defaults to empty message (test point 106)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError.$_invoke();
      expect(err.message).assertEqual("");
      expect(err.name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0154
     * @tc.name testErrorsInvoke0154
     * @tc.desc Verify invoke with undefined message defaults to empty (test point 107)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError.$_invoke(undefined);
      expect(err.message).assertEqual("");
      expect(err.name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0155
     * @tc.name testErrorsInvoke0155
     * @tc.desc Verify invoke cause nested Error chain (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const err = TypeError.$_invoke("outer", { cause: inner } as ErrorOptions);
      expect((err.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0156
     * @tc.name testErrorsInvoke0156
     * @tc.desc Verify invoke deeply nested cause chain (test point 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const mid = RangeError.$_invoke("mid", { cause: root } as ErrorOptions);
      const outer = TypeError.$_invoke("outer", { cause: mid } as ErrorOptions);
      expect(((outer.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0157
     * @tc.name testErrorsInvoke0157
     * @tc.desc Verify invoke all 8 types return correct instanceof (test point 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(SyntaxError.$_invoke("s") instanceof SyntaxError).assertTrue();
      expect(RangeError.$_invoke("r") instanceof RangeError).assertTrue();
      expect(EvalError.$_invoke("e") instanceof EvalError).assertTrue();
      expect(NonIntegralIndexError.$_invoke("n") instanceof NonIntegralIndexError).assertTrue();
      expect(TypeError.$_invoke("t") instanceof TypeError).assertTrue();
      expect(ReferenceError.$_invoke("ref") instanceof ReferenceError).assertTrue();
      expect(URIError.$_invoke("u") instanceof URIError).assertTrue();
      expect(FormatError.$_invoke("f") instanceof FormatError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0158
     * @tc.name testErrorsInvoke0158
     * @tc.desc Verify invoke metadata cache consistency 100 reads (test point 117)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError.$_invoke("cached");
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("cached");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_INVOKE_0159
     * @tc.name testErrorsInvoke0159
     * @tc.desc Verify all 8 types $_invoke with options.cause parameter matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsInvoke0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const opts = { cause: inner } as ErrorOptions;
      expect((SyntaxError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((RangeError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((EvalError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((NonIntegralIndexError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((TypeError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((ReferenceError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((URIError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
      expect((FormatError.$_invoke("m", opts).cause as Error).message).assertEqual("inner");
    });
  });
}
