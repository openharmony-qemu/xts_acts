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

class InvokeThrowingIterable0111 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    throw new Error("iter-fail");
  }
}

class InvokeCustomError0126 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "InvokeCustomError";
  }
}

class InvokeDeepBaseTypeError0127 extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = "InvokeDeepBaseTypeError";
  }
}

class InvokeDeepLeafTypeError0127 extends InvokeDeepBaseTypeError0127 {
  constructor(message: string) {
    super(message);
    this.name = "InvokeDeepLeafTypeError";
  }
}

export default function ErrorAggregateInvokeTest(): void {
  describe('ErrorAggregateInvokeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0010
     * @tc.name testErrorAggregateInvoke001
     * @tc.desc Verify Error array invoke returns AggregateError with one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0020
     * @tc.name testErrorAggregateInvoke002
     * @tc.desc Verify iterable arity equals 3 with all parameters omitted default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e")];
      const agg = AggregateError.$_invoke(arr, undefined, undefined);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0030
     * @tc.name testErrorAggregateInvoke003
     * @tc.desc Verify errors same reference duplicate - all object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("dup");
      const agg = AggregateError.$_invoke([inner, inner, inner]);
      expect(agg.errors[0]).assertEqual(agg.errors[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0040
     * @tc.name testErrorAggregateInvoke004
     * @tc.desc Verify errors length equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(new Error("e"));
      }
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0050
     * @tc.name testErrorAggregateInvoke005
     * @tc.desc Verify errors contains all error subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s"),
        new ReferenceError("ref"), new URIError("u"), new EvalError("e")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
      expect(agg.errors[3] instanceof ReferenceError).assertTrue();
      expect(agg.errors[4] instanceof URIError).assertTrue();
      expect(agg.errors[5] instanceof EvalError).assertTrue();
      expect(agg.errors[5].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0060
     * @tc.name testErrorAggregateInvoke006
     * @tc.desc Verify errors contains nested AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("inner")]);
      const outer = AggregateError.$_invoke([inner]);
      expect(outer.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0070
     * @tc.name testErrorAggregateInvoke007
     * @tc.desc Verify errors contains all invoke subtypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new SyntaxError("a"), new RangeError("b"), new EvalError("c"), new NonIntegralIndexError("d"),
        new TypeError("e"), new ReferenceError("f"), new URIError("g"), new FormatError("h")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0080
     * @tc.name testErrorAggregateInvoke008
     * @tc.desc Verify errors equals [] with phone string message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "13800138000");
      expect(agg.message).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0090
     * @tc.name testErrorAggregateInvoke009
     * @tc.desc Verify errors element unicode message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("\u4e2d\u6587");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message).assertEqual("\u4e2d\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0100
     * @tc.name testErrorAggregateInvoke010
     * @tc.desc Verify errors element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("2026-13-01");
      const inner = new Error("cause-holder", { cause: cause } as ErrorOptions);
      const agg = AggregateError.$_invoke([inner]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("2026-13-01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0110
     * @tc.name testErrorAggregateInvoke011
     * @tc.desc Verify errors contains RangeError derived subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new NegativeArraySizeError("n"), new ArrayIndexOutOfBoundsError("a"),
        new IndexOutOfBoundsError("i"), new StringIndexOutOfBoundsError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof RangeError).assertTrue();
      expect(agg.errors[2] instanceof RangeError).assertTrue();
      expect(agg.errors[3] instanceof RangeError).assertTrue();
      expect(agg.errors[3].name).assertEqual('StringIndexOutOfBoundsError');
      expect(agg.errors[0].message).assertEqual("n");
      expect(agg.errors[1].message).assertEqual("a");
      expect(agg.errors[2].message).assertEqual("i");
      expect(agg.errors[3].message).assertEqual("s");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0120
     * @tc.name testErrorAggregateInvoke012
     * @tc.desc Verify errors contains AssertionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new AssertionError("a")]);
      expect(agg.errors[0].name).assertEqual('AssertionError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0130
     * @tc.name testErrorAggregateInvoke013
     * @tc.desc Verify errors contains NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new NullPointerError("n")]);
      expect(agg.errors[0].name).assertEqual('NullPointerError');
      expect(agg.errors[0].message).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0140
     * @tc.name testErrorAggregateInvoke014
     * @tc.desc Verify errors contains DivideByZeroError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new DivideByZeroError("d")]);
      expect(agg.errors[0].name).assertEqual('DivideByZeroError');
      expect(agg.errors[0].message).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0150
     * @tc.name testErrorAggregateInvoke015
     * @tc.desc Verify errors contains ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ClassCastError("c")]);
      expect(agg.errors[0].name).assertEqual('ClassCastError');
      expect(agg.errors[0].message).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0160
     * @tc.name testErrorAggregateInvoke016
     * @tc.desc Verify errors contains ArithmeticError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ArithmeticError("a")]);
      expect(agg.errors[0].name).assertEqual('ArithmeticError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0170
     * @tc.name testErrorAggregateInvoke017
     * @tc.desc Verify errors equals Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0180
     * @tc.name testErrorAggregateInvoke018
     * @tc.desc Verify errors equals multiple elements Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0190
     * @tc.name testErrorAggregateInvoke019
     * @tc.desc Verify set contains mixed subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new RangeError("r"));
      s.add(new TypeError("t"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0200
     * @tc.name testErrorAggregateInvoke020
     * @tc.desc Verify set element order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const first = new Error("\r\n");
      const second = new Error("second");
      s.add(first);
      s.add(second);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("\r\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0210
     * @tc.name testErrorAggregateInvoke021
     * @tc.desc Verify set element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("first"));
      s.add(new Error("\u0000"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[1].message).assertEqual("\u0000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0220
     * @tc.name testErrorAggregateInvoke022
     * @tc.desc Verify iterable single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      const only = new Error("only");
      source.add(only);
      const agg = AggregateError.$_invoke(source);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(only);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0230
     * @tc.name testErrorAggregateInvoke023
     * @tc.desc Verify iterable multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      source.add(new Error("x"));
      source.add(new Error("\uFFFD"));
      source.add(new Error("z"));
      const agg = AggregateError.$_invoke(source);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].message).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0240
     * @tc.name testErrorAggregateInvoke024
     * @tc.desc Verify iterable custom iterator with no elements returns empty errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Map<string, Error>();
      const agg = AggregateError.$_invoke(source.values(), "0x123");
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("0x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0250
     * @tc.name testErrorAggregateInvoke025
     * @tc.desc Verify set element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("\t"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0260
     * @tc.name testErrorAggregateInvoke026
     * @tc.desc Verify set equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      for (let i = 0; i < 10; i++) {
        s.add(new Error("e" + i.toString()));
      }
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0270
     * @tc.name testErrorAggregateInvoke027
     * @tc.desc Verify set contains AggregateError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(AggregateError.$_invoke([new Error("nested")]));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0280
     * @tc.name testErrorAggregateInvoke028
     * @tc.desc Verify set same reference preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const same = new Error("same");
      s.add(same);
      s.add(same);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0290
     * @tc.name testErrorAggregateInvoke029
     * @tc.desc Verify message equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "");
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0300
     * @tc.name testErrorAggregateInvoke030
     * @tc.desc Verify message equals undefined default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0310
     * @tc.name testErrorAggregateInvoke031
     * @tc.desc Verify message length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "a");
      expect(agg.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0320
     * @tc.name testErrorAggregateInvoke032
     * @tc.desc Verify message length equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(1000);
      const agg = AggregateError.$_invoke([new Error("e")], m);
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0330
     * @tc.name testErrorAggregateInvoke033
     * @tc.desc Verify message containstemplate string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = 5;
      const agg = AggregateError.$_invoke([new Error("e")], `value=${v}`);
      expect(agg.message).assertEqual("value=5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0340
     * @tc.name testErrorAggregateInvoke034
     * @tc.desc Verify iterable Error[] equivalent - errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a"), new Error("b")];
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      const aggArr = AggregateError.$_invoke(arr);
      const aggSet = AggregateError.$_invoke(s);
      expect(aggArr.errors.length).assertEqual(2);
      expect(aggSet.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0350
     * @tc.name testErrorAggregateInvoke035
     * @tc.desc Verify iterable Error[] equivalent - type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const s = new Set<Error>();
      s.add(new Error("a"));
      const aggArr = AggregateError.$_invoke(arr);
      const aggSet = AggregateError.$_invoke(s);
      expect(aggArr.name).assertEqual('AggregateError');
      expect(aggSet.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0360
     * @tc.name testErrorAggregateInvoke036
     * @tc.desc Verify error[] overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0370
     * @tc.name testErrorAggregateInvoke037
     * @tc.desc Verify iterable overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("e"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0380
     * @tc.name testErrorAggregateInvoke038
     * @tc.desc Verify array push instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      src.push(new Error("b"));
      src.push(new Error("c"));
      src.push(new Error("d"));
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0390
     * @tc.name testErrorAggregateInvoke039
     * @tc.desc Verify array pop does not affect instance errors length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b")];
      const agg = AggregateError.$_invoke(src);
      src.pop();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0400
     * @tc.name testErrorAggregateInvoke040
     * @tc.desc Verify array instance.errors preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      const agg = AggregateError.$_invoke(src);
      src.length = 0;
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0410
     * @tc.name testErrorAggregateInvoke041
     * @tc.desc Verify source Set element instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      const agg = AggregateError.$_invoke(s);
      s.add(new Error("b"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0420
     * @tc.name testErrorAggregateInvoke042
     * @tc.desc Verify source Set instance.errors is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      const agg = AggregateError.$_invoke(s);
      s.clear();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0430
     * @tc.name testErrorAggregateInvoke043
     * @tc.desc Verify source Set delete instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const e = new Error("a");
      s.add(e);
      const agg = AggregateError.$_invoke(s);
      s.delete(e);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0440
     * @tc.name testErrorAggregateInvoke044
     * @tc.desc Verify instance.errors array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      src.push(new Error("x"));
      expect(agg.errors.length).assertEqual(1);
      expect(src.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(src[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0450
     * @tc.name testErrorAggregateInvoke045
     * @tc.desc Verify Map values iterable copy independence with static string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Map<string, Error>();
      source.set("310101199001011234", new Error("id-card-key"));
      source.set("622202********1234", new Error("bank-card-key"));
      const agg = AggregateError.$_invoke(source.values());
      source.set("2026-02-30", new Error("date-key"));
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[1].message).assertEqual("bank-card-key");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0460
     * @tc.name testErrorAggregateInvoke046
     * @tc.desc Verify mutation instance.errors array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      agg.errors.push(new Error("x"));
      expect(src.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0470
     * @tc.name testErrorAggregateInvoke047
     * @tc.desc Verify return value errors typeisarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(Array.isArray(agg.errors)).assertTrue();
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0480
     * @tc.name testErrorAggregateInvoke048
     * @tc.desc Verify return value errors[0] instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.errors[0] instanceof Error).assertTrue();
      expect(agg.errors[0].name).assertEqual('Error');
      expect(agg.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0490
     * @tc.name testErrorAggregateInvoke049
     * @tc.desc Verify return value message default empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0500
     * @tc.name testErrorAggregateInvoke050
     * @tc.desc Verify return value errors.length equals 5 multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a"), new Error("b"), new Error("c"), new Error("d"), new Error("e")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0510
     * @tc.name testErrorAggregateInvoke051
     * @tc.desc Verify return value errors[i] order is preserved first item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("first"), new Error("second")]);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0520
     * @tc.name testErrorAggregateInvoke052
     * @tc.desc Verify return value errors iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      let count = 0;
      for (let i = 0; i < agg.errors.length; i++) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0530
     * @tc.name testErrorAggregateInvoke053
     * @tc.desc Verify return value cause default attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0540
     * @tc.name testErrorAggregateInvoke054
     * @tc.desc Verify invoke preserves explicit Error cause reference with email message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("test@example.com");
      const agg = AggregateError.$_invoke([new Error("leaf\uFFFD")],
        "123.45e6", { cause: c } as ErrorOptions);
      expect(agg.cause).assertEqual(c);
      expect((agg.cause as Error).message).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0550
     * @tc.name testErrorAggregateInvoke055
     * @tc.desc Verify call returns instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")]);
      const b = AggregateError.$_invoke([new Error("e")]);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0560
     * @tc.name testErrorAggregateInvoke056
     * @tc.desc Verify nested AggregateError errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("nest")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors[0].message).assertEqual("nest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0570
     * @tc.name testErrorAggregateInvoke057
     * @tc.desc Verify nested cause chain preserves inner message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l1 = new Error("\u200B");
      const l2 = new Error("2026-02-30", { cause: l1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([new Error("<script>alert(1)</script>")], "nested-static-cause",
        { cause: l2 } as ErrorOptions);
      expect(((agg.cause as Error).cause as Error).message).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0580
     * @tc.name testErrorAggregateInvoke058
     * @tc.desc Verify duplicate reference elements preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("dup");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0590
     * @tc.name testErrorAggregateInvoke059
     * @tc.desc Verify message equals + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "", { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0600
     * @tc.name testErrorAggregateInvoke060
     * @tc.desc Verify message equals emoji escape + options.cause equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("\uFFFD")], "\uD83D\uDE00", { cause: 7 } as ErrorOptions);
      expect(agg.message).assertEqual("\uD83D\uDE00");
      expect(agg.cause).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0610
     * @tc.name testErrorAggregateInvoke061
     * @tc.desc Verify message equals + options.cause equals boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = false;
      const agg = AggregateError.$_invoke([new Error("e")], "flag", { cause: cause } as ErrorOptions);
      expect(agg.message).assertEqual("flag");
      expect(agg.cause as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0620
     * @tc.name testErrorAggregateInvoke062
     * @tc.desc Verify message equals undefined + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined, { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0630
     * @tc.name testErrorAggregateInvoke063
     * @tc.desc Verify whitespace message with Date cause keeps object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Date(0);
      const agg = AggregateError.$_invoke([new Error(" ")], " ", { cause: obj } as ErrorOptions);
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Date).getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0640
     * @tc.name testErrorAggregateInvoke064
     * @tc.desc Verify message equals zero width space + options.cause equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("id\u200Bhidden")], "\u200B", { cause: Number.NaN } as ErrorOptions);
      expect(agg.message).assertEqual("\u200B");
      expect(agg.cause as number).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0650
     * @tc.name testErrorAggregateInvoke065
     * @tc.desc Verify errors[0] constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ref");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0]).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0660
     * @tc.name testErrorAggregateInvoke066
     * @tc.desc Verify errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0670
     * @tc.name testErrorAggregateInvoke067
     * @tc.desc Verify nested instance errors independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      expect(a1.errors[0].message).not().assertEqual(a2.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0680
     * @tc.name testErrorAggregateInvoke068
     * @tc.desc Verify instance do not affect each other push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      a1.errors.push(new Error("extra"));
      expect(a2.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0690
     * @tc.name testErrorAggregateInvoke069
     * @tc.desc Verify error[] contains message element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(10000);
      const inner = new Error(m);
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0700
     * @tc.name testErrorAggregateInvoke070
     * @tc.desc Verify type order is preserved - first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[0].name).assertEqual('RangeError');
      expect(agg.errors[0].message).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0710
     * @tc.name testErrorAggregateInvoke071
     * @tc.desc Verify type order is preserved - second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("first"), new TypeError("type-middle"), new SyntaxError("last")]);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0720
     * @tc.name testErrorAggregateInvoke072
     * @tc.desc Verify type order is preserved - third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const syntax = new SyntaxError("syntax-tail");
      const agg = AggregateError.$_invoke([new RangeError("range-head"), new TypeError("type-mid"), syntax]);
      expect(agg.errors[2]).assertEqual(syntax);
      expect(agg.errors[2].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0730
     * @tc.name testErrorAggregateInvoke073
     * @tc.desc Verify set element is RangeError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new ArrayIndexOutOfBoundsError("a"));
      s.add(new IndexOutOfBoundsError("i"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].name).assertEqual('ArrayIndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0740
     * @tc.name testErrorAggregateInvoke074
     * @tc.desc Verify nested AggregateError errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0750
     * @tc.name testErrorAggregateInvoke075
     * @tc.desc Verify aggregateError nested is cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("c-inner")]);
      const outer = AggregateError.$_invoke([new Error("e")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).errors[0].message).assertEqual("c-inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0760
     * @tc.name testErrorAggregateInvoke076
     * @tc.desc Verify errors equals [] message+cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "<script>alert(1)</script>", { cause: 1 } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0770
     * @tc.name testErrorAggregateInvoke077
     * @tc.desc Verify errors equals [] with Set cause content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Set<string>();
      cause.add("test@example.com");
      const agg = AggregateError.$_invoke([], "0b1010", { cause: cause } as ErrorOptions);
      expect((agg.cause as Set<string>).has("test@example.com")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0780
     * @tc.name testErrorAggregateInvoke078
     * @tc.desc Verify errors equals [] message+cause - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "2026-02-30", { cause: 1 } as ErrorOptions);
      expect(agg.message).assertEqual("2026-02-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0790
     * @tc.name testErrorAggregateInvoke079
     * @tc.desc Verify high frequency call 50 instance independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last = AggregateError.$_invoke([new Error("a")]);
      for (let i = 0; i < 49; i++) {
        last = AggregateError.$_invoke([new Error("a")]);
      }
      expect(last.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0800
     * @tc.name testErrorAggregateInvoke080
     * @tc.desc Verify high frequency call instanceof AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 20; i++) {
        const a = AggregateError.$_invoke([new Error("e")]);
        expect(a instanceof AggregateError).assertTrue();
        expect(a.name).assertEqual('AggregateError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0810
     * @tc.name testErrorAggregateInvoke081
     * @tc.desc Verify errors elementis message Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("")]);
      expect(agg.errors[0].message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0820
     * @tc.name testErrorAggregateInvoke082
     * @tc.desc Verify single element Set single element Array equivalent errors[0].message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("eq"));
      const aSet = AggregateError.$_invoke(s);
      const aArr = AggregateError.$_invoke([new Error("eq")]);
      expect(aSet.errors[0].message).assertEqual(aArr.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0830
     * @tc.name testErrorAggregateInvoke083
     * @tc.desc Verify set array errors.length equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      let arr: Error[] = [];
      for (let i = 0; i < 50; i++) {
        s.add(new Error("e" + i.toString()));
        arr.push(new Error("e" + i.toString()));
      }
      const aSet = AggregateError.$_invoke(s);
      const aArr = AggregateError.$_invoke(arr);
      expect(aSet.errors.length).assertEqual(50);
      expect(aArr.errors.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0840
     * @tc.name testErrorAggregateInvoke084
     * @tc.desc Verify errors contains all error subtypes via $_invoke matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new InternalError("i"), new OutOfMemoryError("o"), new StackOverflowError("s"), new InstantiationError("in"),
          new IndexOutOfBoundsError("io"), new StringIndexOutOfBoundsError("si"), new ClassCastError("cc"),
          new ArrayStoreError("as"), new ExceptionInInitializerError("ei"), new CoroutinesLimitExceedError("cl"),
          new IllegalLockStateError("il"), new InvalidJobOperationError("ij"), new ArgumentsUnderapplicationError("au"),
          new InvalidStoreAccessError("isa")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(14);
      expect(agg.errors[0].name).assertEqual("InternalError");
      expect(agg.errors[0].message).assertEqual("i");
      expect(agg.errors[6].name).assertEqual("ClassCastError");
      expect(agg.errors[6].message).assertEqual("cc");
      expect(agg.errors[13].name).assertEqual("InvalidStoreAccessError");
      expect(agg.errors[13].message).assertEqual("isa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0850
     * @tc.name testErrorAggregateInvoke085
     * @tc.desc Verify many subtype mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new InternalError("i"), new ArithmeticError("a"), new FormatError("f"), new ClassCastError("c")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0860
     * @tc.name testErrorAggregateInvoke086
     * @tc.desc Verify errors element cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level1 = new Error("L1");
      const level2 = new Error("L2", { cause: level1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([level2]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("L1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0870
     * @tc.name testErrorAggregateInvoke087
     * @tc.desc Verify errors duplicate element errors[0] equals errors[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("same");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors[0]).assertEqual(agg.errors[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0880
     * @tc.name testErrorAggregateInvoke088
     * @tc.desc Verify instance independent - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "m", { cause: 1 } as ErrorOptions);
      const b = AggregateError.$_invoke([new Error("e")], "m", { cause: 2 } as ErrorOptions);
      expect(a.cause).not().assertEqual(b.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0890
     * @tc.name testErrorAggregateInvoke089
     * @tc.desc Verify instance independent - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "A");
      const b = AggregateError.$_invoke([new Error("e")], "B");
      expect(a.message).not().assertEqual(b.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0900
     * @tc.name testErrorAggregateInvoke090
     * @tc.desc Verify errors arrayiterationorder constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("1"), new Error("2"), new Error("3")]);
      let collected: string[] = [];
      for (const e of agg.errors) {
        collected.push((e as Error).message);
      }
      expect(collected[0]).assertEqual("1");
      expect(collected[1]).assertEqual("2");
      expect(collected[2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0910
     * @tc.name testErrorAggregateInvoke091
     * @tc.desc Verify aggregateError Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      const plain = new Error("e");
      expect(agg).not().assertEqual(plain);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0920
     * @tc.name testErrorAggregateInvoke092
     * @tc.desc Verify errors element instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[0] instanceof Error).assertTrue();
      expect(agg.errors[1] instanceof Error).assertTrue();
      expect(agg.errors[2] instanceof Error).assertTrue();
      expect(agg.errors[0].name).assertEqual('RangeError');
      expect(agg.errors[1].name).assertEqual('TypeError');
      expect(agg.errors[2].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0930
     * @tc.name testErrorAggregateInvoke093
     * @tc.desc Verify cause is AggregateError errors accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = AggregateError.$_invoke([new Error("c-inner")]);
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect((agg.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0940
     * @tc.name testErrorAggregateInvoke094
     * @tc.desc Verify set element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const cause = new Error("c");
      s.add(new Error("e", { cause: cause } as ErrorOptions));
      const agg = AggregateError.$_invoke(s);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0950
     * @tc.name testErrorAggregateInvoke095
     * @tc.desc Verify Map values iterable order with static string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("test@example.com", new Error("email-first"));
      map.set("310101199001011234", new Error("id-card-second"));
      const agg = AggregateError.$_invoke(map.values());
      expect(agg.errors[0].message).assertEqual("email-first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0960
     * @tc.name testErrorAggregateInvoke096
     * @tc.desc Verify iterable orderlast item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("p1"));
      set.add(new Error("p2"));
      const agg = AggregateError.$_invoke(set);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[1].message).assertEqual("p2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0970
     * @tc.name testErrorAggregateInvoke097
     * @tc.desc Verify errors length passed in Set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(s.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0980
     * @tc.name testErrorAggregateInvoke098
     * @tc.desc Verify object cause preserves reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new RangeError("object-cause");
      const agg = AggregateError.$_invoke([new Error("leaf")], "<script>alert(1)</script>",
        { cause: obj } as ErrorOptions);
      expect(agg.message).assertEqual("<script>alert(1)</script>");
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Error).name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0990
     * @tc.name testErrorAggregateInvoke099
     * @tc.desc Verify errors element name preserve RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1000
     * @tc.name testErrorAggregateInvoke100
     * @tc.desc Verify errors element name preserve TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1010
     * @tc.name testErrorAggregateInvoke101
     * @tc.desc Verify errors element name preserve SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new SyntaxError("s")]);
      expect(agg.errors[0].name).assertEqual("SyntaxError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1020
     * @tc.name testErrorAggregateInvoke102
     * @tc.desc Verify errors element name preserve ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ReferenceError("r")]);
      expect(agg.errors[0].name).assertEqual("ReferenceError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1030
     * @tc.name testErrorAggregateInvoke103
     * @tc.desc Verify errors element name preserve URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")]);
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1040
     * @tc.name testErrorAggregateInvoke104
     * @tc.desc Verify errors element name preserve EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new EvalError("e")]);
      expect(agg.errors[0].name).assertEqual("EvalError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1050
     * @tc.name testErrorAggregateInvoke105
     * @tc.desc Verify invoke new errors[0].name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new RangeError("r")]);
      const b = AggregateError.$_invoke([new RangeError("r")]);
      expect(a.errors[0].name).assertEqual('RangeError');
      expect(a.errors[0].name).assertEqual(b.errors[0].name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1060
     * @tc.name testErrorAggregateInvoke106
     * @tc.desc Verify errors mutation instance constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const a = AggregateError.$_invoke(arr);
      a.errors.push(new Error("x"));
      const b = AggregateError.$_invoke(arr);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1070
     * @tc.name testErrorAggregateInvoke107
     * @tc.desc Verify callorder equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const b = AggregateError.$_invoke(arr);
      const a = AggregateError.$_invoke(arr);
      expect(a.errors.length).assertEqual(1);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1080
     * @tc.name testErrorAggregateInvoke108
     * @tc.desc Verify cause is RangeError instanceof Error is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RangeError("r");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: r } as ErrorOptions);
      expect(agg.cause instanceof Error).assertTrue();
      expect((agg.cause as Error).name).assertEqual('RangeError');
      expect((agg.cause as Error).message).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1090
     * @tc.name testErrorAggregateInvoke109
     * @tc.desc Verify aggregateError invoke returns one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outerAgg = AggregateError.$_invoke([new Error("e")]);
      expect(outerAgg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1100
     * @tc.name testErrorAggregateInvoke110
     * @tc.desc Verify iterable iterator throws pass through in invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(new InvokeThrowingIterable0111());
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual("iter-fail");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1110
     * @tc.name testErrorAggregateInvoke111
     * @tc.desc Verify errors property keeps value and enumerable key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("descriptor")], "msg");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("descriptor");
      const keys = Object.keys(agg);
      expect(keys[0]).assertEqual('errors');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1120
     * @tc.name testErrorAggregateInvoke112
     * @tc.desc Verify AggregateError fields remain readable RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")], "read-only\tstate");
      expect(agg.message).assertEqual("read-only\tstate");
      expect(agg.errors[0].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1130
     * @tc.name testErrorAggregateInvoke113
     * @tc.desc Verify AggregateError errors array remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")], "\u4e2d\u6587");
      expect(agg.message).assertEqual("\u4e2d\u6587");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1140
     * @tc.name testErrorAggregateInvoke114
     * @tc.desc Verify AggregateError fields remain readable URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")], "25:00:00");
      expect(agg.message).assertEqual("25:00:00");
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1150
     * @tc.name testErrorAggregateInvoke115
     * @tc.desc Verify AggregateError invoke keeps readable errors and Map cause fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Map<string, string>();
      cause.set("phone", "13800138000");
      const agg =
        AggregateError.$_invoke([new Error("json\uFFFD")], "json-msg", { cause: cause } as ErrorOptions);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("json\uFFFD");
      expect((agg.cause as Map<string, string>).get("phone")).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1160
     * @tc.name testErrorAggregateInvoke116
     * @tc.desc Verify nested AggregateError cause and errors remain aligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf\u200B");
      const inner = AggregateError.$_invoke([leaf], "2026-13-01");
      const outer = AggregateError.$_invoke([inner, new TypeError("type")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).message).assertEqual("2026-13-01");
      expect(((outer.errors[0] as AggregateError).errors[0] as RangeError).message).assertEqual("leaf\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1170
     * @tc.name testErrorAggregateInvoke117
     * @tc.desc Verify repeated reads of AggregateError fields are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("stable\u4e2d")], "line\nbreak",
        { cause: new TypeError("2026-13-01") } as ErrorOptions);
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("line\nbreak");
      expect(agg.errors[0].message).assertEqual("stable\u4e2d");
      expect(agg.errors.length).assertEqual(1);
      expect((agg.cause as TypeError).name).assertEqual("TypeError");
      expect((agg.cause as TypeError).message).assertEqual("2026-13-01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1180
     * @tc.name testErrorAggregateInvoke118
     * @tc.desc Verify message write is isolated from errors field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a")], "keyword");
      agg.message = "keywordValue";
      expect(agg.message).assertEqual("keywordValue");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1190
     * @tc.name testErrorAggregateInvoke119
     * @tc.desc Verify copied errors array does not track source array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      let source: Error[] = [first];
      const agg = AggregateError.$_invoke(source, "copy");
      source[0] = new Error("second");
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1200
     * @tc.name testErrorAggregateInvoke120
     * @tc.desc Verify nested AggregateError layered type via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new Error("leaf");
      const mid = AggregateError.$_invoke([leaf], "mid");
      const outer = AggregateError.$_invoke([mid], "outer");
      expect(outer.errors[0].name).assertEqual('AggregateError');
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1210
     * @tc.name testErrorAggregateInvoke121
     * @tc.desc Verify multi-type mixed array via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        AggregateError.$_invoke([new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[1].name).assertEqual('RangeError');
      expect(agg.errors[3].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1220
     * @tc.name testErrorAggregateInvoke122
     * @tc.desc Verify very long message 100000 chars via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "y".repeat(100000);
      const agg = AggregateError.$_invoke([new Error("e")], longMsg);
      expect(agg.message.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1230
     * @tc.name testErrorAggregateInvoke123
     * @tc.desc Verify cause as AggregateError via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAgg = AggregateError.$_invoke([new RangeError("\uFFFD")], "inner");
      const outer = AggregateError.$_invoke([new Error("outer\u200Bleaf")], "outer",
        { cause: innerAgg } as ErrorOptions);
      expect((outer.cause as AggregateError).name).assertEqual('AggregateError');
      expect((outer.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1240
     * @tc.name testErrorAggregateInvoke124
     * @tc.desc Verify errors array all standard subtypes via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("ev"), new AssertionError("a")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
      expect(agg.errors[7].name).assertEqual('AssertionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1250
     * @tc.name testErrorAggregateInvoke125
     * @tc.desc Verify custom Error subclass element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError0126("custom");
      const agg = AggregateError.$_invoke([custom], "custom-msg");
      expect(agg.errors[0]).assertEqual(custom);
      expect(agg.errors[0].name).assertEqual("InvokeCustomError");
      expect(agg.errors[0].message).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1260
     * @tc.name testErrorAggregateInvoke126
     * @tc.desc Verify deep TypeError subclass element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new InvokeDeepLeafTypeError0127("leaf");
      const agg = AggregateError.$_invoke([leaf]);
      expect(agg.errors[0]).assertEqual(leaf);
      expect(agg.errors[0] instanceof TypeError).assertTrue();
      expect(agg.errors[0].name).assertEqual('InvokeDeepLeafTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1270
     * @tc.name testErrorAggregateInvoke127
     * @tc.desc Verify Map values Iterable order via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const first = new RangeError("first");
      const second = new TypeError("second");
      map.set("2026-02-30", first);
      map.set("0b1010", second);
      const agg = AggregateError.$_invoke(map.values());
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1280
     * @tc.name testErrorAggregateInvoke128
     * @tc.desc Verify Set TypeError Iterable element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      const first = new TypeError("one");
      const second = new InvokeDeepLeafTypeError0127("two");
      set.add(first);
      set.add(second);
      const agg = AggregateError.$_invoke(set);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].name).assertEqual("TypeError");
      expect(agg.errors[1].name).assertEqual("InvokeDeepLeafTypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1290
     * @tc.name testErrorAggregateInvoke129
     * @tc.desc Verify nested AggregateError and custom element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError0126("custom");
      const inner = AggregateError.$_invoke([custom], "inner");
      const outer = AggregateError.$_invoke([inner, new RangeError("range")], "outer");
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(custom);
      expect(outer.errors[1].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1300
     * @tc.name testErrorAggregateInvoke130
     * @tc.desc Verify mixed native and custom errors via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e"), new InvokeCustomError0126("custom"), new InvokeDeepLeafTypeError0127("leaf")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].name).assertEqual("InvokeCustomError");
      expect(agg.errors[2].name).assertEqual('InvokeDeepLeafTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1310
     * @tc.name testErrorAggregateInvoke131
     * @tc.desc Verify cause Error reference remains independent from errors via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new InvokeCustomError0126("2026-02-30");
      const element = new Error("element\u200Bhidden");
      const agg = AggregateError.$_invoke([element], "with-cause", { cause: cause } as ErrorOptions);
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error).name).assertEqual("InvokeCustomError");
      expect(agg.errors[0]).assertEqual(element);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1320
     * @tc.name testErrorAggregateInvoke132
     * @tc.desc Verify errors array source replacement isolation via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      const second = new Error("second");
      let source: Error[] = [first, second];
      const agg = AggregateError.$_invoke(source);
      source[1] = new RangeError("changed");
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1330
     * @tc.name testErrorAggregateInvoke133
     * @tc.desc Verify errors array self mutation does not affect source via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("source")];
      const agg = AggregateError.$_invoke(source);
      agg.errors[0] = new TypeError("mutated");
      expect(source.length).assertEqual(1);
      expect(source[0].message).assertEqual("source");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1340
     * @tc.name testErrorAggregateInvoke134
     * @tc.desc Verify errors array stores large element messages via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "z".repeat(200000);
      const agg = AggregateError.$_invoke([new Error(longMsg)], "outer");
      expect(agg.errors[0].message.length).assertEqual(200000);
      expect(agg.message).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1350
     * @tc.name testErrorAggregateInvoke135
     * @tc.desc Verify map values Iterable copy isolation via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("test@example.com", new Error("email-first"));
      map.set("622202********1234", new Error("bank-card-second"));
      const agg = AggregateError.$_invoke(map.values());
      map.set("2026-02-30", new Error("date-third"));
      map.set("test@example.com", new Error("changed"));
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("email-first");
      expect(agg.errors[1].message).assertEqual("bank-card-second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1360
     * @tc.name testErrorAggregateInvoke136
     * @tc.desc Verify empty Map values Iterable with message and cause via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const cause = new RangeError("cause\u200Bhidden");
      const agg = AggregateError.$_invoke(map.values(), "empty-map", { cause: cause } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("empty-map");
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1370
     * @tc.name testErrorAggregateInvoke137
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(null as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1380
     * @tc.name testErrorAggregateInvoke138
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(undefined as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}
