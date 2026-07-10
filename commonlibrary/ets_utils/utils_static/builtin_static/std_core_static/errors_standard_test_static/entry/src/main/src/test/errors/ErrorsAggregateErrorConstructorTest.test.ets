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

export default function ErrorsAggregateErrorConstructorTest(): void {
  describe('ErrorsAggregateErrorConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0001
     * @tc.name testErrorsAggregateErrorConstructor0001
     * @tc.desc Verify 1 parameter - with only errors array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e1")]);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0002
     * @tc.name testErrorsAggregateErrorConstructor0002
     * @tc.desc Verify errors contains all error subtypes instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        new AggregateError([new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("e")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
      expect(agg.errors[3] instanceof ReferenceError).assertTrue();
      expect(agg.errors[4] instanceof URIError).assertTrue();
      expect(agg.errors[5] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0003
     * @tc.name testErrorsAggregateErrorConstructor0003
     * @tc.desc Verify errors mixed Error+RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new RangeError("r")]);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[1] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0004
     * @tc.name testErrorsAggregateErrorConstructor0004
     * @tc.desc Verify errors mixed Error+TypeError 1 is TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new TypeError("t")]);
      expect(agg.errors[1] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0005
     * @tc.name testErrorsAggregateErrorConstructor0005
     * @tc.desc Verify errors mixed RangeError+TypeError 0 is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0006
     * @tc.name testErrorsAggregateErrorConstructor0006
     * @tc.desc Verify errors heterogeneous mixed length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new RangeError("r"), new TypeError("t")]);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0007
     * @tc.name testErrorsAggregateErrorConstructor0007
     * @tc.desc Verify errors heterogeneous mixed 0 is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new RangeError("r"), new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual('Error');
      expect(agg.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0008
     * @tc.name testErrorsAggregateErrorConstructor0008
     * @tc.desc Verify errors all is RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("a"), new RangeError("b")]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0009
     * @tc.name testErrorsAggregateErrorConstructor0009
     * @tc.desc Verify errors all is TypeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new TypeError("a"), new TypeError("b")]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0010
     * @tc.name testErrorsAggregateErrorConstructor0010
     * @tc.desc Verify errors all is Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("dup"), new Error("dup")]);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("dup");
      expect(agg.errors[1].message).assertEqual("dup");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0011
     * @tc.name testErrorsAggregateErrorConstructor0011
     * @tc.desc Verify errors contains same reference duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("ref");
      const agg = new AggregateError([e, e, e]);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0012
     * @tc.name testErrorsAggregateErrorConstructor0012
     * @tc.desc Verify errors same referenceduplicate - all object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("ref");
      const agg = new AggregateError([e, e]);
      expect(agg.errors[0]).assertEqual(agg.errors[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0013
     * @tc.name testErrorsAggregateErrorConstructor0013
     * @tc.desc Verify errors 1000 element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 10; j++) {
          arr.push(new Error("e" + (i * 10 + j)));
        }
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(1000);
      expect(agg.errors[0].message).assertEqual("e0");
      expect(agg.errors[999].message).assertEqual("e999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0014
     * @tc.name testErrorsAggregateErrorConstructor0014
     * @tc.desc Verify errors contains AggregateError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("inner")]);
      const outer = new AggregateError([inner]);
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0015
     * @tc.name testErrorsAggregateErrorConstructor0015
     * @tc.desc Verify errors nested AggregateError errors length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("a"), new Error("b")]);
      const outer = new AggregateError([inner]);
      expect((outer.errors[0] as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0016
     * @tc.name testErrorsAggregateErrorConstructor0016
     * @tc.desc Verify errors nested AggregateError 3-level chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lvl1 = new AggregateError([new Error("x")]);
      const lvl2 = new AggregateError([lvl1]);
      const lvl3 = new AggregateError([lvl2]);
      expect(lvl3.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0017
     * @tc.name testErrorsAggregateErrorConstructor0017
     * @tc.desc Verify errors array constructor single element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new Error("a")];
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0018
     * @tc.name testErrorsAggregateErrorConstructor0018
     * @tc.desc Verify iterable Set empty collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0019
     * @tc.name testErrorsAggregateErrorConstructor0019
     * @tc.desc Verify Set iterable preserves multiple element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("a"));
      set.add(new Error("b"));
      set.add(new Error("c"));
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0020
     * @tc.name testErrorsAggregateErrorConstructor0020
     * @tc.desc Verify iterable Set preserves element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new RangeError("r"));
      const agg = new AggregateError(set);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0021
     * @tc.name testErrorsAggregateErrorConstructor0021
     * @tc.desc Verify iterable Set element message preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("hello"));
      const agg = new AggregateError(set);
      expect(agg.errors[0].message).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0022
     * @tc.name testErrorsAggregateErrorConstructor0022
     * @tc.desc Verify iterable Set contains mixed subtype length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("e"));
      set.add(new RangeError("r"));
      set.add(new TypeError("t"));
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0023
     * @tc.name testErrorsAggregateErrorConstructor0023
     * @tc.desc Verify iterable Set nested AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new AggregateError([new Error("inner")]));
      const agg = new AggregateError(set);
      expect(agg.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0024
     * @tc.name testErrorsAggregateErrorConstructor0024
     * @tc.desc Verify iterable Map.values is source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("a", new Error("ma"));
      map.set("b", new Error("mb"));
      const agg = new AggregateError(map.values());
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0025
     * @tc.name testErrorsAggregateErrorConstructor0025
     * @tc.desc Verify iterable Map.values element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set("a", new Error("ma"));
      const agg = new AggregateError(map.values());
      expect(agg.errors[0].message).assertEqual("ma");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0026
     * @tc.name testErrorsAggregateErrorConstructor0026
     * @tc.desc Verify iterable Set contains Error Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("dup");
      const set = new Set<Error>();
      set.add(e);
      set.add(e);
      const agg = new AggregateError(set);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("dup");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0027
     * @tc.name testErrorsAggregateErrorConstructor0027
     * @tc.desc Verify iterable Array is Iterable overload contains RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new RangeError("r"), new Error("e")];
      const agg = new AggregateError(arr);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0028
     * @tc.name testErrorsAggregateErrorConstructor0028
     * @tc.desc Verify iterable Set element order preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("first"));
      set.add(new Error("second"));
      const agg = new AggregateError(set);
      expect(agg.errors[0].message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0029
     * @tc.name testErrorsAggregateErrorConstructor0029
     * @tc.desc Verify message equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "a".repeat(1000);
      const agg = new AggregateError([new Error("e")], longMsg);
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0030
     * @tc.name testErrorsAggregateErrorConstructor0030
     * @tc.desc Verify message equals quoted escaped quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "\"quoted\"");
      expect(agg.message).assertEqual("\"quoted\"");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0031
     * @tc.name testErrorsAggregateErrorConstructor0031
     * @tc.desc Verify message when options.cause is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: undefined });
      expect(agg.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0032
     * @tc.name testErrorsAggregateErrorConstructor0032
     * @tc.desc Verify options.cause equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: undefined });
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0033
     * @tc.name testErrorsAggregateErrorConstructor0033
     * @tc.desc Verify options.cause equals new Error inner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const agg = new AggregateError([new Error("e")], "msg", { cause: inner });
      expect((agg.cause as Error).message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0034
     * @tc.name testErrorsAggregateErrorConstructor0034
     * @tc.desc Verify options.cause equals new RangeError inner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new RangeError("rng");
      const agg = new AggregateError([new Error("e")], "msg", { cause: inner });
      expect((agg.cause as Error).message).assertEqual("rng");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0035
     * @tc.name testErrorsAggregateErrorConstructor0035
     * @tc.desc Verify options.cause equals new TypeError inner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new TypeError("typ");
      const agg = new AggregateError([new Error("e")], "msg", { cause: inner });
      expect((agg.cause as Error).message).assertEqual("typ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0036
     * @tc.name testErrorsAggregateErrorConstructor0036
     * @tc.desc Verify options.cause equals new SyntaxError inner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new SyntaxError("syn");
      const agg = new AggregateError([new Error("e")], "msg", { cause: inner });
      expect((agg.cause as Error).message).assertEqual("syn");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0037
     * @tc.name testErrorsAggregateErrorConstructor0037
     * @tc.desc Verify options.cause equals 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: 42 });
      expect(agg.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0038
     * @tc.name testErrorsAggregateErrorConstructor0038
     * @tc.desc Verify options.cause equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: -1 });
      expect(agg.cause).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0039
     * @tc.name testErrorsAggregateErrorConstructor0039
     * @tc.desc Verify options.cause preserves numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aggMax = new AggregateError([new Error("e")], "msg", { cause: Number.MAX_SAFE_INTEGER });
      expect(aggMax.cause).assertEqual(Number.MAX_SAFE_INTEGER);
      const aggMin = new AggregateError([new Error("e")], "msg", { cause: Number.MIN_SAFE_INTEGER });
      expect(aggMin.cause).assertEqual(Number.MIN_SAFE_INTEGER);
      const aggNaN = new AggregateError([new Error("e")], "msg", { cause: Number.NaN });
      expect(isNaN(aggNaN.cause as number)).assertTrue();
      const aggPosInf = new AggregateError([new Error("e")], "msg", { cause: Number.POSITIVE_INFINITY });
      expect(aggPosInf.cause).assertEqual(Number.POSITIVE_INFINITY);
      const aggNegInf = new AggregateError([new Error("e")], "msg", { cause: Number.NEGATIVE_INFINITY });
      expect(aggNegInf.cause).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0040
     * @tc.name testErrorsAggregateErrorConstructor0040
     * @tc.desc Verify options.cause equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: true });
      expect(agg.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0041
     * @tc.name testErrorsAggregateErrorConstructor0041
     * @tc.desc Verify options.cause equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: false });
      expect(agg.cause).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0042
     * @tc.name testErrorsAggregateErrorConstructor0042
     * @tc.desc Verify options.cause equals object key v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Error("v");
      const agg = new AggregateError([new Error("e")], "msg", { cause: obj });
      expect((agg.cause as Error).message).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0043
     * @tc.name testErrorsAggregateErrorConstructor0043
     * @tc.desc Verify options.cause equals array [1 2 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: new Array<number>(1, 2, 3) });
      expect((agg.cause as Array<number>).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0044
     * @tc.name testErrorsAggregateErrorConstructor0044
     * @tc.desc Verify options.cause equals object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: new Error("object") });
      expect((agg.cause as Error).message).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0045
     * @tc.name testErrorsAggregateErrorConstructor0045
     * @tc.desc Verify options.cause equals array []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: [] as number[] });
      expect((agg.cause as Array<number>).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0046
     * @tc.name testErrorsAggregateErrorConstructor0046
     * @tc.desc Verify options.cause equals AggregateError nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("ix")], "inner");
      const agg = new AggregateError([new Error("e")], "msg", { cause: inner });
      expect((agg.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0047
     * @tc.name testErrorsAggregateErrorConstructor0047
     * @tc.desc Verify options.cause equals 0x7B hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: 0x7B });
      expect(agg.cause).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0048
     * @tc.name testErrorsAggregateErrorConstructor0048
     * @tc.desc Verify options.cause equals 0o17 octal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: 0o17 });
      expect(agg.cause).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0049
     * @tc.name testErrorsAggregateErrorConstructor0049
     * @tc.desc Verify options.cause equals 0b1010 binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: 0b1010 });
      expect(agg.cause).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0050
     * @tc.name testErrorsAggregateErrorConstructor0050
     * @tc.desc Verify options.cause equals 1e10 count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: 1e10 });
      expect(agg.cause).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0051
     * @tc.name testErrorsAggregateErrorConstructor0051
     * @tc.desc Verify options.cause equals Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: Number.EPSILON });
      expect(agg.cause).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0052
     * @tc.name testErrorsAggregateErrorConstructor0052
     * @tc.desc Verify options.cause equals deep Error cause.cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("e1");
      const e2 = new Error("e2", { cause: e1 });
      const agg = new AggregateError([new Error("e")], "msg", { cause: e2 });
      expect(((agg.cause as Error).cause as Error).message).assertEqual("e1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0053
     * @tc.name testErrorsAggregateErrorConstructor0053
     * @tc.desc Verify error[] overload - explicitarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")] as Error[]);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0054
     * @tc.name testErrorsAggregateErrorConstructor0054
     * @tc.desc Verify overload equivalence - element Set Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new Error("x"), new Error("y")];
      const set = new Set<Error>();
      set.add(new Error("x"));
      set.add(new Error("y"));
      const a1 = new AggregateError(arr);
      const a2 = new AggregateError(set);
      expect(a1.errors.length).assertEqual(2);
      expect(a1.errors[0].message).assertEqual("x");
      expect(a1.errors[1].message).assertEqual("y");
      expect(a2.errors.length).assertEqual(2);
      expect(a2.errors[0].message).assertEqual("x");
      expect(a2.errors[1].message).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0055
     * @tc.name testErrorsAggregateErrorConstructor0055
     * @tc.desc Verify overload equivalence - Array Set length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      const set = new Set<Error>();
      const a1 = new AggregateError(arr);
      const a2 = new AggregateError(set);
      expect(a1.errors.length).assertEqual(0);
      expect(a2.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0056
     * @tc.name testErrorsAggregateErrorConstructor0056
     * @tc.desc Verify overload equivalence - Array+message Set+message message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new Error("e")];
      const set = new Set<Error>();
      set.add(new Error("e"));
      const a1 = new AggregateError(arr, "common");
      const a2 = new AggregateError(set, "common");
      expect(a1.message).assertEqual("common");
      expect(a1.errors[0].message).assertEqual("e");
      expect(a2.message).assertEqual("common");
      expect(a2.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0057
     * @tc.name testErrorsAggregateErrorConstructor0057
     * @tc.desc Verify overload equivalence - Array+options.cause Set+options.cause cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new Error("e")];
      const set = new Set<Error>();
      set.add(new Error("e"));
      const a1 = new AggregateError(arr, "msg", { cause: "x" });
      const a2 = new AggregateError(set, "msg", { cause: "x" });
      expect(a1.message).assertEqual("msg");
      expect(a1.cause).assertEqual("x");
      expect(a1.errors[0].message).assertEqual("e");
      expect(a2.message).assertEqual("msg");
      expect(a2.cause).assertEqual("x");
      expect(a2.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0058
     * @tc.name testErrorsAggregateErrorConstructor0058
     * @tc.desc Verify error[] overload + message + options parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: "c" });
      expect(agg.message).assertEqual("msg");
      expect(agg.cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0059
     * @tc.name testErrorsAggregateErrorConstructor0059
     * @tc.desc Verify iterable overload + message + options parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("e"));
      const agg = new AggregateError(set, "msg", { cause: "c" });
      expect(agg.message).assertEqual("msg");
      expect(agg.cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0060
     * @tc.name testErrorsAggregateErrorConstructor0060
     * @tc.desc Verify error array overload returns Array errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0061
     * @tc.name testErrorsAggregateErrorConstructor0061
     * @tc.desc Verify iterable overload returns Array errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("a"));
      const agg = new AggregateError(set);
      expect(agg.errors instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0062
     * @tc.name testErrorsAggregateErrorConstructor0062
     * @tc.desc Verify return value is AggregateError instance and Error top parent class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg.name).assertEqual('AggregateError');
      expect(agg instanceof AggregateError).assertTrue();
      expect(agg instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0063
     * @tc.name testErrorsAggregateErrorConstructor0063
     * @tc.desc Verify return value is Error top parent class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "parent-msg");
      expect(agg.message).assertEqual("parent-msg");
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0064
     * @tc.name testErrorsAggregateErrorConstructor0064
     * @tc.desc Verify name propertyis AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg.name).assertEqual("AggregateError");
      expect((agg as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0065
     * @tc.name testErrorsAggregateErrorConstructor0065
     * @tc.desc Verify errors element all is Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new RangeError("r"), new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual('Error');
      expect(agg.errors[1].name).assertEqual('RangeError');
      expect(agg.errors[2].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0066
     * @tc.name testErrorsAggregateErrorConstructor0066
     * @tc.desc Verify cause omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg");
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0067
     * @tc.name testErrorsAggregateErrorConstructor0067
     * @tc.desc Verify errors[0] passed in 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("first");
      const agg = new AggregateError([e0, new Error("b")]);
      expect(agg.errors[0]).assertEqual(e0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0068
     * @tc.name testErrorsAggregateErrorConstructor0068
     * @tc.desc Verify errors for-of iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      let count = 0;
      for (const item of agg.errors) {
        expect(item.name).assertEqual('Error');
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0069
     * @tc.name testErrorsAggregateErrorConstructor0069
     * @tc.desc Verify errors for-of element message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      let s = "";
      for (const e of agg.errors) {
        s = s + (e as Error).message;
      }
      expect(s).assertEqual("ab");
    }); 

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0070
     * @tc.name testErrorsAggregateErrorConstructor0070
     * @tc.desc Verify instance object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new AggregateError([new Error("e")]);
      const a2 = new AggregateError([new Error("e")]);
      expect(a1).not().assertEqual(a2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0071
     * @tc.name testErrorsAggregateErrorConstructor0071
     * @tc.desc Verify errors nested AggregateError passes silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const agg = new AggregateError([inner]);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0072
     * @tc.name testErrorsAggregateErrorConstructor0072
     * @tc.desc Verify options.cause equals undefined passes silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg", { cause: undefined });
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0073
     * @tc.name testErrorsAggregateErrorConstructor0073
     * @tc.desc Verify errors contains emoji message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("😀")]);
      expect(agg.errors[0].message).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0074
     * @tc.name testErrorsAggregateErrorConstructor0074
     * @tc.desc Verify constructor copies array errors independently from source mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(source);
      source.push(new Error("c"));
      expect(agg.errors.length).assertEqual(2);
      source.pop();
      expect(agg.errors.length).assertEqual(2);
      source.splice(0, 2);
      expect(agg.errors.length).assertEqual(2);
      source.shift();
      expect(agg.errors.length).assertEqual(2);
      source.length = 0;
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0075
     * @tc.name testErrorsAggregateErrorConstructor0075
     * @tc.desc Verify constructor arrayfirst item message - element object preserve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("orig");
      const source: Error[] = [e];
      const agg = new AggregateError(source);
      expect(agg.errors[0]).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0076
     * @tc.name testErrorsAggregateErrorConstructor0076
     * @tc.desc Verify constructor source Set add instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      source.add(new Error("a"));
      const agg = new AggregateError(source);
      source.add(new Error("b"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0077
     * @tc.name testErrorsAggregateErrorConstructor0077
     * @tc.desc Verify constructor source Set delete instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("a");
      const source = new Set<Error>();
      source.add(e);
      source.add(new Error("b"));
      const agg = new AggregateError(source);
      source.delete(e);
      expect(agg.errors.length).assertEqual(2);
    });
