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

class It046 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    let arr: Error[] = [new Error("only")];
    return arr.$_iterator();
  }
}

class It2047 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    let arr: Error[] = [new Error("x"), new Error("y"), new Error("z")];
    return arr.$_iterator();
  }
}

class ItE048 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    let arr: Error[] = [];
    return arr.$_iterator();
  }
}

class It3131 implements Iterable<Error> {
  arr: Error[] = [new Error("a"), new Error("b")];

  $_iterator(): IterableIterator<Error> {
    return this.arr.$_iterator();
  }
}

class ItErr156 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    throw new Error("iter-fail");
  }
}

class It4226 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    let arr: Error[] = [new Error("p1"), new Error("p2")];
    return arr.$_iterator();
  }
}

class It5227 implements Iterable<Error> {
  $_iterator(): IterableIterator<Error> {
    let arr: Error[] = [new Error("p1"), new Error("p2")];
    return arr.$_iterator();
  }
}

class InvokeCustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "InvokeCustomError";
  }
}

class InvokeDeepBaseTypeError extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = "InvokeDeepBaseTypeError";
  }
}

class InvokeDeepLeafTypeError extends InvokeDeepBaseTypeError {
  constructor(message: string) {
    super(message);
    this.name = "InvokeDeepLeafTypeError";
  }
}

