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

export default function ErrorsAggregateErrorPropertyTest(): void {
  describe('ErrorsAggregateErrorPropertyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0001
     * @tc.name testErrorsAggregateErrorProperty0001
     * @tc.desc Verify parameter Iterable overload errors element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<Error>();
      const agg = new AggregateError(source);
      source.add(new Error("late"));
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0002
     * @tc.name testErrorsAggregateErrorProperty0002
     * @tc.desc Verify parameter Error[] overload errors element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [];
      const agg = new AggregateError(source);
      expect(agg.errors.length).assertEqual(0);
      expect(agg.errors).not().assertEqual(source);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0003
     * @tc.name testErrorsAggregateErrorProperty0003
     * @tc.desc Verify parameter errors message errors element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("e1")];
      const agg = new AggregateError(source, "msg");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors).not().assertEqual(source);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0004
     * @tc.name testErrorsAggregateErrorProperty0004
     * @tc.desc Verify parameter errors message options errors element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e1"), new Error("e2")], "msg", { cause: "c" });
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0005
     * @tc.name testErrorsAggregateErrorProperty0005
     * @tc.desc Verify single Error constructor preserves errors length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Error[] = [new Error("e1")];
      const agg = new AggregateError(source);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors).not().assertEqual(source);
      expect(agg.errors[0].message).assertEqual("e1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0006
     * @tc.name testErrorsAggregateErrorProperty0006
     * @tc.desc Verify two Error constructor preserves errors length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0007
     * @tc.name testErrorsAggregateErrorProperty0007
     * @tc.desc Verify three Error constructor preserves errors length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b"), new Error("c")]);
      expect(agg.errors.length).assertEqual(3);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0008
     * @tc.name testErrorsAggregateErrorProperty0008
     * @tc.desc Verify array element all is same reference length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Error("shared");
      const agg = new AggregateError([shared, shared, shared]);
      expect(agg.errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0009
     * @tc.name testErrorsAggregateErrorProperty0009
     * @tc.desc Verify repeated array elements keep the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Error("shared");
      const agg = new AggregateError([shared, shared]);
      expect(agg.errors[0]).assertEqual(agg.errors[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0010
     * @tc.name testErrorsAggregateErrorProperty0010
     * @tc.desc Verify errors array contains 100 element length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        arr.push(new Error("e" + i));
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0011
     * @tc.name testErrorsAggregateErrorProperty0011
     * @tc.desc Verify errors array contains 1000 element large batch length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 10; j++) {
          arr.push(new Error("e" + (i * 10 + j)));
        }
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(1000);
      expect(agg.errors[0].message).assertEqual("e0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0012
     * @tc.name testErrorsAggregateErrorProperty0012
     * @tc.desc Verify empty Set<Error> input produces errors length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const agg = new AggregateError(s);
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0013
     * @tc.name testErrorsAggregateErrorProperty0013
     * @tc.desc Verify single element Set<Error> input produces errors length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("e1"));
      const agg = new AggregateError(s);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0014
     * @tc.name testErrorsAggregateErrorProperty0014
     * @tc.desc Verify set<Error> passed inheterogeneous errors order is preservediterationorder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      const a = new RangeError("r");
      const b = new TypeError("t");
      s.add(a);
      s.add(b);
      const agg = new AggregateError(s);
      expect(agg.errors[0]).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0015
     * @tc.name testErrorsAggregateErrorProperty0015
     * @tc.desc Verify set<Error> passed in errors is array type element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Error>();
      s.add(new Error("e"));
      const agg = new AggregateError(s);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0016
     * @tc.name testErrorsAggregateErrorProperty0016
     * @tc.desc Verify set<Error> single element errors[0] reference equality element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error("only");
      const s = new Set<Error>();
      s.add(e);
      const agg = new AggregateError(s);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0017
     * @tc.name testErrorsAggregateErrorProperty0017
     * @tc.desc Verify array is Iterable passed in errors element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(arr as Iterable<Error>);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0018
     * @tc.name testErrorsAggregateErrorProperty0018
     * @tc.desc Verify map values iterable preserves errors order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, Error>();
      const v0 = new Error("v0");
      const v1 = new Error("v1");
      m.set(0, v0);
      m.set(1, v1);
      const agg = new AggregateError(m.values());
      expect(agg.errors[1]).assertEqual(v1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0019
     * @tc.name testErrorsAggregateErrorProperty0019
     * @tc.desc Verify errors array preserves element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0020
     * @tc.name testErrorsAggregateErrorProperty0020
     * @tc.desc Verify constructor returns Array errors with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[]);
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.errors.length).assertEqual(0);
      agg.errors.push(new Error("added"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0021
     * @tc.name testErrorsAggregateErrorProperty0021
     * @tc.desc Verify errors RangeError element is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[0].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0022
     * @tc.name testErrorsAggregateErrorProperty0022
     * @tc.desc Verify errors RangeError element preserves inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual('RangeError');
      expect(agg.errors[0].message).assertEqual('r');
      expect(agg.errors[0] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0023
     * @tc.name testErrorsAggregateErrorProperty0023
     * @tc.desc Verify errors TypeError element is TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new TypeError("t")]);
      expect(agg.errors[0] instanceof TypeError).assertTrue();
      expect(agg.errors[0].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0024
     * @tc.name testErrorsAggregateErrorProperty0024
     * @tc.desc Verify errors TypeError element is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new TypeError("t")]);
      expect(agg.errors[0].name).assertEqual('TypeError');
      expect(agg.errors[0] instanceof TypeError).assertTrue();
      expect(agg.errors[0].message).assertEqual('t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0025
     * @tc.name testErrorsAggregateErrorProperty0025
     * @tc.desc Verify errors SyntaxError element is SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new SyntaxError("s")]);
      expect(agg.errors[0] instanceof SyntaxError).assertTrue();
      expect(agg.errors[0].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0026
     * @tc.name testErrorsAggregateErrorProperty0026
     * @tc.desc Verify errors ReferenceError element is ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new ReferenceError("ref")]);
      expect(agg.errors[0] instanceof ReferenceError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0027
     * @tc.name testErrorsAggregateErrorProperty0027
     * @tc.desc Verify errors URIError element is URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new URIError("u")]);
      expect(agg.errors[0] instanceof URIError).assertTrue();
      expect(agg.errors[0].name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0028
     * @tc.name testErrorsAggregateErrorProperty0028
     * @tc.desc Verify errors element name fieldpreserve RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r")]);
      expect(agg.errors[0].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0029
     * @tc.name testErrorsAggregateErrorProperty0029
     * @tc.desc Verify errors Error element name fieldis Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg.errors[0].name).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0030
     * @tc.name testErrorsAggregateErrorProperty0030
     * @tc.desc Verify 1 element constructor length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0031
     * @tc.name testErrorsAggregateErrorProperty0031
     * @tc.desc Verify 10 element constructor length equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Error[] = [];
      for (let i = 0; i < 10; i++) {
        arr.push(new Error("e" + i));
      }
      const agg = new AggregateError(arr);
      expect(agg.errors.length).assertEqual(10);
      expect((agg.errors[9] as Error).message).assertEqual("e9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0032
     * @tc.name testErrorsAggregateErrorProperty0032
     * @tc.desc Verify errors[0] constructor element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("zero");
      const agg = new AggregateError([e0]);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(e0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0033
     * @tc.name testErrorsAggregateErrorProperty0033
     * @tc.desc Verify errors[1] constructor element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("zero");
      const e1 = new Error("one");
      const agg = new AggregateError([e0, e1]);
      expect(agg.errors[1]).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0034
     * @tc.name testErrorsAggregateErrorProperty0034
     * @tc.desc Verify errors[length-1] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const last = new Error("last");
      const agg = new AggregateError([new Error("a"), new Error("b"), last]);
      expect(agg.errors[agg.errors.length - 1]).assertEqual(last);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0035
     * @tc.name testErrorsAggregateErrorProperty0035
     * @tc.desc Verify errors[i].message element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      expect(agg.errors[1].message).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0036
     * @tc.name testErrorsAggregateErrorProperty0036
     * @tc.desc Verify errors element message is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("")]);
      expect(agg.errors[0].message).assertEqual("");
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0037
     * @tc.name testErrorsAggregateErrorProperty0037
     * @tc.desc Verify errors element message is isolated surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("\udc04")]);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("\udc04");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0038
     * @tc.name testErrorsAggregateErrorProperty0038
     * @tc.desc Verify for-of iteration errors iteration count length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b"), new Error("c")]);
      let cnt = 0;
      let lastMessage = "";
      for (const item of agg.errors) {
        cnt++;
        lastMessage = item.message;
      }
      expect(cnt).assertEqual(3);
      expect(lastMessage).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0039
     * @tc.name testErrorsAggregateErrorProperty0039
     * @tc.desc Verify for-of iteration errors countis 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[]);
      let cnt = 0;
      for (const item of agg.errors) {
        cnt++;
        expect(item.name).assertEqual('Error');
      }
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0040
     * @tc.name testErrorsAggregateErrorProperty0040
     * @tc.desc Verify for-of iteration errors element instanceof Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      let cnt = 0;
      let messages = "";
      for (const item of agg.errors) {
        expect(item instanceof Error).assertTrue();
        messages = messages + item.message;
        cnt++;
      }
      expect(cnt).assertEqual(2);
      expect(messages).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0041
     * @tc.name testErrorsAggregateErrorProperty0041
     * @tc.desc Verify for iteration count length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      let cnt = 0;
      for (let i = 0; i < agg.errors.length; i++) {
        cnt++;
      }
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0042
     * @tc.name testErrorsAggregateErrorProperty0042
     * @tc.desc Verify iteration message element is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      const msgs: string[] = [];
      for (const e of agg.errors) {
        msgs.push((e as Error).message);
      }
      expect(msgs[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0043
     * @tc.name testErrorsAggregateErrorProperty0043
     * @tc.desc Verify constructor array push instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Error[] = [new Error("a")];
      const agg = new AggregateError(src);
      src.push(new Error("extra"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0044
     * @tc.name testErrorsAggregateErrorProperty0044
     * @tc.desc Verify constructor array instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Error[] = [new Error("a"), new Error("b")];
      const agg = new AggregateError(src);
      src.length = 0;
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0045
     * @tc.name testErrorsAggregateErrorProperty0045
     * @tc.desc Verify constructor array instance.errors[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("orig");
      const src: Error[] = [e0];
      const agg = new AggregateError(src);
      src[0] = new Error("replaced");
      expect(agg.errors[0]).assertEqual(e0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0046
     * @tc.name testErrorsAggregateErrorProperty0046
     * @tc.desc Verify constructor source Set element instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<Error>();
      src.add(new Error("a"));
      const agg = new AggregateError(src);
      src.add(new Error("extra"));
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0047
     * @tc.name testErrorsAggregateErrorProperty0047
     * @tc.desc Verify constructor source Set instance.errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<Error>();
      src.add(new Error("a"));
      src.add(new Error("b"));
      const agg = new AggregateError(src);
      src.clear();
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0048
     * @tc.name testErrorsAggregateErrorProperty0048
     * @tc.desc Verify constructor array instance errors independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Error[] = [new Error("a")];
      const agg1 = new AggregateError(src);
      src.push(new Error("b"));
      const agg2 = new AggregateError(src);
      expect(agg1.errors.length).assertEqual(1);
      expect(agg2.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0049
     * @tc.name testErrorsAggregateErrorProperty0049
     * @tc.desc Verify constructor array agg2 constructor length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Error[] = [new Error("a")];
      new AggregateError(src);
      src.push(new Error("b"));
      const agg2 = new AggregateError(src);
      expect(agg2.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0050
     * @tc.name testErrorsAggregateErrorProperty0050
     * @tc.desc Verify mutation array element property remains visible through instance errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("orig");
      const agg = new AggregateError([e0]);
      e0.message = "mutated";
      expect(agg.errors[0].message).assertEqual("mutated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0051
     * @tc.name testErrorsAggregateErrorProperty0051
     * @tc.desc Verify instance.errors[0] keeps element e0 reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("ref");
      const agg = new AggregateError([e0]);
      expect(agg.errors[0]).assertEqual(e0);
      expect(agg.errors[0].message).assertEqual("ref");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0052
     * @tc.name testErrorsAggregateErrorProperty0052
     * @tc.desc Verify multiple elements errors[i] reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const b = new Error("b");
      const agg = new AggregateError([a, b]);
      expect(agg.errors[1]).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0053
     * @tc.name testErrorsAggregateErrorProperty0053
     * @tc.desc Verify iterable source errors[i] elementreference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const b = new Error("b");
      const s = new Set<Error>();
      s.add(a);
      s.add(b);
      const agg = new AggregateError(s);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0]).assertEqual(a);
      expect(agg.errors[1]).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0054
     * @tc.name testErrorsAggregateErrorProperty0054
     * @tc.desc Verify subtypeelement errors[0] RangeError reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RangeError("r");
      const agg = new AggregateError([r]);
      expect(agg.errors[0]).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0055
     * @tc.name testErrorsAggregateErrorProperty0055
     * @tc.desc Verify 5 element errors[4] accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("0"), new Error("1"), new Error("2"), new Error("3"), new Error("4")]);
      expect(agg.errors[4].message).assertEqual("4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0056
     * @tc.name testErrorsAggregateErrorProperty0056
     * @tc.desc Verify errors field overall reassignment writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("orig")]);
      agg.errors = [new Error("new1"), new Error("new2")];
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("new1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0057
     * @tc.name testErrorsAggregateErrorProperty0057
     * @tc.desc Verify errors reassignment index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("orig")]);
      agg.errors = [new Error("replaced")];
      expect(agg.errors[0].message).assertEqual("replaced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0058
     * @tc.name testErrorsAggregateErrorProperty0058
     * @tc.desc Verify errors reassignment to empty array produces length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")]);
      agg.errors = [];
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0059
     * @tc.name testErrorsAggregateErrorProperty0059
     * @tc.desc Verify errors reassignment for-of iteration iteration element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("orig")]);
      agg.errors = [new Error("n1"), new Error("n2"), new Error("n3")];
      let cnt = 0;
      for (const item of agg.errors) {
        expect(item.name).assertEqual('Error');
        cnt++;
      }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0060
     * @tc.name testErrorsAggregateErrorProperty0060
     * @tc.desc Verify mutation instance.errors[0].message synchronized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("orig");
      const agg = new AggregateError([e0]);
      e0.name = "CustomError";
      e0.message = "mutated";
      expect(agg.errors[0].name).assertEqual("CustomError");
      expect(agg.errors[0].message).assertEqual("mutated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0061
     * @tc.name testErrorsAggregateErrorProperty0061
     * @tc.desc Verify instance.errors[0].message mutation element e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e0 = new Error("orig");
      const agg = new AggregateError([e0]);
      agg.errors[0].message = "viaInstance";
      expect(e0.message).assertEqual("viaInstance");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0062
     * @tc.name testErrorsAggregateErrorProperty0062
     * @tc.desc Verify errors array element length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      agg.errors.push(new Error("b"));
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0063
     * @tc.name testErrorsAggregateErrorProperty0063
     * @tc.desc Verify push index accessvisible element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      agg.errors.push(new Error("b"));
      expect(agg.errors[1].message).assertEqual("b");
    });
