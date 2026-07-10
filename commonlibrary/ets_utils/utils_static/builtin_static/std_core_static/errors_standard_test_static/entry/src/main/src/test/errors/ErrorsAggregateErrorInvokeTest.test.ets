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
