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
