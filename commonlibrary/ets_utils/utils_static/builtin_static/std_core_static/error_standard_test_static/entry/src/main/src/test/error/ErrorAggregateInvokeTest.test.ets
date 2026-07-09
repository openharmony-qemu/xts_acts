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
     * @tc.name testErrorAggregateInvoke0001
     * @tc.desc Verify Error array invoke returns AggregateError with one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0020
     * @tc.name testErrorAggregateInvoke0002
     * @tc.desc Verify iterable arity equals 3 with all parameters omitted default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e")];
      const agg = AggregateError.$_invoke(arr, undefined, undefined);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0030
     * @tc.name testErrorAggregateInvoke0003
     * @tc.desc Verify errors same reference duplicate - all object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("dup");
      const agg = AggregateError.$_invoke([inner, inner, inner]);
      expect(agg.errors[0]).assertEqual(agg.errors[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0040
     * @tc.name testErrorAggregateInvoke0004
     * @tc.desc Verify errors length equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(new Error("e"));
      }
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0050
     * @tc.name testErrorAggregateInvoke0005
     * @tc.desc Verify errors contains all error subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testErrorAggregateInvoke0006
     * @tc.desc Verify errors contains nested AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("inner")]);
      const outer = AggregateError.$_invoke([inner]);
      expect(outer.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0070
     * @tc.name testErrorAggregateInvoke0007
     * @tc.desc Verify errors contains all invoke subtypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new SyntaxError("a"), new RangeError("b"), new EvalError("c"), new NonIntegralIndexError("d"),
        new TypeError("e"), new ReferenceError("f"), new URIError("g"), new FormatError("h")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0080
     * @tc.name testErrorAggregateInvoke0008
     * @tc.desc Verify errors equals [] message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty-agg");
      expect(agg.message).assertEqual("empty-agg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0090
     * @tc.name testErrorAggregateInvoke0009
     * @tc.desc Verify errors element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("preserve");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message).assertEqual("preserve");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0100
     * @tc.name testErrorAggregateInvoke0010
     * @tc.desc Verify errors element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("c");
      const inner = new Error("m", { cause: cause } as ErrorOptions);
      const agg = AggregateError.$_invoke([inner]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0110
     * @tc.name testErrorAggregateInvoke0011
     * @tc.desc Verify errors contains RangeError derived subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testErrorAggregateInvoke0012
     * @tc.desc Verify errors contains AssertionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new AssertionError("a")]);
      expect(agg.errors[0].name).assertEqual('AssertionError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0130
     * @tc.name testErrorAggregateInvoke0013
     * @tc.desc Verify errors contains NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new NullPointerError("n")]);
      expect(agg.errors[0].name).assertEqual('NullPointerError');
      expect(agg.errors[0].message).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0140
     * @tc.name testErrorAggregateInvoke0014
     * @tc.desc Verify errors contains DivideByZeroError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new DivideByZeroError("d")]);
      expect(agg.errors[0].name).assertEqual('DivideByZeroError');
      expect(agg.errors[0].message).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0150
     * @tc.name testErrorAggregateInvoke0015
     * @tc.desc Verify errors contains ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ClassCastError("c")]);
      expect(agg.errors[0].name).assertEqual('ClassCastError');
      expect(agg.errors[0].message).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0160
     * @tc.name testErrorAggregateInvoke0016
     * @tc.desc Verify errors contains ArithmeticError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ArithmeticError("a")]);
      expect(agg.errors[0].name).assertEqual('ArithmeticError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0170
     * @tc.name testErrorAggregateInvoke0017
     * @tc.desc Verify errors equals Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0180
     * @tc.name testErrorAggregateInvoke0018
     * @tc.desc Verify errors equals multiple elements Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0190
     * @tc.name testErrorAggregateInvoke0019
     * @tc.desc Verify set contains mixed subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new RangeError("r"));
      s.add(new TypeError("t"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0200
     * @tc.name testErrorAggregateInvoke0020
     * @tc.desc Verify set element order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const first = new Error("first");
      const second = new Error("second");
      s.add(first);
      s.add(second);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0210
     * @tc.name testErrorAggregateInvoke0021
     * @tc.desc Verify set element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("first"));
      s.add(new Error("second"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[1].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0220
     * @tc.name testErrorAggregateInvoke0022
     * @tc.desc Verify iterable single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      const only = new Error("only");
      source.add(only);
      const agg = AggregateError.$_invoke(source);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(only);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0230
     * @tc.name testErrorAggregateInvoke0023
     * @tc.desc Verify iterable multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      source.add(new Error("x"));
      source.add(new Error("y"));
      source.add(new Error("z"));
      const agg = AggregateError.$_invoke(source);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].message).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0240
     * @tc.name testErrorAggregateInvoke0024
     * @tc.desc Verify iterable custom iterator with no elements returns empty errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Map<string, Error>();
      const agg = AggregateError.$_invoke(source.values(), "empty-iterator");
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("empty-iterator");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0250
     * @tc.name testErrorAggregateInvoke0025
     * @tc.desc Verify set element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("preserved"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("preserved");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0260
     * @tc.name testErrorAggregateInvoke0026
     * @tc.desc Verify set equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      for (let i = 0; i < 10; i++) {
        s.add(new Error("e" + i.toString()));
      }
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0270
     * @tc.name testErrorAggregateInvoke0027
     * @tc.desc Verify set contains AggregateError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(AggregateError.$_invoke([new Error("nested")]));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0280
     * @tc.name testErrorAggregateInvoke0028
     * @tc.desc Verify set same reference preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const same = new Error("same");
      s.add(same);
      s.add(same);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0290
     * @tc.name testErrorAggregateInvoke0029
     * @tc.desc Verify message equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "");
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0300
     * @tc.name testErrorAggregateInvoke0030
     * @tc.desc Verify message equals undefined default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0310
     * @tc.name testErrorAggregateInvoke0031
     * @tc.desc Verify message length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "a");
      expect(agg.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0320
     * @tc.name testErrorAggregateInvoke0032
     * @tc.desc Verify message length equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(1000);
      const agg = AggregateError.$_invoke([new Error("e")], m);
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0330
     * @tc.name testErrorAggregateInvoke0033
     * @tc.desc Verify message containstemplate string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = 5;
      const agg = AggregateError.$_invoke([new Error("e")], `value=${v}`);
      expect(agg.message).assertEqual("value=5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0340
     * @tc.name testErrorAggregateInvoke0034
     * @tc.desc Verify iterable Error[] equivalent - errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testErrorAggregateInvoke0035
     * @tc.desc Verify iterable Error[] equivalent - type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testErrorAggregateInvoke0036
     * @tc.desc Verify error[] overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0370
     * @tc.name testErrorAggregateInvoke0037
     * @tc.desc Verify iterable overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("e"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0380
     * @tc.name testErrorAggregateInvoke0038
     * @tc.desc Verify array push instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testErrorAggregateInvoke0039
     * @tc.desc Verify array pop does not affect instance errors length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b")];
      const agg = AggregateError.$_invoke(src);
      src.pop();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0400
     * @tc.name testErrorAggregateInvoke0040
     * @tc.desc Verify array instance.errors preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      const agg = AggregateError.$_invoke(src);
      src.length = 0;
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0410
     * @tc.name testErrorAggregateInvoke0041
     * @tc.desc Verify source Set element instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      const agg = AggregateError.$_invoke(s);
      s.add(new Error("b"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0420
     * @tc.name testErrorAggregateInvoke0042
     * @tc.desc Verify source Set instance.errors is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      const agg = AggregateError.$_invoke(s);
      s.clear();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0430
     * @tc.name testErrorAggregateInvoke0043
     * @tc.desc Verify source Set delete instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const e = new Error("a");
      s.add(e);
      const agg = AggregateError.$_invoke(s);
      s.delete(e);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0440
     * @tc.name testErrorAggregateInvoke0044
     * @tc.desc Verify instance.errors array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      src.push(new Error("x"));
      expect(agg.errors.length).assertEqual(1);
      expect(src.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(src[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0450
     * @tc.name testErrorAggregateInvoke0045
     * @tc.desc Verify iterable copy independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Map<string, Error>();
      source.set("a", new Error("a"));
      source.set("b", new Error("b"));
      const agg = AggregateError.$_invoke(source.values());
      source.set("c", new Error("c"));
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0460
     * @tc.name testErrorAggregateInvoke0046
     * @tc.desc Verify mutation instance.errors array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      agg.errors.push(new Error("x"));
      expect(src.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0470
     * @tc.name testErrorAggregateInvoke0047
     * @tc.desc Verify return value errors typeisarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(Array.isArray(agg.errors)).assertTrue();
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0480
     * @tc.name testErrorAggregateInvoke0048
     * @tc.desc Verify return value errors[0] instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.errors[0] instanceof Error).assertTrue();
      expect(agg.errors[0].name).assertEqual('Error');
      expect(agg.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0490
     * @tc.name testErrorAggregateInvoke0049
     * @tc.desc Verify return value message default empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0500
     * @tc.name testErrorAggregateInvoke0050
     * @tc.desc Verify return value errors.length equals 5 multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a"), new Error("b"), new Error("c"), new Error("d"), new Error("e")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0510
     * @tc.name testErrorAggregateInvoke0051
     * @tc.desc Verify return value errors[i] order is preserved first item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("first"), new Error("second")]);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0520
     * @tc.name testErrorAggregateInvoke0052
     * @tc.desc Verify return value errors iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      let count = 0;
      for (let i = 0; i < agg.errors.length; i++) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0530
     * @tc.name testErrorAggregateInvoke0053
     * @tc.desc Verify return value cause default attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0540
     * @tc.name testErrorAggregateInvoke0054
     * @tc.desc Verify invoke preserves explicit Error cause reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("c");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect(agg.cause).assertEqual(c);
      expect((agg.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0550
     * @tc.name testErrorAggregateInvoke0055
     * @tc.desc Verify return value is AggregateError instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0560
     * @tc.name testErrorAggregateInvoke0056
     * @tc.desc Verify call returns instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")]);
      const b = AggregateError.$_invoke([new Error("e")]);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0570
     * @tc.name testErrorAggregateInvoke0057
     * @tc.desc Verify nested AggregateError errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("nest")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors[0].message).assertEqual("nest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0580
     * @tc.name testErrorAggregateInvoke0058
     * @tc.desc Verify nested cause chain preserves inner message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l1 = new Error("l1");
      const l2 = new Error("l2", { cause: l1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: l2 } as ErrorOptions);
      expect(((agg.cause as Error).cause as Error).message).assertEqual("l1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0590
     * @tc.name testErrorAggregateInvoke0059
     * @tc.desc Verify duplicate reference elements preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("dup");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0600
     * @tc.name testErrorAggregateInvoke0060
     * @tc.desc Verify message equals + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "", { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0610
     * @tc.name testErrorAggregateInvoke0061
     * @tc.desc Verify message equals emoji + options.cause equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "😀", { cause: 7 } as ErrorOptions);
      expect(agg.message).assertEqual("😀");
      expect(agg.cause).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0620
     * @tc.name testErrorAggregateInvoke0062
     * @tc.desc Verify message equals + options.cause equals boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = false;
      const agg = AggregateError.$_invoke([new Error("e")], "flag", { cause: cause } as ErrorOptions);
      expect(agg.message).assertEqual("flag");
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0630
     * @tc.name testErrorAggregateInvoke0063
     * @tc.desc Verify message equals undefined + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined, { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0640
     * @tc.name testErrorAggregateInvoke0064
     * @tc.desc Verify message equals + options.cause equals object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("v");
      const agg = AggregateError.$_invoke([new Error("e")], " ", { cause: obj } as ErrorOptions);
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Error).message).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0650
     * @tc.name testErrorAggregateInvoke0065
     * @tc.desc Verify message equals zero width space + options.cause equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "​", { cause: Number.NaN } as ErrorOptions);
      expect(agg.message).assertEqual("​");
      expect(agg.cause as number).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0660
     * @tc.name testErrorAggregateInvoke0066
     * @tc.desc Verify errors[0] constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ref");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0]).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0670
     * @tc.name testErrorAggregateInvoke0067
     * @tc.desc Verify errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0680
     * @tc.name testErrorAggregateInvoke0068
     * @tc.desc Verify nested instance errors independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      expect(a1.errors[0].message).not().assertEqual(a2.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0690
     * @tc.name testErrorAggregateInvoke0069
     * @tc.desc Verify instance do not affect each other push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      a1.errors.push(new Error("extra"));
      expect(a2.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0700
     * @tc.name testErrorAggregateInvoke0070
     * @tc.desc Verify error[] contains message element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(10000);
      const inner = new Error(m);
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0710
     * @tc.name testErrorAggregateInvoke0071
     * @tc.desc Verify type order is preserved - first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[0].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0720
     * @tc.name testErrorAggregateInvoke0072
     * @tc.desc Verify type order is preserved - second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0730
     * @tc.name testErrorAggregateInvoke0073
     * @tc.desc Verify type order is preserved - third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[2].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0740
     * @tc.name testErrorAggregateInvoke0074
     * @tc.desc Verify set element is RangeError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new ArrayIndexOutOfBoundsError("a"));
      s.add(new IndexOutOfBoundsError("i"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].name).assertEqual('ArrayIndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0750
     * @tc.name testErrorAggregateInvoke0075
     * @tc.desc Verify nested AggregateError errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0760
     * @tc.name testErrorAggregateInvoke0076
     * @tc.desc Verify aggregateError nested is cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("c-inner")]);
      const outer = AggregateError.$_invoke([new Error("e")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).errors[0].message).assertEqual("c-inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0770
     * @tc.name testErrorAggregateInvoke0077
     * @tc.desc Verify errors equals [] message+cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0780
     * @tc.name testErrorAggregateInvoke0078
     * @tc.desc Verify errors equals [] message+cause - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.cause).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0790
     * @tc.name testErrorAggregateInvoke0079
     * @tc.desc Verify errors equals [] message+cause - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.message).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0800
     * @tc.name testErrorAggregateInvoke0080
     * @tc.desc Verify high frequency call 50 instance independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last = AggregateError.$_invoke([new Error("a")]);
      for (let i = 0; i < 49; i++) {
        last = AggregateError.$_invoke([new Error("a")]);
      }
      expect(last.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0810
     * @tc.name testErrorAggregateInvoke0081
     * @tc.desc Verify high frequency call instanceof AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 20; i++) {
        const a = AggregateError.$_invoke([new Error("e")]);
        expect(a instanceof AggregateError).assertTrue();
        expect(a.name).assertEqual('AggregateError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0820
     * @tc.name testErrorAggregateInvoke0082
     * @tc.desc Verify errors elementis message Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("")]);
      expect(agg.errors[0].message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0830
     * @tc.name testErrorAggregateInvoke0083
     * @tc.desc Verify single element Set single element Array equivalent errors[0].message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("eq"));
      const aSet = AggregateError.$_invoke(s);
      const aArr = AggregateError.$_invoke([new Error("eq")]);
      expect(aSet.errors[0].message).assertEqual(aArr.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0840
     * @tc.name testErrorAggregateInvoke0084
     * @tc.desc Verify set array errors.length equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0850
     * @tc.name testErrorAggregateInvoke0085
     * @tc.desc Verify errors contains all error subtypes via $_invoke matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0860
     * @tc.name testErrorAggregateInvoke0086
     * @tc.desc Verify many subtype mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new InternalError("i"), new ArithmeticError("a"), new FormatError("f"), new ClassCastError("c")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0870
     * @tc.name testErrorAggregateInvoke0087
     * @tc.desc Verify errors element cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level1 = new Error("L1");
      const level2 = new Error("L2", { cause: level1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([level2]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("L1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0880
     * @tc.name testErrorAggregateInvoke0088
     * @tc.desc Verify errors duplicate element errors[0] equals errors[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("same");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors[0]).assertEqual(agg.errors[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0890
     * @tc.name testErrorAggregateInvoke0089
     * @tc.desc Verify instance independent - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "m", { cause: 1 } as ErrorOptions);
      const b = AggregateError.$_invoke([new Error("e")], "m", { cause: 2 } as ErrorOptions);
      expect(a.cause).not().assertEqual(b.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0900
     * @tc.name testErrorAggregateInvoke0090
     * @tc.desc Verify instance independent - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "A");
      const b = AggregateError.$_invoke([new Error("e")], "B");
      expect(a.message).not().assertEqual(b.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0910
     * @tc.name testErrorAggregateInvoke0091
     * @tc.desc Verify errors arrayiterationorder constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0920
     * @tc.name testErrorAggregateInvoke0092
     * @tc.desc Verify aggregateError Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      const plain = new Error("e");
      expect(agg).not().assertEqual(plain);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0930
     * @tc.name testErrorAggregateInvoke0093
     * @tc.desc Verify errors element instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0940
     * @tc.name testErrorAggregateInvoke0094
     * @tc.desc Verify cause is AggregateError errors accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = AggregateError.$_invoke([new Error("c-inner")]);
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect((agg.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0950
     * @tc.name testErrorAggregateInvoke0095
     * @tc.desc Verify set element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const cause = new Error("c");
      s.add(new Error("e", { cause: cause } as ErrorOptions));
      const agg = AggregateError.$_invoke(s);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0960
     * @tc.name testErrorAggregateInvoke0096
     * @tc.desc Verify iterable order constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("first", new Error("p1"));
      map.set("second", new Error("p2"));
      const agg = AggregateError.$_invoke(map.values());
      expect(agg.errors[0].message).assertEqual("p1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0970
     * @tc.name testErrorAggregateInvoke0097
     * @tc.desc Verify iterable orderlast item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("first", new Error("p1"));
      map.set("second", new Error("p2"));
      const agg = AggregateError.$_invoke(map.values());
      expect(agg.errors[1].message).assertEqual("p2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0980
     * @tc.name testErrorAggregateInvoke0098
     * @tc.desc Verify errors length passed in Set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(s.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_0990
     * @tc.name testErrorAggregateInvoke0099
     * @tc.desc Verify object cause preserves reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("1");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: obj } as ErrorOptions);
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Error).message).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1000
     * @tc.name testErrorAggregateInvoke0100
     * @tc.desc Verify errors element name preserve RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1010
     * @tc.name testErrorAggregateInvoke0101
     * @tc.desc Verify errors element name preserve TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1020
     * @tc.name testErrorAggregateInvoke0102
     * @tc.desc Verify errors element name preserve SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new SyntaxError("s")]);
      expect(agg.errors[0].name).assertEqual("SyntaxError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1030
     * @tc.name testErrorAggregateInvoke0103
     * @tc.desc Verify errors element name preserve ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ReferenceError("r")]);
      expect(agg.errors[0].name).assertEqual("ReferenceError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1040
     * @tc.name testErrorAggregateInvoke0104
     * @tc.desc Verify errors element name preserve URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")]);
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1050
     * @tc.name testErrorAggregateInvoke0105
     * @tc.desc Verify errors element name preserve EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new EvalError("e")]);
      expect(agg.errors[0].name).assertEqual("EvalError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1060
     * @tc.name testErrorAggregateInvoke0106
     * @tc.desc Verify invoke new errors[0].name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new RangeError("r")]);
      const b = AggregateError.$_invoke([new RangeError("r")]);
      expect(a.errors[0].name).assertEqual('RangeError');
      expect(a.errors[0].name).assertEqual(b.errors[0].name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1070
     * @tc.name testErrorAggregateInvoke0107
     * @tc.desc Verify errors mutation instance constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const a = AggregateError.$_invoke(arr);
      a.errors.push(new Error("x"));
      const b = AggregateError.$_invoke(arr);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1080
     * @tc.name testErrorAggregateInvoke0108
     * @tc.desc Verify callorder equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const b = AggregateError.$_invoke(arr);
      const a = AggregateError.$_invoke(arr);
      expect(a.errors.length).assertEqual(1);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1090
     * @tc.name testErrorAggregateInvoke0109
     * @tc.desc Verify cause is RangeError instanceof Error is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RangeError("r");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: r } as ErrorOptions);
      expect(agg.cause instanceof Error).assertTrue();
      expect((agg.cause as Error).name).assertEqual('RangeError');
      expect((agg.cause as Error).message).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1100
     * @tc.name testErrorAggregateInvoke0110
     * @tc.desc Verify aggregateError invoke returns one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outerAgg = AggregateError.$_invoke([new Error("e")]);
      expect(outerAgg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1110
     * @tc.name testErrorAggregateInvoke0111
     * @tc.desc Verify iterable iterator throws pass through in invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(new InvokeThrowingIterable0111());
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual("iter-fail");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1120
     * @tc.name testErrorAggregateInvoke0112
     * @tc.desc Verify errors property keeps value and enumerable key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("descriptor")], "msg");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("descriptor");
      const keys = Object.keys(agg);
      expect(keys[0]).assertEqual('errors');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1130
     * @tc.name testErrorAggregateInvoke0113
     * @tc.desc Verify AggregateError fields remain readable RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")], "frozen");
      expect(agg.message).assertEqual("frozen");
      expect(agg.errors[0].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1140
     * @tc.name testErrorAggregateInvoke0114
     * @tc.desc Verify AggregateError errors array remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")], "sealed");
      expect(agg.message).assertEqual("sealed");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1150
     * @tc.name testErrorAggregateInvoke0115
     * @tc.desc Verify AggregateError fields remain readable URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")], "locked");
      expect(agg.message).assertEqual("locked");
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1160
     * @tc.name testErrorAggregateInvoke0116
     * @tc.desc Verify AggregateError invoke keeps readable errors and cause fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        AggregateError.$_invoke([new Error("json")], "json-msg", { cause: new Error("cause") } as ErrorOptions);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("json");
      expect((agg.cause as Error).message).assertEqual("cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1170
     * @tc.name testErrorAggregateInvoke0117
     * @tc.desc Verify nested AggregateError cause and errors remain aligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf");
      const inner = AggregateError.$_invoke([leaf], "inner");
      const outer = AggregateError.$_invoke([inner, new TypeError("type")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).message).assertEqual("inner");
      expect(((outer.errors[0] as AggregateError).errors[0] as RangeError).message).assertEqual("leaf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1180
     * @tc.name testErrorAggregateInvoke0118
     * @tc.desc Verify repeated reads of AggregateError fields are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("stable")], "stable-msg",
        { cause: new TypeError("stable-cause") } as ErrorOptions);
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("stable-msg");
      expect(agg.errors[0].message).assertEqual("stable");
      expect(agg.errors.length).assertEqual(1);
      expect((agg.cause as TypeError).name).assertEqual("TypeError");
      expect((agg.cause as TypeError).message).assertEqual("stable-cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1190
     * @tc.name testErrorAggregateInvoke0119
     * @tc.desc Verify message write is isolated from errors field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a")], "keyword");
      agg.message = "keywordValue";
      expect(agg.message).assertEqual("keywordValue");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1200
     * @tc.name testErrorAggregateInvoke0120
     * @tc.desc Verify copied errors array does not track source array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      let source: Error[] = [first];
      const agg = AggregateError.$_invoke(source, "copy");
      source[0] = new Error("second");
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1210
     * @tc.name testErrorAggregateInvoke0121
     * @tc.desc Verify nested AggregateError layered type via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new Error("leaf");
      const mid = AggregateError.$_invoke([leaf], "mid");
      const outer = AggregateError.$_invoke([mid], "outer");
      expect(outer.errors[0].name).assertEqual('AggregateError');
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1220
     * @tc.name testErrorAggregateInvoke0122
     * @tc.desc Verify multi-type mixed array via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        AggregateError.$_invoke([new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[1].name).assertEqual('RangeError');
      expect(agg.errors[3].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1230
     * @tc.name testErrorAggregateInvoke0123
     * @tc.desc Verify very long message 100000 chars via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "y".repeat(100000);
      const agg = AggregateError.$_invoke([new Error("e")], longMsg);
      expect(agg.message.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1240
     * @tc.name testErrorAggregateInvoke0124
     * @tc.desc Verify cause as AggregateError via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAgg = AggregateError.$_invoke([new RangeError("r")], "inner");
      const outer = AggregateError.$_invoke([new Error("e")], "outer", { cause: innerAgg } as ErrorOptions);
      expect((outer.cause as AggregateError).name).assertEqual('AggregateError');
      expect((outer.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1250
     * @tc.name testErrorAggregateInvoke0125
     * @tc.desc Verify errors array all standard subtypes via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("ev"), new AssertionError("a")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
      expect(agg.errors[7].name).assertEqual('AssertionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1260
     * @tc.name testErrorAggregateInvoke0126
     * @tc.desc Verify custom Error subclass element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError0126("custom");
      const agg = AggregateError.$_invoke([custom], "custom-msg");
      expect(agg.errors[0]).assertEqual(custom);
      expect(agg.errors[0].name).assertEqual("InvokeCustomError");
      expect(agg.errors[0].message).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1270
     * @tc.name testErrorAggregateInvoke0127
     * @tc.desc Verify deep TypeError subclass element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new InvokeDeepLeafTypeError0127("leaf");
      const agg = AggregateError.$_invoke([leaf]);
      expect(agg.errors[0]).assertEqual(leaf);
      expect(agg.errors[0] instanceof TypeError).assertTrue();
      expect(agg.errors[0].name).assertEqual('InvokeDeepLeafTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1280
     * @tc.name testErrorAggregateInvoke0128
     * @tc.desc Verify Map values Iterable order via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const first = new RangeError("first");
      const second = new TypeError("second");
      map.set("first", first);
      map.set("second", second);
      const agg = AggregateError.$_invoke(map.values());
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1290
     * @tc.name testErrorAggregateInvoke0129
     * @tc.desc Verify Set TypeError Iterable element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1300
     * @tc.name testErrorAggregateInvoke0130
     * @tc.desc Verify nested AggregateError and custom element via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError0126("custom");
      const inner = AggregateError.$_invoke([custom], "inner");
      const outer = AggregateError.$_invoke([inner, new RangeError("range")], "outer");
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(custom);
      expect(outer.errors[1].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1310
     * @tc.name testErrorAggregateInvoke0131
     * @tc.desc Verify mixed native and custom errors via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e"), new InvokeCustomError0126("custom"), new InvokeDeepLeafTypeError0127("leaf")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].name).assertEqual("InvokeCustomError");
      expect(agg.errors[2].name).assertEqual('InvokeDeepLeafTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1320
     * @tc.name testErrorAggregateInvoke0132
     * @tc.desc Verify cause Error reference remains independent from errors via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new InvokeCustomError0126("cause");
      const element = new Error("element");
      const agg = AggregateError.$_invoke([element], "with-cause", { cause: cause } as ErrorOptions);
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error).name).assertEqual("InvokeCustomError");
      expect(agg.errors[0]).assertEqual(element);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1330
     * @tc.name testErrorAggregateInvoke0133
     * @tc.desc Verify errors array source replacement isolation via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1340
     * @tc.name testErrorAggregateInvoke0134
     * @tc.desc Verify errors array self mutation does not affect source via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("source")];
      const agg = AggregateError.$_invoke(source);
      agg.errors[0] = new TypeError("mutated");
      expect(source.length).assertEqual(1);
      expect(source[0].message).assertEqual("source");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1350
     * @tc.name testErrorAggregateInvoke0135
     * @tc.desc Verify errors array stores large element messages via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "z".repeat(200000);
      const agg = AggregateError.$_invoke([new Error(longMsg)], "outer");
      expect(agg.errors[0].message.length).assertEqual(200000);
      expect(agg.message).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1360
     * @tc.name testErrorAggregateInvoke0136
     * @tc.desc Verify map values Iterable copy isolation via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("a", new Error("a"));
      map.set("b", new Error("b"));
      const agg = AggregateError.$_invoke(map.values());
      map.set("c", new Error("c"));
      map.set("a", new Error("changed"));
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1370
     * @tc.name testErrorAggregateInvoke0137
     * @tc.desc Verify empty Map values Iterable with message and cause via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const cause = new RangeError("cause");
      const agg = AggregateError.$_invoke(map.values(), "empty-map", { cause: cause } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("empty-map");
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1380
     * @tc.name testErrorAggregateInvoke0138
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(null as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_INVOKE_1390
     * @tc.name testErrorAggregateInvoke0139
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateInvoke0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(undefined as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}
