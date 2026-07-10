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

class OverallPlainErrorLike {
  name: string = "Error";
  message: string = "plain";
}

class OverallComplexErrorHolder {
  code: int = 500;
  owner: string = "ErrorsOverallTest";
  primary: Error;
  aggregate: AggregateError;

  constructor(aggregate: AggregateError) {
    this.primary = new Error("primary", { cause: aggregate });
    this.aggregate = aggregate;
  }
}

class OverallCustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "OverallCustomError";
  }
}

class OverallDeepTypeError extends TypeError {
  constructor(message: string) {
    super(message);
    this.name = "OverallDeepTypeError";
  }
}

class OverallPrivateConstructorError extends Error {
  private constructor(message: string) {
    super(message);
    this.name = "OverallPrivateConstructorError";
  }

  static create(message: string): OverallPrivateConstructorError {
    return new OverallPrivateConstructorError(message);
  }
}

class OverallErrorBox<T extends Error> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

class OverallIntegratedErrorHost {
  static readonly CODE: int = 500;
  readonly readonlyError: TypeError = new TypeError("readonly");
  optionalError?: Error;
  aggregate: AggregateError;
  boxed: OverallErrorBox<OverallCustomError>;
  private privateError: RangeError = new RangeError("private");

  constructor(boxed: OverallErrorBox<OverallCustomError>, aggregate: AggregateError) {
    this.boxed = boxed;
    this.aggregate = aggregate;
  }

  static createStaticError(message: string): Error {
    return new Error(message);
  }

  getPrivateName(): string {
    return this.privateError.name;
  }

  getBoxedName(): string {
    return this.boxed.getValue().name;
  }

  describeError(value: Error): string {
    return value.name + ":" + value.message;
  }

  wrapAsyncError(value: Error): Promise<Error> {
    return new Promise<Error>((resolve): void => {
      resolve(value);
    });
  }
}

class OverallAccessorErrorHost {
  private current: Error = new Error("getter");

  get error(): Error {
    return this.current;
  }

  set error(value: Error) {
    this.current = value;
  }

  get throwingError(): Error {
    throw new TypeError("getter-error");
  }
}

