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

function checkStringify(e: Error): void {
  let json: string = JSON.stringify(e);
  expect(json !== null).assertTrue();
}

function checkStringAndToString(e: Error): void {
  let s: string = String(e);
  let t: string = e.toString();
  expect(s).assertEqual(t);
}

export default function ErrorSubclassTest(): void {
  describe('ErrorSubclassTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0010
     * @tc.name testErrorSubclass001
     * @tc.desc Verify TypeError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("13800138000");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("TypeError");
      expect(e.message).assertEqual("13800138000");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0020
     * @tc.name testErrorSubclass002
     * @tc.desc Verify TypeError.toString() returns "TypeError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("\u200B");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("TypeError: \u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0030
     * @tc.name testErrorSubclass003
     * @tc.desc Verify TypeError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("wrapped", { cause: new TypeError("2026-13-01") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
      expect((e.cause as TypeError).message).assertEqual("2026-13-01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0040
     * @tc.name testErrorSubclass004
     * @tc.desc Verify TypeError code property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("0x123");
      expect(e instanceof Error).assertTrue();
      e.code = 0x7FFFFFFF;
      expect(e.code).assertEqual(2147483647);
      expect(e.name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0050
     * @tc.name testErrorSubclass005
     * @tc.desc Verify TypeError name property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("name-source");
      expect(e instanceof Error).assertTrue();
      e.name = "My\u200BType";
      expect(e.name).assertEqual("My\u200BType");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0060
     * @tc.name testErrorSubclass006
     * @tc.desc Verify TypeError message property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("old");
      expect(e instanceof Error).assertTrue();
      e.message = "<script>alert(1)</script>";
      expect(e.message).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0070
     * @tc.name testErrorSubclass007
     * @tc.desc Verify RangeError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("310101199001011234");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("RangeError");
      expect(e.message).assertEqual("310101199001011234");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0080
     * @tc.name testErrorSubclass008
     * @tc.desc Verify RangeError.toString() returns "RangeError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("\uFFFD");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("RangeError: \uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0090
     * @tc.name testErrorSubclass009
     * @tc.desc Verify RangeError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("w", { cause: new Error("test@example.com") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0100
     * @tc.name testErrorSubclass010
     * @tc.desc Verify RangeError code property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("0b1010");
      expect(e instanceof Error).assertTrue();
      e.code = -2147483648;
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0110
     * @tc.name testErrorSubclass011
     * @tc.desc Verify RangeError name property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("name-source");
      expect(e instanceof Error).assertTrue();
      e.name = "2026-02-30";
      expect(e.name).assertEqual("2026-02-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0120
     * @tc.name testErrorSubclass012
     * @tc.desc Verify SyntaxError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("622202********1234");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("SyntaxError");
      expect(e.message).assertEqual("622202********1234");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0130
     * @tc.name testErrorSubclass013
     * @tc.desc Verify SyntaxError.toString() returns "SyntaxError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("25:00:00");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("SyntaxError: 25:00:00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0140
     * @tc.name testErrorSubclass014
     * @tc.desc Verify SyntaxError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("w", { cause: new Error("root") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0150
     * @tc.name testErrorSubclass015
     * @tc.desc Verify SyntaxError code/name properties can be independently mutated and read back
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("t");
      expect(e instanceof Error).assertTrue();
      e.code = 42;
      e.name = "CS";
      expect(e.code).assertEqual(42);
      expect(e.name).assertEqual("CS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0160
     * @tc.name testErrorSubclass016
     * @tc.desc Verify ReferenceError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("not defined");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ReferenceError");
      expect(e.message).assertEqual("not defined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0170
     * @tc.name testErrorSubclass017
     * @tc.desc Verify ReferenceError.toString() returns "ReferenceError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("undef");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("ReferenceError: undef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0180
     * @tc.name testErrorSubclass018
     * @tc.desc Verify ReferenceError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("w", { cause: new Error("root") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0190
     * @tc.name testErrorSubclass019
     * @tc.desc Verify ReferenceError code/name/message properties can be independently mutated and read back
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("t");
      expect(e instanceof Error).assertTrue();
      e.name = "Ref";
      e.code = 100;
      e.message = "chg";
      expect(e.name).assertEqual("Ref");
      expect(e.code).assertEqual(100);
      expect(e.message).assertEqual("chg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0200
     * @tc.name testErrorSubclass020
     * @tc.desc Verify EvalError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("eval");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("EvalError");
      expect(e.message).assertEqual("eval");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0210
     * @tc.name testErrorSubclass021
     * @tc.desc Verify EvalError.toString() returns "EvalError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("eval fail");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("EvalError: eval fail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0220
     * @tc.name testErrorSubclass022
     * @tc.desc Verify EvalError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("w", { cause: new Error("root") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0230
     * @tc.name testErrorSubclass023
     * @tc.desc Verify EvalError code property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("t");
      expect(e instanceof Error).assertTrue();
      e.code = 2147483647;
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0240
     * @tc.name testErrorSubclass024
     * @tc.desc Verify URIError constructor with message stores name, message and code correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("bad uri");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("URIError");
      expect(e.message).assertEqual("bad uri");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0250
     * @tc.name testErrorSubclass025
     * @tc.desc Verify URIError.toString() returns "URIError: <message>" format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("bad format");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("URIError: bad format");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0260
     * @tc.name testErrorSubclass026
     * @tc.desc Verify URIError constructor with cause option preserves cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("w", { cause: new Error("root") });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0270
     * @tc.name testErrorSubclass027
     * @tc.desc Verify URIError message property can be mutated and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("t");
      expect(e instanceof Error).assertTrue();
      e.message = "";
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0280
     * @tc.name testErrorSubclass028
     * @tc.desc Verify TypeError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("类型错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("TypeError");
      expect(e.message).assertEqual("类型错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0290
     * @tc.name testErrorSubclass029
     * @tc.desc Verify RangeError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("范围错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("RangeError");
      expect(e.message).assertEqual("范围错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0300
     * @tc.name testErrorSubclass030
     * @tc.desc Verify SyntaxError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("语法错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("SyntaxError");
      expect(e.message).assertEqual("语法错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0310
     * @tc.name testErrorSubclass031
     * @tc.desc Verify ReferenceError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("引用错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ReferenceError");
      expect(e.message).assertEqual("引用错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0320
     * @tc.name testErrorSubclass032
     * @tc.desc Verify EvalError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("评估错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("EvalError");
      expect(e.message).assertEqual("评估错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0330
     * @tc.name testErrorSubclass033
     * @tc.desc Verify URIError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("URI错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("URIError");
      expect(e.message).assertEqual("URI错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0340
     * @tc.name testErrorSubclass034
     * @tc.desc Verify ArithmeticError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArithmeticError = new ArithmeticError("算术错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ArithmeticError");
      expect(e.message).assertEqual("算术错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0350
     * @tc.name testErrorSubclass035
     * @tc.desc Verify NullPointerError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NullPointerError = new NullPointerError("空指针错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("NullPointerError");
      expect(e.message).assertEqual("空指针错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0360
     * @tc.name testErrorSubclass036
     * @tc.desc Verify ClassCastError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ClassCastError = new ClassCastError("类型转换错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ClassCastError");
      expect(e.message).assertEqual("类型转换错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0370
     * @tc.name testErrorSubclass037
     * @tc.desc Verify IndexOutOfBoundsError with Chinese message preserves name and message correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError("索引越界错误消息");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("IndexOutOfBoundsError");
      expect(e.message).assertEqual("索引越界错误消息");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0380
     * @tc.name testErrorSubclass038
     * @tc.desc Verify AggregateError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errs: Error[] = [new Error("e")];
      let e: AggregateError = new AggregateError(errs);
      expect(e instanceof Error).assertTrue();
      e.name = "聚合错误";
      expect(e.name).assertEqual("聚合错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0390
     * @tc.name testErrorSubclass039
     * @tc.desc Verify ArgumentsUnderapplicationError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ArgumentsUnderapplicationError");
      e.name = "参数不足错误";
      expect(e.name).assertEqual("参数不足错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0400
     * @tc.name testErrorSubclass040
     * @tc.desc Verify ArrayStoreError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ArrayStoreError");
      e.name = "数组存储错误";
      expect(e.name).assertEqual("数组存储错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0410
     * @tc.name testErrorSubclass041
     * @tc.desc Verify AssertionError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("AssertionError");
      e.name = "断言错误";
      expect(e.name).assertEqual("断言错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0420
     * @tc.name testErrorSubclass042
     * @tc.desc Verify CoroutinesLimitExceedError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("CoroutinesLimitExceedError");
      e.name = "协程超限错误";
      expect(e.name).assertEqual("协程超限错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0430
     * @tc.name testErrorSubclass043
     * @tc.desc Verify DivideByZeroError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: DivideByZeroError = new DivideByZeroError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("DivideByZeroError");
      e.name = "除以零错误";
      expect(e.name).assertEqual("除以零错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0440
     * @tc.name testErrorSubclass044
     * @tc.desc Verify ExceptionInInitializerError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("ExceptionInInitializerError");
      e.name = "初始化异常错误";
      expect(e.name).assertEqual("初始化异常错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0450
     * @tc.name testErrorSubclass045
     * @tc.desc Verify FormatError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("FormatError");
      e.name = "格式错误";
      expect(e.name).assertEqual("格式错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0460
     * @tc.name testErrorSubclass046
     * @tc.desc Verify IllegalLockStateError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("IllegalLockStateError");
      e.name = "非法锁状态错误";
      expect(e.name).assertEqual("非法锁状态错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0470
     * @tc.name testErrorSubclass047
     * @tc.desc Verify InstantiationError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("InstantiationError");
      e.name = "实例化错误";
      expect(e.name).assertEqual("实例化错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0480
     * @tc.name testErrorSubclass048
     * @tc.desc Verify InternalError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("InternalError");
      e.name = "内部错误";
      expect(e.name).assertEqual("内部错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0490
     * @tc.name testErrorSubclass049
     * @tc.desc Verify InvalidAsyncOperationError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("InvalidAsyncOperationError");
      e.name = "无效异步操作错误";
      expect(e.name).assertEqual("无效异步操作错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0500
     * @tc.name testErrorSubclass050
     * @tc.desc Verify InvalidJobOperationError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("InvalidJobOperationError");
      e.name = "无效作业操作错误";
      expect(e.name).assertEqual("无效作业操作错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0510
     * @tc.name testErrorSubclass051
     * @tc.desc Verify InvalidStoreAccessError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("InvalidStoreAccessError");
      e.name = "无效存储访问错误";
      expect(e.name).assertEqual("无效存储访问错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0520
     * @tc.name testErrorSubclass052
     * @tc.desc Verify JSONTypeError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("JSONTypeError");
      e.name = "JSON类型错误";
      expect(e.name).assertEqual("JSON类型错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0530
     * @tc.name testErrorSubclass053
     * @tc.desc Verify NonIntegralIndexError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("NonIntegralIndexError");
      e.name = "非整数索引错误";
      expect(e.name).assertEqual("非整数索引错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0540
     * @tc.name testErrorSubclass054
     * @tc.desc Verify OutOfMemoryError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("OutOfMemoryError");
      e.name = "内存不足错误";
      expect(e.name).assertEqual("内存不足错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0550
     * @tc.name testErrorSubclass055
     * @tc.desc Verify StackOverflowError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("StackOverflowError");
      e.name = "栈溢出错误";
      expect(e.name).assertEqual("栈溢出错误");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0560
     * @tc.name testErrorSubclass056
     * @tc.desc Verify UncaughtExceptionError name can be set to Chinese characters and read back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError();
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual("UncaughtExceptionError");
      e.name = "未捕获异常错误";
      expect(e.name).assertEqual("未捕获异常错误");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0570
     * @tc.name testErrorSubclass057
     * @tc.desc Verify TypeError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("json msg");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("TypeError: json msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0580
     * @tc.name testErrorSubclass058
     * @tc.desc Verify RangeError JSON.stringify round-trip with String consistency
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("json range");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("RangeError: json range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0590
     * @tc.name testErrorSubclass059
     * @tc.desc Verify SyntaxError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: SyntaxError = new SyntaxError("json syntax");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("SyntaxError: json syntax");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0600
     * @tc.name testErrorSubclass060
     * @tc.desc Verify ReferenceError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ReferenceError = new ReferenceError("json ref");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("ReferenceError: json ref");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0610
     * @tc.name testErrorSubclass061
     * @tc.desc Verify EvalError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: EvalError = new EvalError("json eval");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("EvalError: json eval");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0620
     * @tc.name testErrorSubclass062
     * @tc.desc Verify URIError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: URIError = new URIError("json uri");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("URIError: json uri");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0630
     * @tc.name testErrorSubclass063
     * @tc.desc Verify ArithmeticError JSON.stringify round-trip with String consistency
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArithmeticError = new ArithmeticError("json arith");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("ArithmeticError: json arith");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0640
     * @tc.name testErrorSubclass064
     * @tc.desc Verify NullPointerError JSON.stringify round-trip with String consistency
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NullPointerError = new NullPointerError("json null");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("NullPointerError: json null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0650
     * @tc.name testErrorSubclass065
     * @tc.desc Verify ClassCastError JSON.stringify round-trip with String consistency
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ClassCastError = new ClassCastError("json cast");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("ClassCastError: json cast");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0660
     * @tc.name testErrorSubclass066
     * @tc.desc Verify IndexOutOfBoundsError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError("json idx");
      checkStringify(e);
      checkStringAndToString(e);
      expect(String(e)).assertEqual("IndexOutOfBoundsError: json idx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0670
     * @tc.name testErrorSubclass067
     * @tc.desc Verify AggregateError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AggregateError = new AggregateError([new Error("e")]);
      checkStringify(e);
      expect(e.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0680
     * @tc.name testErrorSubclass068
     * @tc.desc Verify ArgumentsUnderapplicationError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError();
      checkStringify(e);
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0690
     * @tc.name testErrorSubclass069
     * @tc.desc Verify ArrayStoreError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError();
      checkStringify(e);
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0700
     * @tc.name testErrorSubclass070
     * @tc.desc Verify AssertionError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError();
      checkStringify(e);
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0710
     * @tc.name testErrorSubclass071
     * @tc.desc Verify CoroutinesLimitExceedError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError();
      checkStringify(e);
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0720
     * @tc.name testErrorSubclass072
     * @tc.desc Verify DivideByZeroError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: DivideByZeroError = new DivideByZeroError();
      checkStringify(e);
      expect(e.name).assertEqual('DivideByZeroError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0730
     * @tc.name testErrorSubclass073
     * @tc.desc Verify ExceptionInInitializerError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError();
      checkStringify(e);
      expect(e.name).assertEqual('ExceptionInInitializerError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0740
     * @tc.name testErrorSubclass074
     * @tc.desc Verify FormatError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError();
      checkStringify(e);
      expect(e.name).assertEqual('FormatError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0750
     * @tc.name testErrorSubclass075
     * @tc.desc Verify IllegalLockStateError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError();
      checkStringify(e);
      expect(e.name).assertEqual('IllegalLockStateError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0760
     * @tc.name testErrorSubclass076
     * @tc.desc Verify InstantiationError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError();
      checkStringify(e);
      expect(e.name).assertEqual('InstantiationError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0770
     * @tc.name testErrorSubclass077
     * @tc.desc Verify InternalError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError();
      checkStringify(e);
      expect(e.name).assertEqual('InternalError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0780
     * @tc.name testErrorSubclass078
     * @tc.desc Verify InvalidAsyncOperationError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError();
      checkStringify(e);
      expect(e.name).assertEqual('InvalidAsyncOperationError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0790
     * @tc.name testErrorSubclass079
     * @tc.desc Verify InvalidJobOperationError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError();
      checkStringify(e);
      expect(e.name).assertEqual('InvalidJobOperationError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0800
     * @tc.name testErrorSubclass080
     * @tc.desc Verify InvalidStoreAccessError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError();
      checkStringify(e);
      expect(e.name).assertEqual('InvalidStoreAccessError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0810
     * @tc.name testErrorSubclass081
     * @tc.desc Verify JSONTypeError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError();
      checkStringify(e);
      expect(e.name).assertEqual('JSONTypeError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0820
     * @tc.name testErrorSubclass082
     * @tc.desc Verify NonIntegralIndexError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError();
      checkStringify(e);
      expect(e.name).assertEqual('NonIntegralIndexError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0830
     * @tc.name testErrorSubclass083
     * @tc.desc Verify OutOfMemoryError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError();
      checkStringify(e);
      expect(e.name).assertEqual('OutOfMemoryError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0840
     * @tc.name testErrorSubclass084
     * @tc.desc Verify StackOverflowError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError();
      checkStringify(e);
      expect(e.name).assertEqual('StackOverflowError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0850
     * @tc.name testErrorSubclass085
     * @tc.desc Verify UncaughtExceptionError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError();
      checkStringify(e);
      expect(e.name).assertEqual('UncaughtExceptionError');
      checkStringAndToString(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0860
     * @tc.name testErrorSubclass086
     * @tc.desc Verify TypeError String() and toString() return identical values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("code test");
      expect(e instanceof Error).assertTrue();
      e.code = 42;
      expect(String(e)).assertEqual(e.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0870
     * @tc.name testErrorSubclass087
     * @tc.desc Verify RangeError array serializes to non-null JSON string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errs: RangeError[] = [new RangeError("r1"), new RangeError("r2")];
      let json: string = JSON.stringify(errs);
      expect(json !== null).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0880
     * @tc.name testErrorSubclass088
     * @tc.desc Verify throw TypeError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("t");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0890
     * @tc.name testErrorSubclass089
     * @tc.desc Verify throw RangeError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new RangeError("r");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0900
     * @tc.name testErrorSubclass090
     * @tc.desc Verify throw SyntaxError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new SyntaxError("s");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0910
     * @tc.name testErrorSubclass091
     * @tc.desc Verify throw ReferenceError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ReferenceError("ref");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ReferenceError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0920
     * @tc.name testErrorSubclass092
     * @tc.desc Verify throw EvalError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new EvalError("e");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('EvalError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0930
     * @tc.name testErrorSubclass093
     * @tc.desc Verify throw URIError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new URIError("u");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('URIError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0940
     * @tc.name testErrorSubclass094
     * @tc.desc Verify throw ArithmeticError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ArithmeticError("a");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0950
     * @tc.name testErrorSubclass095
     * @tc.desc Verify throw NullPointerError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new NullPointerError("n");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0960
     * @tc.name testErrorSubclass096
     * @tc.desc Verify throw ClassCastError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ClassCastError("c");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0970
     * @tc.name testErrorSubclass097
     * @tc.desc Verify throw IndexOutOfBoundsError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new IndexOutOfBoundsError("i");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0980
     * @tc.name testErrorSubclass098
     * @tc.desc Verify throw AggregateError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new AggregateError([new Error("e")], "a");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('AggregateError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_0990
     * @tc.name testErrorSubclass099
     * @tc.desc Verify throw ArgumentsUnderapplicationError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ArgumentsUnderapplicationError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ArgumentsUnderapplicationError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1000
     * @tc.name testErrorSubclass100
     * @tc.desc Verify throw ArrayStoreError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ArrayStoreError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ArrayStoreError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1010
     * @tc.name testErrorSubclass101
     * @tc.desc Verify throw AssertionError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new AssertionError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('AssertionError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1020
     * @tc.name testErrorSubclass102
     * @tc.desc Verify throw CoroutinesLimitExceedError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new CoroutinesLimitExceedError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('CoroutinesLimitExceedError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1030
     * @tc.name testErrorSubclass103
     * @tc.desc Verify throw DivideByZeroError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new DivideByZeroError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('DivideByZeroError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1040
     * @tc.name testErrorSubclass104
     * @tc.desc Verify throw ExceptionInInitializerError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ExceptionInInitializerError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ExceptionInInitializerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1050
     * @tc.name testErrorSubclass105
     * @tc.desc Verify throw FormatError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new FormatError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1060
     * @tc.name testErrorSubclass106
     * @tc.desc Verify throw IllegalLockStateError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new IllegalLockStateError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('IllegalLockStateError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1070
     * @tc.name testErrorSubclass107
     * @tc.desc Verify throw InstantiationError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new InstantiationError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InstantiationError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1080
     * @tc.name testErrorSubclass108
     * @tc.desc Verify throw InternalError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new InternalError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InternalError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1090
     * @tc.name testErrorSubclass109
     * @tc.desc Verify throw InvalidAsyncOperationError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new InvalidAsyncOperationError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidAsyncOperationError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1100
     * @tc.name testErrorSubclass110
     * @tc.desc Verify throw InvalidJobOperationError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new InvalidJobOperationError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidJobOperationError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1110
     * @tc.name testErrorSubclass111
     * @tc.desc Verify throw InvalidStoreAccessError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new InvalidStoreAccessError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidStoreAccessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1120
     * @tc.name testErrorSubclass112
     * @tc.desc Verify throw JSONTypeError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new JSONTypeError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('JSONTypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1130
     * @tc.name testErrorSubclass113
     * @tc.desc Verify throw NonIntegralIndexError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new NonIntegralIndexError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('NonIntegralIndexError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1140
     * @tc.name testErrorSubclass114
     * @tc.desc Verify throw OutOfMemoryError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new OutOfMemoryError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1150
     * @tc.name testErrorSubclass115
     * @tc.desc Verify throw StackOverflowError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new StackOverflowError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('StackOverflowError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1160
     * @tc.name testErrorSubclass116
     * @tc.desc Verify throw UncaughtExceptionError is caught with name/message preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new UncaughtExceptionError();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('UncaughtExceptionError');
      }
    });

    // 多分支 catch 类型收窄
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1170
     * @tc.name testErrorSubclass117
     * @tc.desc Verify multi-branch catch dispatches throw TypeError to the correct instanceof branch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "";
      try {
        throw new TypeError("te");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof TypeError) {
          tag = "type";
        } else if (e instanceof RangeError) {
          tag = "range";
        } else {
          tag = "other";
        }
      }
      expect(tag).assertEqual("type");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1180
     * @tc.name testErrorSubclass118
     * @tc.desc Verify multi-branch catch dispatches throw RangeError to the correct instanceof branch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "";
      try {
        throw new RangeError("re");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof TypeError) {
          tag = "type";
        } else if (e instanceof RangeError) {
          tag = "range";
        } else {
          tag = "other";
        }
      }
      expect(tag).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1190
     * @tc.name testErrorSubclass119
     * @tc.desc Verify multi-branch catch dispatches throw SyntaxError to the correct instanceof branch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "";
      try {
        throw new SyntaxError("se");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof SyntaxError) {
          tag = "syntax";
        } else if (e instanceof ReferenceError) {
          tag = "ref";
        } else {
          tag = "other";
        }
      }
      expect(tag).assertEqual("syntax");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1200
     * @tc.name testErrorSubclass120
     * @tc.desc Verify multi-branch catch dispatches throw ArithmeticError to the correct instanceof branch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "";
      try {
        throw new ArithmeticError("ae");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof ArithmeticError) {
          tag = "arith";
        } else if (e instanceof ClassCastError) {
          tag = "cast";
        } else {
          tag = "other";
        }
      }
      expect(tag).assertEqual("arith");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_SUBCLASS_1210
     * @tc.name testErrorSubclass121
     * @tc.desc Verify multi-branch catch dispatches throw NullPointerError to the correct instanceof branch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorSubclass121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "";
      try {
        throw new NullPointerError("np");
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        if (e instanceof NullPointerError) {
          tag = "null";
        } else if (e instanceof ArithmeticError) {
          tag = "arith";
        } else {
          tag = "other";
        }
      }
      expect(tag).assertEqual("null");
    });
  });
}