export default function ErrorsAggregateErrorInvokeTest(): void {
  describe('ErrorsAggregateErrorInvokeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0001
     * @tc.name testErrorsAggregateErrorInvoke0001
     * @tc.desc Verify Error array invoke returns AggregateError with one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0002
     * @tc.name testErrorsAggregateErrorInvoke0002
     * @tc.desc Verify iterable arity equals 3 with all parameters omitted default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e")];
      const agg = AggregateError.$_invoke(arr, undefined, undefined);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0003
     * @tc.name testErrorsAggregateErrorInvoke0003
     * @tc.desc Verify errors same reference duplicate - all object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("dup");
      const agg = AggregateError.$_invoke([inner, inner, inner]);
      expect(agg.errors[0]).assertEqual(agg.errors[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0004
     * @tc.name testErrorsAggregateErrorInvoke0004
     * @tc.desc Verify errors length equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(new Error("e"));
      }
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0005
     * @tc.name testErrorsAggregateErrorInvoke0005
     * @tc.desc Verify errors contains all error subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s"),
        new ReferenceError("ref"), new URIError("u"), new EvalError("e")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
      expect(agg.errors[3] instanceof ReferenceError).assertTrue();
      expect(agg.errors[4] instanceof URIError).assertTrue();
      expect(agg.errors[5] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0006
     * @tc.name testErrorsAggregateErrorInvoke0006
     * @tc.desc Verify errors contains nested AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("inner")]);
      const outer = AggregateError.$_invoke([inner]);
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0007
     * @tc.name testErrorsAggregateErrorInvoke0007
     * @tc.desc Verify errors contains all invoke subtypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new SyntaxError("a"), new RangeError("b"), new EvalError("c"), new NonIntegralIndexError("d"),
        new TypeError("e"), new ReferenceError("f"), new URIError("g"), new FormatError("h")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0008
     * @tc.name testErrorsAggregateErrorInvoke0008
     * @tc.desc Verify errors equals [] message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty-agg");
      expect(agg.message).assertEqual("empty-agg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0009
     * @tc.name testErrorsAggregateErrorInvoke0009
     * @tc.desc Verify errors element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("preserve");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message).assertEqual("preserve");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0010
     * @tc.name testErrorsAggregateErrorInvoke0010
     * @tc.desc Verify errors element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("c");
      const inner = new Error("m", { cause: cause } as ErrorOptions);
      const agg = AggregateError.$_invoke([inner]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0011
     * @tc.name testErrorsAggregateErrorInvoke0011
     * @tc.desc Verify errors contains RangeError derived subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new NegativeArraySizeError("n"), new ArrayIndexOutOfBoundsError("a"),
        new IndexOutOfBoundsError("i"), new StringIndexOutOfBoundsError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof RangeError).assertTrue();
      expect(agg.errors[2] instanceof RangeError).assertTrue();
      expect(agg.errors[3] instanceof RangeError).assertTrue();
      expect(agg.errors[0].message).assertEqual("n");
      expect(agg.errors[1].message).assertEqual("a");
      expect(agg.errors[2].message).assertEqual("i");
      expect(agg.errors[3].message).assertEqual("s");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0012
     * @tc.name testErrorsAggregateErrorInvoke0012
     * @tc.desc Verify errors contains AssertionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new AssertionError("a")]);
      expect(agg.errors[0].name).assertEqual('AssertionError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0013
     * @tc.name testErrorsAggregateErrorInvoke0013
     * @tc.desc Verify errors contains NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new NullPointerError("n")]);
      expect(agg.errors[0].name).assertEqual('NullPointerError');
      expect(agg.errors[0].message).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0014
     * @tc.name testErrorsAggregateErrorInvoke0014
     * @tc.desc Verify errors contains DivideByZeroError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new DivideByZeroError("d")]);
      expect(agg.errors[0].name).assertEqual('DivideByZeroError');
      expect(agg.errors[0].message).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0015
     * @tc.name testErrorsAggregateErrorInvoke0015
     * @tc.desc Verify errors contains ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ClassCastError("c")]);
      expect(agg.errors[0].name).assertEqual('ClassCastError');
      expect(agg.errors[0].message).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0016
     * @tc.name testErrorsAggregateErrorInvoke0016
     * @tc.desc Verify errors contains ArithmeticError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ArithmeticError("a")]);
      expect(agg.errors[0].name).assertEqual('ArithmeticError');
      expect(agg.errors[0].message).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0017
     * @tc.name testErrorsAggregateErrorInvoke0017
     * @tc.desc Verify errors equals Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0018
     * @tc.name testErrorsAggregateErrorInvoke0018
     * @tc.desc Verify errors equals multiple elements Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0019
     * @tc.name testErrorsAggregateErrorInvoke0019
     * @tc.desc Verify set contains mixed subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new RangeError("r"));
      s.add(new TypeError("t"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0020
     * @tc.name testErrorsAggregateErrorInvoke0020
     * @tc.desc Verify set element order is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const first = new Error("first");
      const second = new Error("second");
      s.add(first);
      s.add(second);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0021
     * @tc.name testErrorsAggregateErrorInvoke0021
     * @tc.desc Verify set element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("first"));
      s.add(new Error("second"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[1].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0022
     * @tc.name testErrorsAggregateErrorInvoke0022
     * @tc.desc Verify iterable single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke(new It046());
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0023
     * @tc.name testErrorsAggregateErrorInvoke0023
     * @tc.desc Verify iterable multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke(new It2047());
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0024
     * @tc.name testErrorsAggregateErrorInvoke0024
     * @tc.desc Verify iterable custom iterator with no elements returns empty errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke(new ItE048());
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0025
     * @tc.name testErrorsAggregateErrorInvoke0025
     * @tc.desc Verify set element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("preserved"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0].message).assertEqual("preserved");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0026
     * @tc.name testErrorsAggregateErrorInvoke0026
     * @tc.desc Verify set equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      for (let i = 0; i < 10; i++) {
        s.add(new Error("e" + i.toString()));
      }
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0027
     * @tc.name testErrorsAggregateErrorInvoke0027
     * @tc.desc Verify set contains AggregateError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(AggregateError.$_invoke([new Error("nested")]));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0028
     * @tc.name testErrorsAggregateErrorInvoke0028
     * @tc.desc Verify set same reference preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const same = new Error("same");
      s.add(same);
      s.add(same);
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0029
     * @tc.name testErrorsAggregateErrorInvoke0029
     * @tc.desc Verify message equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "");
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0030
     * @tc.name testErrorsAggregateErrorInvoke0030
     * @tc.desc Verify message equals undefined default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0031
     * @tc.name testErrorsAggregateErrorInvoke0031
     * @tc.desc Verify message length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "a");
      expect(agg.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0032
     * @tc.name testErrorsAggregateErrorInvoke0032
     * @tc.desc Verify message length equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(1000);
      const agg = AggregateError.$_invoke([new Error("e")], m);
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0033
     * @tc.name testErrorsAggregateErrorInvoke0033
     * @tc.desc Verify message containstemplate string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = 5;
      const agg = AggregateError.$_invoke([new Error("e")], `value=${v}`);
      expect(agg.message).assertEqual("value=5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0034
     * @tc.name testErrorsAggregateErrorInvoke0034
     * @tc.desc Verify options.cause equals Error nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: inner } as ErrorOptions);
      expect((agg.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0035
     * @tc.name testErrorsAggregateErrorInvoke0035
     * @tc.desc Verify iterable Error[] equivalent - errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0036
     * @tc.name testErrorsAggregateErrorInvoke0036
     * @tc.desc Verify iterable Error[] equivalent - type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const s = new Set<Error>();
      s.add(new Error("a"));
      const aggArr = AggregateError.$_invoke(arr);
      const aggSet = AggregateError.$_invoke(s);
      expect(aggArr instanceof AggregateError).assertTrue();
      expect(aggSet instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0037
     * @tc.name testErrorsAggregateErrorInvoke0037
     * @tc.desc Verify error[] overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0038
     * @tc.name testErrorsAggregateErrorInvoke0038
     * @tc.desc Verify iterable overload returns AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("e"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0039
     * @tc.name testErrorsAggregateErrorInvoke0039
     * @tc.desc Verify error[] overload cause pass through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("c");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect((agg.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0040
     * @tc.name testErrorsAggregateErrorInvoke0040
     * @tc.desc Verify array push instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      src.push(new Error("b"));
      src.push(new Error("c"));
      src.push(new Error("d"));
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0041
     * @tc.name testErrorsAggregateErrorInvoke0041
     * @tc.desc Verify array pop does not affect instance errors length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b")];
      const agg = AggregateError.$_invoke(src);
      src.pop();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0042
     * @tc.name testErrorsAggregateErrorInvoke0042
     * @tc.desc Verify array instance.errors preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      const agg = AggregateError.$_invoke(src);
      src.length = 0;
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0043
     * @tc.name testErrorsAggregateErrorInvoke0043
     * @tc.desc Verify source Set element instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      const agg = AggregateError.$_invoke(s);
      s.add(new Error("b"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0044
     * @tc.name testErrorsAggregateErrorInvoke0044
     * @tc.desc Verify source Set instance.errors is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      const agg = AggregateError.$_invoke(s);
      s.clear();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0045
     * @tc.name testErrorsAggregateErrorInvoke0045
     * @tc.desc Verify source Set delete instance.errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const e = new Error("a");
      s.add(e);
      const agg = AggregateError.$_invoke(s);
      s.delete(e);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0046
     * @tc.name testErrorsAggregateErrorInvoke0046
     * @tc.desc Verify instance.errors array same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      src.push(new Error("x"));
      expect(agg.errors.length).assertEqual(1);
      expect(src.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(src[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0047
     * @tc.name testErrorsAggregateErrorInvoke0047
     * @tc.desc Verify iterable copy independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const it = new It3131();
      const agg = AggregateError.$_invoke(it);
      it.arr.push(new Error("c"));
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0048
     * @tc.name testErrorsAggregateErrorInvoke0048
     * @tc.desc Verify mutation instance.errors array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error[] = [new Error("a")];
      const agg = AggregateError.$_invoke(src);
      agg.errors.push(new Error("x"));
      expect(src.length).assertEqual(1);
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0049
     * @tc.name testErrorsAggregateErrorInvoke0049
     * @tc.desc Verify return value errors typeisarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(Array.isArray(agg.errors)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0050
     * @tc.name testErrorsAggregateErrorInvoke0050
     * @tc.desc Verify return value errors[0] instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.errors[0].name).assertEqual('Error');
      expect(agg.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0051
     * @tc.name testErrorsAggregateErrorInvoke0051
     * @tc.desc Verify return value message default empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0052
     * @tc.name testErrorsAggregateErrorInvoke0052
     * @tc.desc Verify return value errors.length equals 5 multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a"), new Error("b"), new Error("c"), new Error("d"), new Error("e")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0053
     * @tc.name testErrorsAggregateErrorInvoke0053
     * @tc.desc Verify return value errors[i] order is preserved first item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("first"), new Error("second")]);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0054
     * @tc.name testErrorsAggregateErrorInvoke0054
     * @tc.desc Verify return value cause default attached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0055
     * @tc.name testErrorsAggregateErrorInvoke0055
     * @tc.desc Verify invoke preserves explicit Error cause reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("c");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect(agg.cause).assertEqual(c);
      expect((agg.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0056
     * @tc.name testErrorsAggregateErrorInvoke0056
     * @tc.desc Verify return value name field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg.name).assertEqual("AggregateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0057
     * @tc.name testErrorsAggregateErrorInvoke0057
     * @tc.desc Verify return value is AggregateError instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      expect(agg instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0058
     * @tc.name testErrorsAggregateErrorInvoke0058
     * @tc.desc Verify call returns instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")]);
      const b = AggregateError.$_invoke([new Error("e")]);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0059
     * @tc.name testErrorsAggregateErrorInvoke0059
     * @tc.desc Verify nested AggregateError errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("nest")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors[0].message).assertEqual("nest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0060
     * @tc.name testErrorsAggregateErrorInvoke0060
     * @tc.desc Verify options.cause preserves Error reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputCause = new Error("v");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: inputCause } as ErrorOptions);
      expect(agg.cause).assertEqual(inputCause);
      expect((agg.cause as Error).message).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0061
     * @tc.name testErrorsAggregateErrorInvoke0061
     * @tc.desc Verify nested cause chain preserves inner message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l1 = new Error("l1");
      const l2 = new Error("l2", { cause: l1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: l2 } as ErrorOptions);
      expect(((agg.cause as Error).cause as Error).message).assertEqual("l1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0062
     * @tc.name testErrorsAggregateErrorInvoke0062
     * @tc.desc Verify duplicate reference elements preserve length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("dup");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0063
     * @tc.name testErrorsAggregateErrorInvoke0063
     * @tc.desc Verify message equals + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "", { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0064
     * @tc.name testErrorsAggregateErrorInvoke0064
     * @tc.desc Verify message equals emoji + options.cause equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "😀", { cause: 7 } as ErrorOptions);
      expect(agg.message).assertEqual("😀");
      expect(agg.cause).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0065
     * @tc.name testErrorsAggregateErrorInvoke0065
     * @tc.desc Verify message equals + options.cause equals boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(1000);
      const agg = AggregateError.$_invoke([new Error("e")], m, { cause: true } as ErrorOptions);
      expect(agg.message.length).assertEqual(1000);
      expect(agg.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0066
     * @tc.name testErrorsAggregateErrorInvoke0066
     * @tc.desc Verify message equals undefined + options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], undefined, { cause: undefined } as ErrorOptions);
      expect(agg.message).assertEqual("");
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0067
     * @tc.name testErrorsAggregateErrorInvoke0067
     * @tc.desc Verify message equals + options.cause equals object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("v");
      const agg = AggregateError.$_invoke([new Error("e")], " ", { cause: obj } as ErrorOptions);
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Error).message).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0068
     * @tc.name testErrorsAggregateErrorInvoke0068
     * @tc.desc Verify message equals zero width space + options.cause equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")], "​", { cause: Number.NaN } as ErrorOptions);
      expect(agg.message).assertEqual("​");
      expect(isNaN(agg.cause as number)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0069
     * @tc.name testErrorsAggregateErrorInvoke0069
     * @tc.desc Verify errors[0] constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("ref");
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0]).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0070
     * @tc.name testErrorsAggregateErrorInvoke0070
     * @tc.desc Verify nested instance errors independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      expect(a1.errors[0].message).not().assertEqual(a2.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0071
     * @tc.name testErrorsAggregateErrorInvoke0071
     * @tc.desc Verify instance do not affect each other push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = AggregateError.$_invoke([new Error("a")]);
      const a2 = AggregateError.$_invoke([new Error("b")]);
      a1.errors.push(new Error("extra"));
      expect(a2.errors.length).assertEqual(1);
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0072
     * @tc.name testErrorsAggregateErrorInvoke0072
     * @tc.desc Verify error[] contains message element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = "a".repeat(10000);
      const inner = new Error(m);
      const agg = AggregateError.$_invoke([inner]);
      expect(agg.errors[0].message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0073
     * @tc.name testErrorsAggregateErrorInvoke0073
     * @tc.desc Verify type order is preserved - first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0074
     * @tc.name testErrorsAggregateErrorInvoke0074
     * @tc.desc Verify type order is preserved - second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[1] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0075
     * @tc.name testErrorsAggregateErrorInvoke0075
     * @tc.desc Verify type order is preserved - third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0076
     * @tc.name testErrorsAggregateErrorInvoke0076
     * @tc.desc Verify set element is RangeError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new ArrayIndexOutOfBoundsError("a"));
      s.add(new IndexOutOfBoundsError("i"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0077
     * @tc.name testErrorsAggregateErrorInvoke0077
     * @tc.desc Verify nested AggregateError errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("a"), new Error("b")]);
      const outer = AggregateError.$_invoke([inner]);
      expect((outer.errors[0] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0078
     * @tc.name testErrorsAggregateErrorInvoke0078
     * @tc.desc Verify aggregateError nested is cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = AggregateError.$_invoke([new Error("c-inner")]);
      const outer = AggregateError.$_invoke([new Error("e")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).errors[0].message).assertEqual("c-inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0079
     * @tc.name testErrorsAggregateErrorInvoke0079
     * @tc.desc Verify errors equals [] message+cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0080
     * @tc.name testErrorsAggregateErrorInvoke0080
     * @tc.desc Verify errors equals [] message+cause - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.cause).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0081
     * @tc.name testErrorsAggregateErrorInvoke0081
     * @tc.desc Verify errors equals [] message+cause - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([], "empty", { cause: 1 } as ErrorOptions);
      expect(agg.message).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0082
     * @tc.name testErrorsAggregateErrorInvoke0082
     * @tc.desc Verify high frequency call 50 instance independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last = AggregateError.$_invoke([new Error("a")]);
      for (let i = 0; i < 49; i++) {
        last = AggregateError.$_invoke([new Error("a")]);
      }
      expect(last.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0083
     * @tc.name testErrorsAggregateErrorInvoke0083
     * @tc.desc Verify invoke result name is AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")]);
      expect(a.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0084
     * @tc.name testErrorsAggregateErrorInvoke0084
     * @tc.desc Verify errors elementis message Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("")]);
      expect(agg.errors[0].message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0085
     * @tc.name testErrorsAggregateErrorInvoke0085
     * @tc.desc Verify single element Set single element Array equivalent errors[0].message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("eq"));
      const aSet = AggregateError.$_invoke(s);
      const aArr = AggregateError.$_invoke([new Error("eq")]);
      expect(aSet.errors[0].message).assertEqual(aArr.errors[0].message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0086
     * @tc.name testErrorsAggregateErrorInvoke0086
     * @tc.desc Verify set array errors.length equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0087
     * @tc.name testErrorsAggregateErrorInvoke0087
     * @tc.desc Verify errors contains all error subtypes via $_invoke matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0088
     * @tc.name testErrorsAggregateErrorInvoke0088
     * @tc.desc Verify many subtype mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new InternalError("i"), new ArithmeticError("a"), new FormatError("f"), new ClassCastError("c")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0089
     * @tc.name testErrorsAggregateErrorInvoke0089
     * @tc.desc Verify errors element cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level1 = new Error("L1");
      const level2 = new Error("L2", { cause: level1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([level2]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("L1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0090
     * @tc.name testErrorsAggregateErrorInvoke0090
     * @tc.desc Verify errors duplicate element errors[0] equals errors[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const same = new Error("same");
      const agg = AggregateError.$_invoke([same, same]);
      expect(agg.errors[0]).assertEqual(agg.errors[1]);
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0091
     * @tc.name testErrorsAggregateErrorInvoke0091
     * @tc.desc Verify instance independent - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "m", { cause: 1 } as ErrorOptions);
      const b = AggregateError.$_invoke([new Error("e")], "m", { cause: 2 } as ErrorOptions);
      expect(a.cause).not().assertEqual(b.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0092
     * @tc.name testErrorsAggregateErrorInvoke0092
     * @tc.desc Verify instance independent - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new Error("e")], "A");
      const b = AggregateError.$_invoke([new Error("e")], "B");
      expect(a.message).not().assertEqual(b.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0093
     * @tc.name testErrorsAggregateErrorInvoke0093
     * @tc.desc Verify errors arrayiterationorder constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0094
     * @tc.name testErrorsAggregateErrorInvoke0094
     * @tc.desc Verify aggregateError Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("e")]);
      const plain = new Error("e");
      expect(agg).not().assertEqual(plain);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0095
     * @tc.name testErrorsAggregateErrorInvoke0095
     * @tc.desc Verify errors element instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0096
     * @tc.name testErrorsAggregateErrorInvoke0096
     * @tc.desc Verify errors element with cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Error("c1");
      const inner = new Error("inner", { cause: c1 } as ErrorOptions);
      const agg = AggregateError.$_invoke([inner]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0097
     * @tc.name testErrorsAggregateErrorInvoke0097
     * @tc.desc Verify cause is AggregateError errors accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = AggregateError.$_invoke([new Error("c-inner")]);
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: c } as ErrorOptions);
      expect((agg.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0098
     * @tc.name testErrorsAggregateErrorInvoke0098
     * @tc.desc Verify set element with cause preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const cause = new Error("c");
      s.add(new Error("e", { cause: cause } as ErrorOptions));
      const agg = AggregateError.$_invoke(s);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0099
     * @tc.name testErrorsAggregateErrorInvoke0099
     * @tc.desc Verify iterable order constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke(new It4226());
      expect(agg.errors[0].message).assertEqual("p1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0100
     * @tc.name testErrorsAggregateErrorInvoke0100
     * @tc.desc Verify iterable orderlast item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke(new It5227());
      expect(agg.errors[1].message).assertEqual("p2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0101
     * @tc.name testErrorsAggregateErrorInvoke0101
     * @tc.desc Verify errors length passed in Set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      const agg = AggregateError.$_invoke(s);
      expect(agg.errors.length).assertEqual(s.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0102
     * @tc.name testErrorsAggregateErrorInvoke0102
     * @tc.desc Verify object cause preserves reference and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("1");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: obj } as ErrorOptions);
      expect(agg.cause).assertEqual(obj);
      expect((agg.cause as Error).message).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0103
     * @tc.name testErrorsAggregateErrorInvoke0103
     * @tc.desc Verify errors element name preserve RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0104
     * @tc.name testErrorsAggregateErrorInvoke0104
     * @tc.desc Verify errors element name preserve TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0105
     * @tc.name testErrorsAggregateErrorInvoke0105
     * @tc.desc Verify errors element name preserve SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new SyntaxError("s")]);
      expect(agg.errors[0].name).assertEqual("SyntaxError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0106
     * @tc.name testErrorsAggregateErrorInvoke0106
     * @tc.desc Verify errors element name preserve ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new ReferenceError("r")]);
      expect(agg.errors[0].name).assertEqual("ReferenceError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0107
     * @tc.name testErrorsAggregateErrorInvoke0107
     * @tc.desc Verify errors element name preserve URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")]);
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0108
     * @tc.name testErrorsAggregateErrorInvoke0108
     * @tc.desc Verify errors element name preserve EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new EvalError("e")]);
      expect(agg.errors[0].name).assertEqual("EvalError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0109
     * @tc.name testErrorsAggregateErrorInvoke0109
     * @tc.desc Verify invoke new errors[0].name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = AggregateError.$_invoke([new RangeError("r")]);
      const b = AggregateError.$_invoke([new RangeError("r")]);
      expect(a.errors[0].name).assertEqual('RangeError');
      expect(a.errors[0].name).assertEqual(b.errors[0].name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0110
     * @tc.name testErrorsAggregateErrorInvoke0110
     * @tc.desc Verify errors mutation instance constructor instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const a = AggregateError.$_invoke(arr);
      a.errors.push(new Error("x"));
      const b = AggregateError.$_invoke(arr);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0111
     * @tc.name testErrorsAggregateErrorInvoke0111
     * @tc.desc Verify callorder equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a")];
      const b = AggregateError.$_invoke(arr);
      const a = AggregateError.$_invoke(arr);
      expect(a.errors.length).assertEqual(1);
      expect(b.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0112
     * @tc.name testErrorsAggregateErrorInvoke0112
     * @tc.desc Verify cause is RangeError instanceof Error is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RangeError("r");
      const agg = AggregateError.$_invoke([new Error("e")], "m", { cause: r } as ErrorOptions);
      expect((agg.cause as Error).name).assertEqual('RangeError');
      expect((agg.cause as Error).message).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0113
     * @tc.name testErrorsAggregateErrorInvoke0113
     * @tc.desc Verify aggregateError invoke returns one error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outerAgg = AggregateError.$_invoke([new Error("e")]);
      expect(outerAgg.errors.length).assertEqual(1);
    }); 

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0114
     * @tc.name testErrorsAggregateErrorInvoke0114
     * @tc.desc Verify iterable iterator throws pass through in invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(new ItErr156());
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual("iter-fail");
      }
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0115
     * @tc.name testErrorsAggregateErrorInvoke0115
     * @tc.desc Verify errors property keeps value and enumerable key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("descriptor")], "msg");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("descriptor");
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0116
     * @tc.name testErrorsAggregateErrorInvoke0116
     * @tc.desc Verify AggregateError fields remain readable RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new RangeError("r")], "frozen");
      expect(agg.message).assertEqual("frozen");
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0117
     * @tc.name testErrorsAggregateErrorInvoke0117
     * @tc.desc Verify AggregateError errors array remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new TypeError("t")], "sealed");
      expect(agg.message).assertEqual("sealed");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0118
     * @tc.name testErrorsAggregateErrorInvoke0118
     * @tc.desc Verify AggregateError fields remain readable URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new URIError("u")], "locked");
      expect(agg.message).assertEqual("locked");
      expect(agg.errors[0].name).assertEqual("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0119
     * @tc.name testErrorsAggregateErrorInvoke0119
     * @tc.desc Verify AggregateError invoke keeps readable errors and cause fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        AggregateError.$_invoke([new Error("json")], "json-msg", { cause: new Error("cause") } as ErrorOptions);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("json");
      expect((agg.cause as Error).message).assertEqual("cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0120
     * @tc.name testErrorsAggregateErrorInvoke0120
     * @tc.desc Verify nested AggregateError cause and errors remain aligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf");
      const inner = AggregateError.$_invoke([leaf], "inner");
      const outer = AggregateError.$_invoke([inner, new TypeError("type")], "outer", { cause: inner } as ErrorOptions);
      expect((outer.cause as AggregateError).message).assertEqual("inner");
      expect(((outer.errors[0] as AggregateError).errors[0] as RangeError).message).assertEqual("leaf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0121
     * @tc.name testErrorsAggregateErrorInvoke0121
     * @tc.desc Verify repeated reads of AggregateError fields are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0122
     * @tc.name testErrorsAggregateErrorInvoke0122
     * @tc.desc Verify message write is isolated from errors field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = AggregateError.$_invoke([new Error("a")], "keyword");
      agg.message = "keywordValue";
      expect(agg.message).assertEqual("keywordValue");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0123
     * @tc.name testErrorsAggregateErrorInvoke0123
     * @tc.desc Verify copied errors array does not track source array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      let source: Error[] = [first];
      const agg = AggregateError.$_invoke(source, "copy");
      source[0] = new Error("second");
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0124
     * @tc.name testErrorsAggregateErrorInvoke0124
     * @tc.desc Verify nested AggregateError layered type via $_invoke (test point 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new Error("leaf");
      const mid = AggregateError.$_invoke([leaf], "mid");
      const outer = AggregateError.$_invoke([mid], "outer");
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0125
     * @tc.name testErrorsAggregateErrorInvoke0125
     * @tc.desc Verify multi-type mixed array via $_invoke (test point 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        AggregateError.$_invoke([new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[1] instanceof RangeError).assertTrue();
      expect(agg.errors[3] instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0126
     * @tc.name testErrorsAggregateErrorInvoke0126
     * @tc.desc Verify deeply nested cause chain via $_invoke (test point 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const mid = new Error("mid", { cause: root } as ErrorOptions);
      const agg = AggregateError.$_invoke([new Error("e")], "outer", { cause: mid } as ErrorOptions);
      expect(((agg.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0127
     * @tc.name testErrorsAggregateErrorInvoke0127
     * @tc.desc Verify very long message 100000 chars via $_invoke (test point 81)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "y".repeat(100000);
      const agg = AggregateError.$_invoke([new Error("e")], longMsg);
      expect(agg.message.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0128
     * @tc.name testErrorsAggregateErrorInvoke0128
     * @tc.desc Verify cause as AggregateError via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAgg = AggregateError.$_invoke([new RangeError("r")], "inner");
      const outer = AggregateError.$_invoke([new Error("e")], "outer", { cause: innerAgg } as ErrorOptions);
      expect((outer.cause as AggregateError) instanceof AggregateError).assertTrue();
      expect((outer.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0129
     * @tc.name testErrorsAggregateErrorInvoke0129
     * @tc.desc Verify errors array all standard subtypes via $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] =
        [new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("ev"), new AssertionError("a")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(8);
      expect(agg.errors[7] instanceof AssertionError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0130
     * @tc.name testErrorsAggregateErrorInvoke0130
     * @tc.desc Verify custom Error subclass element via $_invoke (test point 11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError("custom");
      const agg = AggregateError.$_invoke([custom], "custom-msg");
      expect(agg.errors[0]).assertEqual(custom);
      expect(agg.errors[0].name).assertEqual("InvokeCustomError");
      expect(agg.errors[0].message).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0131
     * @tc.name testErrorsAggregateErrorInvoke0131
     * @tc.desc Verify deep TypeError subclass element via $_invoke (test point 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new InvokeDeepLeafTypeError("leaf");
      const agg = AggregateError.$_invoke([leaf]);
      expect(agg.errors[0]).assertEqual(leaf);
      expect(agg.errors[0] instanceof TypeError).assertTrue();
      expect(agg.errors[0].name).assertEqual("InvokeDeepLeafTypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0132
     * @tc.name testErrorsAggregateErrorInvoke0132
     * @tc.desc Verify Map values Iterable order via $_invoke (test point 69)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0133
     * @tc.name testErrorsAggregateErrorInvoke0133
     * @tc.desc Verify Set TypeError Iterable element via $_invoke (test point 70)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      const first = new TypeError("one");
      const second = new InvokeDeepLeafTypeError("two");
      set.add(first);
      set.add(second);
      const agg = AggregateError.$_invoke(set);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].name).assertEqual("TypeError");
      expect(agg.errors[1].name).assertEqual("InvokeDeepLeafTypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0134
     * @tc.name testErrorsAggregateErrorInvoke0134
     * @tc.desc Verify nested AggregateError and custom element via $_invoke (test point 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new InvokeCustomError("custom");
      const inner = AggregateError.$_invoke([custom], "inner");
      const outer = AggregateError.$_invoke([inner, new RangeError("range")], "outer");
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(custom);
      expect(outer.errors[1].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0135
     * @tc.name testErrorsAggregateErrorInvoke0135
     * @tc.desc Verify mixed native and custom errors via $_invoke (test point 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("e"), new InvokeCustomError("custom"), new InvokeDeepLeafTypeError("leaf")];
      const agg = AggregateError.$_invoke(arr);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[1].name).assertEqual("InvokeCustomError");
      expect(agg.errors[2] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0136
     * @tc.name testErrorsAggregateErrorInvoke0136
     * @tc.desc Verify cause Error reference remains independent from errors via $_invoke (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new InvokeCustomError("cause");
      const element = new Error("element");
      const agg = AggregateError.$_invoke([element], "with-cause", { cause: cause } as ErrorOptions);
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error).name).assertEqual("InvokeCustomError");
      expect(agg.errors[0]).assertEqual(element);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0137
     * @tc.name testErrorsAggregateErrorInvoke0137
     * @tc.desc Verify errors array source replacement isolation via $_invoke (test point 66)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0138
     * @tc.name testErrorsAggregateErrorInvoke0138
     * @tc.desc Verify errors array self mutation does not affect source via $_invoke (test point 66)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("source")];
      const agg = AggregateError.$_invoke(source);
      agg.errors[0] = new TypeError("mutated");
      expect(source.length).assertEqual(1);
      expect(source[0].message).assertEqual("source");
      expect(agg.errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0139
     * @tc.name testErrorsAggregateErrorInvoke0139
     * @tc.desc Verify errors array stores large element messages via $_invoke (test point 81)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "z".repeat(200000);
      const agg = AggregateError.$_invoke([new Error(longMsg)], "outer");
      expect(agg.errors[0].message.length).assertEqual(200000);
      expect(agg.message).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0140
     * @tc.name testErrorsAggregateErrorInvoke0140
     * @tc.desc Verify map values Iterable copy isolation via $_invoke (test point 69)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0141
     * @tc.name testErrorsAggregateErrorInvoke0141
     * @tc.desc Verify empty Map values Iterable with message and cause via $_invoke (test point 38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const cause = new RangeError("cause");
      const agg = AggregateError.$_invoke(map.values(), "empty-map", { cause: cause } as ErrorOptions);
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("empty-map");
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0142
     * @tc.name testErrorsAggregateErrorInvoke0142
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(null as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_INVOKE_0143
     * @tc.name testErrorsAggregateErrorInvoke0143
     * @tc.desc Verify AggregateError $_invoke throws ClassCastError when errors is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorInvoke0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        AggregateError.$_invoke(undefined as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}