export default function ErrorsOverallTest(): void {
  describe('ErrorsOverallTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0001
     * @tc.name testErrorsOverall0001
     * @tc.desc Verify message is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new TypeError("");
      expect(err.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0002
     * @tc.name testErrorsOverall0002
     * @tc.desc Verify message is XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new SyntaxError("<script>alert(1)</script>");
      expect(err.message).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0003
     * @tc.name testErrorsOverall0003
     * @tc.desc Verify message length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new SyntaxError("a");
      expect(err.message.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0004
     * @tc.name testErrorsOverall0004
     * @tc.desc Verify message length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = "x".repeat(1000);
      const err = new SyntaxError(s);
      expect(err.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0005
     * @tc.name testErrorsOverall0005
     * @tc.desc Verify options.cause preserves string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("s", { cause: "string-cause" });
      expect(err.cause as string).assertEqual("string-cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0006
     * @tc.name testErrorsOverall0006
     * @tc.desc Verify options.cause preserves number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("n", { cause: 42 });
      expect(err.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0007
     * @tc.name testErrorsOverall0007
     * @tc.desc Verify options.cause preserves boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("b", { cause: true });
      expect(err.cause as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0008
     * @tc.name testErrorsOverall0008
     * @tc.desc Verify options.cause preserves Error object message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("o", { cause: new Error("v") });
      expect((err.cause as Error).message).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0009
     * @tc.name testErrorsOverall0009
     * @tc.desc Verify options.cause preserves nested RangeError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("inner range");
      const err = new TypeError("outer", { cause: inner });
      expect((err.cause as RangeError) instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0010
     * @tc.name testErrorsOverall0010
     * @tc.desc Verify options.cause is deep nested Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const b = new Error("b", { cause: a });
      const c = new RangeError("c", { cause: b });
      expect(((c.cause as Error).cause as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0011
     * @tc.name testErrorsOverall0011
     * @tc.desc Verify errors contains mixed Error / RangeError / TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new RangeError("b"), new TypeError("c")]);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0012
     * @tc.name testErrorsOverall0012
     * @tc.desc Verify errors length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        arr.push(new Error("e" + i));
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(100);
      expect(agg.errors[0].message).assertEqual("e0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0013
     * @tc.name testErrorsOverall0013
     * @tc.desc Verify errors length 10000 upper bound boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 100; j++) {
          arr.push(new Error("e" + (i * 100 + j)));
        }
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0014
     * @tc.name testErrorsOverall0014
     * @tc.desc Verify errors contains nested AggregateError type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAgg = new AggregateError([new Error("ia1"), new Error("ia2")], "inner-agg");
      const outerAgg = new AggregateError([new Error("o1"), innerAgg]);
      expect((outerAgg.errors[1] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0015
     * @tc.name testErrorsOverall0015
     * @tc.desc Verify errors Set passed in Iterable overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("a"));
      set.add(new RangeError("b"));
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0016
     * @tc.name testErrorsOverall0016
     * @tc.desc Verify errors element issame reference duplicateelement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("dup");
      const agg = new AggregateError([e, e, e]);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[0]).assertEqual(e);
      expect(agg.errors[1]).assertEqual(e);
      expect(agg.errors[2]).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0017
     * @tc.name testErrorsOverall0017
     * @tc.desc Verify errors Error[] passed in Error[] overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0018
     * @tc.name testErrorsOverall0018
     * @tc.desc Verify aggregateError errors heterogeneous all instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
      expect(agg.errors[0].name).assertEqual('RangeError');
      expect(agg.errors[1].name).assertEqual('TypeError');
      expect(agg.errors[2].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0019
     * @tc.name testErrorsOverall0019
     * @tc.desc Verify iterable overload - Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError(new Set<Error>());
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0020
     * @tc.name testErrorsOverall0020
     * @tc.desc Verify iterable overload + message + options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("c");
      const set = new Set<Error>();
      set.add(new Error("e1"));
      const agg = new AggregateError(set, "agg-it", { cause: inner });
      expect(agg.message).assertEqual("agg-it");
      expect((agg.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0021
     * @tc.name testErrorsOverall0021
     * @tc.desc Verify aggregateError constructor Iterable overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("ie"));
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0022
     * @tc.name testErrorsOverall0022
     * @tc.desc Verify aggregateError constructor Error[] overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("ie1"), new Error("ie2")]);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0023
     * @tc.name testErrorsOverall0023
     * @tc.desc Verify all error type names matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new AssertionError("a").name).assertEqual('AssertionError');
      expect(new DivideByZeroError("d").name).assertEqual('DivideByZeroError');
      expect(new NullPointerError("n").name).assertEqual('NullPointerError');
      expect(new UncaughtExceptionError("u").name).assertEqual('UncaughtExceptionError');
      expect(new SyntaxError("s").name).assertEqual('SyntaxError');
      expect(new JSONTypeError("j").name).assertEqual('JSONTypeError');
      expect(new RangeError("r").name).assertEqual('RangeError');
      expect(new NegativeArraySizeError("nas").name).assertEqual('NegativeArraySizeError');
      expect(new ArrayIndexOutOfBoundsError("aiob").name).assertEqual('ArrayIndexOutOfBoundsError');
      expect(new ArithmeticError("ae").name).assertEqual('ArithmeticError');
      expect(new OutOfMemoryError("oom").name).assertEqual('OutOfMemoryError');
      expect(new StackOverflowError("sof").name).assertEqual('StackOverflowError');
      expect(new InstantiationError("ie").name).assertEqual('InstantiationError');
      expect(new InternalError("ii").name).assertEqual('InternalError');
      expect(new IndexOutOfBoundsError("iob").name).assertEqual('IndexOutOfBoundsError');
      expect(new StringIndexOutOfBoundsError("siob").name).assertEqual('StringIndexOutOfBoundsError');
      expect(new ClassCastError("cce").name).assertEqual('ClassCastError');
      expect(new ArrayStoreError("ase").name).assertEqual('ArrayStoreError');
      expect(new ExceptionInInitializerError("eie").name).assertEqual('ExceptionInInitializerError');
      expect(new CoroutinesLimitExceedError("cle").name).assertEqual('CoroutinesLimitExceedError');
      expect(new IllegalLockStateError("ils").name).assertEqual('IllegalLockStateError');
      expect(new InvalidJobOperationError("ijo").name).assertEqual('InvalidJobOperationError');
      expect(new ArgumentsUnderapplicationError("aua").name).assertEqual('ArgumentsUnderapplicationError');
      expect(new InvalidStoreAccessError("isa").name).assertEqual('InvalidStoreAccessError');
      expect(new EvalError("ee").name).assertEqual('EvalError');
      expect(new NonIntegralIndexError("nii").name).assertEqual('NonIntegralIndexError');
      expect(new TypeError("te").name).assertEqual('TypeError');
      expect(new ReferenceError("re").name).assertEqual('ReferenceError');
      expect(new URIError("ue").name).assertEqual('URIError');
      expect(new AggregateError([], "ag").name).assertEqual('AggregateError');
      expect(new FormatError("fe").name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0024
     * @tc.name testErrorsOverall0024
     * @tc.desc Verify syntaxError invoke returns type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = SyntaxError("inv");
      expect(err.name).assertEqual('SyntaxError');
      expect(err.message).assertEqual('inv');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0025
     * @tc.name testErrorsOverall0025
     * @tc.desc Verify rangeError invoke returns type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = RangeError("inv");
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('inv');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0026
     * @tc.name testErrorsOverall0026
     * @tc.desc Verify typeError invoke returns type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = TypeError("inv");
      expect(err.name).assertEqual('TypeError');
      expect(err.message).assertEqual('inv');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0027
     * @tc.name testErrorsOverall0027
     * @tc.desc Verify referenceError invoke returns type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = ReferenceError("inv");
      expect(err.name).assertEqual('ReferenceError');
      expect(err.message).assertEqual('inv');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0028
     * @tc.name testErrorsOverall0028
     * @tc.desc Verify cause default value options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("no-cause");
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0029
     * @tc.name testErrorsOverall0029
     * @tc.desc Verify cause explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("c");
      const err = new RangeError("m", { cause: c });
      expect((err.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0030
     * @tc.name testErrorsOverall0030
     * @tc.desc Verify aggregateError errors returns type is Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(1);
      let iterated = 0;
      agg.errors.forEach((e: Error) => {
        iterated++;
      });
      expect(iterated).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0031
     * @tc.name testErrorsOverall0031
     * @tc.desc Verify aggregateError errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("ref");
      const agg = new AggregateError([e]);
      expect(agg.errors[0]).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0032
     * @tc.name testErrorsOverall0032
     * @tc.desc Verify aggregateError errors for-of iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      for (const item of agg.errors) {
        expect(item.name).assertEqual('Error');
      }
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0033
     * @tc.name testErrorsOverall0033
     * @tc.desc Verify thrown RangeError is caught polymorphically as Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new RangeError("poly");
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
        expect((e as RangeError).name).assertEqual('RangeError');
        expect((e as RangeError).message).assertEqual('poly');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0034
     * @tc.name testErrorsOverall0034
     * @tc.desc Verify throw NegativeArraySizeError RangeError catch cross subtype catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new NegativeArraySizeError("nas-throw");
      } catch (e) {
        expect((e as NegativeArraySizeError).name).assertEqual('NegativeArraySizeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0035
     * @tc.name testErrorsOverall0035
     * @tc.desc Verify throw ArrayIndexOutOfBoundsError RangeError catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ArrayIndexOutOfBoundsError("aiob-throw");
      } catch (e) {
        expect((e as ArrayIndexOutOfBoundsError).name).assertEqual('ArrayIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0036
     * @tc.name testErrorsOverall0036
     * @tc.desc Verify throw IndexOutOfBoundsError RangeError catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new IndexOutOfBoundsError("iob-throw");
      } catch (e) {
        expect((e as IndexOutOfBoundsError).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0037
     * @tc.name testErrorsOverall0037
     * @tc.desc Verify throw StringIndexOutOfBoundsError RangeError catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new StringIndexOutOfBoundsError("siob-throw");
      } catch (e) {
        expect((e as StringIndexOutOfBoundsError).name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0038
     * @tc.name testErrorsOverall0038
     * @tc.desc Verify thrown AggregateError catch preserves errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new AggregateError([new Error("e1"), new Error("e2")], "agg-throw");
      } catch (e) {
        expect((e as AggregateError).name).assertEqual('AggregateError');
        expect((e as AggregateError).errors.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0039
     * @tc.name testErrorsOverall0039
     * @tc.desc Verify throw with cause Error catch cause pass through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner-throw");
      try {
        throw new TypeError("outer", { cause: inner });
      } catch (e) {
        expect((e as TypeError).name).assertEqual('TypeError');
        expect(((e as TypeError).cause as Error).message).assertEqual("inner-throw");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0040
     * @tc.name testErrorsOverall0040
     * @tc.desc Verify rangeError Core runtime name is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("code-check");
      expect(err.name).assertEqual('RangeError');
      expect(err.message).assertEqual('code-check');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0041
     * @tc.name testErrorsOverall0041
     * @tc.desc Verify negativeArraySizeError RangeError type chain consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new NegativeArraySizeError("nas-code");
      expect(err.name).assertEqual('NegativeArraySizeError');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0042
     * @tc.name testErrorsOverall0042
     * @tc.desc Verify arrayIndexOutOfBoundsError RangeError type chain consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new ArrayIndexOutOfBoundsError("aiob-code");
      expect(err.name).assertEqual('ArrayIndexOutOfBoundsError');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0043
     * @tc.name testErrorsOverall0043
     * @tc.desc Verify indexOutOfBoundsError RangeError type chain consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new IndexOutOfBoundsError("iob-code");
      expect(err.name).assertEqual('IndexOutOfBoundsError');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0044
     * @tc.name testErrorsOverall0044
     * @tc.desc Verify stringIndexOutOfBoundsError RangeError type chain consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new StringIndexOutOfBoundsError("siob-code");
      expect(err.name).assertEqual('StringIndexOutOfBoundsError');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0045
     * @tc.name testErrorsOverall0045
     * @tc.desc Verify options.cause is undefined accepts silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("undefcause", { cause: undefined });
      expect(err.cause).assertEqual(undefined);
      expect(err.name).assertEqual('RangeError');
      expect((err as Error).message).assertEqual('undefcause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0046
     * @tc.name testErrorsOverall0046
     * @tc.desc Verify aggregateError constructor array reverse mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(source);
      source.reverse();
      expect(source[0].message).assertEqual("b");
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0047
     * @tc.name testErrorsOverall0047
     * @tc.desc Verify aggregateError errors array is decoupled after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a")];
      const agg = new AggregateError(source);
      source.push(new Error("x"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0048
     * @tc.name testErrorsOverall0048
     * @tc.desc Verify nested cause message independentpreserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const b = new RangeError("b", { cause: a });
      expect(b.message).assertEqual("b");
      expect((b.cause as Error).message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0049
     * @tc.name testErrorsOverall0049
     * @tc.desc Verify error instance message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new RangeError("ra");
      const b = new RangeError("rb");
      expect(a.message).assertEqual("ra");
      expect(b.message).assertEqual("rb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0050
     * @tc.name testErrorsOverall0050
     * @tc.desc Verify aggregateError errors element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("first");
      const e2 = new Error("second");
      const agg = new AggregateError([e1, e2]);
      expect(agg.errors[0]).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0051
     * @tc.name testErrorsOverall0051
     * @tc.desc Verify aggregateError errors element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("first");
      const e2 = new Error("second");
      const agg = new AggregateError([e1, e2]);
      expect(agg.errors[1]).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0052
     * @tc.name testErrorsOverall0052
     * @tc.desc Verify invoke new constructor cause pass through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Error("ic");
      const a = RangeError("im", { cause: c });
      const b = new RangeError("im", { cause: c });
      expect(a.message).assertEqual("im");
      expect((a.cause as Error).message).assertEqual("ic");
      expect(a.cause).assertEqual(c);
      expect(b.message).assertEqual("im");
      expect((b.cause as Error).message).assertEqual("ic");
      expect(b.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0053
     * @tc.name testErrorsOverall0053
     * @tc.desc Verify cross error type matrix keeps stable names and messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const errors: Error[] =
        [new Error("base"), new EvalError("eval"), new RangeError("range"), new ReferenceError("ref"),
          new SyntaxError("syntax"), new TypeError("type"), new URIError("uri"),
          new AggregateError([new Error("inner")], "aggregate"), new AssertionError("assert"),
          new OutOfMemoryError("oom")];
      const names: string[] =
        ["Error", "EvalError", "RangeError", "ReferenceError", "SyntaxError", "TypeError", "URIError", "AggregateError",
          "AssertionError", "OutOfMemoryError"];
      for (let i = 0; i < errors.length; i++) {
        expect(errors[i].name).assertEqual(names[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0054
     * @tc.name testErrorsOverall0054
     * @tc.desc Verify message cause and prototype name values remain readable after update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("descriptor-cause");
      const err = new RangeError("descriptor", { cause: cause });
      err.message = "descriptor-updated";
      expect(err.message).assertEqual("descriptor-updated");
      expect((err.cause as TypeError).message).assertEqual("descriptor-cause");
      expect(err.name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0055
     * @tc.name testErrorsOverall0055
     * @tc.desc Verify assigned error name and message keep updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("dynamic");
      err.message = "custom";
      err.name = "CustomError";
      expect(err.message).assertEqual("custom");
      expect(err.name).assertEqual("CustomError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0056
     * @tc.name testErrorsOverall0056
     * @tc.desc Verify constructed errors keep readable fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const range = new RangeError("freeze");
      const type = new TypeError("seal");
      const syntax = new SyntaxError("locked");
      expect(range.message).assertEqual("freeze");
      expect(type.message).assertEqual("seal");
      expect(syntax.message).assertEqual("locked");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0057
     * @tc.name testErrorsOverall0057
     * @tc.desc Verify Error message and nested cause remain readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("json", { cause: new RangeError("json-cause") });
      expect(err.message).assertEqual("json");
      expect((err.cause as RangeError).message).assertEqual("json-cause");
      expect((err.cause as RangeError).name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0058
     * @tc.name testErrorsOverall0058
     * @tc.desc Verify nested cause chain through aggregate error keeps inner types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new SyntaxError("leaf");
      const middle = new TypeError("middle", { cause: leaf });
      const aggregate = new AggregateError([middle, new RangeError("range")], "aggregate", { cause: middle });
      const outer = new URIError("outer", { cause: aggregate });
      expect(((outer.cause as AggregateError).cause as TypeError).message).assertEqual("middle");
      expect((((outer.cause as AggregateError).cause as TypeError).cause as SyntaxError).name)
        .assertEqual("SyntaxError");
      expect(((outer.cause as AggregateError).errors[0] as TypeError).message).assertEqual("middle");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0059
     * @tc.name testErrorsOverall0059
     * @tc.desc Verify nested aggregate error chain keeps ordered leaf error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf");
      const level1 = new AggregateError([leaf], "level1");
      const level2 = new AggregateError([level1], "level2");
      const level3 = new AggregateError([level2], "level3");
      const level4 = new AggregateError([level3], "level4");
      const fromLevel4 = level4.errors[0] as AggregateError;
      const fromLevel3 = fromLevel4.errors[0] as AggregateError;
      const fromLevel2 = fromLevel3.errors[0] as AggregateError;
      const fromLevel1 = fromLevel2.errors[0] as RangeError;
      expect(fromLevel4.message).assertEqual("level3");
      expect(fromLevel2.message).assertEqual("level1");
      expect(fromLevel1.message).assertEqual("leaf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0060
     * @tc.name testErrorsOverall0060
     * @tc.desc Verify array tuple map and set error composition remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const errorMap = new Map<string, Error>();
      errorMap.set("range", new RangeError("map"));
      const errorSet = new Set<Error>();
      errorSet.add(new TypeError("set"));
      const tuple: [string, RangeError] = ["tuple", new RangeError("tuple-value")];
      const aggregate = new AggregateError([errorMap.get("range")!, tuple[1]], "collections");
      expect(errorMap.get("range")!.name).assertEqual("RangeError");
      expect(errorSet.size).assertEqual(1);
      expect(tuple[0]).assertEqual("tuple");
      expect(tuple[1].message).assertEqual("tuple-value");
      expect(aggregate.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0061
     * @tc.name testErrorsOverall0061
     * @tc.desc Verify function parameter return and promise wrapped error values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const acceptError = (value: Error): string => {
        return value.name + ":" + value.message;
      };
      const createError = (): Promise<Error> => {
        return new Promise<Error>((resolve): void => {
          resolve(new TypeError("promise"));
        });
      };
      expect(acceptError(new RangeError("param"))).assertEqual("RangeError:param");
      const resolved = await createError();
      expect(resolved.name).assertEqual("TypeError");
      expect(resolved.message).assertEqual("promise");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0062
     * @tc.name testErrorsOverall0062
     * @tc.desc Verify repeated reads keep stable name and message values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("cache");
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("cache");
      err.message = "cache-updated";
      expect(err.message).assertEqual("cache-updated");
      expect(err.name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0063
     * @tc.name testErrorsOverall0063
     * @tc.desc Verify prototype linked object differs from plain error shaped object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error = new Error("plain");
      const plain = new OverallPlainErrorLike();
      expect(error.name).assertEqual("Error");
      expect(plain instanceof Error).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0064
     * @tc.name testErrorsOverall0064
     * @tc.desc Verify error name override and explicit object string message proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const renamed = new Error();
      renamed.name = "MySpecialName";
      const objectMessage = new Error(new Object().toString());
      expect(renamed.name).assertEqual("MySpecialName");
      expect(renamed.message).assertEqual("");
      expect(objectMessage.message).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0065
     * @tc.name testErrorsOverall0065
     * @tc.desc Verify repeated construction gives consistent error identity fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new URIError("stable-0");
      const last = new URIError("stable-49");
      expect(first.name).assertEqual("URIError");
      expect(first.message).assertEqual("stable-0");
      expect(last.name).assertEqual("URIError");
      expect(last.message).assertEqual("stable-49");
      expect(first).not().assertEqual(last);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0066
     * @tc.name testErrorsOverall0066
     * @tc.desc Verify complex composed error object keeps static code and aggregate fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aggregate = new AggregateError([new RangeError("range"), new TypeError("type")], "overall");
      const complex: OverallComplexErrorHolder = new OverallComplexErrorHolder(aggregate);
      expect(complex.code).assertEqual(500);
      expect(complex.owner).assertEqual("ErrorsOverallTest");
      expect((complex.primary.cause as AggregateError).errors.length).assertEqual(2);
      expect((complex.aggregate.errors[1] as TypeError).name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0067
     * @tc.name testErrorsOverall0067
     * @tc.desc Verify non-Error subclass with message and name fields (test point 94)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new OverallPlainErrorLike();
      expect(obj.name).assertEqual('Error');
      expect(obj.message).assertEqual('plain');
      expect(obj instanceof Error).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0068
     * @tc.name testErrorsOverall0068
     * @tc.desc Verify new Error() without message defaults to empty (test point 106)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error();
      expect(err.message).assertEqual('');
      expect(err.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0069
     * @tc.name testErrorsOverall0069
     * @tc.desc Verify complex integrated error with static private generic and aggregate (test point 120)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("root-cause");
      const innerAgg = new AggregateError([new RangeError("range"), new SyntaxError("syntax")], "inner-agg");
      const primary = new Error("primary", { cause: cause });
      const outer = new AggregateError([primary, innerAgg], "outer-agg", { cause: primary });
      expect(outer.name).assertEqual('AggregateError');
      expect(outer.message).assertEqual("outer-agg");
      expect(outer.errors.length).assertEqual(2);
      expect(outer.errors[1] instanceof AggregateError).assertTrue();
      expect((outer.cause as Error).message).assertEqual("primary");
      expect((outer.errors[0] as Error).message).assertEqual("primary");
      expect((outer.errors[1] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0070
     * @tc.name testErrorsOverall0070
     * @tc.desc Verify cause nested AggregateError with mixed subtypes (test point 42, 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new RangeError("root");
      const mid = new AggregateError([root], "mid-agg", { cause: root });
      const outer = new TypeError("outer", { cause: mid });
      expect((outer.cause as AggregateError) instanceof AggregateError).assertTrue();
      expect(((outer.cause as AggregateError).errors[0] as RangeError) instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0071
     * @tc.name testErrorsOverall0071
     * @tc.desc Verify all error type names match expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Error("e").name).assertEqual("Error");
      expect(new RangeError("r").name).assertEqual("RangeError");
      expect(new TypeError("t").name).assertEqual("TypeError");
      expect(new AggregateError([], "a").name).assertEqual("AggregateError");
      expect(new AssertionError("a").name).assertEqual("AssertionError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0072
     * @tc.name testErrorsOverall0072
     * @tc.desc Verify all error messages match expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Error("e").message).assertEqual("e");
      expect(new RangeError("r").message).assertEqual("r");
      expect(new TypeError("t").message).assertEqual("t");
      expect(new AggregateError([], "a").message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0073
     * @tc.name testErrorsOverall0073
     * @tc.desc Verify stack property is optional and non-empty when present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err1 = new Error("e");
      const err2 = new RangeError("r");
      const err3 = new TypeError("t");
      const err4 = new AggregateError([new Error("x")], "a");
      expect(err1.stack).not().assertEqual("");
      expect(err2.stack).not().assertEqual("");
      expect(err3.stack).not().assertEqual("");
      expect(err4.stack).not().assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0074
     * @tc.name testErrorsOverall0074
     * @tc.desc Verify integrated custom generic private static aggregate fields (test point 11, 12, 22, 24, 25, 27, 65, 104, 120)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new OverallCustomError("custom");
      const boxed = new OverallErrorBox<OverallCustomError>(custom);
      const privateError = OverallPrivateConstructorError.create("factory");
      const aggregate =
        new AggregateError([boxed.getValue(), new OverallDeepTypeError("deep"), privateError], "integrated",
          { cause: privateError });
      const host = new OverallIntegratedErrorHost(boxed, aggregate);
      host.optionalError = new SyntaxError("optional");
      expect(OverallIntegratedErrorHost.CODE).assertEqual(500);
      expect(host.getPrivateName()).assertEqual("RangeError");
      expect(host.readonlyError.name).assertEqual("TypeError");
      expect(host.getBoxedName()).assertEqual("OverallCustomError");
      expect((host.optionalError as SyntaxError).message).assertEqual("optional");
      expect((host.aggregate.errors[1] as OverallDeepTypeError) instanceof TypeError).assertTrue();
      expect((host.aggregate.cause as OverallPrivateConstructorError).name)
        .assertEqual("OverallPrivateConstructorError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0075
     * @tc.name testErrorsOverall0075
     * @tc.desc Verify accessor getter setter and throwing getter error (test point 34, 35, 116)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const host = new OverallAccessorErrorHost();
      expect(host.error.message).assertEqual("getter");
      host.error = new RangeError("setter");
      expect(host.error.name).assertEqual("RangeError");
      expect(host.error.message).assertEqual("setter");
      try {
        host.throwingError;
        expect().assertFail();
      } catch (e) {
        expect((e as TypeError).name).assertEqual("TypeError");
        expect((e as TypeError).message).assertEqual("getter-error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0076
     * @tc.name testErrorsOverall0076
     * @tc.desc Verify method parameter static return and promise error flow (test point 44, 45, 46, 71, 75)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const boxed = new OverallErrorBox<OverallCustomError>(new OverallCustomError("boxed"));
      const host = new OverallIntegratedErrorHost(boxed, new AggregateError([boxed.getValue()], "method"));
      const staticError = OverallIntegratedErrorHost.createStaticError("static-return");
      const resolved = await host.wrapAsyncError(new URIError("promise-return"));
      expect(host.describeError(new ReferenceError("param"))).assertEqual("ReferenceError:param");
      expect(staticError.message).assertEqual("static-return");
      expect(resolved.name).assertEqual("URIError");
      expect(resolved.message).assertEqual("promise-return");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0077
     * @tc.name testErrorsOverall0077
     * @tc.desc Verify collections and readonly array compose aggregate errors (test point 66, 67, 68, 69, 70)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const errorArray: Error[] = [new Error("array")];
      const tupleLabel: string = "tuple";
      const tupleError: RangeError = new RangeError("tuple-value");
      const readonlyErrors: TypeError[] = [new TypeError("readonly-array")];
      const errorMap = new Map<string, Error>();
      const setValue = new SyntaxError("set-value");
      const errorSet = new Set<Error>();
      errorMap.set("map", new URIError("map-value"));
      errorSet.add(setValue);
      const aggregate =
        new AggregateError([errorArray[0], tupleError, readonlyErrors[0], errorMap.get("map")!, setValue],
          "collections");
      expect(tupleLabel).assertEqual("tuple");
      expect(errorSet.has(setValue)).assertTrue();
      expect((aggregate.errors[1] as RangeError).message).assertEqual("tuple-value");
      expect((aggregate.errors[2] as TypeError).message).assertEqual("readonly-array");
      expect((aggregate.errors[3] as URIError).name).assertEqual("URIError");
      expect(aggregate.errors.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0078
     * @tc.name testErrorsOverall0078
     * @tc.desc Verify multiple error subtype instances remain readable after aggregate composition (test point 97, 98, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const frozen = new RangeError("frozen");
      const sealed = new TypeError("sealed");
      const nonExtensible = new SyntaxError("nonextensible");
      const aggregate = new AggregateError([frozen, sealed, nonExtensible], "locked");
      expect(frozen.name).assertEqual("RangeError");
      expect(sealed.message).assertEqual("sealed");
      expect(nonExtensible.name).assertEqual("SyntaxError");
      expect((aggregate.errors[0] as RangeError).message).assertEqual("frozen");
      expect(aggregate.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0079
     * @tc.name testErrorsOverall0079
     * @tc.desc Verify JSON serialization result keeps original Error readable (test point 111)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Error("json", { cause: new RangeError("json-cause") });
      const encoded = JSON.stringify(original);
      expect(typeof encoded).assertEqual("string");
      expect(encoded instanceof Error).assertFalse();
      expect(original.message).assertEqual("json");
      expect((original.cause as RangeError).name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_OVERALL_0080
     * @tc.name testErrorsOverall0080
     * @tc.desc Verify constructor invoke aggregate cause keeps nested subtypes (test point 36, 37, 39, 40, 42, 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsOverall0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rangeLeaf = RangeError("range-leaf");
      const typeLeaf = new TypeError("type-leaf", { cause: rangeLeaf });
      const inner = new AggregateError([rangeLeaf, typeLeaf], "inner", { cause: typeLeaf });
      const outer = new AggregateError([new SyntaxError("syntax-leaf"), inner], "outer", { cause: inner });
      expect((inner.errors[0] as RangeError).name).assertEqual("RangeError");
      expect((inner.errors[1] as TypeError).name).assertEqual("TypeError");
      expect((((outer.cause as AggregateError).cause as TypeError).cause as RangeError).message)
        .assertEqual("range-leaf");
      expect((outer.errors[0] as SyntaxError).name).assertEqual("SyntaxError");
      expect(((outer.errors[1] as AggregateError).errors[1] as TypeError).message).assertEqual("type-leaf");
    });
  });
}
