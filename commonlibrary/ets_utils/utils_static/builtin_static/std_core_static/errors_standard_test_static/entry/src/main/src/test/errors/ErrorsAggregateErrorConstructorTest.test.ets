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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0078
     * @tc.name testErrorsAggregateErrorConstructor0078
     * @tc.desc Verify constructor source Set clear instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      source.add(new Error("a"));
      source.add(new Error("b"));
      const agg = new AggregateError(source);
      source.clear();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0079
     * @tc.name testErrorsAggregateErrorConstructor0079
     * @tc.desc Verify constructor array reverse instance.errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(source);
      source.reverse();
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0080
     * @tc.name testErrorsAggregateErrorConstructor0080
     * @tc.desc Verify constructor instance.errors arrayis notsame reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a")];
      const agg = new AggregateError(source);
      expect(agg.errors).not().assertEqual(source);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0081
     * @tc.name testErrorsAggregateErrorConstructor0081
     * @tc.desc Verify instance not instanceof RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg instanceof RangeError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0082
     * @tc.name testErrorsAggregateErrorConstructor0082
     * @tc.desc Verify instance not instanceof TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg instanceof TypeError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0083
     * @tc.name testErrorsAggregateErrorConstructor0083
     * @tc.desc Verify instance not instanceof SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg instanceof SyntaxError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0084
     * @tc.name testErrorsAggregateErrorConstructor0084
     * @tc.desc Verify errors element instanceof Error - RangeError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual('RangeError');
      expect(agg.errors[0].message).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0085
     * @tc.name testErrorsAggregateErrorConstructor0085
     * @tc.desc Verify errors element instanceof Error - TypeError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual('TypeError');
      expect(agg.errors[0].message).assertEqual('t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0086
     * @tc.name testErrorsAggregateErrorConstructor0086
     * @tc.desc Verify errors nested AggregateError - instanceof AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const agg = new AggregateError([inner]);
      expect(agg.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0087
     * @tc.name testErrorsAggregateErrorConstructor0087
     * @tc.desc Verify errors nested AggregateError - instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const agg = new AggregateError([inner]);
      expect(agg.errors[0].name).assertEqual('AggregateError');
      expect((agg.errors[0] as AggregateError).errors[0].message).assertEqual('i');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0088
     * @tc.name testErrorsAggregateErrorConstructor0088
     * @tc.desc Verify errors + message empty array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[], "");
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0089
     * @tc.name testErrorsAggregateErrorConstructor0089
     * @tc.desc Verify errors + message - message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[], "");
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0090
     * @tc.name testErrorsAggregateErrorConstructor0090
     * @tc.desc Verify errors + message 2-element message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")], "");
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0091
     * @tc.name testErrorsAggregateErrorConstructor0091
     * @tc.desc Verify large batch errors + message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        arr.push(new Error("e"));
      }
      const longMsg = "x".repeat(1000);
      const agg = new AggregateError(arr, longMsg);
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0092
     * @tc.name testErrorsAggregateErrorConstructor0092
     * @tc.desc Verify heterogeneous errors + cause is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t")], "agg", { cause: new Error("c") });
      expect((agg.cause as Error).message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0093
     * @tc.name testErrorsAggregateErrorConstructor0093
     * @tc.desc Verify heterogeneous errors preserve string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t")], "agg", { cause: "scause" });
      expect(agg.cause).assertEqual("scause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0094
     * @tc.name testErrorsAggregateErrorConstructor0094
     * @tc.desc Verify nested errors + cause is AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const agg = new AggregateError([inner], "outer", { cause: inner });
      expect((agg.cause as AggregateError).errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0095
     * @tc.name testErrorsAggregateErrorConstructor0095
     * @tc.desc Verify iterable overload + message + cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("a"));
      set.add(new RangeError("r"));
      const agg = new AggregateError(set, "agg-set", { cause: "c" });
      expect(agg.message).assertEqual("agg-set");
      expect(agg.cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0096
     * @tc.name testErrorsAggregateErrorConstructor0096
     * @tc.desc Verify iterable overload + large batch + message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 2; j++) {
          set.add(new Error("e" + (i * 2 + j)));
        }
      }
      const agg = new AggregateError(set, "x".repeat(1000));
      expect(agg.message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0097
     * @tc.name testErrorsAggregateErrorConstructor0097
     * @tc.desc Verify errors with cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("i");
      const e = new Error("outer", { cause: inner });
      const agg = new AggregateError([e]);
      expect(((agg.errors[0] as Error).cause as Error).message).assertEqual("i");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0098
     * @tc.name testErrorsAggregateErrorConstructor0098
     * @tc.desc Verify errors heterogeneous - subtype mixed length and instanceof matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg =
        new AggregateError([new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("e")]);
      expect(agg.errors.length).assertEqual(6);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof SyntaxError).assertTrue();
      expect(agg.errors[3] instanceof ReferenceError).assertTrue();
      expect(agg.errors[4] instanceof URIError).assertTrue();
      expect(agg.errors[5] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0099
     * @tc.name testErrorsAggregateErrorConstructor0099
     * @tc.desc Verify errors contains URIError + EvalError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new URIError("u"), new EvalError("e")]);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0100
     * @tc.name testErrorsAggregateErrorConstructor0100
     * @tc.desc Verify errors preserves URIError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new URIError("u"), new EvalError("e")]);
      expect(agg.errors[0] instanceof URIError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0101
     * @tc.name testErrorsAggregateErrorConstructor0101
     * @tc.desc Verify errors preserves EvalError subtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new URIError("u"), new EvalError("e")]);
      expect(agg.errors[1] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0102
     * @tc.name testErrorsAggregateErrorConstructor0102
     * @tc.desc Verify 1 nested - 1 AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const outer = new AggregateError([inner]);
      expect(outer.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0103
     * @tc.name testErrorsAggregateErrorConstructor0103
     * @tc.desc Verify 1 nested - errors[0] message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("hello")]);
      const outer = new AggregateError([inner]);
      expect((outer.errors[0] as AggregateError).errors[0].message).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0104
     * @tc.name testErrorsAggregateErrorConstructor0104
     * @tc.desc Verify 2 nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lvl1 = new AggregateError([new Error("x")]);
      const lvl2 = new AggregateError([lvl1]);
      const lvl3 = new AggregateError([lvl2]);
      expect(((lvl3.errors[0] as AggregateError).errors[0] as AggregateError).errors[0].message).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0105
     * @tc.name testErrorsAggregateErrorConstructor0105
     * @tc.desc Verify nestedmixed - contains AggregateError + Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const outer = new AggregateError([inner, new Error("plain")]);
      expect(outer.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0106
     * @tc.name testErrorsAggregateErrorConstructor0106
     * @tc.desc Verify nestedmixed - 0 is AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const outer = new AggregateError([inner, new Error("plain")]);
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0107
     * @tc.name testErrorsAggregateErrorConstructor0107
     * @tc.desc Verify nestedmixed - 1 is Error is not AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("i")]);
      const outer = new AggregateError([inner, new Error("plain")]);
      expect(outer.errors[1] instanceof AggregateError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0108
     * @tc.name testErrorsAggregateErrorConstructor0108
     * @tc.desc Verify nested cause is AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new AggregateError([new Error("c1"), new Error("c2")]);
      const agg = new AggregateError([new Error("e")], "agg", { cause: cause });
      expect((agg.cause as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0109
     * @tc.name testErrorsAggregateErrorConstructor0109
     * @tc.desc Verify errors nested AggregateError 2 inner outer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1 = new AggregateError([new Error("a")]);
      const i2 = new AggregateError([new Error("b")]);
      const outer = new AggregateError([i1, i2]);
      expect(outer.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0110
     * @tc.name testErrorsAggregateErrorConstructor0110
     * @tc.desc Verify nested - 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1 = new AggregateError([] as Error[]);
      const i2 = new AggregateError([] as Error[]);
      const outer = new AggregateError([i1, i2]);
      expect((outer.errors[0] as AggregateError).errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0111
     * @tc.name testErrorsAggregateErrorConstructor0111
     * @tc.desc Verify explicit errors default message is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[]);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0112
     * @tc.name testErrorsAggregateErrorConstructor0112
     * @tc.desc Verify iterable overload default message is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Error>();
      set.add(new Error("e"));
      const agg = new AggregateError(set);
      expect(agg.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0113
     * @tc.name testErrorsAggregateErrorConstructor0113
     * @tc.desc Verify explicit undefined message equivalent omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg1 = new AggregateError([new Error("e")]);
      const agg2 = new AggregateError([new Error("e")], undefined);
      expect(agg1.message).assertEqual(agg2.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0114
     * @tc.name testErrorsAggregateErrorConstructor0114
     * @tc.desc Verify explicit undefined options equivalent omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg1 = new AggregateError([new Error("e")], "msg");
      const agg2 = new AggregateError([new Error("e")], "msg", undefined);
      expect(agg1.message).assertEqual(agg2.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0115
     * @tc.name testErrorsAggregateErrorConstructor0115
     * @tc.desc Verify errors[0] reference is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("e");
      const agg = new AggregateError([e]);
      expect(agg.errors[0]).assertEqual(e);
    }); 
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0116
     * @tc.name testErrorsAggregateErrorConstructor0116
     * @tc.desc Verify large batch errors + message + cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 10; j++) {
          arr.push(new Error("e"));
        }
      }
      const longMsg = "z".repeat(5000);
      const agg = new AggregateError(arr, longMsg, { cause: "c" });
      expect(agg.errors.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0117
     * @tc.name testErrorsAggregateErrorConstructor0117
     * @tc.desc Verify cause equals Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: Number.MAX_VALUE });
      expect(agg.cause).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0118
     * @tc.name testErrorsAggregateErrorConstructor0118
     * @tc.desc Verify cause equals Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: Number.MIN_VALUE });
      expect(agg.cause).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0119
     * @tc.name testErrorsAggregateErrorConstructor0119
     * @tc.desc Verify cause is AggregateError errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("a"), new Error("b")]);
      const agg = new AggregateError([new Error("e")], "m", { cause: inner.errors });
      expect((agg.cause as Error[]).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0120
     * @tc.name testErrorsAggregateErrorConstructor0120
     * @tc.desc Verify cause equals 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 0xFF });
      expect(agg.cause).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0121
     * @tc.name testErrorsAggregateErrorConstructor0121
     * @tc.desc Verify cause equals 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 0xFFFF });
      expect(agg.cause).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0122
     * @tc.name testErrorsAggregateErrorConstructor0122
     * @tc.desc Verify cause equals 0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 0x7FFFFFFF });
      expect(agg.cause).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0123
     * @tc.name testErrorsAggregateErrorConstructor0123
     * @tc.desc Verify cause equals 0o777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 0o777 });
      expect(agg.cause).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0124
     * @tc.name testErrorsAggregateErrorConstructor0124
     * @tc.desc Verify cause equals 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 0b11111111 });
      expect(agg.cause).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0125
     * @tc.name testErrorsAggregateErrorConstructor0125
     * @tc.desc Verify cause equals 1.0e3 floating point count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 1.0e3 });
      expect(agg.cause).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0126
     * @tc.name testErrorsAggregateErrorConstructor0126
     * @tc.desc Verify cause equals 1.5 floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 1.5 });
      expect(agg.cause).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0127
     * @tc.name testErrorsAggregateErrorConstructor0127
     * @tc.desc Verify cause equals 1+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "m", { cause: 1 + 2 });
      expect(agg.cause).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0128
     * @tc.name testErrorsAggregateErrorConstructor0128
     * @tc.desc Verify chained cause 1 message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("level1");
      const b = new Error("level2", { cause: a });
      const agg = new AggregateError([new Error("e")], "outer", { cause: b });
      expect((agg.cause as Error).message).assertEqual("level2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0129
     * @tc.name testErrorsAggregateErrorConstructor0129
     * @tc.desc Verify chained cause 2 message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("level1");
      const b = new Error("level2", { cause: a });
      const agg = new AggregateError([new Error("e")], "outer", { cause: b });
      expect(((agg.cause as Error).cause as Error).message).assertEqual("level1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0130
     * @tc.name testErrorsAggregateErrorConstructor0130
     * @tc.desc Verify chained cause - cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("L1");
      const b = new Error("L2", { cause: a });
      const c = new Error("L3", { cause: b });
      const agg = new AggregateError([new Error("e")], "outer", { cause: c });
      expect((((agg.cause as Error).cause as Error).cause as Error).message).assertEqual("L1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0131
     * @tc.name testErrorsAggregateErrorConstructor0131
     * @tc.desc Verify cause is RangeError chained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RangeError("rng");
      const agg = new AggregateError([new Error("e")], "m", { cause: r });
      expect((agg.cause as RangeError) instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0132
     * @tc.name testErrorsAggregateErrorConstructor0132
     * @tc.desc Verify cause is TypeError chained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new TypeError("tp");
      const agg = new AggregateError([new Error("e")], "m", { cause: t });
      expect((agg.cause as TypeError) instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0133
     * @tc.name testErrorsAggregateErrorConstructor0133
     * @tc.desc Verify constructor preserves core AggregateError fields together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new RangeError("range");
      const second = new TypeError("type");
      const cause = new URIError("cause");
      const agg = new AggregateError([first, second], "aggregate", { cause: cause });
      expect(agg instanceof AggregateError).assertTrue();
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("aggregate");
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(first);
      expect(agg.errors[1]).assertEqual(second);
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0134
     * @tc.name testErrorsAggregateErrorConstructor0134
     * @tc.desc Verify empty errors with undefined message and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[], undefined, undefined);
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("");
      expect(agg.errors.length).assertEqual(0);
      expect(agg.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0135
     * @tc.name testErrorsAggregateErrorConstructor0135
     * @tc.desc Verify mixed built-in error subtype positions in errors array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t"), new URIError("u"), new EvalError("e")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof URIError).assertTrue();
      expect(agg.errors[3] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0136
     * @tc.name testErrorsAggregateErrorConstructor0136
     * @tc.desc Verify mutating instance errors array does not mutate source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("source")];
      const agg = new AggregateError(source);
      agg.errors.push(new Error("instance"));
      expect(source.length).assertEqual(1);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(source[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0137
     * @tc.name testErrorsAggregateErrorConstructor0137
     * @tc.desc Verify errors property keeps array value and enumerable key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("descriptor")]);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("descriptor");
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0138
     * @tc.name testErrorsAggregateErrorConstructor0138
     * @tc.desc Verify primitive cause values are preserved by constructor options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stringCause = new AggregateError([new Error("e")], "string", { cause: "not an error" });
      const numberCause = new AggregateError([new Error("e")], "number", { cause: 123 });
      const booleanCause = new AggregateError([new Error("e")], "boolean", { cause: true });
      expect(stringCause.cause).assertEqual("not an error");
      expect(numberCause.cause).assertEqual(123);
      expect(booleanCause.cause).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0139
     * @tc.name testErrorsAggregateErrorConstructor0139
     * @tc.desc Verify repeated constructor field reads remain consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("cause");
      const agg = new AggregateError([new RangeError("range")], "stable", { cause: cause });
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("stable");
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0140
     * @tc.name testErrorsAggregateErrorConstructor0140
     * @tc.desc Verify constructor preserves first middle and last entries for 1000 errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [];
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 10; j++) {
          source.push(new Error("item" + (i * 10 + j)));
        }
      }
      const agg = new AggregateError(source);
      expect(agg.errors.length).assertEqual(1000);
      expect(agg.errors[0].message).assertEqual("item0");
      expect(agg.errors[499].message).assertEqual("item499");
      expect(agg.errors[999].message).assertEqual("item999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0141
     * @tc.name testErrorsAggregateErrorConstructor0141
     * @tc.desc Verify comprehensive constructor behavior with nested errors and cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("inner")], "inner-msg");
      const cause = new AggregateError([new TypeError("cause")], "cause-msg");
      const outer = new AggregateError([inner, new RangeError("range")], "outer-msg", { cause: cause });
      expect(outer.name).assertEqual("AggregateError");
      expect(outer.message).assertEqual("outer-msg");
      expect(outer.errors.length).assertEqual(2);
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
      expect((outer.errors[0] as AggregateError).message).assertEqual("inner-msg");
      expect(outer.errors[1] instanceof RangeError).assertTrue();
      expect((outer.cause as AggregateError).errors[0] instanceof TypeError).assertTrue();
      expect((outer.cause as AggregateError).message).assertEqual("cause-msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0142
     * @tc.name testErrorsAggregateErrorConstructor0142
     * @tc.desc Verify iterable iterator throws pass through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iterable: Iterable<Error> = {
        $_iterator(): IterableIterator<Error> {
          throw new Error("iter-fail");
        }
      };
      try {
        new AggregateError(iterable);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual("iter-fail");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0143
     * @tc.name testErrorsAggregateErrorConstructor0143
     * @tc.desc Verify nested AggregateError layered type resolution (test point 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new Error("leaf");
      const mid = new AggregateError([leaf], "mid");
      const outer = new AggregateError([mid], "outer");
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(leaf);
      expect((outer.errors[0] as AggregateError).message).assertEqual("mid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0144
     * @tc.name testErrorsAggregateErrorConstructor0144
     * @tc.desc Verify multi-type mixed array native and custom errors (test point 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s")]);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[1] instanceof RangeError).assertTrue();
      expect(agg.errors[2] instanceof TypeError).assertTrue();
      expect(agg.errors[3] instanceof SyntaxError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0145
     * @tc.name testErrorsAggregateErrorConstructor0145
     * @tc.desc Verify cause property nested Error chain (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerCause = new Error("root-cause");
      const agg = new AggregateError([new Error("e")], "msg", { cause: innerCause });
      expect((agg.cause as Error).message).assertEqual("root-cause");
      expect((agg.cause as Error).name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0146
     * @tc.name testErrorsAggregateErrorConstructor0146
     * @tc.desc Verify deeply nested cause chain Error-in-Error (test point 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const mid = new Error("mid", { cause: root });
      const agg = new AggregateError([new Error("e")], "outer", { cause: mid });
      expect(((agg.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0147
     * @tc.name testErrorsAggregateErrorConstructor0147
     * @tc.desc Verify empty string message boundary (test point 82)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "");
      expect(agg.message).assertEqual("");
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0148
     * @tc.name testErrorsAggregateErrorConstructor0148
     * @tc.desc Verify errors array is independent copy of source (test point 38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(source);
      source.push(new Error("c"));
      expect(agg.errors.length).assertEqual(2);
      expect(source.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0149
     * @tc.name testErrorsAggregateErrorConstructor0149
     * @tc.desc Verify cause as AggregateError nested type resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAgg = new AggregateError([new RangeError("r"), new TypeError("t")], "inner");
      const outer = new AggregateError([new Error("e")], "outer", { cause: innerAgg });
      expect((outer.cause as AggregateError) instanceof AggregateError).assertTrue();
      expect((outer.cause as AggregateError).errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0150
     * @tc.name testErrorsAggregateErrorConstructor0150
     * @tc.desc Verify errors containing all standard error subtypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] =
        [new Error("e"), new RangeError("r"), new TypeError("t"), new SyntaxError("s"), new ReferenceError("ref"),
          new URIError("u"), new EvalError("ev"), new AssertionError("a")];
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(8);
      expect(agg.errors[3] instanceof SyntaxError).assertTrue();
      expect(agg.errors[6] instanceof EvalError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0151
     * @tc.name testErrorsAggregateErrorConstructor0151
     * @tc.desc Verify AggregateError constructor preserves errors length and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "sealed");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.name).assertEqual("AggregateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0152
     * @tc.name testErrorsAggregateErrorConstructor0152
     * @tc.desc Verify metadata cache consistency 100 reads (test point 117)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("cache")], "cached");
      const firstMsg = agg.message;
      const firstLen = agg.errors.length;
      for (let i = 0; i < 100; i++) {
        expect(agg.message).assertEqual(firstMsg);
        expect(agg.errors.length).assertEqual(firstLen);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0153
     * @tc.name testErrorsAggregateErrorConstructor0153
     * @tc.desc Verify constructor preserves first error reference and type after mutation (test point 36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error = new RangeError("before");
      const agg = new AggregateError([error]);
      error.message = "after";
      expect(agg.errors[0]).assertEqual(error);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[0].message).assertEqual("after");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0154
     * @tc.name testErrorsAggregateErrorConstructor0154
     * @tc.desc Verify constructor preserves second error reference and type after mutation (test point 37)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const second = new TypeError("before");
      const agg = new AggregateError([new Error("first"), second]);
      second.message = "after";
      expect(agg.errors[1]).assertEqual(second);
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[1].message).assertEqual("after");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0155
     * @tc.name testErrorsAggregateErrorConstructor0155
     * @tc.desc Verify empty errors array with explicit cause is preserved (test points 38 and 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("empty-cause");
      const agg = new AggregateError([] as Error[], "empty", { cause: cause });
      expect(agg.errors.length).assertEqual(0);
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error).message).assertEqual("empty-cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0156
     * @tc.name testErrorsAggregateErrorConstructor0156
     * @tc.desc Verify same Error instance can be both errors element and cause (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Error("shared");
      const agg = new AggregateError([shared], "same", { cause: shared });
      expect(agg.errors[0]).assertEqual(shared);
      expect(agg.cause).assertEqual(shared);
      expect((agg.cause as Error).message).assertEqual("shared");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0157
     * @tc.name testErrorsAggregateErrorConstructor0157
     * @tc.desc Verify nested AggregateError preserves inner cause and error type (test points 39 and 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new TypeError("root");
      const inner = new AggregateError([new RangeError("range")], "inner", { cause: root });
      const outer = new AggregateError([inner], "outer");
      const innerFromOuter = outer.errors[0] as AggregateError;
      expect(innerFromOuter instanceof AggregateError).assertTrue();
      expect(innerFromOuter.errors[0] instanceof RangeError).assertTrue();
      expect((innerFromOuter.cause as TypeError).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0158
     * @tc.name testErrorsAggregateErrorConstructor0158
     * @tc.desc Verify nested AggregateError can be shared by errors and cause (test points 39 and 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new AggregateError([new Error("inner")], "inner-msg");
      const outer = new AggregateError([inner], "outer-msg", { cause: inner });
      expect(outer.errors[0]).assertEqual(inner);
      expect(outer.cause).assertEqual(inner);
      expect((outer.cause as AggregateError).errors[0].message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0159
     * @tc.name testErrorsAggregateErrorConstructor0159
     * @tc.desc Verify large AggregateError message boundary is preserved (test point 81)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMsg = "m".repeat(65536);
      const agg = new AggregateError([new Error("e")], longMsg);
      expect(agg.message.length).assertEqual(65536);
      expect(agg.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0160
     * @tc.name testErrorsAggregateErrorConstructor0160
     * @tc.desc Verify AggregateError message preserves line break and tab characters (test point 63)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const message = "line1\nline2\tend";
      const agg = new AggregateError([new Error("e")], message);
      expect(agg.message).assertEqual(message);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0161
     * @tc.name testErrorsAggregateErrorConstructor0161
     * @tc.desc Verify instance errors pop does not mutate original source array (test point 38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(source);
      const removed = agg.errors.pop() as Error;
      expect(removed.message).assertEqual("b");
      expect(agg.errors.length).assertEqual(1);
      expect(source.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0162
     * @tc.name testErrorsAggregateErrorConstructor0162
     * @tc.desc Verify instance errors splice does not mutate original source array (test point 38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      const agg = new AggregateError(source);
      const removed: Error[] = agg.errors.splice(1, 1);
      expect(removed.length).assertEqual(1);
      expect(removed[0].message).assertEqual("b");
      expect(agg.errors.length).assertEqual(2);
      expect(source.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0163
     * @tc.name testErrorsAggregateErrorConstructor0163
     * @tc.desc Verify Map values iterable can carry nested AggregateError entries (test points 69 and 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const inner = new AggregateError([new Error("inner")], "inner-msg");
      map.set("inner", inner);
      map.set("type", new TypeError("type"));
      const agg = new AggregateError(map.values(), "map-values");
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(inner);
      expect((agg.errors[0] as AggregateError).errors[0].message).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0164
     * @tc.name testErrorsAggregateErrorConstructor0164
     * @tc.desc Verify empty string cause is preserved independently from message (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "message", { cause: "" });
      expect(agg.message).assertEqual("message");
      expect(agg.cause).assertEqual("");
      expect(agg.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0165
     * @tc.name testErrorsAggregateErrorConstructor0165
     * @tc.desc Verify AggregateError constructor throws ClassCastError when errors is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new AggregateError(null as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_CONSTRUCTOR_0166
     * @tc.name testErrorsAggregateErrorConstructor0166
     * @tc.desc Verify AggregateError constructor throws ClassCastError when errors is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorConstructor0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new AggregateError(undefined as Error[]);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });
  });
}
