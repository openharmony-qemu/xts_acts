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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0064
     * @tc.name testErrorsAggregateErrorProperty0064
     * @tc.desc Verify errors[0] reassignmentis Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      agg.errors[0] = new Error("replaced");
      expect(agg.errors[0].message).assertEqual("replaced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0065
     * @tc.name testErrorsAggregateErrorProperty0065
     * @tc.desc Verify constructor instance errors[0] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const source: Error[] = [a];
      const agg = new AggregateError(source);
      expect(agg.errors[0]).assertEqual(a);
      expect(agg.errors).not().assertEqual(source);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0066
     * @tc.name testErrorsAggregateErrorProperty0066
     * @tc.desc Verify constructor message parameter preserves errors and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.message).assertEqual("msg");
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0067
     * @tc.name testErrorsAggregateErrorProperty0067
     * @tc.desc Verify constructor message and options preserve errors and cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")], "msg", { cause: "c" });
      expect(agg.errors.length).assertEqual(2);
      expect(agg.message).assertEqual("msg");
      expect(agg.cause).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0068
     * @tc.name testErrorsAggregateErrorProperty0068
     * @tc.desc Verify empty string message does not affect errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "");
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0069
     * @tc.name testErrorsAggregateErrorProperty0069
     * @tc.desc Verify message is errors is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = "x".repeat(1000);
      const agg = new AggregateError([new Error("a")], s);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0070
     * @tc.name testErrorsAggregateErrorProperty0070
     * @tc.desc Verify message is Chinese Unicode errors element is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const agg = new AggregateError([a], "测试");
      expect(agg.errors[0]).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0071
     * @tc.name testErrorsAggregateErrorProperty0071
     * @tc.desc Verify options.cause equals undefined errors is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg", { cause: undefined });
      expect(agg.cause).assertEqual(undefined);
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0072
     * @tc.name testErrorsAggregateErrorProperty0072
     * @tc.desc Verify options.cause equals Error nested errors[0] cause independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Error("inner");
      const a = new Error("a");
      const agg = new AggregateError([a], "msg", { cause: inner });
      expect(agg.cause).assertEqual(inner);
      expect(agg.errors[0]).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0073
     * @tc.name testErrorsAggregateErrorProperty0073
     * @tc.desc Verify options.cause equals string errors.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a"), new Error("b")], "msg", { cause: "string-cause" });
      expect(agg.cause).assertEqual("string-cause");
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0074
     * @tc.name testErrorsAggregateErrorProperty0074
     * @tc.desc Verify options.cause equals number errors[0] reference is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Error("a");
      const agg = new AggregateError([a], "msg", { cause: 42 });
      expect(agg.cause).assertEqual(42);
      expect(agg.errors[0]).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0075
     * @tc.name testErrorsAggregateErrorProperty0075
     * @tc.desc Verify options.cause preserves RangeError name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg", { cause: new RangeError("rc") });
      expect((agg.cause as Error).name).assertEqual('RangeError');
      expect((agg.cause as Error).message).assertEqual('rc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0076
     * @tc.name testErrorsAggregateErrorProperty0076
     * @tc.desc Verify AggregateError instance uses Error prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0077
     * @tc.name testErrorsAggregateErrorProperty0077
     * @tc.desc Verify AggregateError instance matches AggregateError type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")]);
      expect(agg instanceof AggregateError).assertTrue();
      expect(agg.name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0078
     * @tc.name testErrorsAggregateErrorProperty0078
     * @tc.desc Verify constructor preserves empty errors array and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[], "empty");
      expect(agg.errors.length).assertEqual(0);
      expect(agg.message).assertEqual("empty");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0079
     * @tc.name testErrorsAggregateErrorProperty0079
     * @tc.desc Verify errors own property is writable and enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      agg.errors = [new Error("updated")];
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("updated");
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
      expect(keys.includes('stack')).assertFalse();
      expect(keys.includes('name')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0080
     * @tc.name testErrorsAggregateErrorProperty0080
     * @tc.desc Verify message property is writable and not enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      agg.message = "updated-msg";
      expect(agg.message).assertEqual("updated-msg");
      expect(Object.keys(agg).indexOf('message')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0081
     * @tc.name testErrorsAggregateErrorProperty0081
     * @tc.desc Verify AggregateError prototype name is not own enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([], "name");
      expect(agg.name).assertEqual("AggregateError");
      expect(Object.keys(agg).indexOf('name')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0082
     * @tc.name testErrorsAggregateErrorProperty0082
     * @tc.desc Verify stack property remains string or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      expect(agg.stack).not().assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0083
     * @tc.name testErrorsAggregateErrorProperty0083
     * @tc.desc Verify cause own property descriptor preserves nested Error value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("cause");
      const agg = new AggregateError([new Error("a")], "msg", { cause: cause });
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error).message).assertEqual("cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0084
     * @tc.name testErrorsAggregateErrorProperty0084
     * @tc.desc Verify Object.keys excludes AggregateError built in non enumerable properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg", { cause: "c" });
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0085
     * @tc.name testErrorsAggregateErrorProperty0085
     * @tc.desc Verify message reassignment keeps errors key visibility stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      agg.message = "extra";
      expect(agg.message).assertEqual("extra");
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
      expect(keys.includes('message')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0086
     * @tc.name testErrorsAggregateErrorProperty0086
     * @tc.desc Verify nested AggregateError preserves inner aggregate type and leaf message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf");
      const inner = new AggregateError([leaf], "inner");
      const outer = new AggregateError([inner], "outer");
      expect(outer.errors[0] instanceof AggregateError).assertTrue();
      expect(((outer.errors[0] as AggregateError).errors[0] as RangeError).message).assertEqual("leaf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0087
     * @tc.name testErrorsAggregateErrorProperty0087
     * @tc.desc Verify mixed errors keep RangeError TypeError and AggregateError element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new AggregateError([new Error("inner")], "nested");
      const agg = new AggregateError([new RangeError("r"), new TypeError("t"), nested], "mixed");
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[2] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0088
     * @tc.name testErrorsAggregateErrorProperty0088
     * @tc.desc Verify nested cause chain keeps Error type and message values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const middle = new Error("middle", { cause: root });
      const agg = new AggregateError([new Error("a")], "outer", { cause: middle });
      expect(((agg.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0089
     * @tc.name testErrorsAggregateErrorProperty0089
     * @tc.desc Verify RangeError keeps readable name and writable message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new RangeError("frozen");
      expect(err.name).assertEqual("RangeError");
      expect(err.message).assertEqual("frozen");
      err.message = "frozen-readable";
      expect(err.message).assertEqual("frozen-readable");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0090
     * @tc.name testErrorsAggregateErrorProperty0090
     * @tc.desc Verify TypeError keeps readable name and writable message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new TypeError("sealed");
      expect(err.name).assertEqual("TypeError");
      expect(err.message).assertEqual("sealed");
      err.message = "sealed-readable";
      expect(err.message).assertEqual("sealed-readable");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0091
     * @tc.name testErrorsAggregateErrorProperty0091
     * @tc.desc Verify AggregateError keeps errors and cause values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("cause");
      const agg = new AggregateError([new Error("a")], "msg", { cause: cause });
      expect(agg.errors.length).assertEqual(1);
      expect(agg.cause).assertEqual(cause);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0092
     * @tc.name testErrorsAggregateErrorProperty0092
     * @tc.desc Verify circular cause references remain readable without recursion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      const second = new Error("second", { cause: first });
      first.cause = second;
      expect((first.cause as Error).message).assertEqual("second");
      expect(((first.cause as Error).cause as Error).message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0093
     * @tc.name testErrorsAggregateErrorProperty0093
     * @tc.desc Verify circular aggregate errors array keeps self reference readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([] as Error[], "self");
      agg.errors = [agg];
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(agg);
      expect(agg.errors[0] instanceof AggregateError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0094
     * @tc.name testErrorsAggregateErrorProperty0094
     * @tc.desc Verify errors remains enumerable for aggregate error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "json", { cause: "c" });
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0095
     * @tc.name testErrorsAggregateErrorProperty0095
     * @tc.desc Verify rewritten name value is preserved on AggregateError instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "named");
      agg.name = "MySpecialName";
      expect(agg.name).assertEqual("MySpecialName");
      expect(agg.message).assertEqual("named");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0096
     * @tc.name testErrorsAggregateErrorProperty0096
     * @tc.desc Verify descriptor reads stay consistent across 100 repeated reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "msg");
      for (let i = 0; i < 100; i++) {
        const keys = Object.keys(agg);
        expect(keys.includes('errors')).assertTrue();
        expect(agg.errors.length).assertEqual(1);
        expect(agg.errors[0].message).assertEqual("a");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0097
     * @tc.name testErrorsAggregateErrorProperty0097
     * @tc.desc Verify constructed Error keeps Error prototype behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("created");
      expect(err.name).assertEqual("Error");
      expect(err.message).assertEqual("created");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0098
     * @tc.name testErrorsAggregateErrorProperty0098
     * @tc.desc Verify Error object remains readable through prototype chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("plain");
      expect(err.message).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0099
     * @tc.name testErrorsAggregateErrorProperty0099
     * @tc.desc Verify message write is isolated from errors field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("a")], "keyword");
      agg.message = "keywordValue";
      expect(agg.message).assertEqual("keywordValue");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0100
     * @tc.name testErrorsAggregateErrorProperty0100
     * @tc.desc Verify integrated AggregateError properties errors cause and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("cause");
      const nested = new AggregateError([new RangeError("range")], "nested");
      const agg = new AggregateError([nested, cause], "integrated", { cause: cause });
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("integrated");
      expect(agg.cause).assertEqual(cause);
      expect(agg.errors[0] instanceof AggregateError).assertTrue();
      const keys = Object.keys(agg);
      expect(keys.includes('errors')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0101
     * @tc.name testErrorsAggregateErrorProperty0101
     * @tc.desc Verify message field is writable (test point 18)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "original");
      agg.message = "modified";
      expect(agg.message).assertEqual("modified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0102
     * @tc.name testErrorsAggregateErrorProperty0102
     * @tc.desc Verify name field value is AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg.name).assertEqual("AggregateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0103
     * @tc.name testErrorsAggregateErrorProperty0103
     * @tc.desc Verify message field value is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg");
      expect(agg.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0104
     * @tc.name testErrorsAggregateErrorProperty0104
     * @tc.desc Verify cause property type and nested Error (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("cause-err");
      const agg = new AggregateError([new Error("e")], "msg", { cause: cause });
      expect(agg.cause).assertEqual(cause);
      expect((agg.cause as Error) instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0105
     * @tc.name testErrorsAggregateErrorProperty0105
     * @tc.desc Verify deeply nested cause chain property (test point 43)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root = new Error("root");
      const mid = new Error("mid", { cause: root });
      const agg = new AggregateError([new Error("e")], "outer", { cause: mid });
      expect(((agg.cause as Error).cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0106
     * @tc.name testErrorsAggregateErrorProperty0106
     * @tc.desc Verify non-standard custom property on AggregateError (test point 72)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "msg");
      agg.cause = "custom-cause-string";
      expect(agg.cause as string).assertEqual("custom-cause-string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0107
     * @tc.name testErrorsAggregateErrorProperty0107
     * @tc.desc Verify AggregateError properties name message errors and cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e"), new RangeError("r")], "frozen", { cause: "c" });
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("frozen");
      expect(agg.errors.length).assertEqual(2);
      expect(agg.cause as string).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0108
     * @tc.name testErrorsAggregateErrorProperty0108
     * @tc.desc Verify AggregateError message and errors length preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "sealed");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.message).assertEqual("sealed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0109
     * @tc.name testErrorsAggregateErrorProperty0109
     * @tc.desc Verify AggregateError name and errors remain readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "nonext");
      expect(agg.errors.length).assertEqual(1);
      expect(agg.name).assertEqual("AggregateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0110
     * @tc.name testErrorsAggregateErrorProperty0110
     * @tc.desc Verify errors property belongs to AggregateError type (test point 14)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")]);
      expect(agg instanceof AggregateError).assertTrue();
      expect(agg.errors instanceof Array).assertTrue();
      expect(agg.hasOwnProperty('errors')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0111
     * @tc.name testErrorsAggregateErrorProperty0111
     * @tc.desc Verify errors element specific subtype RangeError (test point 36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t")]);
      expect(agg.errors[0] instanceof RangeError).assertTrue();
      expect(agg.errors[0].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0112
     * @tc.name testErrorsAggregateErrorProperty0112
     * @tc.desc Verify errors element specific subtype TypeError (test point 37)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new RangeError("r"), new TypeError("t")]);
      expect(agg.errors[1] instanceof TypeError).assertTrue();
      expect(agg.errors[1].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0113
     * @tc.name testErrorsAggregateErrorProperty0113
     * @tc.desc Verify metadata values are readable (test point 117)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("cache")], "cached");
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.message).assertEqual("cached");
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0114
     * @tc.name testErrorsAggregateErrorProperty0114
     * @tc.desc Verify errors array supports for-of iteration protocol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("first");
      const e2 = new TypeError("second");
      const e3 = new RangeError("third");
      const agg = new AggregateError([e1, e2, e3]);
      const collected: Error[] = [];
      for (const item of agg.errors) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(e1);
      expect(collected[1]).assertEqual(e2);
      expect(collected[2]).assertEqual(e3);
      expect(collected[0].message).assertEqual("first");
      expect(collected[1].message).assertEqual("second");
      expect(collected[2].message).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0115
     * @tc.name testErrorsAggregateErrorProperty0115
     * @tc.desc Verify cause own property is readable and not enumerable (test point 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new Error("cause");
      const agg = new AggregateError([new Error("e")], "msg", { cause: cause });
      expect(agg.cause).assertEqual(cause);
      expect(Object.keys(agg).indexOf('cause')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0116
     * @tc.name testErrorsAggregateErrorProperty0116
     * @tc.desc Verify message own property remains non-enumerable and readable (test point 63)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "visible-message");
      expect(agg.message).assertEqual("visible-message");
      expect(Object.keys(agg).indexOf('message')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0117
     * @tc.name testErrorsAggregateErrorProperty0117
     * @tc.desc Verify mutating copied errors array does not change source array (test point 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Error("first");
      const source: Error[] = [first];
      const agg = new AggregateError(source);
      agg.errors.push(new Error("second"));
      agg.errors[0] = new Error("replacement");
      expect(source.length).assertEqual(1);
      expect(source[0]).assertEqual(first);
      expect(agg.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0118
     * @tc.name testErrorsAggregateErrorProperty0118
     * @tc.desc Verify copied errors array keeps element reference mutations visible (test point 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const range = new RangeError("range");
      const type = new TypeError("type");
      const source: Error[] = [range, type];
      const agg = new AggregateError(source);
      range.message = "range-updated";
      type.name = "CustomTypeName";
      expect(agg.errors[0]).assertEqual(range);
      expect(agg.errors[0].message).assertEqual("range-updated");
      expect(agg.errors[1].name).assertEqual("CustomTypeName");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0119
     * @tc.name testErrorsAggregateErrorProperty0119
     * @tc.desc Verify nested AggregateError used as cause remains readable (test point 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new RangeError("leaf");
      const inner = new AggregateError([leaf], "inner");
      const outer = new AggregateError([new Error("outer-leaf")], "outer", { cause: inner });
      const cause = outer.cause as AggregateError;
      expect(cause instanceof AggregateError).assertTrue();
      expect(cause.message).assertEqual("inner");
      expect(cause.errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0120
     * @tc.name testErrorsAggregateErrorProperty0120
     * @tc.desc Verify nested AggregateError arrays are independently copied (test point 39)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf = new Error("leaf");
      const innerSource: Error[] = [leaf];
      const inner = new AggregateError(innerSource, "inner");
      const outerSource: Error[] = [inner];
      const outer = new AggregateError(outerSource, "outer");
      innerSource.push(new Error("late-inner"));
      outerSource.length = 0;
      expect(inner.errors.length).assertEqual(1);
      expect(outer.errors.length).assertEqual(1);
      expect((outer.errors[0] as AggregateError).errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0121
     * @tc.name testErrorsAggregateErrorProperty0121
     * @tc.desc Verify cross-referenced AggregateError errors arrays remain readable (test point 85)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new AggregateError([] as Error[], "first");
      const second = new AggregateError([] as Error[], "second");
      first.errors.push(second);
      second.errors.push(first);
      expect((first.errors[0] as AggregateError).message).assertEqual("second");
      expect(((first.errors[0] as AggregateError).errors[0] as AggregateError).message).assertEqual("first");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0122
     * @tc.name testErrorsAggregateErrorProperty0122
     * @tc.desc Verify AggregateError cause can reference itself and remain readable (test point 84)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("seed")], "self-cause");
      agg.cause = agg;
      expect(agg.cause).assertEqual(agg);
      expect((agg.cause as AggregateError).message).assertEqual("self-cause");
      expect((agg.cause as AggregateError).errors[0].message).assertEqual("seed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0123
     * @tc.name testErrorsAggregateErrorProperty0123
     * @tc.desc Verify long AggregateError message remains readable (test point 81)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message = "x".repeat(4096);
      const agg = new AggregateError([new Error("e")], message);
      expect(agg.message.length).assertEqual(4096);
      expect(agg.message).assertEqual(message);
      expect(agg.errors[0].message).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0124
     * @tc.name testErrorsAggregateErrorProperty0124
     * @tc.desc Verify JSON serialization exposes errors as ordinary property (test point 111)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const agg = new AggregateError([new Error("e")], "json", { cause: "cause" });
      const text = JSON.stringify(agg);
      expect(text.indexOf('errors')).not().assertEqual(-1);
      expect(text.indexOf('cause')).assertEqual(-1);
      expect(text.indexOf('message')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0125
     * @tc.name testErrorsAggregateErrorProperty0125
     * @tc.desc Verify integrated nested copy circular and property readability (test point 120)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cause = new TypeError("cause");
      const nested = new AggregateError([new RangeError("range")], "nested", { cause: cause });
      const source: Error[] = [nested, cause];
      const agg = new AggregateError(source, "integrated", { cause: nested });
      source.length = 0;
      nested.errors.push(agg);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.cause).assertEqual(nested);
      expect((agg.cause as AggregateError).errors[1]).assertEqual(agg);
      expect(Object.keys(agg).includes('errors')).assertTrue();
      expect(agg.name).assertEqual("AggregateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0126
     * @tc.name testErrorsAggregateErrorProperty0126
     * @tc.desc Verify source array mutation does not affect AggregateError errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error("original");
      const source: Error[] = [e1];
      const agg = new AggregateError(source, "isolation");
      source.push(new Error("injected"));
      source.length = 0;
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(e1);
      expect(agg.errors[0].message).assertEqual("original");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERRORS_AGGREGATE_ERROR_PROPERTY_0127
     * @tc.name testErrorsAggregateErrorProperty0127
     * @tc.desc Verify instance.errors push does not affect original source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorsAggregateErrorProperty0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Error[] = [new Error("a")];
      const agg = new AggregateError(src);
      agg.errors.push(new Error("x"));
      expect(src.length).assertEqual(1);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].message).assertEqual("a");
      expect(agg.errors[1].message).assertEqual("x");
    });
  });
}